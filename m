Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33BF108E1F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFPjz7Etpbiv5bbWzOUYWuNGKVp8Ad08gVTawigku58=; b=RkCq6tJUGayKicalfZ9D4sATG/
	UqJGIc0mquUWazHsAvwkOuYOIcS/ya3Nsh4Pid4NPXjKFA2sdtSBsXSO5ZqOPA4QsvTOk15AiEfSt
	IllyO5KJjNcOjcSjJht6dPWo9utKarHsvIVmgIsEIkFgQk+JZm7c7c+qwj4HNQaFuQr6OtM3JzCyu
	Bm/csXAiq/fHEPV+QvnWG7GpqB5HfMHy8P+Zh8aVIO70df7uhs0pZm/IolhA9tmkl8X/635lRle/R
	Pb5L4tchj5oqv9z43ltp+Q+yQKSKeZlKyMsVYg8drDxEpRsucxb6Jm8SP9gdebgmewDMBeKhX3Qzq
	MSk7Svtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bz8-0000000AZgz-19cO;
	Thu, 19 Mar 2026 11:56:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bz6-0000000AZgt-23U3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 11:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eFPjz7Etpbiv5bbWzOUYWuNGKVp8Ad08gVTawigku58=; b=WJiQFv+ldzZ03Q87RSB/mKlTIa
	80Gvk8RhGYO7uBzGryfEkiAvbzbLygRG8ULsLycxllvy+RKehBFjgiy82ypw9mKSCoSH6wBCTjIxi
	JRKCr0IFyIDDJDt5mltsoj/I84kt8Qy3O4RDsg9ZRRZclmpdDuaN+oME/vx4CjGY+rJijbwJsoqZj
	cLJ8+Ly5Eb3/sr7dapPDfA/zgwBGXRPHvGY0W+uFhjkH1HMRjzgWRhDON/uxkhodmIoBdCNqLWAbd
	ZIYY6hK+mdKUVSrQrtXGKyWjPMNuJR7j4VRLmmiZtUPVSpe8iF4QjRFqcr74+wnM5u7hjlDSPxBXX
	XnOiBj1g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bz3-0000000DPr4-0zgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:56:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w3Byv-0001bT-8l; Thu, 19 Mar 2026 12:56:05 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w3Byu-0014ET-1g;
	Thu, 19 Mar 2026 12:56:04 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 3925E5083C0;
	Thu, 19 Mar 2026 11:56:04 +0000 (UTC)
Date: Thu, 19 Mar 2026 12:56:03 +0100
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
Subject: Re: [PATCH v2 0/5] can: flexcan: Add NXP S32N79 SoC support
Message-ID: <20260319-orca-of-legal-science-88e67d-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260319094032.427697-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzuitslxiv2ov2za"
Content-Disposition: inline
In-Reply-To: <20260319094032.427697-1-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_115613_369080_ECE4BBFC 
X-CRM114-Status: GOOD (  20.06  )
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


--xzuitslxiv2ov2za
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] can: flexcan: Add NXP S32N79 SoC support
MIME-Version: 1.0

On 19.03.2026 10:40:27, Ciprian Costea wrote:
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
>
> The CAN controllers are connected through an irqsteer interrupt
> controller in the RCU (Resource Control Unit) domain.
>
> This series:
>   1. Adds dt-bindings documentation for S32N79 FlexCAN
>   2. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
>      configuration
>   3. Adds S32N79 device data and compatible string to the driver
>   4. Adds FlexCAN device tree nodes for S32N79 SoC
>   5. Enables FlexCAN devices on the S32N79-RDB board
>
> Tested on S32N79-RDB board with CAN and CAN FD communication.

I think DTS changes go into a separate series.

Please also have a look at the AI review:

https://sashiko.dev/#/patchset/20260318092215.23505-1-ciprianmarian.costea%=
40oss.nxp.com

Especially on patch#3.

I think we should split the main IRQ handler into 3 parts, message buff,
bus error and state change.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xzuitslxiv2ov2za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCabvkUQAKCRDMOmT6rpmt
0vKUAQDwbFhW/W03Hu77q7GEEYWqTGLJDuJC+wiHZTFx4SO5KgEAuB+vLYvGzlSO
D4BK9Z3qYaKcq6JxEQhyIMUxoUVA/QQ=
=vGIE
-----END PGP SIGNATURE-----

--xzuitslxiv2ov2za--

