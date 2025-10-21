Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60567CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muYkugUoG9YqEYkgErcXeBKpGdr1rwIW2Et193mgABk=; b=3okbSrGu52nT325Hge9VpRMFIk
	DvmQg/JqEXlzkoi8ygVClvEdUyV+VxVn3RwRi520Jh6+UwTkP2XMo/Rm2c+xjt3G0Vkmkv6kMMBuT
	6bnkAXjExy25VknmhE7HW0N9Kwh0gibkEUOk3st5vGoPn2/tHZmtfX0NrXYGmoP/n9drwWDz5Y+Hb
	RvL0foBEOBadCLkIwb69HhsA29PT5bsTpbCpFSfgvlUOABdedsMJ2MYGCV+nyNsZ3GdGPJYuAmjKo
	ZVgEcmtSqs3WqBIo8rouAs1T9hSeDIaM2kcNrM2+/JuhRTFvCp6LF5wY11FNgfBR6RYMh2Or5iWOp
	pSbNI9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDyZ-0000000HS18-2aJK;
	Tue, 21 Oct 2025 15:08:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDyW-0000000HRzI-3BaR;
	Tue, 21 Oct 2025 15:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761059310; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jabRgxmdYieIuSmzbQEv6/12y7UNuUzDmuhgk/fZB8KplsevXQ11e9oDZWbF8So8bIau/7jlY62YPItM92bdjO23459+sIzEhaRCMPz+J4bC5GRvJgpcJgEgF3LOp/QgozPSLnFxukTf3FTFVaqln5BA62NVkUw+worGzLU3Rng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761059310; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=muYkugUoG9YqEYkgErcXeBKpGdr1rwIW2Et193mgABk=; 
	b=QAi+XOY6Vm/sX6346oDcN0UC8OyxBpK00jEoXU6FEdD6VSqa3iCF4jGKFHOELVif1t79Nguf3J08pf/OajJVdgFw1Q4eptT+OUSyiMcByQjk9modzfOL/leS/rC8JTrg7l0HpjCfgmqZ9yNS/f8ptg8OH29ssMzERjvuxGJDQv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761059310;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=muYkugUoG9YqEYkgErcXeBKpGdr1rwIW2Et193mgABk=;
	b=aES7UE7N5ujn90NBR5GYRDsaJ4BxJ6NPJhCUPqFne0LskCzNhY1U5pBoFSD1PdL2
	qCko5TUib/A6ra9wuevl09OIN3qy9xRLxWl6IgZ3AUUd60lpGGf3QCnYeESG1paeYJl
	ppajE83RLFAzArRCAp9yDTeqVStkpMrUvO5OMn5U=
Received: by mx.zohomail.com with SMTPS id 1761059307844467.5063031417683;
	Tue, 21 Oct 2025 08:08:27 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexey Charkov <alchark@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
Date: Tue, 21 Oct 2025 17:08:23 +0200
Message-ID: <2063876.tdWV9SEqCh@workhorse>
In-Reply-To: <12339028.CDJkKcVGEf@phil>
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
 <748fd61a-31fb-436f-b028-b47807a4860c@gmail.com> <12339028.CDJkKcVGEf@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_080836_855819_E2B3C366 
X-CRM114-Status: GOOD (  40.66  )
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

On Monday, 20 October 2025 14:31:12 Central European Summer Time Heiko Stue=
bner wrote:
> Am Montag, 20. Oktober 2025, 10:50:58 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Alexey Charkov:
> >=20
> > On Mon, Oct 20, 2025 at 12:31=E2=80=AFPM Heiko Stuebner <heiko@sntech.d=
e> wrote:
> > >
> > > Am Montag, 20. Oktober 2025, 10:19:51 Mitteleurop=C3=A4ische Sommerze=
it schrieb Alexey Charkov:
> > > > On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@gm=
ail.com> wrote:
> > > > >
> > > > > Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assem=
bly which
> > > > > comes physically attached to Rockchip RK3576 EVB1 boards.
> > > > >
> > > > > The display part is driven by the on-chip MIPI DSI controller, an=
d the
> > > > > touchscreen is connected over I2C.
> > > > >
> > > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > > ---
> > > > > Note that backlight support is left out for now, as it depends on=
 PWM
> > > > > support [0] which has not yet been merged.
> > > > >
> > > > > A workaround is simply `gpioset -c 0 13=3D1` to set the respectiv=
e GPIO
> > > > > pin high and thus to light up the display unconditionally.
> > > > >
> > > > > [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0=
ce60c@collabora.com/
> > > > > ---
> > > > >  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++=
++++++++++++++
> > > > >  1 file changed, 89 insertions(+)
> > > >
> > > > Hi Heiko,
> > > >
> > > > Any thoughts about this one? Can we perhaps get it merged for -next?
> > >
> > > Does the gpio-backlight work on that device?
> > > That would make the gpioset hack unnecessary.
> >=20
> > I've got a local patch using pwm-gpio and pwm-backlight as a stop-gap=20
> > solution, but I don't think it's worth merging upstream, because the=20
> > backlight is supposed to be driven by the hardware PWM on the same pin=
=20
> > (not bit-banging the GPIO line). After all, Nicolas has been working on=
=20
> > adding a proper hardware PWM driver for RK3576.
> >=20
> > The display itself works without PWM support, and so does the touchscre=
en.
>=20
> Right now, I don't think we have an actual timeline if/when Nicolas will
> be able to work on the pwm again.

Soon(TM), I've locally reworked the PWM output stuff and core driver
into an MFD. I just need to rework the counter driver now and set up
a proper way to test that the counter works.

I'm hoping to have something next week. If not, then the week after
that.

> So my idea was if we want to
> integrate the baclight as you described below, to have an actual usable
> display and then when the new pwm has landed switch over to that one?

But Heikooooo, DTs should describe hardware, not the lack of Linux
drivers! ;)

=46or what it's worth, the implementation move to MFD didn't change the
bindings as we don't leak that into the DT at all. If it took any
longer for me to get it done I'd have suggested picking the bindings
and then adding a stub GPIO PWM driver that binds to it as an interim
solution, but it's not worth the ickyness when I'm basically just
a day's work away from having this done.

Kind regards,
Nicolas Frattaroli

>=20
>=20
> Heiko
>=20
>=20
> > My temp patch goes like this:
> >=20
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts=20
> > b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > index f20cd6f2c079..5c27fff03569 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
> > @@ -58,6 +58,14 @@ button-vol-up {
> >   		};
> >   	};
> >=20
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		brightness-levels =3D <20 220>;
> > +		default-brightness-level =3D <100>;
> > +		num-interpolated-steps =3D <200>;
> > +		pwms =3D <&lcd_bl_pwm 0 25000 0>;
> > +	};
> > +
> >   	hdmi-con {
> >   		compatible =3D "hdmi-connector";
> >   		type =3D "a";
> > @@ -78,6 +86,12 @@ work_led: led-0 {
> >   		};
> >   	};
> >=20
> > +	lcd_bl_pwm: pwm {
> > +		#pwm-cells =3D <3>;
> > +		compatible =3D "pwm-gpio";
> > +		gpios =3D <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> >   	vbus5v0_typec: regulator-vbus5v0-typec {
> >   		compatible =3D "regulator-fixed";
> >   		regulator-name =3D "vbus5v0_typec";
> > @@ -277,6 +291,7 @@ panel@0 {
> >   		compatible =3D "wanchanglong,w552793baa", "raydium,rm67200";
> >   		reg =3D <0>;
> >=20
> > +		backlight =3D <&backlight>;
> >   		iovcc-supply =3D <&vcc3v3_lcd_n>;
> >   		reset-gpios =3D <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
> >   		vdd-supply =3D <&vcc3v3_lcd_n>;
> >=20
>=20
>=20
>=20
>=20
>=20





