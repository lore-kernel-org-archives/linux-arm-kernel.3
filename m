Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9BACE7B08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/17nXbsqCBO75JNOMHvGrj7hogfDIUmj7VsHZy8az0=; b=xN2FYR4SFHghEW3+HD0nF8fwPT
	k9zek8tR8I9l7cP4UxWzstThX8Rl65X3TMVgjohO7ue/57Yzk3xz6v4XuXPW8k9QNDgxQDDamCeyh
	8h52TJbQJa8IH1drgLIO7UMht6HWQENUj2u7xqaadC7ha5+qmwhXrRNihmSjw6XyKXz6MuPUgk8Iu
	r5imSD4MAN/D3JIDwDubqkxorG9JhlbTmiSGF6R5UQJEwpcPJApwFYq0GHmPNKqK7L6/H/5lBybkF
	FCkpbC1qYm6bWyOTyWz/W4WNFf4Hav9Gt3X3//79gZnXi/ZKc1QfA1owYzGhmBpeWEB6GIFKL7qjm
	IyxYDaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtql-0000000CG7d-46MC;
	Fri, 14 Nov 2025 13:28:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtqj-0000000CG6x-0Cmr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:28:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJtqd-0003vN-Jy; Fri, 14 Nov 2025 14:28:19 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJtqd-000Qjk-0l;
	Fri, 14 Nov 2025 14:28:19 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E047049F5B4;
	Fri, 14 Nov 2025 13:28:18 +0000 (UTC)
Date: Fri, 14 Nov 2025 14:28:18 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: zhangqing <zhangqing@rock-chips.com>
Cc: robh@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, cl@rock-chips.com, kernel@pengutronix.de, 
	mailhol.vincent@wanadoo.fr, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 3/3] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20251114-amorphous-guillemot-of-awe-871e2c-mkl@pengutronix.de>
References: <20251113075419.482940-1-zhangqing@rock-chips.com>
 <20251113075419.482940-4-zhangqing@rock-chips.com>
 <20251113-slim-foamy-gecko-2dc389-mkl@pengutronix.de>
 <176d96b4-397c-49d4-8e8e-2f77a5d59c12@rock-chips.com>
 <20251114-utopian-cheerful-otter-33c1d5-mkl@pengutronix.de>
 <3233894e-9409-4b74-a954-0b30064c3c8c@rock-chips.com>
 <20251114-illegal-flounder-of-maturity-edc269-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="entuv2nh3gx4wcbx"
Content-Disposition: inline
In-Reply-To: <20251114-illegal-flounder-of-maturity-edc269-mkl@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_052825_089058_3AC9E090 
X-CRM114-Status: GOOD (  14.01  )
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


--entuv2nh3gx4wcbx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 3/3] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 14.11.2025 14:22:42, Marc Kleine-Budde wrote:
> > For RK3576 SoC, the IC hardware design supports CANFD.
> > However, a license application is required before it can be used; other=
wise,
> > there will be legal risks.
>
> INANL. If an SoC is supplied without a license for the IP cores that you
> want to use in a product you sell, you must purchase a license from
> Bosch:

AFAIK the same applies to the "CTU CAN-FD IP core", which is already mainli=
ne.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--entuv2nh3gx4wcbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkXLm8ACgkQDHRl3/mQ
kZxkWAf/XmdTZDXXJ6DlNXHOIMGMpYO/3VE+v2MkC2G7jqHuFn+mIt3qM1iYwyEr
yWcVqSPUFwZi7GhSX+qTgA8bB4kxF34UL30WS/QDE8HK7gXQ+fBXtJUqeUiAPnIl
8hMiNNEr/78RFISeu21cbB/Xgif+AoPY+V4S6iltsSi21DTaFiZTRtJeIUXWB8Qd
QYdGQaRUFMUX0Q3xpdYFV6de0ZPHj0dFZqULjuPZehvzeVHrcFY5QPxikzw+oD1P
wLfHsFF3aAFqLbgGE965ia9EnwBJl4gM/V78/7Y5adh3JmwXMO4iDEJ6QKgukl8F
gqbegfsz4kkUkunpWLEwhBrGYs057A==
=3CsA
-----END PGP SIGNATURE-----

--entuv2nh3gx4wcbx--

