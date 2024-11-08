Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C0FD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s7i6hTY4ZPYkVZsEa+kaw6R5w8zz4VVGAZwBGp4xjs=; b=Ex22Ia0l9DB3njZUm+k5O3CtqI
	pu+VEhOy3yztH1xGPfupRS5m5FQNSlg3d/ksfURznUBDIdo4cAJu5e6eXLVZCCixC1EK5Wl6R+Iqi
	TVQr4VzR8WXhYINr5iLn5cHmWuB+Q8Q184Ts3Vo0whoxfQE/nTSoVvEa4s/8H03IiHaeuikNHZ53V
	lWhti6eiqSZr/Ma89Lx5l7Gk6sBEhnKA+m7snF/lnyI7SkaL2aRyq6gnkYXsbkh/wF1GLI4CU/7eQ
	Z5xneRr8qgfbd8YRkQOVmIySZ6ah+ELPoAFAg+3ng+Hlc7Vta1f7pY02sb884iCEXbH0uXNcbYC7W
	VzXNKbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PyC-0000000AqlT-2G3f;
	Fri, 08 Nov 2024 14:28:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pa1-0000000AmrA-3l7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731074597; x=1762610597;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8s7i6hTY4ZPYkVZsEa+kaw6R5w8zz4VVGAZwBGp4xjs=;
  b=mr0/TWYb2LJGNSJQtQsuCVIRzbBzcao/sXOKoZFktio02UhScWYVXfFw
   OD4i54CwtV+lSEGMb38hB5rMzuOh/AYvhBnQzrv87Gx8pKsd8ZL1TV9uP
   /gqmsvwlrF8ezs4/LHYajhBE6ZAiIu55vjB8QM/1LKJk64KnsEJdw9Jor
   M8CBw5pkCbANYvv4774qb2zN1gL5Z8c7UvseZs5CUJLE3pkM8JiAXhr2G
   VgJ9lKsQRq/sNYNeKKPXbL7BXm0Svnut4ZOC/RoWLtULv/x8LbKdZLAms
   r/CPTjZiJWVZnPe8aCwUX3271yGId1J/Oqiqnv3kkmuH7x10Ffkwz/z0v
   Q==;
X-CSE-ConnectionGUID: k3gsdjO5TCWoFDaYJiNERw==
X-CSE-MsgGUID: m8ER5V4aSjmP+6cWLiGuTg==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39937221"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 15:03:12 +0100
X-CheckPoint: {672E1A20-13-86C05612-CA75E1CA}
X-MAIL-CPID: 502FFC223A986D9CD1878CBB94DDB6D4_1
X-Control-Analysis: str=0001.0A682F18.672E1A21.0001,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0267C163598;
	Fri,  8 Nov 2024 15:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731074588;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8s7i6hTY4ZPYkVZsEa+kaw6R5w8zz4VVGAZwBGp4xjs=;
	b=ERAhNC2S1xpiZuyO1UqvOQCIZ37b2yPkbjIPTYXEGUAtVGHkgfhR8CpRUMjR23mKPIHpax
	lc2Vv3hVStSEAZNpRLJAb/CTKfCY5tDOWV/r4EjOs7LYAm/t9Z0oHAEWf21CPR1KW936/7
	B9EL0oPQCnM5ZYwqaywYvcviu5ZVHJiMY+C0QfSdtkXB18MycR9FVgQ33IULYjryjPO8hZ
	Asco2jBOnFWbryeKjqDl/FN63ICHE2HgMZf95gJHabr6wAili93UhxA5HcMz1TbbTkki/o
	5sr64w8UXPqUjP2MOEOQlDAxY0yHBIoYbR1JGYguxTrWDqsLIdDzC3kcdOaJcw==
Message-ID: <499869db340b2d4c257e12d20e15c200d0f815b1.camel@ew.tq-group.com>
Subject: Re: [PATCH 0/8] TQMa7x DT cleanup
From: "Niebel, Markus" <Markus.Niebel@ew.tq-group.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?ISO-8859-1?Q?Jo=E3o?= Rodrigues <jrodrigues@ubimet.com>, Bruno Thomsen
 <bruno.thomsen@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 08 Nov 2024 15:02:54 +0100
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
Organization: TQ-Systems GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_060318_262622_33BEC323 
X-CRM114-Status: GOOD (  11.69  )
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
Reply-To: Markus.Niebel@ew.tq-group.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 2024-11-08 at 14:49 +0100, Alexander Stein wrote:
> Hi all,
>=20
> this series fixes some DT binding check warnings as well as removing
> duplicated nodes. Eventually IRQ support for thernet PHYs was added.
> Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.
>=20
> Best regards,
> Alexander
>=20
> Alexander Stein (8):
>   ARM: dts: imx7-mba7: remove LVDS transmitter regulator
>   ARM: dts: imx7-tqma7: Remove superfluous status=3D"okay" property
>   ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
>   ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
>   ARM: dts: imx7-mba7: Fix SD card vmmc-supply
>   ARM: dts: imx7-mba7: Remove duplicated power supply
>   ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
>   ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x
>=20
>  arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 61 +++++++----------------
>  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  3 +-
>  arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts  |  3 +-
>  arch/arm/configs/imx_v6_v7_defconfig      |  1 +
>  4 files changed, 21 insertions(+), 47 deletions(-)
>=20

For the whole series:

Reviewed-by: Markus Niebel <markus.niebel@ew.tq-group.com>

Thank you
Markus

--=C2=A0
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/

