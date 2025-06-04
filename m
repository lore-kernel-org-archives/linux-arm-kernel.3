Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE49EC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 19:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXCEiM39Ukk34aOzUk8oPBSr5pdnK8+2MaECbIa3iYo=; b=u+3EJ/1dVAx1b6MWADyuXS3PuJ
	uLOOq7m6JMfd7zikBbmxWw4jQQhvdqU8FUOli7geIsQTSy7KKWEOsZYIgyViS52xIcULHxd954hE1
	l9O86HRoMzZrGk54AhbOKgkPmwK4FApQFGzzgu4MVxw98YN6luUqROe5YjDFDb9wvnvTwdS/TVLSo
	4+WPTEL8GBkw6zjLwKcJ6KMvzQhS063+rNUCfwG4c/y7szNWWPK0aV9ouaar7X6157WopoIYNKtZc
	JHVbSHBlEGYL+AE5QrmJk7Vm7gCLlzzwDHvi3GqZGYdnPbJpJwy8DUQ5+8wxXHIxVD+JxatX1n8GF
	mTuQW5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMu8d-0000000E7vJ-3xOJ;
	Wed, 04 Jun 2025 19:51:03 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMu6Y-0000000E7mE-0DHY;
	Wed, 04 Jun 2025 19:48:55 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4947635914aso1752051cf.3;
        Wed, 04 Jun 2025 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749066533; x=1749671333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXCEiM39Ukk34aOzUk8oPBSr5pdnK8+2MaECbIa3iYo=;
        b=hZqBfrr650J0WpY1ZtzUllrEav5P38zMscFceiE8bj5GiFCmhWH5jLieplZGDdSgyN
         bEEEDKKPSfGgY3BywPaUx15TyrT/38L1WJprlb++eyBkC9cb7s+ehUy9CCmLEqsnHsvi
         zgKPK6Na1ZrdYu4dCnltyL8CR81KzvQ9L7Djp+AHvLDRW/iG1nj3dDTjwf9KrJBIqXRL
         U8kQLgOg7bTjtPC91ObBFDeAVFnTJv0GIWbAB1drJd1YaRthilHJkq3cP0FxukHhVRJP
         ADlDmaaJ1yGQRWRr9jbwv8gvqelT6Jjzx0rzeZZD+CdEIRpeHi41zzdQsYxHMl9KhdPw
         65iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749066533; x=1749671333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXCEiM39Ukk34aOzUk8oPBSr5pdnK8+2MaECbIa3iYo=;
        b=n2izVYqH14T8Nl8goWSWxi17vzkXvzFvMJh3Ol/f+AhS7oCSuPH4kaoGzflnYZ7uYL
         0YsLoaVJaDeR40KceFpljncenuoC8uuUA+Sw7eCouOHkL8t6D7lsp/U4hYwn1jUjtTMq
         TZ0Kmd1Jowtg1Uv4uXypXx4FKOgBuex8cy7AVN4vS/gUWx/xTGPhXjfarCnKAU1QpI8h
         tGxbU14ywf2wIbqeEOHeNso9vmkZx106cnf25MKDgdS+Ol/4AX/6bk25UrGMPuOvjJjm
         d6Dflub94s2CXy1TKdPh5kK/Cfosl/9fmAecz+jWu37p458x3cO+NHDduhne0MpuiKSB
         R6gA==
X-Forwarded-Encrypted: i=1; AJvYcCUM7kK4x+iPPc5lS9FiWFnyFgrZSYkVztJ4ZtVRKulAywYGHnoSvYzqY9yXYiJ5e86bjH/vxiDIhJKZDnS/TPw=@lists.infradead.org, AJvYcCXa9zuPnku+4RtKkYCXfdoUSKxdQ3PhJiWRKapk9r6aVcWwmdGAczLBGgcNiYJsD6qchq+3UGnmEVe0RZEiBZi5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6X8iqZoO5j18/foZiogIGf0CzNCekupZKBHwlth12Q9ISvScx
	/ecrhSJsp7dryfb3Sld/7jHM59hoMz6gMRPjON8nVoqwSz5/ySal1q8WPPDJw+Cvoo/M9j9vcXp
	I/9hYu8qmlOu4l1r3aPm+A5h0kxM+nS4=
X-Gm-Gg: ASbGncsqlsZWtRdfMwpl6ngnk/NDp4y4+EBx8kOQAsKiB/oZMIelOeqbUS9L2Ys/l1a
	THVn/iIUWg9n/aL0KYuIScIdxmYeRJmLb71O0peYBrV/qKM8SLEME3tPG5Y32kPQbl2lgI1a9EV
	uOEiOJW/2IKtcAUtu8bAGbKcl4oqzjtmW9ntSJrdZY57+J5hcnIe9utdgihCOW+5X/bA==
X-Google-Smtp-Source: AGHT+IGSdI2iH/78lCpY/FmdwOq/0KffeZV59xBksGE/iPhTqYe2o31X/3h4uGApiFiXXDlOU73adxdduyt5opuFIUk=
X-Received: by 2002:ac8:6f19:0:b0:4a4:4101:ab1a with SMTP id
 d75a77b69052e-4a5a57c075emr74586571cf.2.1749066532673; Wed, 04 Jun 2025
 12:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <11432858.nUPlyArG6x@workhorse>
In-Reply-To: <11432858.nUPlyArG6x@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:48:42 +0400
X-Gm-Features: AX0GCFsV9N6fbULTUWmk0HhznU6dkWbShbjvuaRV-K_xsoCC--s5HEFjxZb7NOA
Message-ID: <CABjd4YzxvG6u8g8OjCBSOe6Zddk6Fe-sv+M5-8Si2-=Vw8qHBg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_124854_091597_8ED4967F 
X-CRM114-Status: GOOD (  45.65  )
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

On Wed, Jun 4, 2025 at 11:01=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 3 June 2025 19:01:15 Central European Summer Time Alexey Char=
kov wrote:
> > ArmSoM Sige5 uses a soldered-on SDIO connected WiFi module. Namely,
> > board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a Broadcom
> > based BW3752-50B1.
>
> Okay, so there's two board revisions, which makes this patch and the
> following that adds bluetooth a problem. This patch here doesn't
> seem to actually add the SDIO Wi-Fi module node where it'll differ,
> so skirts around the issue AFAIU. It might also be that it's not
> needed for you and I just don't notice because I have v1.1 where the
> SDIO driver for that module doesn't exist yet iirc.

The WiFi module actually probes just fine without explicitly listing
it in the device tree, because SDIO is enumerable (unlike
UART/serdev). Pin configs and the lpo clock are pulled in by the
mmc-pwrseq part, and with that it just works as long as the drivers
are in place (which is the case with the Broadcom module, but perhaps
not yet with the Realtek one).

I haven't tested the wake-host functionality, given that there is no
suspend support anyway (no Rockchip SiP communication support in
mainline, and nothing to ask ATF to suspend the main CPU like
downstream rockchip_pm_config.c does). Guess it doesn't work, because
nothing binds the respective GPIO to the WiFi driver right now. But I
do get a WiFi connection without it.

> But what we should think about is first doing
> - probably add a new compatible for armsom,sige5-v1.2
> - git mv arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts \
>          arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtsi
> - commit here like Sebastian Reichel had to do for [1]
> - create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
>   that includes the dtsi and moves the model and compatible property
>   there. Make sure the model includes v1.1 in the name, compatible
>   should remain the same
> - commit here that will be a squash commit like Sebastian Reichel
>   had to do in [2]

I believe another way to do this is with --break-rewrites, as Dragan did in=
 [1]

[1] https://lore.kernel.org/all/9ffedc0e2ca7f167d9d795b2a8f43cb9f56a653b.17=
17923308.git.dsimic@manjaro.org/

> - create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2.dts,
>   could be adding the Wi-Fi node here to cut down on how many patches we
>   do. I assume you only have the v1.2 board and can't test the older Wi-F=
i,
>   which is fine.
>   compatible should probably be something like
>     compatible =3D "armsom,sige5-v1.2", "armsom,sige5", "rockchip,rk3576"=
;
>   Don't forget to change the model property as well.

Given that the user would have to manually feed an appropriate DTB for
their board to the bootloader, and given that the WiFi/BT module used
is the only difference between v1.1 vs. v1.2, this doesn't seem to be
much easier for users vs. applying a DTBO... But more churn in the
kernel just for that bluetooth function. With a DTBO we could keep the
same compatible and just move the Bluetooth node into an overlay.

Happy to go either way. Wonder what Heiko prefers?

> I know this will be a royal PITA, especially considering they'll likely
> never produce v1.1 again and it now hogs the name, but keeping the
> current dts as 1.1 may be the best way forward, as it keeps compat (thoug=
h
> the Wi-Fi changes won't affect anything already in there) and will stop
> people from accidentally picking the higher number better DTS like what
> happens with rockpro64 all the time where the non-numbered DTS is 2.1 and
> the numbered one is 2.0 and people keep picking 2.0.

Quite a PITA indeed :)

> > Add required device tree nodes in the SoC .dtsi for the SDIO controller
> > and pinctrl / clock wiring in the board .dts for the module itself.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 36 ++++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++++++++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > index 7ce1fb1380b0863c902fdd9cbc7454ee6011cf92..dcd033859398312f7693beb=
b7f080ee4f2ecaa32 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > @@ -219,6 +219,15 @@ vcc_5v0_host: regulator-vcc-5v0-host {
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&usb_host_pwren>;
> >       };
> > +
> > +     sdio_pwrseq: sdio-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&hym8563>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wifi_reg_on>;
> > +             reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> > +     };
> >  };
> >
> >  &combphy1_psu {
> > @@ -781,6 +790,16 @@ usb_host_pwren: usb-host-pwren {
> >                       rockchip,pins =3D <4 RK_PA4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> >               };
> >       };
> > +
> > +     wireless-wlan {
> > +             wifi_wake_host: wifi-wake-host {
> > +                     rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> > +             };
> > +
> > +             wifi_reg_on: wifi-reg-on {
> > +                     rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> > +             };
> > +     };
> >  };
> >
> >  &sai1 {
> > @@ -808,6 +827,23 @@ &sdhci {
> >       status =3D "okay";
> >  };
> >
> > +&sdio {
> > +     bus-width =3D <4>;
> > +     cap-sdio-irq;
> > +     disable-wp;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     no-sd;
> > +     no-mmc;
> > +     non-removable;
> > +     sd-uhs-sdr50;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc_3v3_s3>;
> > +     vqmmc-supply =3D <&vcc_1v8_s3>;
> > +     wakeup-source;
> > +     status =3D "okay";
> > +};
> > +
> >  &sdmmc {
> >       bus-width =3D <4>;
> >       cap-mmc-highspeed;
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3576.dtsi
>
> Okay, I think adding the sdio node to the SoC dtsi should be a separate
> patch before this one.

Fair enough, will split it out, thanks!

> > index 1086482f04792325dc4c22fb8ceeb27eef59afe4..a09582470bb7f654b711308=
da1e51fa8571ca1e8 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > @@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             sdio: mmc@2a320000 {
> > +                     compatible =3D "rockchip,rk3576-dw-mshc", "rockch=
ip,rk3288-dw-mshc";
> > +                     reg =3D <0x0 0x2a320000 0x0 0x4000>;
> > +                     clocks =3D <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>=
;
> > +                     clock-names =3D "biu", "ciu";
> > +                     fifo-depth =3D <0x100>;
> > +                     interrupts =3D <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
> > +                     max-frequency =3D <200000000>;
> > +                     pinctrl-0 =3D <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc=
1m0_bus4>;
> > +                     pinctrl-names =3D "default";
> > +                     power-domains =3D <&power RK3576_PD_SDGMAC>;
> > +                     resets =3D <&cru SRST_H_SDIO>;
> > +                     reset-names =3D "reset";
> > +                     status =3D "disabled";
> > +             };
> > +
> >               sdhci: mmc@2a330000 {
> >                       compatible =3D "rockchip,rk3576-dwcmshc", "rockch=
ip,rk3588-dwcmshc";
> >                       reg =3D <0x0 0x2a330000 0x0 0x10000>;
> >
> >
>
> So in conclusion:
> - bindings patch adding v1.2 compatible
> - SoC dtsi patch for the sdio node
> - git mv patch
> - rk3576-armsom-sige5.dts patch, ask maintainer to squash it into the
>   previous patch, make it obvious by giving it the same subject or someth=
ing
> - rk3576-armsom-sige5-v1.2.dts patch
>
> Sorry to drop all this on you, it's a little unpleasant and in-the-woods
> with regards to preparing a patch series. Basically, the reason why I've
> held off on this for the moment is that I don't have a v1.2 board and my
> v1.1 board's Wi-Fi module doesn't seem to be supported (yet).

No worries, thanks for delving into all this stuff with me - much appreciat=
ed!

Best regards,
Alexey

