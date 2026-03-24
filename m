Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97CDE9A777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WW1+bbSskpLBpxjh32yTv4X0dK60BUnteUfl2Lhn0AY=; b=aRoPY33fE/oTKbOclPFYBIA3A8
	JmHDKjuQbcikAb2QLHgcggJ7i54+somROiU/lNGIeY3T9p1k88J1vjmhMwhssW7zo0auHOWH3pGpO
	onAm9ase2wV1G/c2vn/hHlvj2zU32cvInsUARIe1zG5G+eugQREJ4/m7rpdKBoKQEL40yCtju4ewB
	Q4QdWp6UFwvqb8JCgMVeoUyqk1R02aJktfuVtKp4nzgcbU/deWo20wXNtI8rO8c2wQSo6XYcK59rz
	O+JqEp2/msoDJcOuc80gcE+lBlGJ866uvQ1CcO2/v/P8FiJmGqtsuvrdlyAcRVzOuyRJQW/SwTVEI
	9qB5BFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Nc-00000001Kd8-476B;
	Tue, 24 Mar 2026 11:57:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50NZ-00000001KcG-2Hvv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:57:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w50NN-00018O-7O; Tue, 24 Mar 2026 12:56:49 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w50NM-001tEm-2a;
	Tue, 24 Mar 2026 12:56:48 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6A39850B991;
	Tue, 24 Mar 2026 11:56:48 +0000 (UTC)
Date: Tue, 24 Mar 2026 12:56:48 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
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
Message-ID: <20260324-psychedelic-idealistic-dormouse-95b03c-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
 <20260323135827.2129371-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck7uopz7x4wte3gm"
Content-Disposition: inline
In-Reply-To: <20260323135827.2129371-2-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_045701_605149_04926535 
X-CRM114-Status: GOOD (  16.98  )
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


--ck7uopz7x4wte3gm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/6] can: flexcan: use dedicated IRQ handlers for
 multi-IRQ platforms
MIME-Version: 1.0

On 23.03.2026 14:58:22, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On platforms with multiple IRQ lines (S32G2, MCF5441X), all lines are
> registered to the same flexcan_irq() handler. Since these are distinct IRQ
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

Thanks for implementing this.

Can you take care of the S32G2 which has 2 mailbox IRQs, too? Please in
a separate patch.

My idea was to take the "irq" argument of the IRQ handler and the quirks
and figure out if you are the first or second mailbox IRQ handler.

Convert these

| struct flexcan_priv {
| [...]
| 	u64 rx_mask;
| 	u64 tx_mask;
| [...]
| }

into a struct and put an array of 2 of these structs into "struct
flexcan_priv". Use correct mask array depending on IRQ handler.

regards,
Marc

--
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ck7uopz7x4wte3gm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCacJ7/QAKCRDMOmT6rpmt
0nmVAQCsuvizei2v5oCSYMhMLFUmUMY9PygO2GRf3HYs+O3V+gD/XJxknnXu0vah
fU+OKdP8dNkviTfrgYBDkoox8uXOmAs=
=ZrJk
-----END PGP SIGNATURE-----

--ck7uopz7x4wte3gm--

