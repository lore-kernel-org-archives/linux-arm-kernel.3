Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920FCC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=; b=22m0n9n1OMnqIsNHoD2V6TBCtf
	b9mPgkDBQD8LdIDdtgRE0olbhXiDmGBvOhz+gj+u5mhpJ/z0KcazhkO1FIL2eSr8FsxK6WvujKxGy
	vWQajnZAigWZWT4nkYwVfB8IiKdUFEzPe1yWAVBWdBKK+rxRHsZOvqrugsk+/bVMG/Mh67gGkypNA
	G+tgFX9j+aRRqbgT98zUejQPxGxe9y6VQC+uruhvXyJFyx5Ce8+FFFttoGBKRFCYRlsRJVZxEB0kg
	BhWXGsk32wH5AYA7xsDZJ4cfPUhW2dyqHQjNzXn9b9TF/q7X8guXubltwPfc+BvcAETJiq9+fy/fe
	QHjiGyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cNG-00000001wTA-3dTo;
	Mon, 21 Sep 2026 11:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cN6-00000001wMB-3ghB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=; b=mh6Dq1P9R2L27lG6d1XOlVaoID
	urU5uTOi9eozKALumvYjONUltJAhiFkM8BHwAvqTlSu5+1bwKC1Xf57EUj5ixJGBR1s+5doUT9qm4
	qtu+QE5mNT6QoWuCLJClnsX6AmPPDE99WpxVHbTaPcn9mY3uDKgZgxfClXIxv/eXFiMDZH3mUK1Y7
	Pt6WMlST+nebvE9hMRfqfmOAJlyCxDQYWLIGNZVcUavALFbUMgnROhq+5JCYIyAxOin+z9F7SqAyM
	/UUSrLCTmtxh5iyTVYcKcFvnh5BgPpnWt5MupDGoQL+5gv7S7kqUbUBXYZYItkqpeLPGj83HFBMlr
	hD6bV3Vw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8cMu-0000000CDlY-1oHA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso20735435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990771; x=1790595571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=;
        b=eQr9PQpmeN0EZyZr+toekE++nEoKFaZ4ysAgA6jFv78QQMrkgzWSZn+qMGAyVKCqZ/
         LEFYkY2QjR6GAHS75fvdAXRvDKh2/oxoMAxdS5lx4EzIkHQZYa5MzwIoJWrtA7Pct2Dq
         HLUZoKx3IJJ/tWuKVXo9ylsywVmglqIfIyZSOtnZHKDrzE8oLeJWQhN9yT1p8uIIgg0a
         2Fy6pjCs+M1sWOXkolrn2z1S0MUtAN9bpddJo1fW9DhpQ4tNib6VvhtOfG5RuNedjLy4
         CKUCWiVl4FT+t9BZvqQnS7uQintV144QZ+F5bVBJs74NCktGI1Ts6uPXeHIxsM957Y4q
         Dggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990771; x=1790595571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZPzbTlxntaUSPDIDTplyVsLAQNaZBVDPsqLjNTEB+0=;
        b=BFrGe05Aeyz+u7Nxl6Zb+bv7sScRKxki0pcJfGmSB1AP+QTVfpH/H2Mn0AMLBDDeK6
         E+8LVRJhGO0d0tIXzK1lSW/W1mgKBqnQqO7F6ILTTg9oLK7hSpcWcBI0zYmyUT5ynxiC
         Nrn2vqqSo8CLZRVyttvSQTBkx0L3yCis+PEnjy23mCbssqXfjgrU+IKiH5S0LqwtBIBE
         5RP1M5WIR8np7RXIizY0UBRXlvkc2lI3tjs/DeoZPw53SMeNM6vVUbEUqWkyPd0maAZO
         zL/9XaeAGP76Iu4CFNAWNdJHVFNqqitEdbN9SxazWKAWC/I/P3fCGAqC1e31UA/WgKJn
         cMCw==
X-Forwarded-Encrypted: i=1; AKwUvBykqm6wL2hYJ3uI6CbzbP8Hc7Sd2EG9aDb35NuTlpGyO4eOJRPgN9wGo8/TVLjVjziNVdlPMJfC0UMvlmkD8BS4@lists.infradead.org
X-Gm-Message-State: AFuF++miA7SxBDgHzq+NquZ1tQeIsnG7B32Pan6eJ0sxvZHopjuVmq3C
	/M3dBN1pVsuU3NvSgIqBpYci86RpY6+kB951kPkNDGue4csSVYI8m96h
X-Gm-Gg: AYBFou2isHSNlgbYD1cigQ0FfUrRYt8OS5VLPi7+5af13lAMQSXr4MKf3lm6dhxbCh/
	N9e218K3vtWbJTNdjDNtn3znPU9GwofCZ1oCIHiKSUqQvcEOL+AIT9TPpJz+ykKNR8WIBgyuwxA
	57xV+5xnw6/rTchRvF3EuGneTXVwaH3/dkA8CQmpppgPHhI2TtmkSS5utyk7bsMnE/HLHUB69R1
	Rqyuvk5kWzFxRNXysh1usOIFCkKujMIAbcy/7HZ7eZ2lxFV3JnOWwFW0P3wyJkDZFLXymOms7C3
	NHrrT65TeisEHH0/Bc6C99JmxcJOhJum+68IlVWmMqeCdQnl8aK4JNN5u/wubrjZAQZ80zc9RYI
	8Z+wBrKyZK6OhrqNS78wk73t3wDLLsZjkSSSnco97JO8y86Fjf0Vczs/A6ntjAMVuLanG6qUHf6
	rp8lvXpSgadVVUh/vGoGLCTNHK8CPZBA6YE53CaTkPu68n5UAJnNeEkqBw5rYLaiW722M=
X-Received: by 2002:a05:600c:3b9d:b0:49f:bd3c:bc1f with SMTP id 5b1f17b1804b1-49fc573b54amr177641685e9.26.1789990771240;
        Mon, 21 Sep 2026 04:39:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:30 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
Date: Mon, 21 Sep 2026 13:38:57 +0200
Message-ID: <20260921113914.779393-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123940_475482_D162EE81 
X-CRM114-Status: GOOD (  15.59  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 193 ++++++++++++++++++++++++++--
 1 file changed, 184 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..7da81b668871 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -5,35 +5,210 @@
 
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
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_OVL0),
+
+	/* DITHER0 output to RDMA */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
-	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		    COLOR0_SEL_IN_OVL0),
-	MMSYS_ROUTE(RDMA, 0, DSI, 0,
+
+	/* DITHER<->UFOE */
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_DITHER),
+
+	/* DITHER<->WDMA */
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DITHER_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_DITHER),
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
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
+		    MT8167_DSI0_SEL_IN_RDMA1),
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


