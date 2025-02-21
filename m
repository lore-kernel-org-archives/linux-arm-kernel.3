Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504C6C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN3oGQQws7Six7IFqs4lj8276Rsr9itBvWsUOy5dh5s=; b=Vxy7P18H4CpaJb/W36kddsj76O
	vpmPfPhrcg84s45QYibuU3si1ZFYFkLD6Qly71yr4+NCzOT+scsygGYA2+83CXLaePm6v0GqZgmB8
	Q4JfYs9tf6eljYM5/yY3Z0TI+MQSWiQF5C9Y6ntYvb/aw5/hsRlWNPOcgGat5rIrgCw2YrBsC8jf8
	vrduvzNqeUy4uSxL03tmJwmRmvLUyASDOkgwyOJZGrqTPFs8f7lUqhWW8rXTXcn9uOL5i3QtCYx7f
	ozcm2Z+6K+Ta9Kfov0k4LUkCjxHIZbR/rx2tPq0awRdJm/ii8z9YqvwK2fWNgQUKaknbI7rZm4AhE
	ioy/I7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYEx-00000006aHG-2BAv;
	Fri, 21 Feb 2025 18:59:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYD4-00000006a2E-0aSH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:57:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f73e6ed7fso447387f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 10:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740164233; x=1740769033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN3oGQQws7Six7IFqs4lj8276Rsr9itBvWsUOy5dh5s=;
        b=cBgSqo64QDscxzWPhNAX3c1BmtJi8KUTHxsRYuJCXx5MwM+3v3PebfL+Fvn2nRdlav
         q++JwQDoOaKl+yysRZ0YbE30sroJ80h5yiio+HVocr6HWlRchAe1TDwaE1tZtJqs3C1p
         5D+cLjagKYH4h/+VaXCDbCefcbUWehkve8o8FMOppKvIrrS8hk88f8dL1lu0ElwLPhVW
         tX0Xgr2Nf8ssnJwGK4Oc/p0OYB6OMMjfC5S5AOQLDvlNkhcEJSZu+gjvEvLZWT+w3LRB
         uJt8kTNkjvbt52kqqTPIyyhFLnuHAy4RUinP5LT9unNiPGr9Z09/SEaEWft0A5RVEUmy
         SoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164233; x=1740769033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN3oGQQws7Six7IFqs4lj8276Rsr9itBvWsUOy5dh5s=;
        b=X9RpiOzLvr1y8Yw9cQfkC0wXI+IN23Sxl+yY2HC0BsctixW9FPLb2ZOkjcWorLtlE5
         qdc/1P/Viyyb/PruWLemljQ5ts6LJowr699feUyFWx5KT8WF2BDxZg8b44l0/iUPJg+O
         q4q4Owe8Mh84tI8gDntF1oW1RZJvEmbou49fCZwY5eKjLj90Ou4eTsRRtD1lVB04zPGT
         pOJD9EoYQRZoX6GyGi/QYPx0FnPvq+Ogvvy07z9hk1Woqb/vwRTNWD+pFbVEGV6s+ZHU
         rFIS+nqL42xr3uuiRv/DPJRyjXCOqxruIpnPwO0cXBGmmmSM6sEdJp/Ov+S/YhhfM82p
         Dg+A==
X-Forwarded-Encrypted: i=1; AJvYcCXvodE+opLxg6h7mAVX1p3CVzu0md8LA/q+CEor+LcnMPXR5afVK9oEyPEtRza7gClQ6ksW73RSJ+N4ragWtxJz@lists.infradead.org
X-Gm-Message-State: AOJu0YzLMRszdpowbN6LQTQAn71gQZexq9UZZOSSW4o6od+Xopz503GU
	OWhRT0QqE7XBRGLDX8MwTj3fdYOMMq+qs2nOgCiEhxBMVDIJNgcE
X-Gm-Gg: ASbGncstQPbgyIlqjQvhWiybftc4/2lMXau2nIARehfmF/zvhfcdzeXYnn++dJJTsul
	uY1I8bTUBYB7LbPakQZrWLciJP4RO0d/qcs1UnuZ+jmRUL4tANturORSxlBO8SjcCIZTLfQt8Tm
	sXD/APvmlQ3J4GdqSIsCcK1j/Qon1CRB/Pem7tyz3626fiFWt/6hIBCCkxN3xnbBPEeYJBZztpZ
	VFS3B1e9Qi4OOiwx65MNLvvK29niiANiipdxOQjwHrBrkwenrnYEU8MevT/C0e94qRtCelXR70W
	Iz275MhMkxLs8ITvA7XHkeQXcr1194+VlDdpESUvwIE0Bv2r7dFuA2k8buu+DCnErSWQWMWRPTm
	ROw==
X-Google-Smtp-Source: AGHT+IED3JUpuFrGJtsUJIgfdM5lhUdX84mBy/uSqrlejM+ibWRA7x2nFo9HzaxyAF3shIBnXClB+g==
X-Received: by 2002:a05:6000:1fae:b0:38d:cbc2:29f6 with SMTP id ffacd0b85a97d-38f6e947434mr3452719f8f.17.1740164232187;
        Fri, 21 Feb 2025 10:57:12 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm24085725f8f.77.2025.02.21.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:57:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Fri, 21 Feb 2025 19:57:09 +0100
Message-ID: <2221204.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250216183524.12095-1-ryan@testtoast.com>
References: <20250216183524.12095-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_105714_189873_BA691AA6 
X-CRM114-Status: GOOD (  33.89  )
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

Hi Ryan,

sorry for very late review, but here we go...

Dne nedelja, 16. februar 2025 ob 19:31:59 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> Hi All,
>=20
> v7 of this patch adding support for the Allwinner DE33 display engine, us=
ed in the H616 family of SoCs. Apologies for the short interval between ver=
sions but a compile error due to a missed helper function in patch 11 snuck=
 by me. v7 only differs from v6 in adding this back.
>=20
> v6 includes some small fixes to the device tree documentation, improves n=
aming of an enum type, moves colorspace configuration from the sunxi engine=
 object to the mixer object, and a handful of very small style and whitespa=
ce changes. All comments/tags from previous versions addressed. No function=
al change from v5.=20
>=20
> A v1 patch to enable LCD output for the Anbernic RGnnXX family of devices=
 which use this SoC with an RGB LCD will be submitted shortly.
>=20
> Thanks to those who have reviewed and tested previous versions, and to Je=
rnej for the initial patch.
>=20
> Original blurb below:
>=20
> There is existing mainline support for the DE2 and DE3 AllWinner display =
pipeline IP blocks, used in the A64 and H6 among others, however the H700 (=
as well as the H616/H618 and the T507 automotive SoC) have a newer version =
of the Display Engine (v3.3/DE33) which adds additional high-resolution sup=
port as well as YUV colour formats and AFBC compression support.
>=20
> This patch set adds DE33 support, following up from the previous RFC [1],=
 with significant rework to break down the previous relatively complex set =
into more logical steps, detailed below.
>=20
> 1. Refactor the existing DE2/DE3 code in readiness to support YUV colour =
formats in the DE3 engine (patches 1-4).
> 2. Add YUV420 colour format support in the DE3 driver (patches 5-13).
> 3. Replace the is_de3 mixer flag with an enum to support multiple DE vers=
ions (patch 14).
> 4. Refactor the mixer, vi_scaler and some register code to merge common i=
nit code and more easily support multiple DE versions (patches 15-18).
> 5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to t=
he DE3 driver. This is currently only supported for VI layers (for HW-decod=
ed video output) but is well integrated into these changes and a subsequent=
 patchset to enable the Video Engine is planned. (patch 19).
> 6. Add DT bindings for the DE33 engine. (patches 20-22).
> 7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scal=
er, fmt and csc module support (patches 23-27).

This patchset actually introduces 3 disticnt features, which should IMO be =
separated
and thus making reviewing patches easier.

1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) - this i=
s used on
    HDMI for proper 10-bit 4K@60 HDR output
2. Display Engine 3.3 (DE33) support
3. AFBC modifier/format support (used for more efficient GPU or VPU output =
rendering)

If I'm not mistaken, your goal is only DE33 support. There is are two reaso=
ns why
I've never sent these patches myself:

1. scaling YUV images doesn't work

Not a problem for any user who doesn't use video player with DRM plane rend=
ering,
which I assume is most of them. We can get around of this issue to deny sca=
ling
YUV buffers until the issue is sorted out.

2. plane allocations are hackish

DE33 for the first time introduced option to move planes between the mixers=
=2E DRM
has also support for this, but for time being static allocation is acceptab=
le and tbh,
even dynamic support need appropriate initial setting.
As you might guessed this is done in DE33 clock driver using magic values. =
Proper
way would be to introduce some kind of connection between mixer/plane and c=
lock
driver, so initial configuration can be moved to appropriate module instead=
 of
being thrown into clock driver. I need to check where to put it and how to =
properly
connect DT nodes. Maybe syscon phandle? I'll do some research.

There is one glaring issue (when you work on driver and test every aspect o=
f it).
DE33 introduced RCQ, which is basically DMA, which copies shadowed registers
from memory buffer directly to hw registers. IIRC it does that at vblank ti=
me. This
tells you that current concept of writing register values at any time users=
pace feels
to do commit is wrong and we've been lucky that it works as well as it does=
=2E So,
in order to fix this, driver would need quite a big reorganization. Introdu=
cing
shadow buffers would solve most of the issues, most likely also with YUV sc=
aling.
Implementing RCQ would be then relatively simple and even improve timings.
Note that even DE3 has occasional issue with YUV scaler and also read-modif=
y-read
access to some of its register can produce bogus value and thus corrupt ima=
ge
until next commit.

This is not to say that these issues must be solved with this effort, I'm j=
ust stating
them to make people aware.

Best regards,
Jernej

>=20
> Further patchsets are planned to support HDMI and the LCD timing controll=
er present in these SoCs.
>=20
> Regards,
>=20
> Ryan
>=20
> Jernej Skrabec (21):
>   drm: sun4i: de2/de3: Change CSC argument
>   drm: sun4i: de2/de3: Merge CSC functions into one
>   drm: sun4i: de2/de3: call csc setup also for UI layer
>   drm: sun4i: de2: Initialize layer fields earlier
>   drm: sun4i: de3: Add YUV formatter module
>   drm: sun4i: de3: add format enumeration function to engine
>   drm: sun4i: de3: add formatter flag to mixer config
>   drm: sun4i: de3: add YUV support to the DE3 mixer
>   drm: sun4i: de3: pass mixer reference to ccsc setup function
>   drm: sun4i: de3: add YUV support to the color space correction module
>   drm: sun4i: de3: add YUV support to the TCON
>   drm: sun4i: support YUV formats in VI scaler
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: vi_scaler refactor vi_scaler enablement
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de3: Implement AFBC support
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
>=20
> Ryan Walklin (6):
>   drm: sun4i: de3: refactor YUV formatter module setup
>   dt-bindings: allwinner: add H616 DE33 bus binding
>   dt-bindings: allwinner: add H616 DE33 clock binding
>   dt-bindings: allwinner: add H616 DE33 mixer binding
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
>=20
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
>  .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  21 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
>  drivers/gpu/drm/sun4i/Makefile                |   3 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            |  28 +-
>  drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
>  drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
>  drivers/gpu/drm/sun4i/sun50i_fmt.c            | 100 +++++
>  drivers/gpu/drm/sun4i/sun50i_fmt.h            |  32 ++
>  drivers/gpu/drm/sun4i/sun8i_csc.c             | 345 +++++++++++++++---
>  drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
>  drivers/gpu/drm/sun4i/sun8i_mixer.h           |  53 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
>  drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
>  drivers/gpu/drm/sun4i/sunxi_engine.h          |  29 ++
>  20 files changed, 1306 insertions(+), 214 deletions(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h
>=20
>=20





