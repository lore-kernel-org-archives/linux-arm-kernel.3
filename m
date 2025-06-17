Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054BDC71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvcPLHvTAOguPWHkmBTRclEQDHuwUCTXdi76i3qlbXo=; b=JeS25nUIGjVd6q2PD9awA87SkH
	E1AWgwFEzgsOCrzBS55rEyMrk0JCEG1xtTmCzK0uiEiNU5KnfVEa+//nnkBIwUfDFmMtB+oVn+wr/
	RIvUm1NZLqizev4yNpnPAA6UUpAIcqTfeSc3BvmM8VfmF60d+Q/rhMM/31STSXcemVuxFuiciJy+u
	p+K6ZbF7yrbO6vt+DiB400++pHA9YPljtRCU7QhHHhDU6qjyaVBFAMe9KA/oiSzr9UHvOEkEEg9Aa
	iqiMUQMLv9VEuNg8i8w/1FMIByxszC8MdgoDrRD3fIQ9FQ4y2MlwYO1ZcjhNfrYIUr0jmKgyfCpyp
	K2EdXlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQFY-00000006P2f-2H1J;
	Tue, 17 Jun 2025 06:56:52 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQDE-00000006Oo2-1zCN;
	Tue, 17 Jun 2025 06:54:30 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a44b3526e6so71205721cf.0;
        Mon, 16 Jun 2025 23:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143267; x=1750748067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvcPLHvTAOguPWHkmBTRclEQDHuwUCTXdi76i3qlbXo=;
        b=jDjbJ/x0VSn6XKZ5gv43an8tACMG92Ynqyh1Kr1fgemXWJgNGnf0+k0qv7VLeiLrzf
         oUwemud0vDXLBbYTRVoG2BTtg7B6cKgaaox5B2Q+uPwBB2JQg8v5Qvx3oPaXb4M2xWa2
         E6ZeMfG84/lCmHoEUxpez0h0s//pqZDLvJeqGBCkPraI1/b3jb42mpIMFijonTdfbaYU
         Uc8sMerYMs3PFheRB2f4tTYyD/1BFL7ngE/1n/COHYLUKquLiU7ulcD3PX6OpQaaBb1L
         EOWpgsVh0ObThVE7uIEcU9uw6qiPxfLRUTKWO2bXQsVt67pRWwZQbkbi/Z3TmyLWh4Mm
         E7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143267; x=1750748067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvcPLHvTAOguPWHkmBTRclEQDHuwUCTXdi76i3qlbXo=;
        b=Wb336Hom4Ay3QDZir5/JGHEfarL54Nn68xxucI2G4SKJcckRWCGE3IoDYlRs2XzEWh
         IUUz+GANPDaemkqEN3ASWK8ktt9DVNmPNUd6xpGpKTQyBSx9mRhJjiWsKXY2F4SUYN7V
         Rlv6XdrnIDTYa4c5p1gNSI1duXYNQcvw9SLATqHHws0eaN8Sb5KTettvm4vhn0Ltmsxe
         xYi1j53DyETfrVm7ggkdc73VUr/FZEbzN9WLvzu5YDakc2jDn0lLnsNfRXmMTH2IuJDJ
         gSmkjxqI+kv2P9PA+RuSJmclG8ShFHY6DOD6wOvvBnIbCvD/jdXXkL+mu68kKbXITmW7
         R3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1mMPCwFOtCMdjaUit4vuWvYc0NEky2jm69+exAWNGWLURC6QOYbt7HoRL9T+pPbPHh0/ITodk/OouyuIy2s8=@lists.infradead.org, AJvYcCWXTEmXgxJ2mj10Ii8O6a5bnsL+upc3WKiUzBdjMtqD+0F8mhLw9soxJZ7fmNJDfq1uaITr1fSiqzoZX3X20MZI@lists.infradead.org
X-Gm-Message-State: AOJu0YyEUE41d9mY/xMT3VZFxt7o3GFP0Pp171lkrAeH6yw6Sgngcb/n
	ESYskHcyD4grto7lNPUZ10AwveS/ZTxcHE8H4jaInMqGAT1C5lBMtuejYLdIpadXupXd7rXo2ua
	tNhdDAC8+RFTEt+lCfCRGvMW2tFZ/A1k=
X-Gm-Gg: ASbGncsGOpERjuBWg53tIF0deL1bKP3VT40YvdQgTrA1W9WmIvBMyf9R4iazn5k0bfW
	E0eGoxaebEVB5gP/1VU0SAcNUaDEhWepU08RNcLbDFwdqm8VzL3GvJwe7D2mDLgLqaflGXQik9Q
	CvXE333flETgdUQDDVigl/3etriXhKzjO2EHs855XPxz8DyNS7XdShSbV9z4LAGItM/giUfx0nt
	k1A
X-Google-Smtp-Source: AGHT+IEY4uyjlHP9FOiSFmYJPvurc+MojB54rhkqFuWHs7MtM0Di6VF2exh4ISQVMKgesJnXEjcVknPDPnIWM5OS4pU=
X-Received: by 2002:a05:622a:1356:b0:494:acf1:bd0f with SMTP id
 d75a77b69052e-4a73c5a524emr168864261cf.42.1750143266713; Mon, 16 Jun 2025
 23:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com> <175011005578.2433766.276755788637993361.robh@kernel.org>
In-Reply-To: <175011005578.2433766.276755788637993361.robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 17 Jun 2025 10:54:18 +0400
X-Gm-Features: AX0GCFshodACsqaeamV1VCoCbFUaWw8rwzunXBPUulAI9_Ms6YTcbd6QpZ5J0AE
Message-ID: <CABjd4YzjCBnc77AGAsEv_eq1+UwMFiuDBjENBrxJ8t4S-89UeQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: rockchip: enable further peripherals
 on ArmSoM Sige5
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_235428_879347_3D941773 
X-CRM114-Status: GOOD (  29.00  )
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

On Tue, Jun 17, 2025 at 1:46=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Sat, 14 Jun 2025 22:14:32 +0400, Alexey Charkov wrote:
> > Link up the CPU regulators for DVFS, enable WiFi and Bluetooth.
> >
> > Different board versions use different incompatible WiFi/Bluetooth modu=
les
> > so split the version-specific bits out into an overlay. Basic WiFi
> > functionality works even without an overlay, but OOB interrupts and
> > all Bluetooth stuff requires one.
> >
> > My board is v1.2, so the overlay is only provided for it.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Changes in v2:
> > - Expand the commit message for the patch linking CPU regulators and ad=
d
> >   tags for stable (thanks Nicolas)
> > - Fix the ordering of cpu_b* nodes vs. combphy0_ps (thanks Diederik)
> > - Drop the USB patch, as Nicolas has already posted a more comprehensiv=
e
> >   series including also the Type-C stuff (thanks Nicolas)
> > - Pick up Nicolas' tags
> > - Split out board version specific WiFi/Bluetooth stuff into an overlay
> > - Link to v1: https://lore.kernel.org/r/20250603-sige5-updates-v1-0-717=
e8ce4ab77@gmail.com
> >
> > ---
> > Alexey Charkov (4):
> >       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
> >       arm64: dts: rockchip: add SDIO controller on RK3576
> >       arm64: dts: rockchip: add version-independent WiFi/BT nodes on Si=
ge5
> >       arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5=
 v1.2
> >
> >  arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
> >  .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  | 49 +++++++++++++
> >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 85 ++++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++
> >  4 files changed, 155 insertions(+)
> > ---
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > change-id: 20250602-sige5-updates-a162b501a1b1
> >
> > Best regards,
> > --
> > Alexey Charkov <alchark@gmail.com>
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com:
>
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater tha=
n the maximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the m=
aximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the =
maximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#
> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,r=
k3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the =
maximum of 13
>         from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,p=
inctrl.yaml#

N.B.: these are unrelated to my series, and fixed by Nicolas' patch at
[1], already in -next.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D86491c2b99e5adbb56d76286d6668effb36d3c90

