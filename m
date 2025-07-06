Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A40DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwKP6G3mr7e283MHaXYrGJd3BjhcgAOXuDqxk4dK7CQ=; b=fB0iq3fnEFTCOAMexMz1D69REy
	AsFYDh3GiZI1Ba82vfWP+2Hp3Gj9MI/5O8mtQZYbYLwXw/i0SZomLrImipYRc7L28v07ZgQbgkDrg
	EAbc7MOsSHRAG6cUH5eLYrOFRO3rhMpTIkKFe3ulWjqqZD6fnTAONn+xXQPuNxNCpC8xcoWjd8bgl
	pRhO6Yl4oB3KKC16eejGUsMsq14Sl7M8q+Ot4vbLX7jEXWkrrlmeNuCWz94Oin///EmxknOnB/31i
	r6kCDgj+QQYkVQOWNTh3CeM4eDLSlUX7X6lAKHFk2B4MDpyFcj/4gSO4icAGVqXbbivx3X9JtIgdc
	nLo9hR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVIC-00000000kJR-0WXu;
	Sun, 06 Jul 2025 19:44:52 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV42-00000000j73-1Bby
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 19:30:17 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-40669fd81b5so1606227b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751830213; x=1752435013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwKP6G3mr7e283MHaXYrGJd3BjhcgAOXuDqxk4dK7CQ=;
        b=T19B8eRp7/wmXOT90BM21eCtZkliz3zTTcErSTGExsXCUeSyHg7rjlYrFhpgv7lo1V
         zb3sQDoa86o8PwuFeFVusLOUjK1D7lRETKbNpOrPewjp3VlUKxSdMhKjYtzaiJd+mazk
         sAsY6qBxxiHuzmMzhsnDecekWxpoYdDmRzmJvpeVQosrxKrTfcWDu9XfwIKzlVm/q1Wo
         SmbgYIgimlDF8zS8gz58zJhCq9tSZT5zI7F0JVqC9QTehuLNL72S19qEmdfhCI2Nvtba
         8xqi7AE4UY1Tdcz6A3xdXRapo60/OL76UpUbLsP/yJAbVuy13PCIvXuH9eG8TlDTVl5e
         Z1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751830213; x=1752435013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwKP6G3mr7e283MHaXYrGJd3BjhcgAOXuDqxk4dK7CQ=;
        b=O1yLAuMAMwhAsoVnnkQjgo1TSd0lGBnjnsynNioTlpE2YxFa148u0ie0EOwhAVNobH
         XlE6c7eKY1sw1E0H12eLtCZBdMyRDyKZu1pPZTT+TkNaZ2h0onZT6BiQJgLFlg0YYNz6
         0vfUawHX57i+H4S0/gQd9L9UnDBggfEjj2DDBCBKlg7S7FxRYXUcMVszZsVOpxdb1uyD
         IRQLMzrXQtSF/NLmzuJAwa+diiGDKvGm3pbbNJBmcxgy8aEmxCFtJ74lJzbL5KwjHNCc
         qy0GzyODc6Ao8g49ClJTNNuUKgiVCSJI79zzb/xR2Qa3qiavw6G+DRl/x9R/0ZPSZthH
         FygA==
X-Forwarded-Encrypted: i=1; AJvYcCWS+YsWPyFmh+v1am+BQAGjJCgf2UMFtDsgJsgW3zNRhfOlQRRYTYylmO11coOnnI0K8+40F6H8FKIwxKpj044t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+x3XEEjkO2/Vm+F37LCY/Yy8uiWYyVEX+8ULMsdAynTvjkfGm
	BTQR7dwDmOipUg54JwTI3aSFkxngOPU1FGbi8wm3RDkysET7NM1AWbg3BsS2/24UX8ol1t9KJTy
	2VCB5bsJ7s1KOz2lTobMhgeyHypWkm90=
X-Gm-Gg: ASbGncuZSC/3nqfyJEZuh1XIL+aa2Dj+wJ0otCfw8tgvYv2RcYHqfQq4SgPjZLd3XL8
	yeO6vjG1WDEkq13dQVEROraGYVftsmpbq4AjElSnzFiFg1irDqOBIHvmoyt6Px3KgtFxth0R7V+
	74lovYPDJHFJOiPelU0PnF3Fr9S7+xWK+rzxgiAycdFdN5
X-Google-Smtp-Source: AGHT+IGswMQKFIHWCdUWc7U1iaLyRGmXzS1p7Be/8giiy8S6nvzNR+yD37G2iTdLFDhrSkRuZ1Zi48SrHqS5uaR6W8I=
X-Received: by 2002:a05:6808:1898:b0:3fa:3a0:137b with SMTP id
 5614622812f47-40d073dd732mr6251534b6e.29.1751830212840; Sun, 06 Jul 2025
 12:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com> <20250609031627.1605851-6-peter.chen@cixtech.com>
In-Reply-To: <20250609031627.1605851-6-peter.chen@cixtech.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 6 Jul 2025 14:30:01 -0500
X-Gm-Features: Ac12FXxKMp5I47A30_JrDffzqkmGaLva-S5f0RsvuBH8ACww2CYRPOBLwUB5q7g
Message-ID: <CABb+yY17OOBx73655OhBp8At1b81w9M61zzGu4uhXcMTw4Q=Dw@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	sudeep.holla@arm.com, kajetan.puchalski@arm.com, eballetb@redhat.com, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>, 
	Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_123014_354816_0D95EB41 
X-CRM114-Status: GOOD (  35.32  )
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

On Sun, Jun 8, 2025 at 10:16=E2=80=AFPM Peter Chen <peter.chen@cixtech.com>=
 wrote:
>
> From: Guomin Chen <Guomin.Chen@cixtech.com>
>
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
>
> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
> Changes for v9:
> - Move macro definitions above where they are used
> - Remove the brackets around the number
> - Merging and sorting local variable definitions
> - free the irq in the error path
>
> Changes for v3 (As mailbox patch set):
> - Update MODULE_AUTHOR.
> - Remove the extra blank lines.
>
> Changes for v2 (As mailbox patch set):
> - Update the real name and email address.
> - Remove the ACPI header files.
> - Update the Copyright from 2024 to 2025.
> - Update the Module License from "GPL" to "GPL v2"
> - Add an interface for message length to limit potential out-of-bound acc=
ess
>
>  drivers/mailbox/Kconfig       |  10 +
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/cix-mailbox.c | 635 ++++++++++++++++++++++++++++++++++
>  3 files changed, 647 insertions(+)
>  create mode 100644 drivers/mailbox/cix-mailbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 68eeed660a4a..4fef4797b110 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -340,4 +340,14 @@ config THEAD_TH1520_MBOX
>           kernel is running, and E902 core used for power management amon=
g other
>           things.
>
> +config CIX_MBOX
> +        tristate "CIX Mailbox"
> +        depends on ARCH_CIX || COMPILE_TEST
> +        depends on OF
> +        help
> +          Mailbox implementation for CIX IPC system. The controller supp=
orts
> +          11 mailbox channels with different operating mode and every ch=
annel
> +          is unidirectional. Say Y here if you want to use the CIX Mailb=
ox
> +          support.
> +
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 13a3448b3271..786a46587ba1 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -72,3 +72,5 @@ obj-$(CONFIG_QCOM_CPUCP_MBOX) +=3D qcom-cpucp-mbox.o
>  obj-$(CONFIG_QCOM_IPCC)                +=3D qcom-ipcc.o
>
>  obj-$(CONFIG_THEAD_TH1520_MBOX)        +=3D mailbox-th1520.o
> +
> +obj-$(CONFIG_CIX_MBOX) +=3D cix-mailbox.o
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> new file mode 100644
> index 000000000000..eecb53d59dfe
> --- /dev/null
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -0,0 +1,635 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "mailbox.h"
> +
> +/*
> + * The maximum transmission size is 32 words or 128 bytes.
> + */
> +#define CIX_MBOX_MSG_LEN       32      /* Max length =3D 32 words */
maybe call it CIX_MBOX_MAX_MSG_WORDS

> +#define MBOX_MSG_LEN_MASK      0x7fL   /* Max length =3D 128 bytes */
> +
> +/* Register define */
> +#define REG_MSG(n)     (0x0 + 0x4*(n))                 /* 0x0~0x7c */
> +#define REG_DB_ACK     REG_MSG(CIX_MBOX_MSG_LEN)       /* 0x80 */
> +#define ERR_COMP       (REG_DB_ACK + 0x4)              /* 0x84 */
> +#define ERR_COMP_CLR   (REG_DB_ACK + 0x8)              /* 0x88 */
> +#define REG_F_INT(IDX) (ERR_COMP_CLR + 0x4*(IDX+1))    /* 0x8c~0xa8 */
> +#define FIFO_WR                (REG_F_INT(MBOX_FAST_IDX+1))    /* 0xac *=
/
> +#define FIFO_RD                (FIFO_WR + 0x4)                 /* 0xb0 *=
/
> +#define FIFO_STAS      (FIFO_WR + 0x8)                 /* 0xb4 */
> +#define FIFO_WM                (FIFO_WR + 0xc)                 /* 0xb8 *=
/
> +#define INT_ENABLE     (FIFO_WR + 0x10)                /* 0xbc */
> +#define INT_ENABLE_SIDE_B      (FIFO_WR + 0x14)        /* 0xc0 */
> +#define INT_CLEAR      (FIFO_WR + 0x18)                /* 0xc4 */
> +#define INT_STATUS     (FIFO_WR + 0x1c)                /* 0xc8 */
> +#define FIFO_RST       (FIFO_WR + 0x20)                /* 0xcc */
> +
> +/* [0~7] Fast channel
> + * [8] doorbell base channel
> + * [9]fifo base channel
> + * [10] register base channel
> + */
> +#define MBOX_FAST_IDX          7
> +#define MBOX_DB_IDX            8
> +#define MBOX_FIFO_IDX          9
> +#define MBOX_REG_IDX           10
> +#define CIX_MBOX_CHANS         11
> +
if it is not really a single controller owning different channels,
maybe implement only what you currently use.

And s/MBOX/CIX/ to keep everything CIX specific. Here and elsewhere.

> +#define MBOX_TX                0
> +#define MBOX_RX                1
> +
> +#define DB_INT_BIT     BIT(0)
> +#define DB_ACK_INT_BIT BIT(1)
> +
> +#define FIFO_WM_DEFAULT                CIX_MBOX_MSG_LEN
> +#define FIFO_STAS_WMK          BIT(0)
> +#define FIFO_STAS_FULL         BIT(1)
> +#define FIFO_STAS_EMPTY                BIT(2)
> +#define FIFO_STAS_UFLOW                BIT(3)
> +#define FIFO_STAS_OFLOW                BIT(4)
> +
> +#define FIFO_RST_BIT           BIT(0)
> +
> +#define DB_INT                 BIT(0)
> +#define ACK_INT                        BIT(1)
> +#define FIFO_FULL_INT          BIT(2)
> +#define FIFO_EMPTY_INT         BIT(3)
> +#define FIFO_WM01_INT          BIT(4)
> +#define FIFO_WM10_INT          BIT(5)
> +#define FIFO_OFLOW_INT         BIT(6)
> +#define FIFO_UFLOW_INT         BIT(7)
> +#define FIFO_N_EMPTY_INT       BIT(8)
> +#define FAST_CH_INT(IDX)       BIT((IDX)+9)
> +
> +#define SHMEM_OFFSET 0x80
> +
> +enum cix_mbox_chan_type {
> +       CIX_MBOX_TYPE_DB,
> +       CIX_MBOX_TYPE_REG,
> +       CIX_MBOX_TYPE_FIFO,
> +       CIX_MBOX_TYPE_FAST,
> +};
> +
> +struct cix_mbox_con_priv {
> +       enum cix_mbox_chan_type type;
> +       struct mbox_chan        *chan;
> +       int index;
> +};
> +
> +struct cix_mbox_priv {
> +       struct device *dev;
> +       int irq;
> +       int dir;
> +       bool tx_irq_mode;       /* flag of enabling tx's irq mode */
> +       void __iomem *base;     /* region for mailbox */
> +       unsigned int chan_num;
tx_irq_mode and chan_num are unused


> +       struct cix_mbox_con_priv con_priv[CIX_MBOX_CHANS];
> +       struct mbox_chan mbox_chans[CIX_MBOX_CHANS];
> +       struct mbox_controller mbox;
> +       bool use_shmem;
> +};
> +
> +/*
> + * The CIX mailbox supports four types of transfers:
> + * CIX_MBOX_TYPE_DB, CIX_MBOX_TYPE_FAST, CIX_MBOX_TYPE_REG, and CIX_MBOX=
_TYPE_FIFO.
> + * For the REG and FIFO types of transfers, the message format is as fol=
lows:
> + */
> +union cix_mbox_msg_reg_fifo {
> +       u32 length;     /* unit is byte */
> +       u32 buf[CIX_MBOX_MSG_LEN]; /* buf[0] must be the byte length of t=
his array */
> +};
> +
> +static struct cix_mbox_priv *to_cix_mbox_priv(struct mbox_controller *mb=
ox)
> +{
> +       return container_of(mbox, struct cix_mbox_priv, mbox);
> +}
> +
> +static void cix_mbox_write(struct cix_mbox_priv *priv, u32 val, u32 offs=
et)
> +{
> +       if (priv->use_shmem)
> +               iowrite32(val, priv->base + offset - SHMEM_OFFSET);
> +       else
> +               iowrite32(val, priv->base + offset);
> +}
> +
> +static u32 cix_mbox_read(struct cix_mbox_priv *priv, u32 offset)
> +{
> +       if (priv->use_shmem)
> +               return ioread32(priv->base + offset - SHMEM_OFFSET);
> +       else
> +               return ioread32(priv->base + offset);
> +}
> +
use_shmem is set for only CIX_MBOX_TYPE_DB, but it affects every read/write=
.
Maybe instead adjust the base for TYPE_DB?

> +static bool mbox_fifo_empty(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +
> +       return ((cix_mbox_read(priv, FIFO_STAS) & FIFO_STAS_EMPTY) ? true=
 : false);
> +}
> +
> +/*
> + *The transmission unit of the CIX mailbox is word.
> + *The byte length should be converted into the word length.
> + */
> +static inline u32 mbox_get_msg_size(void *msg)
> +{
> +       u32 len;
> +
> +       len =3D ((u32 *)msg)[0] & MBOX_MSG_LEN_MASK;
> +       return DIV_ROUND_UP(len, 4);
> +}
> +
> +static int cix_mbox_send_data_db(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +
> +       /* trigger doorbell irq */
> +       cix_mbox_write(priv, DB_INT_BIT, REG_DB_ACK);
> +
> +       return 0;
> +}
> +
> +static int cix_mbox_send_data_reg(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       union cix_mbox_msg_reg_fifo *msg =3D data;
> +       u32 len, i;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       len =3D mbox_get_msg_size(data);
> +       for (i =3D 0; i < len; i++)
> +               cix_mbox_write(priv, msg->buf[i], REG_MSG(i));
> +
> +       /* trigger doorbell irq */
> +       cix_mbox_write(priv, DB_INT_BIT, REG_DB_ACK);
> +
> +       return 0;
> +}
> +
> +static int cix_mbox_send_data_fifo(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       union cix_mbox_msg_reg_fifo *msg =3D data;
> +       u32 len, val_32, i;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       len =3D mbox_get_msg_size(data);
> +       cix_mbox_write(priv, len, FIFO_WM);
> +       for (i =3D 0; i < len; i++)
> +               cix_mbox_write(priv, msg->buf[i], FIFO_WR);
> +
> +       /* Enable fifo empty interrupt */
> +       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +       val_32 |=3D FIFO_EMPTY_INT;
> +       cix_mbox_write(priv, val_32, INT_ENABLE);
> +
> +       return 0;
> +}
> +
> +static int cix_mbox_send_data_fast(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +       u32 *arg =3D (u32 *)data;
> +       int index =3D cp->index;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       if (index < 0 || index > MBOX_FAST_IDX) {
> +               dev_err(priv->dev, "Invalid Mbox index %d\n", index);
> +               return -EINVAL;
> +       }
> +
> +       cix_mbox_write(priv, arg[0], REG_F_INT(index));
> +
> +       return 0;
> +}
> +
> +static int cix_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +
> +       if (priv->dir !=3D MBOX_TX) {
> +               dev_err(priv->dev, "Invalid Mbox dir %d\n", priv->dir);
> +               return -EINVAL;
> +       }
> +
> +       switch (cp->type) {
> +       case CIX_MBOX_TYPE_DB:
> +               cix_mbox_send_data_db(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_REG:
> +               cix_mbox_send_data_reg(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_FIFO:
> +               cix_mbox_send_data_fifo(chan, data);
> +               break;
> +       case CIX_MBOX_TYPE_FAST:
> +               cix_mbox_send_data_fast(chan, data);
> +               break;
> +       default:
> +               dev_err(priv->dev, "Invalid channel type: %d\n", cp->type=
);
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +static void cix_mbox_isr_db(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       u32 int_status;
> +
> +       int_status =3D cix_mbox_read(priv, INT_STATUS);
> +
> +       if (priv->dir =3D=3D MBOX_RX) {
> +               /* rx interrupt is triggered */
> +               if (int_status & DB_INT) {
> +                       cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +                       mbox_chan_received_data(chan, NULL);
> +                       /* trigger ack interrupt */
> +                       cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +               }
> +       } else {
> +               /* tx ack interrupt is triggered */
> +               if (int_status & ACK_INT) {
> +                       cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +                       mbox_chan_received_data(chan, NULL);
> +               }
> +       }
> +}
> +
> +static void cix_mbox_isr_reg(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       u32 int_status;
> +
> +       int_status =3D cix_mbox_read(priv, INT_STATUS);
> +
> +       if (priv->dir =3D=3D MBOX_RX) {
> +               /* rx interrupt is triggered */
> +               if (int_status & DB_INT) {
> +                       u32 data[CIX_MBOX_MSG_LEN], len, i;
> +
> +                       cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +                       data[0] =3D cix_mbox_read(priv, REG_MSG(0));
> +                       len =3D mbox_get_msg_size(data);
> +                       for (i =3D 1; i < len; i++)
> +                               data[i] =3D cix_mbox_read(priv, REG_MSG(i=
));
> +
> +                       /* trigger ack interrupt */
> +                       cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +                       mbox_chan_received_data(chan, data);
> +               }
> +       } else {
> +               /* tx ack interrupt is triggered */
> +               if (int_status & ACK_INT) {
> +                       cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +                       mbox_chan_txdone(chan, 0);
> +               }
> +       }
> +}
> +
> +static void cix_mbox_isr_fifo(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       u32 int_status, status;
> +
> +       int_status =3D cix_mbox_read(priv, INT_STATUS);
> +
> +       if (priv->dir =3D=3D MBOX_RX) {
> +               /* FIFO waterMark interrupt is generated */
> +               if (int_status & (FIFO_FULL_INT | FIFO_WM01_INT)) {
> +                       u32 data[CIX_MBOX_MSG_LEN] =3D { 0 }, i =3D 0;
> +
> +                       cix_mbox_write(priv, (FIFO_FULL_INT | FIFO_WM01_I=
NT), INT_CLEAR);
> +                       do {
> +                               data[i++] =3D cix_mbox_read(priv, FIFO_RD=
);
> +                       } while (!mbox_fifo_empty(chan) && i < CIX_MBOX_M=
SG_LEN);
> +
> +                       mbox_chan_received_data(chan, data);
> +               }
> +               /* FIFO underflow is generated */
> +               if (int_status & FIFO_UFLOW_INT) {
> +                       status =3D cix_mbox_read(priv, FIFO_STAS);
> +                       dev_err(priv->dev, "fifo underflow: int_stats %d\=
n", status);
> +                       cix_mbox_write(priv, FIFO_UFLOW_INT, INT_CLEAR);
> +               }
> +       } else {
> +               /* FIFO empty interrupt is generated */
> +               if (int_status & FIFO_EMPTY_INT) {
> +                       u32 val_32;
> +
> +                       cix_mbox_write(priv, FIFO_EMPTY_INT, INT_CLEAR);
> +                       /* Disable empty irq*/
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +                       val_32 &=3D ~FIFO_EMPTY_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE);
> +                       mbox_chan_txdone(chan, 0);
> +               }
> +               /* FIFO overflow is generated */
> +               if (int_status & FIFO_OFLOW_INT) {
> +                       status =3D cix_mbox_read(priv, FIFO_STAS);
> +                       dev_err(priv->dev, "fifo overlow: int_stats %d\n"=
, status);
> +                       cix_mbox_write(priv, FIFO_OFLOW_INT, INT_CLEAR);
> +               }
> +       }
> +}
> +
> +static void cix_mbox_isr_fast(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +       u32 int_status, data;
> +
> +       /* no irq will be trigger for TX dir mbox */
> +       if (priv->dir !=3D MBOX_RX)
> +               return;
> +
> +       int_status =3D cix_mbox_read(priv, INT_STATUS);
> +
> +       if (int_status & FAST_CH_INT(cp->index)) {
> +               cix_mbox_write(priv, FAST_CH_INT(cp->index), INT_CLEAR);
> +               data =3D cix_mbox_read(priv, REG_F_INT(cp->index));
> +               mbox_chan_received_data(chan, &data);
> +       }
> +}
> +
> +static irqreturn_t cix_mbox_isr(int irq, void *arg)
> +{
> +       struct mbox_chan *chan =3D arg;
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +
> +       switch (cp->type) {
> +       case CIX_MBOX_TYPE_DB:
> +               cix_mbox_isr_db(chan);
> +               break;
> +       case CIX_MBOX_TYPE_REG:
> +               cix_mbox_isr_reg(chan);
> +               break;
> +       case CIX_MBOX_TYPE_FIFO:
> +               cix_mbox_isr_fifo(chan);
> +               break;
> +       case CIX_MBOX_TYPE_FAST:
> +               cix_mbox_isr_fast(chan);
> +               break;
> +       default:
> +               dev_err(priv->dev, "Invalid channel type: %d\n", cp->type=
);
> +               return IRQ_NONE;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int cix_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +       int index =3D cp->index, ret;
> +       u32 val_32;
> +
> +       ret =3D request_irq(priv->irq, cix_mbox_isr, 0,
> +                         dev_name(priv->dev), chan);
The same irq is requested for each channel. How do you expect it to
work? Maybe request it just once in probe and pass the 'priv' instead
of 'chan' , and in the cix_mbox_isr handle according to INT_STATUS

> +       if (ret) {
> +               dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->ir=
q);
> +               return ret;
> +       }
> +
> +       switch (cp->type) {
> +       case CIX_MBOX_TYPE_DB:
> +               /* Overwrite txdone_method for DB channel */
> +               chan->txdone_method =3D TXDONE_BY_ACK;
> +               fallthrough;
> +       case CIX_MBOX_TYPE_REG:
> +               if (priv->dir =3D=3D MBOX_TX) {
> +                       /* Enable ACK interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +                       val_32 |=3D ACK_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE);
> +               } else {
> +                       /* Enable Doorbell interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 |=3D DB_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +       case CIX_MBOX_TYPE_FIFO:
> +               /* reset fifo */
> +               cix_mbox_write(priv, FIFO_RST_BIT, FIFO_RST);
> +               /* set default watermark */
> +               cix_mbox_write(priv, FIFO_WM_DEFAULT, FIFO_WM);
> +               if (priv->dir =3D=3D MBOX_TX) {
> +                       /* Enable fifo overflow interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +                       val_32 |=3D FIFO_OFLOW_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE);
> +               } else {
> +                       /* Enable fifo full/underflow interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 |=3D FIFO_UFLOW_INT|FIFO_WM01_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +       case CIX_MBOX_TYPE_FAST:
> +               /* Only RX channel has intterupt */
> +               if (priv->dir =3D=3D MBOX_RX) {
> +                       if (index < 0 || index > MBOX_FAST_IDX) {
> +                               dev_err(priv->dev, "Invalid index %d\n", =
index);
> +                               ret =3D -EINVAL;
> +                               goto failed;
> +                       }
> +                       /* enable fast channel interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 |=3D FAST_CH_INT(index);
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +       default:
> +               dev_err(priv->dev, "Invalid channel type: %d\n", cp->type=
);
> +               ret =3D -EINVAL;
> +               goto failed;
> +       }
> +       return 0;
> +
> +failed:
> +       free_irq(priv->irq, chan);
> +       return ret;
> +}
> +
> +static void cix_mbox_shutdown(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv =3D to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp =3D chan->con_priv;
> +       int index =3D cp->index;
> +       u32 val_32;

Never saw this style before, may simply use val

> +
> +       switch (cp->type) {
> +       case CIX_MBOX_TYPE_DB:
> +       case CIX_MBOX_TYPE_REG:
> +               if (priv->dir =3D=3D MBOX_TX) {
> +                       /* Disable ACK interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +                       val_32 &=3D ~ACK_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE);
> +               } else if (priv->dir =3D=3D MBOX_RX) {
> +                       /* Disable Doorbell interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 &=3D ~DB_INT;
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +       case CIX_MBOX_TYPE_FIFO:
> +               if (priv->dir =3D=3D MBOX_TX) {
> +                       /* Disable empty/fifo overflow irq*/
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE);
> +                       val_32 &=3D ~(FIFO_EMPTY_INT | FIFO_OFLOW_INT);
> +                       cix_mbox_write(priv, val_32, INT_ENABLE);
> +               } else if (priv->dir =3D=3D MBOX_RX) {
> +                       /* Disable fifo WM01/underflow interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 &=3D ~(FIFO_UFLOW_INT | FIFO_WM01_INT);
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +       case CIX_MBOX_TYPE_FAST:
> +               if (priv->dir =3D=3D MBOX_RX) {
> +                       if (index < 0 || index > MBOX_FAST_IDX) {
> +                               dev_err(priv->dev, "Invalid index %d\n", =
index);
> +                               break;
> +                       }
> +                       /* Disable fast channel interrupt */
> +                       val_32 =3D cix_mbox_read(priv, INT_ENABLE_SIDE_B)=
;
> +                       val_32 &=3D ~FAST_CH_INT(index);
> +                       cix_mbox_write(priv, val_32, INT_ENABLE_SIDE_B);
> +               }
> +               break;
> +
> +       default:
> +               dev_err(priv->dev, "Invalid channel type: %d\n", cp->type=
);
> +               break;
> +       }
> +
> +       free_irq(priv->irq, chan);
> +}
> +
> +static const struct mbox_chan_ops cix_mbox_chan_ops =3D {
> +       .send_data =3D cix_mbox_send_data,
> +       .startup =3D cix_mbox_startup,
> +       .shutdown =3D cix_mbox_shutdown,
> +};
> +
> +static void cix_mbox_init(struct cix_mbox_priv *priv)
> +{
> +       struct cix_mbox_con_priv *cp;
> +       int i;
> +
> +       for (i =3D 0; i < CIX_MBOX_CHANS; i++) {
> +               cp =3D &priv->con_priv[i];
> +               cp->index =3D i;
> +               cp->chan =3D &priv->mbox_chans[i];
> +               priv->mbox_chans[i].con_priv =3D cp;
> +               if (cp->index <=3D MBOX_FAST_IDX)
> +                       cp->type =3D CIX_MBOX_TYPE_FAST;
> +               if (cp->index =3D=3D MBOX_DB_IDX) {
> +                       cp->type =3D CIX_MBOX_TYPE_DB;
> +                       priv->use_shmem =3D true;
> +               }
> +               if (cp->index =3D=3D MBOX_FIFO_IDX)
> +                       cp->type =3D CIX_MBOX_TYPE_FIFO;
> +               if (cp->index =3D=3D MBOX_REG_IDX)
> +                       cp->type =3D CIX_MBOX_TYPE_REG;
> +       }
> +}
> +
> +static int cix_mbox_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct cix_mbox_priv *priv;
> +       const char *dir_str;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
> +
> +       if (device_property_read_string(dev, "cix,mbox-dir", &dir_str)) {
> +               dev_err(priv->dev, "cix,mbox_dir property not found\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!strcmp(dir_str, "tx"))
> +               priv->dir =3D 0;
> +       else if (!strcmp(dir_str, "rx"))
> +               priv->dir =3D 1;
> +       else {
> +               dev_err(priv->dev, "cix,mbox_dir=3D%s is not expected\n",=
 dir_str);
> +               return -EINVAL;
> +       }
> +
> +       cix_mbox_init(priv);
> +
> +       priv->mbox.dev =3D dev;
> +       priv->mbox.ops =3D &cix_mbox_chan_ops;
> +       priv->mbox.chans =3D priv->mbox_chans;
> +       priv->mbox.txdone_irq =3D true;
> +       priv->mbox.num_chans =3D CIX_MBOX_CHANS;
> +       priv->mbox.of_xlate =3D NULL;
> +
> +       platform_set_drvdata(pdev, priv);
> +       ret =3D devm_mbox_controller_register(dev, &priv->mbox);
> +       if (ret)
> +               dev_err(dev, "Failed to register mailbox %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id cix_mbox_dt_ids[] =3D {
> +       { .compatible =3D "cix,sky1-mbox" },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, cix_mbox_dt_ids);
> +
> +static struct platform_driver cix_mbox_driver =3D {
> +       .probe =3D cix_mbox_probe,
> +       .driver =3D {
> +               .name =3D "cix_mbox",
> +               .of_match_table =3D cix_mbox_dt_ids,
> +       },
> +};
> +
> +static int __init cix_mailbox_init(void)
> +{
> +       return platform_driver_register(&cix_mbox_driver);
> +}
> +arch_initcall(cix_mailbox_init);
> +
> +MODULE_AUTHOR("Cix Technology Group Co., Ltd.");
> +MODULE_DESCRIPTION("CIX mailbox driver");
> +MODULE_LICENSE("GPL");

GPL v2 ? according to the SPDX-License-Identifier

And please make sure you run scripts/checkpatch.pl

thanks

