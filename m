Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNBtjKUlLDWI5QCJIIlgd/qmQpzHJefgRv3LMnnIJ9A=; b=Di3bDbPbW9vG57JQBpdXBXpLkn
	bfpbf8Ndbpwh3hI65lZsQwlrS31EQ2Txb7XiCyeB/TzncBxguTmxz/3pPcsZoeCQJOzhx6cDPkRla
	AjvU0PNgsFD+zb6bUMj2M2wRISU+qF1kh02BT73h1wrB3XXH0zeOf+nkp0oTcnAx7PFmK8GETqlgE
	yk547URA9Sp7Vj+9eFYKlc0rsfsp4MRopQngVX1RRmfk60qVqEHtMhqzPVy57IsZ9feeo5bfTZ7Vj
	8wBG2XgdB3d4bzhdAEYgyRDJ5emRi6DVCLxguTDugDLTGR5J0cA14oDee3Xt2De6mmMxb72oylYKk
	EW6RqkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdkC-000000061Q6-1WZM;
	Tue, 01 Jul 2025 16:22:04 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc6Y-00000005jLL-2GCI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751380622; x=1782916622;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wNBtjKUlLDWI5QCJIIlgd/qmQpzHJefgRv3LMnnIJ9A=;
  b=K/vd7lzZdLiefmhIQHT0GYl27YRoBlQTplbGPVclTJURd0I8lstx88KU
   N1Qy9ByavIqE0cP48jYtPwqmoWC9y5Ieh/DoJEl4uIKT02tF/XWY4FMGR
   Pzihp43Ij32xsorD9bWNXGjrGIkEJNppfUpvqv4x9h8SZRnSn0051RhTW
   TbbcDIVKSv8oAmyJ2kPESk0++zz4BtHvh2VGS4qA3DHHG9g0GJaq1xW+9
   Q5Gcxmu2gb55GUIiKvsURY2ousoLdsjiOW/jUIImvSPko+O7fmffzoUKD
   +GIC0dxTgo2bhCAIfgsLGZL6rHeFak8js0DF/teRtu2g8CHdqQ6MjxH1H
   g==;
X-CSE-ConnectionGUID: I6shCYzBT6uk0MqV6WbtMQ==
X-CSE-MsgGUID: A/nYcXl1T4uoaw/aimzoLQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44959539"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 16:36:58 +0200
X-CheckPoint: {6863F28A-A-F34124BF-F8CE6E96}
X-MAIL-CPID: 3118CC2C005CAAB61C6EE39A9FF496E3_4
X-Control-Analysis: str=0001.0A00639F.6863F29D.004E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC32E16B4AE;
	Tue,  1 Jul 2025 16:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751380614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNBtjKUlLDWI5QCJIIlgd/qmQpzHJefgRv3LMnnIJ9A=;
	b=edOjc+BMIrQqdr6ui8S58aMjdBWOGa1mfh5XPg45NFJkbNCh+hXcD6JKCDoxEZPkIDuXnf
	f0fdy6Vk/uOLpxzlFjMtJl6mQ0H56LYYKcXl9rSDdKj24ssu4yuhItcacrmXjhhGweZrmf
	T+qxaLKCHNwN+x01XADJHyyMu8QuD6tOfhYMiACHbDwXjgCvuWERgwFoI19ZE9fJV2hUio
	NTdesBkxJtGCuhNtBpwGMFmLVvrWIEPBGLdSuyvqSGTsECHhTrCL0n0LgTyLetFcDOrzAF
	AHsR0w2t9G02buwnh6MuBY11bLfw+KDo6glzSAS1y0+MPvVKOtmM3VTRU7qW5w==
Message-ID: <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Nishanth
 Menon <nm@ti.com>,  linux@ew.tq-group.com
Date: Tue, 01 Jul 2025 16:36:52 +0200
In-Reply-To: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_073703_082954_27EDA7A6 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>=20
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> Select MAILBOX by default is not needed anymore[3],
> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.

Hi,

what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to b=
oot
on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I ha=
ve=20
not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
enabling other unneeded features to pull it in.

Best,
Matthias


>=20
> Remove it and give possibility to enable this driver in modules.
>=20
> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@ba=
ylibre.com/
> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>=20
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Changes in v2:
> - Remove some other config after comment from Nishanth.=20
> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa9=
8@baylibre.com
> ---
>  arch/arm64/Kconfig.platforms | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f190f..bf9e3d76b4c0 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -135,11 +135,7 @@ config ARCH_SPARX5
> =20
>  config ARCH_K3
>  	bool "Texas Instruments Inc. K3 multicore SoC architecture"
> -	select PM_GENERIC_DOMAINS if PM
> -	select MAILBOX
>  	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
>  	select TI_K3_SOCINFO
>  	help
>  	  This enables support for Texas Instruments' K3 multicore SoC
>=20
> ---
> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
> change-id: 20250504-kconfig-68f139fbf337
>=20
> Best regards,

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

