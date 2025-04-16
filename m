Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+AwIw+jiqBoahqy5bMs4qA16bD3AY0+KgeeCB5/7BE=; b=eKkTPC0F32/y/hD0gwGEbusZ6i
	XjrYZ3SDFox2ej8ovBnRCvwEQm7qmcZw2wiLlJUk9zJDX+cCmBKrN9pEakLueui6D39Ro4iB6i0zo
	AhVkDoBSz8C0cKPDZVTfkgg0FXJhmkW8XeEKo/R71eJkkkv89VMVXsWOOmf9TUzpKXeoKZGlWblo1
	2YQ7I4Z0MSo8DnfL5wBdlpUEqLl/ZI/LJEUWdDuxGopJ4jZsij+BdB+NHjyg/3RDLxa+VwIF2IHA2
	h5BPCqxGBlhGbjVYawrDrgTC3paSa78nFT/SGbsKh2aCyjj5EWAH67p3anj3lJ35EmU/vjAbKdaxe
	yOiw2sNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51N4-00000009POq-0igs;
	Wed, 16 Apr 2025 11:56:02 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51LA-00000009P61-0Bhq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744804445; x=1776340445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+AwIw+jiqBoahqy5bMs4qA16bD3AY0+KgeeCB5/7BE=;
  b=JjfcIS8DBKbzlV6G2rlhxAKrdvQbr/Tj4/8JJUgmCBH9mQKCsFv5XyZ4
   VWnTUHJH6doYJTNCQO9Z4DNYbxiNZFTeFsrlz4YMDAn4e+sjE5Bmr7DG1
   V0emNcOItA+VlTLZRJtcy9KuTWqVXGkyA1lnko8/cGxMLPSmslOmqog57
   WWZ7AY3w0EVMBky70yHv57PZvXdbj5UvqUyp6j7UmXPoE4+eFjxv3cPeu
   Pyx25gyoxnUWETbwQnDZq2M3+7Lj/+M5AblrOVL9dNw8HKxf3P4D+BwYe
   ZCkEZxeaPYzMqLiFzoJKKXKuXKo5M0m1roVR6L9apBthzM80o8I/waFnj
   w==;
X-CSE-ConnectionGUID: ylHedra1QWKFeZvyz3KQ9A==
X-CSE-MsgGUID: /0P0VCQATqu5/tkUK4dy+w==
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; 
   d="scan'208";a="43567665"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Apr 2025 13:54:01 +0200
X-CheckPoint: {67FF9A58-43-DC4DC9A0-F4F29281}
X-MAIL-CPID: 13CF670CCFADCC07300DFA99EC2DE8BF_0
X-Control-Analysis: str=0001.0A006396.67FF9A55.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 412DA16B203;
	Wed, 16 Apr 2025 13:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744804436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+AwIw+jiqBoahqy5bMs4qA16bD3AY0+KgeeCB5/7BE=;
	b=Ms/MGLW954pIAQt0KFwUZmPM7HVemUqZtJhiEGJKcsy1qOf+b5UXcqWjQZc60JnHqW9QB+
	QzXdK0hVd8ipAiVOLv3ubGPC11lAuGLtTOIHQxScE6hdNkqXUczd1o1Lt4eMc7L9yFA599
	m1Jl+wOWPsRsmRFDzMG0TLL0MySqHMMD9VAbgJZ4zbtHS2m+fWti7qHSwY2UPwGgOPcfoU
	IT/mF2x+Lfeer3fCYXllTtj5/Ql3srf88doRFDs46AcXnyq5zpOhDf/DX81pg4ZZHdjI7L
	TtBiLXKCggYNppeZdGeF9rfZfkvsc8+1MYLprQ4u/pUffLyKqSqYhfdnQvma9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for TQMa8XxS
Date: Wed, 16 Apr 2025 13:53:52 +0200
Message-ID: <4975795.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
References: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
 <20250415133301.443511-2-alexander.stein@ew.tq-group.com>
 <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_045404_571262_789BFE26 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

Hi Andrew,

Am Dienstag, 15. April 2025, 17:27:37 CEST schrieb Andrew Lunn:
> > +&fec1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec1>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy0>;
> > +	fsl,magic-packet;
> > +	mac-address =3D [ 00 00 00 00 00 00 ];
> > +
> > +	mdio {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible =3D "ethernet-phy-ieee802.3-c22";
> > +			reg =3D <0>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&pinctrl_ethphy0>;
> > +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +			ti,dp83867-rxctrl-strap-quirk;
> > +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +			reset-gpios =3D <&lsio_gpio3 22 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us =3D <500000>;
> > +			reset-deassert-us =3D <50000>;
> > +			enet-phy-lane-no-swap;
> > +			interrupt-parent =3D <&lsio_gpio1>;
> > +			interrupts =3D <30 IRQ_TYPE_EDGE_FALLING>;
>=20
> EDGE_FALLING is very likely to be wrong. PHYs are generally level
> triggered, not edge.

Thanks for that comment. I checked with my colleagues and it is
indeed level-low. Will fix in v2.

Thanks
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



