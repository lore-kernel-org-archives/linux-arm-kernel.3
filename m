Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGuh2UpFaa2uhSTti4wLTQGn5xlWBin8bdkOwKV8rOc=; b=X3v+qPA2l574j8IjFLf8L9xxLn
	v1Ql1fewnfQ/hj8JYFHaZ6XeKDKF2PKb221J70t4SVtOyLCBRrMoydW6LvWddR4P50mypCTVHZTfB
	mB/QciF+SQXbGe6nv/LFTdRriqUlbiMau66Wfq60cbwBKXCsfnHTl6O/H1byLj7uFB4EJX3Je46Ye
	Y2K/i5cuTypWr+Nqjnu8mNH6VDBeCGcL8aj8sdzx2Dpoov4PGKKs2LDWJt6puuxRSSO7z0FX3YEaL
	jbtdSb+hSRAQlnMuTv6+R0+qaunaTS9rvDMVwRVRQGVNrbAsBJgG37VeL7wHm8Rp1EtK0QNje+2yE
	NC7vqDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ6z-00000008kzI-1YR8;
	Wed, 12 Feb 2025 20:13:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJ5Y-00000008ko1-2yoA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:12:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f20fc478dso15225f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391123; x=1739995923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cGuh2UpFaa2uhSTti4wLTQGn5xlWBin8bdkOwKV8rOc=;
        b=tFrGSiBHEGaBiMX8c4zSkuteAbCAWsYymyal4q7v6UwCKpQxmNVatC/qysDNEYJKQd
         /H336KRYYanjjAy5NAAtMyqsitm+cXmEbdTnnVl2DA3LTiUnb86n1Mu1Cg1hQ86g0U2W
         1SWkB9zAI/XUKHg9hJD/DEQ4ECNae8UKuXCQNVPuAzLw+xWjexGqqJCZZIeA/0aSu1qq
         HVEBvCdAKv2tXJS1ZHqY+nrFKQLGPpZsh8yReug9zIui57XIxaDMHeOfEFQCIcJ56ODI
         h7CojQJNK5lnaFlsaNSoH/fOeXb5T7Xbuosw3a6zffTu6QlLuHnA/GlqlOU70740HFYW
         IjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391123; x=1739995923;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGuh2UpFaa2uhSTti4wLTQGn5xlWBin8bdkOwKV8rOc=;
        b=CgTEPkP62L5U6JPRg8n+GZEux0wBQFRa0Xjhov0cCmsXwcTSj8+bRHYuIhfBTx04GS
         /FHStas3H/ZoeYew7xdFz4bMvLq1VRzM9zsMJ+JvGRsoVQx0pxoX+RMKRy6Z5XDCRgQc
         3hm7j2YX1s2pxw7EHpSQ8fRi201DtNmw5S8jOVZFyLD3cA9Xyzvg4ha2GpXyh0v3nbZX
         nJJqkTnUXXaKPCJJstNkgxKdOYZcUHPN7LAHa4bgGidNBcfUyB/M5yRV1+tfiLPbZVX8
         1JpNQNkHJHe+oOONLDdG0l04c0Ir/GqBRSsGQD1bqA5iW4FApVzGjbJB4Nr0bVn+mu4l
         QiCA==
X-Forwarded-Encrypted: i=1; AJvYcCWvqBNmy2KtuRflS7RDAid4n1/t93of2aPLiX74Jx39wDfRWAlExc+gwush6uyR60lWs9VW7RhU512yVVb3AzES@lists.infradead.org
X-Gm-Message-State: AOJu0YxVwPxPk2WaKc7tPNOC5uutAx+5x3i52ZfRuSTg5uTR0bWgopfM
	fXFUoXVwVqmGZKuQKXLvbNU6eI3FDbYcBbiDeGWBTXHlCS7ph/hBdmSMl9S2dww=
X-Gm-Gg: ASbGncvVZIE/6UJEixtVdxGGaL2zk/A+u567vTcBy2eNgGK3OkFLzfix5TcU6pF5RVR
	vdkAkgeZV5y9A9T0kbesfV43d1Ecg8s7wiie+40TrMJIkBWYzD+ccKxxPzy/nV0cUSKcpTVzOjy
	NDdmcAZt7aHHZYdmg5cNQMlJXpVyo75tFueoXX1tQeOMYHGYb+aBxC/P9fOV532gdqLz8NzvMzH
	f0vxIR2H8PKJP4UKrJ5SktPvb4mIH5TJgBdkCqZLGf4pP1ygzG7NDif68CyyJbufpiiG3IaL+7b
	87YB9KsSZJwZcBMd3g+ooVt7mMu2xc8yeEo=
X-Google-Smtp-Source: AGHT+IEfGn9LtFHGk0U8Y+QHBiuO20iTGGl0VWaOwFT9tOI69q9FhNUAIo2hVt9dHR5dTGoa1omXSw==
X-Received: by 2002:a5d:5f42:0:b0:38a:9118:c09c with SMTP id ffacd0b85a97d-38dea3314cfmr1510971f8f.11.1739391122959;
        Wed, 12 Feb 2025 12:12:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa6f7sm28927165e9.32.2025.02.12.12.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:12:02 -0800 (PST)
Message-ID: <416d75fd-40d0-45d7-9590-0322abb480ca@linaro.org>
Date: Wed, 12 Feb 2025 21:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-3-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_121204_757913_ADC80D96 
X-CRM114-Status: GOOD (  15.73  )
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

On 12/02/2025 20:56, Sebastian LaVine wrote:
> +static int imx728_detect(struct imx728 *imx728)
> +{
> +       int ret = 0;
> +       u64 minor, major;
> +
> +       cci_read(imx728->regmap, IMX728_REG_VMAJOR, &major, &ret);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!");
> +               return ret;
> +       }
> +       cci_read(imx728->regmap, IMX728_REG_VMINOR, &minor, &ret);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!");
> +               return ret;
> +       }
> +       dev_dbg(imx728->dev, "Got version: %lld.%lld", major, minor);
> +
> +       return 0;
> +}
> +
> +static int imx728_reset(struct imx728 *imx728)
> +{
> +
> +       int ret = 0;
> +
> +       // Prefer hardware reset if available.
> +       if (!IS_ERR_OR_NULL(imx728->reset_gpio)) {

Here can be ERR (although why?) but...

> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +               usleep_range(1000, 10000);
> +               gpiod_set_value_cansleep(imx728->reset_gpio, 0);
> +               msleep(100);
> +       } else {
> +               // Software reset.
> +               cci_write(imx728->regmap, IMX728_REG_RESET_0, 0xc3, &ret);
> +               cci_update_bits(imx728->regmap, IMX728_REG_RESET_1, 0x1, 0x1, &ret);
> +               msleep(100);
> +       }
> +
> +       return ret;
> +}
> +
> +static int imx728_power_on(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(imx728->clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_reset(imx728);
> +       return 0;
> +}
> +
> +static int imx728_power_off(struct imx728 *imx728)
> +{
> +
> +       if (imx728->reset_gpio) {

Here cannot.

> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +
> +               usleep_range(1, 10);
> +       }
> +       clk_disable_unprepare(imx728->clk);
> +       return 0;
> +}
> +


...

> +
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);

Just use guard. That's actually perfect candidate.


> +       if (imx728->streaming == enable) {
> +               mutex_unlock(&imx728->lock);
> +               return 0;
> +       }
> +
> +       if (enable) {
> +               ret = pm_runtime_get_sync(imx728->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(imx728->dev);
> +                       goto err_unlock;
> +               }
> +
> +               ret = imx728_start_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +       } else {
> +               ret = imx728_stop_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +               pm_runtime_mark_last_busy(imx728->dev);
> +               pm_runtime_put_autosuspend(imx728->dev);
> +       }
> +
> +       imx728->streaming = enable;
> +
> +       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +
> +       mutex_unlock(&imx728->lock);
> +
> +       return 0;
> +
> +err_runtime_put:
> +       pm_runtime_put(imx728->dev);
> +
> +err_unlock:
> +       mutex_unlock(&imx728->lock);
> +       dev_err(imx728->dev,
> +               "%s: failed to setup streaming %d\n", __func__, ret);
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx728_core_ops = {
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx728_subdev_video_ops = {
> +       .s_stream = imx728_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops = {
> +       .enum_frame_size = imx728_enum_frame_sizes,
> +       .enum_mbus_code = imx728_enum_mbus_code,
> +       .get_fmt = v4l2_subdev_get_fmt,
> +       .get_frame_desc = imx728_get_frame_desc,
> +       .get_frame_interval = imx728_get_frame_interval,
> +       .get_selection = imx728_get_selection,
> +       .set_fmt = imx728_set_fmt,
> +       .set_frame_interval = imx728_set_frame_interval,
> +       .set_routing = imx728_set_routing,
> +};
> +
> +static const struct v4l2_subdev_ops imx728_subdev_ops = {
> +       .core  = &imx728_core_ops,
> +       .video = &imx728_subdev_video_ops,
> +       .pad   = &imx728_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx728_internal_ops = {
> +       .init_state = imx728_init_state,
> +};
> +
> +
> +static const struct v4l2_ctrl_ops imx728_ctrl_ops = {
> +       .s_ctrl = imx728_set_ctrl,
> +};
> +
> +static int imx728_probe(struct i2c_client *client)
> +{
> +       struct imx728 *imx728;
> +       struct v4l2_subdev *sd;
> +       struct v4l2_ctrl_handler *ctrl_hdr;
> +       int ret;
> +
> +       imx728 = devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNEL);
> +       if (!imx728)
> +               return -ENOMEM;
> +
> +       imx728->dev = &client->dev;
> +
> +       imx728->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx728->regmap))
> +               return PTR_ERR(imx728->regmap);
> +
> +       imx728->reset_gpio = devm_gpiod_get_optional(imx728->dev,
> +                                            "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(imx728->reset_gpio))
> +               return PTR_ERR(imx728->reset_gpio);

So can it be ERR after that point? Looks like not.



Best regards,
Krzysztof

