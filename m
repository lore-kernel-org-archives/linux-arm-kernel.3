Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAE410F9975
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSIqNt78FUyhC37DXJa7yUeoFFc4wo74rhgzzgW7k8E=; b=2qeRVlvpLt/vHAUu3RXAK0K8RF
	nFSwbZhybNRBHbu4cVMo3O4rKng/Q8R1EUewQUB9MzX3+A0/F+b5IrJV/h8mdVs/pW7lVCeGIyxOs
	ejAHhgIi0fyiSBYCDacCon/O7Lk/K03u3lMnY4xqsVMdAsCRsm6BM4cZYDDMQw8Hs2sp6DXaawSdh
	OVNadvRj7E9bKtIHqYL9xBjyHwW3jbIXqETLC0AkAmqLAghYpzgSg1Y0+yfuYcFPf6xz/erDX57Vp
	ViS4ffoYmcdOIr4/AyZx8XbaM1jrkJMSK5Zk6pgKm75AWmagWy4xxxa7DT/XzUviXvaMEehQ8duSu
	28/4t9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYsG-00000009LCX-3aGo;
	Wed, 08 Apr 2026 19:47:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYsE-00000009LBy-3tzv;
	Wed, 08 Apr 2026 19:47:40 +0000
Date: Wed, 8 Apr 2026 21:47:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775677655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSIqNt78FUyhC37DXJa7yUeoFFc4wo74rhgzzgW7k8E=;
	b=N7kHVNFaV28BJ5i39dTeovDJmXEOGGoicy63cPw6sIMPJrT3MIRJU1OoauMeqGYBh2C/ru
	IYmtbgdnjNit3k6yIfjADqd11vLONopQXh9MVr/wIqvId2uE5rsNbwjbDth/U8dZav60JO
	qt/yyJ+dTx1morKTk1+dxQZIBntOErCZYOoxd2OSjc+VpWSPKGaIlwQoY5bU/84s5Y8D8S
	QzL/tobLmfLXS3649j2AtV1MVCw+oZ+Km+tnM5z2NT/EBWjtnmz04pYEuFaffrNpR0BIA1
	XzLmuZfxuaewSRz0iv6KF+e8QvYSybCweJV+vQgO8jpmgQUsqR8YT5h/EISQkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775677655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSIqNt78FUyhC37DXJa7yUeoFFc4wo74rhgzzgW7k8E=;
	b=t7EhtX1qiE9FyleDtAjgbxeI91gmSauXY8LkwXq0tpfCxMXlsR1dCNBAirwzpx6aGHCx/B
	Cs+AX+iRbaLtnIBQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <adaw1rr3WlDjvyQp@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
 <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124739_112204_9B2A5D7E 
X-CRM114-Status: GOOD (  23.17  )
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

Hi Stefan,

thanks for the review.

> > +config NVMEM_RASPBERRYPI_OTP
> > +	tristate "Raspberry Pi OTP support"
> > +	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
> > +	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
> I don't think these comments are necessary, because this applies to other
> firmware drivers, too.

I have seen this in all the other drivers that depend on RASPBERRYPI_FIRMWARE
so I added it here as well. I can remove it.
> > +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> > +	help
> > +	  This driver provides access to the Raspberry Pi OTP memory via the
> > +	  nvmem subsystem. The driver supports the customer otp as well as the
> > +	  device specific private key OTP.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called raspberrypi-otp.
> >   endif
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 7252b8ec88d4..8ca2095e068f 100644

> Is there any reason, why we cannot register this driver in
> rpi_firmware_probe() like hwmon and clk driver?
> 
> I like to avoid the complete dt-binding from patch 1.

The private OTP registers are not available on all Raspberries. Afaik
only on 4 and 5. So I think these registers must be described through
the device tree. Therefore the bindings are needed.

> > +module_platform_driver(raspberry_otp_driver);
> > +
> > +MODULE_AUTHOR("Gregor Herburger <gregor.herburger@linutronix.de>");
> > +MODULE_DESCRIPTION("Raspberry OTP driver");
> Raspberry Pi OTP driver ?

Yes. I will update in the next version.

