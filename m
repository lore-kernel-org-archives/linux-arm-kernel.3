Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A69E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9SvbOZC1nnq5Y5FqEi1BPs9LivsVwnmqcjEJAXSzCg=; b=RZaNEWAdjh9lHp
	xjKmaQuLAAHK9ORe0qPlccSFxUn0UmmtXTHONajK2jWwcOA7I6kXmvXx8gWxD0HkrS6huaTVqH4AN
	4n5Y4mNeMFS1IS2iw1lixNYG8jEoLlxvWYAIfRcNwVWa17gCX2Wswi0tofyYBgq1zoOuo37Dl5yoT
	SV1Eo+Liwc1PZUP5SEKtRDSVDFAmS2s20W6qdeYzWWTinIfT7dqw5R7KfBPPvXCDndCCmzh7ERSTM
	Oo1vpIQg5xJCvPKyPpIrOfm96qwrgWcNXrRL4n7zA/LBj9giUwkB7ixpJMw9IsaVRlqZZXIThTSZW
	eewkaYFMM91oWVFqZm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFV3-00000004KS6-0JBR;
	Mon, 13 Jan 2025 08:08:41 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFTA-00000004Jnt-1JK8;
	Mon, 13 Jan 2025 08:06:45 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso3824053e87.2;
        Mon, 13 Jan 2025 00:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736755601; x=1737360401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9SvbOZC1nnq5Y5FqEi1BPs9LivsVwnmqcjEJAXSzCg=;
        b=EcI3UDulAxvlDIdTadikXOXGe0tLUBO7fGCQ6bmA9x5Ja3iGudreroG2dgdc/laVl6
         4CfFk008Te98uFaeiJ+u9XoFhH9tSABeZlprxi/0g+WZwbBcpAgyC894YGI12VU881Zj
         093YrulGd9eOmS2X83S/IHi3W5hVU/TVLRfHqMPC0rNULBzxak1JAQmb9ry1JLXXzPKk
         t5246PS26Ph9NfGC0krZkjR3mtQ2cnBnL/4Z1ZwPBmuV1EywLermbF6s+HwQCunM84jq
         I+Oa2m+jtGfWRPlzA0u6tt1SnkfvTRnbOB1PuPl5WWHbT98LdsY7WO23mkNWJApHc523
         tIOg==
X-Forwarded-Encrypted: i=1; AJvYcCXWCOYqY/C0OXQh8bV21ElbiONIRprbazsqiYlEtjDljl+B8ad+Wiuv2y7iptyxTtJBeLmjVMD2Cms8AOhQhyOW@lists.infradead.org, AJvYcCXYMBJ8SS+IGkAkuJJhHRPc6uG1QKIRn+fIJbllH4Yf3L2dbTwVZB4i8uuYHwzytg8GnjUxi3CtBhgo0jQ=@lists.infradead.org, AJvYcCXdgAh8Tzu2RC8Skr8FGodCLWnnf9rnQK8N6zx4ObQ6dI3skA3j+KOHhLPp+Cel+6QpxC7DZI+U/s3O@lists.infradead.org
X-Gm-Message-State: AOJu0YwIv3Ni5s19XMQnMJ5NFgLN4xOU638e66Pt+6WPIGDzWD/E8JPE
	duEO+Crz9qdZEq9QzLX3NYMrg2BEEosH+scGQ7kOsxhTgXuSfuSNbQd8DHZ1
X-Gm-Gg: ASbGncvD41oJWWQJAOHE3OhikXVm9j8uWAl0ud6/cStEbl6rPHZ9g3hiRD9uPDOIFg2
	6A2r859GRtHf4tM5bsE6kcX6UTSdZVUF5cAKZuOxaOth01S39jxv8h73+/s8oewZjoNWfvgW0SD
	t5Ej8u7opUCxEgjINjMYZrYSglGqig+ufd8Wep5NVRimA9wIHmcu2hp4k8DaKBLMRRS3X/6h/bk
	kJ9AXMqUMa+n8ro3c12M/YF3LHfpJtHJy+FIt6h2p/VIxKAUVfqVe7wR82KKR2HD+GJ2AmP+xPv
	xWuXx/mHfQ==
X-Google-Smtp-Source: AGHT+IEmrwjN71YeSRLY7reSUinT7BUnvs4r1xNKNgOmbKyJi/tIgvq6ukNYt+9im8RkvN++OeeDrA==
X-Received: by 2002:a05:6512:2351:b0:542:2192:3eb6 with SMTP id 2adb3069b0e04-542845c08a7mr6196416e87.52.1736755601027;
        Mon, 13 Jan 2025 00:06:41 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becbc3bsm1256760e87.255.2025.01.13.00.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:06:40 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso3824018e87.2;
        Mon, 13 Jan 2025 00:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbtody/5bWZaPGybQhtAvRaepiW/+kIPYeL7PbUB5Yc38H35wkz5aiUSAY7+HzpENf/RY7uqTVsUCj@lists.infradead.org, AJvYcCVIj685t/ibfUwF1Lq3RBRC+i+ppd2sTn4IXrWKQ1jf3zMBzBc4tf1xYisZb9K4jVha3Bbu6JCKjICiznS7iyqg@lists.infradead.org, AJvYcCX2dzNqJtiNXtRqZiYFMumqQKnYkWth1/LezdUlRlcKGtk5zBqsBlnx6fx5lYeJq6JjA7Wr1JbROMXjDSU=@lists.infradead.org
X-Received: by 2002:a05:6512:1149:b0:540:2201:57d1 with SMTP id
 2adb3069b0e04-542845c01b8mr6646548e87.49.1736755599852; Mon, 13 Jan 2025
 00:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-7-szemzo.andras@gmail.com> <de280eed-bcc8-4802-9734-5e95ad1f6611@kernel.org>
In-Reply-To: <de280eed-bcc8-4802-9734-5e95ad1f6611@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Jan 2025 16:06:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v65arvBMg+reReVqK-Y6dL+CSrSx4618msiRKcNf=Vk1=A@mail.gmail.com>
X-Gm-Features: AbW1kva6YUV9q8y_q0KQe84KsHadIWhU7SR1t_0-KhCfFvLqL38ru64zHHHYBmg
Message-ID: <CAGb2v65arvBMg+reReVqK-Y6dL+CSrSx4618msiRKcNf=Vk1=A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250113_000644_348169_570F88EF 
X-CRM114-Status: GOOD (  18.52  )
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

On Fri, Jan 10, 2025 at 9:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/01/2025 13:39, Andras Szemzo wrote:
> > As the device tree needs the clock/reset indices, add them to DT bindin=
g
> > headers.
> >
> > Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
>
> That's never a separate commit from the binding.
>
>
> ...
>
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-v853-r-ccu.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> > +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All rights r=
eserved.
> > + *
> > + * Copyright (C) 2023 rengaomin@allwinnertech.com
> > + */
> > +#ifndef _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> > +#define _DT_BINDINGS_CLK_SUN8I_V85X_R_CCU_H_
> > +
> > +#define CLK_R_TWD            0
> > +#define CLK_R_PPU            1
> > +#define CLK_R_RTC            2
> > +#define CLK_R_CPUCFG         3
> > +
> > +#define CLK_R_MAX_NO         (CLK_R_CPUCFG + 1)
>
> Nope, drop. Not a binding.
>
> > +
> > +#endif
> > diff --git a/include/dt-bindings/reset/sun8i-v853-ccu.h b/include/dt-bi=
ndings/reset/sun8i-v853-ccu.h
> > new file mode 100644
> > index 000000000000..89d94fcbdb55
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-v853-ccu.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>
> Odd license. Did you copy the file with such license from the downstream?

AFAIK all the existing sunxi clock / reset binding header files are
dual licensed. OOTH all the YAML files are GPL 2.0 only.

IIRC we started out GPL 2.0 only, but then figured that the header files
couldn't be shared with non-GPL projects, so we changed those to dual
license.

Hope that explains the current situation. Relicensing the whole lot
to just MIT or BSD is probably doable.


ChenYu

>
> Best regards,
> Krzysztof
>

