Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E0D5B156
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHYLe5urkgKtO4vmgOF0dkQjGaVqg2rsS9Oi466koKw=; b=vwbTaYMXNrL6nq72qCuHakoCTq
	BSFT5ZGTKOpvATNGnMSrhQzWQuI9beMR7zDydLTwm/1RXiClLDO7VpFvmlWHQS4ID1Glj69x4v0Lk
	5ElUQLSdOThaWlkjFT+rHpGILanKmGZF+ipJugJ7a9oFsdvkvIENWs0mvZ6DWulkSPA32pHexZtiH
	f8MxiGTDH2EOhKLURdC//LRJ80nzFhq7eT8MXoB+pYejiO9496YeMBVGESCapew/h2ORNAbSn9tez
	NjHli7QvypMe6hdGat8+CnfvhM4K4umxytYNG841wu05tewmOqfIO4K80o8sgaOM2xjbmHSLrwViR
	quWUrxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X3q-0000000CIsL-0bKd;
	Mon, 28 Oct 2024 21:14:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wa0-0000000CE66-32mT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D94E8A42CA9;
	Mon, 28 Oct 2024 20:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87CDC4CEC3;
	Mon, 28 Oct 2024 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730148191;
	bh=s8xdgSpvjF3jVk8zZ7hP09SEqxjKFStind40EgWLYn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L3jN2Fezr5ARPVhpBrkvWwmHcDMSfrfZMJJvW3edOuFLaXR+77sC3400nfFwb+B8o
	 NH8qUeRShNkoDicUkG361p4T2I7YjGdYL9/KzchATRzg9SEP+BH7Sp9JD4m0mOIL6b
	 rgJRuxuOChTfGDhjpFcZR2koCagwPOABfXlXtblDACiJV9MYYtkVTzi/JogOM13EWj
	 UbIyXbVrlHac+cHP5pxrYBNX8+w0S1oV1gWvKGhy88OBLM/VX451Ip5SdFvnw3P1C5
	 4Dd2UFJIVx2e8UtJ03kWcLCxq9eD1VX/iFdB8wlGajo8TpNpPld/CQeRrm4a95XXlx
	 s4j2NwISfUALA==
Date: Mon, 28 Oct 2024 20:42:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kaustabh
 Chakraborty <kauschluss@disroot.org>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <trabarni@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ondrej Jirman <megi@xff.cz>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Dragan
 Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] iio: light: stk3310: support powering off during
 suspend
Message-ID: <20241028204258.4745e202@jic23-huawei>
In-Reply-To: <20241028142000.1058149-1-aren@peacevolution.org>
References: <20241028142000.1058149-1-aren@peacevolution.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_134312_926321_D554BE22 
X-CRM114-Status: GOOD (  22.18  )
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

On Mon, 28 Oct 2024 10:19:54 -0400
Aren Moynihan <aren@peacevolution.org> wrote:

> In the Pine64 PinePhone, the stk3310 chip is powered by a regulator that is
> disabled at system boot and can be shut off during suspend. To ensure that
> the chip properly initializes, both after boot and suspend, we need to
> manage this regulator.
> 
> Additionally if the chip is shut off in suspend, we need to make sure that
> it gets reinitialized with the same parameters after resume.
> 
I took a quick look and nothing to add to Andy's excellent review.

J
> Major changes in v3:
>  - Use bulk regulators instead of two individual ones
>  - Replace stk3310_remove with devm callbacks
>  - Hopefully I haven't missed anything, it's been a while since I worked on this
>    patch, and I didn't take good enough notes
> 
> Major changes in v2:
>  - Add handling of the IR LED. I was hesitant to include this as it is the
>    same as pull-up regulator for the i2c bus on the hardware I have, so I
>    can't test it well. I think leaving it out is more likely to cause
>    issues than including it.
>  - Convert stk3310 to use dev_err_probe for errors.
>  - Always enable / disable regulators and rely on dummy devices if they're
>    not specified.
>  - more listed in individual patches
> 
> Aren Moynihan (5):
>   dt-bindings: iio: light: stk33xx: add vdd and leda regulators
>   iio: light: stk3310: handle all remove logic with devm callbacks
>   iio: light: stk3310: Implement vdd and leda supplies
>   iio: light: stk3310: use dev_err_probe where possible
>   iio: light: stk3310: log error if reading the chip id fails
> 
> Ondrej Jirman (1):
>   arm64: dts: allwinner: pinephone: Add power supplies to stk3311
> 
>  .../bindings/iio/light/stk33xx.yaml           |   4 +
>  .../dts/allwinner/sun50i-a64-pinephone.dtsi   |   2 +
>  drivers/iio/light/stk3310.c                   | 156 +++++++++++++-----
>  3 files changed, 118 insertions(+), 44 deletions(-)
> 


