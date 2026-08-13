Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841BBC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NY/kTVoJS7JBCe0ZeDKhM9AwzQeDZAj/AYt9Nsuv+oE=; b=jlSS3JiK6JzTiNZp6R/IPKeRZr
	ztifOvmXr3S9VDG2aKoX2iMsVwxhuS6K7tAd4+27qI0DYVsl+hnaUPpXquWsag6B8sV0amTKzpO5H
	Eq5MyH5b4etlfveYdDFAXOU0n2diK5TpCn9Yj6qGfPhrt/ytViJszHLqNk9Zfnwvjf8smgh/ZqO5T
	sKgwtgrk/N2rqF2AqC4UPX1hG1lDmz+lDdwRzQIqUbiJ8IcjlPDO6MylzbpeyQ+6mPZQu48ku4bUK
	HFlO5l5uW5zyfU0QUZF6etTu0OHEGLZefd/ZlD6QdxaanRUd/7OPG2/gdxWIU/xrZR518r5IaE5RL
	N1QZp4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuREQ-00000000EE5-3lIB;
	Thu, 13 Aug 2026 08:56:10 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuREO-00000000ED2-23rz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NY/kTVoJS7JBCe0ZeDKhM9AwzQeDZAj/AYt9Nsuv+oE=; b=RkP5++jDJ43V7LuFqHVwcMXj/p
	yK9l14sgq87/6fQbgJHH8iwsTpnmjlQjbSnEHZqlNyur8Zm9uLsQ0/TaTiOz71VjeDP1EEutc5pJV
	5AxZzh4WXctSrybsQ+tRUONJTWIcJ+FKXk6YXAAG0OOJlGHrAGYkWw2+rQj8fNudFQJqSC06OLpKv
	LMqmLERhJtwXBHm6sfMMm+s/ppAl+xrUQ7TvzyxqRQX1fyujOhm+PqLRBSirt73H7W50sgXe2sFtP
	z78STzZeu5kC9hCDhTgZ4pFAejX/wG/SsXNRPdPxLoemWJOhpSpT2UlNYCfpwv7H19CYY5aMqOfio
	HKAx6hhw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuREK-000Bx1-05;
	Thu, 13 Aug 2026 10:56:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuREJ-000PrA-1O;
	Thu, 13 Aug 2026 10:56:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 10:56:02 +0200
Message-ID: <7661119.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260813083402.GA19687@francesco-nb>
References: <20260812132954.148571-1-francesco@dolcini.it>
 <20260813-classy-boa-of-apotheosis-57207e@quoll>
 <20260813083402.GA19687@francesco-nb>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015608_529138_A608A44C 
X-CRM114-Status: GOOD (  22.09  )
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

Am Donnerstag, 13. August 2026, 10:34:02 CEST schrieb Francesco Dolcini:
> On Thu, Aug 13, 2026 at 10:10:43AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >=20
> > > The DPI output of the LCD interface can be configured with a bus width
> > > of 16, 18, or 24 bits. Introduce a bus-width property to the output
> > > endpoint, specifying the number of parallel RGB bits connected.
> > >=20
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > > v3: use video-interfaces.yaml
> > > v2: use the common bus-width property instead of the legacy interface=
=2Dpix-fmt
> > > ---
> > >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++=
++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml=
 b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > index 2dd0411ec651..1f3daf002707 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > @@ -71,6 +71,15 @@ properties:
> > >      $ref: /schemas/graph.yaml#/properties/port
> > >      description: The LCDIF output port
> > > =20
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml
> >=20
> > This won't work, you need to test your DTS. The port schema does not
> > allow video-interfaces properties. You need port-base, like in every
> > other case.
>=20
> Thanks for the review Krzysztof
>=20
> Given my testing was not ok, and I am not sure what I did wrong exactly
> on my tests, is this the change I should do?
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 1f3daf002707..89cea0c14cf1 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -68,7 +68,8 @@ properties:
>      maxItems: 1
> =20
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
>      description: The LCDIF output port

With that change:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



