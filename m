Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DFC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=; b=o3h+6QCP7x0urmd8RlRC70yJKW
	ue+un+fa7LVE32++nhCB7s28ypr+29hDzs1axEC+7WTkHNELHf0nA5LsU5LzL9kkEDUvpV6vLGsaJ
	hJ0O5wTJXX29DLql0p3fV2/aae7X3yF0lKVEvXjUOuw6qkyGH/0uyNDCQW67C31H8Sx22tMQRlrBV
	VLw8pF0UXvC12Z+9YGQHoy2VQRkb1dNfUiMS8xaPeqmLOsCPMgTdTCVDP7LGBZZL5ojpiwNEZGNNH
	ZwhkJ6/JBDmrluABZkw/0zBFBi+QCZmUehTc768Oq9MetHpjjI6fnTnE05IEU4v9ApOBY5Cigqpxb
	oCn7WveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50On-00000009HFo-15OM;
	Wed, 16 Apr 2025 10:53:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50Gf-00000009G6e-1aSJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:45:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so36218155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800320; x=1745405120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
        b=H4AbSzXMiJwfawjVVGZNyajsuY/30MTJtIuXKoVSQUBVY+KfBAVVgly10lY0hnzaCt
         PaP9pADl5xu1srwT5DRFmo6ib70hczGvMjPtfaEwK7K+8zwMynb4DIeNAr2diFy/roai
         ne0ZlhV5KIDDHh4haQsAspzFMGKWRjH/2yarz+ZfMYutsevKQi4d3tP7ZPZajCCx/ZbB
         B0SXrtt9US2PoMgKnyPACZTaa/TmO86CEAPD+DCXHVGUEzv4myouJjvaKFyERg3KW0lj
         4CHkGIQS3BK3Oe1EOegLpi20VA9DaX41C7pNmVSViAVPxn/zZ3ptHVyniJQ5mwWIaIPk
         GgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800320; x=1745405120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
        b=e6sFxLcWmG75sSvMiHcBS34ZjDigh7t5prqvVD4IBDLB5aerblkMT2eXMnoyBDuTXr
         zw/qxPIw6w4Bnt07tgev7RXWsTFHybZE3D7sFlX5+7xtphS2LR25ZLNIQTXYaGXDHrNe
         C3InvCSufLzRaJbdcZDx8zfDxe7Hx2TqwqD5YbgIAKdzYQAr3rFrgP5iyk9QszvSwZc3
         09yLEzvl++KZpgjfyD94A9tM+PG0nOJZWZQzv67R/SmdMzGp29mOD7wTgO2SzCgAWQ/b
         YNTIa/eYXhCGjcGg/2jQntOvQdc3xDiH9IBx1hREW4mk5cjBkD5nc3lFS7baU0cFPXcc
         yoLw==
X-Forwarded-Encrypted: i=1; AJvYcCX7tWR6VV2W5IluU7NoTzZ9JBAB/2dj6RNKXro5EgACO1QjBPdJtuaopjCDeS+o947x4m7WtrNJM+DJ7v1FKl6J@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6n+PAOZJXNeX5gskFgvsInZq00NHUdlKh+ZviO1lHTdAT2mfn
	DNWW34S36C4tOrRE7KqNQgbTM+wTMUKCfpnWv701+X+Nk5MyMcCaXkSEla2NJQnaZdjXhejlYDX
	g9KcB6RVH5BqgVx74ODvqNlEnAjk=
X-Gm-Gg: ASbGncsrDNdiJjKfinTLIuM+j4Rwx5mMGcoURvL1MkdRrHCO1zy5x8vdmpjVea0HCUz
	+GCXkoo5Z/U1TIxsfVp89hj2s2lAPKu0qgvC7Qty6QSBB0Yfn0NGXHSrHHVZgC375Oa0uVzp01K
	z1fbroqmuMPSJ32wAO0jViHKyb7XMDKck4B3FIQJ+7G+19yp0pfCbrgos=
X-Google-Smtp-Source: AGHT+IHceAQPkYgr6gv4d+47dQi2BveM4MNunE8eLD0kPVn7VMp8NlOF14LAKjl5p9eftjHmJMrjHs4kMBezXamCYyU=
X-Received: by 2002:a05:6000:1863:b0:39a:ca04:3e4d with SMTP id
 ffacd0b85a97d-39ee5b1123amr1251169f8f.7.1744800319726; Wed, 16 Apr 2025
 03:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 11:44:53 +0100
X-Gm-Features: ATxdqUFZg4onSRXp1_kJuV7m9X73pVYBtmBk0hrdoERO50FU_acfBNENrSpy6UU
Message-ID: <CA+V-a8ua8anSCuyEYrdcpcCcdzE4EmQ0SDidYfiwe9zzezccaA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_034521_419941_634056A6 
X-CRM114-Status: GOOD (  24.89  )
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

Hi All,

On Wed, Apr 16, 2025 at 11:40=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbe=
th.c
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..2c99b23f0faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>           This selects the Qualcomm ETHQOS glue layer support for the
>           stmmac device driver.
>
> +config DWMAC_RENESAS_GBETH
> +       tristate "Renesas RZ/V2H(P) GBETH support"
> +       default ARCH_RENESAS
> +       depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +       help
> +         Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +         RZ/V2H(P) SoCs.
> +
> +         This selects the Renesas RZ/V2H(P) Soc specific glue layer supp=
ort
> +         for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>         tristate "Rockchip dwmac support"
>         default ARCH_ROCKCHIP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
> index 594883fb4164..91050215511b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)   +=3D dwmac-lpc18xx.o
>  obj-$(CONFIG_DWMAC_MEDIATEK)   +=3D dwmac-mediatek.o
>  obj-$(CONFIG_DWMAC_MESON)      +=3D dwmac-meson.o dwmac-meson8b.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        +=3D dwmac-qcom-ethqos.o
> +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)   +=3D dwmac-rk.o
>  obj-$(CONFIG_DWMAC_RZN1)       +=3D dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_S32)                +=3D dwmac-s32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> new file mode 100644
> index 000000000000..f34bec7794e2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> + *
> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct renesas_gbeth {
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct reset_control *rstc;
> +       struct device *dev;
> +};
> +
> +static const char *const renesas_gbeth_clks[] =3D {
> +       "tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
> +{
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct renesas_gbeth *gbeth =3D priv;
> +       int ret;
> +
> +       plat_dat =3D gbeth->plat_dat;
> +
> +       ret =3D reset_control_deassert(gbeth->rstc);
> +       if (ret) {
> +               dev_err(gbeth->dev, "Reset deassert failed\n");
> +               return ret;
> +       }
> +
> +       ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> +                                     plat_dat->clks);
> +       if (ret)
> +               reset_control_assert(gbeth->rstc);
> +
> +       return 0;
Just noticed this has to be ret, I'll send a new version fixing this.

Cheers,
Prabhakar

