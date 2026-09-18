Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF7C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ylMW2foaHNEjV+ZwE7Us38p2iYChzzws4mregGYupM=; b=iDVf+XF12JuttblfF7nbQWtfPp
	fof9gYWoIxh7+Q0634RdmbiaI1K0KVL7FNoqkyGi4rI/ivMY3zxKV5lvwiBskY9RxIzgijHUSLsCF
	tnsFK7AAfFxax4VaL07G4JkbT/SGaZJWHAEElF23z9MaZz+0kKadPFptxRk+VQg9EurkAY+WTlSaK
	f05jYGG/OnMSKVtuN4hpe9uyO2OdeB8C7L+uoCv4m4bl+eusoSWKR/TIgr8fOyLbjmF4g3caYtBBZ
	2HbwjHi9yl5DfjYrYA754KzCt475idxqCThW8pQm617SR+9/IC+eddHRCYNcRLCx4n4aFDdPypS7J
	4PnRz0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqh-0000000FEfr-2qGU;
	Fri, 18 Sep 2026 17:58:11 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqO-0000000FEUk-3m0K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso769615f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754271; x=1790359071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ylMW2foaHNEjV+ZwE7Us38p2iYChzzws4mregGYupM=;
        b=ej7gG18+Gyh5t4yTPnv3XZkcXjg09P9/YBe5dcasy/Ii7geGCuepVkADhli00flCjR
         bunKzJZmscjW6pYCrHjnvU69V8OAOWEYivp6xUdkmCmCrKdVzZnOPWYxlYtnZBCxSGo5
         ZVsj/tzeqNhgvwrkQirTeqc4WhxkDSn74kBbXNgva8/yXQJa233Pkjaz+VkWscwLeuZj
         JCzK85ZRuFG9AlUP/9hJyhzDLxvDPDK4D81ZG1rAnz6/fGEqQmRoBuTeWgXs+rbRgHsk
         phlzby8LobKLfkDWEDBhedpB54Lg1ARPyHYvVCQFoACh6xvsH9yhTDAMONrwU8tGwlfT
         xz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754271; x=1790359071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ylMW2foaHNEjV+ZwE7Us38p2iYChzzws4mregGYupM=;
        b=L2/+y5KyE04BH5hJn8E9ZP10tE5znKi8Q5YZ+d7H+mOxvPczPwr/Atbaa52SPm7a0K
         tSHry/ofFKHStjZEbt2j7l9Evwjso2QEqGK4BqwhgVUjLR962g8QSwEfPD8l9a762tlC
         aCKtN4RfnC+pOGr/e7z8XFH1Kvm+HFdUAya6vXmOS3VhjqndGuVPomDlq7nymOFUmezu
         H/bZArv0zr6zFRsuca82OIBjhkp8QSwL2jZz/+N/MLHSd4BgPZlYxaB9iz8a0G1g5CFI
         msPpVkm8QmACiUQQCD9odsVem2SmIXtk/FOHfNTwN5e3ZLTHU0UasPkflgWOqWyV6o6S
         vWHw==
X-Forwarded-Encrypted: i=1; AKwUvBzdwNs2bNAj1r+2kvW49EXHXKzMJYIV7IWgYaVkhx+A7Jrgu3N9CmRTeRWktwNy4K1ZZe0XsBaMuLt8yRqYJ4NH@lists.infradead.org
X-Gm-Message-State: AFuF++nt76JaxrS7wBdz6aWrEjhjAEOxAdnNy//wCu23C4YNGFZvsIH7
	2fmA6vC9p7gRsUUGScebYRRwP5H2QRuE6zNBS1PY61gHnRKo4UQV+80R
X-Gm-Gg: AYBFou1k6B1WbcnRaYwH3m+CER9Kx1SB9AhUeHH/VW0yK9t5ANYwHakkPVgg1qGC40b
	hPa62hlrm1ui/fY57/LpABRyigfK9K8hc+MFfakpY2VoxEQT2RPWxO6HFgeYh5cy/q3B3ZCLyUz
	CnAvgtzrsEEEtdHYuzOkNTwNY0EUgRIO9zTsgF14JRE2/fOOvUMqHMrFS0UPQy1QY4Kw0KM1nEg
	U2GOexfx4tnduFPqIgRLNOFj7hA3zbFRrVaKbbLoPk5h56PfXPUkSXsBZURgiI3/qtdJdSvyFOh
	4nBG+QUwUyG5OgrNiPKtvH0xsOYDjIcxCbGkh96MdnW7H4bHvjToMBl0TXQ/CQskook1R59QTdT
	qHd/jjw6DkP58YRUTQlJbQVFnAP0r8zH/OaHAu0jh93AoGROIZ82bVFpQh8L9fV29OHAroFDY0I
	IXxB3+FcDaqZoC62oJ/P0NKZAb1uK3Zg3ivO1svO+jpmh9we+AZ/mpdE16Bu+4mj19hio=
X-Received: by 2002:a5d:584c:0:b0:486:f45a:57a7 with SMTP id ffacd0b85a97d-4871e264829mr7609614f8f.16.1789754271218;
        Fri, 18 Sep 2026 10:57:51 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
Date: Fri, 18 Sep 2026 19:55:27 +0200
Message-ID: <20260918175736.355305-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105753_060763_30257B81 
X-CRM114-Status: GOOD (  15.78  )
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

mt8167 display output pipeline can be configured in many different ways.
Add support for additional routes according to the SoC data sheet and
Android sources. There's a few inconsistencies between those two, but
assume the Android sources are correct since they are required to drive
HDMI output via DPI1.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 183 ++++++++++++++++++++++++++--
 1 file changed, 174 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..aab1774152c5 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -5,35 +5,200 @@
 
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
+#define MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x03c
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
+#define MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN	0x05c
+#define MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN		0x060
 #define MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0x064
+#define MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0x068
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
+#define MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN	0x070
+#define MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN		0x074
+
+#define MT8167_OVL0_MOUT_EN_COLOR0			0x1
+#define MT8167_OVL0_MOUT_EN_WDMA0			0x2
+#define MT8167_OVL0_MOUT_EN_MASK			0x3
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_UFOE			0x2
+#define MT8167_DITHER_MOUT_EN_WDMA0			0x4
 #define MT8167_DITHER_MOUT_EN_MASK			0x7
 
-#define MT8167_RDMA0_SOUT_DSI0				0x2
-#define MT8167_RDMA0_SOUT_MASK				0x3
+#define MT8167_UFOE_MOUT_EN_DSI0			0x1
+#define MT8167_UFOE_MOUT_EN_DPI0			0x2
+/*
+ * For some reason Android sources and the data sheet don't agree here,
+ * the data sheet has UFOE_MOUT_EN_WDMA0 as 0x4 and does not mention DPI1.
+ */
+#define MT8167_UFOE_MOUT_EN_DPI1			0x4
+#define MT8167_UFOE_MOUT_EN_WDMA0			0x8
+#define MT8167_UFOE_MOUT_EN_MASK			0xF
+
+#define MT8167_COLOR0_SEL_IN_RDMA0			0x0
+#define MT8167_COLOR0_SEL_IN_OVL0			0x1
+#define MT8167_COLOR0_SEL_IN_MASK			0x1
+
+#define MT8167_WDMA0_SEL_IN_OVL0			0x0
+#define MT8167_WDMA0_SEL_IN_DITHER			0x1
+#define MT8167_WDMA0_SEL_IN_UFOE			0x2
+#define MT8167_WDMA0_SEL_IN_MASK			0x3
+
+#define MT8167_UFOE_SEL_IN_RDMA0			0x0
+#define MT8167_UFOE_SEL_IN_DITHER			0x1
+#define MT8167_UFOE_SEL_IN_MASK				0x1
 
+#define MT8167_DSI0_SEL_IN_UFOE				0x0
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_RDMA1			0x2
 #define MT8167_DSI0_SEL_IN_MASK				0x3
 
+#define MT8167_DPI0_SEL_IN_UFOE				0x0
+#define MT8167_DPI0_SEL_IN_RDMA0			0x1
+#define MT8167_DPI0_SEL_IN_RDMA1			0x2
+#define MT8167_DPI0_SEL_IN_MASK				0x3
+
+#define MT8167_DPI1_SEL_IN_UFOE				0x0
+#define MT8167_DPI1_SEL_IN_RDMA0			0x1
+#define MT8167_DPI1_SEL_IN_RDMA1			0x2
+#define MT8167_DPI1_SEL_IN_MASK				0x3
+
+#define MT8167_RDMA0_SOUT_UFOE				0x0
+#define MT8167_RDMA0_SOUT_COLOR0			0x1
+#define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_DPI0				0x3
+/* DPI1 is only defined in Android sources, not in the data sheet */
+#define MT8167_RDMA0_SOUT_DPI1				0x4
+#define MT8167_RDMA0_SOUT_MASK				0x7
+
+#define MT8167_RDMA1_SOUT_DSI0				0x0
+#define MT8167_RDMA1_SOUT_DPI0				0x1
+/* DPI1 is only defined in Android sources, not in the data sheet */
+#define MT8167_RDMA1_SOUT_DPI1				0x2
+#define MT8167_RDMA1_SOUT_MASK				0x3
+
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
+	/* OVL0<->COLOR0 */
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
-		    OVL0_MOUT_EN_COLOR0),
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_OVL0_MOUT_EN_COLOR0),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_COLOR0_SEL_IN_OVL0),
+
+	/* OVL0<->WDMA0 */
+	MMSYS_ROUTE(OVL, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_OVL0_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(OVL, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_OVL0),
+
+	/* DITHER0 outputs */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
-	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		    COLOR0_SEL_IN_OVL0),
-	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_WDMA0),
+
+	/* UFOE<->DSI0 */
+	MMSYS_ROUTE(UFOE, 0, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DSI0),
+	MMSYS_ROUTE(UFOE, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
-		    MT8167_DSI0_SEL_IN_RDMA0),
+		    MT8167_DSI0_SEL_IN_UFOE),
+
+	/* UFOE<->DPI0 */
+	MMSYS_ROUTE(UFOE, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DPI0),
+	MMSYS_ROUTE(UFOE, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_UFOE),
+
+	/* UFOE<->DPI1 */
+	MMSYS_ROUTE(UFOE, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_DPI1),
+	MMSYS_ROUTE(UFOE, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_UFOE),
+
+	/* UFOE<->WDMA0 */
+	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_UFOE_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_UFOE),
+
+	/* RDMA0<->UFOE */
+	MMSYS_ROUTE(RDMA, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_UFOE),
+	MMSYS_ROUTE(RDMA, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_RDMA0),
+
+	/* RDMA0->COLOR0 */
+	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_COLOR0),
+	MMSYS_ROUTE(RDMA, 0, COLOR, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_COLOR0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DSI0 */
 	MMSYS_ROUTE(RDMA, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
+	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DSI0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DPI0 */
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA0),
+
+	/* RDMA0<->DPI1 */
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
+		    MT8167_RDMA0_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_RDMA0),
+
+	/* RDMA1<->DSI0 */
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DSI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA1),
+
+	/* RDMA1<->DPI0 */
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
+		    MT8167_DPI0_SEL_IN_RDMA1),
+
+	/* RDMA1<->DPI1 */
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL_IN, MT8167_RDMA1_SOUT_MASK,
+		    MT8167_RDMA1_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
+		    MT8167_DPI1_SEL_IN_RDMA1),
 };
 
 #endif /* __SOC_MEDIATEK_MT8167_MMSYS_H */
-- 
2.43.0


