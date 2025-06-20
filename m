Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C4C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=; b=3qqHQkZpg4pKSWOsdkTi6TtKqx
	YCOS6D4oGqWwCELEb4/sp1RiHC1q1/mr/Ri2gb5GnWyTGxBuQJu4zxxR0GHQXYUp3Ngobun/crSUq
	IwxouYTmHZ5p3Zd953W/Cq3cBHUVdJgvvf4suVLELSkflvJdmBcJki4PC5DN4jLXQNE54IjTuW5zp
	aYS3nRwaFAIspzhTD4ZnRvKwVQB1aa/5cgVSFFRqoZLegm94F3qXT2vhJg8e2spdfJRMe+MmHHvZZ
	h3sl0faPP914YX9kj0pL4eMwbxP28szjBO/v20qVB1hQz7maKHJTo6atjmls+xKi7oBMj778fQMzY
	Z1ZhyGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyW-0000000FkGr-2I1q;
	Fri, 20 Jun 2025 13:40:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbqR-0000000FjcZ-3B1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:31:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b31d578e774so1268520a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750426311; x=1751031111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=TchivOJEy/A2DiSSbZReqky1gXeRUyAmhEUE1pGH8h8fYWGIUoSUjtrn9oNjNV6vhe
         BQq4xa1C8Q2szZ3Hu/o6VGKxKNDGHjkmDPr9nvUf3bPTzCAiPC3wSFNZk0/Vjh66P4GX
         t+b3cPbu55Y5g1TXtD7+Xg41on6RCNrhof2nySXJb2ihLVALt/3DkGDXPlisFUXlGpFH
         /bKU4Mc5yNrdlQ63leUD2Yr/Pi2xoq+6I5MTiD2uiuUK2acYNak71ASQlMhrUsXooku4
         tBcfCTS7g475xxkN1AdyjZiIPvwWB2rhQ1p3/rQGnLpKqyk3dvkrjFVfZpMihYhrasHs
         KLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426311; x=1751031111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD67VGoIFc7viTaixF6jhGk+Vu3kiN+A3PvW7sAsva4=;
        b=dYE+xYR4nZhvQRe3MQd0nz8US0K8o0s4ESNC95tqB9ALkj9ulnuoNfRWJZc5TgCJhS
         j3v5grCbz250AgHMdBi6bcWj51TrlKWBU3/M+ZFXPuq02noOEb0krtyj3Lak5oPG1N2F
         7omRpj4/n7YK1Mh8ulvLkSyfLvHM7D1MlscxIi12L/toHLc3WronWDJ/bwS/fvUgKbjX
         Z5itxC7my1zEDD/YOcGKM0YZYW4wWTZr3jzjwX7u6CXzXIkCC/pM8DHZpsAB6nW/szcI
         5Ny3Fj2cym536tDYsOcG0TGlvOdInYaIZw/vXjO1ilau9SC4igD2K9LQ7mCoMsMnWrqy
         ixiw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2ecFLIyyFr59/EfXip9wTcPdjMBaPOdcPnE68MWyfhkr9cAKcHcSIZHY/I2p/QDwoetHj/a1Gcy1ME693BRH@lists.infradead.org
X-Gm-Message-State: AOJu0YxWQfcYANf3zaRT/8j4ZLTtcpzE1YsBMimiLvDityAQz2Vt/lD+
	diZpSnrbV8pKj/xly0qa7JFPbG7FM/lOkZfkjhxywLwRcHw32QM4HZSvuSHO8FFdiC9zf7C3cNP
	Z6VpRtoLSxX8nbXnRLSDac8q+sfPfVXZaZik4DAU=
X-Gm-Gg: ASbGnctZljn956G0rheFr6w49Vc5rgxBgT6Ax+qjwGbvNxq1p98D6yN8i1fs0h/kb1x
	MZFyg8V72Ac5dhDZ79bcSXmCIWdYxBNvG3zc6YujHlt4oViIEO/PBk5r5MPC6ygHP4TEz7V0Mvr
	I2BkS24viSSHeJKKoovWd2jyIDBSDBHLoKvVkVtBof
X-Google-Smtp-Source: AGHT+IH3fQ614Vx5GzkzKNEt57w45C62O8m4Fe+y3Z88xij0+BBvMKQejo4mfuZeKaeYz95v1iqBe0ZzmZyXbsNGhCo=
X-Received: by 2002:a17:90b:2dcb:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-3159f503784mr3641263a91.10.1750426310887; Fri, 20 Jun 2025
 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:33:50 +0300
X-Gm-Features: AX0GCFuHG9nwEDIse9o6OGABxZ9DBwglQi1amT5GMFegc87DEv-xylKcvAMSJZE
Message-ID: <CAEnQRZD0RYeOsy-0cK4CDzroKySoOoKu=nJD4GT+Tyiii9x43A@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_063151_795642_BCA019FF 
X-CRM114-Status: GOOD (  16.10  )
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

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/b=
oot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..6481c484ca37
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX8MP_AIPSTZ_MASTER           0x0
> +#define IMX8MP_AIPSTZ_PERIPH           0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL              (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW              (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR              (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW              (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP               (1 << 0)
> +#define IMX8MP_AIPSTZ_WP               (1 << 1)
> +#define IMX8MP_AIPSTZ_SP               (1 << 2)
> +#define IMX8MP_AIPSTZ_BW               (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA             0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53             1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2            3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3            3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4            5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7              6 /* Cortex-M7 */
> +
> +#endif /* __IMX8MP_AIPSTZ_H */
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 307e1671eccf..9b550f225856 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include "imx8mp-aipstz.h"
>  #include "imx8mp-pinfunc.h"
>
>  / {
> --
> 2.34.1
>
>

