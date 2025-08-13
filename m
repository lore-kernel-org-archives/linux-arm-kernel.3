Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D18EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 04:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEitumvRdECaQFnfUf7n8uN2sOMlQVkaq/vshRF+hlY=; b=ZgLcQgA3/hTeHuzcQvDuLzA+Gz
	RkypBWfGMy2+FGfUuDfORDlkUJj7mzwVjJsEDVA54entgdlwktZF0Hd9a9NhKdq1F7+yJKivbh8kg
	Btz3St07z0AfP6XtwK2BVz7hZVG8SH99XdiNXCAVPNuc4MeXSPvt1Vv4QhiRJkluHKtFnNLM0CpGl
	Wuy3u4dJCLbxGg3ondTT9NIxCbRUlHqpyy5Kd3k4NyDSovQdwSs180fJfEjKncyXAHEB5JuCkHVmm
	votIZIzmbSSLseLl/lFq4XDzHx4nd6Vr4PPk6CUjQlXenRJn78DVygqHiBgrAy8jS/S05jzAiDO1q
	o3uJvoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3BM-0000000Caxq-3bss;
	Wed, 13 Aug 2025 04:33:48 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um38p-0000000CaoC-402S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 04:31:13 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af91a6b7a06so1037912966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 21:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755059470; x=1755664270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEitumvRdECaQFnfUf7n8uN2sOMlQVkaq/vshRF+hlY=;
        b=tNOgCerNmXyFddCnNs1BucDWKbh00U/hqO1JyCud32kLCWKAIlGR83ARKkRacZykdw
         +KcdT2jDPk+I2lI6/G2S789ygAlVRiN+efiBt1i6OsyiciJJxQxNkYNo15fXxAR78iGK
         0Fmu1KqzEeamaihB8seySpZrDpvv/c4ClBBotBwj78SRDOtTfRATBqrGzV522eGn7o0E
         WRriYQTd4mvf7cXBICeOukLayZVQf0sJK8th6DTeCwzn5b1Ol2lhi4f9pbVKs9Y720mu
         rQEcCa8X3s7FgcPwrad7mEt7OH2ycadIecHZvhYQR7or2TyRcQVY9+0iCCfz5VJ9teZ9
         NOTw==
X-Forwarded-Encrypted: i=1; AJvYcCWcvVZ/QEzlRboxjVQDy+lTmYBPlz9292SK7KfKpydyIzG6Qi+wD6ACfm6RMa4U25T7Mun2O9/HgajNUCAJWPRV@lists.infradead.org
X-Gm-Message-State: AOJu0YzNkaBq75A/EC+DZGKgWhijZPrytZI6fe2tWvPUfRLNgcNqbirC
	aJ7lP1v/MjL4XvRLY4+dmQDzxeAIhuvJiY5pt0v9ETIm/yUvoNzwB3VzQ7LBoIU/Tk4=
X-Gm-Gg: ASbGncvxag4Bp11KsCDx+MskGEFxR+5REsxr6lhZZwaqlfLcOKhszNoDBbL+AMzGDLI
	2dz+uEE61CKwdq5fc63lvzyiPUDW6wSHDNxpQnaFCjpaA14xtG/+Blpv4yf97l9n6Wfl9qh9xM6
	dvmU/zkvHPzu4//s50w5UP5nddi+j35VQDQt4RzRzHeKzDFehuiA50FANCZ0L/yEGLPriSbIgTa
	AVMhDo9+IeauJF7qM3QNMJ8XIzURrdsi6bEhKQqvgyGMpTnTbsFMkz/wZB8A49hW/1fgoEnO7uS
	gThn6vc2/2RHPeKaB8MK3vx9089WdZdsaZuQRjEzjFxF+WbzItIKlooCHy0g9hmkizPZt8wg+o5
	Co1m2+m/8jItmkJN3LcL19z575OQpR2vK3eoCjRTDboGbCJOQ/tJ3WcJGcA==
X-Google-Smtp-Source: AGHT+IGLrqiYCD4Zy44SxFJMHRu++y4a7SzwKfVnEvpp/pOH/Lh24xIW7ZbXs602sXkbHGeUQHXmKA==
X-Received: by 2002:a17:907:3f83:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-afca4df4c7fmr165087866b.35.1755059469769;
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0753f9sm2332866466b.20.2025.08.12.21.31.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61557997574so8818394a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 21:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvzMeOri2T3lJaYLRWSZQNiY+AnI63qxRcLMJ839/90wPkBm7JQJ+wXHQ039bLgCFlRd+pG42cW/10CGHvw29F@lists.infradead.org
X-Received: by 2002:a05:6402:5251:b0:615:539b:7acf with SMTP id
 4fb4d7f45d1cf-6186b75b54cmr834464a12.2.1755059469148; Tue, 12 Aug 2025
 21:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org> <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org> <20250812095543.GJ30054@pendragon.ideasonboard.com>
In-Reply-To: <20250812095543.GJ30054@pendragon.ideasonboard.com>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 21:30:58 -0700
X-Gmail-Original-Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
X-Gm-Features: Ac12FXw_0xiUCO5_AdWCiXWdSKd3XS6pJsuGK-9Sx_SEJjxOfia3w-Vp2ADn6es
Message-ID: <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_213112_000590_3AC5AEB0 
X-CRM114-Status: GOOD (  30.19  )
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

On Tue, Aug 12, 2025 at 2:56=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> > On 12/08/2025 08:31, Will Whang wrote:
> > > On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >> On 12/08/2025 04:47, Will Whang wrote:
> > >>> On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > >>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > >>>>> +description:
> > >>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > >>>>> +
> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    enum:
> > >>>>> +      - sony,imx585
> > >>>>> +      - sony,imx585-mono
> > >>>>
> > >>>> I don't understand this second compatible. Is this different hardw=
are?
> > >>>> Can you point me to "mono" datasheet?
> > >>>>
> > >>>> Your description should explain this. Commit msg as well, instead =
of
> > >>>> speaking about driver (in fact drop all driver related comments).
> > >>>>
> > >>> Mono version of this sensor is basically just removing the bayer
> > >>> filter, so the sensor itself actually doesn't know if it is color o=
r
> > >>> mono and from my knowledge there are no registers programmed in the
> > >>> factory that will show the variant and model number. (That is why w=
hen
> > >>> the driver probing it only test blacklevel register because there a=
re
> > >>> no ID registers)
> > >>> Originally in V1 patch I've made the switch between color and mono =
in
> > >>> dtoverlay config but reviewer comments is to move it to compatible
> > >>> string and not property.(https://lore.kernel.org/linux-media/202507=
03175121.GA17709@pendragon.ideasonboard.com/)
> > >>
> > >> You only partially answer and judging by mentioning driver below:
> > >>
> > >>> In this case, what would you recommend?
> > >>>
> > >>> compatible:
> > >>>   enum:
> > >>>     - sony,imx585
> > >>>     - sony,imx585-mono
> > >>>   description: IMX585 has two variants, color and mono which the
> > >>> driver supports both.
> > >>
> > >> ... I still have doubts that you really understand what I am asking.=
 Is
> > >> this one device or two different devices?
> > >
> > > One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ=
1
> > > (Color). Silicon-wise the difference is just with or without bayer
> > > filter.
> >
> > Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> > explanation either in comment or description about difference in RGB
> > mosaic filter.
>
> Works for me. We could possibly omit the "j1" suffix too.
>
My thinking is that imx585 and imx585-mono are easier to comprehend
than IMX585-AAM and IMX585-AAQ.
Because in dtoverlay for the users/me they will have to know what is
the exact name instead of easy to remember name.

dtoverlay=3Dimx585-aam
is not as nice as
dtoverlay=3Dimx585-mono

which is what it does, a mono variant of the sensor.

I really don't understand the standard for compatible string naming
here, is there something I missed? Is it required to use the full name
of the sensor parts number as a compatible string?

> --
> Regards,
>
> Laurent Pinchart

