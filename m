Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0D2C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdB771dZ+rBXjQh6pZ43Jwf+R6ErJMfzPFbhNeRcU8Q=; b=OoXOSmYtfg02uU0U6S3ecoeMoF
	KWpWYuXgeKg94lItMCNxg1dT7X/UWv7DBfIDwlgZdbVBkaepjecLRlRht/i5KFR8HfFlm1V2qUCJB
	2N3/ZynaghExoC7VoMslk9jeRM13Eb6q6OiHwbfcSVie6S3gQawESGOgJEvyGVgsQksX5tXEKi9ei
	z5BTf962LrCdyM7RWpr9PKzZOxgcLD3x7NB/UkpoCXPAJOQuY4K2I3ZRZV1a3x2Hl0GLqq47LFx52
	G5pt/BSKhDztUs4e38FR3U+EJ3rXwYOsrGIslyiDQghkINhYuO8cwe+ZpYlUvc+UwkWPhsJBTSMJp
	UObjeL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbCs-0000000EzHr-1SGZ;
	Wed, 07 May 2025 09:36:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaR4-0000000EoXA-0uEz;
	Wed, 07 May 2025 08:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06997A4D695;
	Wed,  7 May 2025 08:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CFEC4CEF0;
	Wed,  7 May 2025 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746607644;
	bh=MdB771dZ+rBXjQh6pZ43Jwf+R6ErJMfzPFbhNeRcU8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTm00zAyhcWrsX4BME9KZK2kC3hR5vJT7cn7ILyHRXaomvTptRS9GUP/HG6k9hu8k
	 Hq4AMtQa4GpS/h8r3edxpRGPz9taUPlNsiOPZmdcY7+8EwWgsUO2TzgzsabLN8wWST
	 KT58nnqyz4/X2JlQAX5aTAxteeE9JP5TkGgneolB79YuxkY9yQP0vs95FRZ4i0ROjA
	 FmKtm6llZIYTG8TpynIuQk9YytQJX+Z85NHrhPj9eLOYPUecb0B5H72gKUZIl/GGjo
	 6OGzqdJhBiGOa/xyjTWDQT1rJuEVB5m7/Fncg94VEjofdsuwSEOUMGCn2/LEZz6z1E
	 fl0a4dJeANYdQ==
Date: Wed, 7 May 2025 17:47:18 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 6/7] counter: Add rockchip-pwm-capture driver
Message-ID: <aBseFo-EC-PzxiqM@ishi>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <9YSDgp1lgx6iAp5HG0vS5k0VtP_qnX2YlyDlQOHRYJPU1rRcefCFy8b_ypj4EiQ4i-68q1yIjttcwaTg92zWoA==@protonmail.internalid>
 <20250408-rk3576-pwm-v1-6-a49286c2ca8e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXULWcVOlYB0+4sM"
Content-Disposition: inline
In-Reply-To: <20250408-rk3576-pwm-v1-6-a49286c2ca8e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_014726_377487_DA08806B 
X-CRM114-Status: GOOD (  27.35  )
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


--xXULWcVOlYB0+4sM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 02:32:18PM +0200, Nicolas Frattaroli wrote:
> Among many other things, Rockchip's new PWMv4 IP in the RK3576 supports
> PWM capture functionality.
>=20
> Add a basic driver for this that works to capture period and duty cycle
> values and return them as nanoseconds to the user. It's quite basic, but
> works well enough to demonstrate the device function exclusion stuff
> that mfpwm does, in order to eventually support all the functions of
> this device in drivers within their appropriate subsystems, without them
> interfering with each other.
>=20
> Once enabled, the counter driver waits for enough high-to-low and
> low-to-high interrupt signals to arrive, and then writes the cycle count
> register values into some atomic members of the driver instance's state
> struct. The read callback can then do the conversion from cycle count to
> the more useful period and duty cycle nanosecond values, which require
> knowledge of the clock rate, which requires a call that the interrupt
> handler cannot make itself because said call may sleep.
>=20
> To detect the condition of a PWM signal disappearing, i.e. turning off,
> we modify the delay value of a delayed worker whose job it is to simply
> set those atomic members to zero. Should the "timeout" so to speak be
> reached, we assume the PWM signal is off. This isn't perfect; it
> obviously introduces a latency between it being off and the counter
> reporting it as such. Additionally, periods longer than the timeout
> value will cause the count to "flicker" between the correct period and
> duty cycle values, and zero. This is because there doesn't appear to be
> a way to reset the hardware's internal counters, even when writing to
> the registers.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

I just want to give you a heads-up that I'm looking over this but it's
going to take me a couple more weeks or so; this hardware is a little
weird so I want to properly grok it before I Ack such a driver. In
particular, I'm not sure yet that the counter subsystem is necessarily
the right place for this functionality if you're ultimately after values
in units of time (sounds more like a clk framework feature) -- but we'll
determine so together.

That being said, please continue on to a version 2 of this patchset if
you have other changes ready -- I don't want the counter driver
bottlenecking the development of the rest of this series when progress
can be made independent of it.

Thanks,

William Breathitt Gray

--xXULWcVOlYB0+4sM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaBseFgAKCRC1SFbKvhIj
K3NnAP9fPfygexiooPBDY7YMa3FOYHLiEwL3Ff8romDthgeuZAD/U02/o2pFHFC2
oc7TaVdshAg8bTYLocZqBxZrWjFAHgM=
=fgvr
-----END PGP SIGNATURE-----

--xXULWcVOlYB0+4sM--

