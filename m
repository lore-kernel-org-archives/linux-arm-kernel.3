Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C85E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WASk+gE3NJv8dH2tIoBohA4wKX3eYlj864c+8gk1xzY=; b=TPJptpTkqHDZqH
	WGpKuXyTcHQGAA3eW9SXlC3zr2cJrYpB6BEomyY7dGphM0C4JZW9tczMxdXZMk+xj4haWn7FeMI6j
	Nl7Aa01MpI0bHcw9BnqW9vWUeoPy+/yCf0yHh+pywgDfjMPT/eY65Q/koECSKzOXmX5NePggsiAmE
	hZtwP7SCdFenntKW1D3/ld7lozKUJLe6Z17DbZmvv9rGO9Xl72Vc/EU0t8sfAL/nGzf6p/mdF6OAZ
	OaZOfYhJqpU8QTpV7/9wGKvOO7BfX/zBgeFCGspR4WHQGoAAAB4zRwbMqMgXtzidKMsIQGaoapDAs
	Ey58yjE53sZRUSp0O9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGHC-00000004V3a-2iTv;
	Mon, 13 Jan 2025 08:58:26 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXG4d-00000004SYN-2Jfw;
	Mon, 13 Jan 2025 08:45:29 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401ab97206so4000224e87.3;
        Mon, 13 Jan 2025 00:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757924; x=1737362724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WASk+gE3NJv8dH2tIoBohA4wKX3eYlj864c+8gk1xzY=;
        b=E4xVu+rSWw4jvu/Cg01OtUQjv2JYRdBz/d8IQmzcjBnNkes5jpKwKTorE3dLwT5saK
         1LDBLq9wJQ4Srau2r3rPq8O8vH50Zb6VGHI7i7NlvwsZJeyCrEKRIq9Lp4DzfQZybuaj
         cN4d7IF6HFx+2qXvqFwUcX8e8vdWMptUDP6i9vT9jMmLp6S6xQiuXVKPgZR4eW2C2xkp
         qUV/e58AATGU9fas82ARzUcxE/Fxe2SpmsZTnZJVk6TiCH3z0u6AdD354xbJbHOHyPqu
         w8Y9hbkC0/yX4x+9u25o+TpS8PQxVVANiMmUoXVCEzvzPr5IsxDyuPPoKoa+HR0Tw1Cp
         O/VA==
X-Forwarded-Encrypted: i=1; AJvYcCWpfgdrdEBkLFZ3wRu+l8+xbxi7Rq2lK7d6xGi5QdWn5Dwc80MNlDiwzFDOvgcetFcP/ZIaKGhDkhU5188=@lists.infradead.org, AJvYcCWuTMjtzr4W8jPas/ZjC2PzGDTFx6cWIGV1a8ATrSyiICQGm57Nxq8h2HWRfol0aL73xlN30tpNUe9u7S5XElXH@lists.infradead.org, AJvYcCXpwBOwrT0KFG10TDnpKeekR9K5JUwU7hSBwOOIeQlt2ft47BYdgT4JLqaLVWkHsUJ8GIwbIgjKAa43@lists.infradead.org
X-Gm-Message-State: AOJu0Yytnu6dEjWsawQZv05GJ7q978ocV6PgGt5xsXZKiCpnvM7dJby0
	EtVeaKWbiXtLTCj7FigeGdvuLaiN0I2hSIPpbDxSlf9m9d8gXJTrqczH5PmTlyA=
X-Gm-Gg: ASbGncs3ByY9bTTRBR4QRIX1UnL2EndmGzIIhmSueBSMH0UhdrgsV0YUoZogWBsHTh7
	GqnrImu7NIK7O7SHCioN7G2mK4+9Q5Vf3vyInau3SJKm2MaaTIkcrBl1J7Uicphj+ZcQBJOJxsN
	nal56UPAPSuI2+iC9jt5RLg11Ow61ui2rvB1Oxg8uCDlXV5Iweg3c42pXDY3WN6zeIvMVaReMl7
	XqT9cKzJzejE183QaQ3dF6pNivG0oLTwPsBM8l/GdEm1ncktSgVDbb4uVanhkyoejkszGziQo8c
	WGrzjqm5bYZKmw==
X-Google-Smtp-Source: AGHT+IFZWDkcVZSYuxryKbdLdaADgF/X3QH3zwgX5ttpIesnaf4n1m4Np8D23Zugc8fW14G/nxhPnA==
X-Received: by 2002:a05:6512:1281:b0:540:5b5c:c18d with SMTP id 2adb3069b0e04-542844f6d6emr5502349e87.7.1736757923922;
        Mon, 13 Jan 2025 00:45:23 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec3ee8sm1261892e87.226.2025.01.13.00.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:45:23 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3003c82c95cso29178461fa.3;
        Mon, 13 Jan 2025 00:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA+xEKnUHVS3FPLviNVB9zuIFgsuK1V/Ywp0cMv1gJL+Yi7UTnnkwNYydK1UxFmvEsXrhTFhYSPuhi@lists.infradead.org, AJvYcCVJ7JAbL+jBOdB/KkVACjSuo9UAxVmGPi0YeV/9w/Wmj0pUmFBN8rt28kYddmA/wVIe+6iudsBMQ/Wp6/8=@lists.infradead.org, AJvYcCVWcT3XkZbKybfbCb1uHHttiwyfyeC4gWNid+kxG0bGCEUNC5Det1l0hbr0KlcRv6nhrZDgLGM3OnBVKyleNmQH@lists.infradead.org
X-Received: by 2002:a05:6512:e93:b0:541:1c48:8c17 with SMTP id
 2adb3069b0e04-542845b0a66mr5904614e87.46.1736757923296; Mon, 13 Jan 2025
 00:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-7-szemzo.andras@gmail.com> <de280eed-bcc8-4802-9734-5e95ad1f6611@kernel.org>
 <CAGb2v65arvBMg+reReVqK-Y6dL+CSrSx4618msiRKcNf=Vk1=A@mail.gmail.com> <fef71e03-489f-4503-9d1b-d61051d45dde@kernel.org>
In-Reply-To: <fef71e03-489f-4503-9d1b-d61051d45dde@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Jan 2025 16:45:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
X-Gm-Features: AbW1kvZtDHwSmVGYxqRRgoOst1sjetl-67if_VRPdIRHwhs3tGpanfWm11zl1N4
Message-ID: <CAGb2v67_yMB_4SCjFOR5S6nDxX9=zbX-mDM6YjjL_NRxrEMUFg@mail.gmail.com>
Subject: Re: [PATCH 06/12] dt-bindings: clk: sunxi-ng: add V853 CCU clock/reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andras Szemzo <szemzo.andras@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_004527_600170_07BFC9C9 
X-CRM114-Status: GOOD (  25.05  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2025 at 4:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/01/2025 09:06, Chen-Yu Tsai wrote:
> > On Fri, Jan 10, 2025 at 9:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 10/01/2025 13:39, Andras Szemzo wrote:
> >>> As the device tree needs the clock/reset indices, add them to DT bind=
ing
> >>> headers.
> >>>
> >>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> >>
> >> That's never a separate commit from the binding.
> >>
> >>
> >> ...
> >>
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/clock/sun8i-v853-r-ccu.h
> >>> @@ -0,0 +1,16 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> >>> +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All rights=
 reserved.
> >>> + *
> >>> + * Copyright (C) 2023 rengaomin@allwinnertech.com
> >>> + */
> >>> +#ifndef _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> >>> +#define _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> >>> +
> >>> +#define CLK_R_TWD            0
> >>> +#define CLK_R_PPU            1
> >>> +#define CLK_R_RTC            2
> >>> +#define CLK_R_CPUCFG         3
> >>> +
> >>> +#define CLK_R_MAX_NO         (CLK_R_CPUCFG + 1)
> >>
> >> Nope, drop. Not a binding.
> >>
> >>> +
> >>> +#endif
> >>> diff --git a/include/dt-bindings/reset/sun8i-v853-ccu.h b/include/dt-=
bindings/reset/sun8i-v853-ccu.h
> >>> new file mode 100644
> >>> index 000000000000..89d94fcbdb55
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset/sun8i-v853-ccu.h
> >>> @@ -0,0 +1,62 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> >>
> >> Odd license. Did you copy the file with such license from the downstre=
am?
> >
> > AFAIK all the existing sunxi clock / reset binding header files are
> > dual licensed. OOTH all the YAML files are GPL 2.0 only.
> >
> > IIRC we started out GPL 2.0 only, but then figured that the header file=
s
> > couldn't be shared with non-GPL projects, so we changed those to dual
> > license.
> >
> > Hope that explains the current situation. Relicensing the whole lot
> > to just MIT or BSD is probably doable.
> That's not what the comment is about. Dual license, as expressed by
> submitting bindings/patches and enforced by checkpatch are expected. But
> not GPLv3, GPLv4 and GPLv10.

I take back my statement. It seems we have a lot of GPLv2 or later going on=
.

include/dt-bindings/clock/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun20i-d1-r-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun50i-a100-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun50i-a100-r-ccu.h:/*
SPDX-License-Identifier: GPL-2.0 */
include/dt-bindings/clock/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun50i-h6-r-ccu.h:/*
SPDX-License-Identifier: GPL-2.0 */
include/dt-bindings/clock/sun50i-h616-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun5i-ccu.h:/* SPDX-License-Identifier:
GPL-2.0-or-later */
include/dt-bindings/clock/sun6i-rtc.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/clock/sun8i-de2.h: * SPDX-License-Identifier:
(GPL-2.0+ OR MIT)
include/dt-bindings/clock/sun8i-tcon-top.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/clock/suniv-ccu-f1c100s.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT)
include/dt-bindings/reset/sun20i-d1-ccu.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun20i-d1-r-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun50i-a100-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun50i-a100-r-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun50i-h6-ccu.h:/* SPDX-License-Identifier:
(GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun50i-h6-r-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun50i-h616-ccu.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
include/dt-bindings/reset/sun5i-ccu.h:/* SPDX-License-Identifier:
GPL-2.0-or-later */
include/dt-bindings/reset/sun8i-de2.h: * SPDX-License-Identifier:
(GPL-2.0+ OR MIT)
include/dt-bindings/reset/suniv-ccu-f1c100s.h:/*
SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Is there a requirement that new files have to be GPL 2.0 only, not
GPL 2.0 or later?

Documentation/process/license-rules.rst says:
The license described in the COPYING file applies to the kernel source
as a whole, though individual source files can have a different license
which is required to be compatible with the GPL-2.0::

    GPL-1.0+  :  GNU General Public License v1.0 or later
    GPL-2.0+  :  GNU General Public License v2.0 or later
    ...

Aside from that, individual files can be provided under a dual license,
e.g. one of the compatible GPL variants and alternatively under a
permissive license like BSD, MIT etc.


ChenYu

> Best regards,
> Krzysztof
>

