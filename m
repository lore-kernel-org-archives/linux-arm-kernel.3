Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E6ECA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z49FbKKlAmO+vgO/oO+bk2H9QeNxjgWLv5uy8+cQqVU=; b=X6PuFRvn6CYJvR2pCmhU+u6bQ5
	MQ57+hz6rZa/lrwUvXY12q/lUjlgcOKB27+bG09q8rU9j/5SkUpmlny9MOI444AXtWlXtPXj5hv4M
	D9UMjo1iYe1FF/iQEZECo2kQQL4VecbLPd3rpjGVeIkcK2v1TvJeYMPx97jK9IqcocmCz5pTz94JX
	Ck5JbBNTs4Pk7ehfmw7pMcPhDG9dzR5kLe+pERv5LlkLSeLjk1Aei4iuQNyiVOtHCza9huCrouoMc
	4Z1ROAFy3M/TewvlvU0BNFwlxrWCERCPy0EeFkUM73N2mAZymW1EZeMT1hLvhaFy9DGJfpm7p63if
	vVoglGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpcn-00000008su9-1FOA;
	Sun, 11 Oct 2026 09:13:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpcl-00000008stg-10Uo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 09:13:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso4820285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710021; x=1792314821; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z49FbKKlAmO+vgO/oO+bk2H9QeNxjgWLv5uy8+cQqVU=;
        b=ee2etMr2j3M10IQX7k4IbC0M4Yew80yb5jyy1/DFgyO10YWzRsBbN96JuqHJLcfNd8
         Fx0f97whmqA5bqdgrhckGmfhmynF78HfMs5Sc6w5oCKLyrluOmkaUt5cONhLAUljB9Cm
         cMUtHK5foklZ0FBz8bxayN18cLYCSVCiQU+3Cijx0XdDQffPbUlJ1oU0xVIlKUPWePA/
         o1qROoiKPhW1B5WIBXbelLjdBk9FHIi6QfN8JAiWCpb+HtDO6Y+7B4ap6q6Z8/OcfXXL
         kh0G/N+nemx/Qz4BVi0AnAweFNfvnFu9ktoSdfGmv/B1uOaX5YV5hV0u3c3/8+Sxnp1M
         5m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710021; x=1792314821;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z49FbKKlAmO+vgO/oO+bk2H9QeNxjgWLv5uy8+cQqVU=;
        b=mFSNKINzhgBLwVrEtD4eujch1tMoTD0xKtJm6qMl44m78sGpeEZhkUBHgFfy8vnT16
         mjwembbmaglyK7v8rdu24K18ium/t68fFDL08pOK79BmGnMkjNMSI5bmqcp9xpO2gXJF
         KTy5IT/BGyp9sy9FO/PmyECfIRKHrN/g4co8Au4aOnPxZj1VZtl6ufpnFdMxMh1X5Pud
         wDtCXLjhI8xHVEQozmJwWAPB5X1thUmuyQwUyuw0hatgA+Ny1OsIrYKUkds7WNxLZhLU
         MaX8WCBbwtcs78d142ayBV45ltc7OFGMJ9gzYtRUeRhzERCIIsr90YXGJsqOe6OreT+Q
         ogiA==
X-Gm-Message-State: AFq9FYIQHHTB/tDrFjX3hpZ9NgKLcxJfsAei0WQOyxsph6j0UbCFz9Sw
	z52ox9MApyJ65O7CpApZk4CsnzxhO0iLziVqfTWhe+Y3CGO/PcsXDO8C/SnIdnl4
X-Gm-Gg: AYBFou3NcuU+B5ujtxJoKcOUGW2TLtVitV3AwvbXT9L/TH2zh5K4T3WXJGVkB7CkmKE
	SJKvpYSqP9h15FWlfLeFYMGBdPljjp9+gBggeyXg/CxRFEdcZrZnma8Ew8DsgwNMmWd1rlyrxyg
	MurO4AGcmhSjBDuNKHg+jc1AbMTIU9shC14bXnbRZgZ0HCK30ZT+OQ21Ezakiu4YW7stvrKv7Oz
	h5bwUw35w8EHSMhnDc+4d/v+/Zh1VHmUKyy/MRMOWdAYXTLEcQdTnNVDnhRE8PxQHvkH9shKVGa
	dTyL1FMcjQxNLpYBa0ZJvjVw2rd6G/3tIBGaDcR0Wkz5DujyEf7gRzdGURZwK1x1tlut0PvJFsQ
	Cn4BlV8q9+zQ0eJGpUXDJUaZ+pZcwGKilwXUdXcYUiCxJ3Lqgahl7WAsJcYMIBTpqve5RpXYAZY
	7mDwp9LYpxHlmWRx6qwRG1BxXF5L2AovZduEO/1w2REFqhQwTzYZHwkPSu5c1zpvJsSxOlrc0nX
	WwQnJHnnbjR82vwmKRLmwY+a/KCG2yCzSdK+6UGcSxCs3yYN/EbuMM4Ig==
X-Received: by 2002:a05:600c:46c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a18e4d6b28mr120874255e9.33.1791710020945;
        Sun, 11 Oct 2026 02:13:40 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm254023425e9.0.2026.10.11.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:13:39 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 06/24] dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
Date: Sun, 11 Oct 2026 11:13:37 +0200
Message-ID: <7axmtiEnS5SDBrUzy6e6jw@gmail.com>
In-Reply-To: <20261010130024.177503-7-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartjpLtN9HcTiyHU1_e0KJPjQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_021343_323550_5C211D39 
X-CRM114-Status: GOOD (  26.08  )
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

--nextPartjpLtN9HcTiyHU1_e0KJPjQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Sun, 11 Oct 2026 11:13:37 +0200
Message-ID: <7axmtiEnS5SDBrUzy6e6jw@gmail.com>
In-Reply-To: <20261010130024.177503-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi Navid,

I don't have enough knowledge about about PCIe and the A9 l2cache to commen=
t=20
on the previous patches. For the clock ones I have a few points of hardware=
=20
investigation and the actual implementation.

Am Samstag, 10. Oktober 2026, 14:59:44 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: zte,zx279128s-topcrm
> +          - const: syscon
> +      - enum:
> +          - zte,zx279128s-lsp0crpm
> +          - zte,zx279128s-lsp1crpm

The advice I got for my zx297520v3 bindings was to write a separate binding=
=20
for the clock controllers rather than try to write a one-size-fits-all one.=
 So=20
you'd have a zte,zx279128s-topcrm.yaml that has compatible zte,zx279128s-
topcrm, syscon and a separate lspcrpm.yaml (or maybe even one lsp0crpm and =
one=20
lsp1crpm) that take the other compatible

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5

If you split the bindings the clocks becomes a fixed list in each, simplify=
ing=20
the if-then-that rules you have later.
=20
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

Your topcrm should have the reboot node as a child. syscon-reboot's "regmap=
"=20
property is deprecated and shouldn't be used for new bindings.

This will either mean adding the simple-mfd compatible to auto-probe the=20
reboot child or writing a MFD driver that does that. Since you also have cl=
ock=20
and reset functionality in there the MFD approach seems best, and it is wha=
t I=20
ended up doing for my CRM controllers.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx279128s-lsp0crpm
> +    then:
> +      properties:
> +        '#reset-cells': false

Are you sure there are no resets in lsp0crpm? Given what I know from my zx2=
9=20
board, it is likely that there *are* resets, but the ZTE kernel doesn't bot=
her=20
asserting/deasserting them and they come deasserted by the time U-Boot take=
s=20
over. (So either they are deasserted after powerup or the boot rom deassert=
s=20
them.

The way I discovered the rest controls on my board: I set all the registers=
 in=20
the LSP controller to 0 via a hack in arch/arm/kernel/head.S and looked at=
=20
what broke. It turned out that there are some bits that need to be set to 1=
=20
for the device to work that aren't mentioned at all in ZTE's code dump.

The follow-up check was to see what the impact of those bits was: Setting a=
=20
pclk gate to 0 usually causes the mmio registers to read 0, 0xff, garbage o=
r=20
just hang (busybox's devmem is your friend). A reset bit, when asserted (se=
t=20
to 0) does the same. The difference is that when you re-enable a clock, the=
=20
registers retain their old contents, whereas after deasserting a reset, the=
=20
device lost previous state.

Since most devices have 2 reset bits YMMV. One of them might not do anythin=
g=20
at all. Or one resets bus access properties while the other resets working=
=20
state.

> +++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
> +#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
=2E..
> + * Top CRM resets: (register offset / 4) * 32 + bit. The USB 3.0 control=
ler
> + * has four in register 0x4c; what each one resets isn't known.
> + */
> +#define ZX279128S_TOP_RST_USB_B9	617
> +#define ZX279128S_TOP_RST_USB_B10	618
> +#define ZX279128S_TOP_RST_USB_B11	619
> +#define ZX279128S_TOP_RST_USB_B14	622

Please put the resets in their own reset header.

Using hardware locations (offset, bits) for the binding values is discourag=
ed=20
as far as I understand it. I saw a comment by Krzk on a different binding p=
atch=20
stating that. I'll try to find it.

It is better to give them logical values (0, 1, 2, ...) and have the reset=
=20
driver map them to the actual hardware location. This also helps if you fin=
d=20
out that you got a reset bit wrong. Since the bindings are considered ABI,=
=20
changing them later is tricky - you don't want to have to do it because you=
=20
identified a reset incorrectly.

Cheers,
Stefan
--nextPartjpLtN9HcTiyHU1_e0KJPjQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLU0EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiy9UQAILnMit2k2tNCuGxm+W4
RPJOXzI39DY/XBG02vuhvovf71wMXUwUmxhHJYYYlBbmQVuLfGDENx4mr991TWQ7
uTmRIYSdQVZzHcFCbfhiyWxMmtHlt9k5TlHPvgyehjVwv94Y4WCabFGtIdu2bJ0P
JOPn5EGwcFeeFgWl/MYCUzlkRtUGyoeXruJOc1cz6wQJFTHaMe77lgYcS/PKSWKi
ewmmUSVV0fuq5+CBDbp+iIR1qKUIPg6V/bnOlB4LUDmIO6h+46WGgJayrCgSgmGP
dKUH6l1rzLqhlGM9U9eLZ+gloSuRf9HGprGYoKkyrVVP9VQaUPR5369YGhsyioG0
2FPhT41fRKqyxqPxlRX7VBhviVGKd2SgXy0A6hRbjlSrHJ//ol54tCe+BXiyeYhx
piewX87U3IskZTfWaQpVoAKxtAao45UbbX1F2E98MApWqH9TSf9SYoK6ogKf4F1t
u+cCbJVb0tP9IrWe7cnBHpO3FU8H7zvT8ngwDYFCgteyipMvg+gasyTdVa+5uNBF
mdL7rF5pVtgNaEn3vvuuWiT+6Kk/JkTvgrDqF2b8wqH3uXh+WukBA5v/a2qmAtwZ
dD3bpeoZu7+ukku5lxfKs3vzcgC5f5h7ogYxkSkASTwoptZzoJZMDWPrLc+43778
9pYjseVNU4hoNEcRHMNh8cX9
=zJ1i
-----END PGP SIGNATURE-----

--nextPartjpLtN9HcTiyHU1_e0KJPjQ--




