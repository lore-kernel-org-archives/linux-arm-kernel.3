Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C9D4335E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=; b=R/7tFf1FUYmIs92cQtoFWTwMpp
	aw5sDOpT4EyC/mmbw4UX5M2KujJ9F0BIhz1hfGjSinu1MG/u/Z42ZVgsRKPLD3rW/Y51xKh2wW0Yo
	xPaN8OAm1GKh2sEm+wZSHo6l9MyEWMFcz655RFa/nT36Oh5OzHW2TqV16FsANuziiNTDFMql5w4yt
	PeBiCRdfav9C3I/CFo6h7vTfasbShWrtGmLz9tHSUxcz26oyDoNetj8y3xLubPxsFrRV7VuMyWd3v
	YoDrU2DB38sQv1qjymDCRiek3z+e5OxyJXTM9XeSpLe/bZqL4pA6HOkGS7I0503NwFe/WVMgkYk2p
	Blnyz46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpua-0000000HP1U-3zts;
	Thu, 11 Dec 2025 23:17:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuY-0000000HOxB-0QC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
	b=d3LBO20b+JzSZ9I236koWicDRr/uF7s7qh7gI6p6wgkDZH3SXtj/ndOvZQkOMV/ogqjM7a
	OVghBadRV0w7PfuxGpGvEatrbYoX0RxphfPpKOSZtkh9mtiiWsf80d8TNwMXc2FKjNofKe
	X3zhnz3wO4A/aFOBDObiZxJosfl7cTY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-xDqHwDH9P9igIEVNStJelg-1; Thu, 11 Dec 2025 18:17:24 -0500
X-MC-Unique: xDqHwDH9P9igIEVNStJelg-1
X-Mimecast-MFC-AGG-ID: xDqHwDH9P9igIEVNStJelg_1765495043
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1d8f56e24so147672185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495043; x=1766099843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
        b=sJVy/9kmodTfXFmT0LL/Uuz9hNEYSEOv8KL7TePt1IYJjTkgmJ50clkhme5TPUQX9/
         dJl9LpxYzZAMrrV4BvbxHWfzYScQaj309KtaUQBX7i1mWkfENC3K/wDENJP46KvOO9AQ
         bq85c54Z2zcJAX7zpg5uoc/4hMoIdBnHctu6NX1l69D3jD2Zuhki5GbjL+OV0TCKAtex
         zNrW7dLH7cgAw2puw0VNKBrlp5q+RHXEpFIHoMZcLUuZ0qmkk6bzhMC7kSy77xFdODcL
         SMWpcv+6JDO/yc0l3PuFaRN+OjE0WJw8+AkZIn39PZNNyADFgO2UsXPeyV1o2VwLdXBT
         zF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQq7ZSaln9PPNdXhkCkOkBOZsUHOm+FCwHubG5suDF0TF7apYQaAEGoT57JdHumcuRfmCqLw6oJTTtdU4BhyRF@lists.infradead.org
X-Gm-Message-State: AOJu0YyrlrPgFXruadN8/p9o34RmzpHJb9/We0Gh17OiRUejQyD1zdOU
	/f2xajMqxwBdwAj+EAWb0RD0BI/X1ZADap6bFYQQEqso5BnQxC/aPDAEISJW/PTGhieuFZ8P160
	ZvCXBoIqsbe6xSrIrnZkRpQ5R/yI1O889O97O8x6eFw+ZeO/XWCyk6KIrXXYv0280l47ecHm7MY
	OL
X-Gm-Gg: AY/fxX7qBIGuUooARkvL4rpIl7yXCKg8bbAN1W9JsH5OkEQh4mv+wIHKUMVjdXlnUJv
	xz8TbSVHyF8Dgjfb8jY7h1yBgu6i7cB/rp/Kcy/Lv+0VH7R2A+JM8y/1a72l9SvsTmRqnzSICQ3
	725LyqFYMKdVSOI3oVgcF68rS2pRVAPbVJ7LH4JH+L8o0ECfdwnj355uZDpm0a10fUm8a7m694n
	XIvP2uQ54GyhvU2VsyCxQD4ofCBvu0D6w4bQKebWUKofJFvdSoeom+EuxorBF0MlhlGHnSMmdP7
	WTDJ+kjsNRAyz8ral2Z2sUMb/uVVK6A3/RaqTTT2MiVTzy2b/J3lFLfpwe9STcpsbmQHxwjcEQx
	tccJ+VoRsNSdiDRo1dxzXEfRLnzwAUSwvJnD0B1VUhJunefBQ+8kCqg==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29576885a.87.1765495043618;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEKudoWCpFXTWryHiRn7BIWdpxq1jIr+pxWiYKNOGd1R/M6vLU3ldrF09g/tRZdBf2bnSeqw==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29572785a.87.1765495043242;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:24 +0900
Subject: [PATCH v3 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-6-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nor1PtsS8pW+dX0xsLXLZpeucCjaBZDzA44P1ujZuN4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5JPn9olfEuTvvj3tw1GWwBGU+VG8TbX8XtsrQ1s
 d435bd/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNxyWdkaGhpmnjR5MTRYrET
 y9b6nJrZlTA1uHYXU6Dd9BPilnsqrjAyzK5fnHRCReH6NOn5sVMKMza551xlcVQ5G3RQ+MnShfx
 2DAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J859BIscSPrgwVvf5VW3ilfANC75G2--4vEp4PnJ4D4_1765495043
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151726_224628_D591F629 
X-CRM114-Status: GOOD (  13.22  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0


