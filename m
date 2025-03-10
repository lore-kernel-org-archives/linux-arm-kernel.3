Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D4EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plapHMEmjTIY/r+qZVekOspFjoGIxOFU4iWp9EB5Fbk=; b=VX/LT1DBoGuuvBCdDvNh88s9ly
	ozLXnMfEH0Sq8tVhJEkmHvTmV42P10eCWUHI4p+hmrXsB6wBOKuXp12nwf7dVyQJ7gpEYtQo7q3bi
	woAnipGxMxzNQvtvAK+EVJOauPVeFfvL9z0fNu6Xj97nraa5CTpMymq3ZoeRZEAVRTDbzvdWzKQ59
	HPLcy6w4yNV5lyih6CiDv9wHNJGkvr6xnEfnaAearMXwu29JzOVyRWJEuHaPbjpPyp8mPFHT6aHjm
	sx5A/FytRGMvedS9SW805+LGJMPKy2kB5HxVEtvlOaKDPg4GokA557UJxU3RfaLjnNPhamauIMcnu
	XewFuaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treO4-00000002yMW-1BoY;
	Mon, 10 Mar 2025 14:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcut-00000002k4Z-3II7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 13:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=plapHMEmjTIY/r+qZVekOspFjoGIxOFU4iWp9EB5Fbk=; b=WO2rPHY5bxbckHS87g4gUPo+R7
	9n1Ilh1xHYKYUaXISdGoISrHlIF9WtHhxMMqbwvBdgdXyK/h0nO4z0rHR+PtZSsdfeYI44jRnEgMo
	T5vB8iegSuM5vzaJiVdlWQujZoud1ENa0vsOv5vjbrPCQuhaNltiIiG6pI0+QFJy4DHZvFhYyeItB
	yVGE7s4HxgTZtkZHkVKkfPJg+ZJFHF8RRBlg+/OyEKhtOX+kSNmrtXwdBKZzWsgomMlq1biUr28ZA
	JAxww1g8LCQGSYsXLrKYgxxqLSXWJ7OUDTkKixawhM4DcITrxJGceI8GXhhlULrPXN2Wb85xQ/7SY
	RG8tooXA==;
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcue-00000001ra7-3XKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:11:25 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A7V2r2018074;
	Mon, 10 Mar 2025 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=p
	lapHMEmjTIY/r+qZVekOspFjoGIxOFU4iWp9EB5Fbk=; b=rnJIZgKUABQfaktFc
	pCaWupAeXzoExStHr9dz3R4AnNmIyr1LEEVrf51GGa100tD2n3RQ5A2rzFONzUSw
	hC52E9oeYm9LT7rPfKQ3b4PsOyaXKwHzasNLg8r9nSoeW/PAC01p6Q2aBx9ioW9Z
	0VCvDlgzeoLi8WyJdA+uPcM+1LTj95c3sb7KI01ETO1JvHajJJiDpPI12QD5theC
	LI7NWyhZipnFn3pSR1nBgnJlfs/h6uL+VkwX1zHqkULGq8Wag8XzbN9KrfpTLzcC
	NcGNUdma5Q/2DnGwsVDBjlwmgozyaqVXGdYfd5bjtxj0y7jBf73lhxA+SyqEgPc3
	1+QsQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 458d1wha4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 10 Mar 2025 13:10:56 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.0.133) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 13:10:55 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 10 Mar 2025 13:10:40 +0000
Subject: [PATCH v3 16/18] drm/imagination: Add support for TI AM68 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250310-sets-bxs-4-64-patch-v1-v3-16-143b3dbef02f@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=97EAD05oYJm2LRj0eLR/YT2QcnAuH/+kLKeGrQSF2Ck=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaSfe3Lp/AtduWVLb+4+WS7dunRvUkBTqfl6GZGbHF4Hz
 q/lCZJS6ihlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJfNzIyDDB3H7d+bIHJw56
 Nk4uto9abpc50Svjmf5c9n1d+5U/GOxk+Kd8YFJWV+l5TdEDKimx6i6xKdOPBGy+6yF9aMLMXqN
 tubwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.0.133]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: NcBkbGDYVYp8_s0mwZyGiYtzO69c3lx5
X-Proofpoint-GUID: NcBkbGDYVYp8_s0mwZyGiYtzO69c3lx5
X-Authority-Analysis: v=2.4 cv=U8+SDfru c=1 sm=1 tr=0 ts=67cee4e0 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=ETbM1kImDFEA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=8q2ZPnE9uwbZrF7VKmgA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_131120_933068_74181768 
X-CRM114-Status: GOOD (  10.75  )
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

Since we already added a generic compatible string for all IMG Rogue GPUs
("img,img-rogue"), all that's needed here is to link the appropriate
firmware for the BXS-4-64 GPU in the AM68.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Remove device overrides
- Remove specific compatible string
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-20-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-20-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index ac4f5855c5692f0956862cebdbf76b16d8da9a81..b058ec183bb30ab5c3db17ebaadf2754520a2a1f 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -44,6 +44,7 @@
  * This driver supports the following PowerVR/IMG graphics cores from Imagination Technologies:
  *
  * * AXE-1-16M (found in Texas Instruments AM62)
+ * * BXS-4-64 MC1 (found in Texas Instruments J721S2/AM68)
  */
 
 /**
@@ -1512,3 +1513,4 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");

-- 
2.48.1


