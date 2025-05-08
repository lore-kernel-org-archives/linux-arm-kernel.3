Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0BC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POjYqgXRwbYBAO0i/Vef4iBDO4ORLm/SUKYKwW4Piz8=; b=J4C3Xg9X3iYWi9XvwwNVosWDcz
	voF1ju3AtxiKkuge7qydtGzw4c+NSurH2iMhkjiw6bStioY6vbk8uYUy0wrvENc8h+4aRdB/XF3Fx
	iLc0zwqG7oRtnjlxpwx3N0zhme3aT0x6F8iOP931mu/NMyJplKvisjkW4f/J6JRZUuoRvuhrzfgr2
	edlnw3JaZoSXDtNhX7RdxoAlumYt98Cv7wbTGgfVyyrfFDkwOBL36J1VxB8qdG+KLy/34n251mibj
	hDdb2DZXM9/mq5t2Lwj5P0FbrSaKg+O2vGCE/zZQm7h8nMq+47luuZx08xU0bTBYWNUKmlauPzxj7
	j4QnXTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Hf-00000000vph-3v9E;
	Thu, 08 May 2025 14:31:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD18e-00000000jOc-3fL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746710292; x=1778246292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=POjYqgXRwbYBAO0i/Vef4iBDO4ORLm/SUKYKwW4Piz8=;
  b=OXS7Xy6VJMRdm/0CMDTASAFvi3i3GQ3CkH5vAH/Ga7VOSixU07ftsG9w
   2IGoUku4Lpaf4gboUOXHBE/Y+6lpOIrNfZAyZ2wsYEAJXd7qWCoXrQ+OY
   IxqqXDbx65vEASg1bd8U4tp8Tx2EBpB3Sdl2qvzj76hE3fvnVOXkc8UQc
   3Li2un18ur6mCvQETIoWWaY+Myw4vWfxXaUC46NGIghxNp6qMOELVaQIn
   eUKYiNfnlc8RVtVjLzKuvsxbaok9qyGhYW3l/rkkfmG34/r1rhl1N//im
   zBxe+0w42uApzRhg9cq2162+TpjpQdff1qWobM1pBeTySCyotgQPy5O8C
   A==;
X-CSE-ConnectionGUID: 6NI85Ig4TOyf0qRk8pnm9w==
X-CSE-MsgGUID: lEc3wvynRw+11SJ8/K/fRg==
X-IronPort-AV: E=Sophos;i="6.15,272,1739833200"; 
   d="scan'208";a="43963318"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 15:18:09 +0200
X-CheckPoint: {681CAF11-22-45F3AE15-E90F7DFA}
X-MAIL-CPID: 716EA28B452B08A8085D4D6410096CC6_5
X-Control-Analysis: str=0001.0A006377.681CAF12.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FD45160A07;
	Thu,  8 May 2025 15:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746710285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjYqgXRwbYBAO0i/Vef4iBDO4ORLm/SUKYKwW4Piz8=;
	b=aWA2k+AZ0JpTpW02HhdxQEthPrktKgGw0y+Gaio5PblfqZlJE0DPipM+e0Bg1wC9j/HF9b
	qt9gg/LIq3to/iaNvpE0SI9M9SVKvktDhqd5Qk34tLL0A3cwnYelqKc0Tj2JhFb5DTGOTB
	4Sl5pFY3wGSCy9gR7UUDLZepuspTlfIkdOCNc2zZpgiSKLs2PhIlZh2Mvn9PyTixcj6KYB
	YrhmCVvlLZGk0WK4XOUxLvf+ya58/mceqf/X60mQcf6Ajh5wR1QHCrbGmxPUiSIVXXbGEL
	3zG6T1kTkNITdtEX4NeyH4SOVl6aLBvCcxsYihjiqXjfrJOBV7DlhHf0t4J/Cw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 15:18:04 +0200
Message-ID: <6002097.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87a57nxogy.fsf@geanix.com>
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <5724399.aeNJFYEL58@steina-w> <87a57nxogy.fsf@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_061813_392487_75F122F8 
X-CRM114-Status: GOOD (  40.29  )
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

Am Donnerstag, 8. Mai 2025, 14:43:09 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Esben,
> >
> > Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >>
> >> > Hi Esben,
> >> >
> >> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> >> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >> >>
> >> >> > Hi Stefan,
> >> >> >
> >> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> >> >> Hi Alexander,
> >> >> >>
> >> >> >> [add Shawn and Esben]
> >> >> >>
> >> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> >> >> > Select PINCTRL for NXP i.MX SoCs.
> >> >> >> could you please explain the motivation behind your change?
> >> >> >>
> >> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow us=
er to
> >> >> >> disable pinctrl")?
> >> >> >
> >> >> > Ah, thanks for the pointer. It might be the case.
> >> >>
> >> >> The goal of the patch mentioned above was to be able to build a ker=
nel
> >> >> for LS1021A without pinctrl framework enabled, as LS1021A does not =
have
> >> >> a pinctrl driver.
> >> >>
> >> >> With your patch, that would not be possible anymore.
> >> >
> >> > Why? LS1021A is arm, not arm64 which this patch is touching only.
> >>
> >> Good point :)  Sorry about that.
> >>
> >> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selec=
tion")
> >> > is actually doing the same for arm as there is some fallout from
> >> > 17d21001891402.
> >> >
> >> >> > I noticed that, when using arch/arm64/defconfig and disabling all
> >> >> > platforms despite ARCH_MXC before running make olddefconfig,
> >> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it.=
 I
> >> >> > noticed this when building in yocto and non-IMX platforms are dis=
abled
> >> >> > for build time reasons.
> >> >>
> >> >> But is that something that needs to be fixed?
> >> >>
> >> >> It sounds like quite a special use-case, and why not simply enable
> >> >> CONFIG_PINCTRL in that case then?
> >> >
> >> > PINCTRL is crucial for any SoC to even boot, so this is an option wh=
ich has
> >> > to be set if that platform is enabled.
> >>
> >> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
> >> You need the correct pinctrl driver.
> >>
> >> Making the various SOC's select the corresponding pinctrl drivers makes
> >> sense if it is required for booting under all circumstances. And this
> >> should then indirectly enable/select PINCTRL and anything else needed
> >> for that driver.
> >
> > If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
> > (e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
> > SOC_IMX8M.
>=20
> For SOC_IMX35, it should be selected by default.
>=20
>     config PINCTRL_IMX35
>             bool "IMX35 pinctrl driver"
>             depends on OF
>             depends on SOC_IMX35 || COMPILE_TEST
>             default SOC_IMX35
>=20
> For the IMX8M* SoC's, that is not done, as there is only a common
> SOC_IMX8M config entry, which corresponds to multiple pinctrl drivers,
> which we probably don't want to select all of by default.

Well, is the SoC support is enabled, it makes totally sense to enable a
crucial driver like pinctrl by default. It's still deselectable after all.

> >> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
> >> Enabling a driver framework without enabling any drivers for it, when
> >> building a kernel where no SOC's requiring any pinctrl drivers is kind
> >> of weird. If you want to do that, why not simply enable both ARCH_MXC
> >> and PINCTRL in your yocto recipe?
> >
> > PINCTRL is currently only enabled because other SoCs happen to enable i=
t,
> > just this feels just plain wrong. If these platforms are disabled or
> > removed for whatever reason, the other platforms should still work.
>=20
> As it is now, to build for let's say i.MX 8M Plus, you have to enable
>     SOC_IMX8M
>     PINCTRL_IMX8MP
> to get a kernel that is likely to boot.

Both SOC_IMX8M and SOC_IMX9 are enabled by default if ARCH_MXC is enabled
too, even though you might not want to use both SoC families.

> If you enable
>     SOC_IMX8M
>     PINCTRL
> but not
>     PINCTRL_IMX8MP
> you won't have pinctrl support, and the kernel will probably not work as
> expected.
>=20
> What am I missing?

PINCTRL is not enabled bydefault if only ARCH_MXC is enabled. It just happe=
ns
that defconfig enables other platforms which in turn enable PINCTRL.
If you prefer to explicitely enable CONFIG_PINCTRL=3Dy in defconfig
I'm fine with that as well.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



