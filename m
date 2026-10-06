Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B3CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tm8inQeYXbBmJrsjm+/9U5OYHNYAqX7VnlqX5vcQTFU=; b=1mYW+rTPuH8MrB
	TazpEUCEb0RUFW8ALQgxnvtFlfDlIvOaIMQRl+kE65YCbscTqeXViE/Om82CNQeuRZv1/ICxcrPp5
	PCOBunADRmslsb+fI9mG13GtXH1Z92KH3+fy7XzVHxritehjyWNSILJHa4xWNShtx7JPFORPuXXx0
	wHZi/M/hePJ0/RSDvaLAIaIzXspBLyOAtxMNmlLXVuO6lrRiwVH94uQYUPzkjwkJu/YtJArozxI8+
	KI0WZN51Rwc8y8vkUpxJxpze0nLy79eOMiKSI6qKMmGyYAJPSRuvlzGbOfFaM0IUeVdcVYaD4YgQ1
	Y8ItU7qswoQhAi62c1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1F7-00000000M3P-42kb;
	Tue, 06 Oct 2026 09:13:49 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1F3-00000000M2u-3L1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:13:48 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823b938464fso2261100a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278025; x=1791882825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm8inQeYXbBmJrsjm+/9U5OYHNYAqX7VnlqX5vcQTFU=;
        b=JgE61KPByZYvG46Lgbq1Bq9XjKEe5bmmXPkrl4EP1opXi8geLRoMhoIp2v4JArpXCy
         y/JnSSyVVkQbfueDfeMV/A4cyQw1cNbhwFZzeI3+8nXc9ffRwec7EYsQ7NL+77gs3kaE
         8Upu53mH2T18ucN8XujqTGvsXL0VsOOr0Xm5NB58Ry7cmeFbMpYsi4oKcH5lXUJXWdBI
         xI/i/TKbWba6O1DJtqmUxF7M5jPGDSwzn4vfA2sfCt79Vkd7W4XruhCPe1ElewNZ31VH
         TMRGhD0rstgb2NtyRoHN30UcKeUzBpKP3hNhKc/a6OwYNY/TrekbpXiC7ml7/r9gwCWC
         Iibw==
X-Forwarded-Encrypted: i=1; AKwUvBwckYZkmknmI9Vk5R9p8F8XquVoR5YVfagpCqZZ85DpvLOmUycnaKgx8+b4ws5aNwuPlbhNuCbrKBGD0Eglgclc@lists.infradead.org
X-Gm-Message-State: AFuF++mkq1n/v9/g/0oSFTJHG5Sw2oO1oTE086yJPGcFIXDqm2Du75Qq
	GYB2Ug4cQoWc6oHREIsP1ZA6mY6G+Z1H55Gf3uELvBoiwHsqpsF5tSP4V77b8MYIJ9EkAA==
X-Gm-Gg: AYBFou1xfvLOCEC9VUDmqVBgSci+PoZRmBfOHQPTta3nDR27dxyN7vc8a37NUDM+bM8
	DShD5naF/JE5Bg0DL4RjQEq+IWUTVW3DOzXHe/f+R9mF1pgLcLXEI7pycQ7k84ol2Iri4JwfrNw
	xkzfyHjOITIeEKh34JDhMPn2PiIpiUt1fflSQrwJUXh2a1uiNSDumNC9azkoLI20AhLqbk2SHf2
	vfZ5EirO2Rnzqu/u2HtExhYhZIuv4OiH0w4MbAeRMUJa3GUnM1LtUbymDZ/QhSaToHTaGHzwSmL
	28S5Pypo57kgfeqNCzGskI2V+17QZUmM1BWjNj8O4W2XfDvUq5UpqpsU3k/GzzMcy9QCfZLYLSH
	524OpIcOG3l+B6C8p5dk9oVvr+Yr1S7ncrZw2hqMTfROo/LY3VeiAwpa28zKieyO69FH3QjdA7P
	s/Hka1SKzCuP9DQ7SyOokx1bE4TNWd7/yAyVdnboyVU4p05lz/CUhSEIfQFCDmb70DrZlqCG9tj
	UrZhuqw72g0tJtP5SYSPuvOp5D0d7eW2CGsKeaXSkZ8ogd+Plm1BBasNF8Y0rA=
X-Received: by 2002:a05:6830:4115:b0:811:72c5:bd19 with SMTP id 46e09a7af769-828a2c3361fmr717434a34.25.1791278024619;
        Tue, 06 Oct 2026 02:13:44 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281db4582esm1791557a34.3.2026.10.06.02.13.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:13:44 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d7a9e2eb24so1682496eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWBNjXpXv6S/BtWcZlrI/HwvEF6G62lKDDJCRmvxyMEsPnfqwvwiTLluYdYZvwlRQw7/8dNDPONBxIMyEaX+NV@lists.infradead.org
X-Received: by 2002:a05:690c:e216:10b0:89a:63bc:8be with SMTP id
 00721157ae682-8b04f45511emr1435597b3.72.1791277525323; Tue, 06 Oct 2026
 02:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-7-tanure@linux.com>
 <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
In-Reply-To: <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:05:13 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
X-Gm-Features: AclHuK8uuG7S1lotg92U6NQL5L-fFOK6A4NsqpautQX6RPIs4c5SrrUvYH9tz8s
Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_021345_836529_D95453A1 
X-CRM114-Status: GOOD (  31.56  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 5, 2026 at 5:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +
> > +     /*
> > +      * The RGMII clock delays are added by the MAC, so the PHY is
> > +      * asked for the mode that adds none.
> > +      */
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&external_phy>;
> > +     amlogic,tx-delay-ns =3D <2>;
> > +     rx-internal-delay-ps =3D <2000>;
>
> I agree with Maxime here, rgmii is wrong. We really need to understand
> what is going on here, especially since you are asking for the MAC to
> do the usual 2ns, nothing special.
>
> Is the PHY not actually inserting the correct delay?
It does. The PHY driver shows both delay bits going from off to on, so
nothing was strapped and the bootloader did not set them.

I swept the MAC RX clock delay and counted CRC errors, to see where the
good window is:

  MAC does RX delay, PHY none:  clean 400 .. 3800ps
  PHY does RX delay, MAC adds:  clean 0 .. 1600ps

Same window, moved 11 steps. So the PHY gives about 2200ps, and the
first window is centred at 2100ps. It is right.

Transmit is the broken one. With rgmii-txid the peer sees nothing we
send.

What does the
> datasheet say?
The A311D2 covers both ways of doing it. Table 5-21, RGMII receive:

  PHY internal delay on:   needs 1.2ns setup and 1.2ns hold
  PHY internal delay off:  needs -0.5 .. 0.5ns skew

with a note to check setup/hold when the PHY delay is on, and skew when
it is off. Table 5-22 does the same for transmit, separate numbers for
"clock delay added" and "no clock delay added".

So the MAC doing the delay is a documented mode of this SoC.

What it does not say is why the PHY TX delay misses. I asked Khadas
about the clock trace lengths, no answer yet.
>
> Also, we have one vendor property and one generic property. Can
> amlogic,tx-delay-ns be replaced by tx-internal-delay-ps? But that
> comes later, once we have determined these properties really must be
> used.
A new version of the series will have a fix for it. It will prefer the
generic one.
One thing to know: that register field is a fraction of the clock
period, not a time.
The driver comment says "8ns / 4 * tx_dly_val". A quarter cycle is 2ns
at 1Gbit and 10ns
at 100Mbit, so 2000 is only true at gigabit.
>
> Humm, what is meson8b_init_rgmii_delays() doing?
It picks the MAC delays from phy-mode alone, with the sense inverted:

  rgmii       MAC adds both delays
  rgmii-rxid  MAC adds TX
  rgmii-txid  MAC adds RX
  rgmii-id    MAC adds none

So the mode that says the delays are internal is the one where the MAC
switches its own off. It also ignores the *-internal-delay-ps
properties in those modes. With rgmii-id and both of them set I get:

  phy-mode rgmii-id: tx-delay-ns 2 rx-delay-ps 2000
    -> PRG_ETH0 delay_config 0x0, PRG_ETH1 cfg_rxclk_dly 0x0

What is
> phydev->interface in the PHY driver.
Whatever phy-mode says, dwmac-meson8b.c never rewrites it. Which
means the MAC and the PHY always split the job:

  rgmii       MAC both    PHY none
  rgmii-rxid  MAC TX      PHY RX
  rgmii-txid  MAC RX      PHY TX
  rgmii-id    MAC none    PHY both

They never both delay the same clock, and never both skip it. So the
driver is self consistent, it is just labelled backwards from phy.rst.
That is why the boards using "rgmii" work, and why rgmii-id is the one
that does not here: it is the mode that hands everything to the PHY.
>
> Please take a read on:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> and figure out what is going on here, because at a first look, it
> seems broken.
>
>       Andrew
It is broken. phy-mode describes the PCB, but dwmac-meson8b.c reads it
as which chip adds the delay. The labels are backwards, and in rgmii-id
both *-internal-delay-ps properties are ignored.

I measured each direction with an eye scan. The PHY RX delay is fine,
about 2200ps. Its TX delay does not work at all, so the MAC must do
that one.

Fix: in the -id modes each *-internal-delay-ps property means the MAC
does that delay, and the PHY is told to do the rest:

  both properties    MAC does TX and RX     PHY told rgmii
  tx property only    MAC does TX                 PHY told rgmii-rxid
  rx property only    MAC does RX                 PHY told rgmii-txid
  no property           MAC does nothing          PHY told rgmii-id

Boards without those properties keep today's behaviour, so
meson8b-odroidc1 and meson8m2-mxiii-plus are untouched.

Vim4 will use phy-mode =3D "rgmii-id" with tx-internal-delay-ps =3D
<2000>. 935Mbit/s both ways, no CRC errors.

I am sending a v2 with the fix for dwmac-meson8b.c  as its own patch.

Thanks
Lucas

