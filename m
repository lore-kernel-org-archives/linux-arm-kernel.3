Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC8DD43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=; b=B6w9Mta9CyhFV2Dmtm3fShzF87
	GZKmEbuwqiVBrxq0fQ7Dk70ZJPyHgk/Z0IJPwdYhchlxzrYWi54TPjYRdi1zLrvAkeZqbJxZWfHNz
	2aJO6fZmxgvtNlb9nFZ/aW57q7CZ61yoAQBImlWcfstAUfVUh+wCE/J3700sZcoAmme0SElThWgRQ
	6UnRYRo/QbUBZU57AS3QfXR3unFtfC0vMHMJkpsJcnPci5LuWwA0oPDAf72zV5pS2H9dl+QYVdvfX
	8OutKku4FfHxtNdGWj7vjqWrMMzAlAOKcFRbvtdmfhzwtHZqtKH1wb4YQqkzsGFRuuwm9cEKfi78M
	7YdKBGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpu3-0000000HOQX-2GhT;
	Thu, 11 Dec 2025 23:16:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTptz-0000000HOMJ-3C5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
	b=EBdADGQVuZNw5Rv7jRxKktxqGSaTLh/Y8nR0vNicc8xgarY3vfYxgs2r9UDsBuWWZDx1+q
	5h+45LwnWBViIvY0y79d4gRCv35jy+cddMkKTPdaRRhki4w0+ZRqNjN6C3yBl8KmNIs7rA
	vlcIGjgbw2+zfDFH8HEg5tCnl4rwOX4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-nDnxfO2vOGmaELVm6yhcDQ-1; Thu, 11 Dec 2025 18:16:49 -0500
X-MC-Unique: nDnxfO2vOGmaELVm6yhcDQ-1
X-Mimecast-MFC-AGG-ID: nDnxfO2vOGmaELVm6yhcDQ_1765495009
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9ff555d2dso162709685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495009; x=1766099809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
        b=Z/5dW5RqDgD9zZgnlDm05soG2moBw4adSjjDR5k8llqcEp7UGax+Kcj9XIoX/3ty9d
         ztM/hPpQRzubV20zY4QdJjC7J6K7rvIf/oD28mmLMpAGaPaBGe4wMUsoyfMXlCbF7xBu
         lynzvT/JzawVx0cuAFgsNJiBAiZyPZWmKJ1ZOdLPhjzaNxNocQzHrwiRlho+LHk8hTJo
         UAeZRfE71IvsbNY+ViH5vl1yJeY1S19S/Nqa84YBHgjHBqKCBECskkGVPn56CohiZqyF
         39CXjQl/z6NTtmPNdQ1n+c8PKTk48YX5xGtnbHpoLNj4Ix1v0b1uw8okkpVujo8I6jyS
         pfoA==
X-Forwarded-Encrypted: i=1; AJvYcCVU5uxz3meyMIC6X/es5RMJtN6+yifNG1/voF4GogTOxFfIhr6QgtIWZjOHiRwStPMg4dE1j8wXj7oeTBKTpN8h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+jrQbgsEz/mH0M6bpaMTnbVVvDesDZNVTIxiNZDqDYSeBbEvK
	asCYb6uuXpspSsS0x5c4YqlsUNfpgmSgzgTcDvxbMpcja0+7rab68QiUUekFUqe0e5/lxPQ+hfv
	Kny0TUHLlKWpoDi2R47tj9mj1KMrfjn3/QzJS0xsLzsOsZZiQtICJge3WmK7NSpbmgh2oQOXi8+
	cO
X-Gm-Gg: AY/fxX4GcUrzmjavV5kMSs4XmJXWp2veasdDiGzUz8YSLXxwUOrBcCTsdHkvwQag18Y
	plxiUP07UkA7kH1LnDLKmDtVjc/OP2FWry0fOQfiw5lJB01e51bR0RZ8gTu9krFzXclcXD/RL2P
	ZizKN3408ERd1vb80Vab8Ebv8VKkYGBO6i+C7CtI5RkxTzSVCZ+bnbi4HEwwfIfa2QK8H18gkYi
	qnz6YAg6RwKMC+UXAPs0K+1uuhXzWJjNpgRE4YbOju/eiOv8ktbdSwfSwnwsxiPD1Si3wB53eGV
	yK+k7IGRWnstYpmkzhB6Tiz4RiwDN2CYrqeyLn92W7wrOWQxsTVcGZmFchdm1k3600Zy+sbhJQz
	/L2dq7n+PvvNPeoXRX6rwlVbF+wPm03Zo1JYJjpScY3YapTWWQaz+/Q==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34767485a.61.1765495009130;
        Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzGfyg51QMkMX0nb0URo4omcvNBrodsNtcYzQ6shcsy/VZXilk5dO3Eb+B70Ty3ot1LOtMJA==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34762785a.61.1765495008710;
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:19 +0900
Subject: [PATCH v3 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-1-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uyarQyJgmaEeLScoBV74B9PZPRT2iTzM/dIYFjpbgc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5OubvRVPFUzMfglqvZrm7+AqavlWs+rWrUvSgqu
 cN+ieikjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyTYKR4YrlqZuHA698WfRY
 zW9m18O8n8eYZ8/9E/SH62Giq+E3XgFGhj3SJ5lOVnSoTmeLZfR5ljSpR+/PukrH6l/eIWKHHy3
 JZAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MgJruq6YHPczRcmKW__Qsw9hAlJ3gjEaGuha9njuBzs_1765495009
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151651_863187_8A91828D 
X-CRM114-Status: GOOD (  14.20  )
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
2.52.0


