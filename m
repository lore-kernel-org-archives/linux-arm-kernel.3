Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E818CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=; b=SWw0uIbEDxq1pG4tAdgtPM4Vii
	gxS+Uoe9k2UaSL+5eXraCTD/8nPDotct2LBCN10ISUkoz0+UJoYPd+YgCMI/AEn/e5tzzPrRvEtMs
	97t+Dj5u4PoQEfGAq7d2z5Gp7QWmAWZt/r4Gf131t/t/0JOh6ia+uUji+8FMy9rV/+KVgqjp0XmZL
	Ro6jrz9/3WiMNBQoPMfPeIw5LSBSsYlNp79bw/NY1/9i1jQ9h9++J3w1U6E9SQ1+DHC1uqkjsy9Jr
	P/YQJ+NhruFxVO8SZat+hZSDZcgkZR6pWoKCr2HKx5v7diOv1AGbIEcxzGNVVYHJqGeBhg2TDC4FH
	vSV2M55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiUW-0000000Elqb-26tO;
	Wed, 03 Jun 2026 10:06:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiUU-0000000ElqB-05Hi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780481183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
	b=fued36QNRzTlg/MwRElUOdBJwiDz3Jz7idTiVpOfj+hbuKUvFyBOLAOM69LiBBrfZYoWRZ
	0z47mZms42vu+BzmBFnu99Xk5m7ECouMnI2m81hgsoG87P+ycEcLX3U6EVZXuSECh+oh2o
	nWGk+p09n3pAdjaMy4qeN/dVboAJFSo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-0yijrsw_N72fgDrGUbZ_Sw-1; Wed, 03 Jun 2026 06:06:19 -0400
X-MC-Unique: 0yijrsw_N72fgDrGUbZ_Sw-1
X-Mimecast-MFC-AGG-ID: 0yijrsw_N72fgDrGUbZ_Sw_1780481178
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39677639ef6so2577641fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481178; x=1781085978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
        b=DGN722sM3654CZL3+IITdrLwJS6PKeTgen1DuiGc3PJHNQz8evuVAGmdyEfVj8J52T
         3KPRfeSMox+uSMfylgrnurvp6Wi0xcxSaU1LDAUigMJcfOR1d2ySedlvvlMV1ZFLSaKL
         9ueR7I6Tt47WLB450l95IP694suSGTIyWUh7RqHVOYGPeexztoWC2QsCch+MaZdjSxWC
         tZDmRJJWO31zl+g8DGb5BxulYDNP6PUv0O2ICD25EVZ9hjpkqtTtT+x97KE7N3M4aQ49
         p6+K4ocrO+zMb529XJuBGHAgRc+kryLgJedbrV7MSZib7V0N/bSVOB6jNHFwOZ6zMDz2
         L5kw==
X-Forwarded-Encrypted: i=1; AFNElJ8IVaGnD9311kR2lln06TWNkptnkkLm/jOgAq7i69QNTP67/qAyQgUBj9MA7pa5HRVNFEC7T0LLfK9ucin+xFdd@lists.infradead.org
X-Gm-Message-State: AOJu0YyVD8quJz0V/YWWiSYK76OqUbU4/tYRhy17faX2KO0G1NGKihIp
	fqjPf6UoRlTfO2BX1AYlEzVn6tViO0PmbbAe2xyde6PDxGw/CDeqKz1sKHBE7P4bqolhsU8Drcq
	ItOi+GXPy5yyKSyHBKSQd2VFSYyNZBHikEGNiSUI96ugqAjMxWyDNXQpxGDwLyYdlkj4iNF5E1p
	m/4HDru0iKKs8yFxIzq47San6nzC31GvGdAg5MNl+ChgrLxd2Rb34=
X-Gm-Gg: Acq92OG+UTY1TRhN6hsCV/d7nNtaw5DiA3xkmujYAELUC7wIJdfn+FDzyapNHtwjigW
	EFQWOq6EDURhAQFF43CMATDhHCLRmmyRTfmQTXZu2REd+cXqtsxu3hm4rmp4mTUGtuKaKs/4rGP
	XeL3wb1HKstSQ2o/oiL/VooqvrfUM6rDathKw/3hGBqiDvcNZRDVd10e2gLW4Vtysk212ljcyxg
	Y73fLWHrFpNrIaK
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id 38308e7fff4ca-396ac1f9945mr3945691fa.2.1780481178021;
        Wed, 03 Jun 2026 03:06:18 -0700 (PDT)
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id
 38308e7fff4ca-396ac1f9945mr3945461fa.2.1780481177385; Wed, 03 Jun 2026
 03:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com> <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 3 Jun 2026 12:06:05 +0200
X-Gm-Features: AVHnY4LQCfd00tH5rxiK5efFUUkj2NKbx685IUyczLcBMy4pwr5STR5N8-L7DP8
Message-ID: <CALE0LRvQfsD7MZ2To5S1Yh90pVNKvqNWy=FGpXuGcPa1yEZSkA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/8] can: flexcan: use dedicated IRQ handlers
 for multi-IRQ platforms
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pOikaoyS-XzG2IJhH6txQpwqR-JKCJ10e0u2RKWxmqE_1780481178
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_030626_138211_F8F7DA8E 
X-CRM114-Status: GOOD (  30.48  )
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

Hi Ciprian,

Thank you for the patch series.

On Wed, Jun 3, 2026 at 9:14=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On platforms with multiple IRQ lines (S32G2, MCF5441X), all lines are
> registered to the same flexcan_irq() handler. Since these are distinct IR=
Q
> numbers, they can be dispatched concurrently on different CPUs. Both
> instances then read the same iflag and ESR registers unconditionally,
> leading to duplicate frame processing.
>
> Fix this by splitting the monolithic handler into focused parts:
> - flexcan_do_mb(): processes mailbox events
> - flexcan_do_state(): processes device state change events
> - flexcan_do_berr(): processes bus error events
>
> Introduce dedicated IRQ handlers for multi-IRQ platforms:
> - flexcan_irq_mb(): mailbox-only, used for mb-0, mb-1 IRQ lines
> - flexcan_irq_boff(): state-change-only, used for boff/state IRQ line
> - flexcan_irq_berr(): bus-error-only, used for berr IRQ line
>
> The combined flexcan_irq() handler is preserved for single-IRQ
> platforms with no functional change.
>
> Fixes: d9cead75b1c6 ("can: flexcan: add mcf5441x support")
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Adding here because it doesn't seem to have a cover letter. With the
full series applied on top of the current mainline

Tested-by: Enric Balletbo i Serra <eballetb@.redhat.com>

Tested on the NXP S32G399A-RDB3 with loopback and high-rate traffic.
No regressions observed: CAN frames transmit and receive correctly,
with no duplicates.
Frame reception showed no errors under stress testing.

Thanks,
   Enric
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 128 +++++++++++++++++++++----
>  1 file changed, 111 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..f73ff442d530 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1070,16 +1070,14 @@ static struct sk_buff *flexcan_mailbox_read(struc=
t can_rx_offload *offload,
>         return skb;
>  }
>
> -static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +/* Process mailbox (RX + TX) events */
> +static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  {
> -       struct net_device *dev =3D dev_id;
>         struct net_device_stats *stats =3D &dev->stats;
>         struct flexcan_priv *priv =3D netdev_priv(dev);
>         struct flexcan_regs __iomem *regs =3D priv->regs;
>         irqreturn_t handled =3D IRQ_NONE;
>         u64 reg_iflag_tx;
> -       u32 reg_esr;
> -       enum can_state last_state =3D priv->can.state;
>
>         /* reception interrupt */
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_USE_RX_MAILBOX) {
> @@ -1131,25 +1129,57 @@ static irqreturn_t flexcan_irq(int irq, void *dev=
_id)
>                 netif_wake_queue(dev);
>         }
>
> +       return handled;
> +}
> +
> +/* Process bus error events */
> +static irqreturn_t flexcan_do_berr(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +
>         reg_esr =3D priv->read(&regs->esr);
>
> -       /* ACK all bus error, state change and wake IRQ sources */
> -       if (reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_WAK_INT)) {
> +       /* ACK bus error interrupt source */
> +       if (reg_esr & FLEXCAN_ESR_ERR_INT) {
>                 handled =3D IRQ_HANDLED;
> -               priv->write(reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_=
WAK_INT), &regs->esr);
> +               priv->write(FLEXCAN_ESR_ERR_INT, &regs->esr);
>         }
>
> -       /* state change interrupt or broken error state quirk fix is enab=
led */
> -       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> -           (priv->devtype_data.quirks & (FLEXCAN_QUIRK_BROKEN_WERR_STATE=
 |
> -                                          FLEXCAN_QUIRK_BROKEN_PERR_STAT=
E)))
> -               flexcan_irq_state(dev, reg_esr);
> -
>         /* bus error IRQ - handle if bus error reporting is activated */
>         if ((reg_esr & FLEXCAN_ESR_ERR_BUS) &&
>             (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING))
>                 flexcan_irq_bus_err(dev, reg_esr);
>
> +       return handled;
> +}
> +
> +/* Process device state change events */
> +static irqreturn_t flexcan_do_state(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +       enum can_state last_state =3D priv->can.state;
> +
> +       reg_esr =3D priv->read(&regs->esr);
> +
> +       /* ACK state change and wake IRQ sources */
> +       if (reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ESR_WAK_INT)) {
> +               handled =3D IRQ_HANDLED;
> +               priv->write(reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ES=
R_WAK_INT),
> +                               &regs->esr);
> +       }
> +
> +       /* state change interrupt or broken error state quirk fix is enab=
led */
> +       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> +           (priv->devtype_data.quirks &
> +           (FLEXCAN_QUIRK_BROKEN_WERR_STATE | FLEXCAN_QUIRK_BROKEN_PERR_=
STATE)))
> +               flexcan_irq_state(dev, reg_esr);
> +
>         /* availability of error interrupt among state transitions in cas=
e
>          * bus error reporting is de-activated and
>          * FLEXCAN_QUIRK_BROKEN_PERR_STATE is enabled:
> @@ -1188,6 +1218,65 @@ static irqreturn_t flexcan_irq(int irq, void *dev_=
id)
>                 }
>         }
>
> +       return handled;
> +}
> +
> +/* Combined IRQ handler for single-IRQ platforms */
> +static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +       handled |=3D flexcan_do_state(dev);
> +       handled |=3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Mailbox IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Bus error IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_berr(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Device state change IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_boff(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_state(dev);
> +
>         if (handled)
>                 can_rx_offload_irq_finish(&priv->offload);
>
> @@ -1761,25 +1850,30 @@ static int flexcan_open(struct net_device *dev)
>
>         can_rx_offload_enable(&priv->offload);
>
> -       err =3D request_irq(dev->irq, flexcan_irq, IRQF_SHARED, dev->name=
, dev);
> +       if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +               err =3D request_irq(dev->irq, flexcan_irq_mb,
> +                                 IRQF_SHARED, dev->name, dev);
> +       else
> +               err =3D request_irq(dev->irq, flexcan_irq,
> +                                 IRQF_SHARED, dev->name, dev);
>         if (err)
>                 goto out_can_rx_offload_disable;
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>                 err =3D request_irq(priv->irq_boff,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_boff, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq;
>
>                 err =3D request_irq(priv->irq_err,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_berr, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq_boff;
>         }
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
>                 err =3D request_irq(priv->irq_secondary_mb,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_mb, IRQF_SHARED, dev->name,=
 dev);
>                 if (err)
>                         goto out_free_irq_err;
>         }
> --
> 2.43.0
>


