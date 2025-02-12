Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D35C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTOTPGSXVq2qgpJeXCjqv2Ft7/R2pLQdaC/aHf11ROc=; b=Yb4nvKC3TmJeObQqT7vQPJVvIk
	fPXlsDfxwSGlsvCV6WCy7lJ6pNMH2KA492jys1ey9rKGYqXNS9Y2VrIgeV5aeyIATw7ND0NHohZ2v
	oUj5Rnh6xE/WPBhd2Zbs/J/XTiklWjRfnMLrpOIDXzkuthZQatWEtBq+9sHDFars85+myxXIBykw/
	3EZi84v2lwj2YnFZowHtpGPNx991CtjSwqytRZmvk4LfD2p4+kIrPAOewAUT76m2skJhbq//FZrBv
	SHkzabeRbtDA74epTbqwPbTicoMSUEqAcPN/NAwdcLVoj5cIlD/FaKHsWht2IcIGkG2GZjGWtzTMu
	pJf/kG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEjH-00000007sBT-0n39;
	Wed, 12 Feb 2025 15:32:47 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEgj-00000007rVZ-36zu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:30:11 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e5b22d35268so5999874276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739374208; x=1739979008; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YTOTPGSXVq2qgpJeXCjqv2Ft7/R2pLQdaC/aHf11ROc=;
        b=VQxR06BjlgIE1OfEji9c90GVA5QtvOhMLgn7mLChWlAP7GL9W1jd96s0zKXaNB/+zF
         PawLtbjpYVQVKmdUrn7j18lgL3V0Mzv6dQUzg6agyDbCCBmFJipxqCH0bHzFbkixfKGB
         0DWUia7y1bJQSvp1VpKbxCMD8k0behRz7VSZ3V1WRZcZjqC9QFCwKaY7VyrRjsmhfFrT
         JOwbjbUnA7g007T4fP9wb70M38g72b5lr9AS0pvNb2dlnljmoX2I/Kf2AoywKyqPLXhO
         tlT7NLHM1C9sfWUsaVqgf6VPaTZcxTYTulTKwVUoz2Ec+NcSZy9LXoxUyPLFZ2GVLFs/
         QpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374208; x=1739979008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTOTPGSXVq2qgpJeXCjqv2Ft7/R2pLQdaC/aHf11ROc=;
        b=rHnTREu3jYK9mUn/bfWZ6mMRFPYZIf3YLJZ/7r/vWHKC2b27S77Btgqk6JH2OmTVbt
         1hI8ppwHC+eT4nW8IEpPAMIKTjOC3D9qQHtW+MkaMHQuBY0UdZ21A6jRgvO+3G5VujeR
         6c+GUfA0GZNEBaowWlN7HlmuhXk3ivCVW04vp/gmyJjlXVr/9HmvSjK9wIj1cZL921xn
         yw017PmzePRcCJhKZLq6uUO2COAXTFpWD5wfgLgwwVrEBfJYC/0lY7f6w+yDEQIq2mub
         FgxdR6PZu+nU9Ub+ZLjHjXVtNNJGLBgxddgGP5sC5Yf3PeQD+hzBj50FeU0bxLUrvt1C
         H/Og==
X-Forwarded-Encrypted: i=1; AJvYcCVdjA/7VY78wa88FnZNDoOxPRDdzmYqAvi5fLgnv/LQy5lr4ly6Przf7+GmUWX1G9buAG2Ra9w0h/QPS76L2Dln@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCYlE3f2TZ6vNDFHBV3R0F8BV+DJw+xRsgpvCaKRy0obAHfa3
	a9G3LfmdTgCrmuXzi+T5UP1jqmUC7cnaOu5w+JmZbGSBNgo6ddXGzNWAk5337VwJT9Jw7vFPMsR
	kmOhm3UjyUYpvbNsYGFkahLAnfcrKJzjqopigSA==
X-Gm-Gg: ASbGnctmZVAA3NU1kky6RpVwuXmIu/cfSO2wm7/afOyn+dYyNl7zFsqrKo873ovf7+4
	soKmcSneFtIVG+qWmU7NYb1/zthZ6aTX03M9ccPIfiLNwR6rYwqNHTZmjfsISwwlXpjG8X85uT5
	kJ70s7DhVbCnwPRGCwn6r4oWkISx6/
X-Google-Smtp-Source: AGHT+IFUb4n11X1/VcN5iFZGdf4HHxlpQCoy65XYiTGAuIoCG6TjlthfZgl+P4Z0rbVGRXLADkV617rUgazdBwsWIr4=
X-Received: by 2002:a05:6902:c0f:b0:e5b:3af0:d4b6 with SMTP id
 3f1490d57ef6-e5d9f177b0dmr3316437276.39.1739374208065; Wed, 12 Feb 2025
 07:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
 <20250206-media-rpi-hevc-dec-v2-3-69353c8805b2@raspberrypi.com> <20250211222050.GA1285038-robh@kernel.org>
In-Reply-To: <20250211222050.GA1285038-robh@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 12 Feb 2025 15:29:50 +0000
X-Gm-Features: AWEUYZmslfR01LxrPJ1PLnJuhBuZI5WK77fvcWU4nKbcXM4bWkAo5JbzUXEm5FY
Message-ID: <CAPY8ntD3Frq5HzV06OrS1051QfjJFzvqs9H4mUkVnd4QKqiMhg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Rob Herring <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_073009_862770_B5AEDE57 
X-CRM114-Status: GOOD (  22.11  )
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

Hi Rob

On Tue, 11 Feb 2025 at 22:20, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Feb 06, 2025 at 06:02:36PM +0000, Dave Stevenson wrote:
> > Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
> > and BCM2712 / Raspberry Pi 5.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  .../bindings/media/raspberrypi,hevc-dec.yaml       | 67 ++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> > new file mode 100644
> > index 000000000000..06db7004c765
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi HEVC Decoder
> > +
> > +maintainers:
> > +  - John Cox <john.cox@raspberrypi.com>
> > +  - Dom Cobley <dom@raspberrypi.com>
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> > +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
> > +
> > +description:
> > +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> > +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> > +  boards respectively.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - raspberrypi,hevc-dec
>
> SoC specific compatible please. If they are 'the same' then 2712 can
> fallback to 2711.

Can I just make sure I understand your request before I respin?
This is a Raspberry Pi IP block that has been added to the Broadcom
SoCs. It's the same situation as for PiSP Backend which is documented
in bindings/media/raspberrypi,pisbe.yaml

Based on that I'm interpreting your comment as wanting:

properties:
  compatible:
    items:
      - enum:
          - brcm,bcm2711-hevc-dec
          - brcm,bcm2712-hevc-dec
      - const: raspberrypi,hevc-dec

Is that right?

Thanks
  Dave

> > +
> > +  reg:
> > +    items:
> > +      - description: The HEVC main register region
> > +      - description: The Interrupt control register region
> > +
> > +  reg-names:
> > +    items:
> > +      - const: hevc
> > +      - const: intc
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The HEVC block clock
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    video-codec@7eb10000 {
> > +        compatible = "raspberrypi,hevc-dec";
> > +        reg = <0x7eb00000 0x10000>, /* HEVC */
> > +              <0x7eb10000 0x1000>;  /* INTC */
> > +        reg-names = "hevc",
> > +                    "intc";
> > +
> > +        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        clocks = <&clk 0>;
> > +    };
> > +
> > +...
> >
> > --
> > 2.34.1
> >

