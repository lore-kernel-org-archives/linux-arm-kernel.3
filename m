Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96829D29DF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8KWgyjMXHabGU6AkOW8T5Mt3kkTj5EnHFmAPDuCp/M=; b=rUjJibzk053OF+vx3qjOnoXwBZ
	syNFnimLEXHFQBds3Z6TmEadK3tcPYlK7Q6HSBk/HzQDLS1ByPPuSVXV3DDbWFlc0E0tThhHf1Z74
	5D0USg+YB6aQ5vOHfFXPAYacjIoflaKQ1UNn0EvIcYaBI8nVzDeeeeqLArdgxv5h49wRn7vyz+REk
	vk+tW6FFBjksl8cJCwY6Q4k4ymqnKJOZ0fnzV8xAzXCxnsdoEkzEunZwpTp0xr/1sV6mznaUdCEQU
	RBFVSTLF3JGnMG0eXUTZT19CWN5FcOhIfzuakmxa7IrB2ljWvgISVGn8FWnnP/mBw/cuJoreNgmAM
	1rZp5jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfar7-00000006qpp-31z6;
	Tue, 13 Jan 2026 09:38:29 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfar4-00000006qob-1MqF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:38:27 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38316d0c26eso40250761fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768297104; x=1768901904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8KWgyjMXHabGU6AkOW8T5Mt3kkTj5EnHFmAPDuCp/M=;
        b=mfydHLh62IOVLs3mKm82w+bov0EkkwmkydvH84EfBey7lni8ozfAWUfupoxjMmcuUq
         JXBszmv3GbkLZKCCGF2hRX1kIwrFgbpkbeNLJVKojEeuFW9zl3WWxbNF37yN64A7W07e
         Emr+pEHmBNCvxRMk+3bl2OVm0LptKwupfVVqMPu8DNd3uoFu+JThFJdwiKhpzJsmYIIT
         Pvwx6CEjD8tcbjVPXD4N88FrZT/WtiGPrm8jn4D2LQ4aXO5PaNZeUXQesAV7tB+XYn+R
         USvO7UnyRT1OGHlAZZhTELsZSH3EinSLJOnWOaTs2UkJIe7fpWhiM5rgPks0eFC5/z/T
         w23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297104; x=1768901904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8KWgyjMXHabGU6AkOW8T5Mt3kkTj5EnHFmAPDuCp/M=;
        b=QUYX2VxDy0adeNb09EDQkA++gQxvK7XvfmYeDR2SZuyBdglzXJtBRr1h72jr10y9Z3
         hCNqwMGRJdzkJXJdxFWh3gXjba5VQxe9WMpk1vSATshF22Au3Ev/yN0/snHFtR71ocLB
         /24e8Kj//birvJQ1em7R9SYwY4Z4gGtxjyqrRbxnouEguPj+nEiKjh1oQp9+P+bX+NLv
         8kMwVKvyhE1ZmOdCs2tdtCpGxjiMT7ItZQJPEkCf4b3hjM9G5VCJGcT+SqNby2iwYnqD
         ZK/IyG+y+bbht/XbGlW77JEYKuf9eFMerQ2g7eP+ShdWhadpZn27tfvKj4Tau8AaiqED
         f5jg==
X-Forwarded-Encrypted: i=1; AJvYcCUJXHI1QomA8xW0H4HlDiQc/RVGWpNGAxkxTKpy432j906jXFDz6B1sDRepjyK23YKabNemvXl2gbXaR77BzpFm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywga+crarDJ7u5ZpdHJJpfPPdxa1wPQQZ3xIryqNew4nketL0Rq
	c0n5HyLs5ceGgBx2NXjIu2VtfEX8fEcnw7RlUh4z6q5OE7QipLP6H9SfWdpjg65Ww2k2RqujNNj
	+oGBzP/MgBkU7eJPq2q2jTmUDlDjfcuI=
X-Gm-Gg: AY/fxX5wTccd5DSN2bw8uPp363C9GBeWPRLw6GFBb8HSRGesLf8KVi6bZZ6Cm5+nTBY
	CkE/KokOXbKp0TGmVWGnAYJq1C76xmxCjvhgn59owH2VrQaBIDBFqRUVgbPlbrJoOi6bTtv6NeJ
	NP4yl5N5KvRV8mYzEEXOOwT4T5mB4bjIiidsk4ljzfgN4cN0JDxDSAWx2hHLv+i8UAnssVE9UQn
	6Rx3VFGEu7p5GyW6zpS0mGSAnRfXcx4XfsyL3FehNypQadxjx8Qk9/SMp/8JnB6zfE1
X-Google-Smtp-Source: AGHT+IH5vuof9lI6QD87N6B7LDe9P2FN4oZsCmNAYwjolnj651Y9hadagnFcBF2OE8xJNcMfTyaxXnX2atsCncCn3Rc=
X-Received: by 2002:a2e:bc21:0:b0:383:1d66:c204 with SMTP id
 38308e7fff4ca-3831d66c785mr40711961fa.38.1768297103626; Tue, 13 Jan 2026
 01:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260113011931.40424-1-nick@khadas.com> <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
From: Nick Xie <xieqinick@gmail.com>
Date: Tue, 13 Jan 2026 17:38:10 +0800
X-Gm-Features: AZwV_QiMouZEUcMJMc0NkPa_HjjwbFSXhGJqMCfsVehqjMCt6pkKsbPx_-HuidM
Message-ID: <CAP4nuTXUd23e6k6iqRVJw6Rcsc46+RrLGR9ZCu=o28g3u2FKSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization failure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, xianwei.zhao@amlogic.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_013826_383760_3511F9A4 
X-CRM114-Status: GOOD (  29.11  )
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

Jerome Brunet <jbrunet@baylibre.com> =E4=BA=8E2026=E5=B9=B41=E6=9C=8813=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On mar. 13 janv. 2026 at 09:19, Nick Xie <xieqinick@gmail.com> wrote:
>
> > The SD controller (sd@fe08a000) requires a clock source capable of
> > generating a 400kHz frequency for the identification phase.
> >
> > Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DI=
V2
> > as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).
>
> The reason you are having this problem is because CLKID_SD_EMMC_B does
> not provide 400kHz by default on this platform. We have been operating
> with this (weak) assumption so far ... and it was OK until now.
>
> > The internal divider of the SD controller is limited to a maximum value
> > of 64 (2^6). With input frequencies significantly higher than 25.6MHz
> > (400kHz * 64), the driver is unable to generate the required 400kHz
> > clock, causing the probe to fail with -EINVAL.
> >
> > Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
> > the configuration of the sdio and emmc nodes. This allows the divider
> > to successfully generate 400kHz (24MHz / 60).
> >
>
> DT generally describe what the HW is, not how you wish to configure it.
>
> What you are doing here does not reparent anything. You are actually
> mis-representing the clock tree, making the MMC device believe it has
> 24MHz on its clkin0, even-though what it is really has still is
> CLKID_SD_EMMC_B (presumably running a 1GHz)
>
> So if my understanding is correct, you are indeed setting the divider to
> 60 instead of 64, but you are still dividing 1GHz so what you actually
> get it 16,6MHz
>
> If you want to get 24MHz the clkin0, we need to assign the rate,
> something we probably should have done before.
>
> I'll send something for this
>
> > Verified on Khadas VIM1S with SoC S4 S905Y4.
> >
> > Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes fo=
r S4")
> >
> > Signed-off-by: Nick Xie <nick@khadas.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-s4.dtsi
> > index 9d99ed2994dfa..b87bc83b5a9bb 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> > @@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
> >                       reg =3D <0x0 0xfe08a000 0x0 0x800>;
> >                       interrupts =3D <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>=
;
> >                       clocks =3D <&clkc_periphs CLKID_SDEMMC_B>,
> > -                              <&clkc_periphs CLKID_SD_EMMC_B>,
> > +                              <&xtal>,
> >                                <&clkc_pll CLKID_FCLK_DIV2>;
> >                       clock-names =3D "core", "clkin0", "clkin1";
> >                       resets =3D <&reset RESET_SD_EMMC_B>;
>
> --
> Jerome

Hello Jerome,

Thanks for your review.

I also checked the Amlogic 5.15 vendor kernel [1], it also use xtal as clki=
n0.

[1] - https://github.com/khadas/common_drivers/blob/khadas-vims-5.15.y/arch=
/arm64/boot/dts/amlogic/meson-s4.dtsi#L1358

