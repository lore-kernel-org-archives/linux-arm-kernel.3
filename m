Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689E7D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izgbHj3spM499XAksG0CXsequ6orENVMP87TA4js8ks=; b=BNTRLmJisQezhy9yVLhcbL2wip
	0t0f0xE1iBKwQWZraZZyXLoV4gnyj7L67vnUBYdw3t3VAB6p6t0h0zOS94cUWHThpwCLwnKc1jVdk
	e32HBwCNJ8m6umvcjmIxNpv5eJb2h5qxSUrAwKSYcZXGv/hvtTjDoKNHvqC+6my1c8poQIBoydBy8
	Ql9JqJSpeecT/BYcoGneJ0bb6xJnMj5tPvGL3KUZRR/ZslNbNVIoiZ0tyz1aAQJsDiGQeBqRAa7Qb
	C+FpyDnrwUM7IS5b5guUwIFS2UWzI0G4o/XlpPJWveOOVDSDvSdQFuknZtogBP7iK7LsrOCxT6z7l
	2yFztTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2O-00000008Co0-0TSh;
	Thu, 18 Dec 2025 10:15:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB2M-00000008CnF-0mxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CADA60010;
	Thu, 18 Dec 2025 10:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0317C113D0;
	Thu, 18 Dec 2025 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052909;
	bh=vnKEmMAe21QcHMZuNYI4JA27L1lMdTDSUIpCnogDK/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k5x6jANk0HZCdFNmQ8ONf84TXV/hnSyODKlwPkYcldqK35T835k0zhX+1J4vW7h3x
	 YuB87dKAHfjZqQktHnSNr4I87e8QoyWT5BOJ269qYwQLCmSCWMU2w1Q6fhpovy0gLP
	 4eWRN+g777w/a0xuPlSuAun1xmByvIKvT/LLFIqgow5KUjz5yV1YRNf2DWvopeDGr0
	 P1epYRKg9q7Q1XG+lQpKfb0Yxo5vd3IJuudlbkUYwRI5n+asIIoPcWcBhAUkOjCAVe
	 9mfSNHPmKQKiuQvf7L3sP4dyf0ZEBcc/0nxFTgJ3I5yVKNinhOY83mAZay6hnUkWZq
	 y4rqden517tFg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 18 Dec 2025 11:14:27 +0100
Subject: [PATCH v2 1/7] ACPICA: Add GICv5 MADT structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-gicv5-host-acpi-v2-1-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
In-Reply-To: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jose Marinho <jose.marinho@arm.com>
X-Mailer: b4 0.14.3
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

From: Jose Marinho <jose.marinho@arm.com>

The GICv5 adds the following MADT structures:
- IRS
- ITS Config Frame
- ITS Translate Frame

The ACPI spec ECR is at https://github.com/tianocore/edk2/issues/11148

Link: https://github.com/acpica/acpica/commit/69cca52d
Signed-off-by: Jose Marinho <jose.marinho@arm.com>
Signed-off-by: Bob Moore <robert.moore@intel.com>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 include/acpi/actbl2.h | 49 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index f726bce3eb84..fdabc6c64a9c 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1167,7 +1167,10 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_IMSIC = 25,
 	ACPI_MADT_TYPE_APLIC = 26,
 	ACPI_MADT_TYPE_PLIC = 27,
-	ACPI_MADT_TYPE_RESERVED = 28,	/* 28 to 0x7F are reserved */
+	ACPI_MADT_TYPE_GICV5_IRS = 28,
+	ACPI_MADT_TYPE_GICV5_ITS = 29,
+	ACPI_MADT_TYPE_GICV5_ITS_TRANSLATE = 30,
+	ACPI_MADT_TYPE_RESERVED = 31,	/* 31 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1289,7 +1292,7 @@ struct acpi_madt_local_x2apic_nmi {
 	u8 reserved[3];		/* reserved - must be zero */
 };
 
-/* 11: Generic interrupt - GICC (ACPI 5.0 + ACPI 6.0 + ACPI 6.3 + ACPI 6.5 changes) */
+/* 11: Generic interrupt - GICC (ACPI 5.0 + ACPI 6.0 + ACPI 6.3 + ACPI 6.5 + ACPI 6.7 changes) */
 
 struct acpi_madt_generic_interrupt {
 	struct acpi_subtable_header header;
@@ -1310,6 +1313,8 @@ struct acpi_madt_generic_interrupt {
 	u8 reserved2[1];
 	u16 spe_interrupt;	/* ACPI 6.3 */
 	u16 trbe_interrupt;	/* ACPI 6.5 */
+	u16 iaffid;		/* ACPI 6.7 */
+	u32 irs_id;
 };
 
 /* Masks for Flags field above */
@@ -1332,7 +1337,7 @@ struct acpi_madt_generic_distributor {
 	u8 reserved2[3];	/* reserved - must be zero */
 };
 
-/* Values for Version field above */
+/* Values for Version field above and Version field in acpi_madt_gicv5_irs */
 
 enum acpi_madt_gic_version {
 	ACPI_MADT_GIC_VERSION_NONE = 0,
@@ -1340,7 +1345,8 @@ enum acpi_madt_gic_version {
 	ACPI_MADT_GIC_VERSION_V2 = 2,
 	ACPI_MADT_GIC_VERSION_V3 = 3,
 	ACPI_MADT_GIC_VERSION_V4 = 4,
-	ACPI_MADT_GIC_VERSION_RESERVED = 5	/* 5 and greater are reserved */
+	ACPI_MADT_GIC_VERSION_V5 = 5,
+	ACPI_MADT_GIC_VERSION_RESERVED = 6	/* 6 and greater are reserved */
 };
 
 /* 13: Generic MSI Frame (ACPI 5.1) */
@@ -1611,6 +1617,41 @@ struct acpi_madt_plic {
 	u32 gsi_base;
 };
 
+/* 28: Arm GICv5 IRS (ACPI 6.7) */
+struct acpi_madt_gicv5_irs {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 irs_id;
+	u32 flags;
+	u32 reserved2;
+	u64 config_base_address;
+	u64 setlpi_base_address;
+};
+
+#define ACPI_MADT_IRS_NON_COHERENT      (1)
+
+/* 29: Arm GICv5 ITS Config Frame (ACPI 6.7) */
+struct acpi_madt_gicv5_translator {
+	struct acpi_subtable_header header;
+	u8 flags;
+	u8 reserved;		/* reserved - must be zero */
+	u32 translator_id;
+	u64 base_address;
+};
+
+#define ACPI_MADT_GICV5_ITS_NON_COHERENT      (1)
+
+/* 30: Arm GICv5 ITS Translate Frame (ACPI 6.7) */
+struct acpi_madt_gicv5_translate_frame {
+	struct acpi_subtable_header header;
+	u16 reserved;		/* reserved - must be zero */
+	u32 linked_translator_id;
+	u32 translate_frame_id;
+	u32 reserved2;
+	u64 base_address;
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {

-- 
2.50.1


