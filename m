Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F9D3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNiIgMzqjD7JnSewZ3IhEBUr+kDPKJaLJNDhMEfOTU4=; b=SgC/zUB6bZgR07co4voZf8IAyL
	in4nrVm8MjTJs0DzmJuN3sUIiJDqhdiSAmWk0oPvxwmTDex1USAwQ1s0AlRG9uuBq6Rf8TBGhJCck
	kT9+8eTCWYXF2Cx1ubTH1kZSUR4xvC4H6rs+Rb+qWhYzVtpqx1r/ud/WOorECpkfG8D7WVoziJH/Z
	3Td7OghxLKyr52jj1VGKMmJbu8vQvjCXcbbXpK3UFoZxqiFobMTbitALwJnZqBs/WpAHHHVtG5CJA
	ibFNjby2Yy8U+eVgFjzIPmoXoFfpJeiv3wG8ZuvitN8oS4xliR9TwbND4trwFJXW3Vlc9aqo5W1D6
	afv26LtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ohG-0000000F3Fi-1Ifu;
	Tue, 29 Oct 2024 16:03:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oM9-0000000Exi8-1vkl;
	Tue, 29 Oct 2024 15:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730216525; x=1761752525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNiIgMzqjD7JnSewZ3IhEBUr+kDPKJaLJNDhMEfOTU4=;
  b=lxLTEbL9cJEU7xVWIwlSWlhu0os5tV7Ywn0TxVFkCBtS0galuDmfn+89
   RD7QgOtpBm4lCiDkqYAk7WlmtH63OnbmiS7A7N4htz7OSvmW9ag6pdCiK
   gXHjyeb8HExapJiQGKyTJfNqe7TsfVW51C9ir0SASe7pxqj7yr/3ar+gf
   aZbhDiGKX0CQDlOXsWkkkxV04OCuFikWZB42KrDmrTGqbw2moxl+1EJRu
   /RL91wUPaAOYIipp5BvRV9kVvLLOUBDnE5bBz9sOTXDdqyOkzmbXQXAhE
   jL3guTe1Us4YjN2aY9jXV4hrsgnVIB0Fuj3Z9dqMaYUuc8mm+T37Lzf9f
   w==;
X-CSE-ConnectionGUID: EJO/soQAQBiuZRY5p2q1WQ==
X-CSE-MsgGUID: yDbm1SmPS9mGLdueEux2rA==
X-IronPort-AV: E=Sophos;i="6.11,241,1725314400"; 
   d="scan'208";a="39741195"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Oct 2024 16:42:02 +0100
X-CheckPoint: {6721024A-2C-D31EDE1A-D52D6119}
X-MAIL-CPID: 86EBC639FFD8A347FFFA3158577E90EE_5
X-Control-Analysis: str=0001.0A682F18.6721024B.001A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E9BA165CDD;
	Tue, 29 Oct 2024 16:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730216518;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lNiIgMzqjD7JnSewZ3IhEBUr+kDPKJaLJNDhMEfOTU4=;
	b=d43V220x7dVdOZSIsV/ABOigjAWn9QuNLSkmlQvULgSyyfG5B4o9WUVvZ6wU6AQAhrDZ/B
	OHFJ24703OI7si9qkf0jNYI4+f49ms4xEDARF1fEsSrSK9C7NPopRClbjW44EL5fHoM9t4
	TfHkVZfwjcXp9Gx7e5AEjToGbaNQ4kvt37ma5drCtu2sP9DkhYu3ax82X/j/mmz+NT4vs0
	pBvubsZCNbnNuzUks36q1/D2IwEoHePM0tv8ec6Dqveiu64FqtMNwDGuaJOhqkeUu/s21u
	JRAoOtUu6WDvBGV+bS9Flpn2cYufQx2C58yMN2q8FcNTAqkFMaVs8LtiZNAFDg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against fsl, mxs-usbphy.yaml
Date: Tue, 29 Oct 2024 16:41:56 +0100
Message-ID: <4608791.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZyD/QzKS7xqQ2QF8@lizhi-Precision-Tower-5810>
References: <20240926073951.783869-1-xu.yang_2@nxp.com> <6099458.lOV4Wx5bFT@steina-w> <ZyD/QzKS7xqQ2QF8@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084206_011992_987ACB31 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Frank,

Am Dienstag, 29. Oktober 2024, 16:29:07 CET schrieb Frank Li:
> On Tue, Oct 29, 2024 at 04:15:54PM +0100, Alexander Stein wrote:
> > Hi Vinod,
> >
> > Am Donnerstag, 17. Oktober 2024, 17:36:12 CET schrieb Vinod Koul:
> > >
> > > On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> > > > Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.=
yaml.
> > > >
> > > > The first 4 patches are used to fix below warning, "nxp,sim" is only
> > > > needed by i.MX7ULP:
> > > >  - 'nxp,sim' is a required property
> > > >
> > > > The last patch is used to fix below warning:
> > > >  - fsl,tx-d-cal: 5 is less than the minimum of 79
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
> > >       commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
> > > [2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
> > >       (no commit info)
> > > [3/5] arm64: dts: imx8qm: change usbphy1 compatible
> > >       (no commit info)
> > > [4/5] arm64: dts: imx8qxp: change usbphy1 compatible
> > >       (no commit info)
> > > [5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
> > >       (no commit info)
> >
> > Did maybe something go wrong while merging? Only patch 1 has a commit S=
HA1
> > in this mail.
> > Also only patch 1 is available in linux-next
>=20
> Supposed script report issue. Only dt-bindings go to through DMA tree.
> Other dts should go through shawn's tree.
>=20
> Still wait for shawn pick dts patches.

Aah, thanks for clearing up.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



