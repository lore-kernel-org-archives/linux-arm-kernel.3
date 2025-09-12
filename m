Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2A2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 04:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF3hxUP89M2xeRagbS0iD4lceo8KItzDOcIGcx9L3Pc=; b=AubGxGJ6nXdJKsS+dJkB32P3KK
	dWvY0i0yNXA8M5w+lcklW7lYbG46SYPNL0pVK7VDqwEjiqJ364hLg91s5s2Tanqh+7lP/Em9RMrG7
	+NEaEwp2zG2Ne1dhyR/dblT0NPHejLuGT5vtQCks8aiRJwodUjEFnUv21JtCQB00jZ2k368NyKRzz
	TppGA9Jd9mgfTmDjm7xqUhUz86qIjpAfC2XNKcjaq/qRdirq4MwnaXrfw1JSBeoWE4UUmvq/CYlMc
	rNFKrdfK/eqKOnDJJ8QtQy0K+zB6a0degPah69r5si9lNa/6TXjFYGqgbteiCcMGczfKJDx6MLUp9
	jXNQoMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvi4-000000072nt-0c2n;
	Fri, 12 Sep 2025 04:48:32 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvi1-000000072mQ-39oB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 04:48:31 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ea3dbcc5410so214076276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757652508; x=1758257308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF3hxUP89M2xeRagbS0iD4lceo8KItzDOcIGcx9L3Pc=;
        b=CGwxhrrHud80PlkqQPFfcbsPxYfyMLIgNUflr1F9jA4NaBWxp+h8YJRQPihG0s7OYB
         ec5ludXi/8aJIKWTJsRJWFNAyDK6/nt+tQYQWoQYcnvXRdQrwozTBCjfLuPZ40CS49wB
         Opn3RGWVU24r+m9nN0f2Jzie4p5xCxd4RgW4uvQO0ZuybPv7XSLqEiWNZRCTPIdngcd7
         ILpego7KNX7CkoYMc+2v6D89Tpi/8gL4gyJD+hj14eYpRKygrSXW9EGiSBhV4VWRY0JY
         8MY9rtb6z5tZ224rYSxZDN3BNkpyHml85aCNaHfeoDfswXOsqdhBBGhFaQ1exnR0yUmG
         nh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757652508; x=1758257308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF3hxUP89M2xeRagbS0iD4lceo8KItzDOcIGcx9L3Pc=;
        b=v+RyC9StJuXKS8ISRiOW6E8utiP0+vbEBZLp0XVta6dlPLr42Lmlj2Bs/c6BUFJnBY
         x198uXTYAcOux2YEb/GE1MW8Sm6s7AcqVDVvKc9Evxb0or7MwHwxpWYC6i5COampBWBY
         LXdN9KQZ++zdwZCoF10B5EZZdAQ4DIM+D1U7x6+oJUu6apxm8CrMJbKsaZll7prd6lXS
         xpyRz4TCrb3zIcCXi6AejvLNwhbVWtkJbJalT7BooCts3sFYYIddDlrZyh311tGZvtLd
         poG3WFd5hUG4jSpi65UvpzHXKhWw18TSVwrnOFCMlNWo93BpZwGmIR+0nvV1WVcnvvcM
         lhdg==
X-Forwarded-Encrypted: i=1; AJvYcCWIVbQw/O77d5RX4CGx/OP2EeLNqaie4keXCXBibdqFUrRdMiGREaG61JJkWbbhWWf/r4iKP+ueO351Eqhlg3RL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5t8dccp7JKAa1e1v9AoeOKi7CnKbRDP26oXf4Cn4+99Hzetn2
	GFoy7XS1KZf4mI2vgLurRV7LrEpRJ8m3E/MCu8jovYU8bMhSwnnbf80KweevcorKg5aBrSAqV8E
	DQe84/RtngUpA7fE1iTUfVuI9X8LLcYM=
X-Gm-Gg: ASbGncse+bfhYUfsc4XxqTkEb8JWBE4Tdjxox5XHqJGyjMQcu1g4fulOI6nPyE3Xe9p
	d/2XB+b3ARzNQajlZVZ9ygvtEbF5aTlYyZCfoZ4uGaMbiZ3ia+6tq1cXZGQdB7CFa4NnHX/ZHBH
	XE/Jwnj3E4zso7jQZA+lA67ensAiyegadn/RdPUj3pwvMAofp8UlHHFZmNzt95fmpiUZVGWNwCB
	8hyZSem5Ip+xbi01KU6OvIyCcnOsTTEQmUpxHn8H7uGa88mpu2UQ3J/89LSMrGrVBo86d9s
X-Google-Smtp-Source: AGHT+IGfMeaPI79hB9XGXj+VWShVRybLbMRXi8iFn/oVf7vhmrVqp8SVoJqR/A1uYGGvnpfLhXNKeEUkL/F7JfbVOX4=
X-Received: by 2002:a05:690c:3511:b0:722:6920:5933 with SMTP id
 00721157ae682-730655c3de8mr16335977b3.44.1757652508216; Thu, 11 Sep 2025
 21:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com> <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 11 Sep 2025 21:48:17 -0700
X-Gm-Features: AS18NWD8okQNNAWKEPC_FiRm82LzNdOhqRvucMQKYn4L8mtB5aobTrQyZ8yiMKE
Message-ID: <CAPaKu7RUx6KHyvdvrfX3u-7Lk=Wa3nmTh6-tD3CbReNAwNtgoQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_214829_868294_52291696 
X-CRM114-Status: GOOD (  43.90  )
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

On Fri, Sep 5, 2025 at 3:24=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MT8196 SoC uses an embedded MCU to control frequencies and power of
> the GPU. This controller is referred to as "GPUEB".
>
> It communicates to the application processor, among other ways, through
> a mailbox.
>
> The mailbox exposes one interrupt, which appears to only be fired when a
> response is received, rather than a transaction is completed. For us,
> this means we unfortunately need to poll for txdone.
>
> The mailbox also requires the EB clock to be on when touching any of the
> mailbox registers.
>
> Add a simple driver for it based on the common mailbox framework.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/mailbox/Kconfig             |  10 ++
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/mtk-gpueb-mailbox.c | 330 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 342 insertions(+)
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 02432d4a5ccd46a16156a09c7f277fb03e4013f5..2016defda1fabb5c0fcc8078f=
84a52d4e4e00167 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -294,6 +294,16 @@ config MTK_CMDQ_MBOX
>           critical time limitation, such as updating display configuratio=
n
>           during the vblank.
>
> +config MTK_GPUEB_MBOX
> +       tristate "MediaTek GPUEB Mailbox Support"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       help
> +         The MediaTek GPUEB mailbox is used to communicate with the embe=
dded
> +         controller in charge of GPU frequency and power management on s=
ome
> +         MediaTek SoCs, such as the MT8196.
> +         Say Y or m here if you want to support the MT8196 SoC in your k=
ernel
> +         build.
> +
>  config ZYNQMP_IPI_MBOX
>         tristate "Xilinx ZynqMP IPI Mailbox"
>         depends on ARCH_ZYNQMP && OF
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 98a68f838486eed117d24296138bf59fda3f92e4..564d06e71313e6d1972e4a603=
6e1e78c8c7ec450 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)   +=3D mtk-adsp-mailbox.o
>
>  obj-$(CONFIG_MTK_CMDQ_MBOX)    +=3D mtk-cmdq-mailbox.o
>
> +obj-$(CONFIG_MTK_GPUEB_MBOX)   +=3D mtk-gpueb-mailbox.o
> +
>  obj-$(CONFIG_ZYNQMP_IPI_MBOX)  +=3D zynqmp-ipi-mailbox.o
>
>  obj-$(CONFIG_SUN6I_MSGBOX)     +=3D sun6i-msgbox.o
> diff --git a/drivers/mailbox/mtk-gpueb-mailbox.c b/drivers/mailbox/mtk-gp=
ueb-mailbox.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0236fb358136e434a09a21ef2=
93fe949ced94123
> --- /dev/null
> +++ b/drivers/mailbox/mtk-gpueb-mailbox.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MediaTek GPUEB mailbox driver for SoCs such as the MT8196
> + *
> + * Copyright (C) 2025, Collabora Ltd.
> + *
> + * Developers harmed in the making of this driver:
> + *  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define MBOX_CTL_TX_STS 0x0000
> +#define MBOX_CTL_IRQ_SET 0x0004
> +#define MBOX_CTL_IRQ_CLR 0x0074
> +#define MBOX_CTL_RX_STS 0x0078
> +
> +#define MBOX_FULL BIT(0) /* i.e. we've received data */
> +#define MBOX_CLOGGED BIT(1) /* i.e. the channel is shutdown */
> +
> +struct mtk_gpueb_mbox {
> +       struct device *dev;
> +       struct clk *clk;
> +       void __iomem *mbox_mmio;
> +       void __iomem *mbox_ctl;
> +       void **rx_buf;
> +       atomic_t *rx_status;
> +       struct mbox_controller mbox;
> +       unsigned int *chn;
> +       int irq;
> +       const struct mtk_gpueb_mbox_variant *v;
> +};
> +
> +struct mtk_gpueb_mbox_ch {
> +       const char *name;
> +       const int num;
> +       const unsigned int tx_offset;
> +       const unsigned int tx_len;
> +       const unsigned int rx_offset;
> +       const unsigned int rx_len;
> +       const bool no_response;
> +};
> +
> +struct mtk_gpueb_mbox_variant {
> +       unsigned int num_channels;
> +       const struct mtk_gpueb_mbox_ch channels[] __counted_by(num_channe=
ls);
> +};
> +
> +/**
> + * mtk_gpueb_mbox_read_rx - read RX buffer from MMIO into ebm's RX buffe=
r
> + * @ebm: pointer to &struct mtk_gpueb_mbox instance
> + * @channel: number of channel to read
> + */
> +static void mtk_gpueb_mbox_read_rx(struct mtk_gpueb_mbox *ebm,
> +                                  unsigned int channel)
> +{
> +       const struct mtk_gpueb_mbox_ch *ch;
> +
> +       ch =3D &ebm->v->channels[channel];
> +
> +       memcpy_fromio(ebm->rx_buf[channel], ebm->mbox_mmio + ch->rx_offse=
t,
> +                     ch->rx_len);
> +
> +}
> +
> +static irqreturn_t mtk_gpueb_mbox_isr(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D data;
> +       u32 rx_handled =3D 0;
> +       u32 rx_sts;
> +       int i;
> +
> +       rx_sts =3D readl(ebm->mbox_ctl + MBOX_CTL_RX_STS);
> +
> +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> +               if (rx_sts & BIT(i)) {
> +                       if (!atomic_cmpxchg(&ebm->rx_status[i], 0,
> +                                           MBOX_FULL | MBOX_CLOGGED))
> +                               rx_handled |=3D BIT(i);
> +               }
> +       }
We can loop over bits that are set in rx_sts, if we expect that only a
few bits are set most of the time.

> +
> +       writel(rx_handled, ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> +
> +       if (!(rx_sts ^ rx_handled))
"rx_sts =3D=3D rx_handled" should be more direct.
> +               return IRQ_WAKE_THREAD;
> +
> +       dev_warn_ratelimited(ebm->dev, "spurious interrupts on 0x%04X\n",
> +                            rx_sts ^ rx_handled);
> +       return IRQ_NONE;
It seems a bit too punishing when there are spurious interrupts. I
wonder if we should warn, but return IRQ_WAKE_THREAD as long as
rx_handled !=3D 0.

Also, if another interrupt can fire before mtk_gpueb_mbox_thread runs,
that's data dropping rather than spurious interrupts.

> +}
> +
> +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D data;
> +       irqreturn_t ret =3D IRQ_NONE;
> +       int status;
> +       int i;
> +
> +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> +               status =3D atomic_cmpxchg(&ebm->rx_status[i],
> +                                       MBOX_FULL | MBOX_CLOGGED, MBOX_FU=
LL);
> +               if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
We could also save rx_handled from mtk_gpueb_mbox_isr and loop over
bits that are set.  If we do that, ebm->rx_status[i] is guaranteed to
be MBOX_FULL | MBOX_CLOGGED.

> +                       mtk_gpueb_mbox_read_rx(ebm, i);
> +                       mbox_chan_received_data(&ebm->mbox.chans[i],
> +                                               ebm->rx_buf[i]);
It looks like we read the data and pass it on to the client
immediately. Does each channel need its own rx_buf?

> +                       /* FIXME: When does MBOX_FULL get cleared? Here? =
*/
> +                       atomic_set(&ebm->rx_status[i], 0);
> +                       ret =3D IRQ_HANDLED;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->dev);
> +       unsigned int *num =3D chan->con_priv;
> +       int i;
> +       u32 *values =3D data;
> +
> +       if (*num >=3D ebm->v->num_channels)
> +               return -ECHRNG;
Can this ever happen? (I am not familiar with the mbox subsystem)

> +
> +       if (!ebm->v->channels[*num].no_response &&
> +           atomic_read(&ebm->rx_status[*num]))
> +               return -EBUSY;
When no_response is true, rx_status is 0. We probably don't need to
check no_response.

> +
> +       writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> +
> +       /*
> +        * We don't want any fancy nonsense, just write the 32-bit values=
 in
> +        * order. memcpy_toio/__iowrite32_copy don't work here, because f=
ancy.
> +        */
> +       for (i =3D 0; i < ebm->v->channels[*num].tx_len; i +=3D 4) {
> +               writel(values[i / 4],
> +                      ebm->mbox_mmio + ebm->v->channels[*num].tx_offset =
+ i);
> +       }
> +
> +       writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> +
> +       return 0;
> +}
> +
> +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->dev);
> +       unsigned int *num =3D chan->con_priv;
> +
> +       if (*num >=3D ebm->v->num_channels)
> +               return -ECHRNG;
> +
> +       atomic_set(&ebm->rx_status[*num], 0);
> +
> +       return 0;
> +}
> +
> +static void mtk_gpueb_mbox_shutdown(struct mbox_chan *chan)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->dev);
> +       unsigned int *num =3D chan->con_priv;
> +
> +       atomic_set(&ebm->rx_status[*num], MBOX_CLOGGED);
> +}
> +
> +static bool mtk_gpueb_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(chan->mbox->dev);
> +       unsigned int *num =3D chan->con_priv;
> +
> +       return !(readl(ebm->mbox_ctl + MBOX_CTL_TX_STS) & BIT(*num));
> +}
> +
> +const struct mbox_chan_ops mtk_gpueb_mbox_ops =3D {
> +       .send_data =3D mtk_gpueb_mbox_send_data,
> +       .startup =3D mtk_gpueb_mbox_startup,
> +       .shutdown =3D mtk_gpueb_mbox_shutdown,
> +       .last_tx_done =3D mtk_gpueb_mbox_last_tx_done,
> +};
> +
> +static struct mbox_chan *
> +mtk_gpueb_mbox_of_xlate(struct mbox_controller *mbox,
> +                       const struct of_phandle_args *sp)
> +{
> +       struct mtk_gpueb_mbox *ebm =3D dev_get_drvdata(mbox->dev);
> +
> +       if (!sp->args_count)
> +               return ERR_PTR(-EINVAL);
> +
> +       if (sp->args[0] >=3D ebm->v->num_channels)
> +               return ERR_PTR(-ECHRNG);
> +
> +       return &mbox->chans[sp->args[0]];
> +}
> +
> +static int mtk_gpueb_mbox_probe(struct platform_device *pdev)
> +{
> +       struct mtk_gpueb_mbox *ebm;
> +       unsigned int rx_buf_sz;
> +       void *buf;
> +       unsigned int i;
> +       int ret;
> +
> +       ebm =3D devm_kzalloc(&pdev->dev, sizeof(*ebm), GFP_KERNEL);
> +       if (!ebm)
> +               return -ENOMEM;
> +
> +       ebm->dev =3D &pdev->dev;
> +       ebm->v =3D of_device_get_match_data(ebm->dev);
> +
> +       dev_set_drvdata(ebm->dev, ebm);
> +
> +       ebm->clk =3D devm_clk_get_enabled(ebm->dev, NULL);
> +       if (IS_ERR(ebm->clk))
> +               return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
> +                                    "Failed to get 'eb' clock\n");
> +
> +       ebm->mbox_mmio =3D devm_platform_ioremap_resource_byname(pdev, "m=
box");
> +       if (IS_ERR(ebm->mbox_mmio))
> +               return dev_err_probe(ebm->dev, PTR_ERR(ebm->mbox_mmio),
> +                                    "Couldn't map mailbox registers\n");
> +
> +       ebm->mbox_ctl =3D devm_platform_ioremap_resource_byname(pdev, "mb=
ox_ctl");
> +       if (IS_ERR(ebm->mbox_ctl))
> +               return dev_err_probe(
> +                       ebm->dev, PTR_ERR(ebm->mbox_ctl),
> +                       "Couldn't map mailbox control registers\n");
> +
> +       rx_buf_sz =3D (ebm->v->channels[ebm->v->num_channels - 1].rx_offs=
et +
> +                    ebm->v->channels[ebm->v->num_channels - 1].rx_len);
rx is after tx in mmio. The first half of the space is wasted.

We follow mtk_gpueb_mbox_read_rx by mbox_chan_received_data. It seems
we only need max of rx_len's.

> +
> +       buf =3D devm_kzalloc(ebm->dev, rx_buf_sz, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ebm->rx_buf =3D devm_kmalloc_array(ebm->dev, ebm->v->num_channels=
,
> +                                        sizeof(*ebm->rx_buf), GFP_KERNEL=
);
> +       if (!ebm->rx_buf)
> +               return -ENOMEM;
> +
> +       ebm->mbox.chans =3D devm_kcalloc(ebm->dev, ebm->v->num_channels,
> +                                      sizeof(struct mbox_chan), GFP_KERN=
EL);
> +       if (!ebm->mbox.chans)
> +               return -ENOMEM;
> +
> +       ebm->rx_status =3D devm_kcalloc(ebm->dev, ebm->v->num_channels,
> +                                     sizeof(atomic_t), GFP_KERNEL);
> +       if (!ebm->rx_status)
> +               return -ENOMEM;
> +
> +       ebm->chn =3D devm_kcalloc(ebm->dev, ebm->v->num_channels,
> +                               sizeof(*ebm->chn), GFP_KERNEL);
> +
> +       for (i =3D 0; i < ebm->v->num_channels; i++) {
> +               ebm->rx_buf[i] =3D buf + ebm->v->channels[i].rx_offset;
> +               spin_lock_init(&ebm->mbox.chans[i].lock);
> +               /* the things you do to avoid explicit casting void* */
I actually prefer an inline helper that casts chan->con_priv to the
channel number. Another option is "chan - ebm->mox.chans".
> +               ebm->chn[i] =3D i;
> +               ebm->mbox.chans[i].con_priv =3D &ebm->chn[i];
> +               atomic_set(&ebm->rx_status[i], MBOX_CLOGGED);
> +       }
> +
> +       ebm->mbox.dev =3D ebm->dev;
> +       ebm->mbox.num_chans =3D ebm->v->num_channels;
> +       ebm->mbox.txdone_poll =3D true;
> +       ebm->mbox.txpoll_period =3D 0; /* minimum hrtimer interval */
> +       ebm->mbox.of_xlate =3D mtk_gpueb_mbox_of_xlate;
> +       ebm->mbox.ops =3D &mtk_gpueb_mbox_ops;
> +
> +       ebm->irq =3D platform_get_irq(pdev, 0);
> +       if (ebm->irq < 0)
> +               return ebm->irq;
> +
> +       ret =3D devm_request_threaded_irq(ebm->dev, ebm->irq, mtk_gpueb_m=
box_isr,
> +                                       mtk_gpueb_mbox_thread, 0, NULL, e=
bm);
> +       if (ret)
> +               return dev_err_probe(ebm->dev, ret, "failed to request IR=
Q\n");
> +
> +       ret =3D devm_mbox_controller_register(ebm->dev, &ebm->mbox);
> +
> +       return 0;
> +}
> +
> +static const struct mtk_gpueb_mbox_variant mtk_gpueb_mbox_mt8196 =3D {
> +       .num_channels =3D 12,
> +       .channels =3D {
> +               { "fast_dvfs_event", 0, 0x0000, 16, 0x00e0, 16, false },
> +               { "gpufreq",         1, 0x0010, 32, 0x00f0, 32, false },
> +               { "sleep",           2, 0x0030, 12, 0x0110,  4, true  },
> +               { "timer",           3, 0x003c, 24, 0x0114,  4, false },
> +               { "fhctl",           4, 0x0054, 36, 0x0118,  4, false },
> +               { "ccf",             5, 0x0078, 16, 0x011c, 16, false },
> +               { "gpumpu",          6, 0x0088, 24, 0x012c,  4, false },
> +               { "fast_dvfs",       7, 0x00a0, 24, 0x0130, 24, false },
> +               { "ipir_c_met",      8, 0x00b8,  4, 0x0148, 16, false },
> +               { "ipis_c_met",      9, 0x00bc, 16, 0x0158,  4, false },
> +               { "brisket",        10, 0x00cc, 16, 0x015c, 16, false },
> +               { "ppb",            11, 0x00dc,  4, 0x016c,  4, false },
> +       },
> +};
> +
> +static const struct of_device_id mtk_gpueb_mbox_of_ids[] =3D {
> +       { .compatible =3D "mediatek,mt8196-gpueb-mbox",
> +         .data =3D &mtk_gpueb_mbox_mt8196 },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_gpueb_mbox_of_ids);
> +
> +static struct platform_driver mtk_gpueb_mbox_drv =3D {
> +       .probe =3D mtk_gpueb_mbox_probe,
> +       .driver =3D {
> +               .name =3D "mtk-gpueb-mbox",
> +               .of_match_table =3D mtk_gpueb_mbox_of_ids,
> +       }
> +};
> +module_platform_driver(mtk_gpueb_mbox_drv);
> +
> +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
> +MODULE_DESCRIPTION("MediaTek GPUEB mailbox driver for SoCs such as the M=
T8196");
> +MODULE_LICENSE("GPL");
>
> --
> 2.51.0
>

