Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E8FE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=; b=qM1KkjDF0QB027mg2mGRwoHPpA
	AI/NsWMcOU3UcUrCZj/5essTN2r2XaclY0iceHOgXywPYoDI6JoPXtE5CuQACbTtdDQSKAqAKO5/0
	CSQI0OEwpjQojzTrNT1zb9w+LGcqt66WHH6RTvdvCp+xbv6NAWyygTd/HiOmj0IaLuYNxWgEBVHk0
	UkLfWoTS4uGPKEVgPaDGR41ZrH87QHzNVTZdYzTa8EIZv8zxuWJRx/BsSloNh//ehm2XK/zaFrEj1
	U/urNsA5GSTsGToBVG1vy2meUuOP3EBNazzSe5k0qFADFOyCRtSVJZ8GOJoDBkioJwQ3U3Crxydtb
	noecjpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6KN-0000000BaIe-3JLJ;
	Thu, 19 Feb 2026 15:52:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6KL-0000000BaIB-0LcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:52:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43621bf67ceso779373f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516346; x=1772121146; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=fwpWQWYxHvKIkoMf/wTLycuEgz5/T5P4gyGadHaDhmKAKReTVsUV7QL1TaI9MvlE6/
         dmL8FqSzsU744dGJvlLw5VAkOWZqhe0VZgpSVY5lwqI46NtP9J51mWOSEYMhgcMv1jfV
         exy1l+gvylUebLmEJAp/XP6WPCyCuNFEuckCpmN0uShVMQKd9B+WFnoSsbVS/aX4CHHO
         b2BF9xZQrpDrVjcx3fFKx2WhstWTU0VVjAwJxhcqEjEvqjfJWh1KLb/hQItz0qO8Pdzc
         /vJa7b1Xd15nj6dX11Ic1k1peTVn35L2/Wv08maWMRmdoPZlM2TW3XsDBBDnN99sezmM
         OaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516346; x=1772121146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ausNYp9VNOhe1fBHOC525G26Oe60ih9EhrjdJ5sgpHg=;
        b=jB3Ynnbb2d7l7vOMFXEy//pQQclNGRPnQgEV3tyimyUkcA9kMHg2JgLc/vRuywLGuY
         HozerSydRZuRubpw+ubbbNSPLks850tzaryc96kgoe0m6EhpSn/4jIbMQS/BjqNDlQQN
         T1yTNqy7w4Bs9ZJ82TG4FhJ7mwK1CvEIw+i0kF4H94UzV3Bpzsq3FLxZuUcEF8M9UtVv
         B987qBkS6oyi021ctl81T9DCVzoC//m0kxTsQ58MmBQoN0bKJ+RCG2wHa3B8uxTRpmhp
         XnZQjuIDTo/tza263UH4HVtTwfJha9IoRZD5kAzg1CFiHKF4s4td14L6uAekjss/afhj
         jfZA==
X-Forwarded-Encrypted: i=1; AJvYcCVNJbLdmYLkkVVDgxW4U8ygofXq3MlVZr5c/xSQ0sZQox2/50RvttNd5SseltIErrzYvKjAX47PKy3nsWQaz1iA@lists.infradead.org
X-Gm-Message-State: AOJu0YyA1t7gg7BJMAjthn9uGivKmesuzUxDE3cYUekBqltHwqLDMaJz
	gINcOWf0cn/bscYBrL+d2WE8nSmVlNCg8+3WOBekiVup/Ia40gci63ssl4fDU1Jp6Ho=
X-Gm-Gg: AZuq6aIAqqaroBqG9od2wgrQl1C7yf7uJHpQQCNbpPHxh6UJqcWxDAOliidUk46Iqh8
	QNUUaDyW5IXdw9RNU4i0xmPg0qaJ6cpPW+fn2fUTbLkKBMoHQFTwgtlaoCmQXoXZ7sXgnOKD8R+
	BfoYeTJKISjZgJYit5s8pbQs7I1PADzRk7r7Cjvnvt48u7Avp2uPgQQ6xktJHC/pjH+syYsyA1a
	6tQ3+YF2wn/0ZnZZY4pRjKixZAVe7vSjykPauAiG1g48ZW8/aegUQeDuxPJNu5lBeROco4oTKqD
	VpRcJisHJv+RnC5SoofvNs7gruCeGAl+uE2Kxth7pkFTSc5LrAexBCSw3gbXuVxC4iIEdkDCTHs
	4WPd/riYX/2/ZhB0ZJOqqDTGfCdJ7w9l82bVlPg7+Bo1WbwDLFvSla2wkS/JkN5gjHrd9lkGCl1
	AuizWR5xlGQM0nWdvr5ac3R0izurnc9g==
X-Received: by 2002:a05:6000:2001:b0:436:3475:4737 with SMTP id ffacd0b85a97d-4379db8cfddmr32328493f8f.30.1771516346564;
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Received: from draszik.lan ([212.129.80.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac7csm47748995f8f.7.2026.02.19.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:52:26 -0800 (PST)
Message-ID: <f46fa180198ec103aeb1e1c06286c6a2a0fb8b7f.camel@linaro.org>
Subject: Re: [PATCH v7 5/6] power: supply: max77759: add charger driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Mark Brown	 <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Morton	
 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Thu, 19 Feb 2026 15:52:55 +0000
In-Reply-To: <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
References: <20260218-max77759-charger-v7-0-e8d907ce69c5@google.com>
	 <20260218-max77759-charger-v7-5-e8d907ce69c5@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_075229_170744_C3216F76 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Amit,

I was trying out your series and noticed a few things that I didn't before:

On Wed, 2026-02-18 at 21:59 +0000, Amit Sunil Dhamne via B4 Relay wrote:

[...]

>=20
> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..035f16822d85de94c7707ce11=
c49345c714cd559
> --- /dev/null
> +++ b/drivers/power/supply/max77759_charger.c

[...]

> +		dev_err(chg->dev, "Invalid mode transition from %d to %d",
> +			chg->mode, mode);

All your format strings are missing the final \n throughout this patch.

[...]

> +static int max77759_charger_probe(struct platform_device *pdev)
> +{
> +	struct regulator_config chgin_otg_reg_cfg;
> +	struct power_supply_config psy_cfg;
> +	struct device *dev =3D &pdev->dev;
> +	struct max77759_charger *chg;
> +	int ret;
> +
> +	device_set_of_node_from_dev(dev, dev->parent);
> +	chg =3D devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
> +	if (!chg)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, chg);
> +	chg->dev =3D dev;
> +	chg->regmap =3D dev_get_regmap(dev->parent, "charger");
> +	if (!chg->regmap)
> +		return dev_err_probe(dev, -ENODEV, "Missing regmap");
> +
> +	ret =3D devm_mutex_init(dev, &chg->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize lock");
> +
> +	ret =3D devm_mutex_init(dev, &chg->retry_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to initialize retry_lock");
> +
> +	psy_cfg.fwnode =3D dev_fwnode(dev);
> +	psy_cfg.drv_data =3D chg;
> +	chg->psy =3D devm_power_supply_register(dev, &max77759_charger_desc,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &psy_cfg);
> +	if (IS_ERR(chg->psy))
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register psy, ret=3D%ld",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(chg->psy));

Why are you returning -EPROBE_DEFER here instead of the original error? Thi=
s
is quite unusual.


Cheers,
Andre'

