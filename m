Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 06:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXrqAOGSKlkHkTRQ7lUZKBYVIpeSl7z2gePyrfHvoQU=; b=ihOeRWOvEHcBUX7wQokpMnTwTy
	x3JIYBqk/I0+nHY3O3GcSpbv1dItTd9gQ+oC/fAByLax9Oy552GnWRaU1aXhKJyv6VmCz96hutPn/
	r01jKDZ5GzU+H7CV3RKCPGG3awghxCOaC0BZ7vBMwnYawwE5/GVf7dJSs+hEcTgycG1NZblwr/g6d
	Whny7xkiZft7w3aeLWd1txegekiLPXDIVcIw6o0EJeu+cpimF9ykj/IsCbnCXiI8vX13hkD+Qei7O
	BHEBygZYae3xwst68Ebg2Kx/8PBvL+eR96GlY0f11hbbFA2dkRpmsAigWEubiH1/DlDznNDlczQQu
	IOxWLvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnjJ-00000001aw2-490l;
	Fri, 15 Aug 2025 06:15:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umngl-00000001acj-2DxV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 06:13:20 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55ce50946e2so1774887e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755238398; x=1755843198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXrqAOGSKlkHkTRQ7lUZKBYVIpeSl7z2gePyrfHvoQU=;
        b=SZ5xldG8vJUfVjmC9+hpPUq7sVMpbgAcN5bW+q3Qkk20yVi72RpIdBJLL4sPhhj2bU
         /ilkbh39Ld2Ru1+WPHcLexo9ru+WeTmzn5y3bRknIfEAHtx9onyguho8JQl6VMMRXM9d
         yNh9nPfjlTHSw6iYWlsGrbsvja2lPqjJ5hMGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755238398; x=1755843198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXrqAOGSKlkHkTRQ7lUZKBYVIpeSl7z2gePyrfHvoQU=;
        b=eQqm6ZU4GiRTaRL7ZBkDLFnxSdgrg76HXvvnW3kj/SZSlm03JqjnV2VnbP+uwrx7MZ
         hHONDwwQn+Q+KPfaiQ/5Elh+5ytmbKy6QrlNcJsW825KSaGftxDedof/afXKjhyp0jEw
         L4ZRysSpNEIVR5++BsOVgwQKHggzd/GH5UPtMQzg3lD9ahYMVJi9y8Wi4f+FLqXY9loY
         uOU5nfxcapqhk3MeBXJvJibLtbYoahoaqkmSPWW6HoQY/0uW+Nkv13Nj54PBgFSsHbuu
         101SPaEuOWBi4lk3mvOnYniF1+PZdkTfpshulI7oA5MJffAVYMVXlquqk6qOxYM8iHj9
         Ci4A==
X-Forwarded-Encrypted: i=1; AJvYcCWxTgyNeQ6CysXVrCA88xo9rmTmt4u+5HUlK1hinNk7QP8U3RjJNXg+rFbjUzk58Seulc5gFVmKXlJTWZoMietM@lists.infradead.org
X-Gm-Message-State: AOJu0YwL/siu/WyjNHMXwal02/NFLPDW13XPgRU3BSu7M4pZWt5hw7CC
	GMD+lzqYEHtTTGfJhJownFViZt0VXknQgwiUxsxKAbEHHC0GGPdXkEBkarCwM72rngr0bLv3Bbb
	LrUh21dTgf0KFfvFZlhwdiKkhnAR3OBklGPyfCKL+
X-Gm-Gg: ASbGncsMm61kvAtcjjS4gbd47yZQ7fM/rC6t9jIac7l8LU64UMt7Jujwdfu/OO8y2pr
	EFyRz3nfhi0NR9pcp6tAE04n+qtUTycb2q7xpJtshJikjugCQL406KGSlVfvA0Y6WSPnoKkbJwZ
	TR6kRtC8St+WSo66jvimoxTXgpHiiSPgXf/V3JCh/FI7ARgvGoA9Dqw+PcghSdP/OAl+OAILXEF
	KZmk42HQ7lDwJcQoLI6Hu2kJYVUdjEj9IiG1w==
X-Google-Smtp-Source: AGHT+IHgien6Ta30w9thH606OXZ37uev4E3SyZFiYtbUjF+ewjbtl9wYml18XdGcJArNMrSrqAKCEoyzfxTTcxLF8kw=
X-Received: by 2002:a05:6512:401a:b0:55c:e61c:6969 with SMTP id
 2adb3069b0e04-55ceeb8e474mr204360e87.45.1755238397730; Thu, 14 Aug 2025
 23:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-18-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-18-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 15:13:06 +0900
X-Gm-Features: Ac12FXzr5keexSM3h938Aqs72YKWpIyCvPBM6Nr2RSvEz3GKsQxqYO4KthSuqtA
Message-ID: <CAGXv+5EDxVe6k7FQM2HenDaHM1Rz7eEcQhVL1q1AqUFfr9apnA@mail.gmail.com>
Subject: Re: [PATCH v4 17/27] clk: mediatek: Add MT8196 I2C clock support
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
X-CRM114-CacheID: sfid-20250814_231319_586313_9B22BA49 
X-CRM114-Status: GOOD (  20.79  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 I2C clock controller, which provides clock
> gate control for I2C.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig                  |   7 ++
>  drivers/clk/mediatek/Makefile                 |   1 +
>  .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    | 117 ++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index c977719046a4..fe2697b64ef0 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1010,6 +1010,13 @@ config COMMON_CLK_MT8196
>         help
>           This driver supports MediaTek MT8196 basic clocks.
>
> +config COMMON_CLK_MT8196_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8196 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8196
> +       default COMMON_CLK_MT8196
> +       help
> +         This driver supports MediaTek MT8196 i2c clocks.
> +
>  config COMMON_CLK_MT8196_PEXTPSYS
>         tristate "Clock driver for MediaTek MT8196 pextpsys"
>         depends on COMMON_CLK_MT8196
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index 88f7d8a229c2..241e7f5e7316 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt819=
5-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o \
>                                    clk-mt8196-topckgen2.o clk-mt8196-vlpc=
kgen.o \
>                                    clk-mt8196-peri_ao.o
> +obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) +=3D clk-mt8196-imp_iic_wra=
p.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) +=3D clk-mt8196-pextp.o
>  obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) +=3D clk-mt8196-ufs_ao.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
> diff --git a/drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c b/drivers/clk=
/mediatek/clk-mt8196-imp_iic_wrap.c
> new file mode 100644
> index 000000000000..98db1476e72c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *                    Guangjie Song <guangjie.song@mediatek.com>
> + * Copyright (c) 2025 Collabora Ltd.
> + *                    Laura Nao <laura.nao@collabora.com>
> + */
> +#include <dt-bindings/clock/mediatek,mt8196-clock.h>

Nit: add line for separation.

> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs imp_cg_regs =3D {
> +       .set_ofs =3D 0xe08,
> +       .clr_ofs =3D 0xe04,
> +       .sta_ofs =3D 0xe00,
> +};
> +
> +#define GATE_IMP(_id, _name, _parent, _shift) {        \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &imp_cg_regs,                   \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \

So here it likely works because the parent for all the gates are the same,
which is the clock feeding this block.


Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

