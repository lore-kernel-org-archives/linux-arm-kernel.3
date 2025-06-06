Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5400EC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 05:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxWcTo1W0h0Ok1LsQC+B/+1V/Etwb0M4/RsXuCLiW6M=; b=uYSW3iR+EfCnfNoXQG+nhHeSi0
	zn6ZwkNEiWfvg185bZodAvdscDxUhvCyofECDcD8rvEzwiHwf+dU8okiZXKcO3J8lPdgk3c4Ply2y
	L8+Qp1gZ0rHKVum1uvYr+xkcw60DdrZQPucukxt2FCUDNFNt3U9PZJF9ychzdAu3RVqYo7vihG+1d
	HOx12sQOlLy1HoPIfvTEA4S1a+y73W0HEASGF9HxW+HdhoSM6opSO0SqwdwEB3TsKNqWLVPyiy0n+
	WIiL3/PxwX6UIPmxRHfza1JW4KBa9cLa8HUfVbOTT4HgpYRZPxiRPsSNPNzhaUBNW8Xb+Irz/Kri/
	b6RrWUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNPd4-0000000H7wS-1rW8;
	Fri, 06 Jun 2025 05:28:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNPam-0000000H7qc-34wk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 05:26:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D2E1595;
	Thu,  5 Jun 2025 22:25:53 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 636D63F59E;
	Thu,  5 Jun 2025 22:26:09 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [boot-wrapper PATCH V2] aarch64: Enable access into FEAT_SPE_FDS register from EL2 and below
Date: Fri,  6 Jun 2025 10:56:02 +0530
Message-Id: <20250606052602.3387225-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_222612_821457_C8DF42B3 
X-CRM114-Status: UNSURE (   9.13  )
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

FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
register from EL2 and below exception levels, will trap into EL3 unless
MDCR_EL3.EnPMS3 is set.

Enable access to FEAT_SPE_FDS registers when they are implemented.

Cc: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Check for FEAT_SPE implementation before accessing PMSIDR_EL1 register

Changes in V1:

https://lore.kernel.org/all/20250604114604.629782-1-anshuman.khandual@arm.com/

 arch/aarch64/include/asm/cpu.h | 4 ++++
 arch/aarch64/init.c            | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 2b3a659..ac50474 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -55,6 +55,7 @@
 #define MDCR_EL3_NSTB_NS_NOTRAP			(UL(3) << 24)
 #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT	(UL(3) << 32)
 #define MDCR_EL3_ENPMSN				BIT(36)
+#define MDCR_EL3_ENPMS3				BIT(42)
 #define MDCR_EL3_EBWE				BIT(43)
 #define MDCR_EL3_EnPM2				BIT(7)
 
@@ -185,6 +186,9 @@
 
 #define SCTLR_EL1_CP15BEN	(1 << 5)
 
+#define PMSIDR_EL1		s3_0_c9_c9_7
+#define PMSIDR_EL1_FDS		BIT(7)
+
 #ifdef KERNEL_32
 /*
  * When booting a 32-bit kernel, EL1 uses AArch32 and registers which are
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index e1640a9..df43d2d 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -146,6 +146,15 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
 		mdcr |= MDCR_EL3_ENPMSN;
 
+	/*
+	 * PMSIDR_EL1 register is present, only when FEAT_SPE
+	 * feature is implemeneted. Otherwise direct accesses
+	 * to PMSIDR_EL1 are UNDEFINED.
+	 */
+	if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1) &&
+	    (mrs_field(PMSIDR_EL1, FDS)))
+		mdcr |= MDCR_EL3_ENPMS3;
+
 	if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
 		mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
 
-- 
2.25.1


