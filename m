Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A07D3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9V5pLmdM13IHLHW7OGnEjCTF5lVJXXAc6EX0Yk61pk=; b=hCYPYTA+UOHj2zlKxhBr0bdmKk
	ImpS6SvwRzViTpnESg9AbN+rnEp+e5mVew4HEP28sBQ5Q/SFdoccYQo2eEFXoGdSuf/OMeK615pry
	Tn9TI5GZXqHUeKjiq+gd3YcqgI5UfpLCcnwVgFHvZYfASBYT1CUks7XWPVcdDI2pxetCD9N4h7G/d
	poLqNJX6HSoKEjpIXrgJ+znhvntq6IphcIdClk9tvJ68/VnvEUukXs25IxwiTU4h+efrXm8lWFbs9
	QVM1aXlqtKtrp+xOO98s9OvvTRpVeXiB/yTSWKONe76MQ1aIupjVTaagPxWZcI5Sv2ppV3eDGuYv4
	AHUsawJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxiO-0000000B2cf-2ML9;
	Tue, 26 Nov 2024 15:43:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxfe-0000000B285-27FH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:40:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFFF153B;
	Tue, 26 Nov 2024 07:40:38 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AFA53F5A1;
	Tue, 26 Nov 2024 07:40:07 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 2/3] aarch64: Enable use of FPMR for EL2 and below
Date: Tue, 26 Nov 2024 15:39:54 +0000
Message-Id: <20241126153955.477569-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241126153955.477569-1-mark.rutland@arm.com>
References: <20241126153955.477569-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_074010_582751_5296503E 
X-CRM114-Status: GOOD (  12.92  )
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

FEAT_FPMR adds the FPMR register. Acceses to FPMR (whether direct or
indirect) trap to EL3 unless SCR_EL3.EnFPM is set, and so boot-wrapper
support is necessary.

Support for FEAT_FPMR was added to Linux in v6.8 without any
boot-wrapper support. Consequently when FPMR is enabled in a model, the
kernel will hang when attempting to write to the FPMR (e.g. when
entering userspace for the first time).

Add boot-wrapper support for FEAT_FPMR. As FPMR is not described in the
latest ARM ARM (ARM DDI 0487K.a), the relevant definitions are taken
from the 2024-09 release of the "Arm Architecture Registers" document,
ARM DDI 0601 (ID092424), which can be found at:

  https://developer.arm.com/documentation/ddi0601/2024-09/?lang=en

The ID_AA64PFR2_EL1 ID register has existed as reserved RES0 space since
ARMv8.0 but only recently gained a name, and so older assemblers may not
be able to encode ID_AA64PFR2_EL1 directly. Thus we need an explicit
definition of the sysreg encoding to support these assemblers.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/aarch64/include/asm/cpu.h | 4 ++++
 arch/aarch64/init.c            | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 6fa11da..3ef58f3 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -68,6 +68,7 @@
 #define SCR_EL3_SCTLR2En		BIT(44)
 #define SCR_EL3_PIEN			BIT(45)
 #define SCR_EL3_D128En			BIT(47)
+#define SCR_EL3_EnFPM			BIT(50)
 
 #define VTCR_EL2_MSA			BIT(31)
 
@@ -116,6 +117,9 @@
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
+#define ID_AA64PFR2_EL1			s3_0_c0_c4_2
+#define ID_AA64PFR2_EL1_FPMR		BITS(35, 32)
+
 #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
 #define ID_AA64SMFR0_EL1_FA64		BIT(63)
 
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index da036bb..1f38516 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -124,6 +124,9 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, THE))
 		scr |= SCR_EL3_RCWMASKEn;
 
+	if (mrs_field(ID_AA64PFR2_EL1, FPMR))
+		scr |= SCR_EL3_EnFPM;
+
 	msr(SCR_EL3, scr);
 
 	msr(CPTR_EL3, cptr);
-- 
2.30.2


