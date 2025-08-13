Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30864C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hANsG9cDZ8y0uwjnNV/4yPX2jp2bM/vF9ssenK54Q3g=; b=kAx6csdS0p8Jlx0ADr3G6+gcy9
	Pq9pliFvfwr0bIaqFIrdSOPptqKdDBbjVS6Yn8mAEsKNXOOmflz74ruLh58myXm/E/ylo2chu1J0s
	Zo0Po6XqCeB3zjQ3IUmXbR2WMFvHStzRwGiA4PNzqeSjJ5z228WYnYHszGQBzdXLbSvNoZrNcQ6/T
	v6JpCVXy6Pfcqdm7k2KbYNOgfCIduJqLyCriEBqemJM3GH/SNibhH2Ey/Crp/FpPtqOdcUZZUx4NF
	f4vLhDwZJXei+0yUJNhfbrn2IlG/78uuNQrqbLlC2cXOzT9c4zA0wb0lkbVONAc/OfOWK3iy5iRfB
	AM5YS8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um63v-0000000Cwy6-08IJ;
	Wed, 13 Aug 2025 07:38:19 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um57t-0000000CoUT-3grw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:38:23 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11430377a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067100; x=1755671900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hANsG9cDZ8y0uwjnNV/4yPX2jp2bM/vF9ssenK54Q3g=;
        b=xKaA47wM15LdYzqS74B1fB3CH8MvYszZFkWi14YrmT6Lky+gOxTQ4Xn74x9z9lefDp
         VsMbwsVUYgIiw3eBzyxHMVl37AyZmgtQP8+fk+KbOaCt+v+MfzHQ2TbFbj3t6eGE4GNx
         7M4kaQNsdobP6M/mZ+3ZXFvsYkvNjt3vaGe0KQDkT82M96tfGVBFfxw86UdcbbMj0EoZ
         rVtxop3l5GnnPx4iR7+LCUwradOixyDsETLv+hd5amv7YlOD5HBZFX4bLJ3sClEQaOlF
         JpemQDEOM3gzIOgcAjBmzwUrLVKGuIyfHl/jwKUzDICNkPrdix9+zFsM8c/wmJB85vph
         mQhA==
X-Forwarded-Encrypted: i=1; AJvYcCUoWh1XSykrwzpx3mr6QZ1xeJZ1YZu2Lk47aQ7WwmLu2oTg415LpIWQDZerpjp6okijX75AyMMQLmP/xb3T0Mxj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FF541zoSfKuO+iy6ccF3iWFP4jXYlDzczoIqd4rFfKewtksj
	wtzAQp3JVedHjmE6+rzAIA7p/bBs254fLcnfgU9lfF/QhDp/OSuMdpaFydP/NkI+V5Y=
X-Gm-Gg: ASbGncsGw6rMRUy42vbjEYXIWbN2ZsYfzuF9BBZ29EQJ8aEtlLmoqmH0ViD4lSKrLFW
	8spzgpt1NI+XP1is9bWG5qA8rCQqh3fB0UW+LinJ1Kl1Y0cB+ezBGn13H60Gd53I+2JSI7l0MH6
	pW+njokO5EXgnNy8Ed7C606AQ5++QDiYZi/kwq1uZqOLtbEszTTaK3NHwLdcwMBUBhaR3KNvffY
	ZpJMo1ORL4Snl+n3OS9peLL0/EFIwHfy1LakCzm05FS8DKywcxXkukJAHkRUQnrJq4Oi/au1NjP
	vKuBpuhc8qhi2wgWvFhd9o6nP/wucUnukhTN0InNLGGVJfzCJx5KJBXsMqdU6Gxpk1+Ramg/qPP
	7IrYL/3g8bh0zXKBERw925zmXFAYSVPI6DWY8soNEy6MR6vAB8KkFAFqWlA==
X-Google-Smtp-Source: AGHT+IFRyaY0Ms+idtg47Sm05A/vwz01dGT0ott9+LICXRLBn/z3IwRMXZ/oT0gidzHEMf2YKIUcFA==
X-Received: by 2002:a17:907:d1b:b0:af9:3d0a:f382 with SMTP id a640c23a62f3a-afca4e539a0mr191224966b.46.1755067099895;
        Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af985e63730sm1516386566b.67.2025.08.12.23.38.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6182ea5a6c0so4552782a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9rYa35178c7WAg4kQIwxEbhi/9cp31bt0urnec9DDsxZzBySHQNG8h51qFIrD8fGL1kGHJhEhSXhalGvzy4YL@lists.infradead.org
X-Received: by 2002:a05:6402:35d5:b0:618:6a75:75a0 with SMTP id
 4fb4d7f45d1cf-6186b4b1ed4mr1626683a12.0.1755067099429; Tue, 12 Aug 2025
 23:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org> <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org> <20250812095543.GJ30054@pendragon.ideasonboard.com>
 <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com> <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
In-Reply-To: <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 23:38:08 -0700
X-Gmail-Original-Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
X-Gm-Features: Ac12FXzzLLrmw8gIl8Z6rXDfhueeMgmWZqS1-9wCIvFbO51xu2pnx-aLX2I9B8Q
Message-ID: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_233821_922677_468554FE 
X-CRM114-Status: GOOD (  36.77  )
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

On Tue, Aug 12, 2025 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 13/08/2025 06:30, Will Whang wrote:
> > On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> >>> On 12/08/2025 08:31, Will Whang wrote:
> >>>> On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> >>>>> On 12/08/2025 04:47, Will Whang wrote:
> >>>>>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> >>>>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>>>>>>> +description:
> >>>>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>>>>>>> +
> >>>>>>>> +properties:
> >>>>>>>> +  compatible:
> >>>>>>>> +    enum:
> >>>>>>>> +      - sony,imx585
> >>>>>>>> +      - sony,imx585-mono
> >>>>>>>
> >>>>>>> I don't understand this second compatible. Is this different hard=
ware?
> >>>>>>> Can you point me to "mono" datasheet?
> >>>>>>>
> >>>>>>> Your description should explain this. Commit msg as well, instead=
 of
> >>>>>>> speaking about driver (in fact drop all driver related comments).
> >>>>>>>
> >>>>>> Mono version of this sensor is basically just removing the bayer
> >>>>>> filter, so the sensor itself actually doesn't know if it is color =
or
> >>>>>> mono and from my knowledge there are no registers programmed in th=
e
> >>>>>> factory that will show the variant and model number. (That is why =
when
> >>>>>> the driver probing it only test blacklevel register because there =
are
> >>>>>> no ID registers)
> >>>>>> Originally in V1 patch I've made the switch between color and mono=
 in
> >>>>>> dtoverlay config but reviewer comments is to move it to compatible
> >>>>>> string and not property.(https://lore.kernel.org/linux-media/20250=
703175121.GA17709@pendragon.ideasonboard.com/)
> >>>>>
> >>>>> You only partially answer and judging by mentioning driver below:
> >>>>>
> >>>>>> In this case, what would you recommend?
> >>>>>>
> >>>>>> compatible:
> >>>>>>   enum:
> >>>>>>     - sony,imx585
> >>>>>>     - sony,imx585-mono
> >>>>>>   description: IMX585 has two variants, color and mono which the
> >>>>>> driver supports both.
> >>>>>
> >>>>> ... I still have doubts that you really understand what I am asking=
. Is
> >>>>> this one device or two different devices?
> >>>>
> >>>> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQ=
J1
> >>>> (Color). Silicon-wise the difference is just with or without bayer
> >>>> filter.
> >>>
> >>> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> >>> explanation either in comment or description about difference in RGB
> >>> mosaic filter.
> >>
> >> Works for me. We could possibly omit the "j1" suffix too.
> >>
> > My thinking is that imx585 and imx585-mono are easier to comprehend
> > than IMX585-AAM and IMX585-AAQ.
> > Because in dtoverlay for the users/me they will have to know what is
> > the exact name instead of easy to remember name.
> >
> > dtoverlay=3Dimx585-aam
> > is not as nice as
> > dtoverlay=3Dimx585-mono
>
> I have datasheet for AAQ, so how above is easier for me to figure out
> which compatible I am using?
>
I propose this:

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
    - sony,imx585-AAQJ1
    - sony,imx585-AAMJ1

  description: IMX585 has two variants, color (IMX585-AAQ) and mono
(IMX585-AAM) which
the driver supports both.

Description is there for a reason, dtoverlay has description also. See
sony,imx296.yaml as an example.
If you are looking at AAQ you know it is a color sensor and all the
color sensors from sony can be used with imx+three numbers in the
current list.
This is following the established convention.

> >
> > which is what it does, a mono variant of the sensor.
> >
> > I really don't understand the standard for compatible string naming
> > here, is there something I missed? Is it required to use the full name
> > of the sensor parts number as a compatible string?
>
> It's not part number. You have there different models. We don't add
> prose to compatibles, but use device or model names.
>
> Best regards,
> Krzysztof

