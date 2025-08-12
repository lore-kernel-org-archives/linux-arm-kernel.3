Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB38CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4WEnSDqzgAq88TBUpwwpgbS9VPz87hnkF4biNEHDlY=; b=d7K5eoSCFyKt9mKdQ/cRN97XLN
	27pbxZS9ZCD7J0RljhhMhuq50bdXvLKccnCPAyCSKRmkjSDeppZm6XL9+1zJpoyLDjN73QCEwi5rD
	dnXRSpj1tCtvtI4xK/nhQ3aiUGaHtEQhdk38TNRqUy3fwi/GQjgBYzlut8sJQ6rfrQygAXtr5WIhh
	6EpFJ4X3vE0UBw3wAYlfAUHnVadf+uyWy3gXVQ89lWobi1IIsufsA9sEkLtvM32AQCe0uk2WLqSc3
	y4q4UBh/QThCG7Qyp2VhUClk6ubjB8HQ30UXfk0ncLHMcKhaNY9P0CliCE2fjKMd1zyPt9ncx0gK1
	xxc5Z45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulf5J-00000009dYU-1v1f;
	Tue, 12 Aug 2025 02:49:57 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulf2h-00000009dRP-3yFX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 02:47:17 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afa15bc3651so169296466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 19:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754966834; x=1755571634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4WEnSDqzgAq88TBUpwwpgbS9VPz87hnkF4biNEHDlY=;
        b=oJu9BrfyIXC8zahjoOSAtfBNbo8l6acjGZcrL6u9KbgPJmHOYeqBaeVg1UqWgv0dby
         DY3tIVwzADdv90wSwWHXn6CXA0Gmuerci71ZaeHTF1MakDPV888i9YmMw0yEVgy72LOO
         ZOMwRcIhlrsl91Rjjk+6P85+Gkir1t9b6402J7yvDqEe9KHAnYTuOxF59y3KG8iSXzSM
         y/7PvzLVpWBvK7I+JG1y50Kp5pYA75RPrIrademIyk1kZAqU2Zt/HduxbLR8GJzHBEzF
         SbsIZ7qENQSMsNdYiz3lxfid+MihhiWKr6lSAtxtMLADBVYKLOftxlSyvBGln1svtz95
         rJog==
X-Forwarded-Encrypted: i=1; AJvYcCXyQY93nwSvlv2/CCwYgW/cIRCl4DJgBdxVa9v5GKkHuH07iiFGTc3xvY/zDehY7XxLx693npQCo7vhu86VCA1D@lists.infradead.org
X-Gm-Message-State: AOJu0YwRYsQmap5aFyagKk+gP6C6+T2s4nfORCjZQVbx7/VzPBxkTy54
	ymEb51ozcOT/wAjzqNGE67rOn/UUDOGVMbDgFSRuLP0Xc+PjTRC9vwKHEo5MOEkl+xI=
X-Gm-Gg: ASbGncuQC+9VLq9ikws9NRqMWevQR4GNYC5rPbmkIaTTc+dt7YiCt4c0LFTvXB3piyr
	UYHEkdT5DEjvdGGWBdND1Jqzd14CBQ3oZjHXe+PlWQvF97f/gpQA9TzpcKIcoOF1LXc5QXLecQw
	bmpx3TY280eHrmBLEbdtnaATAxmliSIJUfB8jOuNi/4QYKknML1OZO+aSN+xGDinZmsJgYqAQx0
	Pffpq9o806xrLIIBXwnucDOv1guyAFu1OSUbMG8NFojmOVfobRKqDSNyDhtLFcKrPz1wRzb5U1w
	Q1Cdit5rGBJ0BJrFssjkc9WvBsCH4SAJiiDCdIuGnBWCMIgOkg80QmHp0p6yco2xmdhoBuToOL7
	cZrGwRcTNT5NYPZ1yBIAudTfKMFZXJq1FRqrVc9OV4snt9sRRFvOddnv4Fg==
X-Google-Smtp-Source: AGHT+IHKrHDcjk3D4VylcP1NfSNxE/c7frNppTAc6jC5hvISe5oVFxhYqZ+nxxZy6UClIlDEZLjEnw==
X-Received: by 2002:a17:907:3d92:b0:ae3:bd96:78cd with SMTP id a640c23a62f3a-afa1dff365dmr138215166b.7.1754966834040;
        Mon, 11 Aug 2025 19:47:14 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38b5sm2105048366b.45.2025.08.11.19.47.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af94e75445dso901444666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 19:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPM8rbEFv1fs0xEMkuOUcN5pMlzA/HCTnV7oPe0oNB3nAOIbC/57jH3pQifCe3wEDathL9UOne8KbDej3UZdNN@lists.infradead.org
X-Received: by 2002:a17:907:d27:b0:af9:3116:e104 with SMTP id
 a640c23a62f3a-afa1dff94d9mr158864166b.3.1754966833478; Mon, 11 Aug 2025
 19:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
In-Reply-To: <20250811-successful-military-dragon-d72486@kuoka>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 19:47:03 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
X-Gm-Features: Ac12FXxQmXnuWdzEc4zTooah7CjD9hS5SJe3jLxjPY4eiFkazCpsluep9zY_bS0
Message-ID: <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250811_194715_991171_CC5A6622 
X-CRM114-Status: GOOD (  23.67  )
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
Reply inline.
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> > +description:
> > +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sony,imx585
> > +      - sony,imx585-mono
>
> I don't understand this second compatible. Is this different hardware?
> Can you point me to "mono" datasheet?
>
> Your description should explain this. Commit msg as well, instead of
> speaking about driver (in fact drop all driver related comments).
>
Mono version of this sensor is basically just removing the bayer
filter, so the sensor itself actually doesn't know if it is color or
mono and from my knowledge there are no registers programmed in the
factory that will show the variant and model number. (That is why when
the driver probing it only test blacklevel register because there are
no ID registers)
Originally in V1 patch I've made the switch between color and mono in
dtoverlay config but reviewer comments is to move it to compatible
string and not property.(https://lore.kernel.org/linux-media/20250703175121=
.GA17709@pendragon.ideasonboard.com/)

In this case, what would you recommend?

compatible:
  enum:
    - sony,imx585
    - sony,imx585-mono
  description: IMX585 has two variants, color and mono which the
driver supports both.

Something like this?


> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
>
> Drop all three.
>
> > +
> > +  clocks:
> > +    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24=
MHz
> > +    maxItems: 1
> > +
> > +  vana-supply:
> > +    description: Analog power supply (3.3V)
> > +
> > +  vddl-supply:
> > +    description: Interface power supply (1.8V)
> > +
> > +  vdig-supply:
> > +    description: Digital power supply (1.1V)
> > +
> > +  reset-gpios:
> > +    description: Sensor reset (XCLR) GPIO
> > +    maxItems: 1
> > +
> > +  sony,sync-mode:
> > +    description: |
> > +      Select the synchronisation mode of the sensor
> > +        0 =E2=80=93 internal sync, leader (default)
> > +        1 =E2=80=93 internal sync, follower
> > +        2 =E2=80=93 external sync
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [ 0, 1, 2 ]
>
> Previous comments not applied.
>
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +          link-frequencies: true
>
> Drop
Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml and
sony,283.yaml doesn't seem to drop this?
Just to double check if my understanding is correct, you want me to
remove the line link-frequencies: true?

>
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        imx585@1a {
>
> Nothing improved.
>
> You replied that you applied comment, but send the same.
>
>
> Best regards,
> Krzysztof
>

