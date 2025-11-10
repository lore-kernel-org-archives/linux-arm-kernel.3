Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A9BCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=; b=3zfg8fEzEJL3LmhziwWU+3p/ko
	BP5ihKwQp+TFgmuDhtGtKMnZ2/4qgWkokiYvvL8vEgfDdXkofqss5au86o7ptbQx+jN7/iRoAcwDg
	AZ770Tjkp8Pw4vVDgXMfGeUdczkTi9TExlNMQOK8I5+EtNMvxqqh+wXyixUUmVpweXVxJvdv6tNS2
	ZCKyehW0qEJgS/oC2gnCD9zfDWtNuyl1zEc43smz7MXgRI0onE1bRxa7Lce+FvVdEgsxsMZMjTE1O
	2Q7sYL+5Y1vRaLJyLfSjqIF9Tb7yW/++7wbz+H122yrZAYjqrDNtQ8fHOrjvRrWfPZkbPM+2tmrVk
	F4untZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOfy-000000058g3-1lWs;
	Mon, 10 Nov 2025 09:59:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOfv-000000058f8-2Ij8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:59:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b31507ed8so1414181f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762768741; x=1763373541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=F0bVdTOgZVHS4tYQ28nL/Tttj0x+4FtQ9ELyBQawKMnyXPCpNm0rBx79403/IX01gM
         xpkahAT5LVE+f+aamppAL+aY35v5dUXFXW5HF6l7DzflqiLOPV45u1/ViPia/5z7X+bd
         5VAT4A1n6QCjVIILbdeJqhj0VME66SGof1ccvbZTTEiDt5N/Z6TMOlYUJZC3OgTLSzM7
         LTmqjYryAtzX+Qum7yI844m2IOEt+aeNwc5zyh4wfvnSgcr1Z5a5lBfdV5voyc7njXNL
         7ixXxP/9R9iuuJJ09pKCDPbI8rC9JcY5zdEwHDALjRb4OEvGd8a9plRUco0oBTu6rmjQ
         M3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768741; x=1763373541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=Tsbb+jmREXre+++ZwT6eW1sp+lK8W2zePwUBe9sOLc8eM45V2tFvk0+kiV+OKhptZW
         iayJD3mLUlQUuVqxa9gbP92EbkMUJjQm4pbqfolPwsokB9JyHa31jV8QhcgHdMg6GhD6
         vgThjk+pzUSmN4VVeC/Fg0SmRnKiH9Zaa3v3gVMhvVTSzGdfBea7G/8rwE3PwQyfLvJz
         WWP/uMzCkNXyZ8S+3mxoevuOOGCmIeRh9BiK2ILL1HtCF3dbOaufP+sfsuF42y7Bxxgv
         /Jxfe3EWuULjU425oYqZUcGxJV5IYbkbFjYBrYALuY+SZZgCxgK/ndWUX4mF59QvgJ0r
         0vyw==
X-Forwarded-Encrypted: i=1; AJvYcCWhayf40oW9ObfQoi0kzBZdwC9t7smDdMvGKGLUexm5tKIDEp87vZBGPHmO6SZ6FJNWGvo/YLwD6vJYNRc9DUJA@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKBPBSh6h7LE7+gPOf3y7PBPnOBPvp6ABVzdO5R00+IJ4RIqR
	CUuOxrcbMc2Rk6RaIiAk+LY4uqvf0pc/ufGYAv6lxCtVL37/UbuwCj/ErOk+iSmct2w=
X-Gm-Gg: ASbGnctntwIuEqNXjB6PUOmIGyuj0Af92hTAe/mxoKn0DPzdyy6JyXnW5SkP9YZcG6e
	lhq3LwdMddih0YnQpD3+2yaZoORZKp0yCz2ofTNi3ZoSLNQfJe0LqUD7bOOhHqN0VrNA08pu3Gt
	6sbjyBwe72ohG1cs0jTIeGecxFtPoUf7i5dAlrfhy9sDAbcegMieMYgkRJg2ILn8q6+JwxQ/5yG
	xsoNjdk8c9g5dyJM687klQbZZlgmgSW7ehPLJq42sxQzfcvCRQy+OBwyq72pMY6O9DQzL2+qi2n
	5bTtlEvBW9svIxNJH04BiIAv0cdudpQGs76UDWS0hrAc0GScDI09o19/0G0HhisecplE1oY7CL8
	OfRpsmueKlAQiykvf80XoI7DRKdTS9c0k8EL9X+yU+S0B9HNqIcbgZOZIv0XUc0kZ9V1LB134g1
	lnBrWC9jSL0fjFyebPLclADY23eX1WGBhM231YRYCD3noyXXgRaHNE/o+2ACI=
X-Google-Smtp-Source: AGHT+IESDCHlcbXRXRa2TG5aApGtSH2moJB6JVIAkSw02ybwWPI2qmXCnmEZcdOIcRiKJ320ee1qvg==
X-Received: by 2002:a5d:5885:0:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42b2dc1ab24mr7071023f8f.15.1762768740534;
        Mon, 10 Nov 2025 01:59:00 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm9799000f8f.45.2025.11.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:58:59 -0800 (PST)
Date: Mon, 10 Nov 2025 10:01:11 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG359gIeP48V2ZZ@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_015903_740260_F9853173 
X-CRM114-Status: GOOD (  29.44  )
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

On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> On 11/7/25 17:14, Daniel Thompson wrote:
> > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > +/**
> > > + * @brief control the brightness with i2c registers
> > > + *
> > > + * @param regmap trivial
> > > + * @param brt brightness
> > > + * @return int
> > > + */
> > > +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> >
> > This isn't a good name for a function. It doesn't really say what it
> > does. Please find a more descriptive name.
>
> Having a lot of difficulties find a succinct name that fits better,
> max25014_register_brightness_control()?
> max25014_i2c_brightness_control()?

I'd focus on what it does rather than how it does it meaning something
like max25014_update_brightness() would work.

However, at present, this code is only called from
max25014_update_status() so the simplest thing to do is to move the
code into max25014_update_status() and remove this function entirely
(then it doesn't matter what it is called ;-) ).


> > > +/*
> > > + * 1. disable unused strings
> > > + * 2. set dim mode
> > > + * 3. set initial brightness
> >
> > How does this code set the initial brightness? It doens't set the
> > MAX25014_TON* registers.
>
> Yep forgot to remove that, I discovered the backlight core takes care of the
> default brightness, so I removed it from here.

What do you mean by this? Are you sure you aren't relying on another
driver to enable the backlight rather than the backlight core?

> > > + * 4. set setting register
> > > + * 5. enable the backlight
> > > + */
> > > +static int max25014_configure(struct max25014 *maxim)


> > > +static int max25014_probe(struct i2c_client *cl)
> > > <snip>
> > > +
> > > +	/* Enable can be tied to vin rail wait if either is available */
> > > +	if (maxim->enable || maxim->vin) {
> > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > +		usleep_range(2000, 2500);
> > > +	}
> >
> > If you really want to keep the devm_regulator_get_optional() I guess
> > maybe you could persuade me it's need to avoid this sleep... although
> > I'd be fairly happy to remove the NULL checks here too!
>
> Just wait unconditionally?

If you think it will be unusual for the driver to be used without enable
or regulator then it's ok to wait unconditionally (all examples you
have added so far have an enable pin).


Daniel.

