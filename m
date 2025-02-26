Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E159C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pmbTD4zoQM5iCGF3tYVmluO/FUN08Skf4yJBgTYALo=; b=i9AKJIg6XPVm04UCQYQ0vJM+Af
	MnxUlRAG6pbUsXJO4TDzQWf2uaDjywcoeklwvdnNJBE+T1dlf86QeqxSRTk+d6X8OIc2+RNonmGTY
	sxy1y0uZHvxDSouZW+pW5fTYA6tc3VrLa4HQojQetpGLah1HRcgL1uYE8bUofTdoCI+/S46ZO6LGw
	OPpklEROmgdWq4vR+U8n5vSXKJwzGHuw35LC0TMTqhA7nvC3vA0AEvvV++bfUS3gYjzGbIO+OL9qw
	RzTQi3oaNLI6xcl6q8DZ1Mq1Xhw27nILM1rZUSmqGEL1QT0WWLqAoEk6RjRJpfd41uXc3E/05YubD
	hWKVBrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQz-00000003sGd-2zCf;
	Wed, 26 Feb 2025 13:26:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGGT-00000003cvs-1wzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740571909; x=1772107909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/pmbTD4zoQM5iCGF3tYVmluO/FUN08Skf4yJBgTYALo=;
  b=ZHlWb+nPkjXDPyiJnuAhjuml8bkpw3CbSjSlKAIjRu7cECB5g4cab7Dt
   6Wg3/rZcZUuM+5zh8MXB3abAXdh9NgAPV6krylO113Ev64gGP8WB7Ktwq
   G/hqSIjblTX9PDZrOVJpojRJuyuRFDml3pE88csroiAuOKF22VMgmNIh8
   ZbqslqsLQn5dsPV6mevFX6DMitRUHeptthC68xL5tT8ReUJMVoGjmXT5u
   mWxmewZgWO/HRe6uwUko5rPLJnZe60EGGfIj17wyic4QKJQ4QPZNnG6LF
   ArWEF4t4/+XYIj5MAsbz1vvjPo0w/rXQVaBbfGn4KHt7CmwQgnW1viWr8
   w==;
X-CSE-ConnectionGUID: gBzX4PJ4QQSiaqg7GG/68g==
X-CSE-MsgGUID: Feg+Lb6pTEmmC38kdfvsRQ==
X-IronPort-AV: E=Sophos;i="6.13,317,1732575600"; 
   d="scan'208";a="42109020"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Feb 2025 13:11:44 +0100
X-CheckPoint: {67BF0500-13-F75C4246-F0BD6D90}
X-MAIL-CPID: 9D92D866341F7BCADD9B9A0C5F9DB091_3
X-Control-Analysis: str=0001.0A00211C.67BF04FF.009E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DAC5160D68;
	Wed, 26 Feb 2025 13:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740571900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pmbTD4zoQM5iCGF3tYVmluO/FUN08Skf4yJBgTYALo=;
	b=gIabMkuRWpL/0WTn84gsuE09kT3XzdhirDQnqP6YySN5f+D1ARPWj2u/wVPtieFB1gdcZe
	q6/n7YBAaklGUKdnF5PMXh3pT4uerD+aERsadH3OVZvxhWdcuHrjkgYsJTDB9sfZkqJ/Uf
	fWkaVTYM4eMGWTH+ncwDCfcEFhUk8gg2O39IMcAHp3WEh5INpWTYEd8pdUkuOy1RUxHueg
	r+MAsUr0PNRuGIg/oqM/LII4ayDw1fTaj/86RoyKEznrfiEvPKOPnKNThe3Rq054bq87Pv
	tytXSrKfgKQrSoT11unZwCYAo4eKenw/LvzVaZ9FU6xdGhLtsaxp4ROkKOJZmA==
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
Cc: imx@lists.linux.dev, hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map property
Date: Wed, 26 Feb 2025 13:11:37 +0100
Message-ID: <1995746.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250128211559.1582598-4-Frank.Li@nxp.com>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <20250128211559.1582598-4-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_041149_994355_DA8E7786 
X-CRM114-Status: GOOD (  14.40  )
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

Am Dienstag, 28. Januar 2025, 22:15:58 CET schrieb Frank Li:
> Add PCIe's msi-map and iommu-map property because i.MX95 support smmu and
> its.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 6b8470cb3461a..2cebeda43a52d 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1573,6 +1573,12 @@ pcie0: pcie@4c300000 {
>  			assigned-clock-parents =3D <0>, <0>,
>  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>  			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			/* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 =
*/
> +			msi-map =3D <0x0 &its 0x10 0x1>,
> +				  <0x100 &its 0x11 0x7>;

Aren't you missing msi-map-mask =3D <0x1ff>; here? Similar to pcie1.
Either way, with this change PCIe on pcie0 is not working anymore,
regardless of msi-map-mask.

Without msi-map-mask:
> OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100=
, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> OF: /soc/pcie@4c300000: no msi-map translation for id 0x300 on (null)
> r8169 0000:03:00.0: error -EINVAL: enable failure
> r8169 0000:03:00.0: probe with driver r8169 failed with error -22

With msi-map-mask:
> OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100=
, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> OF: /soc/pcie@4c300000: msi-map, using mask 000001ff, id-base: 00000100, =
out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> r8169 0000:03:00.0: enabling device (0000 -> 0003)
> r8169 0000:03:00.0: enabling Mem-Wr-Inval
> r8169 0000:03:00.0: error -EIO: PCI read failed
> r8169 0000:03:00.0: probe with driver r8169 failed with error -5

Without msi-map/iommu-map:
> r8169 0000:03:00.0: enabling device (0000 -> 0003)
> r8169 0000:03:00.0: enabling Mem-Wr-Inval
> r8169 0000:03:00.0 eth0: RTL8168g/8111g, d8:9d:b9:00:16:10, XID 4c0, IRQ =
166
> r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumm=
ing: ko]
> r8169 0000:03:00.0 enp3s0: renamed from eth0
> r8169 0000:03:00.0: enabling bus mastering
> r8169 0000:03:00.0 enp3s0: Link is Down

pcie1 works as expected. But this is only a single PCIe device, rather than
having a PCIe bridge.
Any idea what's wrong here?

Best regards,
Alexander

> +			iommu-map =3D <0x000 &smmu 0x10 0x1>,
> +				    <0x100 &smmu 0x11 0x7>;
> +			iommu-map-mask =3D <0x1ff>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
>  		};
> @@ -1640,6 +1646,14 @@ pcie1: pcie@4c380000 {
>  			assigned-clock-parents =3D <0>, <0>,
>  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>  			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			/* pcie1's Devid(BIT[7:6]) is 0x10, stream id(BIT[5:0]) is 0x18~0x1f =
*/
> +			msi-map =3D <0x0 &its 0x98 0x1>,
> +				  <0x100 &its 0x99 0x7>;
> +			msi-map-mask =3D <0x1ff>;
> +			/* smmu have not Devid(BIT[7:6]) */
> +			iommu-map =3D <0x000 &smmu 0x18 0x1>,
> +				    <0x100 &smmu 0x19 0x7>;
> +			iommu-map-mask =3D <0x1ff>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
>  		};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



