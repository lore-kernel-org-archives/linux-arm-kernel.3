Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081E0D68BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 04:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjpV/8auiFtX8BJPTbrdrMDkHffS00kQZ5WRPKyJ8vU=; b=JNoi1MUerJdVmuplhwgEZtHEsr
	i79Fmdg6/4aOVMbelBzqh04Td6G4aLnkOgtJt3Hi8xmkx2VIQCk0vY2uOi8/uRr7ImtHSOuxG692+
	CALSk+DHi1uowZWi7hEnTN7JFHStTRgW6wGKnanzgbMgiOHQMvTaZZ61xl/eSrmEy580IYX3eg49e
	q7MY1CAt67fsQVj6hRdRpPkW6yNpSOChcu0oyzN7MD7dgqD6nXShs4+0a4xT+isvrB9/UaLylbO/i
	E8mm2qMGg+75NbYhJd4NQV3wAVmnnGT2ap34o6bNtDnturjkWFcHHP6zbgA++RWKKEW5GvEK416mt
	pqTrApsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5He-00000007m1i-3Dj6;
	Thu, 18 Dec 2025 04:06:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW5Hb-00000007m0I-2Y32
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 04:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766030792; x=1797566792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHqzKejP7qJiygVDY63xTyki7o9eNbsND63wxWO5RGg=;
  b=yaV2WQH+bdeRPvyYVII6L8/rs7EMZ2epyojI/PIqMf2rx8TC4u7G7LFO
   fc/4LL2OkfTyZtRC7dXqC5NazZE9C+OWKthv6+M+0/JRZH/I8A5UyTU6b
   Fzt33sikKWxzizwQDDpSyhEuoJKMxOGzaf8QMCXuOSg1n1jxDDB13frbc
   01ewffmTiI4Ei/O78q6/ChmnZWLETTqpla+JGbOcJsDu56E0Q2+7IklW3
   lqmDvLAD8ktXDj/pEk7wZiJmdJ60OSwExrjrGUoumacTtrSxM+VAQ7IJA
   IZ3jjgMfIQkvlnoi2e1YT8+YUdGZkYBCLtvBcYmVXsumMyoPig+UOKt0n
   g==;
X-CSE-ConnectionGUID: 8d83aKyqR/m/457MXLOS1w==
X-CSE-MsgGUID: d4FCTZLRQgCwLnJkci0sgQ==
X-IronPort-AV: E=Sophos;i="6.21,156,1763449200"; 
   d="scan'208";a="282081582"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2025 21:06:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Dec 2025 21:05:54 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Dec 2025 21:05:47 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<manikandan.m@microchip.com>, <dharma.b@microchip.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 3/3] drm: atmel-hlcdc: add LCD controller layer definition for sama7d65
Date: Thu, 18 Dec 2025 09:35:21 +0530
Message-ID: <20251218040521.463937-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_200631_653345_296CBF4E 
X-CRM114-Status: GOOD (  10.79  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add the LCD controller layer definition and atmel_hlcdc_of_match
entry for sama7d65.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 81 ++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index dd70894c8f38..3d57a7182c98 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -566,6 +566,83 @@ static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x75 = {
 	.ops = &atmel_xlcdc_ops,
 };
 
+static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sama7d65_layers[] = {
+	{
+		.name = "base",
+		.formats = &atmel_hlcdc_plane_rgb_formats,
+		.regs_offset = 0x60,
+		.id = 0,
+		.type = ATMEL_HLCDC_BASE_LAYER,
+		.cfgs_offset = 0x1c,
+		.layout = {
+			.xstride = { 2 },
+			.default_color = 3,
+			.general_config = 4,
+			.disc_pos = 5,
+			.disc_size = 6,
+		},
+		.clut_offset = 0x700,
+	},
+	{
+		.name = "overlay1",
+		.formats = &atmel_hlcdc_plane_rgb_formats,
+		.regs_offset = 0x160,
+		.id = 1,
+		.type = ATMEL_HLCDC_OVERLAY_LAYER,
+		.cfgs_offset = 0x1c,
+		.layout = {
+			.pos = 2,
+			.size = 3,
+			.xstride = { 4 },
+			.pstride = { 5 },
+			.default_color = 6,
+			.chroma_key = 7,
+			.chroma_key_mask = 8,
+			.general_config = 9,
+		},
+		.clut_offset = 0xb00,
+	},
+	{
+		.name = "high-end-overlay",
+		.formats = &atmel_hlcdc_plane_rgb_and_yuv_formats,
+		.regs_offset = 0x360,
+		.id = 2,
+		.type = ATMEL_HLCDC_OVERLAY_LAYER,
+		.cfgs_offset = 0x30,
+		.layout = {
+			.pos = 2,
+			.size = 3,
+			.memsize = 4,
+			.xstride = { 5, 7 },
+			.pstride = { 6, 8 },
+			.default_color = 9,
+			.chroma_key = 10,
+			.chroma_key_mask = 11,
+			.general_config = 12,
+			.csc = 16,
+			.scaler_config = 23,
+			.vxs_config = 30,
+			.hxs_config = 31,
+		},
+		.clut_offset = 0x1300,
+	},
+};
+
+static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sama7d65 = {
+	.min_width = 0,
+	.min_height = 0,
+	.max_width = 2048,
+	.max_height = 2048,
+	.max_spw = 0x3ff,
+	.max_vpw = 0x3ff,
+	.max_hpw = 0x3ff,
+	.fixed_clksrc = true,
+	.is_xlcdc = true,
+	.nlayers = ARRAY_SIZE(atmel_xlcdc_sama7d65_layers),
+	.layers = atmel_xlcdc_sama7d65_layers,
+	.ops = &atmel_xlcdc_ops,
+};
+
 static const struct of_device_id atmel_hlcdc_of_match[] = {
 	{
 		.compatible = "atmel,at91sam9n12-hlcdc",
@@ -595,6 +672,10 @@ static const struct of_device_id atmel_hlcdc_of_match[] = {
 		.compatible = "microchip,sam9x75-xlcdc",
 		.data = &atmel_xlcdc_dc_sam9x75,
 	},
+	{
+		.compatible = "microchip,sama7d65-xlcdc",
+		.data = &atmel_xlcdc_dc_sama7d65,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, atmel_hlcdc_of_match);
-- 
2.25.1


