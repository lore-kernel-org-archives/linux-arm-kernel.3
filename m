Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75574C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5NnMAuoCpHi6I8onFu4kw3+wMiYKvzXi7R0wbc3Y8Y=; b=FyiqmihyDEilZq/UiJUZR5zizv
	k29jSsXYBl+yOW26VefkZ99ffPY4d7U3W/XZfQFocDMqBvOFiUdH5AqH3YSmPb1PpuRbWMDPkr+sS
	Rcems5+h35R35a70pr7VNj2jhTOzGrIYfO2UE31i3pJvJZnGNkW66dY9atw14YXOUiCb/OUch9lbv
	WOQLw7xECYTbtNTKlWyiz39LbOLANkK3Clnw329KVx08qT4JUhPY9Pz3Q/8ieaIHtxVRQUbSbcoxw
	taxxGu4lqCFIa969T/AhX54AqdvJhQjc8BYV9/Za5cfiK0qdj3fudfP1nQqaNrL6Vm1QVM4d5/Tnz
	Dzfkm+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUuO-0000000Drkm-1TIs;
	Fri, 07 Mar 2025 10:26:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUnc-0000000Dpiv-1UiE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741342764; x=1772878764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5NnMAuoCpHi6I8onFu4kw3+wMiYKvzXi7R0wbc3Y8Y=;
  b=J03FearFn58Kx3W8twHScxp6NmlNJ5MX8esNUhpIQUF9GJCHJrTWJo21
   UeA2Sk7bk92SBhPWx+5F7oLCpsVUumXg/BtnwMkxDRJJaM+HSIDinaAua
   DIqfjKu92G9JF14JGvfQob4gq/7UiETV5WallJE1VsrnJzLDJgqLEL5cF
   Y2ZbzTqFN1OLcfOV53YO75i+rG6MOKzvovrVuBMGARSjqoSh0hSpEeMhw
   mZHVvc2blmfyub6haIGoEY/tNj9XAgamO/IK5GreViJMz2jy/8l7Hplto
   amm2di34+HeTdAFgrC3LumyLK3W0nexcGGPQj0P23x8OahxmpAuNvdwQS
   Q==;
X-CSE-ConnectionGUID: cwth3I3+SFm4GbrvFaS44w==
X-CSE-MsgGUID: KT/ZiaJFTAmCZXaQrXGPxg==
X-IronPort-AV: E=Sophos;i="6.14,228,1736809200"; 
   d="scan'208";a="42425425"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Mar 2025 11:19:19 +0100
X-CheckPoint: {67CAC827-10-DC4DC9A0-F4F29281}
X-MAIL-CPID: 3340A31ABDE18E85EDAED8C6EBB5AE90_0
X-Control-Analysis: str=0001.0A00639E.67CAC82B.0057,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB938171FED;
	Fri,  7 Mar 2025 11:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741342755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5NnMAuoCpHi6I8onFu4kw3+wMiYKvzXi7R0wbc3Y8Y=;
	b=qoELbrT7dqpxKdLBtp+15LkU3jggW0iYoWlp1nDF01+0gZva1+FyuliyvzFZ5DsiNYOLof
	AltMCxXCtqdGzpkM+azfga6QX/0CBE5/GBypvksQ8AE1juhqQW4cz5uVMDPAeWfkpfZwER
	Pchb8NZEMFFLfIsjUHgaJfMtXMLXs+JXbqslBec1iOLC5vNEPqQzO+lajV0px7IKvig9t8
	NzUuRxF0VdRIjJdcpSpVv+5hKzNrc+QbWobBYh+z0U3wHiRKgJAyAuBzy8HLu2cao1oMZ/
	K35gyL2hXJUnlSBBJf87+SD+aiKrmzGzhaVztcw3jKW+7lT/4/+DNEDimu3AWw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dtsi: imx93: add alias id for bbnsm_rtc
Date: Fri, 07 Mar 2025 11:19:13 +0100
Message-ID: <116096172.nniJfEyVGO@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250306193014.490091-1-Frank.Li@nxp.com>
References: <20250306193014.490091-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_021924_898369_B5E00200 
X-CRM114-Status: GOOD (  11.40  )
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

Hi,

Am Donnerstag, 6. M=E4rz 2025, 20:30:14 CET schrieb Frank Li:
> From: Joy Zou <joy.zou@nxp.com>
>=20
> Add rtc0 alias to set bbnsm_rtc as the default rtc.
>=20
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/d=
ts/freescale/imx93.dtsi
> index 56766fdb0b1e5..7d9aa15ebf5d0 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -34,6 +34,7 @@ aliases {
>  		mmc0 =3D &usdhc1;
>  		mmc1 =3D &usdhc2;
>  		mmc2 =3D &usdhc3;
> +		rtc0 =3D &bbnsm_rtc;

IMHO this is a board property, not SoC property.

Best regards
Alexander

>  		serial0 =3D &lpuart1;
>  		serial1 =3D &lpuart2;
>  		serial2 =3D &lpuart3;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



