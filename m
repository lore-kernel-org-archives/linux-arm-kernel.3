Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B5D3B9A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wNR1aNzUX2cb2raVW4t5kjDa+6xOzpijGhXXmTeYh4=; b=0OiBAAsyL6wpMyLmpRgVMQWz5b
	AlpO/1ugK1bSDVG4WIIZMkypWr9DOHOxXavh7Jr16F0cbUyrDCJLx238ia4AaXqE5Yw11ja99zJoK
	F93RYgBwNdwVaDuUaVTzrbngrZbz+IuuLsJn8TujppRT6AymuvcwdP44oX/zQvSDPHACI9axx0af1
	Gnin8AadjnYITLpoGqRxItmDdpaKuGmOK64C1DEY03HMswu3RQIyJnf1nBQuCAabPkCDQpPoIsHeJ
	eJYxc3mBgGuBLNkM0OjXRI5bcKwBDkdITkERninCNAPHb6sLuk4eBkzh5YLRvnWtw+dtqpu7SBzsN
	JSjsGqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxhS-0000000B2UP-45yz;
	Tue, 26 Nov 2024 15:42:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxfb-0000000B26i-0znB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:40:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB88A176A;
	Tue, 26 Nov 2024 07:40:36 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31DAF3F5A1;
	Tue, 26 Nov 2024 07:40:06 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 1/3] aarch64: shuffle ID_AA64PFR{0,1}_EL1 definitions
Date: Tue, 26 Nov 2024 15:39:53 +0000
Message-Id: <20241126153955.477569-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241126153955.477569-1-mark.rutland@arm.com>
References: <20241126153955.477569-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_074007_314848_8F851998 
X-CRM114-Status: UNSURE (   7.93  )
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

Usually the ID register definitions are sorted alphanumerically, but for
historical reasons the ID_AA64PFR0_* definitions are placed before the
ID_AA64PFR1_* definitions. Reorder these for consistency.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 0a6baa8..6fa11da 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -107,15 +107,15 @@
 #define ID_AA64MMFR3_EL1_S2POE		BITS(23, 20)
 #define ID_AA64MMFR3_EL1_D128		BITS(35, 32)
 
+#define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
+#define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
+#define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
+
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
-#define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
-#define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
-#define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
-
 #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
 #define ID_AA64SMFR0_EL1_FA64		BIT(63)
 
-- 
2.30.2


