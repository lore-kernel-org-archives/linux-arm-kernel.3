Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096A8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVDvbwIvnOZ4humPqCqO2awtBoUSnhumXMCo453Cge4=; b=Kk4Q59KdPnxiyUIPYIflo0dyGu
	ToRdwD4Ej9o7IU5Ro+o0VgFaKvarRk3GTMgRISrsRnTcAzDHhbDONnoNYlGWqIdNZfl0viGxWyrjU
	591+OzGjRI1oGHPj2Gn/nOGNObvxLOdvNxK7B7GSAcnj64BFOgT2AdvXuI6lXWYx3ojrQYRwqDCaD
	kgB3jEC6aWySvbDYifyOiB9NAYvrxXkr8P+eT4I7qCzoWTMmwBX/37v6ffY3jGE1iLHiCLwDQQmRO
	M78vbWJYYTDWjMyKH+/2sNFXumA46nlsnJOJAwVGC51q7Z8Z6Pl9A7ctPr8NyyzIm753IRnlh80Op
	keWC+ZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thW3Q-00000000NT8-3TFl;
	Mon, 10 Feb 2025 15:50:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW21-00000000NCv-2CVX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739202549; x=1770738549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pVDvbwIvnOZ4humPqCqO2awtBoUSnhumXMCo453Cge4=;
  b=GvZU2H/uufcsKveCzgDgNtiH3wMruz6vLu7dsMwNymEjVOFVQK8vCxyQ
   FEJW30gwgVxcxyRntF6wo7MK7sBTwYdcdLHcjDOtxtQ19ibU5BCZU1V2y
   8gbW8qu7luPVQZwoUj7DhlxG9v2L9UbfK2WLpVmJBLpcS+qYnPPRWENGy
   fhf+cVh0m+uWXSC+jYpudSND0EjzqGlXwUKQQdNfUe07zrrnAFogaFTr3
   yguFr7+7rNo5KYMnvJLK+wS1QeNRnjHXGIls3YKPhMlD7EDUaBcZPmMRI
   ZeH0Kq8jUvic8zdnU118YcZqg8i90905xzskLJ4Yvyx/jTEo5FLSkH5Zy
   A==;
X-CSE-ConnectionGUID: H1xBE4XyRwqDrcXHSdTukA==
X-CSE-MsgGUID: THM2mKF7RlequMHpcGeCOg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41723421"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:49:02 +0100
X-CheckPoint: {67AA1FEE-1B-B8541F8F-E50F9B0E}
X-MAIL-CPID: 3596EAA376F14855D334F1E93CC1918F_2
X-Control-Analysis: str=0001.0A00636F.67AA1FF1.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40786160ABD;
	Mon, 10 Feb 2025 16:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739202538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVDvbwIvnOZ4humPqCqO2awtBoUSnhumXMCo453Cge4=;
	b=W6jP25cUKKQKO4dVA5Xu2nJmNQ5pXA8eVc1xaW2ifgRB1N51ZD9eXM8rz2bf4oOObaxU/m
	D4U2/6Z98BNU5DLVe272MVsorHmmyJ775GgfWtTKHieZRiyqqBi7L63YIDYQgGIj1wJxHl
	VX9HVC+/TdJqd8VRg+euR4jMk5F3ARbUtGWsu3QN5L3Zw+pUtKBk1nqpR/cnxHDmhkCNkb
	3l3AsF+bJ93WMY1QFPTEMTYppCIZPfJvEtbkm0ygDUPuaL4sIchVLSy9HQnefyIrdz6ugh
	DhaQ4/8oxxEGk+Vn/EJWvX1xINnXJ0Z1bz5xGWITg2p5t/3uK+jzigYck/1uxw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Mon, 10 Feb 2025 16:48:56 +0100
Message-ID: <2222299.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <8037692.EvYhyI6sBW@steina-w> <PAXPR04MB845912F48DC37B6BC599313888F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_074910_048322_624617CF 
X-CRM114-Status: GOOD (  26.94  )
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

Am Montag, 10. Februar 2025, 03:36:48 CET schrieb Peng Fan:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> > Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-
> > controller references
> >=20
> > Hi Peng,
> >=20
> > Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> > > On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> > > >Mark ocotp as a access-controller and add references on peripherals
> > > >which can be disabled (fused).
> > >
> > > I am not sure whether gpcv2 changes should be included in this
> > > patchset or not. Just add access-controller for fused IP will not wor=
k.
> >=20
> > Well, I was able to successfully boot a i.MX8M Nano DualLite.
> >=20
> > > i.MX8M BLK-CTRL/GPC will hang if the related power domain is still
> > > touched by kernel. The pgc can't power up/down because clock is
> > gated.
> >=20
> > Well, with GPU node disabled, no one should enable the power domain.
> > But to be on the safe side I would also add access-controllers to the
> > corresponding power domains as well.
> >=20
> > > This comment also apply to i.MX8MM/P.
> >=20
> > Sure. Do you have any information what is actually disabled by those
> > fused?
> > It seems it's the IP and their power domains. Anything else?
>=20
> In NXP downstream there is a patch for  drivers/pmdomain/imx/imx8m-blk-ct=
rl.c
>=20
> soc: imx8m-blk-ctrl: Support fused modules
>    =20
>     For fused module, its pgc can't power up/down and clock is gated.
>     Because imx8m-blk-ctrl driver will pm_runtime_get_sync/pm_runtime_put
>     all power domains during suspend/resume. So we have to remove the
>     pgc and clock of fused module from blk-ctrl DTS node.
>     Update the driver to support such case.
>=20
> But this patch also needs U-Boot to update device tree nodes,
> I recalled that U-Boot will remove gpc nodes, but not update blk-ctrl nod=
es.

Does it work, if we add the access-controller as well for pgc_gpu3d
on imx8mp? There is nothing in blk-ctrl AFAICS. But for VPU there is.
Which clock needs to be removed there in case g1 is disabled?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



