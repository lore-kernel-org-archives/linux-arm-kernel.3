Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB1C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSSK2PTqlnUEJhKCvNW0crQEodWyOjfIifnHJ+xuMNM=; b=vHS2KWHCqNXYokO8R4NDrVomHo
	bqT/+ZVHb3idzceNv0IAMzLFrWoSzu7BOOslacsQm5Md2QyxhsiB1mZN9GlKFg1pzCSvDRNVs4XWu
	qjt2NtScLgWPbNpIR9+FuwZzGSGTuh7P2tkLCAkY+yt5aU9r2zccPr+ESeSuR6Cqg4ZH+XyRgBWZ+
	FgO1Bg4eNpTaY9XOPThJZEA9pnp4DAcFnY1uexdqrYovtZLdcCHZEBbdsZucIpy190m5VsozLhfsA
	wVP9UXsjsbNpdlHW0CpE9ryoeZgRMWuAug9TsRHIrhv+S+8RZzk5E0nwpZGdMHbRhiVrInDDdtFvk
	dbGj198A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKlC-00000001EGt-2NhO;
	Mon, 31 Mar 2025 19:25:26 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKXm-00000001Ciy-0mQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 19:11:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA35B10252BE4;
	Mon, 31 Mar 2025 21:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743448291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oSSK2PTqlnUEJhKCvNW0crQEodWyOjfIifnHJ+xuMNM=;
	b=TjOIfQnzNullD7EcYq3OqdQ/ACfrulBbrkMI0okI3NNe354wkVyJrfMG2AanEL8a8f1SNP
	DRR0dL2B3ZMBUPCF4L6Jv7Rbj0cWvlOFk7PIQcThAiUpYyznBRuNhYeipNhohy9B9uDs+I
	OvktXLdkKiU9iPZef8aqAs+Y+O4zCZfbN0n8CQZxwFknh8YjHWKs81VOyjCg/3/0Vtbu2H
	SK2c4lxu+zNmb7B5ZxdbspGvSrRVEDlKStIz+qePJckU13bEsn3c4tkhjfVGZ1RBw9wfUh
	FP8/HZYT4Ks5xFNyHwvaxX63/CCP1Foz3PbMG+S0IBOQQnhWpvJIkc+1SRGd8w==
Date: Mon, 31 Mar 2025 21:11:25 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] net: mtip: Add support for MTIP imx287 L2 switch
 driver
Message-ID: <20250331211125.79badeaf@wsk>
In-Reply-To: <20250331101036.68afd26a@kernel.org>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331101036.68afd26a@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IR1iYWtwzQdqHh5c+hN8Svc";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_121134_387226_9A9D9DC0 
X-CRM114-Status: GOOD (  17.59  )
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

--Sig_/IR1iYWtwzQdqHh5c+hN8Svc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Mon, 31 Mar 2025 12:31:12 +0200 Lukasz Majewski wrote:
> > This patch series adds support for More Than IP's L2 switch driver
> > embedded in some NXP's SoCs. This one has been tested on imx287,
> > but is also available in the vf610. =20
>=20
> Lukasz, please post with RFC in the subject tags during the merge
> window. As I already said net-next is closed.

Ach, Ok.

I hope, that we will finish all reviews till 07.04, so v4 would be the
final version.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/IR1iYWtwzQdqHh5c+hN8Svc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfq6N0ACgkQAR8vZIA0
zr1KaAf/aQYJaLVFceTv3YwD0fzfiVnP2cDfAM7j3J5NjW38UrFMOpqEm5HkQS06
xvDsBShC5fwDXj0VdvSEG84/ALMGqgNL2iwIcMXN13nc3K9mGPcSYVEpQQQ1IFzn
UJyHkEJ0NA88ultzLOXv9JOm+oPFIFbvuKvFjNlLH7cjxvy4N/4+MD22cXkz1N6D
UfXM49pE5ngKYWrKjp4zaa4PC8eD9NM2H2MHNhcbE1qq6B62TCDaCVhLYHmaufD4
VczPpX6VKRXBTLC60OqOuo9NLLZQ7l3Up8dkECviKEfXrgVuSxRTKukaqIp2pxAx
Jwmcnj7XAbwC2a8yRUktEfAAtC/dwQ==
=aORA
-----END PGP SIGNATURE-----

--Sig_/IR1iYWtwzQdqHh5c+hN8Svc--

