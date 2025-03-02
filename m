Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D2BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cNWa2UgljD4QUo5xX+Eat9HXdnK+5Elet9E9VVZzBk=; b=S3cJdTuiwwlg5I/kdFjF4BOnaS
	RuRb0vXoC660jzr2wsftCBkmgpN313bgFxpd8ujkddRedQvxGwMcecwyT1mtxHJZB3A2kho1owefW
	doD6mIVOTa/QB1UjZ6VNX2Fwph0oe2aS1s4AMRgoUvAFDM+rcEVH4izZXcMuHKCN0eQbVZ7NgUSt5
	S/CGeRIX80wrhY6o4SBzsL7ZyiAQavK8m+X7PgHBSvHznBMzkeacPCmb+dt6TqrmANfQuzP6TYXvW
	oXg/I//xr06hFrsfR/IALVrJ/TtLpiisgPXhvGN1KlhhDlOv8d1uY6kE0AejorjuI3eY7qi4SclgO
	b9OKqnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toZLa-0000000FGpb-42mn;
	Sun, 02 Mar 2025 02:46:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toZK2-0000000FGiM-2vtr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 02:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 032185C4B41;
	Sun,  2 Mar 2025 02:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F6FC4CEDD;
	Sun,  2 Mar 2025 02:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740883492;
	bh=G+2alXcQQeJKiXQVDp+o+8OioV+7Id2VP5GpWYu+a+s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Aq+B1VpcOnZfU4uix8FTan/0Ovik/EeAEUfJRZeJ4Z5L8EscdTZ8Lo6IMYKCFxYnO
	 JNcwXmtwldEpVrxL/S/I7HKm8BMECtD34/PDeMzIb9eybaHhU3IdcJEUNA594h+YXp
	 Rmnhl4cYlSNj9U4B+8OxYNnYOL8GKNan87gpkpbW0QfKLai456n8PGHNV0NYGC5MNo
	 LTf1jJ9gsDCfqz4soGGQI51VUmMSCnXoh/LS1zqiU6TWAMzdk/bIqdoj1ZiPeuRfHZ
	 PrFlvfId4gYEq58Ih9PZgiIg99QgDNSw1mJ0gGzvr6Qk4zJsIFhrmkdrAR32fLuuRW
	 3macoJteXhUEQ==
Date: Sun, 2 Mar 2025 02:44:34 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/9] iio: adc: Support ROHM BD79124 ADC
Message-ID: <20250302024434.67ef4c90@jic23-huawei>
In-Reply-To: <125ab96e-1e92-4022-95fe-324cd47ce1d9@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
	<67b7713724d7591f6321a8f5dfef8cd711f38d34.1739967040.git.mazziesaccount@gmail.com>
	<20250223162807.41960b6b@jic23-huawei>
	<125ab96e-1e92-4022-95fe-324cd47ce1d9@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_184454_839284_9321691E 
X-CRM114-Status: GOOD (  30.68  )
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

On Mon, 24 Feb 2025 08:14:23 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 23/02/2025 18:28, Jonathan Cameron wrote:
> > On Wed, 19 Feb 2025 14:30:43 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >   
> >> The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
> >> an automatic measurement mode, with an alarm interrupt for out-of-window
> >> measurements. The window is configurable for each channel.
> >>
> >> The I2C protocol for manual start of the measurement and data reading is
> >> somewhat peculiar. It requires the master to do clock stretching after
> >> sending the I2C slave-address until the slave has captured the data.
> >> Needless to say this is not well suopported by the I2C controllers.
> >>
> >> Thus the driver does not support the BD79124's manual measurement mode
> >> but implements the measurements using automatic measurement mode relying
> >> on the BD79124's ability of storing latest measurements into register.
> >>
> >> The driver does also support configuring the threshold events for
> >> detecting the out-of-window events.
> >>
> >> The BD79124 keeps asserting IRQ for as long as the measured voltage is
> >> out of the configured window. Thus the driver masks the received event
> >> for a fixed duration (1 second) when an event is handled. This prevents
> >> the user-space from choking on the events
> >>
> >> The ADC input pins can be also configured as general purpose outputs.
> >> Those pins which don't have corresponding ADC channel node in the
> >> device-tree will be controllable as GPO.
> >>
> >> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >>  
> > Hi Matti,
> > 
> > Some fairly superficial review follows. I'm travelling for next few weeks
> > so not sure when I'll get time to take a more thorough look.  
> 
> Yeah, unfortunately people are allowed to have other life beyond the 
> ROHM drivers :D
> Enjoy your journey(s) ;)

So far so good.  Hi from Shenzhen.  Obligatory pilgrimage to SEG market
done ;)

> >> +	/* Set no channels to be manually measured */
> >> +	ret = regmap_write(data->map, BD79124_REG_MANUAL_CHANNELS, 0x0);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Set the measurement interval to 0.75 mS */
> >> +	regval = FIELD_PREP(BD79124_MASK_AUTO_INTERVAL, BD79124_INTERVAL_075);
> >> +	ret = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
> >> +			BD79124_MASK_AUTO_INTERVAL, regval);  
> > 
> > Where it doesn't make any other difference, align after (
> > 
> > If you are going shorter, single tab only.  
> 
> Single tab only? You mean like:
> 
> ret = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
> 	BD79124_MASK_AUTO_INTERVAL, regval);
> 
> Do you prefer that even if the variable holding the return value was 
> longer than 8 chars? To me it looks odd if arguments on the next line 
> begin earlier than the function on previous line:
> 
> longvariable = regmap_update_bits(data->map, BD79124_REG_OPMODE_CFG,
> 	BD79124_MASK_AUTO_INTERVAL, regval);
> 
> (Just ensuring I understood your preference).
It's hard to come up with an absolute policy / preference on this but
whilst I agree it looks a bit odd, I think it's easier to say one
tab as 'default' choice.  Obviously if it's really hideous for some
reason feel free to do something else ;)

Jonathan

