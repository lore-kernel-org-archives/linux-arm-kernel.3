Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B941CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vZ3W53+NBzM1/YoocDMpt9TAql3h7i1DOTAYBcde+k=; b=fFcGNRNVPtBryquI53Z9G2Iupz
	jZmMGH+YKJDCz2hOPVCSplv8TPKsFedV+oJlQVdnBE1kp2UIjRL+QqhnqwFxFSuKidXmvWgXGFFBZ
	GvVgfzZRWIvyTEVRLUM7/yBPWyeDzp8oksUn4FW0ROdEildV9M77ImZFpyf3ioXhbVy771IIIXw8m
	goxySkogzkveg/ZyvjsiiR92YUJ+EAL/jIisDcHMzKP7QB2u4sTRVvKDLyBDCEEheD1jtLL6XXNId
	44j0KRY0HYyrzQo/SqYpyBybO9S1OmsbHzNu8cyTfDAeBkl8mCIrKLRBxymfGGcYIEuLexCILkarh
	YG6nlYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXQp-00000002Hsa-0MtA;
	Fri, 05 Sep 2025 14:28:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSCU-00000000WIS-0SlZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:53:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so2376503e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757062420; x=1757667220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vZ3W53+NBzM1/YoocDMpt9TAql3h7i1DOTAYBcde+k=;
        b=JvlZ6D+oITR5r25FyPbTwECWwMX9YmKPl0wGnu5KzgPuc4amA0CbEqVgD14rmZ5Q7k
         +Vj347rgabODyGOxnYIQGg08kH46n/1sxpvE2y/EH3GvxgvbPTZSu3WG8rNRdB9KEkWR
         KADpLqef2DkWKPF6REu3YJKEzyZ4eY2e/N8sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757062420; x=1757667220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vZ3W53+NBzM1/YoocDMpt9TAql3h7i1DOTAYBcde+k=;
        b=Kbej9orh4i8bxvd9jS/fziZDVQ6KojdKSrpwasLOeqk/Mamq2fZ2upu9I7HQ9ZSq/t
         NddCgMq+dv4C7uryQx47fXpTxoRbUfYdn54/INgYTy74GPCtNwIziDdVhtEyVp1Qo9lg
         mKWDDZ0+bDf73CU/bX4MEG6I8UEsVPJsBke9eIiORxTH4aifCZqV8e/EOyEJCkQ2GC5u
         QeJZoHXlftLvXIWwDzoSkbcMqB8gswq0PZKbaH5MImOGaWLZmdMTiampORYkVf/iNDFx
         WM3L7gPgJjQh+ryhexTAD4H4gViSf/xYGdRtrt+AOyl7QmWQneoAx4XA/PX6kJxxa/91
         V7UA==
X-Forwarded-Encrypted: i=1; AJvYcCUtZrRmDIyRYJ41mDt9hSy5kuIguG57bGXA09S4hdVej3tWUpa/rmQMx+fftWot+B6is9X8TnDd4oQJxww1R8w/@lists.infradead.org
X-Gm-Message-State: AOJu0YxueWBMargKdMPq7V6pP0/eNrd9grObatBE9FXEMVlPtBgZYEX0
	6Yy9v1pG5f0QcZdOnEZV05NqiDiKLMDIcGN+R930yqXvH6dy3bCYm83pFYKIvRK+WUgg3IYfSII
	WvGBvDxHpBs8Vh4KwlQvQ2zcjsJfqR7+fVf9cSLhvIJyVvCCws266eA==
X-Gm-Gg: ASbGnctladHHhdKrHOFTzBq+aFlCbIhHBDNPRmJY5aSrorq5yEuVIgIQt4IPsPblx46
	eaW+ihpkncBO8CFOsZNPyu7PLy9/eH+bXdCEbJ2XqOA9R8hWypWwSDC08mFM1Pn+cEUad14wMZc
	MQUIeHWXUJxha+g/JvT7AO2M1w30vlPOEIqMVeCepdcVigt5zi7t4GRG5OP4yCtKQz4vq1kNrEH
	5xWNif1SbuseyEGLgnr9Se3L3Wf2oQIwSmWfw==
X-Google-Smtp-Source: AGHT+IEjHV/T1RYYsuzHLdjnxHEKIYfNZ8/LU3RE2sLPGxb+l+/MTplgH0fgFpzDm7aF6IX2eRbQMv8bMFW6xshxSss=
X-Received: by 2002:a05:6512:3b10:b0:561:70f1:e3ec with SMTP id
 2adb3069b0e04-56170f1e54amr557993e87.30.1757062420258; Fri, 05 Sep 2025
 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-20-laura.nao@collabora.com> <0e6592b7-6f6d-4291-992c-ff321c920381@collabora.com>
In-Reply-To: <0e6592b7-6f6d-4291-992c-ff321c920381@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:53:29 +0800
X-Gm-Features: Ac12FXznPHud9uxEoezJCyg2AXmAKQakPZkEkl_DvIt-_2nZkd2YLz6bIWoFjWA
Message-ID: <CAGXv+5GFaudGqm4C9CY-_spiXcyWk7OvWHTdkehsyrV4sO1Ndw@mail.gmail.com>
Subject: Re: [PATCH v5 19/27] clk: mediatek: Add MT8196 mdpsys clock support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com, 
	guangjie.song@mediatek.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_015342_150784_2D14A6A5 
X-CRM114-Status: GOOD (  31.94  )
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

On Fri, Sep 5, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/08/25 11:19, Laura Nao ha scritto:
> > Add support for the MT8196 mdpsys clock controller, which provides cloc=
k
> > gate control for MDP.
> >
> > Signed-off-by: Laura Nao <laura.nao@collabora.com>
> > ---
> >   drivers/clk/mediatek/Kconfig             |   7 +
> >   drivers/clk/mediatek/Makefile            |   1 +
> >   drivers/clk/mediatek/clk-mt8196-mdpsys.c | 186 ++++++++++++++++++++++=
+
> >   3 files changed, 194 insertions(+)
> >   create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfi=
g
> > index 8e5cdae80748..68ac08cf8e82 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -1024,6 +1024,13 @@ config COMMON_CLK_MT8196_MCUSYS
> >       help
> >         This driver supports MediaTek MT8196 mcusys clocks.
> >
> > +config COMMON_CLK_MT8196_MDPSYS
> > +     tristate "Clock driver for MediaTek MT8196 mdpsys"
> > +     depends on COMMON_CLK_MT8196
> > +     default COMMON_CLK_MT8196
> > +     help
> > +       This driver supports MediaTek MT8196 mdpsys clocks.
> > +
> >   config COMMON_CLK_MT8196_PEXTPSYS
> >       tristate "Clock driver for MediaTek MT8196 pextpsys"
> >       depends on COMMON_CLK_MT8196
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makef=
ile
> > index 46358623c3e5..d2d8bc43e45b 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -155,6 +155,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apm=
ixedsys.o clk-mt8196-topckgen.o
> >                                  clk-mt8196-peri_ao.o
> >   obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) +=3D clk-mt8196-imp_iic_=
wrap.o
> >   obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) +=3D clk-mt8196-mcu.o
> > +obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) +=3D clk-mt8196-mdpsys.o
> >   obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) +=3D clk-mt8196-pextp.o
> >   obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) +=3D clk-mt8196-ufs_ao.o
> >   obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt83=
65.o
> > diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/med=
iatek/clk-mt8196-mdpsys.c
> > new file mode 100644
> > index 000000000000..a46b1627f1f3
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025 MediaTek Inc.
> > + *                    Guangjie Song <guangjie.song@mediatek.com>
> > + * Copyright (c) 2025 Collabora Ltd.
> > + *                    Laura Nao <laura.nao@collabora.com>
> > + */
> > +#include <dt-bindings/clock/mediatek,mt8196-clock.h>
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-gate.h"
> > +#include "clk-mtk.h"
> > +
> > +static const struct mtk_gate_regs mdp0_cg_regs =3D {
> > +     .set_ofs =3D 0x104,
> > +     .clr_ofs =3D 0x108,
> > +     .sta_ofs =3D 0x100,
> > +};
> > +
> > +static const struct mtk_gate_regs mdp1_cg_regs =3D {
> > +     .set_ofs =3D 0x114,
> > +     .clr_ofs =3D 0x118,
> > +     .sta_ofs =3D 0x110,
> > +};
> > +
> > +static const struct mtk_gate_regs mdp2_cg_regs =3D {
> > +     .set_ofs =3D 0x124,
> > +     .clr_ofs =3D 0x128,
> > +     .sta_ofs =3D 0x120,
> > +};
> > +
> > +#define GATE_MDP0(_id, _name, _parent, _shift) {     \
> > +             .id =3D _id,                              \
> > +             .name =3D _name,                          \
> > +             .parent_name =3D _parent,                 \
> > +             .regs =3D &mdp0_cg_regs,                  \
> > +             .shift =3D _shift,                        \
> > +             .flags =3D CLK_OPS_PARENT_ENABLE,         \
>
> Why would MDP0 and MDP2 be different, as in why would MDP1 be so special =
to not
> need CLK_OPS_PARENT_ENABLE while the others do?
>
> Either they all do, or they all don't.
>
> I guess they all don't, but I'm not sure how you tested that at all, sinc=
e the
> only way to test this is downstream (and upstream will very likely be dif=
ferent
> from that).
>
> Even though I think they don't need that - please add back CLK_OPS_PARENT=
_ENABLE
> to GATE_MDP1 to be safe, as in (all) MediaTek SoCs the multimedia subsyst=
em is
> kinda separate from the rest.

That kind of doesn't fly since the parent of mdp_f26m is clk26m, not the
mdp clock. So either this block doesn't need a clock for register access
or this clock is going to be broken.

This is why I raised the question about the validity of the flag in the
first place.

> +       GATE_MDP1(CLK_MDP_F26M, "mdp_f26m", "clk26m", 27),

> Once MT8196 MDP support is upstreamed, we will be able to run a number of=
 tests
> to evaluate whether this flag is really needed or not.
>
> After all, if it turns out we can remove it, it's going to be a 3 lines p=
atch,
> not a big deal.

That also works. Though IMO it makes the error harder to notice.

ChenYu

> > +             .ops =3D &mtk_clk_gate_ops_setclr,        \
> > +     }
> > +
> > +#define GATE_MDP1(_id, _name, _parent, _shift) {     \
> > +             .id =3D _id,                              \
> > +             .name =3D _name,                          \
> > +             .parent_name =3D _parent,                 \
> > +             .regs =3D &mdp1_cg_regs,                  \
> > +             .shift =3D _shift,                        \
> > +             .ops =3D &mtk_clk_gate_ops_setclr,        \
> > +     }
> > +
> > +#define GATE_MDP2(_id, _name, _parent, _shift) {     \
> > +             .id =3D _id,                              \
> > +             .name =3D _name,                          \
> > +             .parent_name =3D _parent,                 \
> > +             .regs =3D &mdp2_cg_regs,                  \
> > +             .shift =3D _shift,                        \
> > +             .flags =3D CLK_OPS_PARENT_ENABLE,         \
> > +             .ops =3D &mtk_clk_gate_ops_setclr,        \
> > +     }
> > +
>
> ..snip..
>
> > +
> > +static const struct mtk_clk_desc mdp_mcd =3D {
> > +     .clks =3D mdp_clks,
> > +     .num_clks =3D ARRAY_SIZE(mdp_clks),
> > +     .need_runtime_pm =3D true,
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8196_mdpsys[] =3D {
> > +     { .compatible =3D "mediatek,mt8196-mdpsys1", .data =3D &mdp1_mcd =
},
> > +     { .compatible =3D "mediatek,mt8196-mdpsys0", .data =3D &mdp_mcd }=
,
>
> 0 comes before 1, swap those entries please.
>
> After applying the proposed fixes
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mdpsys);
> > +
> > +static struct platform_driver clk_mt8196_mdpsys_drv =3D {
> > +     .probe =3D mtk_clk_simple_probe,
> > +     .remove =3D mtk_clk_simple_remove,
> > +     .driver =3D {
> > +             .name =3D "clk-mt8196-mdpsys",
> > +             .of_match_table =3D of_match_clk_mt8196_mdpsys,
> > +     },
> > +};
> > +module_platform_driver(clk_mt8196_mdpsys_drv);
> > +
> > +MODULE_DESCRIPTION("MediaTek MT8196 Multimedia Data Path clocks driver=
");
> > +MODULE_LICENSE("GPL");
>

