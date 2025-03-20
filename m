Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182B8C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRYPBZwOxb7NLrAVi2qebzHMrELoukkBJcqf0HL2AdM=; b=0f+hT6r3iy+Nl6R2Mn7IqRhEYl
	3FF9mUImEmHtfvYhrXVktkbkoTAvga7glWxFiFqeIOQWItaDPv9xQRDQXL1tgAOZjCfM8fBNb8EBs
	DnVG99jf+Z/srLTOkpQNv7XET+anXbCTUAX/nLk4LuCOWSH1JmNGAbZ+6i89cNq2sdklH643w6/xJ
	wzQ3GKJKPV+XfzjCFkmyPI0YmEnlSGgQEP/HGl63Me/CaR5cuMjJAzXbr0zeDIL1u+o+AdubI+p0x
	TsqrBU4QDPjKuryFt+fgerJWPfYH99m6riM1ZWYAkMFRuQHaIYdi62M/N5u0FO2qHoxXNHCWQ32vz
	jxaVYr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEIv-0000000ByeB-3VkT;
	Thu, 20 Mar 2025 11:43:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE8v-0000000BxUS-06Rd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 11:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HRYPBZwOxb7NLrAVi2qebzHMrELoukkBJcqf0HL2AdM=; b=Hk16+M7DLZ5ozYgl5UOmGGTYuP
	UBu+i2CtG/yRMx3wGOJhdk+eJN5Odd+jyvdtFz1OaRXYDfhnOg3+CzF4AM9hzWNKCOW+Nmi5oFfT3
	BDUv2+eca3uczvqFlUw27F9yC4vdVmOqXhEzRRr/MXa+iH7fsig7OcDYVqk/9E3rDcRsebRMHeSdI
	AJUG13kZ4HLkWip/6V6gNK5CVNQp3MxRrwhI/+H57l5y1F1CKiBAFmgqdLqv8c5kHtZFnuiFWXXJG
	lZXiyUwdMhlfiwltsrXM3imQRgA+oAsczOjFl0I1siLOJAof5lYy2n6UDeXeuSAfTYcYm8VJZkmNg
	2UAeuYSw==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE8r-000000047jc-1srs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 11:32:55 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5Ntgf021993;
	Thu, 20 Mar 2025 11:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=H
	RYPBZwOxb7NLrAVi2qebzHMrELoukkBJcqf0HL2AdM=; b=DgC4x02z6zQGNlw+Q
	lpdabYizjBedlCjyYoVYzcBqzqZCBsYO0BKIC5ypkCKqlZeejqf/sSu8DFdEZvqX
	5LonFKMHlp/HQ+rz0N/t5zJBSzjcmvT588C8/KEwex0gaQam6YKy14CljiUe/Uga
	2plaKSq4jE2DtNonyBZrG+Xjtv84/tdwAAatuMK/OfkAp36fidGBqhqlUk0aS35c
	PFJw9pySPuVDmKwvYYMtQnq/3/zpuKWJ0BYkWOpr2+J1ruzPdJNIR+TzZKSz+zn0
	Ur92GUVwPOYi8fhrZAxqELYigsZ0LahI8HibaPN77BV9r+rO2TtRHRsYMrPBA8o9
	y4I0Q==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45d2h1kwg5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Mar 2025 11:32:30 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 11:32:29 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 20 Mar 2025 11:32:19 +0000
Subject: [PATCH v4 09/18] drm/imagination: Rename event_mask -> status_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-sets-bxs-4-64-patch-v1-v4-9-d987cf4ca439@imgtec.com>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=u1casUeI9Ls0Pb7TwvXEMa3nKlI9a1VHQ9Flv7MTick=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaTf/nOUcX/QrXe3qxdrO/pceZXtM2nDnY1KHEGVvl7hM
 5Mvtn/b11HKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATeXyJkeFBeLBK0oUzbn8K
 17w5p/dmi6FSxO9O7UMVhqo6VxZUmGxk+F/Gyp2/p8sxaov9F8m7ngYte7Xs7u1ab+BoveVOyfv
 sq/wA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: B-fId4-PgKhpJlqDBbIbz7wYN48LS0U9
X-Proofpoint-ORIG-GUID: B-fId4-PgKhpJlqDBbIbz7wYN48LS0U9
X-Authority-Analysis: v=2.4 cv=V8Z90fni c=1 sm=1 tr=0 ts=67dbfcce cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=eQCmySvtvC0styh21agA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_113253_798590_D9E2C6A3 
X-CRM114-Status: GOOD (  13.60  )
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

Now that enable_reg isn't used, rename the previously shared event_mask to
status_mask since it's only used with status_reg.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-9-143b3dbef02f@imgtec.com
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-11-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-11-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_fw.h      | 6 +++---
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 2 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index 29bae4bc244a243a6a95bcf838d924060cc043e2..eead744835726712622d5aba9b3480fe264a089f 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -199,8 +199,8 @@ struct pvr_fw_defs {
 		 */
 		u32 clear_reg;
 
-		/** @event_mask: Bitmask of events to listen for in the status_reg. */
-		u32 event_mask;
+		/** @status_mask: Bitmask of events to listen for in the status_reg. */
+		u32 status_mask;
 
 		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
 		u32 clear_mask;
@@ -404,7 +404,7 @@ struct pvr_fw_device {
 	pvr_cr_write32((pvr_dev), (pvr_dev)->fw_dev.defs->irq.name ## _reg, value)
 
 #define pvr_fw_irq_pending(pvr_dev) \
-	(pvr_fw_irq_read_reg(pvr_dev, status) & (pvr_dev)->fw_dev.defs->irq.event_mask)
+	(pvr_fw_irq_read_reg(pvr_dev, status) & (pvr_dev)->fw_dev.defs->irq.status_mask)
 
 #define pvr_fw_irq_clear(pvr_dev) \
 	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index a51eec867884b24767f23b3b34cd7029cb660f48..6786e0153970691fa51ba3a0e62c00a46244a3a3 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -550,7 +550,7 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.irq = {
 		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
-		.event_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
+		.status_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
 		.clear_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK,
 	},
 };
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index c810a67eeecf1016064e76baf534e31a44c859b5..f195c602bb112066e88210d0106cb5ffc0a9abc6 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -245,7 +245,7 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.irq = {
 		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
 		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
-		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
+		.status_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,
 		.clear_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR_EVENT_EN,
 	},
 };

-- 
2.49.0


