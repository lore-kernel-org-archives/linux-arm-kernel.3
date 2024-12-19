Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5734E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=; b=wqtbplGi39+e5ZinkZv4LZLwgx
	XctC9Qb1WegSa11okNMg9WRPQExX2Kd2XWOPINNwf3NfY5ixeciwCN3hCT5bC5NdsotW1KSB4WYvG
	yBX/1fRTd66bRsJdkTkEBYpvggwdq61CaV+If5u/F9s1X1anfmRlnJV3XcRMvaVyYzCOZs3wWnSoU
	gDl+TfUuZsBmuySFPzuIMzmjRudq6VPA8/olk8VLkuYbSQQLCCPXynmzoOa8TCIwurjJee+tDxLQM
	Lr6dLp7xUmDLPBXNnqHab65jxlIso/0ZByd2CLHPTs0pRtgmJmi5tpj2znwIKsU8evootTzrat5TM
	064DGREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFVK-00000001lHY-1suI;
	Thu, 19 Dec 2024 12:19:46 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFUD-00000001l2w-2q5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:18:38 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6efeb120f4dso5497467b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734610716; x=1735215516; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
        b=JNuE7oJRPl9r5Rm21YTKXA5i8mvngFMW6k+IiZnGWJ9BEde52DaiQEvituW4RmVxHE
         4Y2Dz62z4ecvB1MZPLXLUX5CCtgfckM35FTw00IcSEJg1sezVZrETj9HVu+YlufXZObX
         FTNyogesgM56wl/LAUVQr/aKIZNM0ubOHbxelVJ/Hy42c5Hf8Ovecm3wpo9i72B5Yvsp
         uvWgX7YYTbcHQQjDdvU8TROd5+M2W6IJArywFELtRia03UcW6nlPlHhsXvLj2ktN3BVN
         EEnNKPb5ZF8+PQ3be0RhB2uR9+yGGEvG9s8w2mg4FsSMnOauub1y0PYksrFK9YILxWdG
         pBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610716; x=1735215516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
        b=sbU6PowK1BLKT1+U6s3nDc3W1IO+wc92hOcZ+8HOgQbVucSSu5LrOyXZFjHup/3kHM
         0ZaBgHChB8GyhLEy0tgAQ68jRfmXqa63qqR2lcp3uNBj/qIah4vJnqh4lSupGtF1M9wa
         A6c98oW45V/XjZ4WrCz8EDB3AR6TZaw0UOG4zzcCam0hvraC6xTxj8KIBwcdnOcR41CL
         kYnFrKKRNy4pbjtBBokwXy5LKNItpe50JHK/bmAgvjGt3gh+TzO6nkO9AT3OFqHVkqGh
         pAnquVpV8y+Y4Rv+G0ZgOEFfDT5Y5WcjTZw9qHga2ZuBCCcTPyyb7AwAfZZpaMcH9rwx
         yVCw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Jdr2avlaRu/BdsduBwIPlkudDIK8Ela/N0JD4kN1lGQOeayVh21ZPd8gANsnB0+VuB8ywM2p4J5oMUK3ckpC@lists.infradead.org
X-Gm-Message-State: AOJu0YwRM7SFXmOE6es3Y0SMhSzAYo3tQIS+1DphCFNkIHQOeWHZcZC5
	kaZj+fRhRV6F1Bsr/LSwKgMSXcNBx5cBAiAF7llAE+oVjpX5aTAyVy5fDY9Kx5oG4pTYR0JcvDL
	i2021oxSQBMUPNuDpHXdleLbPpXEh54fyPP035A==
X-Gm-Gg: ASbGncvkXQ8oJ6xDOw5PxZdJx6k6+JvORR5bMiMi9VX02l4ztfGhBzRTtxala2OpEf/
	5AybZcwhgHlgM+3zRrcvftiq+g2L+NRdyvfibNg==
X-Google-Smtp-Source: AGHT+IHraW7wpbF8fJqXT45CLs6MHm0bG2jAMI06aKTMUcj3YkWcIfGKnVrC7HIFs/1/hf+1Y67F/W4zse9YCT/oErg=
X-Received: by 2002:a05:690c:6107:b0:6ef:e39f:bb1 with SMTP id
 00721157ae682-6f3e1bd4915mr25231957b3.27.1734610716405; Thu, 19 Dec 2024
 04:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
 <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
 <CAPY8ntCX8+yg1RFhAXu4ystGF_JivTh43RY=k2P0bUm5JxvzRA@mail.gmail.com> <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
In-Reply-To: <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 12:18:18 +0000
Message-ID: <CAPY8ntDWGaY9__BdR9Sfmom6YsZEhRZZsLghRNR1cvAZMxJyMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_041837_712589_6EDE6ED6 
X-CRM114-Status: GOOD (  31.80  )
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

On Thu, 19 Dec 2024 at 12:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/12/2024 12:54, Dave Stevenson wrote:
> > Hi Krzysztof
> >
> > On Thu, 19 Dec 2024 at 08:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> >>> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> added the compatible string for BCM2712, but missed out that
> >>> the number of interrupts and clocks changed too, and both need to be
> >>> named.
> >>>
> >>> Update to validate clock, interrupts, and their names for the variants.
> >>>
> >>> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> ---
> >>>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
> >>>  1 file changed, 70 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> index f91c9dce2a44..fd25ee5ce301 100644
> >>> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> @@ -20,11 +20,20 @@ properties:
> >>>      maxItems: 1
> >>>
> >>>    interrupts:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>> +
> >>> +  interrupt-names:
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>>
> >>>    clocks:
> >>> -    maxItems: 1
> >>> -    description: Core Clock
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>>
> >>>  required:
> >>>    - compatible
> >>> @@ -33,17 +42,64 @@ required:
> >>>
> >>>  additionalProperties: false
> >>>
> >>> -if:
> >>> -  properties:
> >>> -    compatible:
> >>> -      contains:
> >>> -        enum:
> >>> -          - brcm,bcm2711-hvs
> >>> -          - brcm,bcm2712-hvs
> >>> -
> >>> -then:
> >>> -  required:
> >>> -    - clocks
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2711-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: Core Clock
> >>> +        interrupts:
> >>> +          maxItems: 1
> >>
> >>
> >> clock-names and interrupt-names: false, unless driver needs them but all
> >> this should be explained in the commit msg because it would be a change
> >> to the binding.
> >
> > False it is then.
> >
> > Is there actually a full guide to binding requirements?
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
> > is the closest I've found, but it doesn't obviously cover these types
> > of things.
> >
> >>> +
> >>> +      required:
> >>> +        - clocks
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2712-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 2
> >>> +          maxItems: 2
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: core
> >>> +            - const: disp
> >>> +        interrupts:
> >>> +          items:
> >>> +            - description: Channel 0 End of frame
> >>> +            - description: Channel 1 End of frame
> >>> +            - description: Channel 2 End of frame
> >>> +        interrupt-names:
> >>> +          items:
> >>> +            - const: ch0-eof
> >>> +            - const: ch1-eof
> >>> +            - const: ch2-eof
> >>> +      required:
> >>> +        - clocks
> >>> +        - clock-names
> >>> +        - interrupt-names
> >>
> >> My previous comment still stands. Reply to people's feedback instead of
> >> ignoring it.
> >
> > Your previous comment was
> > "Why requiring last two names? Commit msg does not explain that."
> >
> > I didn't ignore it. The driver needs them, and the commit msg states
>
> Uh, so someone added undocumented ABI. How this passed any checks? Or no
> one cared to run validation?

See the cover letter:
"I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set."

> > " but missed out that the number of interrupts and clocks changed too,
> > and *both need to be
> > named*.
>
> Ah, I really did not get this.
>
> > Update to validate clock, interrupts, and *their names* for the variants."
>
> Please say explicitly that since some commit driver needs this. There
> should be a clear reason in the commit msg why you are adding this ABI.

OK, will do.

  Dave

> Best regards,
> Krzysztof

