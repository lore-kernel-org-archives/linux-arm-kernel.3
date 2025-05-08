Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E358C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iazNB0ru7xiYzMbvmWPsjBe7wXldlYA4oQHJzMndgtk=; b=pSpWInZkndl+rB2Y1hBejO8vDr
	EaoSZAfWnaWBMGRugVCV82oEHjEHrGvrLcvTEof781r7j5fcv7B0pqQWvDhHhe8vgY100JtDEN0Uh
	YTB2fa7Oyb/n3SOc4+aATWZTAC1dpmriSaivcDB9XQtdgmg/PSqmvOzCmUimzDdnjesqvd3AByDOb
	NU4ktmexemZNmRsep7njm9gcJOyCKVp1ma5Q9ApIlxtYgHO/kMcrfKxRTzASfjxpvYODsdxAnlIzI
	2FMzKy+QnFVTp+6kKmAF91zCWzDe3EmzI23VTwDNErUyXfKYVn5V3Jj2GvbnR6L5LpGX974MzaRGA
	ZiInUygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1Lb-00000000kwf-0vvF;
	Thu, 08 May 2025 13:31:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0K0-00000000bNd-3hlB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746707152; x=1778243152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iazNB0ru7xiYzMbvmWPsjBe7wXldlYA4oQHJzMndgtk=;
  b=h0JbMCMx5zqaz1ZJVyzy39PhM+EkA0i3BZ1qsnMulXHxkFhneA8DkH65
   nIa5MA5FOPatGUIFzpeBoLf3BXPEzaOCiAL3hf2m89hTuPpcCuQcrF/sE
   Z5/c6L7mBhyxjPryA1oWK1P2ozH2O7ttNMuih58YXL8jcgq0jBh9lgEoK
   fwKWLvvfLv/zRvKJgaxhwQgfCks5DF0k7o4ybPV2uzcM2Khj9cg9URvMB
   aE+nHmmIu+Shf/kEgvnD3wiVUGegcMHkA94oCq5Fc7bww61cgsK5B38nn
   BdHAF2ZM3iCwH5B6kQKn0DMHYLadGo1O62q3x6K4n5pMda5IxkUXG8aDP
   w==;
X-CSE-ConnectionGUID: Hs9Xg0CLRzKT52w3yTw6mw==
X-CSE-MsgGUID: 7jHM8xN9Q229D6e6YN8zPA==
X-IronPort-AV: E=Sophos;i="6.15,272,1739833200"; 
   d="scan'208";a="43961769"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 14:25:50 +0200
X-CheckPoint: {681CA2CE-A-BF62DDF1-CB8BF55F}
X-MAIL-CPID: 0F9D536A0AAB13CF6862A92CB39405EA_1
X-Control-Analysis: str=0001.0A00639F.681CA2D1.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 687A2161554;
	Thu,  8 May 2025 14:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746707145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iazNB0ru7xiYzMbvmWPsjBe7wXldlYA4oQHJzMndgtk=;
	b=Az+GZTnJmysGwF3eHtTA+X6IURuBK/lQ4cB6+o89SVM/HDGejsNwSHjWl2zryRtgu4KMyz
	q6OWQzz37I3s0ADm5CP+q/moDBg2ZtDFPq++cDel5CB62/qvCgy3t18kIjJNu1Nom9LV+e
	KtUDHGyMexklde//R3LeGhWdHlz448V0lQ9434Hu8mSY7NEOBCe4VkhNWyjTj70Z+mDC7i
	UScO8QlIS/gNpEGG07Z5gXEdLJYZCutZUqQMCK8huz5Zg2EHlSvo1YNBMq0aboICG97cwl
	vS3R2LJUy2ieZ/9yobaRitbrqC5Eyiey8lbwIRfXLkl1ZCNlbdF1X+/cKZVQDA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 14:25:44 +0200
Message-ID: <5724399.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87ecwzy0pw.fsf@geanix.com>
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <7023673.LvFx2qVVIh@steina-w> <87ecwzy0pw.fsf@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_052553_406886_3962C643 
X-CRM114-Status: GOOD (  29.85  )
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

Hi Esben,

Am Donnerstag, 8. Mai 2025, 10:18:35 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Esben,
> >
> > Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> >> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
> >>
> >> > Hi Stefan,
> >> >
> >> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> >> Hi Alexander,
> >> >>
> >> >> [add Shawn and Esben]
> >> >>
> >> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> >> > Select PINCTRL for NXP i.MX SoCs.
> >> >> could you please explain the motivation behind your change?
> >> >>
> >> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user =
to
> >> >> disable pinctrl")?
> >> >
> >> > Ah, thanks for the pointer. It might be the case.
> >>
> >> The goal of the patch mentioned above was to be able to build a kernel
> >> for LS1021A without pinctrl framework enabled, as LS1021A does not have
> >> a pinctrl driver.
> >>
> >> With your patch, that would not be possible anymore.
> >
> > Why? LS1021A is arm, not arm64 which this patch is touching only.
>=20
> Good point :)  Sorry about that.
>=20
> > BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selectio=
n")
> > is actually doing the same for arm as there is some fallout from
> > 17d21001891402.
> >
> >> > I noticed that, when using arch/arm64/defconfig and disabling all
> >> > platforms despite ARCH_MXC before running make olddefconfig,
> >> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> >> > noticed this when building in yocto and non-IMX platforms are disabl=
ed
> >> > for build time reasons.
> >>
> >> But is that something that needs to be fixed?
> >>
> >> It sounds like quite a special use-case, and why not simply enable
> >> CONFIG_PINCTRL in that case then?
> >
> > PINCTRL is crucial for any SoC to even boot, so this is an option which=
 has
> > to be set if that platform is enabled.
>=20
> Yes, but PINCTRL (framework) does not by itself do anything meaningful.
> You need the correct pinctrl driver.
>=20
> Making the various SOC's select the corresponding pinctrl drivers makes
> sense if it is required for booting under all circumstances. And this
> should then indirectly enable/select PINCTRL and anything else needed
> for that driver.

If you prefer I don't mind enabling PINCTRL and the SoC-specific driver
(e.g. PINCTRL_IMX8MP) depending on each SoC-support, e.g. SOC_IMX35 or
SOC_IMX8M.

> Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
> Enabling a driver framework without enabling any drivers for it, when
> building a kernel where no SOC's requiring any pinctrl drivers is kind
> of weird. If you want to do that, why not simply enable both ARCH_MXC
> and PINCTRL in your yocto recipe?

PINCTRL is currently only enabled because other SoCs happen to enable it,
just this feels just plain wrong. If these platforms are disabled or
removed for whatever reason, the other platforms should still work.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



