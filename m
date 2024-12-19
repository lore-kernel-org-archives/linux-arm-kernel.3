Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C2E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmwgUwZYCEh0dqq4h2U8DQ56kDdJWEaehUfFWLrhQUM=; b=ykaeNpuI4/9QZbagwxHiZmbyjq
	I8dssKuk9KFyYpa4VK+KSX0gX/zNPMX0aF4iTc9mPfMKDJUPVkwn+mstaTVF8o3KZ7Ow2k5D07I6S
	CmUqqwyu+I+sdIHLIGRBsB0rFI+JVPM/SgSL08qeTopcVe7PDqAMJ3JLfD/xIuSwKL1/pM0I6Os1o
	H4Ecid8A0yC8V6/BmH7sg4MsgfgyjA0wErVyORrbYHJ3vCDxdALpyIurmZJHqtnCykVlUit6DpmeY
	Jl4oWjzYYqCBJFezLDnOI5RdCCZzdlvZT3nt6AycI1ZyaFg8xuV4FqA45rU0aOizx0CMzGZd5zoQh
	+3sPkGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF8K-00000001iv4-11s3;
	Thu, 19 Dec 2024 11:56:00 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOF7D-00000001ijl-1IBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:54:52 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6eff4f0d627so6351917b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734609290; x=1735214090; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gmwgUwZYCEh0dqq4h2U8DQ56kDdJWEaehUfFWLrhQUM=;
        b=FXZnyqYlPTuwvfqENNjnsNVycEvhIsV4DfM0C3MrnLNZkIoH0DgbROBn+kzXCNSS7n
         KGR1sncToTncsUUOWAmguKawmk8MjHzJLreledzFaREvprD1r+FtZnRf5l+ZEZWPbFDI
         Z+qmXz0q+vKdTXQcp4fgqQWTD/HKplxdkZX1FtNqHQiaxj9jV13cV/1kNS9ezAJbsJDD
         D+EDYxR/WUZ/DDZnu/SAzorXudCCBIXLwlszNPqPeFJxtcnzzfvqDDRYx+6h5cvpauHc
         K0EuJ9b7LWAxw2EMhw29ZIqxrb9o/vCHrM8y8tT73ave6yoM59PEs8rRA9asyXJGFaVw
         XTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734609290; x=1735214090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmwgUwZYCEh0dqq4h2U8DQ56kDdJWEaehUfFWLrhQUM=;
        b=TYd6egzTL1GQdVroLfdw5GZ9Ic5ep+gS+HUh5O+F4US90esa/ZBV37GC6Qwxepp1Hq
         dvYu0sFHb/Fj5e7AGiIFlxb5e2vc+HcQxQlmgOQwDGP7VWGg1v6k1F1DmjXRm8wpl+hj
         3K+lrHE2Ar+4/iTkXjstRvYV4wbxR4V5ug1Lhvoqc9a2IVE0QaWCelJYEK26s25utt+r
         snti8qVoap0acHPKWnGcwvXzmzYZepJ/n33asXplkal4JEiYrtzTlzTpOghNr90MrdB8
         SjAkYH5dvllfycAiKxD66JrsNBoIiqh6uXwTPl4F5hZxRlEWXfq3Coz0lJRqVYuraIi/
         xvFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7CFGZQCYUk/UK9MAWtmA79IefEbJq6BPgkGT2gtzwD271rulPyxG08mOtouLqNNX9N9hIzYPKO/hlI4orJ9Z+@lists.infradead.org
X-Gm-Message-State: AOJu0YzXlshRlEFiLsqAxrJcpsLJyHh3SX1TzeWxYWft+03G0d7V5g7F
	qAdEgDWb3ovnMu26Hi08IoqaBIpBbuf7BmNqfW7az4ZUZf5emqvyl7JNXa8ofPs9l1BOTqPZNvQ
	VURACD0tO0eRNLLKiki6To2LlJyNDdsVHHULP4g==
X-Gm-Gg: ASbGncuWzmxjmevDJkfoa63HT+drLb4C1STMZ24Uoz4+2HVIXtTFybVltSqdxW7t2LI
	1BXY2G4/bqrHM/EmBC5BLJLr5PvCE9yeeLbeAzg==
X-Google-Smtp-Source: AGHT+IF2LLGkHaJSarnPgvm0Kgxntz+fNWmnGhoCtlmHL5N4aI/xdAXLlv+RE/jSC8BOvNaB9ScXG0+oPhs6feqpfqg=
X-Received: by 2002:a05:690c:f86:b0:6ef:6f24:d0b1 with SMTP id
 00721157ae682-6f3e1c08eb2mr31197877b3.39.1734609289843; Thu, 19 Dec 2024
 03:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com> <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
In-Reply-To: <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 11:54:31 +0000
Message-ID: <CAPY8ntCX8+yg1RFhAXu4ystGF_JivTh43RY=k2P0bUm5JxvzRA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241219_035451_425613_6C6168C4 
X-CRM114-Status: GOOD (  25.64  )
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

Hi Krzysztof

On Thu, 19 Dec 2024 at 08:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> > Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> > added the compatible string for BCM2712, but missed out that
> > the number of interrupts and clocks changed too, and both need to be
> > named.
> >
> > Update to validate clock, interrupts, and their names for the variants.
> >
> > Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
> >  1 file changed, 70 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > index f91c9dce2a44..fd25ee5ce301 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > @@ -20,11 +20,20 @@ properties:
> >      maxItems: 1
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 3
> >
> >    clocks:
> > -    maxItems: 1
> > -    description: Core Clock
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> >
> >  required:
> >    - compatible
> > @@ -33,17 +42,64 @@ required:
> >
> >  additionalProperties: false
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      contains:
> > -        enum:
> > -          - brcm,bcm2711-hvs
> > -          - brcm,bcm2712-hvs
> > -
> > -then:
> > -  required:
> > -    - clocks
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2711-hvs
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Core Clock
> > +        interrupts:
> > +          maxItems: 1
>
>
> clock-names and interrupt-names: false, unless driver needs them but all
> this should be explained in the commit msg because it would be a change
> to the binding.

False it is then.

Is there actually a full guide to binding requirements?
https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
is the closest I've found, but it doesn't obviously cover these types
of things.

> > +
> > +      required:
> > +        - clocks
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2712-hvs
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +            - const: core
> > +            - const: disp
> > +        interrupts:
> > +          items:
> > +            - description: Channel 0 End of frame
> > +            - description: Channel 1 End of frame
> > +            - description: Channel 2 End of frame
> > +        interrupt-names:
> > +          items:
> > +            - const: ch0-eof
> > +            - const: ch1-eof
> > +            - const: ch2-eof
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +        - interrupt-names
>
> My previous comment still stands. Reply to people's feedback instead of
> ignoring it.

Your previous comment was
"Why requiring last two names? Commit msg does not explain that."

I didn't ignore it. The driver needs them, and the commit msg states
" but missed out that the number of interrupts and clocks changed too,
and *both need to be
named*.
Update to validate clock, interrupts, and *their names* for the variants."

Is that insufficient?

  Dave

> Best regards,
> Krzysztof
>

