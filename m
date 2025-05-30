Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068BFC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 06:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKYfvQUJsCe5Fu3IbEtXJ4DySVzCIAQxIRD4sH/yzi8=; b=DA6tPjtNcQITtdKinKunjlUC4o
	yWB+TZ3xHt1se2nhrGpNv+EqQ7yJl7gnAvUbbW4wLICkyXpVRTUPqgDFHDlEZixy2gXQxMD2Udn5G
	iNLjFqVph6NOBsiZQHosJzMpSwJUck1npvqmvJhfsc+pd+c8kqldCLBupteJ9ntBu9ABXuc95inMX
	PcFK2wa1d2gr9hBRN/yOKIEnvfIDZcxpak0Nq63U1MIEqFl4L2gjwqoy6dszkjLvFRTDVk/4ppdaU
	s5YzpwN6eO8IRZaAkWyx23K0MbjlrWE7e9lAxAfk8xbxcrDoxCnLLKvIJdL0LvaUjDnUNtL1gm0q8
	wGQHYMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKtHU-0000000HMIk-2PP0;
	Fri, 30 May 2025 06:31:52 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKtFL-0000000HM8L-14O9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 06:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748586579; x=1780122579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKYfvQUJsCe5Fu3IbEtXJ4DySVzCIAQxIRD4sH/yzi8=;
  b=ktqnIz4yggp5Nlcpy2AEG2vxEWSsT5DvvIkXCPonvFhkteOlaM0sRX4z
   jydVcAKsmwzUUVmXBvSqGo0k72QQRHfrJNePUSHHmJjKvOLdkw+MS7OwM
   rd9mkwufIhBK8XvO2x6JArhLlt0EPQTT/uj0m01jcnm1y3xLee/Udopnl
   5VW8LFR43RNjRHYSYAUuxuurhWAFYh8JRusHEn4/YynDf38WrB1kgFhbq
   y9EdgxioOU+v4OB5Y8CO7PVyUqsQ0ZnA4LD0QWjelWzNM4xdSHSdouKJC
   kQRl9md9bArwQNAbKejEdNv1jMG9CsmyI6Ss+MBp7twdEq5NdBiMJsCXt
   Q==;
X-CSE-ConnectionGUID: qQZGS3Y/Tla+y7MpA+X7nA==
X-CSE-MsgGUID: OnaFfOnkSiWO/+xrExhjsg==
X-IronPort-AV: E=Sophos;i="6.16,195,1744063200"; 
   d="scan'208";a="44364193"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2025 08:29:34 +0200
X-CheckPoint: {6839504E-C-8CF597AF-F8BD95DC}
X-MAIL-CPID: 5E8F613866FB26B0A053F72B1F8FAD48_3
X-Control-Analysis: str=0001.0A006396.68395054.0069,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D027163483;
	Fri, 30 May 2025 08:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748586569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKYfvQUJsCe5Fu3IbEtXJ4DySVzCIAQxIRD4sH/yzi8=;
	b=XY8jWu8ju4n5JEtBc/cmVFE2Z7uWTpCnd6BhdtlaNX6JwcXtWr6btn1mOz197fc/ggVz79
	i93PNjpDqIfOjPbeHVSFlYeYpSHSjqJGLfkfWnlzBj4RTrnWRT+xrTyJ6Kg9T28De7YfI/
	J86SH8jJau2i6X6hmorZLq3cfyplTzwWc77IUDLcFVOJh0B9aYaSZJ1F5tACswlH2QHRha
	4HfchkwTlHYX6zXPGpEnmAUGIGd8FXJhika7BJEDSRI/ObZeiLAHkvET/JLG6HHkeAW0D9
	hS7/8bbOipBRRN+yHH1AKeD1SBIBD0utqVO6DDEXr1/4B1IEDQ7U9/bYam2Akg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Gregor Herburger <gregor.herburger@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Date: Fri, 30 May 2025 08:29:27 +0200
Message-ID: <7298658.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
 <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_232939_778348_D62669E4 
X-CRM114-Status: GOOD (  11.65  )
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

Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > From: Gregor Herburger <gregor.herburger@tq-group.com>
> >
> > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > TQMLS1028A.
> >
> > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
> >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
>=20
> New dts file, suggest run https://github.com/lznuaa/dt-format to nice ord=
er

Thanks for the suggestions. It does some improvements, but I also disagree
with a lot of proposed changes:
* Wrong indent of SPDX tag
* model property should come first IMHO
* {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells
* gpio-hog property should come first in a hog node
* sorting gpio-hog nodes by name instead of line number seems wrong

There are some more bogus changes, so I'll skip this tool for now.

Thanks & best regards
Alexander

> Frank
> [...]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



