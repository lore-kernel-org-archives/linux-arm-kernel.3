Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14946C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsQkonp2raqY6uDTxwapz+/S6zHaTuYuGNzUgQ+U9uA=; b=0eXit5PaE7IeBJkWtwZSqkoQyD
	SwEacEWDjzBZleYbp9jHaB9hwvJhPAyW0tlGQwgjp80msJgacE1EE4Q0N5yovZcX1GmoNAppyNiy1
	V4T8RNS2ZHHx2k1IhsxB03p0uQN/f6D3arYfVkckajssXVQMcHbS87qc32sMRSL6OgtCNu0ETRhHE
	jz381PEZxDWRykaO6iOxWyUovEODVPqkzKk109o6TBlSITKGYvR83KLvUbUAoZKwFo3IV+FEKx8zC
	Ox5I1uRCsNM3fCx5ty7mjRnM0ZkVZFFjfvXOeYdt4ijE942Aj3R5ZJvqImbPi1bEkPdkrqhucKh6G
	CGeFGJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIY-00000003MSI-2eAA;
	Mon, 27 Jul 2026 16:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIV-00000003MQB-1rb2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E54C01688;
	Mon, 27 Jul 2026 09:35:17 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DA6F3F86F;
	Mon, 27 Jul 2026 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170122; bh=mqTyLNRht4psidQfrgpDPtNZ/dgK01wpT0T0WH0AYXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kqnwa8EmIFLEcbSuJ8cgHFeguZx8vg7IClG5FP7P/uVRYJwHJftlDQgTBerDIkn5T
	 h2/Qps9lQEDZ4Wqm3KVHfwMzdYEpo/C+Z+O/bHehZ1WAMRBL15zONFqKWq+hQZ22pi
	 xkEAyICg4j7CqNwnpdYggAfzUPAo/At3YwUvr1I0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 01/45] arm64: ptrace: Remove INIT_PSTATE_EL2
Date: Mon, 27 Jul 2026 17:34:09 +0100
Message-Id: <20260727163453.7969-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093523_524469_E570C113 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Last user of INIT_PSTATE_EL2 has gone with ae4b7e38e9a9 ("arm64: Allow
sticky E2H when entering EL1"), so remove it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 39582511ad72..f7dc5fb9427d 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -18,8 +18,6 @@
 
 #define INIT_PSTATE_EL1 \
 	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
-#define INIT_PSTATE_EL2 \
-	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL2h)
 
 #include <linux/irqchip/arm-gic-v3-prio.h>
 
-- 
2.34.1


