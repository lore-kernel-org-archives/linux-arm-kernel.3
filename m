Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E62D735FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbrr2qfB6+/BjJuq7E43lJE1sJas5MBGpSJDZ+XWZO4=; b=iuWaLEUY9RTLVB3szX4z2A/pSD
	Sw3YWe6Cg4sg9mXli3LIMnI78u5vFBEudCb8PJ7/z/8d/lZZo7mM5GjPJbBtAWOrbvqFfCdBUtZYS
	RtzdKTdu7du09d3gVyb4ynu7eTZ5VZMOwnqS9MnR+n2bRxmoKtrMUhph3+E30HXf55kIJrXt0JTpy
	NKSA1EMNsA+qhPGBUKvjBTWrWc0Ppdud+qyND8I1K4Y6J8lZ/oG3LkR5E7Jg9lmmWrFj+MuQJMbRG
	oR1Vzg50j/JOIl4mKeuN8vQDazwfx0TB7tMyWM08FNdqQDFhTwtrDqsz7t+1sA5zSzVq5cSwxn5Rd
	3hryXVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLpA-00000001ySV-3iqV;
	Sat, 30 Nov 2024 11:39:44 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLo2-00000001yIi-1GdJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 11:38:35 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so472820241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732966712; x=1733571512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbrr2qfB6+/BjJuq7E43lJE1sJas5MBGpSJDZ+XWZO4=;
        b=g3dFx9JDmyBc5WgG2e+OKeU/HCCFg+hvPlXjGLv8EIhRhMZYrehigdLkaii83qsOHd
         K/05Wmw5FrcSW5kn5GcMBGOXdkgemm7qpADnrDkH6wOh0S5F0BYL2XyIOy5UL+hIVGhn
         wLT3trDqkwj78hlolWbHRgtsK8ynT6YTO8b8666QWH50ibLI2kooAttnuex5uZSbcgvM
         Jkban8ikwU7DHg0Yj6EUxVkqPLs1rifhaJyIHRVmEAlHdap7ao4eINz8Gb41GHp5fQoO
         MNbl7ZUU3rIhZ3y7iqwePmEEP1wsxAven+BbcuZPgK4MwulC5fz2zXIqSYjI2MIyevmE
         RKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732966712; x=1733571512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbrr2qfB6+/BjJuq7E43lJE1sJas5MBGpSJDZ+XWZO4=;
        b=uZ4koMsCoke1Srza4iyn3rWxh4Lsym8BCjMCfxTlQdVhpbFTbiVdSXixz9ZyJ6reRX
         Pxhgb/cFu5j7aeTdebuxOijl49EuaRSHH454jQTIh9JR8Rdabnwafvl0wggkkt3L5a1p
         gq9wfoKYUD5hGIyE93mcwQaioaGoYew7j4KgqGeVK0DvsEmMrInSXKaXmC8BwTKZaETF
         Zjnzajfpo70QtMZNI/P0F6VgK4H9jadaryDS2c6X6PhLygP1k9HepWJtAtUWMmq3M9Y5
         LzWK3I0RdSGBJamxPgcrI+zLXEsNXbJes7s6N9PhRILE3XEiOw5DMFXYCjDdFW2Cyudb
         C3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXay6S6bwogNigTH2B5CYaQc+iOQmjJc0r8va3DAkf1T/9NvA/k8D6NV2VoZzWnrKkBqx6OMODPCBBleiGV0gke@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7oq8sCb8ne18QI88p4/iPdhmMLkiOUPiOe7Y/PKuNnLizoVE6
	0bFfUXEJbZPSmAZf3YkWQApZe/pd3QCVQ2Q/6JII/F/FnRakCAZnhxOb5/Q0L9kNhAzPr8H/BFi
	ljl3bNtSrzVjUAQl9+PlHAEg5td4=
X-Gm-Gg: ASbGnctothNx1Db+UzR1KMWxktSQeISF8b2nu20qZM+uIrii6DqMpvWglc0Yf5HW4P8
	WTmGzQ40eMQv3nkkvyVZZ6Ybaev72+g==
X-Google-Smtp-Source: AGHT+IEOjlIPuE+ZgXLyvfndQVoFGvXTAQTOLhdzhSDM04yBi3Tp+D0cxFQCuCqvm5sj20DBHerEXbDd1U2rr4EjqZ4=
X-Received: by 2002:a05:6102:1519:b0:4af:586c:6197 with SMTP id
 ada2fe7eead31-4af586c620emr14093624137.0.1732966712559; Sat, 30 Nov 2024
 03:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
 <20241108-b4-max17042-v4-2-87c6d99b3d3d@gmail.com> <a7182597-b45e-40cf-baeb-60f69ec2365d@marvell.com>
In-Reply-To: <a7182597-b45e-40cf-baeb-60f69ec2365d@marvell.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 30 Nov 2024 14:38:21 +0300
Message-ID: <CABTCjFB9ybKmNh-xuF0qaWQc_j4zNXW36vimdrEPh2hzP1VsBw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] power: supply: max17042: add platform driver variant
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Purism Kernel Team <kernel@puri.sm>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_033834_344182_C6DA32C1 
X-CRM114-Status: GOOD (  20.43  )
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

=D0=BF=D1=82, 29 =D0=BD=D0=BE=D1=8F=D0=B1. 2024=E2=80=AF=D0=B3. =D0=B2 17:0=
3, Amit Singh Tomar <amitsinght@marvell.com>:
>
> Hi,
>
> >
> > The solution here add and option to use max17042 driver as a MFD
> > sub device, thus allowing any additional functionality be implemented a=
s
> > another sub device. This will help to reduce code duplication in MFD
> > fuel gauge drivers.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> > Changes in v4:
> > - rename module_init and module_exit fuctions
> > - rework max17042_init
> > - assign chip_type in probe function
> > - pass i2c_client as pointer on pointer, to use same pointer created in
> >     MFD. This allows devm_regmap_init_i2c to cleanup gracefully.
> >
> > Changes in v3:
> > - pass dev pointer in max17042_probe
> > - remove prints
> > ---
> >    drivers/power/supply/max17042_battery.c | 116 ++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
-------------------
> >    1 file changed, 92 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/su=
pply/max17042_battery.c
(...)
> > +static int max17042_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct i2c_client **i2c =3D dev_get_platdata(dev);
> This seems a bit unusual; can't we just use:
> struct i2c_client *i2c =3D dev_get_platdata(&pdev->dev); instead?
> > +     const struct platform_device_id *id =3D platform_get_device_id(pd=
ev);
> > +
> > +     if (!i2c)
> > +             return -EINVAL;
> > +
> > +     return max17042_probe(*i2c, dev, id->driver_data);
> and then just pass "i2c" here ?

This leads to hang on freeing devm resources, when unloading modules.

Platform driver version intended to be used as MFD sub device, where mfd
creates a dummy i2c client, and passes it to max17042 via platform data.
Sequence is: insmod MFD; insmod max17042; rmmod max17042; rmmod MFD; hang h=
ere.

My guess is that it is caused by a new pointer to the i2c-client. New point=
er
created at `platform_device_add_data` function call in `mfd_add_device`.
Since C is pass by value, new pointer is assigned to platform device data.

--=20

Best regards,
Dzmitry

