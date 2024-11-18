Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFD1D4921C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beINE6+byOTMR6M+TLtvMJfSdNu5DJq3g062zh5yub4=; b=WhmxGpUN30giX5dByzue7WQ4hw
	ZGzoDvKj/4qZZpcSfHC3aMDCNi2EqL7aHlyXy5/F6iP+QMvpzO/kJH+QYnjLDaeI4D21GZmOQPsRL
	f//9L0G+KDJ/wQ7fnJXjrzgBfbJqdwuVA8UjDhjAPRKBDuFC5AeqlAmfUhAWBFx4GgOwVmWXIzUQo
	NsXVqu3RVqeBmUM5gozbMG2A0xDPHqNMxCbhOsqf8h5ScQSYSUqmcimScjaMBR094S6QYJ8uyuE5U
	9tQJxy/T4TXKQRCRY/vjr9lrl92q6A5Dxsme6vUce43HjVJOckDJjGG7ReXNrYE2jMyvr0EjNcgT3
	lSrd6Q6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1dz-00000009XYI-17ld;
	Mon, 18 Nov 2024 13:18:19 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1P5-00000009Tiq-0nsJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:03:03 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePj029230;
	Mon, 18 Nov 2024 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=b
	eINE6+byOTMR6M+TLtvMJfSdNu5DJq3g062zh5yub4=; b=wOBejWhR5QHdKs+Sw
	0w/3nmj90H2WaZmzlfBREmln1Dcxe45auz0CLQGKnaR8nIAAjF87cOJoiSsUoUln
	zDxlIqmEUwVaug+YD/2N5J1b0glKaU2ArnHNZSRedCq/pCAAxabdnB2d53lD4IhC
	2qqg+Q/uBlFGQkfCjsSMkoZS2o2Rw25uaHl/L2l4MpPPAJlivKc4nze1oTP+v3cV
	+rF1n0hoRWwMSBp0dcbJu+yDNT9nVT592+LeZQLcOq2ckealvVERb8ar0n5NzjGG
	JMzNkGOl6uaCTZAZ5ve04xczBI+ux2eawLNbDsCLdPCGFYafC9rgZwSIBQGgJUw2
	Ize7g==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmhy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Nov 2024 13:02:35 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:34 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:01:57 +0000
Subject: [PATCH v2 05/21] drm/imagination: Use more specific compatible
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-5-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=X66R6xuIZnfceMUEUM4DQgLVl9zmtOR00vlpTsd3H10=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz2plryRfeNw+NHus47iS5ZOvfUhZ9fSDs2s9azrr
 l151tH3oKOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmot7M8D/WJXvKjjaG+J5N
 i9jnLfd2yb2s5yrsbjY5Qko84OTlAG1GhkVLJdW+/b05Jatt+5oDH4wLZ5x+u1Uo+H6hVWr4DJ2
 D69gA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: QeNiZn_qYbY4fCpbWED8v7oUbYNNAVvU
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aeb cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=6TxX0kamTyKH95WNaFsA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: QeNiZn_qYbY4fCpbWED8v7oUbYNNAVvU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050255_571657_D80E55A4 
X-CRM114-Status: GOOD (  12.77  )
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
the more specific "img,img-axe-1-16m".

Keep the previous compatible string around for backwards compatibility.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-5-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 684a9b9a2247b8f5b0f4a91ec984af2cff5a4c29..fbd8802abcf1271e260209957d95ea705dbe7f14 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1471,6 +1471,16 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,img-rogue", .data = NULL },
+
+	/* All supported GPU models */
+	{ .compatible = "img,img-axe-1-16m", .data = NULL },
+
+	/*
+	 * This legacy compatible string was introduced early on before the more specific GPU
+	 * identifiers were used. Keep it around here for compatibility, but never use
+	 * "img,img-axe" in new devicetrees.
+	 */
 	{ .compatible = "img,img-axe", .data = NULL },
 	{}
 };

-- 
2.47.0


