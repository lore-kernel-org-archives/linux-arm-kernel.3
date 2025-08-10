Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DA2C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw1cLvgEhua8i3WpG4C9LAPsxagtK2jeoB8fPKEx0SE=; b=YFb2IgkbDNwUYQS+qTLzwUuLyj
	ZAQceBwxGfgzWXfjc4NRbvju1EPaYypa8SDCiXdWJopiPu+2GDlCaWWJuBJrxNIH3ssBvi/qh8Pv2
	cTLnLVvT9ux/WETTJ8LG7hHdxIR7rOLlSHAYXohaq8SlPBK1Cc8NtB5jqGktIGPSJHwzXuNscxI4/
	WMf4Lte7ZzboTl4g798vzDgjuUxDoUv66y8IdKhVNeyUOQjK0CDuoLtjiivttBAAYuIvxzlgaloQy
	jw5I6ZZQxnFGncdzLPgUTA6jx0Wm022n54hI2pigerLcgHCInMPMQf23Jx48N0VGTSJvTCHkNU9rD
	cGBcUEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulF2y-000000069ya-3OY6;
	Sun, 10 Aug 2025 23:01:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEoG-0000000689m-1kPw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sw1cLvgEhua8i3WpG4C9LAPsxagtK2jeoB8fPKEx0SE=;
	b=TdofCqCwsHtyoWpS1jwr+hYJLfv1l2GJMWHqRB07K2iy0C1s+JSCsnHE1pGCwVlfWYXlDb
	RxmADlLFgm9WtWLwT7YOQCLBD8rXcL1DjxKIqUln0cXzVRzv+FRbxMzeJbMUKXHT49JA1i
	Jm3IGMfHosfP5MiCFAg00wlPbbi1yK0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-eAdS2SoKPOy9PAXb5RExOw-1; Sun, 10 Aug 2025 18:46:33 -0400
X-MC-Unique: eAdS2SoKPOy9PAXb5RExOw-1
X-Mimecast-MFC-AGG-ID: eAdS2SoKPOy9PAXb5RExOw_1754865993
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b085852fb8so157983291cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865993; x=1755470793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sw1cLvgEhua8i3WpG4C9LAPsxagtK2jeoB8fPKEx0SE=;
        b=DcAoWlDe0EengFtQu5XxHjXhAhU4rNHhJtQRxEutYWkEACMHU39jn/Qz5tn3BLy2Ju
         cjKZvO6TzIP4wbUcdi+bC2sBF5tRSJWqiUb++qK75w8ZroUfIc7TbmfeHRRvLIiaeVMV
         BgLCs3QXpo1uej37fQA1to/8I7Kju5AHCKSlFYtU6NB0UAcb1WXW+OuA1/U0G4caAd0J
         3kz8Ynsr0ir9GiXVXsuTSM8dxwFhp5SZ0j62pY1Fz3GwYi/vwPUEVfecbXqhZi2Lumpw
         JBm439EnojJI+PfRoDciz2lS+RPXeo0S4cPK5L8XGPercl0pRr1enKOPa1sYMHwdYaWy
         ZZuA==
X-Forwarded-Encrypted: i=1; AJvYcCXjLfwiEf+4BMC4PomfnF1Z/ZYjjvTyBgea+SwOqk09eVEsdlEbH0aGtW+y89efdKhHaVNNyfDMC5d0un5Kx/On@lists.infradead.org
X-Gm-Message-State: AOJu0YxS4N7+wk/awuZDYz6CE94Bb2mMXbbQCETUpeoDfN8DMrCg5DJ3
	Gh9A7rhRcMzzPgQoBS7JPbjG49ttaTi8NP21Z5ilPhad9MZlVnM8BhacDiZ+B8wdjaEGfaEHdiU
	f+BnkDAFJXd25OQzBkcYJ0SDmSv/Z5+JuJL79KEL+TUoa13x4am2wTfLOmazvvn1fxAnlz0ImwG
	Pf
X-Gm-Gg: ASbGncvmOz4Ktc5p/514HRC2bWjQGoppzbhPfrcmHnk4MmJr2q7LkzBTQWACMy4n9ex
	LPESnS4l0VOIwR3HMFS5ySL1mebo7S0gMgPXP7DubXzcZlUIIrjnvNWBBSzXbyyQHH34ojl7gwJ
	aekV9ZqucOZWkAW+mqmf5IIStcfB3OdGmsP3oFByqouTDD+i+jGJK+l8QJgKz9YRqClJemNNwMM
	Ze/4edp8kRgPKy7uF5L2RcGVwUVOfK2QEO5tlnRqADT/+NVvP+x69ZDGoaaiAVHscb37eaxa2nU
	+gIJH+schHCZt+aHFxhvYsxmlykltAqpWiDKMkvnIUdHRGT48FnAED6IfgVAhyD1CnNFBuS7w19
	KYGnQ1g==
X-Received: by 2002:a05:622a:2b08:b0:4af:1fb2:339b with SMTP id d75a77b69052e-4b0aee5ae32mr145137591cf.59.1754865992942;
        Sun, 10 Aug 2025 15:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3TxaNlOm6CWR20thRFc4k1fydx3ZMYAWuNcAfSFTfYY5caqw80RA7wi77MbUh3gKnqnfd0A==
X-Received: by 2002:a05:622a:2b08:b0:4af:1fb2:339b with SMTP id d75a77b69052e-4b0aee5ae32mr145137151cf.59.1754865992498;
        Sun, 10 Aug 2025 15:46:32 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:33 -0400
Subject: [PATCH v2 5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-5-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1519;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=x3H+bi72Ud0O2ADBCQwtbhpk+18O8IQnZUeD4zYXytc=;
 b=Ko6nm+pXyNo8X1nQDJr+lVHcu4cXjZr/njvgKDiWI9hUw5g4z0iGWyficBfc/rHylfr1bFBC5
 OcjcwnYNCZzC9mq0m1MLk4fjF5rjaP4zt/gCvk1nnxylsB0GMKTpJxJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g9sa3GGkmcJG83L2bMoevubcCc4C-zGcO4p4oRhIjLE_1754865993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154636_520393_79422ADB 
X-CRM114-Status: GOOD (  12.80  )
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 673cb0f08959e0e4f2b1ade2ebaf796e8b76f8bc..438ff3605d90121b7bfe02b3ddca8194437ed9ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -237,16 +237,18 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_DIV_MSK);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 50000000, 1250000000);
+	req->rate = clamp_val(req->rate, 50000000, 1250000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.prepare = mtk_mipi_tx_pll_prepare,
 	.unprepare = mtk_mipi_tx_pll_unprepare,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.50.1


