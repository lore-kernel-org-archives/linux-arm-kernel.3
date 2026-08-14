Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A54AC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXdGXpEaeSzo6LucHd30eYR/GtpdrDPatB4CgfYUQF4=; b=tLtqk+pzizAQUCKeLB3MINxzHe
	sGv+0+kHzzUZ59jRaLE2QjovHwyh5VcphZcclrJWi4Yw9DH3AIQ1D0Z9wvMvwqhN1JXzr81eX1Vr8
	si+j8ZyGANDeVInGLo6N3NZVq6lThjFX/6D5czT+pxKBOawIyZ1/1tuEDJAXNIfFcSytVdJuHzqgz
	iZAHfQmXDP5RNXXk1cutd1K1+MHn8Wj5Y4Vy2hD6NK2sQ8GeTj7754zmvmFTRvg7fsoPGzQGiQjoS
	dub4T+oWM9gyBJoSHnDm5+sz5K4T1K1q7psnELm85fF2zOPbJFOX0f5w6hYqEpR4Si1PsZLWHQXKd
	RXcwn3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup0E-00000002Uy1-01ee;
	Fri, 14 Aug 2026 10:19:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup0C-00000002Uxi-185X;
	Fri, 14 Aug 2026 10:19:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91B34600C3;
	Fri, 14 Aug 2026 10:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B73A1F000E9;
	Fri, 14 Aug 2026 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702742;
	bh=NXdGXpEaeSzo6LucHd30eYR/GtpdrDPatB4CgfYUQF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/QXCTjI36E8mBXEr6GvChfoeqasCRqIBQhD+HHSxLkNy/ZkATKjNyVKWxSFnDy3R
	 o01xFHf7H63TWszeKcUx7lJTvk6qMIXPWPoBzJ0h+EbMzWr9dH+9Qd9GE1k7YFp2TH
	 1sPCvaVkqjB7uR5mqkCfGoaaqNsu7Ki3477kNdUXzrn8/OMane3Gl+7vb5UHmJAvyp
	 tFmN/agBMSAAgKSRAth53CIWXe/CE7KXsmUdELHOi4gIJnxwIpn0l1InPUPcP0IFW6
	 jVhFtxWsRp0/vyYrS8gXqIVkj88/r3e3OoAwlgujhMK+I00XX6qpxww0bQsGeAptdA
	 Of4GkzD49p0Dg==
Date: Fri, 14 Aug 2026 12:18:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Vladislav Leonov <vlad@zlab.su>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Aurelien Jarno <aurelien@aurel32.net>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wu <david.wu@rock-chips.com>, 
	Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Olivia Mackall <olivia@selenic.com>, 
	Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 00/25] ARM: rockchip: Add peripheral support for RV1106
Message-ID: <20260814-vivacious-nickel-copperhead-c746f6@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810113548.7fd24d56@kernel.org>
 <anq1ouUnKA02Eauj@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <anq1ouUnKA02Eauj@monoceros>
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

On Tue, Aug 11, 2026 at 07:43:16AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Aug 10, 2026 at 11:35:48AM -0700, Jakub Kicinski wrote:
> > On Mon, 10 Aug 2026 15:10:51 +0300 Vladislav Leonov wrote:
> > > Basic support for the Rockchip RV1106/RV1103 SoCs currently under rev=
iew.
> > > This series builds on top of that and enables the peripherals needed =
to
> > > bring up a board beyond a serial console:
> >=20
> > Don't expect maintainers to dig out patches for their subsystems
> > from a big series. This is not how upstream development works.
>=20
> I see this from time to time and I personally think it's fine to have
> these patches together. Also the only the patch that affects my
> subsystem was Cc:d to me which is how I like it (but I think opinions
> differ on that one, too).
>=20
> `b4 am -P _` is great!

Yeah, and with DTS being patch 3, patch 6, 10 ...  and so on, it is
every easy to review and pick up.

No, there is only one case of combining multiple subsystems together -
upstreaming new SoC vendor. All other cases are wrong and spreading DTS
all over is just proof that this is poorly readable and poorly
reviewable.

Not even mentioning the rules of dependency on DTS expressed in
submitting patches.

Best regards,
Krzysztof


