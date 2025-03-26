Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED160C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0F/cyNSYf1Pg6llLWG6bYdNJiiJ7M3eSi6yebYVQmA=; b=sXxW4UcsP3y8k/jDiVJA8f76ym
	4bcSd+nxdbVQR3v5UzFkJuT1sSqABq9x736Y5/w2xHKhFhSWx02uzK2r4xPdnTGFUuyQQUtJ0UtHk
	6TyOh66NjaiIxRdcuzaDskG7odGs9DHiS7QgSgOXXFEmHFnu0oL7UxYllnOnQtYh/3fyClZZ5sUvx
	6ZXOh5GMN12ax6k/jrn/SLsGjieOPPIHBJqfSQSO3rAMqRzFj/lr3C8zFnmjdhlHROF6vS3/aPhI6
	YtGX8Mi8zV+inlHTUcwEB7e3cugxkQ187IZWQhaCPHXXvxlzp33GhCGxTsulbrLsWYlpYop8BBHJc
	OAnJV9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUB7-000000096ao-25Iz;
	Wed, 26 Mar 2025 17:04:33 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTwB-000000093ZJ-0iPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:49:09 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBt2Sg012691;
	Wed, 26 Mar 2025 16:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=N
	0F/cyNSYf1Pg6llLWG6bYdNJiiJ7M3eSi6yebYVQmA=; b=Ip60rRDpqVikMSiHq
	CUU/I59dJiAj19e4f7nJnRrwhlL708uYrXKyX0SDAKYmDvAAI5Xq0zMBtEZmRkHo
	K6MSENKe0e9OiZzaQMGad6+d0/xeFUMV5fYzhAsoyOB33qaKDjwI3hawfgxLd+pj
	Ej0GzoCsgVp6a/QNWfZ7g2e9rkuElhNwDuXdINcU6VDL2jVjrWRzGHSLJtr+DoxW
	OrnowJlUQmCW9ncNfk+aww/LPNVZJMPLmLoauBO2R7T7MIMJr6l1pV00fahTCQMi
	c/CrAbPlzC0xwXZZav52ZCvwYQXjcmmxaIEiA05Fx12KTmla5cVxfSMMhx1h5Uof
	jDXCw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45kbmy9d6d-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 26 Mar 2025 16:48:57 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.0.133) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 16:48:45 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 26 Mar 2025 16:48:28 +0000
Subject: [PATCH v5 08/18] drm/imagination: Remove firmware enable_reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250326-sets-bxs-4-64-patch-v1-v5-8-e4c46e8280a9@imgtec.com>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4514;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=2iUo8M/iXvyFLBlBs4JhSd23BLyg24FuKs5xB2UP0qo=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaQ/0X9S9E9QXVthieqSg3P3Cico/mXmYjWbI7B+J0uTe
 X7gxn1SHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRXQUM/8OZuy782LR81jW/
 Ox42rNLdn7fKCv8tNbvk5sbz+Mt1pRmMDP2+Dpu2z9M9ubT9Bpv4UdeYUz/n3jnZKrtP757j+3r
 r10wA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: N0pmF34kxQ9gROWf4UYyxZG-kDn_kSzx
X-Authority-Analysis: v=2.4 cv=L+sdQ/T8 c=1 sm=1 tr=0 ts=67e42ff9 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=f_O7cd1dQeFu8-5Qt7YA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: N0pmF34kxQ9gROWf4UYyxZG-kDn_kSzx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_094907_501746_73508706 
X-CRM114-Status: GOOD (  12.61  )
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

After a previous commit ("drm/imagination: Mask GPU IRQs in threaded
handler"), this register is now only used to enable firmware interrupts at
start-of-day. This is, however, unnecessary since they are enabled by
default.

In addition, the soon-to-be-added RISC-V firmware processors do not have
an equivalent register.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-8-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-8-143b3dbef02f@imgtec.com
Changes in v3:
- Reference a different commit removing use of enable/disable ops.
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-10-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-10-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_device.c  |  1 -
 drivers/gpu/drm/imagination/pvr_fw.h      | 11 +----------
 drivers/gpu/drm/imagination/pvr_fw_meta.c |  1 -
 drivers/gpu/drm/imagination/pvr_fw_mips.c |  1 -
 4 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index a47dd1dd82432f1d66ff90aca26b7b264f4068df..1e488a30c7840466574c7fc3648ab93edfb46354 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -311,7 +311,6 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 
 	/* Clear any pending events before requesting the IRQ line. */
 	pvr_fw_irq_clear(pvr_dev);
-	pvr_fw_irq_enable(pvr_dev);
 
 	if (pvr_dev->has_safety_events)
 		pvr_device_safety_irq_clear(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index b7966bd574a924862b7877c175fa2b5d757d89db..29bae4bc244a243a6a95bcf838d924060cc043e2 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -188,9 +188,6 @@ struct pvr_fw_defs {
 	 * processor backend in pvr_fw_funcs::init().
 	 */
 	struct {
-		/** @enable_reg: FW interrupt enable register. */
-		u32 enable_reg;
-
 		/** @status_reg: FW interrupt status register. */
 		u32 status_reg;
 
@@ -202,7 +199,7 @@ struct pvr_fw_defs {
 		 */
 		u32 clear_reg;
 
-		/** @event_mask: Bitmask of events to listen for. */
+		/** @event_mask: Bitmask of events to listen for in the status_reg. */
 		u32 event_mask;
 
 		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
@@ -412,12 +409,6 @@ struct pvr_fw_device {
 #define pvr_fw_irq_clear(pvr_dev) \
 	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
 
-#define pvr_fw_irq_enable(pvr_dev) \
-	pvr_fw_irq_write_reg(pvr_dev, enable, (pvr_dev)->fw_dev.defs->irq.event_mask)
-
-#define pvr_fw_irq_disable(pvr_dev) \
-	pvr_fw_irq_write_reg(pvr_dev, enable, 0)
-
 extern const struct pvr_fw_defs pvr_fw_defs_meta;
 extern const struct pvr_fw_defs pvr_fw_defs_mips;
 
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 6d13864851fc2e83bdaa94f16435b97841e5de94..a51eec867884b24767f23b3b34cd7029cb660f48 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -548,7 +548,6 @@ const struct pvr_fw_defs pvr_fw_defs_meta = {
 	.wrapper_init = pvr_meta_wrapper_init,
 	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_META_SP_MSLVIRQENABLE,
 		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
 		.event_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
diff --git a/drivers/gpu/drm/imagination/pvr_fw_mips.c b/drivers/gpu/drm/imagination/pvr_fw_mips.c
index 0bed0257e2ab75f66d8b8966b2ceac6342396fb5..c810a67eeecf1016064e76baf534e31a44c859b5 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_mips.c
@@ -243,7 +243,6 @@ const struct pvr_fw_defs pvr_fw_defs_mips = {
 	.wrapper_init = pvr_mips_wrapper_init,
 	.has_fixed_data_addr = pvr_mips_has_fixed_data_addr,
 	.irq = {
-		.enable_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_ENABLE,
 		.status_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS,
 		.clear_reg = ROGUE_CR_MIPS_WRAPPER_IRQ_CLEAR,
 		.event_mask = ROGUE_CR_MIPS_WRAPPER_IRQ_STATUS_EVENT_EN,

-- 
2.49.0


