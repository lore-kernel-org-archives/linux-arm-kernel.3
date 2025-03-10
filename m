Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raPRfqGyZV++wq3NiKy2nVLbvA0NuqFXxd/s+kh24Qo=; b=iW5PQMmqHsh1DJaaa6UR8apQSl
	XFbgwZVsP3IqphZXESty/vboNP2VrGeyEFZ/k6/E69BbIE51VYZhVyW24IgCkuLTss/62Y4IPr78L
	4vkMMUHrRCNdJ2toCOoH+8OGZQ2UJ5WT/uviojwrkSt3kAwLkaubNM/Ep4cb+dIC0pLtvPJH6GkmS
	oCdtTsf2CrPIfL0nUKK4Et/y4qQDKpHHnSOux/CMOihQdtZTVErgc3KUfmgSycrcIaffTCBvejV84
	BABdMPBzk3LTR4LyQWYTv/opJyZKgiELrMRqbjlPk1vsNuzjQBvWDcEvB0L3AWoq4zrpy1oxp7cPG
	GCTlwgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treNx-00000002yEg-0AZK;
	Mon, 10 Mar 2025 14:45:41 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcuT-00000002jnz-1QIX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:11:11 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A802bM030724;
	Mon, 10 Mar 2025 13:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=r
	aPRfqGyZV++wq3NiKy2nVLbvA0NuqFXxd/s+kh24Qo=; b=ZcZY3k/+LBR4xrROE
	3Saidcmj8/foaeI49orUyzruhn6GElt6rzLjuvQjgrV1A3bb/LQLlLy8jgsGrdOQ
	1oXXVcL3b3T/W0uOQplckmoH+s4RyDTNkSH8u+b7rJPhWSDtdLD4ZrKmb1+8B96U
	NCpA5mlsUYIZ7x1V40fhYaRX7JfZX/pZt8jkrSXT//7d9ql2k07xgmSJ/fgAkrGR
	dhssJ5iEPB9BFagigGOF0rK7ygTwIwgp+LbE/Pskr/v1hHvBOkOFIlOCGAhaxIgE
	+zt522D+zxERQCBbC8bEmlZQHH36FSEur2+vyT3DT0pXUnYrGpFgR35jk9dvTGtM
	Lw0Iw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 458d1wha4p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Mar 2025 13:10:46 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:46 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:28 +0000
Subject: [PATCH v3 04/18] drm/imagination: Use new generic compatible
 string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-4-143b3dbef02f@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
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
        "Alessio
 Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=ZmuLKqPBfUzKMPTJUTmSc8vjdOxRrosiBwBAQBDU044=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3Ih7CRX+q7Xdhvqdnzk5mKNF/+dsuYQ45NDazd/d
 umr0Lw2s6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAm0qTK8L/2ZkzcvX6XHwLl
 7A9TZn4p+9hz38jmbGJ3m4u5ivux6l5Ghv75D3YIxWZretqWZn/ecF5dbGIe25Eq/rPhOxvn/W7
 fwgcA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: zNM4L3uVa8T8gsO_8bX1VFMofh0AQtSh
X-Proofpoint-GUID: zNM4L3uVa8T8gsO_8bX1VFMofh0AQtSh
X-Authority-Analysis: v=2.4 cv=U8+SDfru c=1 sm=1 tr=0 ts=67cee4d7 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=6TxX0kamTyKH95WNaFsA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_061109_706709_D05293BB 
X-CRM114-Status: GOOD (  13.11  )
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

Follow-on from the companion dt-bindings change ("dt-bindings: gpu: img:
More explicit compatible strings"), deprecating "img,img-axe" in favour of
the more explicit combination of "img,img-rogue" and "img,img-axe-1-16m".

Since all relevant details are interrogated from the device at runtime,
we can match on the generic "img,img-rogue" and avoid adding more entries
with NULL data members (barring hardware quirks).

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Don't use more specific compatible strings when not required
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-5-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-5-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0639502137b4431dc23a349476572cc898d1f8d0..3130193f8fffc185e630a293be53374bdc4b7ce0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1473,6 +1473,13 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,img-rogue", .data = NULL },
+
+	/*
+	 * This legacy compatible string was introduced early on before the more generic
+	 * "img,img-rogue" was added. Keep it around here for compatibility, but never use
+	 * "img,img-axe" in new devicetrees.
+	 */
 	{ .compatible = "img,img-axe", .data = NULL },
 	{}
 };

-- 
2.48.1


