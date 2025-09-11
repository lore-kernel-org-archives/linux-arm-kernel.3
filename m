Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D1CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7ly2Efr3aD8QyxPSswHNwfdGEyG+Grnl+9kaAGf3Cs=; b=ebJwHp/ZLIaDLeCg5M9beSIc/q
	aKIfveejr1zfRoomqxMgJCev7ZaJj5MOW3el+DO/wLvd7d4YBQdBojR3Om4o5CpzqeLJgOLBNRhkr
	gUXgzl7Ufmy6gcNBKPN2G8c/ZhWtQNGyFGhn12eHkMPtZvzDWjXb+be3xFTdU6Rn8oJTRnaCHgd1F
	2Q3Bvyulicc1loW5iar8E6AXWlO3O667Md+6d50ACCqTSp9LGX8rLkBQmIlSzlIY33N8jlDUWobU6
	R9RhqYKR5cxGBF9qkdCMXzXEIgchJsyojwBniInDxd7vgc3bqX0aDcYldIP7gmDGN9Vt/lRRcJg8i
	nKWAjUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweGg-00000002J2J-2839;
	Thu, 11 Sep 2025 10:11:06 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweGc-00000002J01-2bVp;
	Thu, 11 Sep 2025 10:11:06 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b72b7caso555553a12.2;
        Thu, 11 Sep 2025 03:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757585460; x=1758190260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7ly2Efr3aD8QyxPSswHNwfdGEyG+Grnl+9kaAGf3Cs=;
        b=GRHDPndFp87OiYjac2ajA/zJasPyKL/AQGf0YRIxP4f34GSq+QUlRJxssSRo73pk23
         3t505Zb8kuQQSzmEUMH7YUVp/0Y9q2nwCOdchNxJrS6SELZyPeY19vdFlx0diLHYeiFk
         s9vp+RyJheOi22eCUr3teDFo0SRtgHUfttEnOte8blotMxQRL5VqynPzsz7csQJv7huV
         rB5NcKNiruF1bJzqt/8Yv5BYYiN0pMtocRseIMy+Ortsaf7srmjvOkXK/NbgWgyKmFUE
         en891cci2etnRRILVf++OHNucsmndQiDcqVIHEVpKQEZK1ClbXslokPb7MXM27ZN99ut
         uTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5BeqtYLXuygcRpOPVbPl6k1yEF5iT/NDc5zhgMqKg/+izOWi1eMNY8/QfpdSmAtTrNe53eLN2wsOa95p3iYG@lists.infradead.org, AJvYcCX4sdJNKkvWxG6j+ZLHXjq+tAHWmKkGFWBPMIHo7+VtrA1yF/qZUZFDy3VLlfVbngsoGmvLRuNcZzPn@lists.infradead.org
X-Gm-Message-State: AOJu0YyK9VvO958GKewU2uP/cOcFVGmto+zVEwVhVlmZbjRbQDskRjXG
	mTIUgl/Io82QQGlQpTUq48wbrqxUMiTBp0n0jWehxZ2BnLU498AwR0cFsvUsCEspHrnHvg==
X-Gm-Gg: ASbGncswSXar3Aiw6kl8fEQzfrPBDXb/IJnKaDVvfp0haKNAocBptK8yZRCqKvm2wKh
	mbe5JsUt5ia0QgY5BJZ1YWDW2m3ZY9Tp2vhCFLtL42FMMtE7DsA9dE8T+DPf4GO3ROnhLFZFUNV
	rVCaAjhIDfWIq8z/PvhRmXQlvxNANJCJaa75qDa2E2tRBDEgU2y6/1h/1WCJk5Zo2eybedEnLNW
	TYjXRCe2Kv/0ud/M4Z4ntGEcObRd8I6Cx6FPbhtqAjc1mv1ciSCiyZu+9nB12yQkAKuPp8QLIaA
	37ZZjk9+G5kyXAVzOO1MsGNroxH7+0IWk4+EfE4aZdoicsW9uTtg7TaKhZJh6VspKrj5n7uvgv6
	hoDHlNnV6DYjv4/CAGO0j9dk1TgRE7PWcdnOAM1ZSaHAv54kk/d8wJK2Ibgt7OBX+d7dIux9Xi4
	1Lb45oUTZLb6R4Z0vjI9k=
X-Google-Smtp-Source: AGHT+IHVw3JjiZ1di19qoyl8bKJJjwH/FJoGuNoM3sNGO4n9wkGofTzfJW77+MeHm1VK6kES0Oz7xA==
X-Received: by 2002:a05:6402:3512:b0:627:d77e:c346 with SMTP id 4fb4d7f45d1cf-627d77ec6a1mr14076719a12.23.1757585459616;
        Thu, 11 Sep 2025 03:10:59 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm915577a12.17.2025.09.11.03.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 03:10:58 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so76493166b.3;
        Thu, 11 Sep 2025 03:10:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkFkmHx4nUxb6m3tY++SwSBESkw6apIqwcnWd6ngfgWgtuCM5F2/Vlsho+eLPY1L+k3eRYkD94Adh2@lists.infradead.org, AJvYcCVXMU7oUWDNtaPzRMmOtN37rHH+7fm6CLENyrBkU/xVI7krt76sAruOKyg/AYFQczWoaceTdb8m7fLiFArMU4EA@lists.infradead.org
X-Received: by 2002:a17:906:f8cf:b0:b04:bfda:e437 with SMTP id
 a640c23a62f3a-b04bfdaf4d1mr1454520166b.32.1757585457836; Thu, 11 Sep 2025
 03:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 11 Sep 2025 12:10:21 +0200
X-Gmail-Original-Message-ID: <CAEg-Je_=Jzp_Rb0DwSjQ4fzYHFtOecneN6JaWgGGv8BEBPnhhw@mail.gmail.com>
X-Gm-Features: AS18NWC94YQ20cxcK-m9v2-A3V_x77Cw9qAo7tdpDB-LrH72BSxZ_dRe35VW7q8
Message-ID: <CAEg-Je_=Jzp_Rb0DwSjQ4fzYHFtOecneN6JaWgGGv8BEBPnhhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] Apple Silicon USB3 support
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	stable@kernel.org, Hector Martin <marcan@marcan.st>, R <rqou@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_031102_710759_A22BE096 
X-CRM114-Status: GOOD (  47.19  )
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

On Sat, Sep 6, 2025 at 5:43=E2=80=AFPM Sven Peter <sven@kernel.org> wrote:
>
> Hi,
>
> With the dwc3 glue approach this is starting to look reasonable to me.
>
> There's still one issue (SuperSpeed devices have a 5 second delay before
> they come up; This has been known for ages and we haven't been able to
> identify the root cause) but otherwise both host and device mode have
> been working quite well across a number of different devices (usb3 only,
> usb3+dp, dp-only, usb4, and the first two combined with a broken c-to-a
> adapter that can trigger a lot of quick plug/unplug events ;)) for me.
>
> With the dwc3 glue driver this series can now also be merged independentl=
y
> once it's ready: Patches 1-4 can go through the dwc3 tree, 5-15 through
> tipd, 16-18 should go together through the phy tree, and I'll take the
> DTS changes through my tree. If everyone's happy with the overall
> approach here I can also just send these as individual series.
>
> A tree for testing is again available as apple-usb3-v2 at [5].
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20250821-atcphy-6-17-v1-0-172beda=
182b8@kernel.org
> - Fixed dt-binding warnings
> - Extended the glue layer to allow control over mode switching
> - Removed quirks added to dwc3 and implemented them as a glue
>   driver instead as suggested by Thinh
> - Dropped snps,dwc3 fallback compatible since this is neither compatible
>   with the glue driver approach nor is this hardware truly compatible
>   with snps,dwc3 unless the bootloader did a lot of heavy-lifting and
>   left everything in just the right state
> - Dropped atcphy dp-only compatible since this can be detected in other
>   ways or just be driven from the dp controller once we upstream that
> - Fixed duplicate #define in TIPD
> - Use ioremap_np when required instead of just skipping
>   dwc3_power_off_all_roothub_ports
> - Dropped the change that added the USB role to typec_mux_state since
>   the new glue driver approach no longer requires this.
> - Cleaned up some leftover TODOs in atcphy and ran clang-format
> - Reworked tunables.c to use a variable sized member and alloc the
>   entire struct directly
> - Shortened debug messages in atcphy
> - Added DTS changes for t8112 and t600x
> - Call typec_unregister_altmode unconditionally as it's NULL-safe
> - Fixed arre -> arr typo in commit message
> - Drop __func__ from cd321x_interrupt debug print
> - Picked up Heikki's r-b tags
>
> Original cover letter:
>
> This series includes changes to dwc3, tipd and a new phy driver to enable
> USB3 on these machines. There's also some preparations to eventually enab=
le
> DisplayPort AltMode and Thunderbolt but those need future work.
> Overall, this entire setup is quite a mess and we've tried to make it wor=
k
> for quite a while now and finally came up with this solution here.
>
> The USB3 controller is a very special kind of broken: It never sees any p=
ort
> plug/unplug events that should normally arrive directly at dwc3.
> Additionally, it needs to go through a full hard reset for every new conn=
ection
> and most mode change. Details on why this is required are in the commit
> description.
>
> On top of that we need to keep the Type-C PHY bringup and dwc3 bringup ti=
ghtly
> synchronized. If there's a race between the two systems at best the port =
stops
> working until a system reboot and at worst there's a watchdog somewhere t=
hat
> forcefully resets the entire SoC after ~5 seconds. I've only seen the lat=
ter
> when bringing up thunderbolt so far but wouldn't be surprised if it happe=
ns
> with just usb3 as well.
>
> The entire bringup/bringup is orchestrated by a TIPD variant called CD321=
x
> found on these machines. Unlike the original chips we however get no cont=
rol
> over which mode is negotiated or are even able to see the PDOs or VDOs. W=
e only
> get to know once the mode has been negotiated and have to act accordingly=
. I
> even went as far as dumping the firmware from the chip to confirm this [1=
][2].
>
> Hector wrote another summary of this early in January as well [3] and thi=
s
> series is the only way we've been able to bring these ports up reliably.
> It's not pretty in some places but I have no other idea how to implement =
this,
> hence the RFC tag. Happy to discuss other approaches as well.
>
> Both the PHY and the TIPD driver already include changes for DisplayPort
> AltMode and USB4/Thunderbolt. These need additional work though but
> since we can't control the mode devices end up in we can already merge
> them now.
>
> I used phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml as a template for the dt-bi=
nding
> for atcphy (especially the ports). That was the most recent binding I fou=
nd for
> a PHY with similar features.
>
> In order to test this you need to run the latest m1n1 master [4] because =
the
> 1.5.0 release does not include the code that lifts the tunables from Appl=
e's
> device tree. A kernel tree for testing is also tagged as apple-usb3-v1 at=
 [5].
>
> If the overall approach here is fine and no one can think of a better way=
 to
> support this SoC I'll drop the RFC and include the dts changes for the ot=
her
> M1 and M2 machines as well.
>
> Best,
>
> Sven
>
> [1] https://social.treehouse.systems/@sven/111092587315536174
> [2] https://social.treehouse.systems/@sven/111096589846468888
> [3] https://lore.kernel.org/all/fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marc=
an.st/
> [4] https://github.com/AsahiLinux/m1n1
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> To: Sven Peter <sven@kernel.org>
> To: Janne Grunau <j@jannau.net>
> To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> To: Neal Gompa <neal@gompa.dev>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> To: Frank Li <Frank.Li@nxp.com>
> To: Ran Wang <ran.wang_1@nxp.com>
> To: Peter Chen <peter.chen@nxp.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
>
> ---
> Hector Martin (5):
>       usb: typec: tipd: Update partner identity when power status was upd=
ated
>       usb: typec: tipd: Use read_power_status function in probe
>       usb: typec: tipd: Read data status in probe and cache its value
>       usb: typec: tipd: Handle mode transitions for CD321x
>       arm64: dts: apple: t8103: Mark ATC USB AON domains as always-on
>
> Janne Grunau (2):
>       arm64: dts: apple: t8112: Add Apple Type-C PHY and dwc3 nodes
>       arm64: dts: apple: t600x: Add Apple Type-C PHY and dwc3 nodes
>
> Sven Peter (15):
>       dt-bindings: usb: Add Apple dwc3
>       usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when re=
quired
>       usb: dwc3: glue: Allow more fine grained control over mode switches
>       usb: dwc3: Add Apple Silicon DWC3 glue layer driver
>       usb: typec: tipd: Clear interrupts first
>       usb: typec: tipd: Move initial irq mask to tipd_data
>       usb: typec: tipd: Move switch_power_state to tipd_data
>       usb: typec: tipd: Trace data status for CD321x correctly
>       usb: typec: tipd: Add cd321x struct with separate size
>       usb: typec: tipd: Read USB4, Thunderbolt and DisplayPort status for=
 cd321x
>       usb: typec: tipd: Register DisplayPort and Thunderbolt altmodes for=
 cd321x
>       dt-bindings: phy: Add Apple Type-C PHY
>       soc: apple: Add hardware tunable support
>       phy: apple: Add Apple Type-C PHY
>       arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3 nodes
>
>  .../devicetree/bindings/phy/apple,atcphy.yaml      |  213 ++
>  .../devicetree/bindings/usb/apple,dwc3.yaml        |   80 +
>  MAINTAINERS                                        |    4 +
>  arch/arm64/boot/dts/apple/t6001.dtsi               |    1 +
>  arch/arm64/boot/dts/apple/t6002-j375d.dts          |  197 +-
>  arch/arm64/boot/dts/apple/t6002.dtsi               |    1 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |  212 ++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  236 +++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi          |  275 +++
>  arch/arm64/boot/dts/apple/t8103-j274.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |  137 ++
>  arch/arm64/boot/dts/apple/t8103-pmgr.dtsi          |    2 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  105 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts           |   11 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |   12 +
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi          |  137 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  105 +
>  drivers/phy/Kconfig                                |    1 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/apple/Kconfig                          |   14 +
>  drivers/phy/apple/Makefile                         |    4 +
>  drivers/phy/apple/atc.c                            | 2214 ++++++++++++++=
++++++
>  drivers/soc/apple/Kconfig                          |    4 +
>  drivers/soc/apple/Makefile                         |    3 +
>  drivers/soc/apple/tunable.c                        |   71 +
>  drivers/usb/dwc3/Kconfig                           |   11 +
>  drivers/usb/dwc3/Makefile                          |    1 +
>  drivers/usb/dwc3/core.c                            |   16 +-
>  drivers/usb/dwc3/dwc3-apple.c                      |  425 ++++
>  drivers/usb/dwc3/gadget.c                          |    2 +
>  drivers/usb/dwc3/glue.h                            |   14 +
>  drivers/usb/dwc3/host.c                            |    7 +-
>  drivers/usb/typec/tipd/core.c                      |  564 ++++-
>  drivers/usb/typec/tipd/tps6598x.h                  |    5 +
>  drivers/usb/typec/tipd/trace.h                     |   39 +
>  include/linux/soc/apple/tunable.h                  |   60 +
>  41 files changed, 5192 insertions(+), 64 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250820-atcphy-6-17-b7eaf23be17c

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

