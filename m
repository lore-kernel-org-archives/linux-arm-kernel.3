Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585E8D1358C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce0zNBQeVdRQ8Ne1/EW2HUiLxw/YLpcNrQUx0YR1py8=; b=u98L+sbo6K++RfarFIBIrHRI1f
	AnhglvvR/WXGOmxr9CSLo88yxxj8ssLEasQjBED0s5M2aqM2e8yQ/Ri19IkqUafmBvdukAQqiA2+b
	RbmCCKC7XFGWhf6kjOIpihcb8U4uweKKKsn3r7SS6+JzZwGgUmmKc2StCzemhay1g/W7F7xb5edS1
	bG19goTG25KqevwttmpNyzpLnzFXa220Ga8MHBVfT1i7XyivX1ick5liFe8QxeJ3b08ayg0l5OyXd
	W5lQdNLELUL19dbLkvwKtPR0TSO/CSOZiI6y/bKetkekPHBllhFYTBXFGOfM+Q2/sG3y9kqlI4sl1
	E1nL1ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5J5I-00000009huI-3izU;
	Mon, 28 Oct 2024 06:18:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5J3J-00000009hjQ-3201
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 06:16:35 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539fe76e802so4537776e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 23:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730096191; x=1730700991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce0zNBQeVdRQ8Ne1/EW2HUiLxw/YLpcNrQUx0YR1py8=;
        b=Khh5of8xh8RnSg1Fymi2AHY4E0io2FSET3Wz1rb8yFthhmcgEVYAsCkPcyJQjVabml
         XH5nnagvjzW8lTTnIDTun9ovTMDVBILJ+3TnkDEMRjjkmdz3hvBoRl37shElmV4XeS6j
         HdFwRQCqfKLVEija0UYahd8KSmKkhr2gKuS8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730096191; x=1730700991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ce0zNBQeVdRQ8Ne1/EW2HUiLxw/YLpcNrQUx0YR1py8=;
        b=Mv7UvrV9KdqKaKxXK6hQCuKvSIYlF0DBpKkqxb4ULdWzZcFHT+VDL1yG66ogeoHQYP
         e9XjS6YKW8e2YiS9HWw9jDQNKl+44T3Zkxr7gWDUY6j6UNpuvl3Kz6JsVC34rr7DukRU
         3xdv8IQR0GNiJniPPuWgfSiYKkrQvS8WCoERdK7I67FYYeAskZpT39w5kN2cyPuPMSYX
         ygKyBF4UhasDruu5u9kIgw4wd8DTMdGEnorGhH8GoWILziZ5X8HPj4TrbLueSNcOJwWK
         KFvWjyYw5GuOj28nd3A0SN8f8ztmRRwp5xFJU4Y5dYOUqo6Ue2lurMjlBE1Ewz1BTQkT
         kdZg==
X-Forwarded-Encrypted: i=1; AJvYcCV3a2vYPamTXUNWbb+OgCr1idAWvjjPbUUzOjLjGTam4KOWVICovN5wMXx9esXThhEz8tM/5M92lJWecyRXrRdU@lists.infradead.org
X-Gm-Message-State: AOJu0YwhALSqdcnV7syyu8g8nHhODyVgyvbwpAQ5Q3t7OsSgWYwi3ZVu
	WTaF3XoFqOl66TbOQydUeZZgB3OGU82zBAzGZvpR2P7ah6GqQWMWnmHJl+RIY62Nbph2FjHjZ3G
	uD292cXd/5/18l4CexUgk1uVh7RKkOYC3B9Tn
X-Google-Smtp-Source: AGHT+IHecNhW/jutuL0nvEERsRSalPbI5tTsLoadKR/QpcprzkyZd5Vj5cqxvO8NeO94kw/nockw3+sBHAAyshfpxAA=
X-Received: by 2002:a05:6512:3e25:b0:536:7b74:ef50 with SMTP id
 2adb3069b0e04-53b348cfa43mr2434156e87.18.1730096191168; Sun, 27 Oct 2024
 23:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241024092608.431581-1-karl.li@mediatek.com> <20241024092608.431581-4-karl.li@mediatek.com>
 <083c8f7b-0969-4ca3-8a91-35f5767c5f32@collabora.com>
In-Reply-To: <083c8f7b-0969-4ca3-8a91-35f5767c5f32@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 14:16:19 +0800
Message-ID: <CAGXv+5Fw+qZhTTgJq0QdiQHgiQP2ByR1tgae2+k4erx+0fp61g@mail.gmail.com>
Subject: Re: [PATCH 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Karl.Li" <karl.li@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Chungying Lu <chungying.lu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_231633_842338_65C90F55 
X-CRM114-Status: GOOD (  50.07  )
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

On Thu, Oct 24, 2024 at 7:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 24/10/24 11:25, Karl.Li ha scritto:
> > From: Karl Li <karl.li@mediatek.com>
> >
> > Add mtk-apu-mailbox driver to support the communication with
> > APU remote microprocessor.
> >
> > Also, the mailbox hardware contains extra spare (scratch) registers
> > that other hardware blocks use to communicate through.
> > Expose these with custom mtk_apu_mbox_(read|write)() functions.
> >
> > Signed-off-by: Karl Li <karl.li@mediatek.com>
> > ---
> >   drivers/mailbox/Kconfig                 |   9 +
> >   drivers/mailbox/Makefile                |   2 +
> >   drivers/mailbox/mtk-apu-mailbox.c       | 222 +++++++++++++++++++++++=
+
> >   include/linux/mailbox/mtk-apu-mailbox.h |  20 +++
> >   4 files changed, 253 insertions(+)
> >   create mode 100644 drivers/mailbox/mtk-apu-mailbox.c
> >   create mode 100644 include/linux/mailbox/mtk-apu-mailbox.h
> >
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index 6fb995778636..2338e08a110a 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -240,6 +240,15 @@ config MTK_ADSP_MBOX
> >             between processors with ADSP. It will place the message to =
share
> >         buffer and will access the ipc control.
> >
> > +config MTK_APU_MBOX
> > +     tristate "MediaTek APU Mailbox Support"
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     help
> > +       Say yes here to add support for the MediaTek APU Mailbox
> > +       driver. The mailbox implementation provides access from the
> > +       application processor to the MediaTek AI Processing Unit.
> > +       If unsure say N.
> > +
> >   config MTK_CMDQ_MBOX
> >       tristate "MediaTek CMDQ Mailbox Support"
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index 3c3c27d54c13..6b6dcc78d644 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -53,6 +53,8 @@ obj-$(CONFIG_STM32_IPCC)    +=3D stm32-ipcc.o
> >
> >   obj-$(CONFIG_MTK_ADSP_MBOX) +=3D mtk-adsp-mailbox.o
> >
> > +obj-$(CONFIG_MTK_APU_MBOX)   +=3D mtk-apu-mailbox.o
> > +
> >   obj-$(CONFIG_MTK_CMDQ_MBOX) +=3D mtk-cmdq-mailbox.o
> >
> >   obj-$(CONFIG_ZYNQMP_IPI_MBOX)       +=3D zynqmp-ipi-mailbox.o
> > diff --git a/drivers/mailbox/mtk-apu-mailbox.c b/drivers/mailbox/mtk-ap=
u-mailbox.c
> > new file mode 100644
> > index 000000000000..b347ebd34ef7
> > --- /dev/null
> > +++ b/drivers/mailbox/mtk-apu-mailbox.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2024 MediaTek Inc.
> > + */
> > +
> > +#include <asm/io.h>
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/mtk-apu-mailbox.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define INBOX                (0x0)
> > +#define OUTBOX               (0x20)
> > +#define INBOX_IRQ    (0xc0)
> > +#define OUTBOX_IRQ   (0xc4)
> > +#define INBOX_IRQ_MASK       (0xd0)
> > +
> > +#define SPARE_OFF_START      (0x40)
> > +#define SPARE_OFF_END        (0xB0)
> > +
> > +struct mtk_apu_mailbox {
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     struct mbox_controller controller;
>
> struct mbox_controller mbox;
>
> ...it's shorter and consistent with at least other MTK mailbox drivers.
>
> > +     u32 msgs[MSG_MBOX_SLOTS];
>
> Just reuse struct mtk_apu_mailbox_msg instead.....
>
> > +};
> > +
> > +struct mtk_apu_mailbox *g_mbox;
>
> That global struct must disappear - and if you use the mailbox API correc=
tly
> it's even simple.
>
> Also, you want something like....
>
> static inline struct mtk_apu_mailbox *get_mtk_apu_mailbox(struct mbox_con=
troller *mbox)
> {
>         return container_of(mbox, struct mtk_apu_mailbox, mbox);
> }
>
> > +
> > +static irqreturn_t mtk_apu_mailbox_irq_top_half(int irq, void *dev_id)
> > +{
> static irqreturn_t mtk_apu_mailbox_irq(int irq, void *data)
> {
>         struct mbox_chan *chan =3D data;
>         struct mtk_apu_mailbox =3D get_mtk_apu_mailbox(chan->mbox);
>
> > +     struct mtk_apu_mailbox *mbox =3D dev_id;
> > +     struct mbox_chan *link =3D &mbox->controller.chans[0];
> > +     int i;
> > +
> > +     for (i =3D 0; i < MSG_MBOX_SLOTS; i++)
> > +             mbox->msgs[i] =3D readl(mbox->regs + OUTBOX + i * sizeof(=
u32));
> > +
> > +     mbox_chan_received_data(link, &mbox->msgs);
> > +
> > +     return IRQ_WAKE_THREAD;
> > +}
> > +
> > +static irqreturn_t mtk_apu_mailbox_irq_btm_half(int irq, void *dev_id)
>
> ....mtk_apu_mailbox_irq_thread(...)
>
> > +{
> > +     struct mtk_apu_mailbox *mbox =3D dev_id;
> > +     struct mbox_chan *link =3D &mbox->controller.chans[0];
> > +
> > +     mbox_chan_received_data_bh(link, &mbox->msgs);
>
> I don't think that you really need this _bh variant, looks more like you =
wanted
> to have two callbacks instead of one.
>
> You can instead have one callback and vary functionality based based on r=
eading
> a variable to decide what to actually do inside. Not a big deal.

The problem is that they need something with different semantics.
mbox_chan_received_data() is atomic only.

> > +     writel(readl(mbox->regs + OUTBOX_IRQ), mbox->regs + OUTBOX_IRQ);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int mtk_apu_mailbox_send_data(struct mbox_chan *chan, void *dat=
a)
> > +{
> > +     struct mtk_apu_mailbox *mbox =3D container_of(chan->mbox,
> > +                                                 struct mtk_apu_mailbo=
x,
> > +                                                 controller);
> > +     struct mtk_apu_mailbox_msg *msg =3D data;
> > +     int i;
> > +
> > +     if (msg->send_cnt <=3D 0 || msg->send_cnt > MSG_MBOX_SLOTS) {
> > +             dev_err(mbox->dev, "%s: invalid send_cnt %d\n", __func__,=
 msg->send_cnt);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /*
> > +      *      Mask lowest "send_cnt-1" interrupts bits, so the interrup=
t on the other side
> > +      *      triggers only after the last data slot is written (sent).
> > +      */
> > +     writel(GENMASK(msg->send_cnt - 2, 0), mbox->regs + INBOX_IRQ_MASK=
);
> > +     for (i =3D 0; i < msg->send_cnt; i++)
> > +             writel(msg->data[i], mbox->regs + INBOX + i * sizeof(u32)=
);
> > +
> > +     return 0;
> > +}
> > +
> > +static bool mtk_apu_mailbox_last_tx_done(struct mbox_chan *chan)
> > +{
> > +     struct mtk_apu_mailbox *mbox =3D container_of(chan->mbox,
> > +                                                 struct mtk_apu_mailbo=
x,
> > +                                                 controller);
> > +
> > +     return readl(mbox->regs + INBOX_IRQ) =3D=3D 0;
> > +}
> > +
> > +static const struct mbox_chan_ops mtk_apu_mailbox_ops =3D {
> > +     .send_data =3D mtk_apu_mailbox_send_data,
> > +     .last_tx_done =3D mtk_apu_mailbox_last_tx_done,
> > +};
> > +
> > +/**
> > + * mtk_apu_mbox_write - Write value to specifice mtk_apu_mbox spare re=
gister.
> > + * @val: Value to be written.
> > + * @offset: Offset of the spare register.
> > + *
> > + * Return: 0 if successful
> > + *      negative value if error happened
> > + */
> > +int mtk_apu_mbox_write(u32 val, u32 offset)
> > +{
> > +     if (!g_mbox) {
> > +             pr_err("mtk apu mbox was not initialized, stop writing re=
gister\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (offset < SPARE_OFF_START || offset >=3D SPARE_OFF_END) {
> > +             dev_err(g_mbox->dev, "Invalid offset %d for mtk apu mbox =
spare register\n", offset);
> > +             return -EINVAL;
> > +     }
> > +
> > +     writel(val, g_mbox->regs + offset);
>
> There's something odd in what you're doing here, why would you ever need
> a function that performs a writel just like that? What's the purpose?
>
> What are you writing to the spare registers?
> For which reason?

I'll leave the explaining to Karl, but based on internal reviews for the
previous generation, it looked like passing values to/from the MCU.

> I think you can avoid (read this as: you *have to* avoid) having such a
> function around.

Again, during the previous round of internal reviews, I had thought
about modeling these as extra mbox channels. I may have even asked
about this on IRC.

The problem is that it doesn't really have mbox semantics. They are
just shared registers with no send/receive notification. So at the
very least, there's nothing that will trigger a reception. I suppose
we could make the .peek_data op trigger RX, but that's a really
convoluted way to read just a register.

The other option would be to have a syscon / custom exported regmap?

> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_NS(mtk_apu_mbox_write, MTK_APU_MAILBOX);
> > +
> > +/**
> > + * mtk_apu_mbox_read - Read value to specifice mtk_apu_mbox spare regi=
ster.
> > + * @offset: Offset of the spare register.
> > + * @val: Pointer to store read value.
> > + *
> > + * Return: 0 if successful
> > + *      negative value if error happened
> > + */
> > +int mtk_apu_mbox_read(u32 offset, u32 *val)
> > +{
> > +     if (!g_mbox) {
> > +             pr_err("mtk apu mbox was not initialized, stop reading re=
gister\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (offset < SPARE_OFF_START || offset >=3D SPARE_OFF_END) {
> > +             dev_err(g_mbox->dev, "Invalid offset %d for mtk apu mbox =
spare register\n", offset);
> > +             return -EINVAL;
> > +     }
> > +
> > +     *val =3D readl(g_mbox->regs + offset);
> > +
>
> Same goes for this one.
>
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_NS(mtk_apu_mbox_read, MTK_APU_MAILBOX);
> > +
> > +static int mtk_apu_mailbox_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct mtk_apu_mailbox *mbox;
> > +     int irq =3D -1, ret =3D 0;
> > +
> > +     mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +     if (!mbox)
> > +             return -ENOMEM;
> > +
> > +     mbox->dev =3D dev;
> > +     platform_set_drvdata(pdev, mbox);
> > +
>
> Please move the platform_get_irq call here or anyway before registering t=
he
> mbox controller: in case anything goes wrong, devm won't have to unregist=
er
> the mbox afterwards because it never got registered in the first place.

To clarify, you mean _just_ platform_get_irq() and not request_irq as
well.

> > +     mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mbox->regs))
> > +             return PTR_ERR(mbox->regs);
> > +
> > +     mbox->controller.txdone_irq =3D false;
> > +     mbox->controller.txdone_poll =3D true;
> > +     mbox->controller.txpoll_period =3D 1;
> > +     mbox->controller.ops =3D &mtk_apu_mailbox_ops;
> > +     mbox->controller.dev =3D dev;
> > +     /*
> > +      * Here we only register 1 mbox channel.
> > +      * The remaining channels are used by other modules.
>
> What other modules? I don't really see any - so please at least explain t=
hat in the
> commit description.
>
> > +      */
> > +     mbox->controller.num_chans =3D 1;
> > +     mbox->controller.chans =3D devm_kcalloc(dev, mbox->controller.num=
_chans,
> > +                                           sizeof(*mbox->controller.ch=
ans),
> > +                                           GFP_KERNEL);
> > +     if (!mbox->controller.chans)
> > +             return -ENOMEM;
> > +
> > +     ret =3D devm_mbox_controller_register(dev, &mbox->controller);
> > +     if (ret)
> > +             return ret;
> > +
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> > +     ret =3D devm_request_threaded_irq(dev, irq, mtk_apu_mailbox_irq_t=
op_half,
> > +                                     mtk_apu_mailbox_irq_btm_half, IRQ=
F_ONESHOT,
> > +                                     dev_name(dev), mbox);
>
> pass mbox->chans to the isr
>
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to request IRQ\n")=
;
> > +
> > +     g_mbox =3D mbox;
> > +
> > +     dev_dbg(dev, "registered mtk apu mailbox\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static void mtk_apu_mailbox_remove(struct platform_device *pdev)
> > +{
> > +     g_mbox =3D NULL;
> > +}
> > +
> > +static const struct of_device_id mtk_apu_mailbox_of_match[] =3D {
> > +     { .compatible =3D "mediatek,mt8188-apu-mailbox" },
> > +     { .compatible =3D "mediatek,mt8196-apu-mailbox" },
>
> Just mediatek,mt8188-apu-mailbox is fine; you can allow mt8196=3D=3Dmt818=
8 in the
> binding instead.
>
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_apu_mailbox_of_match);
> > +
> > +static struct platform_driver mtk_apu_mailbox_driver =3D {
> > +     .probe =3D mtk_apu_mailbox_probe,
> > +     .remove =3D mtk_apu_mailbox_remove,
>
> You don't need this remove callback, since g_mbox has to disappear :-)
>
> > +     .driver =3D {
> > +             .name =3D "mtk-apu-mailbox",
> > +             .of_match_table =3D mtk_apu_mailbox_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(mtk_apu_mailbox_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("MediaTek APU Mailbox Driver");
> > diff --git a/include/linux/mailbox/mtk-apu-mailbox.h b/include/linux/ma=
ilbox/mtk-apu-mailbox.h
> > new file mode 100644
> > index 000000000000..d1457d16ce9b
> > --- /dev/null
> > +++ b/include/linux/mailbox/mtk-apu-mailbox.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2024 MediaTek Inc.
> > + *
> > + */
> > +
> > +#ifndef __MTK_APU_MAILBOX_H__
> > +#define __MTK_APU_MAILBOX_H__
> > +
> > +#define MSG_MBOX_SLOTS       (8)
> > +
> > +struct mtk_apu_mailbox_msg {
> > +     int send_cnt;
>
> u8 data_cnt;
>
> > +     u32 data[MSG_MBOX_SLOTS];
>
> With hardcoded slots, what happens when we get a new chip in the future t=
hat
> supports more slots?

Seems like we can make it a flexible array member? But the problem then
becomes how does the client know what the maximum length is. Or maybe
it should already know given it's tied to a particular platform.

In any case it becomes:

    struct mtk_apu_mailbox_msg {
        u8 data_size;
        u8 data[] __counted_by(data_size);
    };

This can't be allocated on the stack if `data_size` isn't a compile
time constant though; but again it shouldn't be a problem given the
message size is tied to the client & its platform and should be
constant anyway.

The controller should just error out if the message is larger than
what it can atomically send.


ChenYu

> Please think about this now and make the implementation flexible before t=
hat
> happens because, at a later time, it'll be harder.
>
> Regards,
> Angelo
>
> > +};
> > +
> > +int mtk_apu_mbox_write(u32 val, u32 offset);
> > +int mtk_apu_mbox_read(u32 offset, u32 *val);
> > +
> > +#endif /* __MTK_APU_MAILBOX_H__ */
>
>

