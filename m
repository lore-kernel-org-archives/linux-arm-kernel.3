Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3C9C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=; b=EDZcWxL6P8/yCGZuAYC6aJPc5W
	foNK8kCnLI2TbKmWrGAGMh7OO2+L0CPD8KuiMBlCO91a4S+hcNcywt1ooOdbzI2bOxOfQojXfDTpp
	sWWN/SF/g/cR0brtkGGS3SMboNSpALqOACDZ+5CIbYM1JPP7N6BNfKMaRiyLhXoqIr1qr117gMTAc
	w8jCsofmb5PgcogONQ3NWJ6K1vNEWGR+5ffN+NZop7lbrKLxIjpiSGHVGSQr2/L7c186e5EfXIq5L
	srtLjOFGmSPjWYSM/kopRY15kbD0TyPgHWRea3aaF7eqglsYgNUtiRljyK5hARm8BOY7A628tDaP/
	JDA4gqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkits-0000000Cavx-02hq;
	Wed, 19 Feb 2025 12:10:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkisN-0000000CaZH-1GJe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:08:29 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54524740032so5826092e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966905; x=1740571705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=vpAnOqCQksCdkt9I6nhbAoljCaM4vnlIT/K/FBDE3zIhMVOyXwbN+XZPa/K6fpk3kt
         G7HXPxZTJcCyOvt5rzaiE7Z5trpf3JL7R8REIZWfyUz56X54DlZpIx3cuou1qtCl2AaN
         JjjT70O6/97MGwQIsrBheFC3VfRGckovCkSIItfo3junvnW8SXiKt+64Jx77vHbTCi91
         1epCD6PaPZMlj2XaMqgI+VM0CtkdZKKH+dWfxyvCRaOw9Hy7XLRsLNR49I/Lq6O7NBCR
         rsgmQx1GhD1WvEtLCHeBtb9QW+zxuq6mOa8rk+Qny9p8Eddicz7Sl65TP8MvhUFU/Ne9
         QUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966905; x=1740571705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
        b=EsKdFTmOq6Z5kQuB0v5OAMRgvS3FfN3MK5dVzxVkN6/oWbpEFMxgAAV95BkNo6VlOl
         gBbG0CKusAM48kgm0Qcq78wZG8LY9JlpuN6IuMMXck5DGkqjZax3p8mw/sEAiOuejnvd
         BLmnJ07QI9uEpRqXzNUM3I7lrBcuujGoK5wP+4bo9prxzAZ4xO/iSVQzbAA9GppjeHtE
         C26vjezquZnw5hyjeuwoyA6M55IKWqF3Om+hHuXZPHdGqXR2Ssl5dPIFFLVNd5iKnfY2
         tND7Vxpqgwmc5FSTLq3cr5I1Cv3PZ99uBqJmBzin1gdj8FRdukFS4g59aipvx/wQs71e
         /pag==
X-Forwarded-Encrypted: i=1; AJvYcCW3KAXYFpShcZcSqnEL9KCXNA4qO2MKU1pP8hpXNcaH1P4KDPT22ZWSX6Hn11xmYblMuOLZH4ruCpAado0o+6Lm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+lqUqTVE5nXH29YZgX9o1gFazUxXJ5OHSVjxNJzowbfIxGAWV
	Ss5wUmI+/TFYss6BlwYLdbICCHBMmqs7J+MUrx8zuh/kSAIKn2l4XbRQUu6CD5Q=
X-Gm-Gg: ASbGnctjpwUoWm0aWrYOVLckanD1t3aoEH7koAFq4kdgm8dz26SBOSS6nC1e7kmNbYp
	7CEQrlBzHMYMss4186Owny+PfOM8JTWAjcKhz6c92lve4CXF9MMGPCWug6NiSQarPWgXW8NkSMQ
	gCufN7gy9FmTW2wajy72P/vrEarCfbNdhS7xFZPtUAExX7G2rOhthPstDeEybwMra9kP6O+aRdp
	LNmrdsuTwt2OxOe9QjlEP4pM63RkjZbsDYRbo8RPKLtYy/QUguGPO+ngIGP+M67dkpQZ4OpV85M
	is+1zXnwu3ukSKuEBi4V0PA8smLLvmvyMSHQt0FIuOCGf8fRl4ZKjnSx0X/wgJqjPlSW+tY=
X-Google-Smtp-Source: AGHT+IFMLOpDHMHA4h3/Gxx2zV0fjSL0lgJbRphbGzyITSKOMSUgTcKxT5mQ7K/tT3lwL8tk5JoMMA==
X-Received: by 2002:ac2:4e05:0:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-5452fe5bedcmr6706804e87.22.1739966905285;
        Wed, 19 Feb 2025 04:08:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461cfdd5a2sm1148260e87.39.2025.02.19.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:08:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:08:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
 <2025021922-spongy-swirl-0746@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021922-spongy-swirl-0746@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_040827_346737_4AD29BC2 
X-CRM114-Status: GOOD (  30.78  )
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

On Wed, Feb 19, 2025 at 11:13:14AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > > Add helper functions to create a device on the auxiliary bus.
> > > 
> > > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > > the same code repeated in the different drivers.
> > > 
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/auxiliary_bus.h |  17 +++++++
> > >  2 files changed, 125 insertions(+)
> > > 
> > > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > > --- a/drivers/base/auxiliary.c
> > > +++ b/drivers/base/auxiliary.c
> > > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> > >  }
> > >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> > >  
> > > +static void auxiliary_device_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > > +
> > > +	kfree(auxdev);
> > > +}
> > > +
> > > +/**
> > > + * auxiliary_device_create - create a device on the auxiliary bus
> > > + * @dev: parent device
> > > + * @modname: module name used to create the auxiliary driver name.
> > > + * @devname: auxiliary bus device name
> > > + * @platform_data: auxiliary bus device platform data
> > > + * @id: auxiliary bus device id
> > > + *
> > > + * Helper to create an auxiliary bus device.
> > > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > > + */
> > > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > > +						 const char *modname,
> > > +						 const char *devname,
> > > +						 void *platform_data,
> > > +						 int id)
> > > +{
> > > +	struct auxiliary_device *auxdev;
> > > +	int ret;
> > > +
> > > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > > +	if (!auxdev)
> > > +		return NULL;
> > > +
> > > +	auxdev->id = id;
> > > +	auxdev->name = devname;
> > > +	auxdev->dev.parent = dev;
> > > +	auxdev->dev.platform_data = platform_data;
> > > +	auxdev->dev.release = auxiliary_device_release;
> > > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > > +
> > > +	ret = auxiliary_device_init(auxdev);
> > > +	if (ret) {
> > > +		kfree(auxdev);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	ret = __auxiliary_device_add(auxdev, modname);
> > > +	if (ret) {
> > 
> > This loses possible error return values from __auxiliary_device_add().
> 
> Why does that really matter?

At the very least the caller (or caller of a caller) can call
dev_err_probe() or dev_err("%pe"). With the current implementation as
everybody maps NULL to -ENOMEM the error message will be cryptic.

Or just having a cryptic value in the logs.

> > I'd suggest to return ERR_PTR(ret) here and in the
> > auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> > failure.
> 
> Will the caller do something different based on the error value here?
> All we care is that this worked or not, the specific error isn't going
> to matter for device creation like this.

The caller might not, the developer might.

-- 
With best wishes
Dmitry

