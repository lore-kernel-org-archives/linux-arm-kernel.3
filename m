Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE19BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dpo5WMvSHiZdUjnCU7ZcgyQ986Sd3fENuocGlx6aSZQ=; b=X7odyG+qQB+yhX
	+CA+hrIfg/8WZRMoe0cvHjonTC8jFJwZOAiChaBgtDt/fMzrdzg+FX6dz68sDDDSly/qWNEiyiBI5
	ovf2UWvBiOBXgJqF7oddu1J+V6E1E5EgYFocIOu3fdlwXEmNS1NGES/TWXCJ9gVopTxVdln6TdNwn
	vgTumVRGuHyoEWtk9kuuSY26Sxxcai6rnqAUs6isArykfK5aXvtztGVra2FftzX2/5VaKBlQf5YOS
	xs/ykfbP0U2QFdUCPJCEl12nMcCz3MTYKpl1aCUyvHLJ8Jnej5DGLvB8Jrm19VaXyCdZisXqUQPA7
	H6jIhMn2wnm/Q3YUDwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaG5-00000001SpS-19aU;
	Sun, 16 Feb 2025 08:44:13 +0000
Received: from mail-il1-f172.google.com ([209.85.166.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaDQ-00000001SX0-0qim
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:41:29 +0000
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d193fc345aso7772625ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695283; x=1740300083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpo5WMvSHiZdUjnCU7ZcgyQ986Sd3fENuocGlx6aSZQ=;
        b=m/QasE6wSDkyR2LU9Um4sUrSSN6NbqIqCvqbczyPOMKZP/VN8VYOKQApE2AR/kxnff
         +eg/0GSGfNvCnLlIL6dUJoQ7kCdek29742YBGt4UIEJmufI+zX6swcVIFP371bk+VsKm
         91CbvxypN/4otGDWvoSfbJvXj1lTplcp1wemsXO4mw9gOFFNs3T2pXB84L983363Cfwj
         Fcww+UAZz+V8CW26pVIzByV2QsmQRb7K7oDtjavt+L9jKV+KxzZ+VIJnMtksLy4YD1CZ
         tOWGVnJvC16u6+egxJSfGkfmLY77vlfkaa/RTSnRfIkyw4uqL1WCjUKctvZ0kd0OYPw/
         ZsSw==
X-Forwarded-Encrypted: i=1; AJvYcCWjBqR4Tv3SMD51yjYs9azYrOiYbhZ4SB494SgjlNLC+xeMbAc9gQSqCDlzX2TxdeGapxpPeJrXDPEyQF5Or3rH@lists.infradead.org
X-Gm-Message-State: AOJu0YxacCDscT23+FwSqm6zzXPaTlx8YdSDsiZLB6/v4IMDzLbUQC9X
	dEypQfJ7hldP3CLsrma3O2nve7cloe5oZ0WvXPfH27+PI8EqrtXKzULmxGeYm1E=
X-Gm-Gg: ASbGncudYeDu/9mvzwJqERWmNnBsZ0XqpQJf0fzIieGPT8QDXXzpGeVyK+KVGKX0HQ9
	yg6v4IjJD1sevgGb/TqyfnctLtTx1EUc0Glubj1gWKm/dEAilKwpUGqcZ9j2idn1AuPGdbRgNiN
	cjhku648xrosn4mUYK/Q/5pMGabrlzOZ6KfKjmKlixBTz7/TT65rRC1KKL8Td2OpPqOh3kJSIdG
	sjXYD6GZj4ROc77+Uha9WQOhHjpm8Iuzh2W6v1WJ6+yTlUHtsevvzLlSe1yCjTIZZOjJ8NXij4g
	/4VWrKXlvUGnWSkW43ZMoTCbl2RkmzDuTzKaCizjGUESqwOa
X-Google-Smtp-Source: AGHT+IHkYlbJOLLmObQwcpexXN4j4LyYw1kRsCuDmB8ExxZBDf8OjyKeu1taVTKHNV5hUzfZuKzhNg==
X-Received: by 2002:a05:6e02:1c83:b0:3cf:bc71:94f5 with SMTP id e9e14a558f8ab-3d28098a122mr40310035ab.22.1739695282845;
        Sun, 16 Feb 2025 00:41:22 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d18fb57636sm14619585ab.52.2025.02.16.00.41.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:41:22 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d193fc345aso7772535ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 00:41:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1Rst9oGuaA/EYhyKXwAyQ+Kf//TtJJKXR0Y5FOsldPYNh2HcxSKSPNN7D6bhboir2hWLHBFE5djakneMlGiDG@lists.infradead.org
X-Received: by 2002:a05:6e02:2610:b0:3d1:78f1:8a86 with SMTP id
 e9e14a558f8ab-3d2809471f1mr44082585ab.15.1739695282060; Sun, 16 Feb 2025
 00:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-4-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-4-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:41:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64z4xVfDkwcgdc6Bp9k1GoN-DWH4vjSEwioMGrmE3Ywsg@mail.gmail.com>
X-Gm-Features: AWEUYZmw3abG4Std0u6pbgvDtbaKDpoG1yzPXqXz-ASh85n4DeWqACoMoRsm03w
Message-ID: <CAGb2v64z4xVfDkwcgdc6Bp9k1GoN-DWH4vjSEwioMGrmE3Ywsg@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] clk: sunxi-ng: mp: provide wrapper for setting
 feature flags
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_004128_243586_75DA5E37 
X-CRM114-Status: GOOD (  17.34  )
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

On Fri, Feb 14, 2025 at 8:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> So far our sunxi clock instantiation macros set the required flags
> depending on the clock type, but the new "dual divider MP clock"
> requires us to pass that piece of information in by the user.
>
> Add a new wrapper macro that allows to specify a "features" field, to
> allow marking those dual-divider clocks accordingly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.=
h
> index e235fdfde2d36..687bd2ec798e2 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -100,11 +100,12 @@ struct ccu_mp {
>                                    _muxshift, _muxwidth,                \
>                                    0, _flags)
>
> -#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg, =
       \
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _=
reg, \
>                                         _mshift, _mwidth,               \
>                                         _pshift, _pwidth,               \
>                                         _muxshift, _muxwidth,           \
> -                                       _gate, _flags)                  \
> +                                       _gate, _flags,                  \
> +                                       _features)                      \
>         struct ccu_mp _struct =3D {                                      =
 \
>                 .enable =3D _gate,                                       =
 \
>                 .m      =3D _SUNXI_CCU_DIV(_mshift, _mwidth),            =
 \
> @@ -112,13 +113,25 @@ struct ccu_mp {
>                 .mux    =3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),        =
 \
>                 .common =3D {                                            =
 \
>                         .reg            =3D _reg,                        =
 \
> +                       .features       =3D _features,                   =
 \
>                         .hw.init        =3D CLK_HW_INIT_PARENTS_DATA(_nam=
e, \
>                                                                    _paren=
ts, \
> -                                                                  &ccu_m=
p_ops, \
> +                                                                  &ccu_m=
p_ops,\

Accidental change?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

>                                                                    _flags=
), \
>                 }                                                       \
>         }
>
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg, =
       \
> +                                       _mshift, _mwidth,               \
> +                                       _pshift, _pwidth,               \
> +                                       _muxshift, _muxwidth,           \
> +                                       _gate, _flags)                  \
> +       SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,  \
> +                                            _reg, _mshift, _mwidth,    \
> +                                            _pshift, _pwidth,          \
> +                                            _muxshift, _muxwidth,      \
> +                                            _gate, _flags, 0)
> +
>  #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,     \
>                                    _mshift, _mwidth,                    \
>                                    _pshift, _pwidth,                    \
> --
> 2.46.3
>

