Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CBF54ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK0ASk5UvoEgARm55wgAnV0lUdTstKarYp2Ne0dL714=; b=kEfzG+yZ3fs8NFYslFz0jDjaRq
	Mp5H1DDBYzpGhni7XzD/tAsrhmWQr/tsKPA3S7jurOT2desQ8s7jXH4AmwdL5wtFXHz08q+dGqZMg
	T/dFIqa8vPjSRTNI6jIFEVVBEieSoDRg33jLFP+FdcVQ0vSLWNfRCD7pkgWnPLASK+h64klf/OJTu
	uGYnDBZz08DiTxuhOHtutYaHyEWurNVhIY601e/9B7VEty0bV2+AIruaGU4Ql18686hGQIo4SX+fy
	0Qvk21yvt9yQT96kmAYEONBe3/Ew2WBiWH4BTVwPDsCkoA0loR2uUZxGS/UQNDPVyH6tPHNzF8ITr
	/gIOtizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525U-00000001ZUg-0Rb6;
	Tue, 24 Mar 2026 13:46:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525R-00000001ZUB-2udG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:46:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w525J-0000zN-Th; Tue, 24 Mar 2026 14:46:17 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w525J-001uDV-1X;
	Tue, 24 Mar 2026 14:46:17 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2235550BAFD;
	Tue, 24 Mar 2026 13:46:17 +0000 (UTC)
Date: Tue, 24 Mar 2026 14:46:16 +0100
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
Subject: Re: [PATCH v3 0/6] can: flexcan: Add NXP S32N79 SoC support
Message-ID: <20260324-visionary-vigilant-alpaca-a492d8-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sfvp3htsx73w2iwa"
Content-Disposition: inline
In-Reply-To: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064625_737865_F28DBA31 
X-CRM114-Status: GOOD (  16.43  )
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


--sfvp3htsx73w2iwa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/6] can: flexcan: Add NXP S32N79 SoC support
MIME-Version: 1.0

On 23.03.2026 14:58:21, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This patch series adds FlexCAN support for the NXP S32N79 SoC.
>
> The S32N79 is an automotive-grade processor from NXP with multiple
> FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> other SoCs in the interrupt routing - it uses two separate interrupt
> lines:
>   - one interrupt for mailboxes 0-127
>   - one interrupt for bus error detection and device state changes

Can you check if the S32N79 suffers from the

| /* No interrupt for error passive */
| #define FLEXCAN_QUIRK_BROKEN_PERR_STATE BIT(6)

problem? Maybe everyone just added the FLEXCAN_QUIRK_BROKEN_PERR_STATE
for the new SoC without actually testing it.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--sfvp3htsx73w2iwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCacKVpgAKCRDMOmT6rpmt
0mvRAP9uJpqL920nvKePwYE/f3MF6bgHAVfPT9leEIrGPeVWrAEAycBuPGzDXtPX
Vo+/Cwt1tfC3N7rC7vFrvinAjPIWBQM=
=makj
-----END PGP SIGNATURE-----

--sfvp3htsx73w2iwa--

