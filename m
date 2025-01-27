Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74384C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2Ji82GDu0qEHZkiYbmz0Eb1XpkbUWFD9sNNEsdWqqg=; b=paiHnhfWalrZHWvSZhfhRlETMM
	blty/fkH7Vz/Nc9WK0bO/yCwhOFI90SAqafJlbxpivOqzL48zL27Bxq5u87QfDxfaRMIW2GohEVM9
	vjf/lyrtbiUjrPEBOF4TUkbCrKsEng0pm8mF0nThVgO8AK2P3QdqFZIpAaXp6yJSSqhGxglUD0+0q
	3DTFLFvXImjlLzkRhgoi/QiJCyW5FuGg2mjNl6oy30AJnQ7znsVIQ9rVKS2Ui3IlRuIILBwA1H3sQ
	JjsllcSqxPXVKJrvcl/NJrpFIpv4fqa8goNW3Pc70agqdAiDrMzDgrmAPn9j77SOiuLOPr+A0lPHR
	qS2Q0T0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKZk-00000001tv3-0dqN;
	Mon, 27 Jan 2025 08:34:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKYK-00000001tkn-3aft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 08:33:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2070153f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737966782; x=1738571582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2Ji82GDu0qEHZkiYbmz0Eb1XpkbUWFD9sNNEsdWqqg=;
        b=axCnA8FXfPC8dr7w95qCVyUSH5Wvr73kG4fPFpbazDFQe3mlXg5fJ6/nVK8hgAJy8H
         2lt39UN4XYDbdCUCt0CgupEIc4REgMhDKpEWobsILx0Teq/NLs7zuZoDhoXitjW7099z
         8gd8CyHjhswwQ9uvNecnF5xudWFqPngcuUk/9DNQZCs/GR2OzWzvsGsxzGrlgNJfUC3X
         6xqMlkYs65daJTQCXOApU0re8Sji7QLd3YUzZMIilt0jY64rTwLDeA/XJsgWx3W89AJF
         cyYbTcWdnWShgJ1/JJYrLu9OtcF8FjJb/5lQ1vfzV4ekU+pXaVcFcJe6irEviXNNjkpv
         jo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737966782; x=1738571582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2Ji82GDu0qEHZkiYbmz0Eb1XpkbUWFD9sNNEsdWqqg=;
        b=J0vWeBOvpbMwPujjrSPQlGalK3C9rSqqt2fz1t1XG+V2ZRHcDC0UKKGbmplns34HPt
         vEP/q1/KAalKW6VoQgQm6YYtjjXmx2PkVs2XPA+iVXNBwypXeR9huFWrb85qbtRqEk1l
         Wm2pwRM3wwyqOF+Q0c0ylje5uet8XynSo1Ccnwj2SRqS/njAFE0wOa07cqug3GfvkHnM
         DCqlGvGLoUjw3xcenG2AoJ3XXFHIlj+JhvFlUgoNCfRy+a+YTQuyqQV87HQeNYOPfwzT
         PYkySY/fBs4M3xTloBDe7llNARg8lkaaKxrh05wgEwOHnUWB7aNcLBWMhnVPsSOmnOEA
         GAmg==
X-Forwarded-Encrypted: i=1; AJvYcCUmP2T1hlsSHa96Td7zHXHYRjpUxTdoWDVj+aZo+rEd72mMAzCIiRJUvoaIXhxTX3F9/LhPknIppFOQAYqDBdtM@lists.infradead.org
X-Gm-Message-State: AOJu0YwD09Ij/FHrpdQKUFf04PfHDA347oRNbbSWFlucdDkKbxzx7zNI
	ZVHdw3T6NMp9qnwTpzhW793Fn1n60ZsXDVGwYHrFjr1hEb/N+NwwmYwn2uIXKKU=
X-Gm-Gg: ASbGncsTY2SnxTb+4kOyfi2c+73pSz05bEwl3djONkvZLAr238FYiLL3HHALAmMPqvh
	kF5k9PKTktp+7yiYhZWQxLnEfms/cp3xZFApxWQPwQoMQemFxxjcPrGUA85eP3ylSbXVVFVz1jO
	nyWCsBGgWDgSvHplgB2nthsYpP4/iy079viNrWW79eIaDVxTjeZaMFLxLpt57O2cunjjWxjVUJB
	PDZiM7Cr2WfLYZHEY7YjyPJ4en0TIs+0HPJqLPIheFKQ6l0ycxzaYXMF0NJbBZjusIpwT1gjOkc
	E0BQf2xOapu0
X-Google-Smtp-Source: AGHT+IHpMIbXH/ROA6dm+Hnrzv+rG9utZdsejuvQ4p2UjcOm0impQgdG4YV+X768DL8GecEbw47bEA==
X-Received: by 2002:a5d:588e:0:b0:385:faec:d94d with SMTP id ffacd0b85a97d-38bf57bd65bmr42270165f8f.51.1737966782251;
        Mon, 27 Jan 2025 00:33:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb062sm10322276f8f.71.2025.01.27.00.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 00:33:01 -0800 (PST)
Message-ID: <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
Date: Mon, 27 Jan 2025 10:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
To: Jonathan Cameron <jic23@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
 <20250125121826.6abbe7de@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250125121826.6abbe7de@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_003304_898872_042DF43E 
X-CRM114-Status: GOOD (  22.76  )
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



On 25.01.2025 14:18, Jonathan Cameron wrote:
> On Wed, 22 Jan 2025 11:29:19 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
>> Hi Claudiu,
>>
>> CC iio
>>
>> On Fri, Jan 3, 2025 at 5:38 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
>>> the junction temperature. The temperature is reported through a dedicated
>>> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>  
>>
>> Thanks for your patch!
>>
>>> --- /dev/null
>>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c  
>>
>>> +static int rzg3s_thermal_probe(struct platform_device *pdev)
>>> +{
>>> +       struct rzg3s_thermal_priv *priv;
>>> +       struct device *dev = &pdev->dev;
>>> +       int ret;
>>> +
>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +       if (!priv)
>>> +               return -ENOMEM;
>>> +
>>> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
>>> +       if (IS_ERR(priv->base))
>>> +               return PTR_ERR(priv->base);
>>> +
>>> +       priv->channel = devm_iio_channel_get(dev, "tsu");  
>>
>> Given there's only a single IIO channel, you could pass NULL instead
>> of the name, and drop "io-channel-names" from the DT bindings.
>> I don't know what's the IIO policy w.r.t. unnamed channels, though.
> 
> It's supported, so fine as long as no future additional names show up.
> Will just fallback to index 0 I think.

If everyone agrees, I would keep the name, too, to avoid complications in
case this IP variant will be extended on future SoCs.

Thank you,
Claudiu

> 
> Jonathan
> 
>>
>>> +       if (IS_ERR(priv->channel))
>>> +               return dev_err_probe(dev, PTR_ERR(priv->channel), "Failed to get IIO channel!\n");
>>> +
>>> +       priv->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
>>> +       if (IS_ERR(priv->rstc))
>>> +               return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to get reset!\n");
>>> +
>>> +       priv->dev = dev;
>>> +       priv->mode = THERMAL_DEVICE_DISABLED;
>>> +       platform_set_drvdata(pdev, priv);
>>> +
>>> +       pm_runtime_set_autosuspend_delay(dev, 300);
>>> +       pm_runtime_use_autosuspend(dev);
>>> +       pm_runtime_enable(dev);
>>> +
>>> +       ret = rzg3s_thermal_read_calib(priv);
>>> +       if (ret) {
>>> +               dev_err_probe(dev, ret, "Failed to read calibration data!\n");
>>> +               goto rpm_disable;
>>> +       }
>>> +
>>> +       priv->tz = thermal_of_zone_register(dev->of_node, 0, priv, &rzg3s_tz_of_ops);
>>> +       if (IS_ERR(priv->tz)) {
>>> +               dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to register thermal zone!\n");
>>> +               goto rpm_disable;
>>> +       }
>>> +
>>> +       ret = thermal_add_hwmon_sysfs(priv->tz);
>>> +       if (ret) {
>>> +               dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
>>> +               goto tz_unregister;
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +tz_unregister:
>>> +       thermal_of_zone_unregister(priv->tz);
>>> +rpm_disable:
>>> +       pm_runtime_disable(dev);
>>> +       pm_runtime_dont_use_autosuspend(dev);
>>> +       return ret;
>>> +}  
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                 -- Linus Torvalds
>>
> 


