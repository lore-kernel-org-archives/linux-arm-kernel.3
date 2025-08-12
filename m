Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00026CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnSCoQK0EBBhR+KMV2scx1OY/S2RO6MiphSzki2soYo=; b=3Z7NaScaGxA45oF5U4+4IYtbva
	acRkIXVaqopZiV5dvZGCZyHuLHmN0bQADBngPT6uPYED1wAofHwyn1G34GxpUg4A87oI6wRQ5tdbf
	e/x+cgkuqQ4mpL1CCuTfKbH4uyJzgKQYciyPIgrXaBI0AlU1rgTU4DiSGr52ILyGhJjVr2B2aUolj
	O9SKleFS7amKS7wAAHPdixbYZ5fOi67oYIUt7WEOqGAU6uAuFkWXuIRgqq7l5Xs0HzRc4tG1QDOJO
	+HIN5fy19vQ5OCQGcrEG1PXiyaOPQUHLpXFcdXRh4IVRzDcD8lx7Sbr+cbQMFg9vYMsONu1XuzuOG
	KYLxAbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljhh-0000000A9SD-46Ay;
	Tue, 12 Aug 2025 07:45:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliXW-0000000A22u-0Cnp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 06:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BnSCoQK0EBBhR+KMV2scx1OY/S2RO6MiphSzki2soYo=; b=PxSEUJGUq9QtaS6rJcLpGHnGaq
	1DEjkznrJ3bECJprMP3J/nCQAcsHbhXQjv/S1URehZovn3vg8AOzEFbiphQXrKfRhV/kEmCahHJqJ
	3+9GSLQvGASvt7UA0zb3Pgc7vAqPtFvs9UlmvhsG8Pj1AUa5PlShLt3cOf/wDqMu3TzHDlh2WpdNu
	L16e2QfmRtMfEFDJ0jH62oE5YGCihhXOi9av+NBbeVVIAkBoz2KTBIoGIlyJhNK1BhZu+FgrMZkwo
	i0NzG0m8g31Qk94oCAwLNapDOQpbhO9/oagb4Rmd2CVz+8F+hp25arOXTQrWpgPU3WFcg+EAJJ0E1
	0jeRWwWA==;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliXS-0000000FhwQ-3cgk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:31:16 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so5504669a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754980273; x=1755585073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnSCoQK0EBBhR+KMV2scx1OY/S2RO6MiphSzki2soYo=;
        b=vLbLKmQVv1V7T5e9a7JuE0d+fIJwW3V4DUaq25UXiIUSMoaoqYODgJYOCRajkDeIeK
         wRIKo2WI497X4qOt1mRnsOadbUeOX7R5lbsRTZh2VDW5J1Hz1EujXLAtcU2m1f7DWErM
         JuxssEPYeXTjrzNPQGXSvfVRPh6wUygHrs67hDH4WxH/0nN8dAjjhw2amtff1Fzpt0cQ
         zJ2Q0idmupAF3fJarnXgf51jvt2MLI81BJCSBQaMsXgwe4WCRR7yoIARVWR8EAf49F+Q
         GodrbERZL0L37eVwNNl4GaPB55/paapCIX2aAJz5IMXqwZR1p0ZoArNbQB5wrVVJKdhO
         vtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgUigGK8uThrr2aNC5E+Ox+q4vVv3zNXApP6Ts6ag7qLsfakp1ZpIwe9MFv2MZnnMZfj1PCN/LRP+gVTd+LXGN@lists.infradead.org
X-Gm-Message-State: AOJu0YycFt1zF6MZAu4r0r/8iiC1dLGdix0ru5fXbiy/f6/TKCwhsZGj
	8ySVsZRGvmczz7DBlWxe69m4psV10vbWdKYMRMI9yJ9JDOV34Akc9LS/apbXR/T5pm4=
X-Gm-Gg: ASbGncvN3Caj01XhJn1xFgprwMfM4SVY3vnWLHzDjKu0ZlfE5xfBLsS+e5IwV4ahsFw
	twM4LG9a4tUf6Bxr8gn07aMKviMy+noaQW4BXTSQuLU78a18KmZZHaSLEcGYA2THIqmHgPvnUwY
	FVSHEKOwnx8jsfTKSnAJaZAsL/bU7kXsZoaFkZimnEPADsC0/tM9xsIqciJ428s4HtYjBllx5kJ
	bViFZOQdOh6BGWRlSssumAmZS8/JuzhJDZl6pRmJQtbJ77vuO0cRm+OPTwR6X0t+tFvfaP/6fFO
	k1W2Ole6pd/7tsmkDnqBgRjqhlyBzYHTAEU2ehriUvjI95PtFqQMqMs3eTZSNnzqwaa+/XWZlmH
	I3yzIljjYUWfqRx6Sv7OYO9Ew6C2kwd1H3XFdZ4awpIfRUcLl4Vu+1GJhWg==
X-Google-Smtp-Source: AGHT+IHe00QtJNxd0HPQg2Pai2cMpRtSbdwGpYr4ZSbnNjrwjf4Cirv9mUoZ+gRBvnSBE7RnJpb9zQ==
X-Received: by 2002:a17:907:940c:b0:af2:42e8:ad92 with SMTP id a640c23a62f3a-af9c65b2f50mr1404278566b.61.1754980272765;
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92b650c8asm2002114566b.65.2025.08.11.23.31.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so8417468a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWA2/PFNQcEGERG6Os0jGBP7W7G86RJGzJ9KR/KFCQJeDp2pvYRcTzYvkgRcNxtYdMHcQlShmhymIo+D53NvKbv@lists.infradead.org
X-Received: by 2002:a17:906:7952:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-af9c658d4e5mr1347054566b.55.1754980272254; Mon, 11 Aug 2025
 23:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
In-Reply-To: <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 23:31:01 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
X-Gm-Features: Ac12FXxUPGaJyzFRIVDPhYuVZhaEvNZeEF-rPdc7e_SppFMnCWmGszG5kWhfTm4
Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_073115_009227_7994F0B4 
X-CRM114-Status: GOOD (  27.76  )
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

Hi Krzysztof,

Reply inline,
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 04:47, Will Whang wrote:
> > Hi Krzysztof,
> > Reply inline.
> > Thanks,
> > Will Whang
> >
> > On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>> +description:
> >>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - sony,imx585
> >>> +      - sony,imx585-mono
> >>
> >> I don't understand this second compatible. Is this different hardware?
> >> Can you point me to "mono" datasheet?
> >>
> >> Your description should explain this. Commit msg as well, instead of
> >> speaking about driver (in fact drop all driver related comments).
> >>
> > Mono version of this sensor is basically just removing the bayer
> > filter, so the sensor itself actually doesn't know if it is color or
> > mono and from my knowledge there are no registers programmed in the
> > factory that will show the variant and model number. (That is why when
> > the driver probing it only test blacklevel register because there are
> > no ID registers)
> > Originally in V1 patch I've made the switch between color and mono in
> > dtoverlay config but reviewer comments is to move it to compatible
> > string and not property.(https://lore.kernel.org/linux-media/2025070317=
5121.GA17709@pendragon.ideasonboard.com/)
>
> You only partially answer and judging by mentioning driver below:
>
>
> >
> > In this case, what would you recommend?
> >
> > compatible:
> >   enum:
> >     - sony,imx585
> >     - sony,imx585-mono
> >   description: IMX585 has two variants, color and mono which the
> > driver supports both.
>
> ... I still have doubts that you really understand what I am asking. Is
> this one device or two different devices?
One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
(Color). Silicon-wise the difference is just with or without bayer
filter.
>
>
> Best regards,
> Krzysztof

