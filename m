Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09199F51415
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgyznw0osakjqMVPwpk+kZfcdwhRlnKh/U8T+sscVp4=; b=1pJ06l3xQNi5vs3KitRLKfA4R2
	XTDepU7cziiWE+jd6+x7B8mt/dyaDxn3bC0hi9SP6IkaqYNkO+OQM6CebHVyy4pKLOSprz85gGrzQ
	pYdTRtYl3+51kIe5FnmzGpeyUU53ajIqaiUXWkte9CbuhccAkja8WViyi5RzLgMS+0/tjWeXEmpND
	Jw/miXzYDqhkg6x0gM6XLqubbGv8RZRAMBwp2PxHO1FJgZXbTJMc8HmGMfW/HqFnl+U3IBppPi7rQ
	uX0oxD9Iw3VTS/qQo28ilox6/2r02UA7bE+ClcXHCGxaJhX8Wm4opRIEAtYbbQoFcXxwewhrJ5CgA
	I5FOOyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEm-000000037bI-3ew6;
	Fri, 06 Mar 2026 07:04:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEk-000000037Zv-1eYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vyPEe-00022D-1i; Fri, 06 Mar 2026 08:04:32 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vyPEc-0040s5-1A;
	Fri, 06 Mar 2026 08:04:31 +0100
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4B5584F9179;
	Fri, 06 Mar 2026 07:04:30 +0000 (UTC)
Date: Fri, 6 Mar 2026 08:04:28 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, gustavoars@kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20260306-capable-gainful-goose-e94f08-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260306044536.149204-1-rosenp@gmail.com>
 <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
 <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2uzw3kkivjpbaqyp"
Content-Disposition: inline
In-Reply-To: <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230438_435101_9420AB0C 
X-CRM114-Status: GOOD (  15.31  )
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


--2uzw3kkivjpbaqyp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
MIME-Version: 1.0

On 05.03.2026 22:59:13, Rosen Penev wrote:
> On Thu, Mar 5, 2026 at 10:56=E2=80=AFPM Marc Kleine-Budde <mkl@pengutroni=
x.de> wrote:
> >
> > On 05.03.2026 20:45:36, Rosen Penev wrote:
> > > Use a flexible arraay member to combine allocations.
> > >
> > > It looks like pipes never gets freed anywhere. Meaning this effective=
ly
> > > fixes a memory leak.
> >
> > It's a devm_kzalloc(), which means it's automatically free()ed after the
> > remove callback.
> Yes but pipes does not use devm.

Doh! Sorry, I should not review patches before first tee in the morning.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2uzw3kkivjpbaqyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaap8eQAKCRDMOmT6rpmt
0ui3APwJONlYYblrkwwoXFicyuw4HjAIX8KM4u1R9jFdyY/UVgEA5LhVNXfqicvS
mQPUC7n3xnNDIGl7fSPAREPtn970hwI=
=Jzjd
-----END PGP SIGNATURE-----

--2uzw3kkivjpbaqyp--

