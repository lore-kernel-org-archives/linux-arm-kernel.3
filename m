Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C1CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=; b=gpRFPFcueJbPeAn8F9uReTPSdj
	JV/8irrJEXHo2JxODHFMxC94E3VgSrJINg9i0unNbS9j7G+t9E7Sh6LoU05HNCuP+rPKwZ1KWOWYD
	Tit4ZEFRI8RCZkaU0V5/gYJ7nNV/fVnFOmtnYkG5CqIgITZWhtblrwQXwWGaPcWf+yeuqAFlJ5mlR
	31V5PwYf7YmwM8DiwAj0U9JjZFFwJ8hJz1MshkWiVts/yujBVrkMF7+2YCIUmy/aax1whN54Ryosd
	Tkbuh/1+8C7aDutvTz0IAQ8fGu2opWPUIZQF5F82GndHHW5rKkerIQikycAklu4cs/NlA22qOmBiC
	7opxq7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NJ-0000000GMrN-2wzW;
	Thu, 06 Nov 2025 23:26:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NH-0000000GMoI-1PI2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
	b=DmBJuQk8XXh3rCQtpM7qeMXdBZaotgT0c+Jfvi1JskjKac7Qas0t16iLHizmCslNsemZ34
	YLgIVVUowzMWA6adjm5nNrncZgVQVx+E6ojjvsiEeK1oJwelX0g+myTJhV0fKIBJypO69e
	0HlwFs4wk8uPxSk4pq9Aixx7/fuRYHI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-a0MnFYzXOM20pwg8-0b6PQ-1; Thu, 06 Nov 2025 18:26:36 -0500
X-MC-Unique: a0MnFYzXOM20pwg8-0b6PQ-1
X-Mimecast-MFC-AGG-ID: a0MnFYzXOM20pwg8-0b6PQ_1762471596
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78f28554393so3945776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471596; x=1763076396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIXhuN2h868r2lVLARvPty5kJy7WhDgZbJDR4n+1yHA=;
        b=f8o6mGfGAs2OyKXJEgZ/9IwXN32yzJ7zbequAahNbY7XniH49TeS5CDJRV9IiUFeRI
         5lcv6IpynZvjhyU4kPqsmsbUIB54pI4QDlSLrUjG7tggo4wFfLCZelQAPHptjLpX24Ec
         WnSGCrMTvYdSXN30IfFI+mNCe1ziN+uQnhK4tVJ/ELbueS5JQ+UsvlEGA9juqb0ykO0l
         9IO912W6wZy3g1Fm6E05e2EDjlRuVoS1p0DGd5ysQFmwgBQZ4wjhGn1o/KaxS4TA+5OF
         gFqWavCGJvvL5rCvTKi7TNWLFsXO2SunmeV4TX/kNjBtKfiwTCor9GogrQHrQ3Ao9xMp
         PUkA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bybMUcTS+oGUEwXGuJCJfH9DyLfOyFMltuZGDT2V0KxClAG3spWvHkEeiQQ2zNX32aEKksRznvjE1LJtFgpp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0oAK4qF4YtABpMgpjv+Hlu2bIlIwwHKaYQDkdz69JQ1lj8gGg
	YhNvHagCW46EVaX0QozsH53wwTH/Rh4mgFVo5AzlG/toRyhdUu+EQNgm4cSGXgTC0yX0uXzeONE
	hHJBk2hievy6WinvKOPUHu6+yX6lQy4AT+/cu2HX+MUERaCGvrLwCLqm2iVn7obH2KKGI8Dhfs9
	Xf
X-Gm-Gg: ASbGncvj5DntZM/FzxfmvodCnLwSQpg3worJCHoeW5ff5fXSsOyZJSMWj/EVWt8F6f5
	kbP/jt34rxX6Vx++BGbSEp1U0o5mOqIdf63OyxeW/z0iiktJoeSW0ao+tdLxFme0KgckR8iJy0l
	Sv5jUH3DGsCIilp2ha69+twfORMWwakZs18fEqnaokJQRTqjLp/nU5smBkMpWZwBwY2Ezw1wxdu
	T9hyT56WX4E3uI5iZL0D1uRS/0GrPVN7w5WAJ38/4LW2bGZuX6pq52IFco1UiH4bu7ZC8bwadMk
	CF7Drlm4E0fcawK9i43knPURIti3IVQhxkqt4bdbhNOAGNFHgUXQKGYbE3RXOpReLf5XdMfdNGB
	s2K3N50xvaolqrnIAylgwPC/PxovoGk9lthGPdo2Yxw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732236d6.27.1762471596121;
        Thu, 06 Nov 2025 15:26:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwsDTQJb9qqBYb9v62fMP1IlTO5wvFmMfSLsEpd/QskmRbsWz9CRa2AbIiAewvIcXXmKGXjw==
X-Received: by 2002:a05:6214:1c84:b0:880:5382:ff0a with SMTP id 6a1803df08f44-88167b1b487mr14732096d6.27.1762471595757;
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:47 -0500
Subject: [PATCH v2 RESEND 1/9] phy: freescale: phy-fsl-samsung-hdmi:
 convert from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-1-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=tPB5NIPC9Tahtwhg+nx3O+ru7wuSB+giCQQ8ld+ZnPc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZ8qZ1y68Ds1+V38qKsPZ31ou/Hv9tT5Oq986XlN
 sMCmfTQjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZir8XI8K3jqEHi251Sx7c/
 Yjraoi5f92KzyTYZ7+2Xkg/s6jMsmcHwP/jWullLg5MdIhTUAyNY/z+5IpspNzcipfx2v2sub7g
 DAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MJ4uGjDItfVpNdBJ2LS7w7VkkaD83PLTAYQM9ODWiUs_1762471596
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152639_439778_27693EA4 
X-CRM114-Status: GOOD (  14.95  )
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
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.51.0


