Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgermC1KnnvFeBi+HFB4kuvSBtuR8pO8/HIDUgPUHKg=; b=wOMNGH30MPXUfzHMhSE9Xqxou1
	jszKt10UESrN1H3D4f+owZwIkLK+g0/RFKT1BF8KoCaymchaX8EoazAJcfDaIUMzpp5LhqkQTW/T6
	IBy3tcUQAFL6jQTtJmsqR/xs+DxmFgyOJlcUad9VVjt+wFIDNCLcgIGpWRtxRp+7mSU+dZqzUDOdw
	t297sYqWK40nXky8AwIw8DnpBZPPaS5eY9Ce1T6JcQwsKJQpp6yVvVzmUfIr+9BMbrIZ8AtA6pYkD
	fraZCu14q9leRdJioQf54pu8PYTxi/k76Q9PdrdWjsDJrmHdtjYB7yfrrXTqPkDUh+JdVpvpa02sm
	gHuinfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7L6-00000004TjA-1Jd0;
	Tue, 07 Jan 2025 11:01:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7Jr-00000004Ta9-23nj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:00:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4362f61757fso152636715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736247618; x=1736852418; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgermC1KnnvFeBi+HFB4kuvSBtuR8pO8/HIDUgPUHKg=;
        b=ZIQRtytjuDB++e0UoWS6Y7AQp0iY5IuE9NepZxmO5oPNrmdtXGNLyTboX7cvsXowOO
         2HsYRFzPY34Jia46WWV59SSugNkl4uajZYjAqiGkl+RCLCzHu0FT5V1ZGGJD6BX2j83r
         AtmcPBbd/Qjkk0pvODvI1Km23WdNm/TasFZD/88qhparIkl7sNXphGw+QOAH37F1VbfS
         yNgTzCBXaylwJ5ZRhvRB+KYU96K5j0psEdDcpOmtSqz85b1PmZ218n+uzvO8ymxFrZIw
         6PmR2i1cwgp/pIp4RqglDFPcp4U97brt0ZP3khD3Bduct0/0hx6y7BM093WXr0iXCbWB
         C7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247618; x=1736852418;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgermC1KnnvFeBi+HFB4kuvSBtuR8pO8/HIDUgPUHKg=;
        b=IsWfhctsOR4Fm/OHBuNuVFHTsJnHVq0vPraeQRFh8kRuwEIW32jBe5uFmUdh2gZvyF
         bIwrkC0MSW3o1k/wco4C5An6FWTxSwwZ8J9Z9DdnC7XGOXjnN3mN0lT7bOK910qCT1ao
         0TbJl+PmXD8KjkVeHKhYAvS3Ivsn1yeAwVADy/x+T0xlfhvAggCmYLLV7ZxbQJ6uTSMR
         Vv6iENE/13YgWij+raWNFPj56BgZCZ4xnOLkqKQUzdlwMuIJGUC978eo8bk21n/4n1wb
         xXZ3nU6J6WPd2/3u+GbVAK2OASr8G8KcGt2rkBfimgQlWRu6xJqI2cAOum2+yPOa2QmD
         tCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQQp4+cvI2cWv9bI00U9orVcPPTb9lI4xQd6SGqIea0XTiNr5TdeJdGYLoh9zxVohKxJnpr/yf/bYIcpP8mfvn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2nmWoQCImImJ2B2Am6XeLQgXqsk4hltDnTDSVtUl7SXGsHXyD
	U7ACiDd5SkhYmXenqrlQzYqWT2fwImonN7bGG8XhfDTnbg1XPbCwf92EV7Lmz5I=
X-Gm-Gg: ASbGncsBLqxHDpR+wh+KSnPA96eWzPA8Xz0W+/41SLsci+HjQLkJgnDsCb+JFauXEtk
	LENFLeqw5jZQp54/vWkYDVgWd0ll2/ZmGBCX+SRgx27Dp5/00LQlaeJ/u2RuRiLASiq3fDpvjs6
	+6STBWi/5ydJA+qaz+E8I5H2EiCExDEHifja81PiFBp6GwJIhpp15wqj0rH8rfqvcGMgONNZGPM
	ADB8zdmuzkqli6iRpqNBim5XsXPO0wRaFZaAh60xG29m0hy75k4qTua4S5o
X-Google-Smtp-Source: AGHT+IFbec8gno5r3txZurFgpWnFa2Tw0B1U6ohzIg8oPkTeYV0R3Aylb3f7FAu8YsrgrAe4AIIpRA==
X-Received: by 2002:a05:600c:4f03:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-43668645cf5mr573322825e9.15.1736247617728;
        Tue, 07 Jan 2025 03:00:17 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm599851945e9.6.2025.01.07.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:00:17 -0800 (PST)
Message-ID: <7178eb322fafaf0fbcdc4b91d9f9a65d996e4e6b.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 07 Jan 2025 11:00:16 +0000
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_030019_542932_9727740D 
X-CRM114-Status: GOOD (  16.30  )
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

Hi Thomas,

Thanks for your patch!

On Thu, 2025-01-02 at 12:15 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> The interface of the Maxim max77759 fuel gauge has a lot of common with t=
he
> Maxim max1720x. The major difference is the lack of non-volatile memory
> slave address. No slave is available at address 0xb of the i2c bus, which
> is coherent with the following driver from google: line 5836 disables
> non-volatile memory for m5 gauge.
>=20
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c3=
6bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>=20
> Other differences include the lack of V_BATT register to read the battery
> level and a difference in the way to identify the chip (the same register
> is used but not the same mask).

It also seems the reported POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN is
quite a bit off - on my Pixel 6, it reports ca. 1131mAh, but the downstream
stack reports a more reasonable 4524mAh. Interestingly, this is an exact
multiple of four.

POWER_SUPPLY_PROP_CHARGE_FULL is off in a similar way, and I suspect that
related properties like charge_avg, time_to_empty, time_to_full are
reported incorrectly as well.

[...]

> @@ -483,14 +608,27 @@ static int max1720x_probe(struct i2c_client *client=
)
> =C2=A0	psy_cfg.drv_data =3D info;
> =C2=A0	psy_cfg.fwnode =3D dev_fwnode(dev);
> =C2=A0	i2c_set_clientdata(client, info);
> -	info->regmap =3D devm_regmap_init_i2c(client, &max1720x_regmap_cfg);
> +
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, ret, "Failed to get chip data\n");
                                          ^^^
This should be -EINVAL.


Cheers,
Andre'


