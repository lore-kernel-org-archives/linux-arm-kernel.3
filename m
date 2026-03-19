Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A071090237
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9IV3pBn5WR9OH8LIvrhT0vOLSuf2+qShNRhV5Iw0pI=; b=JvhgK3musGew2Q5iJyrfk/e7Gf
	f27jW/R3w3e//Ri0QdFKBEmbW77GAFEtAj+BNyoDrBiLm6pTvRmdE8edea4LaB9voi3FnPW03YPGX
	HnH+iHnoMZHzOrUhblixc6QcxqUob7BR74IrjfROtnZKXDw7iiauvI5uM+ABqAjLZ5tsMrFtyAm4k
	qbLst2yrUlwbzGSjP/Mhpod/sYYNn0vei4ZJ+HvtnU9+j9LLv9JePM6QeKv+OTKvY3TR9Lf4WscSU
	gguDmtNgpKGtTrHLZSU3JSmgmnIg6uL9FiP20nbi3h2R7B5r4VYAUu+kDLhZIjtdXYwM6ZVdMSOqM
	L7ze5H2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EaP-0000000ApB9-3YAP;
	Thu, 19 Mar 2026 14:42:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EaO-0000000ApB0-2T78
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 14:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P9IV3pBn5WR9OH8LIvrhT0vOLSuf2+qShNRhV5Iw0pI=; b=iGXizaLzpVOZFRhubAXPv49/8W
	1YwCtYLD6sn8tViFyOQ/94pNBZ66TI5SaKjYomWYjzvZagSdWyQieSq9/Gs/6oRLd+tfOyGY9O2j+
	AFGs85CHm8dFGBDxc3T+FAXMuJKftUEoWNGO+sym6zKtpnRrBDERWf29dVUqtDQYMX+cEXT3Tapxf
	JWQ98b8vqsbybR+AJOhU5BQT6wIbvMKPwEB15PYBX4HrmrdWu7QssA+C9Tb6TL+r8r0Wy7ZjRqYkW
	nzd8o9iHkfNzZecIA9c4XZBKhc1kHww+v3bWdLD6rHFj3asMfl+WeEoajwaPjQ72YvQwGE0WYKCUg
	jyoXGlwA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EaL-0000000DjAt-0xIY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:42:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w3EaB-0000ga-PD; Thu, 19 Mar 2026 15:42:43 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w3EaB-0015no-0w;
	Thu, 19 Mar 2026 15:42:43 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DC6AB5085C9;
	Thu, 19 Mar 2026 14:42:42 +0000 (UTC)
Date: Thu, 19 Mar 2026 15:42:42 +0100
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
Subject: Re: [PATCH v2 0/5] can: flexcan: Add NXP S32N79 SoC support
Message-ID: <20260319-asparagus-taipan-of-sufficiency-fcf4de-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260319094032.427697-1-ciprianmarian.costea@oss.nxp.com>
 <20260319-orca-of-legal-science-88e67d-mkl@pengutronix.de>
 <742c748b-8096-49a3-b1a4-3a8507f6f55d@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2iosansca2ri4jm"
Content-Disposition: inline
In-Reply-To: <742c748b-8096-49a3-b1a4-3a8507f6f55d@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_144253_314985_849B53A7 
X-CRM114-Status: GOOD (  24.29  )
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


--x2iosansca2ri4jm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] can: flexcan: Add NXP S32N79 SoC support
MIME-Version: 1.0

On 19.03.2026 16:14:46, Ciprian Marian Costea wrote:
> > Please also have a look at the AI review:
> >
> > https://sashiko.dev/#/patchset/20260318092215.23505-1-ciprianmarian.cos=
tea%40oss.nxp.com
> >
> > Especially on patch#3.
> >
> > I think we should split the main IRQ handler into 3 parts, message buff,
> > bus error and state change.

> Thanks for pointing to the AI review.
>
> It raises two concerns:
>
> 1. Duplicate event processing (can be addressed by splitting the handler
> as you've suggested).
>
> This is a pre-existing issue affecting S32G2 (NR_IRQ_3 with 4 IRQ lines
> to the same handler) and MCF5441X (3 IRQ lines on the same handler).
> I'll include this as a preparatory patch in the next version of the serie=
s.

Thanks. Until the S32G2 was added multiple IRQ handlers was a niche
problem. But now it's relevant.

> 2. Concurrent skb_irq_queue access (pre-existing, separate scope)
>
> The __skb_queue_add_sort() calls on offload->skb_irq_queue are lockless.
> When the mb and esr handlers run concurrently on different CPUs, both
> can manipulate the list simultaneously.
> This is a valid concern, but it's also pre-existing.
>
> The fix requires changes in CAN core's rx-offload.c rather than in
> flexcan, so I think it would be better handled in a separate series.
>
> Would you agree ?

ACK

One option is to make struct can_rx_offload::skb_irq_queue per CPU.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--x2iosansca2ri4jm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCabwLYAAKCRDMOmT6rpmt
0nL/AP4hauOOQHt8J4Raz4k3XL6AkFpJksPkVshPoYgYCYYbHwEA/m2fRk+vD+FQ
N4xipgWJpMlSE+VrRksDVTDxb+1Acw4=
=/RY/
-----END PGP SIGNATURE-----

--x2iosansca2ri4jm--

