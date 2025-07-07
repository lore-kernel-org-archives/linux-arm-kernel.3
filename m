Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA5C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MS9l5V7rnppikpjmqzYLq+jQty7Y2WLmP6gMpwdm78Y=; b=CVIY5h2kVbv8jEs0j/IOq6kACN
	TJobwBiEfbRcLNgCcT5L9DNbDgJFeuBvxfdyCS+Anrv1lzyGePh7WhxUnrVQNgQJ3W6FeWj+MtnR6
	4+iFVvn6FXpPo+IEJ6bSyOMGyAGR3AQc/ZG6AcQN8Hdg9e+4LwpwLtf2WwcPTQJvajkPrcnk5pXpe
	An1YU2eUbwJXCEnsimm/Pi5CsVtVi0Da8DodO0oLBKwdfpF/ex1UXTedg7xoI5lESz3SpEylvC72x
	9nG9Fs93vtzYzTRlUe7A0z2Lmc6WgfqUuUslRigGwu6+gMvvyQdNT1OxBX4mfsf6taCMpkx9Jd8oH
	TipbJoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeBA-00000001QNq-0GXM;
	Mon, 07 Jul 2025 05:14:12 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYe8q-00000001QCX-29ro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 05:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751865108; x=1783401108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MS9l5V7rnppikpjmqzYLq+jQty7Y2WLmP6gMpwdm78Y=;
  b=NZhUia8V/foMnCSa01x4MfQz9NstxxB9jErGgOXHVJ6jCgxCYQRxUqtl
   +qV1UUktFTBHsid+FNx9qzkqgf5LrkSxBHxk3MhRI7pTRtcz2VyS1N584
   7AI1nLOzMvd4t25lXFAFdCAnkmf4licsWe6NnXeojRB7gwSexAvLrnhM5
   62wl0r5relPC8eD/sNxRwXWnXMSPbpDtvo4zU6/wsrBZvvXeLNohJ4BFd
   9hNMTTdbSTqQ3MgrRZRaYYgywQWzUTv2uc9rPqoSN/rniP5HTepEAweUW
   a+jhnf7DiuDQ+nY7HAbRtwoJcEZAstCu3q+P0HKLIkbo0frF81OUMZHQR
   A==;
X-CSE-ConnectionGUID: cdaaUOoYQXi065uLnbbgdw==
X-CSE-MsgGUID: 0JndVCJeRv+mZnXHP+VpkA==
X-IronPort-AV: E=Sophos;i="6.16,293,1744063200"; 
   d="scan'208";a="45049649"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 07:11:41 +0200
X-CheckPoint: {686B570C-37-4FC15ADB-CD71293B}
X-MAIL-CPID: CDEB1C0A765BD2ADCEED811366CB8CCC_0
X-Control-Analysis: str=0001.0A00639C.686B573B.0052,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D13916397D;
	Mon,  7 Jul 2025 07:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751865096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MS9l5V7rnppikpjmqzYLq+jQty7Y2WLmP6gMpwdm78Y=;
	b=Sv/Tj0oC82xoMR1uXwWA8qfioW3rO7wpmNR/uZgCiQmeZzZrSn2E63+UVAUlk9V0l4qJuy
	AJRxZV7EIx62zzv4zAzBSENpA1wsUn9oDEEZsXaiKPg7Io9D+oq60Smn8aUreMEuTeGxE8
	rji8rJ0gCULqQlmk2/jXlw0m7MYYPpcYXVv2/oVUm4izNYU/H6W84teDFCSAZb4BHQLJrS
	4+ZPa9rFp0rBvky/PyI9jO6eMErzxoh7QPF8/OZ/EySD/SSDhuLeDGQPDU2ouLGblBG49k
	v3AkMrqkRNWlloyKomXI2+jSQ0GnDJPMwH2CbW13e8UA9FIBK7F7l/T3ViLtlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Mon, 07 Jul 2025 07:11:33 +0200
Message-ID: <5029548.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_221149_037710_F0B1A7A5 
X-CRM114-Status: GOOD (  22.91  )
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

Am Mittwoch, 2. Juli 2025, 21:54:09 CEST schrieb Laurentiu Mihalcea:
> On 7/2/2025 9:49 PM, Mark Brown wrote:
> > On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> AIPS5 is actually AIPSTZ5 as it offers some security-related
> >> configurations. Since these configurations need to be applied before
> >> accessing any of the peripherals on the bus, it's better to make AIPST=
Z5
> >> be their parent instead of keeping AIPS5 and adding a child node for
> >> AIPSTZ5. Also, because of the security configurations, the address spa=
ce
> >> of the bus has to be changed to that of the configuration registers.
> >>
> >> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> >> missing 'power-domains' property. The domain needs to be powered on be=
fore
> >> attempting to configure the security-related registers.
> > I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
> > system in -next which seem to bisect down to this commit,  I'm seeing
> > separate boot failures on the EVK so haven't been able to confirm the
> > status there.  There's no obvious logging, the dt selftest shows:
> >
> > # not ok 141 /sound
> > # not ok 142 /sound-hdmi
> >
> > Full log at:
> >
> >   https://lava.sirena.org.uk/scheduler/job/1530197#L5119
>=20
> Hi Mark,
>=20
> Thanks for catching this!
>=20
> After browsing through the provided logs it would seem like no device und=
er the
> AIPSTZ bus gets probed. Right now, my guess is that the AIPSTZ driver is =
not being
> compiled since CONFIG_IMX_AIPSTZ might be set to 'n'.
>=20
> Which defconfig is the CI using? Is it arch/arm64/configs/defconfig?

I'm also seeing audio problems starting with this commit. In my case I get
the following error:
fsl-asoc-card sound: failed to find CPU DAI device
fsl-asoc-card sound: probe with driver fsl-asoc-card failed with error -22

DAI device is sai5 aka /soc@0/bus@30df0000/spba-bus@30c00000/sai@30c50000.
It turns out that the module snd_soc_fsl_sai is not even autoloaded. Loading
manually doesn't have any effect. So I assume starting from this commit
the subnodes (at least sai5) are not even populated.
Reverting this commit fixes my setup.
I've set CONFIG_IMX_AIPSTZ to both  'y' or 'm' and doesn't change anything.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



