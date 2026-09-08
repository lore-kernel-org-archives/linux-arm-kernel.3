Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A9C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTLgYKKYKXTmUouDqQirSDq61MXeCmirukVzdyfDTKw=; b=T+0S5URdZHz1yXmwiLJd13YYH9
	7npYRAjL5zUQGBAbmpfloFrWj3JKVBWF9HFvY1EfmlxwWd+FSfw40H08NrhGCjr8S7PfLV0F/ZUSC
	+zB97kL3cnSoE1qMs0SQWIm9/ppkL3JXgHLZTw4IEZhvayVimDlRPBWHzD0pK3cy9YXLsEUStxXyF
	fi25Q8zFHxH37eYNULTy6jIObJ/cmlyI1R7qDlyYpSjGdheuwtzYGi30pNJviks5sFBGK4xdFMJnR
	gRkjJTeTwYb8HWY4gJ/vUcKIlM2pdwKGbeK/hpLYRoPmgQlBmhp2KFjjEjOeCuo6dLVACrPh3APwT
	MxCJcClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rey-00000008UCt-2U1N;
	Tue, 08 Sep 2026 08:58:32 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3reu-00000008UCG-2R9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:58:30 +0000
X-PTX-Original-Recipient: alexandre.belloni@bootlin.com
X-PTX-Original-Recipient: mailhol@kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: imx@lists.linux.dev
X-PTX-Original-Recipient: nicolas.ferre@microchip.com
X-PTX-Original-Recipient: s32@nxp.com
X-PTX-Original-Recipient: ciprianmarian.costea@oss.nxp.com
X-PTX-Original-Recipient: claudiu.beznea@tuxon.dev
X-PTX-Original-Recipient: dev.kurt@vandijck-laurijssen.be
X-PTX-Original-Recipient: linux-can@vger.kernel.org
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C9AEA20177F;
	Tue, 08 Sep 2026 10:58:26 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1x3res-000gXD-2J;
	Tue, 08 Sep 2026 10:58:26 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 616925972E3;
	Tue, 08 Sep 2026 08:58:26 +0000 (UTC)
Date: Tue, 8 Sep 2026 10:58:25 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>, 
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v5 0/3] can_rx_offload keeps a lockless irq_queue that
 the IRQ handlers fill and that is later spliced under skb_queue.lock into
 the NAPI-facing skb_queue. This works as long as a single context fills the
 irq_queue. flexcan with FLEXCAN_QUIRK_SECONDARY_MB_IRQ and mcf5441x use two
 mailbox IRQ lines. When those are affined to different CPUs the two handlers
 can enqueue into the same list at the same time and corrupt it.
Message-ID: <20260908-defiant-mauve-woodpecker-0e0f62-mkl@pengutronix.de>
References: <20260907104942.17089-1-ciprianmarian.costea@oss.nxp.com>
 <20260907-lively-easygoing-groundhog-51cdd3-mkl@pengutronix.de>
 <6bdc8044-34de-4d7a-89a5-908de7f8b044@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2x5jigtab6tpbqlb"
Content-Disposition: inline
In-Reply-To: <6bdc8044-34de-4d7a-89a5-908de7f8b044@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_015828_937677_5CC4F11D 
X-CRM114-Status: GOOD (  25.28  )
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


--2x5jigtab6tpbqlb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/3] can_rx_offload keeps a lockless irq_queue that
 the IRQ handlers fill and that is later spliced under skb_queue.lock into
 the NAPI-facing skb_queue. This works as long as a single context fills the
 irq_queue. flexcan with FLEXCAN_QUIRK_SECONDARY_MB_IRQ and mcf5441x use two
 mailbox IRQ lines. When those are affined to different CPUs the two handlers
 can enqueue into the same list at the same time and corrupt it.
MIME-Version: 1.0


FYI: somehow the series description ended up in the subject

On 07.09.2026 18:07:42, Ciprian Marian Costea wrote:
> On 9/7/2026 4:49 PM, Marc Kleine-Budde wrote:
> > On 07.09.2026 12:49:39, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > >
> > > This series:
> > >    1. Makes the irq_queue per-CPU so the handlers no longer share a l=
ist.
> >
> > As sashiko pointed out, using per-CPU variables in a preemptible context
> > doesn't work. When proposing to use per-CPU variables I haven't thought
> > that far. So in hindsight this approach is not good.
> >
> > What about following what NAPI does. Have a dedicated data structure per
> > IRQ. I think these ones are needed:
> >
> > | 	struct sk_buff_head skb_irq_queue;
> > | 	u32 skb_queue_len_max;
> > |
> > | 	unsigned int mb_first;
> > | 	unsigned int mb_last;
> >
> > And pass them to can_rx_offload_queue_timestamp() and
> > can_rx_offload_irq_finish().

If the RX-Offload knows the number of concurrent IRQs, you can optimize
for the single IRQ case and keep skb_queue_splice_tail_init(), while for
the other case you should sort the skbs into the offload->skb_queue
list.

> Thanks for replying.
> Indeed the per-CPU approach should be dropped. I've also missed the
> PREEMPT_RT case.
> Your proposal seems better than even having a dedicated spinlock for
> skb_irq_queue operations as I've originally thought.
>
> One thing to confirm before I go ahead and implement this approach for V6:
> Having the following connected patchset in mind [1] which separates the I=
RQ
> handlers, both flexcan MB IRQs currently run flexcan_do_mb() over the full
> iflag. Therefore, to actually separate the producers I'll have each IRQ
> drain only its own mb_first..mb_last range into its own queue - is this t=
he
> right approach ?

Yes!

Please look out for shared ressources (read-modify-write registers,
etc..) when accessing the mailboxes concurrently from 2 (or more) IRQs.
After a quick look I haven't found any.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2x5jigtab6tpbqlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCap/OLwAKCRDMOmT6rpmt
0gC+AP0XJdF0jo1CfnOQqWOPjOdZRSTRYgJxQ/iIjLgdE84A3wEAyf2YhGx0Gr5s
CMrG0nCwwLxVzMmHBw9CJ51rtQbPXAQ=
=hr1P
-----END PGP SIGNATURE-----

--2x5jigtab6tpbqlb--

