Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72763C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGPC/hW5rIZq2gK7yDJbioksTlO1e7DjzYy5/dkDYdU=; b=jx+TnhYQgemnef/eIHWVyN08qr
	Ul/9XZAAM6Pt7RPVHrD87v9+ffwXF7X0k2Eo/N5Tu7cBCXkzzNyyBxWC6QzUC5TNBIyv2wwgxwXUR
	XYQdfRMcbWBY0AiJ3p63l0+VhBkA2GaeMovMZrINUvHAY8p+iqTAZqeZqfvX7ruwr/4LYUpuPyCBQ
	TOaMM9zs6QpALNi+OBK0eAc8KfO5sMpPPp6UmapTecGBia6rAyYs5qZDbkLsbgXQhxDidu2hpHFNi
	Pym5wcPL0qhakfPgSPohfKDHErQqhAjbVdsVn8uPSgaX95Y8WuZI5e4k1NbFDQz9WVVdzC+PzmlfJ
	LN9o5Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrTH-0000000AiwF-3afa;
	Fri, 31 Jan 2025 13:54:11 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrQ8-0000000AieB-2zhn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 13:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738331456; x=1769867456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pGPC/hW5rIZq2gK7yDJbioksTlO1e7DjzYy5/dkDYdU=;
  b=MoRPAoK6yhD0QpSzAAWA1RS65RADQTvAHBaJokJKRBaBJZfG3u6+VqDi
   pYJlmj7n24lIVKkFQVHT8JA1yiwFofZb09H5CyhLHMST29otUo50Cr9Pt
   akysMXJo+aCE+47j9B2vKQjqDiLmT7CFMA5KKtxJ6OAu/16yAMixzlVkG
   yaoBV9qXOhPgLaCF23pe5D7DqxiRyChL1GlqtZhkFbpP+6qnysvkLnTBx
   8gUipbeT43ch975q+kLYropKs9aGLZiAzE9Pf1ZD3gOovj8x0CzrjvY6a
   QTyBysgDRMJAxairV3PE9JuFsLTpBBdpUKSoT6mYa1HryjvCNCJSGIPwc
   g==;
X-CSE-ConnectionGUID: VPJl4Oi8QxuRrbOgBPYfKw==
X-CSE-MsgGUID: OkSFhy6DTdGm4UslsPUvag==
X-IronPort-AV: E=Sophos;i="6.13,248,1732575600"; 
   d="scan'208";a="41406883"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 Jan 2025 14:50:52 +0100
X-CheckPoint: {679CD53C-1A-9B2B6168-EB6F31C5}
X-MAIL-CPID: 34B68224B8FC38765AC27969C122FFD7_5
X-Control-Analysis: str=0001.0A682F21.679CD53C.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6628516B72B;
	Fri, 31 Jan 2025 14:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738331448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGPC/hW5rIZq2gK7yDJbioksTlO1e7DjzYy5/dkDYdU=;
	b=EVsc4krdjIMtoDa0hRHx1mKilyp25g9YTglPKr9VfffkrxA40Ccm8NQuxhWl30vKnRXuoP
	ab3NHzUAB0LkHuMtwjOlh1Sxg+tDPDoJ4gjOkXA7LGRilx59MNf59ropLqwcI4VRR+qvll
	Cjj7llTIJrf7cwoz5FX3+Ca9fmeqGT0IuUoZAPi0o/nbeoAJbhNYgl0mnStE2vA/FGSl4x
	sDrURZAkbblN0ctVutb8j+wUsHWjDQw0c3zxLSk0GIXFwxZ0hylHWxN3Ou36bQg4f5w1Hf
	jH5ZfcYh4HBqw52MAFH4UN2vh6qxs3R46gzXyQH6d6BxvgYtQ/C/vNJS3WtHpQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
Date: Fri, 31 Jan 2025 14:50:46 +0100
Message-ID: <4989387.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <deef6dcd-27a0-4109-9788-a755fd390f55@kernel.org>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com> <20250130130101.1040824-4-alexander.stein@ew.tq-group.com> <deef6dcd-27a0-4109-9788-a755fd390f55@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_055057_246738_FE226475 
X-CRM114-Status: GOOD (  13.88  )
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

Am Freitag, 31. Januar 2025, 08:20:40 CET schrieb Krzysztof Kozlowski:
> On 30/01/2025 14:01, Alexander Stein wrote:
> > +
> > +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct devi=
ce_node *parent)
> > +{
> > +	struct device *dev =3D priv->dev;
> > +
> > +	for_each_available_child_of_node_scoped(parent, child) {
> > +		struct of_phandle_args args;
> > +		u32 id, idx =3D 0;
> > +
> > +		while (!of_parse_phandle_with_args(child, "access-controllers",
> > +						   "#access-controller-cells",
> > +						   idx++, &args)) {
> > +			of_node_put(args.np);
> > +			if (args.np !=3D dev->of_node)
>=20
> You are using args.np after dropping the reference.

Indeed, but is it really a problem? The args.np pointer is still the same.
So the comparison is unaffected.

Both branches need to drop the reference, no?
But the following looks awefull as well.
> if (args.np !=3D dev->of_node) {
> 	of_node_put(args.np);
> 	continue;
> }
> of_node_put(args.np);

Best regards,
Alexander

>=20
> > +				continue;
> > +
> > +			/* Only support one cell */
> > +			if (args.args_count !=3D 1) {
> > +				dev_err(dev, "wrong args count\n");
> > +				continue;
> > +			}
> > +
>=20
>=20
> Best regards,
> Krzysztof
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



