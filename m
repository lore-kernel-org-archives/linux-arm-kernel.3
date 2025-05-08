Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C83C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 05:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EhF6K8iP9mfpQBTanjU88sfd+KY8wpvCiD31HubBpA=; b=ryoRBTf45+i06+hWDz2GYjCzUR
	MwByhw8oIub3xeVS2b/yMbsEfdJlzu18wy2vPNVvvH0wIcKAZX9oolPLxXoGBqP7Z1LYlQ0WOlXS0
	DSwMniZMNqyZT1O28A8UAulRSBCUIN8m7NV+bKUGc2psxe3pm4Is+nVZDeR41+4P3r8495bDbVlT6
	koLaQKwlHxlnFohGh7aQHcXy61W6VF3cvZkKem+0Sax6UT3kzc1QceiclsvUCcE5e7HMOCVY/zV/9
	0Z1s2XajnWcLtiwpnMFV9YpDdaNrVqJQRc3XUUvtqLWldvgHgeqJG9teLbczrYwbQv+1kB6rbcWFu
	WfWVlU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuDv-0000000HPN2-0W3T;
	Thu, 08 May 2025 05:55:11 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuBw-0000000HPEg-0tZq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 05:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746683588; x=1778219588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+EhF6K8iP9mfpQBTanjU88sfd+KY8wpvCiD31HubBpA=;
  b=HJ/eOVSrmzsoAFEuxP2geSR0taIy6w9sRSSdNBrd5vNXpiSbJWPd5GNh
   Im1SdIx4uGb5DIieauXEj424+0OI36LcOQylvwymPxtHVZuORd3WNH9tP
   aWp+Q/D3sqeAWTVRaUEd/Vl91KBXz6eFpxtbQn2OMcZnC0hk2bKVArl4Q
   A6TYVjM0jMMsSelbDV3vfDEaOfqjkpRZgiGXU4oU2nD74T1CJoPjHEJwk
   Aosve9zzMNSHcN06YbMs32UTG9wxs5pqNuLMWh8jTPwdFdZanOkDVgzyh
   yYBWm+T0WHxNJd51CoLrdCHhwJKH9/yVEbyitSWTcFW2Q8SEVSqGDm4iw
   w==;
X-CSE-ConnectionGUID: xbpkzIP9R/qC6etNh8IRJA==
X-CSE-MsgGUID: xnb0ZSFgTwGbn6c0RXGptw==
X-IronPort-AV: E=Sophos;i="6.15,271,1739833200"; 
   d="scan'208";a="43949933"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 07:53:04 +0200
X-CheckPoint: {681C46BF-47-C7E25413-F4312D34}
X-MAIL-CPID: 66C688438851F16310F03349BE687D8C_4
X-Control-Analysis: str=0001.0A006376.681C46D2.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59C3160024;
	Thu,  8 May 2025 07:52:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746683579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EhF6K8iP9mfpQBTanjU88sfd+KY8wpvCiD31HubBpA=;
	b=Sd5BdEikxwjpfFOj5IDvtC61NMJMYM5wDSpY2TWONg2qb7ny0tda0jQ0U/BEhlxRGGE+7P
	XW/dv833vlG0UHzsmvAcUnjVXkRfzUhoVaEkfVn/k1K4pxnYrajjYvE4BfbLXIolmes41a
	EaK2z8Y2c+lh0Xce+PTj7Uv/U3zROYrdbqviMh+I5QvCkaK0W+6HunIBhdj7N9l/pPNHOm
	EKQ5Vd8mojrABJIElm/eMihNfWj+gWIJzSrXIISS0qU7vUA2NN2sYjhW/dlStAPG+190dY
	s9XMiITFk/nPaD9XI097goS2FMZ0E+i2eYFn+yHMmdeWVWqO9QTObi+GbsIpxA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 07:52:58 +0200
Message-ID: <8259306.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_225308_729256_BE6422DC 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Stefan,

Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> Hi Alexander,
>=20
> [add Shawn and Esben]
>=20
> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> > Select PINCTRL for NXP i.MX SoCs.
> could you please explain the motivation behind your change?
>=20
> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to=20
> disable pinctrl")?

Ah, thanks for the pointer. It might be the case. I noticed that, when
using arch/arm64/defconfig and disabling all platforms despite ARCH_MXC
before running make olddefconfig, CONFIG_PINCTRL gets disabled as well.
No platform is enabling it. I noticed this when building in yocto and
non-IMX platforms are disabled for build time reasons.

Best regards,
Alexader

> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >   arch/arm64/Kconfig.platforms | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index a541bb029aa4e..49c3bc25e5f68 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -219,6 +219,7 @@ config ARCH_MXC
> >   	select ARM64_ERRATUM_845719 if COMPAT
> >   	select IMX_GPCV2
> >   	select IMX_GPCV2_PM_DOMAINS
> > +	select PINCTRL
> >   	select PM
> >   	select PM_GENERIC_DOMAINS
> >   	select SOC_BUS
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



