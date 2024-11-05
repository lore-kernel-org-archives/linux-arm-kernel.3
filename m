Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDC4D31761
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUE/4HHLcpKV0nb6mnPxxUpK9cDJ7Fjqdz6CWyFoWeA=; b=tI1t5Bqt/wVMrGl/m9OI1V5moj
	pumYcrUrBIOWM3XfbFGZ3bJNDK2dvdTbEUle/chomA0luXjyqzngaiunsB0sCjGHoxuNOB91kE8wY
	di1/LSFZgtZKwMQeqjB67q0O8HT3Cm0p70spi+DzTu1dXS3OVOy4ALS2MLQ3lgsnvvtS1qJ2hoKrY
	t3g2IpDZzb5vlxS7gl+2YWv3Sh+pIgT4s3gfV/3uO8LRaLmOv9bp4WTRpcX+sqrgR54FX2E93n++6
	t+Q3mUloCVZDhgrrNR6h3G5SKvpKNUjE8k2j/Ce4Abf1wzSytJc7cbtk42NISNlBhsLch1at5Uwe8
	pRfFNGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MU5-000000003Se-2xxd;
	Tue, 05 Nov 2024 16:32:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxL-0000000HX42-0Zuc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OUE/4HHLcpKV0nb6mnPxxUpK9cDJ7Fjqdz6CWyFoWeA=; b=NKfiqYpse5ZkPU6cLU0dR5S2f/
	o2n2xiEHJV5nlUD6q5DfSfub4x8RzCQjr0rKCLklQGqyh3bud29sYJ/IWgejpYl2vgQd4Aptey+Ud
	taTqR4Bk6JhO294XDUDdE2Fli2bzQyOwPnh07y/bvKgf5l2QCE+t4zJR7ghthRMBqn/xoDT+O3vMM
	jy3UY0WZ0QYFyJ4w9YUj8SgYLm0gyRH9B5I0oXXGYHLOu9Of1On6PJ4jpcLAWeDSYj1oawpM4hSkG
	tXWkee4Gi0kl4nm/7chwY4UCuN/TcybgOk0gDsg7TVxksZo81I3j285JUIkX9Bo/ac4u0+Vs+XlP1
	kWXohkxg==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxG-0000000BmeO-0U1P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:57 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A58CTKZ021812;
	Tue, 5 Nov 2024 15:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=O
	UE/4HHLcpKV0nb6mnPxxUpK9cDJ7Fjqdz6CWyFoWeA=; b=uKTw7rjSlxTtCFRyG
	NGHXSBJMFbsXguuRtqJGZJhIicS8DDGzBwumPO6WWNzn3iGH9H94goqK5kvzmg/O
	QKw1HWBIrsrj+HdgEFT376d1VUk1jJp+0NSP8yHY/EnQXTvu4LZyXmOAJ0mLQQK+
	IpiMliPqKigYBQyA44fIqbn7FAe63+KeOJ6f3i9xE3UqX5zLuTog3rx0POrRJ+B9
	1iG8b+N2EicH2FryKNCz0Otoiq//2241wCRrDNEgnmMk3xIpl+kmKRr6GF1qRtjN
	RRJheUGE/E5Oj5eLD1nw5wm1d1CrWY6cxpFFUdeSsFhSw1DhwKt7iXuSWJI5TTFg
	Weo2A==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212ju0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:34 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:33 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:19 +0000
Subject: [PATCH 13/21] drm/imagination: Use a lookup table for fw defs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-13-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=0ouY7CnsCCyHCfs0cERyo0bPhArCIHn61xKqJKfxl/o=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcwT5L9bLK8i0xt/emHnss0n/bjY17rWrfEx/J+/I
 vSyjVFiRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAExkmjwjw9yvuwReCK7835J+
 WebLvO33vk9waZ6uc7/m0Fq+3/xcB0sZGb4zKE9tipNjn7XQbw+jWNQOo7U/rzPf8/p89p/UlE9
 bJVkB
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40aa cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=iYL5nd4a90DRai7o0HQA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 5QMsIHrlnVMs3GI4jtue8g3n5DfnXJag
X-Proofpoint-ORIG-GUID: 5QMsIHrlnVMs3GI4jtue8g3n5DfnXJag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155854_373065_99E919AD 
X-CRM114-Status: GOOD (  14.79  )
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
---
 drivers/gpu/drm/imagination/pvr_device.h |  4 ----
 drivers/gpu/drm/imagination/pvr_fw.c     | 21 ++++++++++++++++-----
 drivers/gpu/drm/imagination/pvr_fw.h     |  7 +++++++
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 930129334807168cf11ee843f446eb5063464d55..ec5eb78af82a3f3c32d6c89b68b7bc0fcee0b9d2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -738,8 +738,4 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 					      __union_size, __member_size);  \
 	})
 
-#define PVR_FW_PROCESSOR_TYPE_META  0
-#define PVR_FW_PROCESSOR_TYPE_MIPS  1
-#define PVR_FW_PROCESSOR_TYPE_RISCV 2
-
 #endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 808844eb10b5ccb29ed2b8e9bdfe3be829cc57d1..b77c4a42caf2f208f6289160e5cec36c683b1e65 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -926,16 +926,27 @@ pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev)
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
2.47.0


