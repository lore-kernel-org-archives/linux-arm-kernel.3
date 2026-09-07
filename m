Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637A7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oI2gWduqW8IDYlY4DvzsbqijwNEwZlIBGJYKzp2JXCs=; b=ADUE2H2bbQCHSdPaSCwKQRz6zH
	U000cYibUvL3M2pKDyO2SXF86tPw70A4Al0jbUcBkrSJNvTT8QExrpCMXJo30oij8u+uHwHWIxrvs
	jy4xI+PhTDV3YezauZLVm96FiwPlw5hYQuHh9UkdvavSPB+moN72iHFt4avaHtKH3kg7NTBlJ71fV
	zpReG9aSjg6g8HE4Y+Qhm3bXy7GTgAZQBP3UcwlZxgsYRrZ0kBBdSzrtXqVZ6sV8znv1LxHM23B+9
	G3q6QnW1YkLMqLs4UxR1HiVLWnbPOI00taqT7ugKu9uoOWuLKj6kQy59d/FnLBHFVew8DkLDK6e4O
	7NC+v/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zm1-00000006z8R-1o8V;
	Mon, 07 Sep 2026 13:52:37 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zly-00000006z7A-2AVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:52:37 +0000
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
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B59B32018B6;
	Mon, 07 Sep 2026 15:52:26 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1x3Zlq-000Xy5-21;
	Mon, 07 Sep 2026 15:52:26 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C8492596948;
	Mon, 07 Sep 2026 13:49:24 +0000 (UTC)
Date: Mon, 7 Sep 2026 15:49:24 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
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
Message-ID: <20260907-lively-easygoing-groundhog-51cdd3-mkl@pengutronix.de>
References: <20260907104942.17089-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3ydzlstb6mz4j6c"
Content-Disposition: inline
In-Reply-To: <20260907104942.17089-1-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_065234_707618_218B0920 
X-CRM114-Status: GOOD (  13.02  )
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


--z3ydzlstb6mz4j6c
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

On 07.09.2026 12:49:39, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This series:
>   1. Makes the irq_queue per-CPU so the handlers no longer share a list.

As sashiko pointed out, using per-CPU variables in a preemptible context
doesn't work. When proposing to use per-CPU variables I haven't thought
that far. So in hindsight this approach is not good.

What about following what NAPI does. Have a dedicated data structure per
IRQ. I think these ones are needed:

| 	struct sk_buff_head skb_irq_queue;
| 	u32 skb_queue_len_max;
|
| 	unsigned int mb_first;
| 	unsigned int mb_last;

And pass them to can_rx_offload_queue_timestamp() and
can_rx_offload_irq_finish().

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--z3ydzlstb6mz4j6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCap7A4gAKCRDMOmT6rpmt
0tuZAQCogFQ+QoWQNO6hDtuUMx9jES7Eaf1siU6qm8CmFEtYUgEAjL4yL5o2L/jP
fDbWTNDMHBDKnrwVfBb55SMkxq6uAA0=
=gQZJ
-----END PGP SIGNATURE-----

--z3ydzlstb6mz4j6c--

