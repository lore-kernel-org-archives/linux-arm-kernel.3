Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C836CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K1kJm5inMNkv14D9ydpjinJSulNs5zENgGzWevk8EE=; b=vPKbN4QDA9zNiXJs2hAQwnUg0Z
	z06bbe/++yeh4rtyDvYC5fGSpBzqluV6+mkEi4FXfeYgwrdxNQZrPVOh3Y7l5UH5X1SohH+KQh5Uo
	+sPGLkuVVnTX7hhPlPBv1QKLSqtBBgSnB/RqQVr3E9cfhqSr/hQYtVuPjQlzfkUAReLf7g6pPfBGg
	YRYDajq8kgEXInWx4YSX2XSp84f3ReWHuImXdujF3RKAyB+4ER6kaQ/MA1nM9Aomtf9PNcavkbTTg
	5hbObI8EogFL0vA68QGYBzSC6CApxLJwmmviCKDWYJsXa2ljlCesx/VaJkc0nnAJeBBrVBZCruewR
	07jpcA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoms-00000001jT0-00z7;
	Fri, 15 Aug 2025 07:23:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umogL-00000001iT0-1lh6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 07:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3K1kJm5inMNkv14D9ydpjinJSulNs5zENgGzWevk8EE=; b=HPAvLCsXcrJHLRZsHEsnLI7tyc
	Ww/PmCsjFx6EcW0cP/PnW6kSZ4NcF1TDoyDphyuSdaltl0PM7XRC2qz40gW/PKOmvE6bbLy4zQq9K
	qtOHRhDbEsfB9NCM+KVnOfJMym8XqrVL+TuTHABBkSMW7vyrI40e85+bEHq6ytbecCSFgFb3BE4y5
	rUAJKjefg4lUOsGqi7GLCqNsdCojW9bIPRK0iLz6Q3SdvfZukW3iHK92p1/Nd3DfPCjHR40GE4Uwh
	2x4DKa41l1OMGcjneHMH7ngwBHEfg+JAk3+HlIDuw9K15C75ZyoQe6f4WLn+l/ORVswkgVQvrVWnN
	Jkv9nGJQ==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umogI-0000000Ge9c-0kc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:16:56 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-333f8f5ca72so12150831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755242212; x=1755847012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K1kJm5inMNkv14D9ydpjinJSulNs5zENgGzWevk8EE=;
        b=VTnWY/LZJtdxFsv9QhlnkkvrfB6/2Hvf7BUf6gN4MGI0Yq7CdQxPIy/rSuQQ94OvwZ
         OqslV0D3a3FJFoL33xvKvihNxpLOrjSvcZYKzdzM99G6qT9deWkAb0p2AM7ZIUedZvDV
         eWr9oVfDBL1rn6Zthmcr6DHehY/v/MA8S6vi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755242212; x=1755847012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K1kJm5inMNkv14D9ydpjinJSulNs5zENgGzWevk8EE=;
        b=Yd5xy34dQAcUO3RqcK22LYyON3UN9xrOjb70rUhwpedJM7zimKySQNcppvu/xhayEK
         00f+cjFZrcS/yvn4aixjILFbbsAwEYCUJ3qmzUzbL6g8RrHSmkjQJIMKv26NFDAqRuGs
         ToO0ScmsRZwXt1Z+o7bXO8J7kWX2P0KK9G7iukgSN/lo0NMD2016SuJXSlVubyIK3Dt0
         Ji6bW1rwaCG0fB8pIFqhOIrVwG8Wu9TjZx4uGlGllQbrHZVPf0F7kbZLPyKWeaR4zRbM
         3NWCW5D065EOinY4dhBHpm7/i2rMS6tkd04h8V6Hz/cKdkrBhnQQTFK8qlgD4/pxNdSa
         X4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX8Sm9ZXpWQ+ZHUgKMcKrIgg3fDu57ykMUkKC7kZNKodCSwBmQOh3XsbHTcV3OdC+VM2WuRfzc0Y/FDW1ZYsSs@lists.infradead.org
X-Gm-Message-State: AOJu0YzkiLYXqAdmGe0u+BKP3k/eqIf/4tKneS1i+zT4IYZ19pvp/FlU
	s+Ve68+t3jtuYRApbFIyhen7B2kkO7Hv7+JOjMXhM6miiL/vqjCXqnXZhZjnUjI2jQgPhDaaZJu
	f7h4Hmv3khvJvdqxZIddhGfYgci/mqgGn230paAIh
X-Gm-Gg: ASbGncuV6YeGrpd+y5FErSFi8Ic16CpJee2Xi3X0Rk+w0qw1GUU/QNW+HoJ0EimISIz
	1HTMHue0w0UZdnk5smcYyly6S5kfLri/taozhc/FKRUTg5Hkh8JgdYheCG5FOjlt6/TRHcSxBgu
	ORs/d8fLDxXOWIwDde72jMpTBF4rsKUtnbHyXLP3IbyeK3aMcb4L6dld21nQeX0XoK2bbb/jH2l
	UfSdEBw0HMbr3RTC2J+gsQj7qCZPp+Uusfxpw==
X-Google-Smtp-Source: AGHT+IF53/A6ashxxLkiCCwGt0538IVz8i1pzg2+4/NBPJGi3Nkq4VQOaxq8OGtmtqORzmg2+6YsEKNq1xAp37Z68HI=
X-Received: by 2002:a05:651c:548:b0:332:4238:4f46 with SMTP id
 38308e7fff4ca-334097dc344mr3187951fa.3.1755242211580; Fri, 15 Aug 2025
 00:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-20-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-20-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 16:16:39 +0900
X-Gm-Features: Ac12FXyZceMhsyBRYri8Vjpxp2RX9iE3-1LDqI4GAcFP9a1wCKbnWeSWQ_6z6o8
Message-ID: <CAGXv+5FzZuas0n_qL1AzGYXyFxOwCsoH=SOzU7r4miDszh-uVw@mail.gmail.com>
Subject: Re: [PATCH v4 19/27] clk: mediatek: Add MT8196 mdpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_081654_402764_99FBD74A 
X-CRM114-Status: GOOD (  23.27  )
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

On Tue, Aug 5, 2025 at 10:56=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 mdpsys clock controller, which provides clock
> gate control for MDP.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig             |   7 +
>  drivers/clk/mediatek/Makefile            |   1 +
>  drivers/clk/mediatek/clk-mt8196-mdpsys.c | 187 +++++++++++++++++++++++
>  3 files changed, 195 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 8e5cdae80748..08fa18be525e 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1024,6 +1024,13 @@ config COMMON_CLK_MT8196_MCUSYS
>         help
>           This driver supports MediaTek MT8196 mcusys clocks.
>
> +config COMMON_CLK_MT8196_MDPSYS
> +       tristate "Clock driver for MediaTek MT8196 mdpsys"
> +       depends on COMMON_CLK_MT8196
> +       default m

Please use "default COMMON_CLK_MT8196" for consistency with other
patches and other platforms.

> +       help
> +         This driver supports MediaTek MT8196 mdpsys clocks.
> +
>  config COMMON_CLK_MT8196_PEXTPSYS
>         tristate "Clock driver for MediaTek MT8196 pextpsys"
>         depends on COMMON_CLK_MT8196
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index 46358623c3e5..d2d8bc43e45b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -155,6 +155,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmix=
edsys.o clk-mt8196-topckgen.o
>                                    clk-mt8196-peri_ao.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) +=3D clk-mt8196-imp_iic_wra=
p.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) +=3D clk-mt8196-mcu.o
> +obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) +=3D clk-mt8196-mdpsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) +=3D clk-mt8196-pextp.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) +=3D clk-mt8196-ufs_ao.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
> diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/media=
tek/clk-mt8196-mdpsys.c
> new file mode 100644
> index 000000000000..87ac3b52fcbc
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *                    Guangjie Song <guangjie.song@mediatek.com>
> + * Copyright (c) 2025 Collabora Ltd.
> + *                    Laura Nao <laura.nao@collabora.com>
> + */
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +#include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mtk_gate_regs mdp0_cg_regs =3D {
> +       .set_ofs =3D 0x104,
> +       .clr_ofs =3D 0x108,
> +       .sta_ofs =3D 0x100,
> +};
> +
> +static const struct mtk_gate_regs mdp1_cg_regs =3D {
> +       .set_ofs =3D 0x114,
> +       .clr_ofs =3D 0x118,
> +       .sta_ofs =3D 0x110,
> +};
> +
> +static const struct mtk_gate_regs mdp2_cg_regs =3D {
> +       .set_ofs =3D 0x124,
> +       .clr_ofs =3D 0x128,
> +       .sta_ofs =3D 0x120,
> +};
> +
> +#define GATE_MDP0(_id, _name, _parent, _shift) {       \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &mdp0_cg_regs,                  \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \
> +               .ops =3D &mtk_clk_gate_ops_setclr,        \
> +       }
> +
> +#define GATE_MDP1(_id, _name, _parent, _shift) {       \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &mdp1_cg_regs,                  \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \
> +               .ops =3D &mtk_clk_gate_ops_setclr,        \
> +       }
> +
> +#define GATE_MDP2(_id, _name, _parent, _shift) {       \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &mdp2_cg_regs,                  \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \
> +               .ops =3D &mtk_clk_gate_ops_setclr,        \
> +       }
> +
> +static const struct mtk_gate mdp1_clks[] =3D {
> +       /* MDP1-0 */
> +       GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
> +       GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
> +       GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
> +       GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
> +       GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
> +       GATE_MDP0(CLK_MDP1_MDP_RDMA2, "mdp1_mdp_rdma2", "mdp", 5),
> +       GATE_MDP0(CLK_MDP1_MDP_BIRSZ0, "mdp1_mdp_birsz0", "mdp", 6),
> +       GATE_MDP0(CLK_MDP1_MDP_HDR0, "mdp1_mdp_hdr0", "mdp", 7),
> +       GATE_MDP0(CLK_MDP1_MDP_AAL0, "mdp1_mdp_aal0", "mdp", 8),
> +       GATE_MDP0(CLK_MDP1_MDP_RSZ0, "mdp1_mdp_rsz0", "mdp", 9),
> +       GATE_MDP0(CLK_MDP1_MDP_RSZ2, "mdp1_mdp_rsz2", "mdp", 10),
> +       GATE_MDP0(CLK_MDP1_MDP_TDSHP0, "mdp1_mdp_tdshp0", "mdp", 11),
> +       GATE_MDP0(CLK_MDP1_MDP_COLOR0, "mdp1_mdp_color0", "mdp", 12),
> +       GATE_MDP0(CLK_MDP1_MDP_WROT0, "mdp1_mdp_wrot0", "mdp", 13),
> +       GATE_MDP0(CLK_MDP1_MDP_WROT1, "mdp1_mdp_wrot1", "mdp", 14),
> +       GATE_MDP0(CLK_MDP1_MDP_WROT2, "mdp1_mdp_wrot2", "mdp", 15),
> +       GATE_MDP0(CLK_MDP1_MDP_FAKE_ENG0, "mdp1_mdp_fake_eng0", "mdp", 16=
),
> +       GATE_MDP0(CLK_MDP1_APB_DB, "mdp1_apb_db", "mdp", 17),
> +       GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC0, "mdp1_mdp_dli_async0", "mdp", =
18),
> +       GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC1, "mdp1_mdp_dli_async1", "mdp", =
19),
> +       GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC0, "mdp1_mdp_dlo_async0", "mdp", =
20),
> +       GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC1, "mdp1_mdp_dlo_async1", "mdp", =
21),
> +       GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC2, "mdp1_mdp_dli_async2", "mdp", =
22),
> +       GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC2, "mdp1_mdp_dlo_async2", "mdp", =
23),
> +       GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC3, "mdp1_mdp_dlo_async3", "mdp", =
24),
> +       GATE_MDP0(CLK_MDP1_IMG_DL_ASYNC0, "mdp1_img_dl_async0", "mdp", 25=
),
> +       GATE_MDP0(CLK_MDP1_MDP_RROT0, "mdp1_mdp_rrot0", "mdp", 26),
> +       GATE_MDP0(CLK_MDP1_MDP_MERGE0, "mdp1_mdp_merge0", "mdp", 27),
> +       GATE_MDP0(CLK_MDP1_MDP_C3D0, "mdp1_mdp_c3d0", "mdp", 28),
> +       GATE_MDP0(CLK_MDP1_MDP_FG0, "mdp1_mdp_fg0", "mdp", 29),
> +       GATE_MDP0(CLK_MDP1_MDP_CLA2, "mdp1_mdp_cla2", "mdp", 30),
> +       GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC4, "mdp1_mdp_dlo_async4", "mdp", =
31),
> +       /* MDP1-1 */
> +       GATE_MDP1(CLK_MDP1_VPP_RSZ0, "mdp1_vpp_rsz0", "mdp", 0),
> +       GATE_MDP1(CLK_MDP1_VPP_RSZ1, "mdp1_vpp_rsz1", "mdp", 1),
> +       GATE_MDP1(CLK_MDP1_MDP_DLO_ASYNC5, "mdp1_mdp_dlo_async5", "mdp", =
2),
> +       GATE_MDP1(CLK_MDP1_IMG0, "mdp1_img0", "mdp", 3),
> +       GATE_MDP1(CLK_MDP1_F26M, "mdp1_f26m", "clk26m", 27),

Assuming CLK_OPS_PARENT_ENABLE is intended, this gate will fail to be
toggled if the "mdp" clock is not already enabled.

> +       /* MDP1-2 */
> +       GATE_MDP2(CLK_MDP1_IMG_DL_RELAY0, "mdp1_img_dl_relay0", "mdp", 0)=
,
> +       GATE_MDP2(CLK_MDP1_IMG_DL_RELAY1, "mdp1_img_dl_relay1", "mdp", 8)=
,
> +};
> +
> +static const struct mtk_clk_desc mdp1_mcd =3D {
> +       .clks =3D mdp1_clks,
> +       .num_clks =3D ARRAY_SIZE(mdp1_clks),
> +       .need_runtime_pm =3D true,
> +};
> +
> +
> +static const struct mtk_gate mdp_clks[] =3D {
> +       /* MDP0 */
> +       GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
> +       GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
> +       GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
> +       GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
> +       GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
> +       GATE_MDP0(CLK_MDP_MDP_RDMA2, "mdp_mdp_rdma2", "mdp", 5),
> +       GATE_MDP0(CLK_MDP_MDP_BIRSZ0, "mdp_mdp_birsz0", "mdp", 6),
> +       GATE_MDP0(CLK_MDP_MDP_HDR0, "mdp_mdp_hdr0", "mdp", 7),
> +       GATE_MDP0(CLK_MDP_MDP_AAL0, "mdp_mdp_aal0", "mdp", 8),
> +       GATE_MDP0(CLK_MDP_MDP_RSZ0, "mdp_mdp_rsz0", "mdp", 9),
> +       GATE_MDP0(CLK_MDP_MDP_RSZ2, "mdp_mdp_rsz2", "mdp", 10),
> +       GATE_MDP0(CLK_MDP_MDP_TDSHP0, "mdp_mdp_tdshp0", "mdp", 11),
> +       GATE_MDP0(CLK_MDP_MDP_COLOR0, "mdp_mdp_color0", "mdp", 12),
> +       GATE_MDP0(CLK_MDP_MDP_WROT0, "mdp_mdp_wrot0", "mdp", 13),
> +       GATE_MDP0(CLK_MDP_MDP_WROT1, "mdp_mdp_wrot1", "mdp", 14),
> +       GATE_MDP0(CLK_MDP_MDP_WROT2, "mdp_mdp_wrot2", "mdp", 15),
> +       GATE_MDP0(CLK_MDP_MDP_FAKE_ENG0, "mdp_mdp_fake_eng0", "mdp", 16),
> +       GATE_MDP0(CLK_MDP_APB_DB, "mdp_apb_db", "mdp", 17),
> +       GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC0, "mdp_mdp_dli_async0", "mdp", 18=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC1, "mdp_mdp_dli_async1", "mdp", 19=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC0, "mdp_mdp_dlo_async0", "mdp", 20=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC1, "mdp_mdp_dlo_async1", "mdp", 21=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC2, "mdp_mdp_dli_async2", "mdp", 22=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC2, "mdp_mdp_dlo_async2", "mdp", 23=
),
> +       GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC3, "mdp_mdp_dlo_async3", "mdp", 24=
),
> +       GATE_MDP0(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "mdp", 25),
> +       GATE_MDP0(CLK_MDP_MDP_RROT0, "mdp_mdp_rrot0", "mdp", 26),
> +       GATE_MDP0(CLK_MDP_MDP_MERGE0, "mdp_mdp_merge0", "mdp", 27),
> +       GATE_MDP0(CLK_MDP_MDP_C3D0, "mdp_mdp_c3d0", "mdp", 28),
> +       GATE_MDP0(CLK_MDP_MDP_FG0, "mdp_mdp_fg0", "mdp", 29),
> +       GATE_MDP0(CLK_MDP_MDP_CLA2, "mdp_mdp_cla2", "mdp", 30),
> +       GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC4, "mdp_mdp_dlo_async4", "mdp", 31=
),
> +       /* MDP1 */
> +       GATE_MDP1(CLK_MDP_VPP_RSZ0, "mdp_vpp_rsz0", "mdp", 0),
> +       GATE_MDP1(CLK_MDP_VPP_RSZ1, "mdp_vpp_rsz1", "mdp", 1),
> +       GATE_MDP1(CLK_MDP_MDP_DLO_ASYNC5, "mdp_mdp_dlo_async5", "mdp", 2)=
,
> +       GATE_MDP1(CLK_MDP_IMG0, "mdp_img0", "mdp", 3),
> +       GATE_MDP1(CLK_MDP_F26M, "mdp_f26m", "clk26m", 27),

Same for this one.

ChenYu

> +       /* MDP2 */
> +       GATE_MDP2(CLK_MDP_IMG_DL_RELAY0, "mdp_img_dl_relay0", "mdp", 0),
> +       GATE_MDP2(CLK_MDP_IMG_DL_RELAY1, "mdp_img_dl_relay1", "mdp", 8),
> +};
> +
> +static const struct mtk_clk_desc mdp_mcd =3D {
> +       .clks =3D mdp_clks,
> +       .num_clks =3D ARRAY_SIZE(mdp_clks),
> +       .need_runtime_pm =3D true,
> +};
> +
> +static const struct of_device_id of_match_clk_mt8196_mdpsys[] =3D {
> +       { .compatible =3D "mediatek,mt8196-mdpsys1", .data =3D &mdp1_mcd =
},
> +       { .compatible =3D "mediatek,mt8196-mdpsys0", .data =3D &mdp_mcd }=
,
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mdpsys);
> +
> +static struct platform_driver clk_mt8196_mdpsys_drv =3D {
> +       .probe =3D mtk_clk_simple_probe,
> +       .remove =3D mtk_clk_simple_remove,
> +       .driver =3D {
> +               .name =3D "clk-mt8196-mdpsys",
> +               .of_match_table =3D of_match_clk_mt8196_mdpsys,
> +       },
> +};
> +module_platform_driver(clk_mt8196_mdpsys_drv);
> +
> +MODULE_DESCRIPTION("MediaTek MT8196 Multimedia Data Path clocks driver")=
;
> +MODULE_LICENSE("GPL");
> --
> 2.39.5
>

