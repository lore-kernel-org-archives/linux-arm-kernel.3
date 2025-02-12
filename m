Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8724C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ebrh2pOj9a+WCHOfQy3AldxKt0RQJILfJP7w8ELhKWs=; b=3T6RSafnLzqjP5WcnHgnQaj/Jr
	H6E1oc0Y/YH2AP6iwWF3klrQi/+hOQ7Fy+Kmm+v7ESwtdxwWhg8L/Lbk48dTzd2a9ug8D/8fxx+cO
	ukKr6vT9hakdL47lEGh0kUTwGWnf5VWQwnZ6/9gOYXq69ndEqp8vQb7xjJMoCJq+GtQ6ETySsdBkd
	3+HgSpqQVu61nsWEar79qN9DJqYqlnz1sV4hbj3JvS9AArIcFtjZa9ZpvYkru8C/iSgxqvDnk0zZR
	R8YE+oTHiSEDhcEt2dhIcNZeBBSTNn+E/sBiFVsmIMR5jnCfQuIbItkqAZEANHAEa64aiCjPOpmxw
	7VgukcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7rI-00000006Zyr-0NQb;
	Wed, 12 Feb 2025 08:12:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7po-00000006ZQC-2x1Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739347864; x=1770883864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ebrh2pOj9a+WCHOfQy3AldxKt0RQJILfJP7w8ELhKWs=;
  b=l8HhBtIEPkX/FRiH4rZUKBMwHqOyIigShMBptDk0fr5IEYuTJEE4JtMU
   ZKew0Pxtv4JMdK9VjnTuKgKJ4EGibNqr0GUXagLlWqys6WN6lv3i+kTuO
   TPk5nnNwCj+EJP2SY7RWUiBRbq2T8S29YUy3EOySVohIGEP6+eWOe/lkv
   qd8V1GcrEca+HHsTVr86ifWHh+tsfCxvw5+xNrEiqggQXL4jQsHbtFWpV
   JlVgx2hTbdjNkmxn4WqTEHb2qYLiGsScE/APvTk/BByzn5/C88k8cxTi4
   RwZOyV7EK+aRxkZmsuOew5yd6k/kvvJsuh4ZFm/v0xRUor/DrXrnC2GXE
   A==;
X-CSE-ConnectionGUID: jp/xOS/UTUmFNhbEqlMSOg==
X-CSE-MsgGUID: IFthUYPIQ0O5JgMafUVjGw==
X-IronPort-AV: E=Sophos;i="6.13,279,1732575600"; 
   d="scan'208";a="41778546"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Feb 2025 09:11:00 +0100
X-CheckPoint: {67AC5794-B-C21CC984-D1047F1F}
X-MAIL-CPID: 70FDB8AC22B42A0ACE772440BDA64D6F_5
X-Control-Analysis: str=0001.0A00636F.67AC5794.00CB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09E9016A031;
	Wed, 12 Feb 2025 09:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739347855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ebrh2pOj9a+WCHOfQy3AldxKt0RQJILfJP7w8ELhKWs=;
	b=f8FcOgztq6fes3vM/7CvY2rSKSKOMniJdix9XndFkfY8RpufORB/SLLs+nI2s41/ZQCu/X
	yqni/qQKcZAo010dcy/NUnvTPHKNeam83NjIoojMkIVhNDGltYI/emrhg0ODzfsGML8Kh6
	0BwTljpycstH0lQYYyp8bp/rUBd3SqaHkFN3t5CJrwpfw7/X1XDuD7RasNQWTuZvUNX8CS
	MgNLRwSIOQZJ1iSHhPGZ/gLmcTdi/o7spHz8fvL/bQI0J5rwkiYczQMBkjewlYWoPJ/Gjv
	84qK0gBDf7e8bS1+Omt288PbcPWN97XySBTm3NItO0vbkbFtwrHbCsX74vqwrQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Wed, 12 Feb 2025 09:10:53 +0100
Message-ID: <10618164.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250211033340.GA13109@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <2222299.irdbgypaU6@steina-w> <20250211033340.GA13109@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_001105_356921_9F36558B 
X-CRM114-Status: GOOD (  34.07  )
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

Am Dienstag, 11. Februar 2025, 04:33:41 CET schrieb Peng Fan:
>=20
> On Mon, Feb 10, 2025 at 04:48:56PM +0100, Alexander Stein wrote:
> >Am Montag, 10. Februar 2025, 03:36:48 CET schrieb Peng Fan:
> >> > Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-
> >> > controller references
> >> >=20
> >> > Hi Peng,
> >> >=20
> >> > Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> >> > > On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> >> > > >Mark ocotp as a access-controller and add references on periphera=
ls
> >> > > >which can be disabled (fused).
> >> > >
> >> > > I am not sure whether gpcv2 changes should be included in this
> >> > > patchset or not. Just add access-controller for fused IP will not =
work.
> >> >=20
> >> > Well, I was able to successfully boot a i.MX8M Nano DualLite.
> >> >=20
> >> > > i.MX8M BLK-CTRL/GPC will hang if the related power domain is still
> >> > > touched by kernel. The pgc can't power up/down because clock is
> >> > gated.
> >> >=20
> >> > Well, with GPU node disabled, no one should enable the power domain.
> >> > But to be on the safe side I would also add access-controllers to the
> >> > corresponding power domains as well.
> >> >=20
> >> > > This comment also apply to i.MX8MM/P.
> >> >=20
> >> > Sure. Do you have any information what is actually disabled by those
> >> > fused?
> >> > It seems it's the IP and their power domains. Anything else?
> >>=20
> >> In NXP downstream there is a patch for  drivers/pmdomain/imx/imx8m-blk=
=2Dctrl.c
> >>=20
> >> soc: imx8m-blk-ctrl: Support fused modules
> >>    =20
> >>     For fused module, its pgc can't power up/down and clock is gated.
> >>     Because imx8m-blk-ctrl driver will pm_runtime_get_sync/pm_runtime_=
put
> >>     all power domains during suspend/resume. So we have to remove the
> >>     pgc and clock of fused module from blk-ctrl DTS node.
> >>     Update the driver to support such case.
> >>=20
> >> But this patch also needs U-Boot to update device tree nodes,
> >> I recalled that U-Boot will remove gpc nodes, but not update blk-ctrl =
nodes.
> >
> >Does it work, if we add the access-controller as well for pgc_gpu3d
> >on imx8mp? There is nothing in blk-ctrl AFAICS. But for VPU there is.
>=20
> Adding access-controller under pgc_gpu node will not make fwdevlink
> work for the pgc_gpu nodes. It does not have compatible, and device
> is created by gpcv2 driver using platform_device_alloc. Same to vpu.
>=20
> >Which clock needs to be removed there in case g1 is disabled?
>=20
> Take i.MX8MP VC8000E as example, the vpumix blk ctrl, the vc8000e
> reference under vpumix blkctrl should be removed, including pd and clock.

Wait, so you want to remove the last entry from these properties?

> clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>,
> 	 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> 	 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> clock-names =3D "g1", "g2", "vc8000e";

This violates the DT binding.

> So for non-blkctrl nodes, it is fine to use access-controller and rely
> on fwdelink to defer probe. But for blk ctrl nodes, it will not work.
>=20
> For pgc nodes, it may or may not matter, not very sure for now.
>=20
> For blk ctrl nodes, we need provide a generic API saying
> access_control_check or directly using nvmem API.

Reading access-controllers.yaml this should still be feasible for
providing the necessary information.
But I'm note sure where to implement this. In e.g. imx-ocotp would be a very
SoC-specific API.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



