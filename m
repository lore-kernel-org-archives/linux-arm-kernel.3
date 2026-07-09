Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D65C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUSe6SQ84JExUi+TkXDgziSUS/Y+pUeaqOZZIbjaC2Y=; b=Boov9pWnK9YL1in1otv5T6S5tz
	5wvMByoqJV66CUMkYo2+nZiCbZrGknIPVVMgDTmC5JYzIcc6iqt3942dK1FU3dD5FV64sQFJkfKyr
	qhT+ZFbPM2VX6vF4MwXwiAPe269AHgrGD5Rz7Oz+0FKEMDq3LRRq8cHCzJ1Zm/LJFChf2DGR+iPXB
	/IRgNJvGKYJ/ysBjNi6cgi3maZ0rHCotFzF/QGfIv8n7VXrtf6KLZZh2d40z2jjMI/ox3P4fXSkSh
	h/QBB6RtU4L4N1ljcvA2hux2yqkV4k4FSp4XjJbOTD7/jIajIcWAyHCnA+URNCgXDn5ue1uKzIIG7
	ThGI/0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf7-00000002Mek-14kd;
	Thu, 09 Jul 2026 12:15:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneL-00000002L6S-1vuy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE3C1476;
	Thu,  9 Jul 2026 05:14:36 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12F2A3F66F;
	Thu,  9 Jul 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599281; bh=pHaaAC6z1avcTI8Heq951BcdkcU+a4Kt1oCDNVsi/RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jg1wDvn3ETw+0FuXWHTwb8A2xQsBwcTgSDBqri/BUFZsj6D6nXjoNIDio+D91SkFk
	 bDPy4p6sMafOpLVYiQEf0XB/Y/gcAzFBMLzUEINur4bZZUgnd20JdCMvrp+sZ1DMG9
	 Ew63MLTpCTZ+uEsty8gW0088Z9Qai0XlLkiEexMM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 32/36] arm64: suspend: Always initialise PSTATE.ALLINT
Date: Thu,  9 Jul 2026 13:13:29 +0100
Message-Id: <20260709121333.23507-33-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051441_537652_B8431DF9 
X-CRM114-Status: GOOD (  11.14  )
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

PSTATE.ALLINT is always set to the inverse of SCTLR_ELx.SPINTMASK,
regardless of the value of SCTLR_ELx.NMI. SCTLR_ELx.NMI is initialised
to 0 by default, so PSTATE.ALLINT does not cause any interrupt
masking. With upcoming FEAT_NMI support, SCTLR_ELx.NMI will be set as
part of the enable sequence.

However, during CPU suspend/resume, we reinitialise PSTATE to
INIT_PSTATE_EL1. INIT_PSTATE_EL1 currently does not set
PSR_ALLINT_BIT, but SCTLR_ELx.NMI is restored from the saved
value. Since all exceptions are masked during CPU suspend/resume,
avoid a state where SCTLR_ELx.NMI is restored to 1 but PSTATE.ALLINT
is clear, since that would permit an NMI during resume.

Include PSR_ALLINT_BIT in INIT_PSTATE_EL1 so PSTATE.ALLINT is always
set.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 096d85d75bd7..ab1cf7669140 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -17,7 +17,7 @@
 #define CurrentEL_EL2		(2 << 2)
 
 #define INIT_PSTATE_EL1 \
-	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
+	(PSR_ALLINT_BIT | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT | PSR_MODE_EL1h)
 
 #include <linux/irqchip/arm-gic-v3-prio.h>
 
-- 
2.34.1


