Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C92ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVClrZYqVmS8mvDO5nHVAP+mpH/d3telWA6Jj0IEuHM=; b=hye2UXdbho7Q0gnHjhSUtZuu9n
	UttESwNWnVPFjXrSoTkXXE6GrINGHBoKLo2AigzqH/OHOQkE+osfbzTaoB8GQXm5S7L8XWsE5DSIo
	FBvF5vbxrvbG9+WMuqzlhj1zDqlTQWSwNXPrPHbxXx0hC9ERGveKzeq4ISjSo9ceDHlLFFm48aWLK
	/Husrjrfgf1DoIQ8JWDx2yS1ErTfbz8bSh2+LyLs/edXNh8ursD4x4S85dqdCSh+Vq7ZRgGx8Ewfm
	IH6PjFr+KJItE0AtjGP7xT0qQTZzZKYTdiH61ZH4w/dPyzymE6W8QX7JUj9wV9Frc3F17h0jvFHgJ
	KLc6tX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQly-000000072pJ-1udL;
	Mon, 25 Aug 2025 06:33:42 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQio-000000072bm-0G7U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756103426; x=1787639426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hVClrZYqVmS8mvDO5nHVAP+mpH/d3telWA6Jj0IEuHM=;
  b=J/whjBZuGBV/BxFpt3e7SRHqkN1Vu7pErNvlh+fwcbQnIdzmY3rcMp9G
   FE7Yf70o+tWv+vMdm8w232nY9ckhi1acUk2UrcVQQfXaPQvgUMeoNm/nu
   mX0na0+8rLzIpoC4l5VAFvqQCfjgFBjwpSRywShkuIAkcZuFdaaX08cIf
   m34C1KiDmFcFEFCcVQYGvFMtdGEfUY8ATanljAWmEqKcthm+Jr+gHs9Wn
   D4DV5eD7i2fnYyIhL5J0Hur/oku/wCD6DoytvOHSDYz2YPXNsn559fLZ4
   yew0645g1AE1wnKYalBKeT+1OYCR4woN6oKURMisfXhA6IKa4ZDtch1Tr
   w==;
X-CSE-ConnectionGUID: 6VonDOvySGKuggn1bEsNYw==
X-CSE-MsgGUID: 7vjS2wWkRxG2z5SHniuKPA==
X-IronPort-AV: E=Sophos;i="6.17,312,1747692000"; 
   d="scan'208";a="45884651"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 08:30:22 +0200
X-CheckPoint: {68AC02FE-1F-820F521C-C7779E56}
X-MAIL-CPID: BD5D3ABEBB39283A27FFCA9035FF8422_4
X-Control-Analysis: str=0001.0A002123.68AC0294.00AD,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E325316626E;
	Mon, 25 Aug 2025 08:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756103418;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hVClrZYqVmS8mvDO5nHVAP+mpH/d3telWA6Jj0IEuHM=;
	b=j6/LFKZVNymhmmyzEM42kZsPyDpEoBbmub53LLTzfsqHI5PH1DufScz1JZIyh2Z/cfFFHn
	Ab3FBnxhDPy//LteoYOno/TM5HysHHRQrrfaDe0c8SWw6C8EjGq0Ndl+Omig7NxSVvXQOK
	Vxnkzyt71oYgQPOMHK85GepACPF9Rdd3DuKvxwwwIPghUX07fs0EwFXoMehK6TWV2nJyUG
	23XdJh5neKY99mdg+qRWBUI1uOScsm+6/+xOApnzxkX+LYTVeNeEr+5mPGwOCQx2olWD6/
	bb9EQFFyVucvoE5BkKsZuJ1CoPfdY3WcndFGuc+9mX2NXcR8tYfsN4eoz1N+fA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: clean up most ls1021a CHECK_DTB warning
Date: Mon, 25 Aug 2025 08:30:17 +0200
Message-ID: <6192530.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
References: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_233026_585209_EE639708 
X-CRM114-Status: GOOD (  13.45  )
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
Am Freitag, 22. August 2025, 16:49:57 CEST schrieb Frank Li:
> clean up most ls1021a CHECK_DTB warning.
>=20
> Old uboot check esdhc@1560000. The new uboot already switch to check both
> esdhc@1560000 and mmc@1560000. So we can rename it now.

Please be aware you are not the only vendor. Do you have a link for
the corresponding change, so other can easily keep up?

Best regards,
Alexander

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - rebase guoshawn/imx/dt tree. Remove patches that were already merged.
> - Link to v2: https://lore.kernel.org/r/20250820-ls1021a_dts_warning-v2-0=
=2D2e39648a32b7@nxp.com
>=20
> Changes in v2:
> - squash rename to flash patches
> - remove duplicate patches already post in
> https://lore.kernel.org/linux-devicetree/20250725061339.266125-1-alexande=
r.stein@ew.tq-group.com/
> - Link to v1: https://lore.kernel.org/r/20250818-ls1021a_dts_warning-v1-0=
=2D7a79b6b4a0e2@nxp.com
>=20
> ---
> Frank Li (4):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet=
=2Dswitch@1
>=20
>  arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts | 8 ++++----
>  arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts | 2 --
>  arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi    | 2 +-
>  4 files changed, 6 insertions(+), 8 deletions(-)
> ---
> base-commit: 75ad5f47c58aee30248d294a58c8ee52e079a8e3
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



