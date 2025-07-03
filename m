Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D380FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7GLYccwGeXUIdR4HQe07m86EG4Jk06NLrjR+0DAhbs=; b=flaVZrC/QBUlejfQz4XJEl21Fx
	tlKZ7btHfm/eoUvPFoIrfQtsLTHaf1RW3KsQVDsOO2zCGTrLChXxmAdLj+SQ0TcvsBu2Ag83Caz8i
	cmHeJOsv41e4GLKhVbMpRCGwBkMm8brnQesgRN6kWoKq/LXBajtAn1BnZ9Vd5VVDga57EhM/EAm9u
	Z4nQBKBzs2gCDw5wBf1JvMZSboVHVxFtg2EUvmOunlepsjEBs8A0LqNOLGlwtnIW0iRjmtGYu15X1
	QQoVfMchyKvXLdSHedAEo3l8o5O/pQOkYBZSHzFqjOCPmeMGw9a6zx4cjo4U8XCBkfKH0/ks250M6
	Movv1wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIJk-0000000BC3U-1lyS;
	Thu, 03 Jul 2025 11:41:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHAf-0000000AzTH-1BB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 983D4A534CE;
	Thu,  3 Jul 2025 10:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D42C4CEF1;
	Thu,  3 Jul 2025 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538480;
	bh=a9U6Azq4WkypWVG3l97xIWofH9Tf5doWeAgGMdKJXuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TFkpoiINC7Z5rFT3hlV8oq2Vhsf3HmazFCFhtdH4BoIagxTsqLmxUrw5M3Mn4MEEn
	 9kS+n6pTYH9dJxZA7+NohMiNnhVDt2IOYCkCIltc43n2RyIEBz1nwn5JLu/rjc0PhA
	 DjYMqjKYRTyrXHgsuh0WDFcajeHwYWPEKxam8OHVsLDkYGpOuFxQeLV2VgbO7j9RvL
	 q5/ZgTVYqbZ3p2loFCoWKep+L9qAvOjFbxrKUjqeNWW2uJff6wGPSl7Q52Z2iHYAGn
	 LZ91Ik0HsmBh0OY8+ANQ6fRoo26VA9Oy+epkXAsT1Xfxkzlvz5/5HnQio3dlmYGH3u
	 zpMD6zKUz+SUg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:25:20 +0200
Subject: [PATCH v7 30/31] docs: arm64: gic-v5: Document booting
 requirements for GICv5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-30-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032801_468623_30C20DEC 
X-CRM114-Status: GOOD (  10.58  )
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

Document the requirements for booting a kernel on a system implementing
a GICv5 interrupt controller.

Specifically, other than DT/ACPI providing the required firmware
representation, define what traps must be disabled if the kernel is
booted at EL1 on a system where EL2 is implemented.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 Documentation/arch/arm64/booting.rst | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..4b1d416c6016 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -223,6 +223,47 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SCR_EL3.HCE (bit 8) must be initialised to 0b1.
 
+  For systems with a GICv5 interrupt controller to be used in v5 mode:
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+      - ICH_HFGRTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_PPI_HMRn_EL1 (bit 16) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_IAFFIDR_EL1 (bit 7) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_HPPIR_EL1 (bit 4) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_HAPR_EL1 (bit 3) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_IDRn_EL1 (bit 1) must be initialised to 0b1.
+      - ICH_HFGRTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
+
+      - ICH_HFGWTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
+      - ICH_HFGWTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
+
+      - ICH_HFGITR_EL2.GICRCDNMIA (bit 10) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICRCDIA (bit 9) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDDI (bit 8) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDEOI (bit 7) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDHM (bit 6) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDRCFG (bit 5) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDPEND (bit 4) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDAFF (bit 3) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDPRI (bit 2) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDDIS (bit 1) must be initialised to 0b1.
+      - ICH_HFGITR_EL2.GICCDEN (bit 0) must be initialised to 0b1.
+
+  - The DT or ACPI tables must describe a GICv5 interrupt controller.
+
   For systems with a GICv3 interrupt controller to be used in v3 mode:
   - If EL3 is present:
 

-- 
2.48.0


