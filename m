Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E9C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzEcA5hWsnYtBiKYYIvhUgOlqu3hQ1Xe998O6NNxQE0=; b=WJ7bmOUC2fMK4iUm1Fo/pbLXK5
	Ma+qFgWL6Rl/F4ACgaZAaEIJWKZWffLbJaQRshKhAFbbhHvMtSEjvq2Tl0m/re/wnUMCIo6lctPUx
	w+6bZADd99UXwdCMS7e/InhObAckRBwWyFohaN7eJV8D99AWUW/1pGSBGr+abC8HvRQkdICTnHolS
	1BK+cPgqTyuhl7nAmcNCr1NipJOFi2PTM39jeQgT7tjyxnO59zf/cS+Hqz1t2aZH4XdXH8mJokL+5
	B014qY1EKx72x+6geV8hNT8pay2NBzMpD6ALeq7WHoqSIU2Y49m+UwOWekgpzGDkzvQniMl579mVx
	xAteVPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflH-00000006KjJ-1Oxg;
	Tue, 01 Jul 2025 18:31:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcwU-00000005tWL-0YH9;
	Tue, 01 Jul 2025 15:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44470A53241;
	Tue,  1 Jul 2025 15:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EFBC4CEF4;
	Tue,  1 Jul 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751383840;
	bh=esq6GOU0YhrPGSWvYux2e5iZTTVZJjFx3fEwhZQPgKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqKObUsA0XqJSdOTV38SUPg0qehNPYEJw21E8pe0ZtkEhIAN2gTubJDa34IPE44Zu
	 DgCYMxp1EQWaoDr6GCINznEm5mUb8XKTPUmZ3umEARYYWDwHJf/wP2q1iPUxF5+P2E
	 ZZyj0wi4AIugFmUoWzVWBJhvJjXSAojpt12nLvqAGeqRHae4yOWfbgSPvxdgdjfCOI
	 A2xHOk3VuKafVFC+csJbujA1ZguLjcUL/ZQd/LMLlJf7lVVTm9qmPKN1nkVFoS5Fmb
	 i6lz/uIS0yU1mdm/LzUr7flUnT/o2kmORh91MAitE4tmwZ84TPgNjBfKIlYb4UjL29
	 dcl4pPn2dC+Ug==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad572ba1347so514090766b.1;
        Tue, 01 Jul 2025 08:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCEDbQPjO3ISZVrbgC8m3wBuk8a7nBDgJa+QcTAUgO3aoNjPUXtQTNN/wSrprKVm9Njifq7Ap3Ne2cWHoey5Q=@lists.infradead.org, AJvYcCXew0lFnuhakqn7Nx84/V0poEc4nqCNxZ95FUisH9l5/vjsZAjvihLYXYoUEh52AXHvSMgFURSR4vn1ky1FelWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBTW9KNEjOOk7Dsk95PZf+FL9HWpb0TJ7JwLrx9sGsrVuHP2w
	0Hc7cRoJZpllU2Rr64nCYYA/49IzbS2FfuUPfdTFj0+LhRhUWeE3r3Ehc2IGlOMW24Q1XS7l6/d
	gHHb90yH6XI1KFhgTUKU/EiPUmB8fdQ==
X-Google-Smtp-Source: AGHT+IGEOJ71QMmhygwwyoNyQvTUaSHGrectnbPhXO6fiW5U06Zpksqy5ktwiQlQijy6IeTYO+AYO14xuNYbA79IbCw=
X-Received: by 2002:a17:907:d86a:b0:ae3:6390:6acc with SMTP id
 a640c23a62f3a-ae363906fc2mr1532109666b.27.1751383839032; Tue, 01 Jul 2025
 08:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me> <175138000372.1627755.5505703571113478205.robh@kernel.org>
In-Reply-To: <175138000372.1627755.5505703571113478205.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Jul 2025 10:30:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
X-Gm-Features: Ac12FXzzE6a683eHMTyQ3BNDvQ78bAbSIDWu96D3LpnH4E2Ei9VCbyAZ1NSVMV0
Message-ID: <CAL_JsqLSa+1MYR6f6NcApGFdjCL0dDXSzpntVHCPGmKgytVfdQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
To: Max Shevchenko <wctrl@proton.me>
Cc: linux-watchdog@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mediatek@lists.infradead.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083042_312903_AFBF9659 
X-CRM114-Status: GOOD (  31.53  )
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

On Tue, Jul 1, 2025 at 10:27=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 01 Jul 2025 09:06:54 +0300, Max Shevchenko wrote:
> > This series of patches adds support for the MT6572 SoC and
> > the JTY D101 tablet and Lenovo A369i smartphone based on it.
> >
> > Signed-off-by: Max Shevchenko <wctrl@proton.me>
> > ---
> > Changes in v3:
> > - Remove the compatible property from the SoC devicetree
> > - Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f8421969=
86@proton.me
> >
> > Changes in v2:
> > - Drop the status property for the board devicetrees
> > - Add an soc node for the MT6572 and reorder the nodes and properties
> > - Change the commit title to a more descriptive one
> > - Change the cover title to the correct one
> > - Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f0=
42@proton.me
> >
> > ---
> > Max Shevchenko (11):
> >       dt-bindings: serial: mediatek,uart: add MT6572
> >       dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT=
6572
> >       dt-bindings: timer: mediatek: add MT6572
> >       dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
> >       dt-bindings: vendor-prefixes: add JTY
> >       dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
> >       ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
> >       ARM: mediatek: add MT6572 smp bring up code
> >       ARM: dts: mediatek: add basic support for MT6572 SoC
> >       ARM: dts: mediatek: add basic support for JTY D101 board
> >       ARM: dts: mediatek: add basic support for Lenovo A369i board
> >
> >  .../devicetree/bindings/arm/mediatek.yaml          |   5 +
> >  .../mediatek,mt6577-sysirq.yaml                    |   1 +
> >  .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
> >  .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
> >  .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
> >  arch/arm/boot/dts/mediatek/Makefile                |   2 +
> >  arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
> >  arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
> >  arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++=
++++++++
> >  arch/arm/mach-mediatek/Kconfig                     |   4 +
> >  arch/arm/mach-mediatek/mediatek.c                  |   1 +
> >  arch/arm/mach-mediatek/platsmp.c                   |   7 ++
> >  13 files changed, 250 insertions(+)
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250619-mt6572-ef78a3d45168
> >
> > Best regards,
> > --
> > Max Shevchenko <wctrl@proton.me>
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
>  Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0=
ca
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/mediatek/=
' for 20250701-mt6572-v3-0-8937cfa33f95@proton.me:
>
> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): mem=
ory: False schema does not allow {'device_type': ['memory'], 'reg': [[21474=
83648, 536870912]]}
>         from schema $id: http://devicetree.org/schemas/root-node.yaml#
> arch/arm/boot/dts/mediatek/mt6572-jty-d101.dtb: / (jty,d101): memory: Fal=
se schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 1=
073741824]]}
>         from schema $id: http://devicetree.org/schemas/root-node.yaml#

'memory' node without a unit-address has long been deprecated. Please
don't add more cases.

Rob

