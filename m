Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73015F54AB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1bVGdnYgfiyqJLI9YKk2+00ucqRG9A7jum9N+BWuhw=; b=Ds0CcYiBbqYmrEp5i2JDW28kEn
	FFQUSVupyUbU6qrT867BvcVODKmCU+h5LBJdEkYMyFaTFrN1YqDhBbPmt5N/HM9N5C2lrMh7yt4mo
	QUkHOIy75WGqrHvjxL7iKc7ACu2Hn1Mprnh2DxWXB+R4dnIcb7YP96I/tzWHJ1jjUAQ8CMaJpkItl
	gTO3M5L/IlgWEisxMqPUfvqCqn2Ih1AW4LvIz03hDZIGtpN4L1Rfbu7/cQ/Ja3YN/sCZTCuNcbHS5
	aEtiNyOblYwf7PjyOyVMxvuKiWY0uniAOH3fwGtXWLadPJVZOYabWmYpIzJfpvRvaeGlT0HMrq+8Z
	XjOHAv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w523U-00000001ZEi-2VyB;
	Tue, 24 Mar 2026 13:44:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w523R-00000001ZCX-1QxI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:44:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w523G-0000hg-I8; Tue, 24 Mar 2026 14:44:10 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w523G-001uDG-0K;
	Tue, 24 Mar 2026 14:44:10 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BCA0A50BAF9;
	Tue, 24 Mar 2026 13:44:09 +0000 (UTC)
Date: Tue, 24 Mar 2026 14:44:09 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3 1/6] can: flexcan: use dedicated IRQ handlers for
 multi-IRQ platforms
Message-ID: <20260324-dashing-lush-skink-c194f1-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
 <20260323135827.2129371-2-ciprianmarian.costea@oss.nxp.com>
 <20260324-psychedelic-idealistic-dormouse-95b03c-mkl@pengutronix.de>
 <024316c6-aa33-4561-889c-abd9eeb9d83f@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxywmcxzkmfggb4a"
Content-Disposition: inline
In-Reply-To: <024316c6-aa33-4561-889c-abd9eeb9d83f@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064421_392066_4BACAE5B 
X-CRM114-Status: GOOD (  31.18  )
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


--wxywmcxzkmfggb4a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/6] can: flexcan: use dedicated IRQ handlers for
 multi-IRQ platforms
MIME-Version: 1.0

On 24.03.2026 14:30:50, Ciprian Marian Costea wrote:
> > Can you take care of the S32G2 which has 2 mailbox IRQs, too? Please in
> > a separate patch.
> >
> > My idea was to take the "irq" argument of the IRQ handler and the quirks
> > and figure out if you are the first or second mailbox IRQ handler.
> >
> > Convert these
> >
> > | struct flexcan_priv {
> > | [...]
> > | 	u64 rx_mask;
> > | 	u64 tx_mask;
> > | [...]
> > | }
> >
> > into a struct and put an array of 2 of these structs into "struct
> > flexcan_priv". Use correct mask array depending on IRQ handler.
> >
> > regards,
> > Marc
> >
> > --
> > Pengutronix e.K.                 | Marc Kleine-Budde          |
> > Embedded Linux                   | https://www.pengutronix.de |
> > Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> > Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
>
> Thanks for your review.
> I'll add a separate patch implementing per-MB-IRQ mask handling (needed
> by S32G2) in V4. And thanks for the implementation suggestion. I'll take
> it into account.

Maybe you can come up with a improved/better solution.

With the potential concurrent mailbox IRQ handlers on the s32g we have a
problem with the rx-offload infrastructure. After converting it to
per-CPU lists, we still have to merge the lists to the global one.

The current supported use case is a single IRQ handler that adds all
received CAN frames (and CAN error frames) sorted to the skb_irq_queue
list. At the end of the IRQ handler the list is appended to the
skb_queue and NAPI pushes the CAN frames into the networking stack.

This is done to preserve the order of CAN frames, which is crucial for
some CAN protocols.

If we have 2 IRQ handlers adding the per-cpu skb_irq_queue to the
skb_queue might lead to out-of-order reception.

I see 2 options to workaround this:
- Lock the skb_queue and sort each packet into it.
  This makes the lock longer and
  if an IRQ is delayed old packets might already been processed, so
  out-of-order reception is still possible.
- Disable mailboxes 1...8 for the s32g and only use the 2nd IRQ handler.
  This obviously reduces the number of RX mailboxes, this increases the
  change of RX buffer overflows on systems under high load.
  On the other hand the driver can be extended to use the mailboxes
  64...127.

As I don't have a s32g SoC nor a customer using it, I have no time to
implement this. Maybe you or someone from NXP is willing to do this.

> Now, unrelated to the per-MB-IRQ refactor, one thing I noticed during the
> IRQ handlers split: dev->stats counters (e.g. rx_fifo_errors) can
> be incremented concurrently from different IRQ handlers on different CPUs.
>
> That said, these are just diagnostic counters and lost increments
> should be benign. Do you think this warrants any synchronization/locking
> mechanism, or is the current behavior acceptable?

There are better ways to do stats, but IMHO for now we can live with the
problem.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wxywmcxzkmfggb4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCacKVJwAKCRDMOmT6rpmt
0ny3AP97AOLxQtsjTBYCxlTxLITZgMUMW/Ggdd7EXYi/BhV5ZAD/R+Ywhkah185h
9ybw30y8qx3GHGBTYUiZJdd3yOVQIww=
=JAYU
-----END PGP SIGNATURE-----

--wxywmcxzkmfggb4a--

