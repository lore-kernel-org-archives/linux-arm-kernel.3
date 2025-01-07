Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34460E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+jHg0ZRQrFyhampVjN9ER8cthsZkPVauZNM9jlIGhs=; b=Kz4zsFxHHAk0Tq/IqVQgCLC2c6
	VghBKWnE9i+BEG8qTEjCOMPPyQc6aal552xskLbGtTn8QKnp5SsV4uDfb7JSNxW9c97z29IfGDPl8
	Lae3Us5YillUg5p2ztxdPSC8ouqnvYt8sAvc/FgJvzhvCRfu+mi1mNrRR5D/3kf6PAcQTlqu43Omv
	fn7eYlVBFQZwS+l3T2ClRr4UDPPxmZTjceiz/VkZer1ZdHbYqkUsX9efL8HyA57nlDnLdQbRTeJL1
	Oy+tQk+sCzx72iVKVByM8O1mIW47IY/SaECyDKtsrFp3zSgpc+lCmpZfxpi/L2EGKVe1OMXeHhGoL
	yAO3VNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV75y-00000004QPN-0u5B;
	Tue, 07 Jan 2025 10:45:58 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV74R-00000004Q17-19If
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736246663; x=1767782663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y+jHg0ZRQrFyhampVjN9ER8cthsZkPVauZNM9jlIGhs=;
  b=WU8KthIkvA/bOT0wnQ3hyn8YVOkbHGLKGxkfo5KuIAN9zSqOTSizp2fs
   jNY88VAkUJYuAEWQILxzfLruBF92D6TIPCyWWsQRnu5w26S9BBgjqC8Hy
   Im5b9gXBEdU5Qtg8tbG+GYMndeqo8/B7CsBEYH/DRrpjJTiSM6mPzi1oZ
   jwvmdiUnqX/m40oYU/8EMTL9Z7NhWBl2CwezQMUJYzeo56GZtgoxpVb1w
   NLsSbseworsOlAuuMHB/djPvL7jhsydNH4nSELh+UtQBjFV8yah/Wc3n/
   dIQ88qdLhTpV1NQIre3ENcr/sE+VisSb4TQj+8nmwsYxjSKBjpkvoxbVL
   w==;
X-CSE-ConnectionGUID: Ou6ReafJR7SkqcE1EYK60w==
X-CSE-MsgGUID: tKisNOsmRJWh6tH7qXJrIQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40890871"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 11:44:20 +0100
X-CheckPoint: {677D0584-E-7C22D67C-DB53DE17}
X-MAIL-CPID: A3034B88B8AF551AC765663C245DBFCB_3
X-Control-Analysis: str=0001.0A682F24.677D0585.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80EDA163815;
	Tue,  7 Jan 2025 11:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736246655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+jHg0ZRQrFyhampVjN9ER8cthsZkPVauZNM9jlIGhs=;
	b=g5GU7kqqoZap7uAn4UMBWajpOzprQFaxD556BOi1CgZY6rHJNyHUk9jGerT8Wb4sf8lln9
	pheiYjByt1f2wMFLy9QBUC8+1IR3FSRFikQexnlwfzwcJOi0idLSAjld7IS2L8LX7vFly4
	7eSj9sVnb59W1uAaYipSUotv7IFuEVeFf3A8XLF19tAmnuZZZmDmuuJ1bOKnVsiXryu3i2
	delK0r0S/xJ11fn9Jc1DjCX1cpijQ8EgYsFz1W6EdMhBsS/aujrc13r7Np1ASoi+f51G/8
	hyQC62sqORa4OhKIA80cMODoOPGd23KHBB03EBfhxmN+JKKveO5R5WPngkyq9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: samsung, mipi-dsim: Add imx7d specific compatible
Date: Tue, 07 Jan 2025 11:44:10 +0100
Message-ID: <3358169.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAOMZO5CasQDRu=U7zUxzuFVBHyREZ7oyG8+SJjg2BF58B9G3wg@mail.gmail.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com> <20250107094943.518474-3-alexander.stein@ew.tq-group.com> <CAOMZO5CasQDRu=U7zUxzuFVBHyREZ7oyG8+SJjg2BF58B9G3wg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_024423_808791_E8040194 
X-CRM114-Status: GOOD (  23.13  )
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

Hi Fabio,

Am Dienstag, 7. Januar 2025, 11:35:48 CET schrieb Fabio Estevam:
> Hi Alexander,
>=20
> On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > This add a imx7(d) specific compatible which is compatible to imx8mm.
> > This silences the dtbs_check warning:
> > arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'on=
eOf' conditional failed, one must be fixed:
> >  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
>=20
> The warning here is about using fsl,imx8mm-mipi-dsim.

I'm not sure what you exactly mean. The warning isn't about using fsl,imx8m=
m-mipi-dsim, instead
fsl,imx7d-mipi-dsim does not match any compatibles listed in the schema.

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,m=
ipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mi=
pi-dsim.yaml
> > index 4ed7a799ba26b..e43fec5609417 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsi=
m.yaml
> > @@ -27,7 +27,9 @@ properties:
> >            - fsl,imx8mm-mipi-dsim
> >            - fsl,imx8mp-mipi-dsim
> >        - items:
> > -          - const: fsl,imx8mn-mipi-dsim
> > +          - enum:
> > +              - fsl,imx7d-mipi-dsim
> > +              - fsl,imx8mn-mipi-dsim
>=20
> But you added a fallback to fsl,imx8mn-mipi-dsim, so this does not look r=
ight.

Admittedly I'm having a hard time on DT schemas at times, but this change a=
llows
imx7d OR imx8mn to be used together with imx8mm.

> I have already sent the following fix to address this issue:
>=20
> https://lore.kernel.org/all/20241217131431.1464983-1-festevam@gmail.com/T/

This patch essentially does the same but add a new entry to the oneOf.
If you add fsl,imx8mn-mipi-dsim to that enum as we end up with the same
solution.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



