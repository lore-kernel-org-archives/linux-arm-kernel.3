Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FAFCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsYp5szV0xyNktXKyNpHlGjtRi7D/yzfr9+tShTScEo=; b=NftzQgCKbgdINafBzrE0uvbZO9
	uLXqO7SYyyRoa1cYmqWSkMYfBgo5cENxGTTaGAhtZD5AFmM62jCax6eBwz4VpZGxSyIwnBKfkcHcF
	42NeM5dBcFmCFQWSoPaIrIcBkvfy1fResJAe145nBFnYNCvigGo7IWHJqkQI/zpy/jSA82kW2cAmj
	6gIHfP+8xkymnfFIUVvuu4gw/6CNOn+IcS81KorPJRA+LAd5H6ft+yd0GOCnwqItbLWayAlXh5V4x
	4ZHCiWzrN/aAaDBahkeN21Ek9FA8/Itvic7b/m7cokvWdoS5vkhvXH9Hl4iLSQSYgWYgwThzAVXpb
	JPW2Zpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFCs-00000009SkY-3EvI;
	Tue, 19 Aug 2025 05:48:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFAG-00000009Sb6-2KCs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755582344; x=1787118344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WsYp5szV0xyNktXKyNpHlGjtRi7D/yzfr9+tShTScEo=;
  b=oSShtEFwqeNgXmHE7SBlcWQlXrcErxo6aVLKeg4s3mpI626F8nPkt1SH
   DAni9B0wqwlyZU9h+Ma42s8k03fi/ZzoNZfyJ0aCduyIUncsmmAU7sYkn
   rKMtrEQ1pr2WfyKCc6/RjVNDd9/kh/jWQ97ffkiHTRQE52mFf5BXIdB4o
   nNsQB9FF5TBjsCgxq3bUD8sjAKk32BcFBQJkvuRfS6ynTYpu5HKfJPEOK
   bmsmzL1GEUr1eDc36WNavgOF5oFnlGhO6mHglFSYrkC+MOJTIMTQNm2pa
   4lD0QT4T1L50fYb938NbIeckZ8xYpQrBX1nXn0JiJTij5thL6JOrHn3cQ
   w==;
X-CSE-ConnectionGUID: pIE3H7EkSU2KpnRbqdg2tw==
X-CSE-MsgGUID: gemojgD+SnG0Uwlr5Nqd3g==
X-IronPort-AV: E=Sophos;i="6.17,300,1747692000"; 
   d="scan'208";a="45794411"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2025 07:45:33 +0200
X-CheckPoint: {68A40F7C-3A-9821D066-F5C64F68}
X-MAIL-CPID: FA256BEDB6305F126D1DB31ADA1A04C9_2
X-Control-Analysis: str=0001.0A002115.68A40F37.0061,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07F281632DA;
	Tue, 19 Aug 2025 07:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755582328;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WsYp5szV0xyNktXKyNpHlGjtRi7D/yzfr9+tShTScEo=;
	b=Hj+nbwMMZTxOWhrFndQYU6J6dMbz9J1u6gZvEnOsZDeCrIb+B1baPv04ofFHNq/N7Mu3QE
	2Bwf0kq5lUEfkNNWZ6HAaU9pro+LVN0e4uHZHFl11iRTUYV7XVs8No3AqkyYNy1KmwIjDq
	0ubTNQiWSi+0RTc3rpZVp6fbrSBJAe5wqu918FhSsb6UeIitZBq9r5gbEeUOaUCCx6ktYc
	+FatrOfHiLglLTztecpGNemEPGJ3W4VRR2lobspHaWq2QxJeprw0Y+M/bitj29ybf/LnIT
	W9lmSFHQCqS2dYizdttwa14Txx/yuIFOG560yt2A390b1lcXzhaxjcYFWC0lFg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 00/15] ARM: dts: clean up most ls1021a CHECK_DTB warning
Date: Tue, 19 Aug 2025 07:45:26 +0200
Message-ID: <2800197.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
References: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_224545_090214_D09F8E2E 
X-CRM114-Status: GOOD (  12.27  )
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

thanks for the series.
I've already sent a similar one at [1]. But I haven't check which are
duplicates and which are not.

Best regards
Alexander

Am Montag, 18. August 2025, 22:48:11 CEST schrieb Frank Li:
> clean up most ls1021a CHECK_DTB warning.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (15):
>       ARM: dts: ls1021a: swap dma tx/rx channel to fix DTB_CHECK warning
>       ARM: dts: ls1021a: correct node name "timer0" to 'rtc' and remove r=
eg-names
>       ARM: dts: ls1021a: remove redundant snps,host-vbus-glitches
>       ARM: dts: ls1021a: remove big-endian for memory-controller node
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Remove redundant #address-cells for queue-group@=
* of fsl,etsec2
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a: Rename node name power-controler to wakeup-contr=
oller
>       ARM: dts: ls1021a-qds: Rename node name at45db021d@0 to flash@0
>       ARM: dts: ls1021a: remove big-endian for mmc modes
>       ARM: dts: ls1021a: add fsl,ls1021a-wdt for watchdog node
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet=
=2Dswitch@1
>       ARM: dts: ls1021a-tqmls1021a-mbls1021a-rgb-cdtech: Remove fallback =
compatible string edt,edt-ft5x06
>       ARM: dts: ls1021a-qads: Add fallback compatible string mdio-mux
>       ARM: dts: ls1021a-qds: rename 'nor' to 'flash' and 'mdio-mux-emi1' =
to 'mdio-mux@54'
>=20
>  arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts           |  8 ++---
>  ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso |  2 +-
>  ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso |  2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts           |  2 --
>  arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts           |  2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              | 38 ++++++----------=
=2D-----
>  6 files changed, 17 insertions(+), 37 deletions(-)
> ---
> base-commit: 3ede6e44fad31f1c80dd01188683f0caa0f19247
> change-id: 20250818-ls1021a_dts_warning-fff933bd83da
>=20
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



