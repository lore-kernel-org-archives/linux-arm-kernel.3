Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF7CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4MkTPmyiSjKWeSibYiZlPl0g8Ut9Fvq2fUKdqqLp7M=; b=KNHCEQhx/MgsFo/e9tYVHdAVsk
	aWS7496FANOsBzRYXGvK1CBd7iUdIJNNb0MHoAXkqKixhLggwumXwcdEGH4OrZ4cU1jESlzysXwbE
	wijmIQIX6rf00kPSHoO77JEHtdPh4He2Nwl8tbw6eDO+J3SW16pXCff5qRzQIW4WTpr5bCd4h5iUD
	p/zTRy/rg0ROepW6tff0yGPzhCo9Vz59ZlrISJ9h4j0h6yi9/rCorsaieQuecUWSRIj6Xo9zOwveI
	3r4zUZOl6ZQ1epGU7cw5dHV5P4G3cS0D0Y5tcVbVAtIYpK2ePemjjubY55Ag01Xxn/6m9SBPxzzFG
	PFN3KLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHZu-000000014IV-2Yp7;
	Tue, 19 May 2026 10:21:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHZs-000000014HW-2tFB;
	Tue, 19 May 2026 10:21:33 +0000
Date: Tue, 19 May 2026 12:21:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779186090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4MkTPmyiSjKWeSibYiZlPl0g8Ut9Fvq2fUKdqqLp7M=;
	b=p7yTZpopgx8qnMg4xfVsSTSxF6ntf61gKVRBMVDrWWByYCjn9DbH0fEtWWzY6DyDF0CHqL
	y4g2myTR32tiSuF/sn7PERojYEiV9HUPR5zopjMHtx6jokqyq/yqaPyXvXZpLHpbbcyO7J
	QLdVOlc5fErj4vqz2vdFbVJCXblNIdF+zZ/m3OhI/QoZh+3Wp6k/TMY3SXT771ggVZ3fc3
	Gmw6MfsdlP6vyPNaDtVq0MMl79dJyO3tliSPAd9NwarbI/5R4TgRbt5GtYAZDDDm4HIFjy
	WNCgKKS37/VnD+G0JSy0AXBDcT3oU+9/fSvWdr/rwnOuQAUx1dfjCFxLlAV9Mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779186090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4MkTPmyiSjKWeSibYiZlPl0g8Ut9Fvq2fUKdqqLp7M=;
	b=rOprURbuQNXUITboV4Vnp0PhwG+5hleZXLEpmvS+rTaOzBv6nAaYU6iVcmgDdc9Jhx3rn+
	npcpxFZO1dHEw1AQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/5] firmware: raspberrypi: register nvmem driver
Message-ID: <itr6h3qqjcv5k6mwfj5sgmwviusq2sni35qfkvrq4fu2dyqclx@z734js7deviq>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-3-cf8d725d8821@linutronix.de>
 <20260519111442-f1e6d418-9a92-4934-8a9c-c5f7827f853e@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519111442-f1e6d418-9a92-4934-8a9c-c5f7827f853e@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_032132_867436_C1805EB3 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, May 19, 2026 at 11:15:59AM +0200, Thomas Weißschuh wrote:
> On Fri, May 08, 2026 at 04:42:46PM +0200, Gregor Herburger wrote:
> > The Raspberry Pi firmware exposes two regions with otp registers. The
> > first region called "customer otp" is available on all Raspberry Pi
> > models. The second is only available on the Raspberry Pi 5 (bcm2712).
> 
> (...)
> 
> > @@ -327,12 +371,25 @@ static void rpi_firmware_remove(struct platform_device *pdev)
> >  	rpi_hwmon = NULL;
> >  	platform_device_unregister(rpi_clk);
> >  	rpi_clk = NULL;
> > +	platform_device_unregister(rpi_otp_customer);
> > +	rpi_otp_customer = NULL;
> > +	if (rpi_otp_private)
> 
> This check looks unnecessary.

Looking at platform_device_unregister again it does not do anything when
rpi_otp_private is NULL so i will drop the if.

> 
> > +		platform_device_unregister(rpi_otp_private);
> > +
> > +	rpi_otp_private = NULL;
> >  
> >  	rpi_firmware_put(fw);
> >  }

Regards
Gregor

