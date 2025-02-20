Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75749C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+oE9ycbC0603bsKVd233oRRg0AuABTZ4kzML2kwZR8=; b=kFPTmCCodUbmue6FapRNBObdPr
	Davio/d74anQylSe5VddUvZho8DypEsk0vzXecm89bf373GLxDDPb3xRJaxZKb8MsE0YFIX8SCCrc
	8OpkAMmOUDdoPWyqTcBccGLTvtwGFH1AEvGcrHJet+S3THPMu3yOx97PKkasBw+TNPMSvFXdlUuoD
	0nqbmyHCo2t2XWyomJnn/3SHuF/FlRBnEJ8zDHE6wMvJfRfhYhiaOULmnQByoyzg7VEyirQfNehjC
	LoB/PiR9n9kDKHij2+ThkZs6TT1CHu/CDVuarNSgwb/9YPixpkdVcKFLbDdPEB/hE6j1xfdKsF+vj
	PWN9IdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7zz-00000001RKV-1wB0;
	Thu, 20 Feb 2025 14:57:59 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7yT-00000001QtT-0LCS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740063385; x=1771599385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+oE9ycbC0603bsKVd233oRRg0AuABTZ4kzML2kwZR8=;
  b=chPxyl7WyR4/LyeOS3PJiRwZLK4gUiQk9n6sVOx1SiDgzcNeYU6cGF5k
   nckZBxXABC0E8RlNgvqzaz+8t6ePf4qZ3JVeShzdpRqsgvJBwiBfUyBGN
   cjrzOq40kQsTHIu6s8HTrdVXsMLiGehVKZg8RdoJQnNAMSqPOzGZAy1bw
   TtWYz+v2Ou90O6i5q8fX9B9PY/o8TJOTYjshkwmhFB1sbVkOEi27QFAPq
   ByyHr5zC57iWOg7Spg6tEe8fz482/q7CPQjYEFnhj1L2bLkGEx7rbD2La
   8NNRldAw123+WtAnOghGbiiurZt4rGpE99lCPWB5Vn8x1uvxNpFOsI2Wv
   w==;
X-CSE-ConnectionGUID: W4HPKULnSKKA4nSjoEUZoA==
X-CSE-MsgGUID: oTh/8wVLRz2R++zgJdaILA==
X-IronPort-AV: E=Sophos;i="6.13,301,1732575600"; 
   d="scan'208";a="41984277"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Feb 2025 15:56:19 +0100
X-CheckPoint: {67B74293-15-EBA888C4-C1AC8B84}
X-MAIL-CPID: 7722C96904D91C2DA0956815BF213B70_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B86101657D9;
	Thu, 20 Feb 2025 15:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740063375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+oE9ycbC0603bsKVd233oRRg0AuABTZ4kzML2kwZR8=;
	b=tUX07zcQfsKSY9PuQuU9pNewWK+34vb0xzSyr8Qt4p71UcWvC5mRGH50LmyoTdBaY8/GSu
	zNgdjzdvVuzHu7t4JkEedcoAukN5ghE02JKporcRii18vzoY/pgExznFOfCS2I5sSFQZpu
	s6LRHIlR4ClHIV3MYrbr6UMaLcg2X0jrRERyZ3VSoRPAaRqH/cU92QdI1RnhahcSEKs37o
	oaOqy5Bg6YtRPPSsZyevfhwYr9j5kFa5XSrqf4NIhklNu9RG6e+VxI6AHkVGg5OmRsOGqv
	WUKn7v43jWkUzxQgiHpCIQV/YyQOru6so0LklqqBBZSmGSTDSc/dXoPELiwQSw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, mathieu.poirier@linaro.org, shengjiu.wang@nxp.com,
 Frank.Li@nxp.com, peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
 iuliana.prodan@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Date: Thu, 20 Feb 2025 15:56:13 +0100
Message-ID: <2359786.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAEnQRZDU9HoiD9uBNi+inrZcn8KCRp3pUZQfRqaq5kauuxOi6Q@mail.gmail.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <12614210.O9o76ZdvQC@steina-w>
 <CAEnQRZDU9HoiD9uBNi+inrZcn8KCRp3pUZQfRqaq5kauuxOi6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_065625_619231_89623D3A 
X-CRM114-Status: GOOD (  24.75  )
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

Am Donnerstag, 20. Februar 2025, 14:11:30 CET schrieb Daniel Baluta:
> On Thu, Feb 20, 2025 at 12:37=E2=80=AFPM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi,
> >
> > Am Mittwoch, 19. Februar 2025, 20:20:56 CET schrieb Daniel Baluta:
> > > On i.MX8MP we introduced support for using a reset controller
> > > to control DSP operation.
> > >
> > > This patch adds reset property which is required for i.MX8MP.
> > >
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 +++++++++++++++++=
+-
> > >  1 file changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Doc=
umentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > index ab93ffd3d2e5..923e7f079f1b 100644
> > > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > > @@ -82,6 +82,13 @@ properties:
> > >      description:
> > >        Phandle to syscon block which provide access for processor ena=
blement
> > >
> > > +  resets:
> > > +    description:
> > > +      A pair consisting of phandle to audio-blk-control and an index=
 referencing
> > > +      the DSP Run/Stall bit in audiomix registers.
> > > +      See include/dt-bindings/reset/imx8mp-reset-audiomix.h for each=
 index meaning.
> > > +    maxItems: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -164,6 +171,16 @@ allOf:
> > >              - const: txdb1
> > >              - const: rxdb0
> > >              - const: rxdb1
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8mp-dsp
> > > +              - fsl,imx8mp-hifi4
> > > +    then:
> > > +      required:
> > > +        - "resets"
> > >
> > >  additionalProperties: false
> > >
> > > @@ -220,5 +237,5 @@ examples:
> > >                 <&mu2 3 0>;
> > >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> > >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
> > > +      resets =3D <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;
> >
> > Am I missing something here? fsl,dsp-ctrl is used to get the regmap fro=
m syscon.
>=20
> fsl,dsp-ctrl was used to control the DSP. This functionality for
> imx8mp have been now replaced by
> using the reset controller.
>=20
> The example where the diff happens is for imx8mp so for this reason I
> changed it to use the
> new way of doing the rest.

Okay, maybe add another example for 8ulp then.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



