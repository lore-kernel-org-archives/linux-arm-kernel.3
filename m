Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C710CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=; b=t6yW8r5P5M2Ibyg8PMURRsETDV
	EGV/w0WQnqqvQsrE3LoBhygUOH3H7tSGgny0WQPN/5qa+MvBGsVk4WYzOFc/WHZSe1SG1XIvcbbFH
	L6XIDJTQ750E//+EUPKml7zU58MVlAeHUiOJOWq7jf3A2fdNwOSYDvKIka9mcnwxgLgO+cpHaQ4xV
	ExYIjo5n8ru6CpU4d7VFGoM3mAjShzNOPWakE0KCXWQNAr8LDZWRc35N1/tBqWQO9e/LQNFXf7oa0
	WUYrTXQaj2kLyR/u+NXttvoBUZyOtTOl4AROZEYWp3/o2cCtxNlfDwcqCDGduN0wEBbV2ui3VTHu7
	pGnfPELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKUm-0000000FWfE-2AYv;
	Tue, 02 Sep 2025 06:27:56 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKRs-0000000FW7p-3wNs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 06:24:58 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e96f401c478so4613573276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756794295; x=1757399095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=JSlRShp97jW/p4aXjshrTYjIr84zMr+rJPPIm4ast0AFn1/VtZaIO23aE4c+Bw8ZUv
         pkbMi59ARM9XNmCaJ/yy1mmGfH7kyxU7UjoMfLhtpMrwtBHlP+MWOPknKQXc1J+VACHP
         oDmqHubr82rO5V8hhN8s5OBP3O1FpM1Ln+ZOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794295; x=1757399095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7vWWxNzseg54QZAjivUxxK0pnJ4DlOhxfw0ykDICyI=;
        b=iOxVoPCk0Gwa9OsBsUnEccR7XTlC1EyRICaRVFqCMKJEWlja9knNL7J6d9J0GV14sb
         wT0G1sEBI3WtE1p2m82o32FPpG2s3MzEK0BbWOu9et2CmOHV+4/KnhH1DdQqnESF+5pU
         UCMKraclwjOMZCJmjNUB6epYWJRqti+YdCliVQ7AlWO1dIF8+paRPTKcoM9sE8+p/Pl2
         TKONRJcM4y6g8cT4yi/Qp9ZkLH9Gq68cnAAPX2z7jaosJnBicQaoQ1e1lZ0dJODukTnS
         OW1lFCFripmHUMny7nKCeZU+S3kLqCbvaUPmiXiB485CHNHTIFvYVLkF/aUfVYUEfdw4
         3dXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSv63n7ILdJ2VT8gE0SMGUDn7t1mjeILvAj3VTVy4PSAPHimicqLshlaYWJPTUD6UpHrBrea7+zKhTj0RcoNVt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl/HvTHhzWuQsOX3lAPFQamNhEmRkoOF5CBWU3rzjahI9hA0Wm
	ChlmJi0ICcD5Z77BcuLgFbkpfMqd8+pddWO40zYHKapSv22st+Qli20XuHqYAtpYwIV/bBlTLnD
	FFqSKTqcxSs9eR8VX0HHq8E8nRa49sDcjAwoHfvlLjw==
X-Gm-Gg: ASbGncs37MDrH8gy65HVY1zvPFdj1Abngwt0tHinevzqzgra3XPuyDWaD33RRjWMKEZ
	ZkkYBc5U1DUBeAI1/UN2ESAIAicQ+54IeSJ1vrKjGzGfnAs1mgu0QA8FqhaWgJGg9muFetjlspt
	dADcLGjwBUCyQUcf4xINfNNYKOPXfusg1HHwXvs09lR31g//JmtEzsQzOJyPviJ/L0hwsqZffh4
	FGxvrOVtU/Nz6ir
X-Google-Smtp-Source: AGHT+IEC+bhwfIsYKYd4OXHEYbsF24ESl19VnrU0Lm+wzyoJZpbOTOeMhCWWexm/yC9IvNQdZvyYLuGaB9Amv1jSkRs=
X-Received: by 2002:a05:6902:e03:b0:e96:ec6a:26c7 with SMTP id
 3f1490d57ef6-e98a567eea7mr11493602276.0.1756794295489; Mon, 01 Sep 2025
 23:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
 <20250723050319.GA1239529-robh@kernel.org> <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
In-Reply-To: <CABGWkvpWPXz8bFPC3OgqY+C6cgu6hHGh6muCQkoCOEVK048fSA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 2 Sep 2025 08:24:44 +0200
X-Gm-Features: Ac12FXxEccgAI8M5f9oOb9ii1ya7raF_SCejPp9-Hl3t92BIFWLzJIdX2D6ZhXo
Message-ID: <CABGWkvqazpyra=n5Jswon576pGG7yEOQg=_qdpTM+X6WmHP43g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_232456_984499_F4974C01 
X-CRM114-Status: GOOD (  27.59  )
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

Hello Rob,

just a gentle ping =E2=80=94 I=E2=80=99ve replied to your comments on this =
patch, but
I haven=E2=80=99t seen any further feedback.

Thanks and regards,
Dario

On Wed, Jul 23, 2025 at 8:25=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> On Wed, Jul 23, 2025 at 7:03=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> > > Add support for glitch threshold configuration. A detected signal is =
valid
> > > only if it lasts longer than the set threshold; otherwise, it is rega=
rded
> > > as a glitch.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >
> > >  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++=
++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,=
imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,i=
mx6ul-tsc.yaml
> > > index 678756ad0f92..2fee2940213f 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-=
tsc.yaml
> > > @@ -62,6 +62,23 @@ properties:
> > >      description: Number of data samples which are averaged for each =
read.
> > >      enum: [ 1, 4, 8, 16, 32 ]
> > >
> > > +  fsl,glitch-threshold:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    default: 0
> > > +    enum: [ 0, 1, 2, 3 ]
> > > +    description: |
> > > +      Indicates the glitch threshold. The threshold is defined by nu=
mber
> > > +      of clock cycles. A detect signal is only valid if it is exist =
longer
> > > +      than threshold; otherwise, it is regarded as a glitch.
> > > +      0: Normal function: 8191 clock cycles
> > > +         Low power mode: 9 clock cycles
> > > +      1: Normal function: 4095 clock cycles
> > > +         Low power mode: 7 clock cycles
> > > +      2: Normal function: 2047 clock cycles
> > > +         Low power mode: 5 clock cycles
> > > +      3: Normal function: 1023 clock cycles
> > > +         Low power mode: 3 clock cycles
> >
> > Don't we have common properties for this expressed in time? Debounce
> > time IIRC.
>
> I tried checking in
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> but I didn't find anything about it.
>
> It exists in some specific touchscreen bindings:
> - azoteq,iqs7211.yaml
> - brcm,iproc-touchscreen.txt
> - fsl-mx25-tcq.txt,
> - ti,ads7843.yaml.
>
> Only fsl-mx25-tcq.txt expresses it in terms of time (ns).
>
> Thanks and regards,
> Dario
>
> >
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -94,4 +111,5 @@ examples:
> > >          measure-delay-time =3D <0xfff>;
> > >          pre-charge-time =3D <0xffff>;
> > >          touchscreen-average-samples =3D <32>;
> > > +        fsl,glitch-threshold =3D <2>;
> > >      };
> > > --
> > > 2.43.0
> > >
>
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

