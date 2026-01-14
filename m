Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE4D38FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OmrMJYTk0QTc9HUpPBbGAYWuS8RW+O3QCjvFJwIg/c=; b=YvSBkZ11WhRHFqO/9WxO3hYwhi
	QMoTMD1X8YL+KNM4AyLR4RBHYy8ceZmH10nKKDz6c0xJyC+pm6AnqjzTjzRtSGLZhzkc3T84QxS7y
	XYNmAQu0dhPgmocwcQ0eDHBrlqrnJXfgDRu5cY1mR1hiao5kGmT4yTIqNg++Wdo9Av1GQJwp2PvQe
	XK5tDW8rF3KoGD6qxAnAV9lM/w4E7VuqbPhtaDrz/VqqP7gBFP+tllNqLfJK2OCOWQGgro/AFEtgr
	+2J7SDwJ5Zg9ysQa7dqhokfJ16M8qhBbCOregDXNbib6cksLuECk68gJLO71X62/CFPFbpicWiHrd
	MD2cfW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3kp-00000009vhd-105l;
	Wed, 14 Jan 2026 16:29:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3km-00000009vg4-1L3a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F19D438E3;
	Wed, 14 Jan 2026 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3DEC19422;
	Wed, 14 Jan 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768408190;
	bh=I8+1WljunbvUFxqo0uuMi1ljN83aDJ7digha0oFhW3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oK8kMI3fsbLCJ/RO7O6RmMGSUrb/KnoHVeDxCL6SU1hSw0dCGz5jpy8TeYhMWijFy
	 4Y6l18gHBFG01liU5Xd+7/x+lZ3tnTslJAn6x+tKCdm6wwrlDsh3Js9D11r9dUQUQ1
	 P1rmPWzPGFverhc/RQcT1t9ZTITamH1PIldcqXQfo2/+dubDFbFW3yKSCHjWgQnyns
	 WjDrp/vHQi6HX0si/ACs6w/Qkc68jUC2mryk4JkZYnH1hpGw4hotvd3LrKaBHD1aBV
	 nwKWnjBSc/zXqvv7fcVjp0htConpPi10Cu6PnhI2/UT0myjPLMDmSr89eYSeRe5wPz
	 3m9l/mvN//0oA==
Date: Wed, 14 Jan 2026 16:29:44 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Lee Jones <lee@kernel.org>,
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
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aWfEd0hldSrwrh9-@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
 <aTaqCxsGj_waN92Y@aspen.lan>
 <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc5aad54-08fe-453e-a3cf-621414c8a060@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_082952_378779_A9DE0253 
X-CRM114-Status: GOOD (  15.09  )
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

On Fri, Jan 09, 2026 at 09:55:18AM +0100, Maud Spierings wrote:
> Do you have any comments about:
>
> > +static void max25014_remove(struct i2c_client *cl)
> > +{
> > +	struct max25014 *maxim = i2c_get_clientdata(cl);
> > +
> > +	maxim->bl->props.brightness = 0;
> > +	max25014_update_status(maxim->bl);
> > +	gpiod_set_value_cansleep(maxim->enable, 0);
> > +	regulator_disable(maxim->vin);
> > +}
>
> I'm feeling like the setting of the brightness + update status maybe should
> be a call to backlight_device_set_brightness() or maybe it shouldn't really
> be there at all?

Using backlight_device_set_brightness() makes sense (although there is
still a window where userspace could come back in and turn the backlight
on again). And, if both the GPIO and regulator were optional then it is
sensible to set the brightness to zero before removing the driver.


Daniel.

