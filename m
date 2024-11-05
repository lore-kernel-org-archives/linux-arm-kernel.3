Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6FED31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnyS/qr7yXjDVVSPTyP/1yiwNThF0zJQHksf118gXs4=; b=3jeE59moRGQVdR6lfvJsIMx87G
	dvRBYyUlihQrNCvgSaVoWOtT436AAt6V26Q9RglIBrper6HeVePNMtwkOZozQlqj5MmHlzBlUueZN
	nZuyxx7jBmapi4gNHu5V/D+e8mJSY6CZeq9IWjUOwuvdV+1emwne8GoYAeCIdU6PZbWJSZLiTo5OJ
	yxHGN40/U78W3/BNaCzwDL0aPkllI6JrsBSm33ex0yoUqM56hS6XbylGXZ6nO/8E0gc7aCxjhGHC4
	Nb+AhY7OTxupsEXmE8wuI8Q48t+NLigfzrsr3lxW7GkR49mPUzAIcD02n6uAEwFlG6YGnXIf4z+Nd
	Rr6zyPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MZ9-00000000495-0CAT;
	Tue, 05 Nov 2024 16:38:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxM-0000000HX5A-2TwJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pnyS/qr7yXjDVVSPTyP/1yiwNThF0zJQHksf118gXs4=; b=DJVC0ela0cW3Nexm69iW1clE7W
	v9GQOHjwOqVC9h+a/xtEzcq13/oZwlU4+xRqMVqpvYIS9Gi2N0C62XdmLua+iMnbESQmHro/UVeeD
	/P8a+pBeEdUA4SYbn7fLRwIopqdKZCPJYjsZAwda2x8k9FJmxnBu3Kro8pLY1LpkSXw7Qyeq1YxYW
	oBWaCtuLch4eSB6jYZvTs+ADmX+mUos4RFhEAz021lDbMmmeifOXQXwAFY1OBN2d2/Krert8oufFW
	HSHuIsT2Z/jJ72fG6as0wfgTJLFK2L8WRvf1BHqYFhwf5afL/MOjNr8bn6hkyx7jHOuz7xPbJicT+
	J/7gEeiA==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxH-0000000Bmgo-0ObG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:59 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A58CTKa021812;
	Tue, 5 Nov 2024 15:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=p
	nyS/qr7yXjDVVSPTyP/1yiwNThF0zJQHksf118gXs4=; b=xY7A9+/6ABLbUoF3B
	IF24KoOoqxztdAZoElnsb41XYVi1BAlPUXOtpfWk7mSkMPkgGB+o1PKlfWBu2uYV
	V4GCwXloLMLvCFus4qUyOuklQgcsyR6wtlAhtUUQkrFudArXgWe0gz/csvb6Wvw1
	BvSqA7hTSE/CNHdv/K3FairMMecDveib3NhEVS9uMRsr6ntX24iSAj/UEWiW0Dzy
	hsh8+gtf4rsKtQlqNmDvo2nztrVoRWH6pwXbXE4m4ZYcsxKrIc2BYb59e2SWjrVS
	aW9WYWFsG34fSuqfZseXyTHSPjDz5kpv6CU8yojgh3ppI1/JU/lrUpft/erE5nsX
	3EBvQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212ju3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:40 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:38 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:26 +0000
Subject: [PATCH 20/21] drm/imagination: Add support for TI AM68 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-20-4ed30e865892@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=OZVGgc8hLLq0l4OrdMvxHF8MYZOQdKdzg5JiDqdO5e4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcz/P53nWPKS/t+usr90OXdVRLxd7Dt1lc45gZA9H
 HVfA/gKO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAirgcZ/peamYspTGt4t2aV
 sXGa3COtKb8vPqoW+xBQKebOPilZK5aRYfPBgPk7vy5R2m0UfXuXNgtXzBSuFs/FEx8eqLE7uMQ
 uih0A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40b0 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=G3R7v66XuqknrrS5BZUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: PWOKNB7M5R3BIVhXr528Nl2IpSHRnmi-
X-Proofpoint-ORIG-GUID: PWOKNB7M5R3BIVhXr528Nl2IpSHRnmi-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155856_153160_E27DE276 
X-CRM114-Status: GOOD (  11.90  )
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

Add the new compatible string recently introduced in the dt bindings
("img,img-bxs-4-64") to the dt_match table and link the appropriate
firmware.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index e074cfb0d2055b5387dbb142ca972108977f9854..044321cab1114864aefa2ca0024f326ac52d4dd6 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -44,6 +44,7 @@
  * This driver supports the following PowerVR/IMG graphics cores from Imagination Technologies:
  *
  * * AXE-1-16M (found in Texas Instruments AM62)
+ * * BXS-4-64 MC1 (found in Texas Instruments J721S2/AM68)
  */
 
 /**
@@ -1501,6 +1502,12 @@ static const struct of_device_id dt_match[] = {
 
 	/* All supported GPU models */
 	{ .compatible = "img,img-axe-1-16m", .data = &pvr_device_overrides_default },
+	{ .compatible = "img,img-bxs-4-64", .data = &pvr_device_overrides_default },
+
+	/* Vendor integrations which require overrides */
+	{ .compatible = "ti,j721s2-gpu", .data = &(struct pvr_device_overrides){
+		.device_memory_force_cpu_cached = true,
+	} },
 
 	/*
 	 * This legacy compatible string was introduced early on before the more specific GPU
@@ -1532,3 +1539,4 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS(DMA_BUF);
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");

-- 
2.47.0


