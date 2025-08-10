Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB57CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 23:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMcTNy0e5RVfi5VVz1vP+dp2IXm5jO1AgXXTZDV98Gs=; b=OjVup6CoQcisCwZOfPcrGGKmWR
	re+6iwXIN4Ch+s/i/BnfVLpUJY5vISwYC4tIWPykLqmcZB69CA40dWewDqxLZ9M1Kv7xApr8p3VDH
	rA1WBNYjsSZ9Wwf2C7XNuvIVjGPuv7JQU6LSPYzHY8GBbo52jPfjamWH6LA0M2fwu90Ls5SxylbSp
	2SfRm6Q4xJMt1F521w8Jser90cdsrl7zYW02ajYq4aiymG1RGGhB9Q8I0IYl/QxKOmKTPrG0yxR/R
	EOYhEJkr2Eh5RDY9ZKKQ7NlOrT2ZcJ4WjSMBuYe7NGvRICpl1UCb4aTkLxWNBG+gRKQ+TL9XJOqUj
	ZcWX8erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulFAa-00000006AWq-05my;
	Sun, 10 Aug 2025 23:09:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEon-000000068Ha-2LKt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMcTNy0e5RVfi5VVz1vP+dp2IXm5jO1AgXXTZDV98Gs=;
	b=HBkg4CyQ2zpT0Ripi1XTH2QNOAu+NbaC+Zt5gT38922FZK4r5qkXPqXsZZ0HGNJ1I7TShl
	7yZ5Ki/uKrHBGlTRPumItdbmVt67/bb8lHAxHiftEEg+p0Aa9y4WoitNkP9XWifpKlY/vw
	6qZZWLY7kGWoKAWaAeeOSBUhiKurrfk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-VyP2MkqtMx2atT8Y__OyWQ-1; Sun, 10 Aug 2025 18:47:07 -0400
X-MC-Unique: VyP2MkqtMx2atT8Y__OyWQ-1
X-Mimecast-MFC-AGG-ID: VyP2MkqtMx2atT8Y__OyWQ_1754866027
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af18aa7af8so106702611cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866027; x=1755470827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMcTNy0e5RVfi5VVz1vP+dp2IXm5jO1AgXXTZDV98Gs=;
        b=OLQQNbqRM9x90ONH6bJ5yPs9gFsNbrlAIVdIRi+4FWtyeQO9A/QM1AB9YzaP/ePrqQ
         Tc1hPrVVOUuwleWXoIEjIUZrTCmyOxqNoBA42vJv/mb9rpYSVA5A9VrVc4lLPFae1nRe
         i7j+FThWvcYVDHKBc/Jqax8a9FquPxbb4xE2rbMGxSE/jyX/4gE+Isy8BV3OQu69vHKE
         yphZmNfb64V4pq+iQWLkuSiECNj+SStfj5jL2kdnc37BdruM+r5LGNmOkD/tJ34RzJfo
         bD13wOVX4tRYkgVXgroKTNvdNch53Iqdl5saV1QeYV2LnPMwJE/QaTDnAx47lSJlVkPX
         qW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUswyi1xCmXy6LksVhmCY1BjnGn9FAQLBFzSJWgmUZb6by1iK81VCqcnR/Z4ef1yg9ePg3in0lwAxEm0HqE0JEu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Yb7rF5HKBDTzmsBrvdRPU9Fe1PHWkw6bqFsdanL1GEnTXF90
	KVuo9yk4SD/8lZauYwyiqRIWJjkU0Qlltt1Bi90n93+GSfnrzeb0EWj4X71lUEyTX1gRC0Z1q5e
	ctAQzyqHIqRJa5ChAy6ffVJMMySd9+RD1nX3o9dZ8+/juVcdq621tcpywiFNVytLcBodjOxwfo+
	Wt
X-Gm-Gg: ASbGnctjjbLGTnQFFkiXJ1JjPYkvqDS/58ke+LQUnqI0jdUTqXksXzwv3POZGS2HK0h
	gV9NCnZJRPn1eVyB/rnSiDEF7cCHRGH+0dmmKRa+TPJTzjFZxL3bhvq87W2JpkyFWbKeLMtLs+g
	dBt839GshQaLSj1FAeXn90OV6Uf15AgAEsHdEvIqV5VnZ4cCPpZam+puhK/Vrl0Vmia/or4K7es
	vGeiQRMdxqFoGaJza77qn1ijJMLVHBkN4sow0deXHKmMtshrGuIum6tmG8eHtDxN/8NOlJW18sX
	ErgIgVHh/rXHNNuVgKvX4X3i0ty4F/iil+3aAqU4Z+DEdzHkVRqvwGeeQeJvFpfRkfgLIZy5O09
	62vGyaA==
X-Received: by 2002:ac8:5fc6:0:b0:4af:2139:7721 with SMTP id d75a77b69052e-4b0aed6a5f7mr163617751cf.51.1754866027100;
        Sun, 10 Aug 2025 15:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHP5IJU8z9koSl05icwsQuLC7xmNyQP3PO70C+KlxY+wzOdhzlnvRlzStjW1m9tN2vsBSQZA==
X-Received: by 2002:ac8:5fc6:0:b0:4af:2139:7721 with SMTP id d75a77b69052e-4b0aed6a5f7mr163617431cf.51.1754866026637;
        Sun, 10 Aug 2025 15:47:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:47:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:36 -0400
Subject: [PATCH v2 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=2424;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=ndDF7+BW9z3oZgdFS9E606ToKp/Oxm2MLZrOcNPZM6U=;
 b=pM8GpM7PgNX1YsF24F8XlkiAdBklsmNw8Y01AAorZPrlImrF+x3wsR7deHwg6cBB+ANx46J6N
 A3zeH3x5Hu0ChDcu4CSeqRjFPm8eSd0GERqlUeKO53YvLSfbTdxsOMF
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XqnOEOMAd1EGbo1PNghgCdzp7QNDfIQf9zmzoTHnI8g_1754866027
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154709_671857_3057152E 
X-CRM114-Status: GOOD (  14.81  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 79db57ee90d1487b51f4ddadde870a275dd7b17b..0d4e578c8c6a08aad355aa8aa5a1cf75c7d354ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1869,8 +1869,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1879,9 +1879,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
@@ -1896,7 +1896,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1925,7 +1927,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.50.1


