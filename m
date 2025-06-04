Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA2CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5C2jO5aNlUbUihRbu9d9q0UP8YB4tYvFSP8Fg/p2xA=; b=V3Wz9lDt5srupIRjvTcYIlLFMk
	YXvaQHUqa+v6ti5LQdt+JnXTlYbf4wfC/hk9BdWjuSZTuFVBvu7Z/bq1tAqcZbPUCkLI+lgf9ElKr
	X4mJjkwTL69zW2ju6dsu9RRukJAlSuu1/g/FOh47iJaA0DwotuoMEoPestfn7aGDv+QWR+TR/G0o6
	GsIaRRH+flMerTyG6EKspoMGSZW0T58pNcJYBNooI34CkHQDmQ8gM6oOrhLxfPBSyVYzlvIWILaSp
	sTWNCgvcD5ZWCLwHETNC2TliFDnXG5ow7ivItR1tpNIrBRggxyucncXqbDRTr+WSsbmOCOSD3Cevg
	kyTh4WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmbr-0000000DF26-2ePM;
	Wed, 04 Jun 2025 11:48:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmZU-0000000DEoB-2EZW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:46:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 898631758;
	Wed,  4 Jun 2025 04:45:56 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.60.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D89FA3F5A1;
	Wed,  4 Jun 2025 04:46:10 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [boot-wrapper] aarch64: Enable access into FEAT_SPE_FDS register from EL2 and below
Date: Wed,  4 Jun 2025 17:16:04 +0530
Message-Id: <20250604114604.629782-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_044616_617075_DBE0599D 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 4 ++++
 arch/aarch64/init.c            | 3 +++
 2 files changed, 7 insertions(+)

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
index e1640a9..b6f740c 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -146,6 +146,9 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
 		mdcr |= MDCR_EL3_ENPMSN;
 
+	if (mrs_field(PMSIDR_EL1, FDS))
+		mdcr |= MDCR_EL3_ENPMS3;
+
 	if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
 		mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
 
-- 
2.25.1


