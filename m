Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D19D0E6EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=; b=ZHHcB+fUIG6GDqqB0GVxPxNAK2
	ftRRvpesCwhXZNwyAfsJshvp5O20nwCz5KqPkcdoUFcqTIxtIl/taxaAfeUsaraQ61Jd7xINVeVO0
	5i9qqqz+icJOQ0LB52ydqT3mkbGzjALS1S60+W/63ScxWArHM2lkU7V06qO/AvZl6GXCaL9Ace5Ju
	7zcxJDFJm9rzFQ6+9ZTxAgRQnsx1S6rsRshYpK/XCU2B4jBV2wRtlE3a+Sqa/zMrzm5qqD6/UK7//
	wE2oV1TV8DkjQDUzV+1ekBmzUv54sSKH346zeMDekuNf5lddbQBOpbNt/jsWzxuZbUM9GQhrU4mUk
	8/kdaQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtTL-0000000DNTb-1AOu;
	Tue, 25 Nov 2025 13:52:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtTI-0000000DNSN-3JgO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:52:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so39551585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078762; x=1764683562; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=CbGk0s1gTWGT7c+8Bl+TTLGzmimz/PfkkZ5bVZxY/w7fCeuEqkeIidPNjTG8u2ck7H
         ter5MYQHcjJNGF0AkFsA8mAxKtW7Mhr5GRkmz11+rbx+sjCGuIW6FxT2c6EVS+PoV+xt
         zb+zwepR7akvL8XpIkz8hJ+3zrIJT36jl1p688rBiDVdYYNOVf7wXsBt1JP+iij3cdrV
         JemvWldubA46PE1wM3tmGbO+Ss6MO796qDpPAmf36dSrgODzgZxSrwYaGk3GmMUd5SWK
         /rjxxJlZDhLlFi6NgI2qu//V2M891gVIsXsiYftBoK5rfINb1aNuZzRiypMM98Ee2U2P
         Ui/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078762; x=1764683562;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=mXCiuUEyGzBKQMy9R/DsIjiaXkeau+5n8d/nWpgrBApQPD84tkMtQ8bmCoX51O57W6
         7J/b57WPJnIaqdS4n6Md1/znK2m3W4HJJctGKyEdinUEWxRJt/B6SPQj9+y+yY3w6aMe
         liIvSTBCk1EGXOJAtqrhyCLsxfncw3fyoB7PY5zY06UXUB7ohj/+TrFrmwpkEU7yHBtM
         hqqhG4D8o71zgQzX2lEteCt4/KKguxiixrqpHeFrQtTf3xB6RjLVHmP4nGgLEAqX9g1O
         0WWuJbaub+PqPettjLzfLlGaz8vO9SZxXN1x/O2a/jxE1TZLgW2oJJlpX6CUCj27869e
         wryg==
X-Forwarded-Encrypted: i=1; AJvYcCWvnr2B3F7RRoY2XIxaTIIVcMQ52N9B6zAvKGJNQ2eaU4GjDUGvh5aDEWpNCvN0TvPzlnCgEi8AgzrNbmY+6hPz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvrcbgmm3896dLZxTarkPa5zUUgAz37NZdAm8JdwKGuVjGmDyM
	tTRNIKbgVEZP9O5ug/SkMeO+5bY8zNL7978A9/x6QtZJRBjUvprUF+FxJ7xYUOE39xg=
X-Gm-Gg: ASbGnculcUosIPfEBUp/6y1r+X2Uphe9rJsXD8E2tDdi93Tzr7rjdeRGToCGOPyMQ+u
	+hCfYm7/XRga/gpexjvingKWjHKUH1eKQNlDBskAt/fy8W0wVVPjc7WeAPGns2EDmTte716hgsK
	VrwvtBbIPvD4GDd4+nMDqbtoCbVZ2berkf5i9Sz/hvAysBpWMCPNT7vS71J8AauOGSBX1prdCYp
	cFVx+pSXF0nWifA/7v/GzJrYO9y6XzYnFI+mRfQbLy3m32gcwuxOGYdFk5IJ5N45FGEBV0TkdqF
	7xYKmiVcYNgNYSaRPZ5b7biFPA3lNeUOs/BALzOOYP/2ZH2kTLTlVbRtN4dQGOgh0eqHWWeWxA9
	V2Kl1DZP2697HMWq4FPBe74QprGFPhJIj65y4dpEM075WXgsyRcyNaxcrv+BrGQUc+Bgj5GyUQc
	IzxDmJSa4/X48K951I
X-Google-Smtp-Source: AGHT+IExMFPzaEj2t7R/V1HwC9wLFLjVdHnT+Jc3arjZhnTf+cI6vhU+qt5I6EYqSjZLnH2q9pLpiw==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr24955445e9.1.1764078762464;
        Tue, 25 Nov 2025 05:52:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1f365fsm254495315e9.8.2025.11.25.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:52:41 -0800 (PST)
Date: Tue, 25 Nov 2025 16:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
Message-ID: <aSW0p5sqnJVJsqDO@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055244_843381_C7EADFC8 
X-CRM114-Status: GOOD (  14.71  )
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

The platform_get_irq() function returns negative error codes on failure
and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
the error checking to look for negatives, and change "hdmi->irq" from
unsigned int to just int.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..bd7f8c56ec9c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->irq = platform_get_irq(pdev, 0);
-	if (!hdmi->irq)
+	if (hdmi->irq < 0)
 		return hdmi->irq;
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..7a644bbf5843 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -168,7 +168,7 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
-	unsigned int irq;
+	int irq;
 	enum hdmi_hpd_state hpd;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
-- 
2.51.0


