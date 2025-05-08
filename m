Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60833C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=; b=f1LGqJgU1PT07rtMlkQS6V1XWU
	gv5GSY0bQGH0g1yaEq29rnfRSzjP2zb7Xm60yhgr5ukKUj4A7IXD+sShSwGQsjbNw8csJ1coZKAqI
	ndCl9mbqdiXlySSrUNbzVQiDHqlqVLC0Q8b4sx+J5zfMc4+G7tulL/jGC+SvU26kQUhe08Jv4neue
	aZV+mkFnMK00jtH0j2l6USlzREyKY6ACJ4pqAOHlrKojYuLd1pVSctoD/WVBV9VwoEBorw7l8KdhD
	n1WX3yBI7o6WSMLSEKChIzROYdFBr315IIAqGwfybs00HtM8jtS6AizZgVSRjfJjECqDAQgzAsLsy
	cfIt4FLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwKg-000000004T4-2oqb;
	Thu, 08 May 2025 08:10:18 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwI7-0000000048p-3Uff
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746691659; x=1778227659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=;
  b=X/5OGuesdvlfatalJP8VqGYK7bbJ8RrtXmp4K73eXOT15DyracV1lwXk
   6wPE943+O2PFH7Gg6cccpaehk/iMCKKrdjhJrYiKr/JZS0KGHafanX3eD
   CWceU+IzOp5PbYtrHln8SjNh1D9jbbbb/C6379+WhwwzGdTcePdtdbqj7
   EGgcBzahsT77o0gIX3w8HNArvD8evdr91NfQohWjQTGDJ8dJzomJLn0AC
   44t+cJsm9Bm5uWulMn0bSjqhRD1llO1vprY7Rs1HKWAGjKhespWsVVytN
   2s9F3W1Dit5v//SJkJiYAB3zjkByvgeFFWgOIA0yYwKBr3Oz+VBQ2njX5
   A==;
X-CSE-ConnectionGUID: /Ws5gQ/3TvilkfRlpMhvfg==
X-CSE-MsgGUID: wmq3LZIoTQyzYU0idt8Iag==
X-IronPort-AV: E=Sophos;i="6.15,271,1739833200"; 
   d="scan'208";a="43954413"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 May 2025 10:07:37 +0200
X-CheckPoint: {681C6649-29-45F3AE15-E90F7DFA}
X-MAIL-CPID: D73B9C706E3199116FADD3609FEEBAFF_5
X-Control-Analysis: str=0001.0A006397.681C664B.007D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57469163F01;
	Thu,  8 May 2025 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746691653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VvJyVgfwE/tf2nM/arkeHG8DCYPZCnFmpe2XLdCrC7A=;
	b=YIElGG9tOSf2sQm9x2MY4rRj808ZLuGpYNcjuuWV87kPfDdkUN9n+YPiQMilp5DVMngDeT
	Im7/Xkc2J0QUZ4Y7+st8iGeyNLN0AOwblOxZ1nyXuN8ZYYsQvTUJp0vKEIolnkyr5aPlsS
	7mcBiNut12c8Uus8N7ZctNdlPb3p3pSlL5kgzBS/DMpAPwWD/++KIPduBhongFKEO1m767
	KVIo0UJP/uSMICrpV5PYxosl5Lc5+vMnC1iwYnVjZeHGpECzEtXSHOB8hesipWinbPa2/L
	IrSgMeKDRhfvkZ+RTszSxJKJKZwolwH7dH9mEWOyti0m3hAGIk62gp8PJnvpvA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Thu, 08 May 2025 10:07:27 +0200
Message-ID: <7023673.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <87ikmby52x.fsf@geanix.com>
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
 <8259306.DvuYhMxLoT@steina-w> <87ikmby52x.fsf@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_010740_353073_4783316A 
X-CRM114-Status: GOOD (  20.42  )
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

Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>=20
> > Hi Stefan,
> >
> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
> >> Hi Alexander,
> >>
> >> [add Shawn and Esben]
> >>
> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
> >> > Select PINCTRL for NXP i.MX SoCs.
> >> could you please explain the motivation behind your change?
> >>
> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
> >> disable pinctrl")?
> >
> > Ah, thanks for the pointer. It might be the case.
>=20
> The goal of the patch mentioned above was to be able to build a kernel
> for LS1021A without pinctrl framework enabled, as LS1021A does not have
> a pinctrl driver.
>=20
> With your patch, that would not be possible anymore.

Why? LS1021A is arm, not arm64 which this patch is touching only.

BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
is actually doing the same for arm as there is some fallout from
17d21001891402.

> > I noticed that, when using arch/arm64/defconfig and disabling all
> > platforms despite ARCH_MXC before running make olddefconfig,
> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
> > noticed this when building in yocto and non-IMX platforms are disabled
> > for build time reasons.
>=20
> But is that something that needs to be fixed?
>=20
> It sounds like quite a special use-case, and why not simply enable
> CONFIG_PINCTRL in that case then?

PINCTRL is crucial for any SoC to even boot, so this is an option which has
to be set if that platform is enabled.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



