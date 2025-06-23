Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1695C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2umrYHd0J3tqzw0yG5M5k9L2TulLqh3KukmLpWDNa1I=; b=mAOXh/t/fPOvdum794iiAW9fua
	nxKNItOuQI/pLwQJr5AoSGIsOyAaT66qMbv9fwVWyXy3vPE9MCpKcanUPeZGUDk1DzM5XWXQuDFPk
	YPlT+uzExMe0/6u2TrW9rbAVLXRl93M+setiGPNVLKNpUXVyLnzaeWBwOmIBCy8dYrF/prm94tDWM
	ywIzPRxHscwIYZm8QCdaRWgfJsz6lWwIqY6XBodOoTz5l4N6NcJP0gsaehCzicLfjEGocLd/yb8E7
	nrtUJMj3Hl+vfR3LocHgI4rVzjRjzAHiACmNCSXfYUOkJUrzydSENL8xQD9O0GFVS8iGEZhNhgZZn
	jgtC6ClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZN-00000004FG8-3Izh;
	Tue, 24 Jun 2025 00:31:25 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlNT-00000003cKu-1IM1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:54:45 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e8187601f85so3915757276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1750701282; x=1751306082; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2umrYHd0J3tqzw0yG5M5k9L2TulLqh3KukmLpWDNa1I=;
        b=DJPd97oSsZVHWyGew57g3P3OoU5B35po/RugzUIT4xOxNEkBPRCUtDqJjLgsHMqqej
         C/CLbvVaq08grnhFiFc2IIwvwlUqJaAkE9pU9cYvDc/DYvI/W6qkiQKvXws7+1jbq5r7
         J+VTjWNeMkzGJse4vLCvA8jKsfE5cpGsxxBefwqAh8QMKAn8CT9j6FmMX9OZFAjXXgV8
         KGLgCeqdoknGYPL3XaroJ25BQhpS4l5eZKalO7itUwDh76OE3CyNcLmuVLcDNtLkVFjn
         G0kPosE8xQ49R3IVt6rK1/IQuAjXFl33Muqf/jZsCIx4Yh4bNscM2ao1LRZ0kD6kFLmL
         FijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701282; x=1751306082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2umrYHd0J3tqzw0yG5M5k9L2TulLqh3KukmLpWDNa1I=;
        b=sz0wmo6RlNLlXrnFTnzosb5xQdYA4k1YtMfJenCMxZPNprMdmSklOBRSDqeTRYOJrn
         aF3WyWeN6IhjI8YpF4G9pddHD+egM6cqizOsaP4vpHKAiMCoWeeIVLmLube96LXq+eQz
         WJVzuj4FCK/LEljfbJWUNOkZf1m1l5TzxIyNMvDQIk/Jka0JX4GNAYB4mwWrd1xa4nKm
         cd3qJvVkXfjPHgU+R9kp6JMqsGQ8Wnysv5BthGwuTMQ7fFqMDYzbPwVShA9FDxVV0SA9
         ByPak0q/UIe23Q5TKs6f8+6CVZ14fWbx1Ab/QHP/n9sDQp2o7o6NQpS8u6z05t9P0A1o
         6ZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIhxxco7aGO6peIcF6wkVjeKycmgqp5gLCHtX2fDEPGRLZup4aYg9Q0KXue0JhLrv9HmKJQKLG+lra6s/nppdD@lists.infradead.org
X-Gm-Message-State: AOJu0YyNhxZolRWSMrkaOMD7Ird71xT65mDpD79Rghmg9xvbE8sas1ax
	J5GE5WQ3TXKzb9zea68OQsnDA7WV/uhGb1UC10rn4Nxq/pv6tYiE6l7363OVj4feaNFWBIoEE/C
	btE7Qak6qFM7/i9UobI32sgRh9j0PsZD20tZp3WIN9Q==
X-Gm-Gg: ASbGnctGRUHw1BHbW92OYrT5wbpppfgq4063rtruFRYBdzcA/beHHqJloLZnm11PscC
	XFMUUyD1dOFHuFvyKMK1PbsSZh2HPLGHS6h4KkE3HNbNoGEZhmZkDyl1yNrBQJqFwdqw/5a6ICM
	A2OTubFgH7z6WEBRcoo48DWOei+hNVVf8y1fs4cVjp/CbK7jGzWmSXW3Xrb1zcqzi76ioV77U6+
	/4=
X-Google-Smtp-Source: AGHT+IGfoKcrgWxXbXinchiD0boKI8XS21vm7EaD/9/fAZ8SN+qxvOdYfr3tfI2hM/Ouf1leep1F62DdDBljcNdq3YM=
X-Received: by 2002:a05:6902:2b85:b0:e81:b2a2:c633 with SMTP id
 3f1490d57ef6-e842bcf7d10mr16162769276.32.1750701281840; Mon, 23 Jun 2025
 10:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
 <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka> <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
 <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
In-Reply-To: <e00ec6f8-479e-46c4-9c99-7de4c9fa1c27@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Jun 2025 18:54:23 +0100
X-Gm-Features: AX0GCFsJmnJSIgh3LKawkx-7MO5eDaDetGX5z3Whb404Zemw7AoPyaf6laHApe8
Message-ID: <CAPY8ntCkgnwhA_OuDY3zMMrptFmLqTm_mLdmdLeO5txyFuG1Jw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_105443_529329_C024C220 
X-CRM114-Status: GOOD (  44.61  )
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

Thanks Krzysztof

Sorry for the delay in replying - other priorities.

On Mon, 28 Apr 2025 at 18:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/04/2025 12:03, Dave Stevenson wrote:
> > Hi Krzysztof
> >
> > On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> >>> Adds a binding for the HEVC decoder found on th +maintainers:
> >>> +  - John Cox <john.cox@raspberrypi.com>
> >>> +  - Dom Cobley <dom@raspberrypi.com>
> >>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >>> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> >>
> >> Drop, no mailing lists in bindings maintainers. These must be people.
> >
> > Ack
> >
> >>> +
> >>> +description:
> >>> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> >>> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> >>> +  boards respectively.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - brcm,bcm2711-hevc-dec
> >>> +          - brcm,bcm2712-hevc-dec
> >>> +      - const: raspberrypi,hevc-dec
> >>
> >> Not what Rob asked. You should use specific SoC compatible as fallback.
> >
> > In which case I don't understand what Rob was asking for.
> > I asked for clarification in [1], but got no reply. Sending a new
> > version has at least got an answer, but I'm none the wiser.
> >
> > Staring at this trying to work out your meaning, you want the generic
> > first, and SoC specific second? ie
> > +  compatible:
> > +    items:
> > +      - const: raspberrypi,hevc-dec
>
> Drop
>
> > +      - enum:
>
> That's enum, not fallback.
>
> > +          - brcm,bcm2711-hevc-dec
> > +          - brcm,bcm2712-hevc-dec
> >
> >> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
> >> such file in the next.
> >
> > Typo.
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
> > Reviewed by Rob only just over a year ago [2]
>
> There were some discussions and reasons with explanations.
> Feel free to use same arguments and accurately describe the hardware, so
> we won't be needing to ask usual questions.

Sorry if the previous descriptions hadn't been clear. All the same
points as for raspberrypi,pispbe.yaml apply here, which is why I'd
tried to link to it originally.

Describe the hardware:
Raspberry Pi designed and are the sole owners of the IP for this HEVC
decoder block. This is *not* Broadcom IP.

That design was given to Broadcom as Verilog to wire into the
bus/interrupt/clock fabric of BCM2711, and to manufacture it via TSMC
on a 28nm process node.

A few years later the same design was given to Broadcom to wire into
BCM2712, and to manufacture it on a 16nm process node.

As it is Raspberry Pi owned IP it can be used in other places than
Broadcom SoCs.
Broadcom does not have a licence to use the IP in any other of their chips.

It is the same situation as for raspberrypi,pispbe.yaml except the
block already exists in 2 chips rather than just the 1. There also
isn't a version register in the hardware that is different between
those chips (an oversight noted for future chips).
It could be compared to a Synopsis or Cadence IP block dropped into an
SoC. The vendor prefix happens to be raspberrypi instead of snps or
cdns.

Is there any part that needs to be further clarified?

> Anyway, we asked for fallback, so you need items, just like every SoC
> compatible (see also example schema).
>
>
> >
> >> Before you reply that there is a binding using different rules: well,
> >> there is always poor code. Above two comments are repeated, especially
> >> this about specific compatible - all the time, so these are not new
> >> rules. These are given in reviews since some years.
> >
> > My Google-foo is totally failing with the only directly relevant
> > mention of "fallback compatible" I find is [3], which just says to use
> > them.
> >
> > You're effectively saying I can't take anything in the kernel tree as
> > being a valid example as it could be poor code, and a layman such as
> > myself has no way of telling.
>
> No, I am saying that argument "I saw someone doing this, so I am allowed
> to do the same" is not correct. There are good and bad examples. For
> example in my talks I mentioned good examples. The list of good examples
> was not accepted to the kernel so well... I just use as an example any
> recent Qcom binding using specific compatibles.
>
> > Could you please point me at documentation and examples I can rely on,
> > or educate me with what is wanted in this situation to avoid me having
> > to guess?
> >
> > A further mailing list search has brought up [4] which is a thread
> > with yourself from 2 years ago which looks to be a very similar
> > situation. Other than missing the const on the SoC strings (although
> > that isn't in the merged version of cnm,wave521c.yaml), and two SoC
> > specific strings, I'm not seeing an obvious difference between there
> > and here either.
>
> How is the [4] relevant? That's IP block from other vendor.

It was another example of an IP block belonging to vendor A being
added into an SoC from vendor B, same as the situation here. Raspberry
Pi != Broadcom.

Thanks
  Dave

> https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties
>
> https://elixir.bootlin.com/linux/v6.3-rc6/source/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml#L31
>
> Best regards,
> Krzysztof

