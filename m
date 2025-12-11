Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E1D4335F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=; b=O5hR0cujlm/wWSrJ6gzmh1tPEw
	BPYwtyYeupZXQJvOW8I5Ya7/a2LG6H8xcbIrMBIzfY3GgCbiClyNbcRnHv20hQlbpopM9UQTME2oF
	26MI9WG9+d5JlU+eOGzTdUfviLwAaUgb8P6Xm9GPNstxZVHUjEKfP6XCktUkOv4IYzO1CSaQJapPD
	3CpjE5BaWafQthIpj/4OO378QWWPg+VlvVboypTdD1MM5Rf0xReHZMXMskWWXVXvIdwbJasOdmqNG
	DdEZ9qSZop5ZW4H6ypBIY2haFJh4Rlxcdq64Ii3Hpg6n3a/ALPC9/k7QQXmPul18Lez9N+9d4Ym6a
	U6eOuInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpus-0000000HPP5-1irF;
	Thu, 11 Dec 2025 23:17:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpum-0000000HPGs-1WNr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
	b=BYDHNO6cji9UF5K06vYu2iGM2W7Dwi7WJhKHV0EVlDpoOJ7NwLv9UhrP1QfaZRPllj8HhE
	msJWDH8KhSNUi5JMsJMd6uGv592I/sGCqpz447XtKbEXkx4P3iaOOpM3yDtYf+IUX71L+d
	CBke5HmQDH9dyXfKDAGVVtfmdojUD+U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-4VZ8zKOwO_SgcO308tTxtg-1; Thu, 11 Dec 2025 18:17:38 -0500
X-MC-Unique: 4VZ8zKOwO_SgcO308tTxtg-1
X-Mimecast-MFC-AGG-ID: 4VZ8zKOwO_SgcO308tTxtg_1765495058
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b259f0da04so138596285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495058; x=1766099858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
        b=DS4kGzTbKbxN0+F5hwgvGY9PYqA3BW4e1oYATfJ7ebqztkVVHfrJzx8LIjxiF8Kf64
         7ek8ihLDC6JoVkNN1cnnqoGT1WQe2BtjDOoVZEzrOb40JsDw+74HsEhwjl9LIiA028uE
         zaWH5hrJ/jLJXTdklcMV1/wEbcfe9l61KVLM8/TK2eDM54cw/gzsi61gcI92MnO5mkLU
         oQrOJYmP0zslid+wAZKQgx9bMzscs10wodM/2e/M3bYAufY+b9gp5ktusa+5XKd7Y+OZ
         5FX25MoLUUSQluqO+5GDG8kMDc9btDTe1yJaikFz5MgESKZiry2ZUFpMyBZDoo1a1InJ
         0rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpnC/4S6wyIP8broWn0/xHSCqV0TJ6XGZxLEYEUCnAeEWMvU/gqBScKGXKOi10Bkh27VEQyuAFc3umbcfN1oKB@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFJ9sdqZkdC07em3P6a0TBsnjEC4CzNLjkLKG7ETfGzeodKv/
	XN8wK2OwFZb5ZdR8RO+8GhRTu8cyu/2FWKdfFqpNp9vjfoE/uCJ5mSXWNh7CiI7s9fl+67fEmlu
	/GHrb/1NvANG435cfVaND5YwiRDhInAAV3Bt+A41HqvXKjn0WBShgYHdaMX8TFU4PPNDMp7DYKO
	Qu
X-Gm-Gg: AY/fxX7Aq3EoWn6UP37REyEpw0aywrjaHZYHJtQ4mU4VsAhmbS7gDAMuaHdLb6CbkDE
	BkCF4GvAmnMXj/v0uRrxSX2xMPnlyvCvTlXbR/AQyOuwEgITcPOHM99XHhyXLedaxDi6aaNv31B
	n5O17WspClRV4S8aCc7v6/ZqjuUBiMI/Dae8MampkP5KYAqGNwnY0eUbsgJ6LrW9JF7SkW1+4DH
	cRg/hmInePWvaqrkekVNDuDefdfkKy8KmpYObx8+saVlAOFZ3mjDgi/fn/3staSvA29h1p3QVD0
	GTPCSH1aebSn3kX3JHz2vuYLOssqxAiXk/xNafUBHDX1ZSELZ9eGmauGQLlqDN5woi2mS1/9CS7
	sslgGIa+cbOKH4DCxh0zHbMnIjKQ3zZ+KXzDI8JshILjozOQOsuA8xg==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24779085a.61.1765495057882;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ6MyvatEvjXLdrucEm3djvv+DCSWYW1g1m07kDWXIN1ABKw8EYPVfgJJ5sUpqpKlTIcYAIw==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24775285a.61.1765495057473;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:26 +0900
Subject: [PATCH v3 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-8-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Db9NFuUnQhQu9U41X5Z8TkxHRghSnvnQHsnP4RTW7s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tv/mBQ3J1ntD97t0PtZ/sXbDtX8XDgquXTd8ZR
 upqaUakdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRI7UMfyW7Kk4WyCmZJybt
 XVSS8SzsoeutV4+lLCYXcK7IPTTpxzxGho2HvrnXvlrEFdS08UIvr5StzpeJsWwOEuUlB2Zv/XN
 BlQ8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zJHe58SWqOCpP4ieayfhHfBW6NPN5w0_OmVZg3qIz_4_1765495058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151741_554142_BC4D1F54 
X-CRM114-Status: GOOD (  15.06  )
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

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 29de2f7bdae8a31958e31b0a64281532fd76e64d..315ac97f52d8af6d3010dc87788575039c7a6b40 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1870,8 +1870,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1880,9 +1880,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
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
 
@@ -1897,7 +1897,10 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8, hdptx->hdmi_cfg.bpc);
+	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
+					  hdptx->hdmi_cfg.bpc);
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1927,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.52.0


