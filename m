Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DB8C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF5QN09m8wD/DAxZp57pL5p7sOu+zrVbutsLKLdh4Cc=; b=swOU9r5FXkENI/qiI2edOAss4U
	DccaMMGFcKHCwQaxCBI0sSpFBNTxkCmT5NWWSzG7nRqgGrZpc9d6B8yx411JiJ1pVecrBmKgBHTTG
	a/FCIVjHY9e/ztvL7hnobsZSKvGVpR1UplJwxE2ynGmGgj7ZBEh344i3PUfZZG1Uav8mcFzxCHwmx
	6jXv8OZ+ryfG/GsD0iNUHTUSkewCGzl7VuKtzJeXRVYCnGDdefG5qjNpk9qw1IYQZYmAQcNqq3PwN
	laewxtWk0ygRz/PX+o8OaT3+ppYst5uDJIgB8GjctbT9TFPJucCP7tuIbd/4uSyKHHKvPfRlYkJdm
	aRwKdSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Ph-000000010QH-0EeJ;
	Thu, 20 Feb 2025 13:16:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6LB-00000000zNC-0gdW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:11:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so1808770a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740057104; x=1740661904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF5QN09m8wD/DAxZp57pL5p7sOu+zrVbutsLKLdh4Cc=;
        b=Kj5I0X5WtN4FFW7qqEF34Q0/dPjoXgZzlsx7WrkjXIdfIErzOqsfkleqtt4zJMQLBj
         xYZ+5QLa4RUb3vcSNivMIVfdYkosjU5yQRk+x16r4NV67Zxhm0nLuF/Svpkhzlj5olKz
         3kHG0UlCnV7jD6AWDxbrgTGQiWIkRBIAcdLj8jva/sMH1Lusv8AfT84PWi/HvTWd3Ibx
         MeNx1Wla+kfOR1XWv9v4YAwZ2XEpkmCHRuDJqxUBhcXLQqiXI7F3xfzduitYTnpMoIPV
         rypZvoTf+CLahZUN9wsleRqoJaGCqsrRcHcLySOFiyguV+mGoRdYjhG7847KzszRNld1
         mIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057104; x=1740661904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF5QN09m8wD/DAxZp57pL5p7sOu+zrVbutsLKLdh4Cc=;
        b=Q/3D2t+I5IKdcrCo82XYK3kut8fMfyNOawzEX/QANCeBdrm7j/jX5LA4l+ABiPM21e
         8XngdnXi/NgLAqzT9M/xS78HxZzqzgwLeddFD/LQYSjGKy4Gom/iixrEcvycMjwUPiNZ
         1o7PCAOL+fX4wwlh88C4Sv1Vhm+vEhZw3V9t6UTAjb0GfbY1lGhxzISz4aEM3iR76X79
         BJaBND9AOZ9sNEd6rdi01jFKcea0hlLvxBB406Ole+ZDjgIu0QeDWDSfKJxkV2QHl/Y6
         6u6Gbe64MXOt5b7+AGRFSt/G+Vy5iVL+Ev2iM/AtbrrZItGno+BunTwDBzVVdIWcFrv5
         Wl3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr+3L0hW/HQNd/7+wF96CsU+2yfJk9D6eKpexlkrnBaq4srl2ItqZFuvqZCwiTZvxE5IAJewv04iB3h4ZNgt4a@lists.infradead.org
X-Gm-Message-State: AOJu0YwW+nxS5sHBctgfSTMHG+dAvvz9qIyDeMUAKBQuj8T87JHguR3F
	Dzujua5IkMkNnmvuNY1w1cMVSKdk18H2IWe71+6zG3EiHKRUse353YIUr5Guadf/p9G98YV80r0
	Whbuob1JdLuiWte08nMGFYED2Y2Q=
X-Gm-Gg: ASbGnct0z0cfrVXSW8X6+LefHMEeOrmsbO1R4ktWmSr6xWraJD/WlQoH+oxJCHpcjXN
	dHJFx0Pdxjp9/6WnTAtpnAdSm3qVeoW6vlTLVCN6BZSp9R4h7XwD9Xddd4cUlOMiiqFeVxde09k
	LoonbPA65oAr84VMYKIEuVfeobmYvh5Kg=
X-Google-Smtp-Source: AGHT+IF6yx7qrSwJDRsToFTnlYa/h0A1YhshZSR5dL4PvWKAo3vckuyvm/Wyqi6jEyYBH3tHibJkW5A+JtSeL88Uo4M=
X-Received: by 2002:a17:90b:2f86:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2fc40c1d548mr36337290a91.7.1740057102215; Thu, 20 Feb 2025
 05:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-3-daniel.baluta@nxp.com> <12614210.O9o76ZdvQC@steina-w>
In-Reply-To: <12614210.O9o76ZdvQC@steina-w>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Feb 2025 15:11:30 +0200
X-Gm-Features: AWEUYZlFjxlk4pWxNFB2rtjCHWnzpKUBBv6ujaPIet0mutNPJ0j906GL3_pdrJk
Message-ID: <CAEnQRZDU9HoiD9uBNi+inrZcn8KCRp3pUZQfRqaq5kauuxOi6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, shawnguo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	mathieu.poirier@linaro.org, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	peng.fan@nxp.com, laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051145_210641_86969F8C 
X-CRM114-Status: GOOD (  22.22  )
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

On Thu, Feb 20, 2025 at 12:37=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Mittwoch, 19. Februar 2025, 20:20:56 CET schrieb Daniel Baluta:
> > On i.MX8MP we introduced support for using a reset controller
> > to control DSP operation.
> >
> > This patch adds reset property which is required for i.MX8MP.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Docum=
entation/devicetree/bindings/dsp/fsl,dsp.yaml
> > index ab93ffd3d2e5..923e7f079f1b 100644
> > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > @@ -82,6 +82,13 @@ properties:
> >      description:
> >        Phandle to syscon block which provide access for processor enabl=
ement
> >
> > +  resets:
> > +    description:
> > +      A pair consisting of phandle to audio-blk-control and an index r=
eferencing
> > +      the DSP Run/Stall bit in audiomix registers.
> > +      See include/dt-bindings/reset/imx8mp-reset-audiomix.h for each i=
ndex meaning.
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -164,6 +171,16 @@ allOf:
> >              - const: txdb1
> >              - const: rxdb0
> >              - const: rxdb1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8mp-dsp
> > +              - fsl,imx8mp-hifi4
> > +    then:
> > +      required:
> > +        - "resets"
> >
> >  additionalProperties: false
> >
> > @@ -220,5 +237,5 @@ examples:
> >                 <&mu2 3 0>;
> >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
> > +      resets =3D <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;
>
> Am I missing something here? fsl,dsp-ctrl is used to get the regmap from =
syscon.

fsl,dsp-ctrl was used to control the DSP. This functionality for
imx8mp have been now replaced by
using the reset controller.

The example where the diff happens is for imx8mp so for this reason I
changed it to use the
new way of doing the rest.

