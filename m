Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D0CD41C30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJ3bR7NP6yUdrnlMpAZ95ydSaHbPQlqJpHBl9pVaNIQ=; b=H7fENXcrd77k7rWv57UEpka1lX
	f7NglGwaKN7oAF5xiaIJggwFufvHT6x1UNM4FcxDMj8SqUEOY2Zw5S8IZ4ail0wOmeW9MecaoVu+4
	YZzcsLn+FCuBK5OQKahld6yzb5O1Hl7ioiOuVKeZZDz5As+5+tqiTjDAP7oX07A+ShHaYP/TvkP/7
	VJWT/8L7NJjB8yJl9ZIoEOqMIANj480stqqk1tEGs5Pqoe5LYXjoKWFF4HN/OsSgg+hscIItLkOFW
	HtkwO/xjrp6GQo6vQG70F9p0aQIdH5KuBSOT0iyHgz0CgIYyRTve7mH5kLx+nkzIrAebhfonUf9RA
	+HVF9jIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAgz-00000006Slg-2dwZ;
	Wed, 13 Nov 2024 10:33:45 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAY3-00000006QtV-49V7;
	Wed, 13 Nov 2024 10:24:33 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e5f835c024so4067369b6e.2;
        Wed, 13 Nov 2024 02:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493471; x=1732098271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJ3bR7NP6yUdrnlMpAZ95ydSaHbPQlqJpHBl9pVaNIQ=;
        b=UWwsiRAZJu5swjJj5FxTV5nC4DqFnZNhmzyE+Rl0KyAVZp1+RN5XfRsSNKZKYJ0ub9
         P5ZddramX70wIaCtYHBiSuw/QztYtNpDF5D211unrlE7f8CsMX7H5Sa2tQBSNd14wI60
         9d4NVSzBDSm37iQFh8d1fxyCLIqB682AB1i46/kR3vYTCDBPmD5nvj8hg70qqBLb7JP8
         IXHL9cBO46CSmashglTQT6RHCbliNlmBVWzGL2jKA11qxJgyn9ZbY1+GLFU3BmBrIjt7
         zESs6y3o2u/Id3gGmT3gDNTZQZAfjYR2i6mn8/CjP5nwpk0IG2bdjSHMJJYNwcjT7Pig
         NuaA==
X-Forwarded-Encrypted: i=1; AJvYcCUYXO96QcfAy/ZUsU9/A7vqjNo7pgpmP8gro7aXGMhRe1G4JvO5/TjSLVrHvH9J2fz7ptJ1srGfL9FfVryBD30=@lists.infradead.org, AJvYcCVB9FkxVdq0GZ355hWaeT889hbdlIumKq2m/kDKuqEEV0+t2cVeFlPjb3cZw46XzR7cf+wBEw0YNOiC5JkB4WqQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfa+P27KKTE8H6IiN1puYDmpH2Araqh2auK6lNSiXeajdpNswP
	DxrT5xGGK7LqHOwGfutnxC9OVDY+/jMJ+T3YmjlICy2bnbTbcrbdq9pvgGy0
X-Google-Smtp-Source: AGHT+IGCDc1HEyve8xuOtWI4FgIE6STXWM+8RhPSvKJp5n2XLQd15MkxzkpBxK31kJkEjc82kYu9Pg==
X-Received: by 2002:a05:6808:4393:b0:3e6:10d1:ecb6 with SMTP id 5614622812f47-3e794737fd8mr15203906b6e.28.1731493470685;
        Wed, 13 Nov 2024 02:24:30 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f2e98d1sm12146125a12.0.2024.11.13.02.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:24:30 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so5296020a91.1;
        Wed, 13 Nov 2024 02:24:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJjH4bXEmv6uc3Kc9Lxs/E350aD5r0SheMy8/6D0EwzgN1uEJZ0w3YDVp/Kx5XMBJYEPranJ1Uo4FuJeNymcKz@lists.infradead.org, AJvYcCWquGAnwxnBAZwhbmJVMCBEwqJB+Vh+UhbMhKWNf8BMi8R3goPj0O4YL4SKwi+ijyCMovVVqkWkHLknHCnJ04E=@lists.infradead.org
X-Received: by 2002:a17:90b:540b:b0:2e1:682b:361a with SMTP id
 98e67ed59e1d1-2e9b177fce7mr25968056a91.28.1731493470115; Wed, 13 Nov 2024
 02:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-2-tszucs@linux.com>
 <c89c2f16-ffb0-4b61-a962-9705f9f1e0e2@kwiboo.se> <CA+GksrJzkxffSQbuseGFL0=2PDxV+TRevX0-NOkc6FNYLmNgYA@mail.gmail.com>
 <e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se>
In-Reply-To: <e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Wed, 13 Nov 2024 11:24:18 +0100
X-Gmail-Original-Message-ID: <CA+Gksr+E6_cf46iKEufWLvQwAbsuC15nq6O6N6gP=x2-BVTnSA@mail.gmail.com>
Message-ID: <CA+Gksr+E6_cf46iKEufWLvQwAbsuC15nq6O6N6gP=x2-BVTnSA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add supported UHS-I rates to
 sdmmc0 on rock-3b
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_022432_054410_6220DCAC 
X-CRM114-Status: GOOD (  38.92  )
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

Hi Jonas,

On Tue, Nov 12, 2024 at 11:37=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wr=
ote:
>
> Hi Tam=C3=A1s,
>
> On 2024-11-12 15:36, Tam=C3=A1s Sz=C5=B1cs wrote:
> > Hi Jonas,
> >
> > Thank you for pointing this out! I haven't noticed this before. I've
> > done some testing and I believe I am able to reproduce the issue you
> > described, although I cannot confirm the reason.
> > The only occasion I encounter any problems is when a UHS SD card or
> > SDIO device is connected to sdmmc0 during bootup. Sometimes the device
> > is recognized as HS only. Obviously no tuning value reported. Also,
> > sdmmc2 cuts out completely. I'm booting from eMMC and when the SD card
> > is removed in this state I lose my rootfs. Certainly, this needs more
> > attention but it seems to be unrelated to the changes here.
> >
> > I need more time to check but are you sure this SD card during bootup
> > issue is gone with UHS-I disabled?
>
> Yes, the issue is that the io voltage domain must be configured to match
> the io signal voltage used, and to use uhs the voltage changes from 3v3
> to 1v8. Causing a miss-match between io voltage domain config and the
> regulator voltage used during initial probe, unless io-domain driver
> happens to be fully loaded before mmc devices are probed.
>
> >
> > Also, in every other case, when you connect any device to sdmmc0 after
> > bootup, performance and stability is perfect.
> > Interestingly I also don't experience this behavior with an eMMC
> > device and / or an SDIO device connected to sdmmc2 during bootup. Only
> > sdmmc0 is problematic and only during bootup.
>
> Yes, as you have discovered, inserting the sd-card after system has
> booted and io-domain driver has been loaded, everything can work as
> expected with uhs speeds.
>
> Until this probe race condition has been solved booting with a sd-card
> inserted may or may not result in wrong tuning or other related issues.
>
> Because of this I advice not to enable uhs mode for sdmmc0 at this time.

All right, and thank you for the explanation. My hands are full at the
moment but let me think about this.

>
> Regards,
> Jonas
>
> >
> > Any more thoughts on this are very welcome.
> >
> > Kind regards,
> > Tamas
> >
> >
> >
> > Tam=C3=A1s Sz=C5=B1cs
> > tszucs@linux.com
> >
> > On Mon, Nov 11, 2024 at 8:00=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se>=
 wrote:
> >>
> >> Hi Tam=C3=A1s,
> >>
> >> On 2024-11-11 19:17, Tam=C3=A1s Sz=C5=B1cs wrote:
> >>> Add all supported UHS-I rates to sdmmc0 and allow 200 MHz maximum clo=
ck to
> >>> benefit modern SD cards.
> >>>
> >>> Signed-off-by: Tam=C3=A1s Sz=C5=B1cs <tszucs@linux.com>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/a=
rm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >>> index 3d0c1ccfaa79..242af5337cdf 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> >>> @@ -670,8 +670,14 @@ &sdmmc0 {
> >>>       bus-width =3D <4>;
> >>>       cap-sd-highspeed;
> >>>       disable-wp;
> >>> +     max-frequency =3D <200000000>;
> >>>       pinctrl-names =3D "default";
> >>>       pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det=
>;
> >>> +     sd-uhs-sdr12;
> >>> +     sd-uhs-sdr25;
> >>> +     sd-uhs-sdr50;
> >>> +     sd-uhs-sdr104;
> >>> +     sd-uhs-ddr50;
> >>
> >> There is an issue with io-domain driver not always being probed before
> >> mmc driver, this typically result in io-domain being configured wrong,
> >> and mmc tuning happen before io-domain is correctly configured.
> >>
> >> You can usually observe this by looking at the tuning value during boo=
t
> >> and comparing it to the tuning value after removing and re-insering a
> >> sd-card.
> >>
> >> Because of this uhs modes was left out from initial DT submission, som=
e
> >> cards will work others wont, sd-uhs-sdr50 is known to be working with
> >> most cards even with the probe order issue.
> >>
> >> Also I thought that lower speeds where implied?
> >>
> >> Regards,
> >> Jonas
> >>
> >>>       vmmc-supply =3D <&vcc3v3_sd>;
> >>>       vqmmc-supply =3D <&vccio_sd>;
> >>>       status =3D "okay";
> >>
>

