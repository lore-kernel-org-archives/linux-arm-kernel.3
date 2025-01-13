Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11427E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/I8ofgS/1dP08mnYQl4u8YsIuLHQEi0Cj5vHjiYV6k=; b=O3cwOnTMRPJhXfjVwP9w/6xijm
	xfmz2AAuVRXUSpP84Rnun9xv6fwABezTdmcuXsYjsRftL9oTBv2KSWrxSo3bR594e5EQ6Ibx+ikO2
	GoEHiuwyf4MRh+YfeJcdW5JJR4xmuN1b5x+kXX+b/87mAYZBVETjuhV0uKQ/7PKnWhqGr2gfhlPY+
	GlO5W81T3nZD/sKRCk7cl0grdFR7SM0fIG3XHzhw/tX9icvt+aSFvAHt9PXab4PgoOk3/C51z5I3C
	fc2eopQkJeA84coG+r2JNWzSiUo19MX/KA7K+uelU/5Tisna18l7QED30sGD3PNLX+2v7HzKeitNq
	9AMRSxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJOa-000000053wC-06Bb;
	Mon, 13 Jan 2025 12:18:16 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJNK-000000053dD-2EBz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 12:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736770618; x=1768306618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/I8ofgS/1dP08mnYQl4u8YsIuLHQEi0Cj5vHjiYV6k=;
  b=XpbXElht8CJeAGtpPaQpQIJ/iKnY6Fe8cJpdZ9/px+uZSelUDyMFbm2I
   tGSnQ95CCGpjrU7LQRFsrrbLikgvviv0xx8cnJXUSyACgpfGId28Zt4aO
   8x64cWTI0MtGf6bsfEQukOHvvO8vkDDd5KlrmdeMlk8RZVzT/gl97wlSb
   VQStB8Sm9jtS4fH4Yml2YnUrWV22oI9hyX00yWujyfqeoSyML6e2UZz45
   Ur0URhUr2WW4PzOFnHt3LIUeCigM2KYz6dUHxyUgwyGSXfhhdepPKhJXN
   YGnzY9C6si0EIVZbVT1Ifepk3ZvPUrXbtq/p+8ILmn0lycwsBoz9ijffI
   g==;
X-CSE-ConnectionGUID: 1qdIUrH+QMyWDUbbj50IAQ==
X-CSE-MsgGUID: EUfQ4QiHQJW34iNFwyctOg==
X-IronPort-AV: E=Sophos;i="6.12,310,1728943200"; 
   d="scan'208";a="41016138"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Jan 2025 13:16:53 +0100
X-CheckPoint: {67850435-31-1CE016C0-E589DA3E}
X-MAIL-CPID: 120C5A0C0DE13FDF760E80BE027CE42F_1
X-Control-Analysis: str=0001.0A682F27.67850436.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09A9D16126B;
	Mon, 13 Jan 2025 13:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736770609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/I8ofgS/1dP08mnYQl4u8YsIuLHQEi0Cj5vHjiYV6k=;
	b=Ac7C9uQCZ35A/+fQR7yoeb9o+uj1ZH9FqfqxRd7hKAgFaWh/j+iTwniqK8GbVh57j87e9d
	yjYbycnZ4bUgeunosg5mLFOHd8hvvjNeJaGVzdkt3Un8CQ+wj9i4KIuskUtbjNkTD10xrX
	3BoV4+gVy2z4jbviap+kygofq0nUFr7GFLMo7tx8Ap0/PNPHEYqa20+RA2laaFtgxc+djW
	HKmzaECbg4tm2aJat6yqYki94rj3B4cGHhRV6DawPB6wWciNI3cmkAqHFELOJq8KtSG8pj
	H7DFC3wwhqJ7AfQSqrkfj6Avw4rD5mGCaa1NE2/nOwjVzJtWNCwB0Et+q2I22A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Mon, 13 Jan 2025 13:16:48 +0100
Message-ID: <4956524.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <868241455.0ifERbkFSE@steina-w> <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_041659_065400_CACCFE13 
X-CRM114-Status: GOOD (  25.10  )
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

Hi,

Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> > controller for i.MX9
> >=20
> > Hi,
> >=20
> > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
> > > >Hi Peng,
> > > >
> > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> > > >> From: Peng Fan <peng.fan@nxp.com>
> > > >>
> > > >> i.MX9 OCOTP supports a specific peripheral or function being
> > fused
> > > >> which means disabled, so
> > > >>  - Introduce ocotp_access_gates to be container of efuse gate info
> > > >>  - Iterate all nodes to check accessing permission. If not
> > > >>    allowed to be accessed, detach the node
> > > >>
> > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > >> ---
> > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > >>
> > > [....]
> > > >> +
> > > >> +	return imx_ele_ocotp_access_control(priv);
> > > >
> > > >In [1] you mentioned devlink should solve the probe order. How
> > does
> > > >this play when the driver is compiled in (e.g. ethernet for NFS boot)
> > > >but this OCOTP driver is just a module?
> > >
> > > OCOTP needs to built in for using devlink. Or the users needs to be
> > > built as module.
> >=20
> > I don't like this kind of assumption. Would it make more sense to make
> > CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?
>=20
> No. Users could setup their own system with this driver build in
> or built related drivers as modules.

Sure, but if the kernel locks/fails/panics while accessing peripherals
just because of the kernel config seems at east very unfortunate to me.
How is someone supposed to analyze/debug this?

> At least for Android GKI, this driver needs to be as module.

Any particular reason this needs to be a module?
Which means any affected driver needs to be a module as well just because if
a DT reference, no? With no means to know which drivers are affected, despi=
te
checking for the DT references manually?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



