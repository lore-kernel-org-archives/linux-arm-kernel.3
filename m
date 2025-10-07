Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0433CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AtSgdu/zhEIwEp8jrIIUZRzuV/9W+89fOYn2ZCku1g=; b=BpOmsmzzfGVy0kOXlWfQFHf6lq
	C3ko6RbK6lyohMpBAJTrCem1xL/oZ+i6w2urLjHZVeJcwiuXHDIPXQNVmjMxE3imNhW/3qkFJQ34D
	ogogmdyrI8Ikl6fnMgrDx1v4CWeGj6YTmRvFq4GZX4Vut4Wvm6qyewi4sjBsH8GI8SKAmwWKUkxCc
	EKifLfNT8ufK9dEEut7bOeYQm/7fjqqFyQ1AzEsQIyT3bn2lbxe1Og3GDTSgmxSNMOJ/C4PLoRvGU
	tOhmkeRMNBduaq7q5s8+PoTxw4RWfOHCPBUYGRhv5nQIvO4f3T+0IAIK24xFkoZ8S1EMVFOxEWWsu
	YLDha/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69bv-00000002IHW-0LGx;
	Tue, 07 Oct 2025 15:28:19 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v69br-00000002IGV-1a5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 15:28:17 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-646670c29dfso3309526eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759850894; x=1760455694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AtSgdu/zhEIwEp8jrIIUZRzuV/9W+89fOYn2ZCku1g=;
        b=G/+OIytLFeVrc5YIs2GesjEyPx/wvFUdlN34u1Xbwyg4zaDa7ZaYydD2cgXB2uGgJo
         L6641VunR9EV/HnnvueOGK3zYYkh0YuV7fEi38N7BwSQ2kzX8tGV8H8zxTsM8DZQXv0f
         6klx1L6PY6S0/ILkthKJ1tklxWFiS2xLVlzYVC981wqJD29FDu0rwtQ5SJtVuRGs4IwP
         QQmPwlZV4uT09nHvunZwC+LAUbnqSS62xzIze7JD2Dct+Jr2xF1yzGnlLtjQ5Cbgp1Kg
         KaMzCJfn0pjde9XN4T0cyy7yo04ToFEhQoCD6cDPvcnU81e2x1jYAQW0HmcI/etVp4EB
         lwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850894; x=1760455694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AtSgdu/zhEIwEp8jrIIUZRzuV/9W+89fOYn2ZCku1g=;
        b=o5ZNOpduZ3WuuAxmgLwAFWP2CHs6uEVZu+hhmeaF15I7eGDposGBF0CvaJe4GbSRNl
         4tcxKtQMe9wzMhtVONJci/d/uCDY/Za1iLKEzGE5Bt/zDeI76PAXYyVekYv0uPw5B10d
         5UXIRRrPHCagFno5olG57q724SI6ysDA8p3DaJ31bgaO7wqe8phEn2st8/lT4zNgDs0k
         200eemLzEbqU/buwa3BFGQuklAcbEOrq1+/gqfMOAoc/LtBfaUadJmIUZo1qVqnzJbWX
         nuuE96aptr6R/VhR4TtaeEywFkLMe4O355VYW1K8Mc4aMaklyNYt4oIR6z6goqIyU+0E
         KPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU5Kq0XM/MD9nmRrbrzpMG0YuEBegu9Wgxj5i5ZZ2muPsY5HoyMYZ6b7ACpsQBkPooD9xynitRKCD4PW4DA81b@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVymdhqB+wI5Q3hSlZBV/waveqHyx4qKFcqVVqv3tbF/fnCwQ
	O0VX7xadmqs1srMeYVzfE2ee8jcnnIJ9bjJjGI2HSTWFyUzPD0fC5XYYCY55WgsJfUDaqcq2s0d
	IDZLihZE+F2KsDqFfx/3cfOyTF/nrG/o=
X-Gm-Gg: ASbGncsPjLcj/tYHWQNW7ta40HvaM2CLzYjBYFgRCK5lZ/nFarZnDB0cysW4Wz44jnW
	YP1RB5rwJhpeeL+/KWpHSgHsnmAS8Rs/28RKFXlDLrcBPFilFxYUKY1UL6h+AgONfAr0w0cPN/C
	y+FeSrE8Kq2nEdq1CaPVaEMgO7LMd+Kk5HihgFprpJS1NAn0JKqwKmF7a8H9+2lAFcJC1pn1aWS
	2DTKT32oqVFR+nbK3KbFt0oO9BIgkCZdepOrGSDLv4=
X-Google-Smtp-Source: AGHT+IFFCD+05k/f2pnhMy8ZzAH383HR9gPRjWkOyfaj0oG6GpKVsVXnHQIOkpY8Be0wAaj5uUymmdOl4EjjYOj/MsA=
X-Received: by 2002:a05:6870:c1c6:b0:377:bbde:5278 with SMTP id
 586e51a60fabf-3b0fa24fd92mr9347675fac.37.1759850893884; Tue, 07 Oct 2025
 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251002084204.15898-1-jjian.zhou@mediatek.com> <20251002084204.15898-3-jjian.zhou@mediatek.com>
In-Reply-To: <20251002084204.15898-3-jjian.zhou@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 7 Oct 2025 10:28:00 -0500
X-Gm-Features: AS18NWA1zX6Oa-17YwjJlyhdpYlXfh240reFbRpuwEmWd3JTrDtYGE7kwX4p96A
Message-ID: <CABb+yY1Z+F=emOi2Q58bGv6AtKOMjY3qsNgRYqheNni+yN4_yQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_082815_447202_AC03A105 
X-CRM114-Status: GOOD (  27.14  )
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

On Thu, Oct 2, 2025 at 3:42=E2=80=AFAM Jjian Zhou <jjian.zhou@mediatek.com>=
 wrote:
>
> Add mtk-vcp-mailbox driver to support the communication with
> VCP remote microprocessor.
>
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  drivers/mailbox/Kconfig                 |   9 ++
>  drivers/mailbox/Makefile                |   2 +
>  drivers/mailbox/mtk-vcp-mailbox.c       | 170 ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-vcp-mailbox.h |  32 +++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>  create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 02432d4a5ccd..c28bdb855663 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -294,6 +294,15 @@ config MTK_CMDQ_MBOX
>           critical time limitation, such as updating display configuratio=
n
>           during the vblank.
>
> +config MTK_VCP_MBOX
> +       tristate "MediaTek VCP Mailbox Support"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       help
> +         Say yes here to add support for the MediaTek VCP mailbox driver=
.
> +         The mailbox implementation provides access from the application
> +         processor to Video Companion Processor Unit.
> +         If unsure say N.
> +
>  config ZYNQMP_IPI_MBOX
>         tristate "Xilinx ZynqMP IPI Mailbox"
>         depends on ARCH_ZYNQMP && OF
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 98a68f838486..07278871d254 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)   +=3D mtk-adsp-mailbox.o
>
>  obj-$(CONFIG_MTK_CMDQ_MBOX)    +=3D mtk-cmdq-mailbox.o
>
> +obj-$(CONFIG_MTK_VCP_MBOX)     +=3D mtk-vcp-mailbox.o
> +
>  obj-$(CONFIG_ZYNQMP_IPI_MBOX)  +=3D zynqmp-ipi-mailbox.o
>
>  obj-$(CONFIG_SUN6I_MSGBOX)     +=3D sun6i-msgbox.o
> diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-=
mailbox.c
> new file mode 100644
> index 000000000000..94dac59ca32b
> --- /dev/null
> +++ b/drivers/mailbox/mtk-vcp-mailbox.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
> + * Author: Jjian Zhou <jjian.zhou.@mediatek.com>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-vcp-mailbox.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct mtk_vcp_mbox {
> +       struct mbox_controller mbox;
> +       void __iomem *base;
> +       struct device *dev;
> +       const struct mtk_vcp_mbox_cfg *cfg;
> +       struct mtk_ipi_info ipi_recv;
> +       struct mbox_chan chans;
> +};
> +
> +struct mtk_vcp_mbox_cfg {
> +       u16 set_in;
> +       u16 clr_out;
> +};
> +
> +static irqreturn_t mtk_vcp_mbox_irq_thread(int irq, void *data)
> +{
> +       struct mtk_vcp_mbox *priv =3D data;
> +
> +       /* get irq status */
> +       priv->ipi_recv.irq_status =3D readl(priv->base + priv->cfg->clr_o=
ut);
> +
> +       __ioread32_copy(priv->ipi_recv.msg, priv->base,
> +                       MTK_VCP_MBOX_SLOT_MAX_SIZE / 4);
> +
> +       mbox_chan_received_data(&priv->chans, &priv->ipi_recv);
> +
> +       /* clear irq status */
> +       writel(priv->ipi_recv.irq_status, priv->base + priv->cfg->clr_out=
);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox=
,
> +                                           const struct of_phandle_args =
*sp)
> +{
> +       if (sp->args_count)
> +               return NULL;
> +
> +       return &mbox->chans[0];
> +}
> +
> +static int mtk_vcp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_vcp_mbox *priv =3D chan->con_priv;
> +       struct mtk_ipi_info *ipi_info =3D data;
> +       u32 status;
> +
> +       if (!ipi_info->msg) {
> +               dev_err(priv->dev, "msg buffer is NULL.\n");
> +               return -EINVAL;
> +       }
> +
> +       status =3D readl(priv->base + priv->cfg->set_in);
> +       if (status & BIT(ipi_info->index)) {
> +               dev_warn(priv->dev, "mailbox IPI %d is busy.\n", ipi_info=
->id);
> +               return -EBUSY;
> +       }
> +
> +       if (ipi_info->slot_ofs + ipi_info->len > MTK_VCP_MBOX_SLOT_MAX_SI=
ZE)
> +               return -EINVAL;
> +       __iowrite32_copy(priv->base + ipi_info->slot_ofs, ipi_info->msg,
> +                        ipi_info->len);
> +
> +       writel(BIT(ipi_info->index), priv->base + priv->cfg->set_in);
> +
> +       return 0;
> +}
> +
> +static bool mtk_vcp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct mtk_ipi_info *ipi_info =3D chan->active_req;
> +       struct mtk_vcp_mbox *priv =3D chan->con_priv;
> +
> +       return !(readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->in=
dex));
> +}
> +
> +static const struct mbox_chan_ops mtk_vcp_mbox_chan_ops =3D {
> +       .send_data      =3D mtk_vcp_mbox_send_data,
> +       .last_tx_done   =3D mtk_vcp_mbox_last_tx_done,
> +};
> +
> +static int mtk_vcp_mbox_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mtk_vcp_mbox *priv;
> +       struct mbox_controller *mbox;
> +       int ret, irq;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->chans.con_priv =3D priv;
> +       mbox =3D &priv->mbox;
> +       mbox->dev =3D dev;
> +       mbox->ops =3D &mtk_vcp_mbox_chan_ops;
> +       mbox->txdone_irq =3D false;
> +       mbox->txdone_poll =3D true;
> +       mbox->of_xlate =3D mtk_vcp_mbox_xlate;
> +       mbox->num_chans =3D 1;
> +       mbox->chans =3D &priv->chans;
> +
> +       priv->ipi_recv.msg =3D devm_kzalloc(dev, MTK_VCP_MBOX_SLOT_MAX_SI=
ZE
> +                                         GFP_KERNEL);
>
Please compile-test at least before submitting. Dropping it, sorry.

-jassi

