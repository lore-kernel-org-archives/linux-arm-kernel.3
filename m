Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BF9CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6Ko9EuByB72AmPY68qaHZeiB7esoLxBKg9O0pS8bew=; b=xmw+eXoxtzlU/5kk0+Y0AZRtHG
	IO7BwHDnZghFXTwWzAAdwL9tZt/u2D+KgmtZ9l1jftLepBRvqMLQTx+GI4gumOqjQBQJFNwT+cQOh
	AFRz11ET9i+Q1M50ePQJRAzNEcLahGhJrOlhBXe7VdmtMWUXw+FjHtJ324IKZO14lUyn3otKuPw0b
	QVoYeSoskx1hqHn7RKw1oZzUqM7KKUWXRK+js5Ydzfnsbt9OGgSoaPJXgA0XmsOatXkssDuT3Seld
	1g/XjClQ8KYL5uyB6Q4TrFvL63PELSAzZA2eMQph/tn5lUDT15OF9fqBQKaK1RHLdKBikrhjvZk0j
	Zl7C9eNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68k8-00000002Bwm-14fN;
	Tue, 07 Oct 2025 14:32:44 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68k5-00000002Bvy-12Xp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:32:43 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-7960d69f14bso40423756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759847559; x=1760452359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6Ko9EuByB72AmPY68qaHZeiB7esoLxBKg9O0pS8bew=;
        b=M221NPd7Fd0E6xAWmVOAX/GBi0vapq+duY+gCwV4g2MvnksVWSxt8aLcsS9S8LBSlG
         m2T+fhEFBIA+VDX2H0CBFnYODdtLbH5TdcrjCK830v41Y4INPiJaGdEzFcONhaYXFD4a
         B8eW3+lCVtn8sEVCewaHN53nSevNE9VvvztK4lrURwfj++KyukxPidil3U+RNIMvuxJM
         KvmwigWsr7xrhL0H9N1y139aChcf5YfbeSaJeaiiZFdZwENciTkNaC5Unb3t5cQriVzx
         iLJRBBTc8yHBPsU9x5vf2rTarTFqdVgonJFkY5xpCo+cTlgh8Gk+JTzwBZc+hyAv6Yfh
         JElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759847559; x=1760452359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6Ko9EuByB72AmPY68qaHZeiB7esoLxBKg9O0pS8bew=;
        b=ibcE27XXffkBb4/Nzrca+is9PipSylJzdKoO7GbO6gE1O4zjAJmXgU8nQRC9sCPEuz
         C7p/FUVCB3ROAWiV6dr22XGs/D7w+JCckmiNUXUKopemfyWs+EBj/IbUmqynGVRbGXj6
         nGk1pvNsniK6l8F5KBWHWiYcbbYmqZs6VLdrZnXbqP2pYsaXYzEZ/JBl0IFfQdTqerpp
         1p6ZxZxnbOYV/vQNtd8G0C+D0MfAl++knHcjildmskcOMrOvL/9vy+iFxrpkcvnAiEoy
         HuAfaBoaP6EFiNfnwosW/msKi4NtZok9ued7VQsvYEouF8UJKgMcQKbiN08ZMF4ilfiC
         IwXw==
X-Forwarded-Encrypted: i=1; AJvYcCVr5d5adH6OUDBgerT8v6T7TFluIqWAoOw218VrLOk22Z4AfobASwuuuZxbuz1VUcDsojSgbWirSmO95VOScyOr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywls75GYUwGLqd2k1WBYkbD9dYyMqZxOFh1KdA9O+8eLG8kdd8d
	3k597UtmWYGKgNiEQFRr6lUnzifXmuxNYF0aSNTWF56A6Qui1TTOozxKF8uKXSI7irhKN94WjBh
	vmm3Msa75R0V8HYjGLSDvaXbj/Ic7Rck=
X-Gm-Gg: ASbGncuJG4TyUBDhaaolA65e+6IljAYtiQyAgzFWdxnyx3LK+zdgxGxf4+aAJcrFRyp
	9NyBFYGwmpBap2jBoWYnqFdj6LnfFO+jDttAFT0HfYKvi4D9RGZvGThRYEXb2C4lk3SbOTmDa8t
	CPajg4f2+6Z3hedDE179252eHYkyZdnIq5fKM8bIQ5UkTO/B1nan/nSn3vpsFTlDKnO7oK7VWXI
	bHEMa42knzbPiNoZZHs/ZknBiIsgX2rfYv3062IOGc=
X-Google-Smtp-Source: AGHT+IEyCKpYps/3BGc22BxSR5vdUK9H945UNs5mFpXR5FmYYn0yozFBPVoQCqHwhbvW2Mk1hUuA7PjHSd59EhPjCTw=
X-Received: by 2002:a05:6214:1c4d:b0:78d:63c4:9d5c with SMTP id
 6a1803df08f44-879dc7abcf0mr199677706d6.5.1759847559189; Tue, 07 Oct 2025
 07:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
In-Reply-To: <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
From: jjm2473 <jjm2473@gmail.com>
Date: Tue, 7 Oct 2025 22:32:26 +0800
X-Gm-Features: AS18NWBCvYOruCThhN8XGst8DvyIOMmZ1iSy5xv_cE-cTej27zRd1fN4u0hMtEY
Message-ID: <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org, 
	jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_073241_300144_40B0ED0C 
X-CRM114-Status: GOOD (  17.81  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2025=E5=B9=B410=E6=9C=886=E6=97=A5=E5=
=91=A8=E4=B8=80 23:51=E5=86=99=E9=81=93=EF=BC=9A
>
> > +&gmac0 {
> > +     phy-mode =3D "rgmii";
>
> Did i really miss this patch series in its earlier version, or did you
> ignore me?
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> > +     tx_delay =3D <0x3c>;
> > +     rx_delay =3D <0x2f>;
>
> Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> us the schematics which clearly show extra long clock lines.
>
> > +/* Micro SD card slot is not mounted */
> > +&sdmmc0 {
> > +     max-frequency =3D <150000000>;
> > +     no-sdio;
> > +     no-mmc;
> > +     bus-width =3D <4>;
> > +     cap-mmc-highspeed;
> > +     cap-sd-highspeed;
> > +     disable-wp;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> > +     vmmc-supply =3D <&vcc3v3_sd>;
> > +     vqmmc-supply =3D <&vccio_sd>;
> > +     status =3D "disabled";
> > +};
> > +
> > +/* Wifi module is not mounted */
> > +&sdmmc2 {
>
> What do you mean by "not mounted"?
>
> Often you would say "not populated", to indicate the PCB has all the
> tracks in place, but the chip has simply not been soldered in place.
>
> Or is there a connector here, and nothing plugged into the connector?
>
>    Andrew

Andrew:
 Hello! I ran `./scripts/get_maintainer.pl
patches-v4/v4-0003-arm64-dts-rockchip-add-LinkEase-EasePi-R1.patch`
to get maintainer list, and got:
```
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS,commit_signer:3/41=3D7%)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC
support,commit_signer:43/41=3D100%,authored:4/41=3D10%,added_lines:12/117=
=3D10%,commit_signer:5/6=3D83%)
Quentin Schulz <quentin.schulz@cherry.de>
(commit_signer:10/41=3D24%,authored:8/41=3D20%,added_lines:63/117=3D54%)
Dragan Simic <dsimic@manjaro.org> (commit_signer:5/41=3D12%,commit_signer:1=
/6=3D17%)
FUKAUMI Naoki <naoki@radxa.com>
(commit_signer:3/41=3D7%,authored:3/41=3D7%,removed_lines:1/1=3D100%)
Peter Robinson <pbrobinson@gmail.com>
(added_lines:9/117=3D8%,commit_signer:1/6=3D17%,authored:1/6=3D17%)
Alexey Charkov <alchark@gmail.com> (added_lines:6/117=3D5%)
Diederik de Haas <didi.debian@cknow.org>
(commit_signer:4/6=3D67%,authored:3/6=3D50%)
Liangbin Lian <jjm2473@gmail.com> (commit_signer:1/6=3D17%,authored:1/6=3D1=
7%)
Johan Jonker <jbx6244@gmail.com> (authored:1/6=3D17%)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC suppo=
rt)
linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
linux-kernel@vger.kernel.org (open list)
```
your email address is not listed above.
And I did not receive your comment on the previou versions.

The latest v4 version is here
https://lore.kernel.org/all/20250930055017.67610-1-jjm2473@gmail.com/
.

> What do you mean by "not mounted"?
>
> Often you would say "not populated", to indicate the PCB has all the
> tracks in place, but the chip has simply not been soldered in place.
>
> Or is there a connector here, and nothing plugged into the connector?

The chip/slot has not been soldered. So here should be "not
populated", forgive my poor English.

> Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> us the schematics which clearly show extra long clock lines.

In fact, the RTL8211F's RXDLY and TXDLY signals are both pulled low,
just like the Banana Pi BPI-R2 Pro, so the configuration is also referenced=
:
https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/rockchip/=
rk3568-bpi-r2-pro.dts#L237

The tx_delay and rx_delay values were obtained using Rockchip's
automatic scanning tool:
https://github.com/istoreos/istoreos/blob/54746dfdb5bd34d1f281cf41d1d1620d0=
c3ee686/target/linux/rockchip/files/drivers/net/ethernet/stmicro/stmmac/dwm=
ac-rk-tool.c
https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Roc=
kchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
https://github.com/axlrose/rkdocs/blob/main/Common/GMAC/Rockchip_Developer_=
Guide_Linux_GMAC_RGMII_Delayline_EN.pdf

I will try changing phy-mode =3D "rgmii-id" later to see if gmac
continues to work properly.

  Liangbin Lian

