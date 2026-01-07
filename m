Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27380CFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g3VrAehq1DtdyJEabqqf3fDXyycbpVTX+V8NEpPD+w=; b=aYkvyOEWAgmc2/IST4xh+14XzD
	90jqNl4vrmesMorVB7aamKiMoAUo0vo0MADwPdewFuW+oF61syS3sJJP+l1If1g9lFftju+5I/NZj
	zVua1XXwwfzYQw47asPPrJKockQ7cj8jplMB1eHAay5Y3wa7WMu3iwo1j0Le2dHKhutYuE2e6sMPG
	XrDDc81ByDaVISU/R3ln4ypsufS+96MN0+lV9jpsHCGbtySbNf/w2AKhuF3FQxw2IlThWf42VHm0r
	ol3vEWuQXYE96dXPADKZdKwRBdnHed6AkX8iUwHEzejx8nVhwgbsV0x4QIT4UYGvIIL3fUSHTXVWl
	CBC9Co4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW2y-0000000FECs-0q8o;
	Wed, 07 Jan 2026 16:06:09 +0000
Received: from mail-244120.protonmail.ch ([109.224.244.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW2u-0000000FEC6-1H3c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767801959; x=1768061159;
	bh=3g3VrAehq1DtdyJEabqqf3fDXyycbpVTX+V8NEpPD+w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KziO1atL1h1acJHJ/nknbCs7ObEO1ICTzusYp85opcS3th6hdnJOb1o4kr0TijZCW
	 gkhu7tFC8I7wgheAOzmlMPheEO3Vn+u63B2Cnp/yXsw6rQNg0wJb6BNYtc3uHZIWsL
	 AaxXJS008BZ//21a/Gnj6s0FxhPv2f7lwd5eFndRSDdDpI2VSkakvsqplsOlIHikut
	 B5ryQdmRlp1cJ0MAG5WuAAQQneDWMIj4OAPUenerwhgDyj8OIpbDJHEXgMW6CY3VWt
	 JF0d4fK0d0qnlJGeqT3/pEwO8waDmIg8sXCwTJBRZ3lFc8G+qzAAnv8dcjiTbTzh5H
	 vFaIwAf3sTkGw==
Date: Wed, 07 Jan 2026 16:05:56 +0000
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pwm: stm32: handle polarity change when PWM is enabled
Message-ID: <fwaodg2ovh7j47ifwjhgeppxs3oiqht5ecbs7bmfbi7j6djejs@shwokpcmutr3>
In-Reply-To: <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
References: <20260106-stm32-pwm-v1-1-33e9e8a9fc33@geanix.com> <kemjjoyrhqglqq4p2j6kygspevq2mdbiujtnksw4rkdapoqcfy@zte2c7fhqvn3> <2e2iahbzcepbzwgk7xeta2afxmycfjgv2zofzngqjvp4on46r2@mzpi4bz4uqie> <nwhixocvhii27jvcyg7ex5emewntgfhyxa4ds5vo2dphe7xfe4@ibjsjdd5fgmn>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 57d8dde4371b846314f7e2b8b867b714e4f3c48f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_080605_226647_62520A20 
X-CRM114-Status: GOOD (  16.47  )
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

Hi Uwe,

On Wed, Jan 07, 2026 at 04:54:46PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hey Sean,
>=20
> On Tue, Jan 06, 2026 at 11:30:34AM +0000, Sean Nyekjaer wrote:
> > On Tue, Jan 06, 2026 at 11:22:57AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Tue, Jan 06, 2026 at 08:01:57AM +0100, Sean Nyekjaer wrote:
> > > > After commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling"),
> > > > polarity changes are ignored. Updates to the TIMx_CCER CCxP bits ar=
e
> > > > ignored by the hardware when the master output is enabled via the
> > > > TIMx_BDTR MOE bit.
> > > [...]
> > > I have hardware using this driver, will set it up later this week for
> > > testing.
> >=20
> > Very cool, looking forward to hear if you can re-produce.
>=20
> I cannot. I have:
>=20
> =09# uname -r
> =096.11.0-rc1-00028-geb18504ca5cf-dirty
>=20
> (the -dirty is only from enabling the pwm for my machine, no driver
> changes)
>=20
> =09# cat /sys/kernel/debug/pwm
> =090: platform/40001000.timer:pwm, 4 PWM devices
> =09...
> =09 pwm-3   (sysfs               ): requested enabled period: 313720 ns d=
uty: 10000 ns polarity: normal
>=20
> and pulseview/sigrok detects 3.187251% with a period of 313.8 =C2=B5s.
>=20
> After
>=20
> =09echo inversed > /sys/class/pwm/pwmchip0/pwm3/polarity
>=20
> the output changes to
>=20
> =09# cat /sys/kernel/debug/pwm
> =090: platform/40001000.timer:pwm, 4 PWM devices
> =09...
> =09 pwm-3   (sysfs               ): requested enabled period: 313720 ns d=
uty: 10000 ns polarity: inverse
>=20
> and pulseview/sigrok claims 96.812749% with a period of 313.8 =C2=B5s.
> So the polarity change happend as expected.
>=20
> This is on an st,stm32mp135f-dk board.
>=20
> Where is the difference to your observations?
>=20

Thanks for taking a look!
I'm using the PWM for a backlight. With this [0] in my dts:

[0]:
=09backlight: backlight {
=09=09compatible =3D "pwm-backlight";
=09=09pwms =3D <&pwm4 0 125000 PWM_POLARITY_INVERTED>;
=09=09brightness-levels =3D <102 235 255>;
=09=09default-brightness-level =3D <80>;
=09=09num-interpolated-steps =3D <100>;
=09=09enable-gpios =3D <&gpiof 12 GPIO_ACTIVE_LOW>;
=09status =3D "okay";
=09};

Maybe that is doing something differently.

/Sean


