Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF88C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud+rCOovqPBYftUvAbjQR4Vh3uI8WDVAAK+bZlJ7MfQ=; b=lk4F0H9cAn62/+/DlihK9dhhDB
	hkDKoziI7t8h5ElgdV0bGP8BmhmRGbv7gM5SirvvPqwi9mMP6ZRbgVvMDvZa8p7iSJj0IaFDQ7WuM
	KgzXithFkLODY88tN+yUGuftQoZd9qntFtNdfAtbl910IhIJ7jdJu9bP6pA/o6cptBobQ0FZZP4pO
	zRw4e/P7m5jGxgfE/Hg/JPEX2D0XlXHTbHyCO843cD8h0mdnhEfrWYCuLwSLB+IEeV/x0QYs+GANM
	RrGwKNhAt/Lsa4rxjL7nbLUNpPSAEN/ZGSVwa4rFnUeQaSebjwPTCq6Igajv+jMIHvxY7kJRdOUyO
	ftYLujxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txp1j-0000000BLOC-0L9J;
	Thu, 27 Mar 2025 15:20:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txowj-0000000BKn9-3KTq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743088505; x=1774624505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ud+rCOovqPBYftUvAbjQR4Vh3uI8WDVAAK+bZlJ7MfQ=;
  b=UoI0E7YTBnchb1lkMXRXSodlnFsZN3V9yWq5dDsOZJN+8F/oLl94yVix
   BlDdO1PGCukJUd1wbCUK62mPHh1ZUVAIL7mrp4GGjJiBWDYnv4ryI22kn
   UAWa8lPK2gvogko60bRkrVZzfa3vkPAuuZLsYw57+Sjlu+QfHcY2g1BmN
   LpcFYJbADinE9TsohljxjwBE1XU/Vda5g6WQBUTK+Bc3nQm0XO1OSKile
   DjOGNvtnnhmUsB06aPRhl/ZdjoIpvev1mMSR9ow9eNApVu0xWmLOYz4SX
   sfmn6HOo5Au/2yRMSkW7dkbgVbjyP+wIxhMwTgDHSVJQ9uPwbrHC/KIdd
   Q==;
X-CSE-ConnectionGUID: CFqsMjfbRLmQsVQYGewxrQ==
X-CSE-MsgGUID: iF+iBo9FQVejDBdU/JGIvg==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43200532"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 16:15:03 +0100
X-CheckPoint: {67E56B77-9-7141A0B0-E6EDEC14}
X-MAIL-CPID: 315FAB61A1C307C00CDFAC91E8194F7C_3
X-Control-Analysis: str=0001.0A006374.67E56B63.00AC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4516C166CAF;
	Thu, 27 Mar 2025 16:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743088499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ud+rCOovqPBYftUvAbjQR4Vh3uI8WDVAAK+bZlJ7MfQ=;
	b=VE0C+JtnYp/lLP9VD3bj9T1hvlCj0fchsBJeSBfLIaSZ4tJ9Tvf3N7A+xXQI0M/9nNrVRs
	ZnsK5uCtagKvB54YFNHXelkMhc1hjLM5LSSggWu8HjRBxFDHQ313xLOe7Orx3XyAvnsfj6
	5ensmTE+auns9zedGB7lP5A2gZOdrNOcRha3mjt6GUdrK68Z8LS3c1FcsEHJvsW3L1udoV
	6/nnFXspseXzYa2yhAhutU/K83YxDm9rrv2CS5hePaijSEggPjkGGFOWfIUsSQWBTsmkiM
	PBDh2qEZsNvz5Vrae1PnKubbRiBCORlJqarKhMECJQTLTRGnjrVfQ3d+Y/hgTw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Date: Thu, 27 Mar 2025 16:14:53 +0100
Message-ID: <2223114.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_081506_189402_4AEBA4E6 
X-CRM114-Status: GOOD (  16.96  )
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

thanks for the review.

Am Donnerstag, 27. M=E4rz 2025, 15:54:26 CET schrieb Frank Li:
> On Thu, Mar 27, 2025 at 03:41:06PM +0100, Alexander Stein wrote:
> > Hi,
> >
> > this series adds several display overlays for HDMI, LVDS and RGB displa=
ys.
> > Additionally it fixes the license header and updates the sound card mod=
el
> > name similar to i.MX based platforms by TQ.
>=20
> Next time please cc imx@lists.linux.dev for layerscape platform change.

I only followed the entries from get_maintainer.pl. Would you mind adding
arch/arm/boot/dts/nxp/ls to MAINTAINERS?

Thanks and best regards,
Alexander

> Frank
> >
> > Best regards,
> > Alexander
> >
> > Alexander Stein (7):
> >   ARM: dts: ls1021a-tqmals1021a: Fix license
> >   ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
> >   ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
> >   ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
> >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
> >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
> >   ARM: dts: ls1021a-tqmals1021a: change sound card model name
> >
> >  arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
> >  .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
> >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
> >  ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
> >  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
> >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
> >  .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
> >  7 files changed, 204 insertions(+), 3 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-hdmi.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-lvds-tm070jvhg33.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-rgb-cdtech-dc44.dtso
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-rgb-cdtech-fc21.dtso
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



