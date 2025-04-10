Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B068EC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OddvjFyhxOPDYeAktBI2qCK+rXK3SaQu3VEBcWg+tPc=; b=1lFbtSk5AXHf0nfvSpBjAxRT4M
	dh2MKdEIMJzpdcy4yhGX6i4/hhVFHzS7H9XabPjAvYhmyB5uS0QWu2aTOu9hZ3+fkgKaOx37KTUtX
	KsB8Vyyl+oeK5WCNJAFeBz38D1sc4WHozAK3Kog+DDAHAsG6AuASWu7C4xTp4ffpt5rRGjHLFfvKb
	+D6Iq052xMSpjQZ0WuBIHRUseHO4RKdqbCir0kwtiDBxoipDlJFZLGnCIIKyb7SCdEd6FJqBDxg36
	dMlVOzuQ/4jyeJ5haLTvj2TGyC979NxEJuRKsyP1Lnix6XhI9JlTCjrOGmulATnVuQuusnxv00odo
	D+txeykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pv8-0000000AEoF-3PVq;
	Thu, 10 Apr 2025 11:18:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2odU-0000000A0Yl-1bdT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 09:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OddvjFyhxOPDYeAktBI2qCK+rXK3SaQu3VEBcWg+tPc=; b=JNcmN+hsprowHA0m//tyqd4iDO
	DVbRcZ+d0p2kHh2S6vy2QIX44crYXF0OlWsy+rbj+2FNhJVtzKx4aAutYQxk0CESddevl03NdmC/u
	Kb3Wt4GQjTwYFK4q4lrAhcHwWttgcMRorTnJsToZBxn6ShP5Zpi5g1SeTk1WxX9S9CSWZgLcYhkEx
	wkfBEKzGzsV2KhGDf75LuvXH5DeYiUmEjAd7C4x8ngJwxjJSlSJc1B+iPFmmIEw1egf5xL1XmzCfr
	RWjhhW7cNJIE8h6Nk2jhOGDZEOJ9KQDN7lPHRdHl00hSM0mXEe6+z81TsDY9Q8ilVL4Ndh+iWAuNV
	oundvN7w==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2odQ-00000008n4N-3ovD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:55:51 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A60F8U032471;
	Thu, 10 Apr 2025 10:55:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=O
	ddvjFyhxOPDYeAktBI2qCK+rXK3SaQu3VEBcWg+tPc=; b=GP5+1a/w7quvT75Ij
	gfkq1VUQ2NOxq7UF6/RbP0x27T0FqY3P5lUEhl0NYIIfitfTojS0zYZ7hlKnkFqi
	m9DzjRFDPIb8t8A3lg3QvbA0eycQRVQWBL0t9TxiW55Rgy1Zqm2mcWzRnpmAQH2L
	5t1furIW6inTW5S6G2bQfRQTqvI8MnR1Q2//oiXGa5dFPN54CVVJV4laGS8NR51j
	e0/LJmiIBJUmH9bjXHKib8F3HS3f5UoTgUrMinihc62qsDB5xi/I0Zjib0lytbSh
	rC+qAIXxBbGrB67Z+JAnqaXMgRL93dVDXNF4Q/vtD6SdOwX7DzGYiy2D27gEJv7j
	WdvvQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45w86h1d34-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Apr 2025 10:55:27 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:24 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:10 +0100
Subject: [PATCH v6 11/18] drm/imagination: Use a lookup table for fw defs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-11-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3937;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=4jkPAyYdwNoLCo7GjAAli7ATT33RV/WwXY0qHasYKqo=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9o0cd8FyS8sFwQPlQcIrdC4u/HNo5572v+qoi7n1
 P3O5ezy7ChlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJ2H5i+Ke/pSsoNi/nZ/qM
 FzurmVdtnhzIXdYw5SFLtsfFtbtrix4yMszdMv9fzG+vfWtU393Z1865qqkmxkXyj6j6vrylTgs
 2/uMCAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=MLNgmNZl c=1 sm=1 tr=0 ts=67f7958f cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=iYL5nd4a90DRai7o0HQA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: bThOd9AZWJK-0uluZi-NeFm8Sw4f7kFx
X-Proofpoint-ORIG-GUID: bThOd9AZWJK-0uluZi-NeFm8Sw4f7kFx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_105549_236574_0209D054 
X-CRM114-Status: GOOD (  14.34  )
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

With more than two firmware processor types, the if/else chain in
pvr_fw_init() gets a bit ridiculous. Use a static array indexed on
pvr_fw_processor_type (which is now a proper enum instead of #defines)
instead.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-11-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-11-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-11-143b3dbef02f@imgtec.com
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-13-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-13-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.h |  4 ----
 drivers/gpu/drm/imagination/pvr_fw.c     | 21 ++++++++++++++++-----
 drivers/gpu/drm/imagination/pvr_fw.h     |  7 +++++++
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 6c01d96657de6dc3904ef5ca28365f06cfe0f40b..12bf0b9e5bfb48ef9e5ed9faa44e0896b7555f49 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -739,8 +739,4 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 					      __union_size, __member_size);  \
 	})
 
-#define PVR_FW_PROCESSOR_TYPE_META  0
-#define PVR_FW_PROCESSOR_TYPE_MIPS  1
-#define PVR_FW_PROCESSOR_TYPE_RISCV 2
-
 #endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 3441c378d91c61df704bfbfee23488b89b1d4569..962b8cb2119ec5e177fa2a8225e3387d113dcd03 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -938,16 +938,27 @@ pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev)
 int
 pvr_fw_init(struct pvr_device *pvr_dev)
 {
+	static const struct pvr_fw_defs *fw_defs[PVR_FW_PROCESSOR_TYPE_COUNT] = {
+		[PVR_FW_PROCESSOR_TYPE_META] = &pvr_fw_defs_meta,
+		[PVR_FW_PROCESSOR_TYPE_MIPS] = &pvr_fw_defs_mips,
+		[PVR_FW_PROCESSOR_TYPE_RISCV] = NULL,
+	};
+
 	u32 kccb_size_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
 	u32 kccb_rtn_size = (1 << kccb_size_log2) * sizeof(*pvr_dev->kccb.rtn);
 	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
 	int err;
 
-	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
-		fw_dev->defs = &pvr_fw_defs_meta;
-	else if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_MIPS)
-		fw_dev->defs = &pvr_fw_defs_mips;
-	else
+	if (fw_dev->processor_type >= PVR_FW_PROCESSOR_TYPE_COUNT)
+		return -EINVAL;
+
+	fw_dev->defs = fw_defs[fw_dev->processor_type];
+
+	/*
+	 * Not all firmware processor types are currently supported.
+	 * Once they are, this check can be removed.
+	 */
+	if (!fw_dev->defs)
 		return -EINVAL;
 
 	err = fw_dev->defs->init(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 180d310074e3585c641e540a9e2576b5ab2a5705..88ad713468ce3a1ee459b04dde5363c24791a4f1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -402,6 +402,13 @@ struct pvr_fw_device {
 #define pvr_fw_irq_clear(pvr_dev) \
 	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
 
+enum pvr_fw_processor_type {
+	PVR_FW_PROCESSOR_TYPE_META = 0,
+	PVR_FW_PROCESSOR_TYPE_MIPS,
+	PVR_FW_PROCESSOR_TYPE_RISCV,
+	PVR_FW_PROCESSOR_TYPE_COUNT,
+};
+
 extern const struct pvr_fw_defs pvr_fw_defs_meta;
 extern const struct pvr_fw_defs pvr_fw_defs_mips;
 

-- 
2.49.0


