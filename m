Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E7CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOaWu67C1VjWzsEPqOzUQCmn+iSXUetMOVFsDVhAcDg=; b=cZTl4UHBND7Ap2jU6+a1Fa1Te0
	b/SNF0R3RBDSwEErEyP1yd4Azv+u1vbuWL+69xMA+aRxe9KlkFdCSU3GCTRdJT1bMAjGrZxCGj7f3
	wdC71SfzUI4IwSTmJm/mWgKI2lM5NvVHkQ5ZnTVsJr4oHbHSAA3kO6XkOeXFbM4bRxGr/tlMcXn1M
	SWwUw6sFeGKa3UbWPEGIM69x6kkhwdFiGxjcksfnNzoDZrBbriPUcSkfLwpXzXC3UmmKexHqBBXh9
	KjZCTG+3+5evfFsLh/E5KHxUFoqL+5Upa2atJgszoig+KaEHbZWpjSQypTzjYKwvBg8a9yovieiIc
	Wn4IrpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Izr-00000003rG3-05n6;
	Thu, 16 Oct 2025 08:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Izp-00000003rFx-33nD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Oct 2025 08:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hOaWu67C1VjWzsEPqOzUQCmn+iSXUetMOVFsDVhAcDg=; b=YXCWrvuPEV2QEbGdJ3kGSrEJx9
	J27WQnm1/B/JMaMbYXXEE9EiILe1Z8HIWymMWEZ0UcgFGCn6FB0MJulbr3CwmjbOusH38FCvWLNjo
	W69uArrbtWjHmViwvkLRhhoUx8bCvacJnmBCWHgytIX+uGlhoUG/t2JcYdvH/bUWK0rIPKVYAOyeS
	53l6SWY7CHnEmE3wIjjuRZHTOo8ym6Qsr02akl2zD2Dl4PkO3QGTLb70bfvtaOF9OJXTDuFcIOQvF
	z7nUilu8VROj5cpnCp0wuzLVmRlkTImSKvp140b7mW6Owfp8HVBSQMXEPqTCpH19P+RWld7XaiUSx
	jjF1g31A==;
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Izg-00000006aQP-0Dw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:05:55 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso350585137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601949; x=1761206749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOaWu67C1VjWzsEPqOzUQCmn+iSXUetMOVFsDVhAcDg=;
        b=PmHU9c1STojwY7bi/pqxsXmuCOoIdI8QhyiYjbM5DZZSZUlln/0Vkdu+RNUpWiqH1V
         H88tXeKDH8AWs/sJkeN9eN1PLIQZmV9HZbBzVbB3Q6s5hLzL/S7GczVmtaH4B69ql4i7
         LnS4dcBJsgwdOuP6Tm62xT5GqbK7FIbY6213ywy2HpjlcJS34/xT4zBNi2MyC7hxrFnL
         QfZExJ3tVXcCReRbJwMR5OVePKxFrEKuV59msKOdQq/DzyQ1E04utDrjaxNVsb2LdK1C
         7oseGQF8slnYs/Kzio4TBO54XHDu82d4OHVq0AWILb63Kihq+02mZTU6BPtBIqMj6aRV
         CuWg==
X-Gm-Message-State: AOJu0YyLHsIJroZuVFnzeloAMz7ufgJtbUKPcVP1ff/BCE0+FK/qhcSC
	eN4Nc4KwiVRvsWHLQVXGMia1j7x/ivkGg/XNoluWLS/qO9md/WOn69N3047IwDIc
X-Gm-Gg: ASbGncuBaG2Ozd1qyjUJKaIynfgzQQRv3tDs4vRjAlnCzjcYcFAD5yIUU2Vs7fq/4y9
	kD3ZezpGQq6WgrskIgegxacDXPh7KcbZ7W7BEG3UVLU8hb1VnA2dVWxNh5ZLzqLBFuqM/Ahnb84
	CJ44rua5EwuQcZhhsrqfND9LBsZ+dPZ6hGg7+LlSmD1DJCDnME/zeoQ+il82wkig0X2HRS/6q6u
	clLhrvZ8ncZnptXeGBDCXANWQDqNTAy2b8ng7kV58fObMdEkawpFgFPk4YJ4wOO73KVTSywfcwE
	lTJ1wU0rlKE5CUJdfBijlMggqKTjGzIK8380RKtp7jArQppzLzSqx3IFsNY014G5E001LNyjJk+
	wvRgqL9HdA6II0C4Cx2A19UsYUnf8EgaT0+vtrwoH79tfKniH0dvv6Z+iaPi9hoerw7HMVXhsdL
	r9GXtLGLnQX6XduLi4AZMP2nsamoI2kfMlpU9uRg==
X-Google-Smtp-Source: AGHT+IFnrwEoXTq4VWKRI+U7wGoPCXZJQdGdu3pbS/EQX+LxYcdrEmi46TqaJyDRgNcoMSnM2S8Yzg==
X-Received: by 2002:a05:6102:8357:10b0:5d5:f6ae:38f6 with SMTP id ada2fe7eead31-5d5f6ae3d55mr7216513137.45.1760601948852;
        Thu, 16 Oct 2025 01:05:48 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf78bee4sm5153229241.13.2025.10.16.01.05.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:05:48 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-58de3ab1831so298953137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:05:48 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:526:db01:5fb2 with SMTP id
 ada2fe7eead31-5d5e23caf40mr12709050137.30.1760601948335; Thu, 16 Oct 2025
 01:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:05:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
X-Gm-Features: AS18NWBojpV8EGtFpRhA4ksx4kN18NVJp94-AwZBKhJOeu5MaqA3XKOopME9Jaw
Message-ID: <CAMuHMdUwaoW97D3HOQHTO=h+-jh8WBXASfMsN_5S19UUEhs5ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090553_940930_E6E64B02 
X-CRM114-Status: GOOD (  21.22  )
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

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the update!

> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu

OK.

> +          - const: img,img-gx6250
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -146,6 +152,29 @@ allOf:
>          clocks:
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r8a7796-gpu
> +              - renesas,r8a77961-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
> +        power-domain-names:
> +          minItems: 2

I think:

    clocks:
        minItems: 3
    power-domains:
        minItems: 2

plus the required below should be sufficient.

As Matt said, the power-domain-names are already specified at the top level.

I guess they should be dropped from the other device-specific
constraints, and their descriptions moved to the top, too (in a separate patch).

> +      required:
> +        - power-domains
> +        - power-domain-names
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

