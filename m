Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OCdIQ+1x1cdbbT6miIAd2P9zxEWox7eNmbXTr+ysKY=; b=CnSGvgzAjeR1Y10jPAKulJxaus
	AINVYEUoSzi3cPeUcYIg10Vi3wNRCBFUu92xT8WdJTvfl9cIbWVMOy672hTTnPiJ6xhcdzIvf+B7O
	W39OgIXSZac85pWr+ycQa/rYZHF8Qz6mQ3Gk7GZyvpbdyBOyD/P2hVvfkO741DJU0I1fFDsWgYddQ
	GTeTUTBsDbXlc/6bOxNeWWXesisXsb/Lf9lU9GObfHvw56eXUbgDiCDilwMrwlsSlRMaT2PiFCZJa
	TRB54XQDK9fTNWiPSdi1EoSf4Wudrp4iGTvu+J/DjJezsnu9HaMrwtzF5im2EzUOeALEHcruZc2Cs
	w9Icv4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1F-00000000LvR-3NnD;
	Tue, 25 Feb 2025 16:42:53 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwXt-000000001XS-3f81
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740496109; x=1772032109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8OCdIQ+1x1cdbbT6miIAd2P9zxEWox7eNmbXTr+ysKY=;
  b=V4ahG3OWP4tjyi4QJq7Hseh/gbyfPQOyK7nSBK6Tq0tqAUWPxdcxaNwW
   FPEBLhcmPYgc+EbLaH/a0gyVvXR856k6uI8OMFiijbpc2i0RccHrDqy5T
   TALAMiGbkNgWQxTuyDJfbWSP/6bnhCYl+h/BROdYh8GfuK6vemIYdg3bz
   XjYmHJfHSz4pQ55rpyQPBk9jgaQJxJbosMsexbh/DnrxUvSiCuqRBjAGO
   RSeraZRDP0jO41pckio2x7f1w/w9YJzYbF+bzODNxt/7rfL2dExK19A0Q
   88mgZMdYMIdJu73FCVeWOJRrauwnaQpk4kD5Eby3BXVZTvd7xUp0o22eM
   A==;
X-CSE-ConnectionGUID: 1GyThBsLQ4OceJgWl5whpQ==
X-CSE-MsgGUID: FsBtDC9aQT2FMo0eJhVDew==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42075805"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 16:08:27 +0100
X-CheckPoint: {67BDDCEB-D-B8541F8F-E50F9B0E}
X-MAIL-CPID: 05053AFA6C7480CC67EA1FCBF7FF12EF_2
X-Control-Analysis: str=0001.0A00211E.67BDDCEA.00A2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70C09161586;
	Tue, 25 Feb 2025 16:08:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740496102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OCdIQ+1x1cdbbT6miIAd2P9zxEWox7eNmbXTr+ysKY=;
	b=P9DTov8vYZt7Blks1GbficO9L/ZMl57uv2ZEwzS02Bqr9ZWS8uyxoxYPxvou+t/b2Oh2jX
	8KAfzObCZac4PfeKKPv4PAwAhjBc1ATBGLXxB3BWUxFZqqYmMBMziJPwk21hd/mN+bG/8v
	KeE2X+eWeQDHa4U3HmD9W28OwLqXFYQ4reeZYuY2li9KtwwJknfvG+5Hxcab3h9YYD8639
	QJSQa3uDCO6EGgd0lX06YXAlKb0+udsqaZKdtYlShKomBYFjJ8PjG4zgUAKBsCjxgMqdM8
	dQ7YHsSmY6qlN+DmfaWD/i+X5kuZ3xrhWyj8lymgD9BwEP3+ua9bmOZazZpAjA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB subnode
 into schema and example
Date: Tue, 25 Feb 2025 16:08:20 +0100
Message-ID: <2215802.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250225145254.GA2361434-robh@kernel.org>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
 <20250224142831.485159-3-alexander.stein@ew.tq-group.com>
 <20250225145254.GA2361434-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_070830_399671_E94996FF 
X-CRM114-Status: GOOD (  18.38  )
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

Am Dienstag, 25. Februar 2025, 15:52:54 CET schrieb Rob Herring:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On Mon, Feb 24, 2025 at 03:28:23PM +0100, Alexander Stein wrote:
> > Document the LDB bridge subnode and add the subnode into the example.
> > For the subnode to work, the block control must scan its subnodes and
> > bind drivers to them, do not misuse either simple-bus or simple-mfd
> > here.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-=
blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > index b3554e7f9e76d..d914dea6ecbb5 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctr=
l.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctr=
l.yaml
> > @@ -24,6 +24,14 @@ properties:
> >    reg:
> >      maxItems: 1
> > =20
> > +  ranges: true
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> > +
> >    '#power-domain-cells':
> >      const: 1
> > =20
> > @@ -46,9 +54,20 @@ properties:
> >        - const: csi
> >        - const: dsi
> > =20
> > +  bridge@20:
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          const: fsl,imx93-ldb
> > +
> >  required:
> >    - compatible
> >    - reg
> > +  - ranges
> > +  - '#address-cells'
> > +  - '#size-cells'
> >    - power-domains
> >    - clocks
> >    - clock-names
> > @@ -77,4 +96,36 @@ examples:
> >                 clock-names =3D "apb", "axi", "nic", "disp", "cam",
> >                               "pxp", "lcdif", "isi", "csi", "dsi";
> >        #power-domain-cells =3D <1>;
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +      ranges;
>=20
> Given the address below is 0x20, this looks wrong unless the parent=20
> address is 0.

Thanks for pointing out. Because system-controller@4ac10000 is not
a simple-bus I assume this needs explicit ranges, as you pointed out in
your comment on Patch 4, no?

Best regards,
Alexander

> > +
> > +      bridge@20 {
> > +          compatible =3D "fsl,imx93-ldb";
> > +          reg =3D <0x20 0x4>, <0x24 0x4>;
> > +          reg-names =3D "ldb", "lvds";
> > +          clocks =3D <&clk IMX93_CLK_LVDS_GATE>;
> > +          clock-names =3D "ldb";
> > +
> > +          ports {
> > +              #address-cells =3D <1>;
> > +              #size-cells =3D <0>;
> > +
> > +              port@0 {
> > +                  reg =3D <0>;
> > +
> > +                  ldb_from_lcdif2: endpoint {
> > +                      remote-endpoint =3D <&lcdif2_to_ldb>;
> > +                  };
> > +              };
> > +
> > +              port@1 {
> > +                  reg =3D <1>;
> > +
> > +                  ldb_lvds: endpoint {
> > +                      remote-endpoint =3D <&ldb_to_panel>;
> > +                  };
> > +              };
> > +          };
> > +        };
> >      };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



