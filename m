Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFCACA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xtxRuaoXngMWzDes/bLKJ29G8INr9oKLKpCWom6nFQ=; b=GxAnuau4aL+4NrJifdtS/uZCbz
	8mCwlUF8EZdpSRDj5+5JB2lYblCqqc5jIM01tWxkCZqrdhlyax9m/gxKiLxCHH0boaPYPClQ/87W5
	3ryHdyNTxTrF9j0cLOS4BsWYKjrxZ+YdI2603ilmcZ60OGYaHqyP93He/76ve0TQXciG/GMVPen/x
	tvTEOoAYzm4Qy7cWKBKpz6D90cRpMoTizOzCGwsvoAWB25Bon9dqZZNShe/uBO32/GZVCcw5Yde/E
	TF+MdMCz9iKxV+n6zKNFL+5mGEfQZp4fqDIRn5ZcBnFoV1MiqG1ME11p16WVPCq/0lfpoKwNGvSXz
	sqfMU96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upApf-00000000I0O-0R9L;
	Thu, 21 Aug 2025 19:20:19 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6yT-0000000HJwo-1Xmj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:13:10 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so1519539a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755789188; x=1756393988; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xtxRuaoXngMWzDes/bLKJ29G8INr9oKLKpCWom6nFQ=;
        b=AQ6yU2fF0euoN0YgyOdzJ1C6gKuYxKtQPFYP1sX5a4OWPMpZaSSd66Tvm7NIFQjMkS
         nFe4LdjX97FlTGEE5HP2Yt9P0tC3F8OyzGUjz5eNn7JEJgGydUu4+v0dbUqUxEKVDSLc
         6QZABNdmRApFOKvuHDgfdIndjROtTGsCAprIjORKnotpF/hqUgyr7sP0P7Upm9yBtDh2
         5//8CUDw8m5f+brTgInfuN8dtpJp2ZKvVki+MtdR+mnkW1BZsGMt5P/mRd0LMr0yWc3c
         Hc7FiVREFhbzjnXr3iJCTdm5vaD5BNBIkIZn+aAMVgYR9w6DNb6mn6fDhlpgE5TfZsKz
         0UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789188; x=1756393988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xtxRuaoXngMWzDes/bLKJ29G8INr9oKLKpCWom6nFQ=;
        b=KWZ2ww+R2iUlckv16TERkooZYunp3yvSzYgABVWTUkwBQ1W3cJlh4z3ZReon9fwp82
         CLJwVAw60GsGTWhHz1t62iPAgmP3rErK/E5xwOqkENe1F8c5UqzyP5nMeTAcyjOzJ9Dm
         H5t/xv9RKR/XPBYqMygggU6VKoq39BJt9q7qdp6QU0biYha1+5/kuMV2Lt81Hv2kP/Kn
         hErg4dabhZUYXAUCURN7hxfBx0kvuGOTtla0tjH8TOBy9Ica8Mx+LURMR/Z4I7sIRQcA
         gRhR0E1ViBBNFuTHTwiH4AAxpOOEHgQFzd3Db7vDFhrCC9MjzwG+aZS1G1airIzhVXkJ
         /Wbw==
X-Forwarded-Encrypted: i=1; AJvYcCV5z0VYSX6iIuDV6rm6ZTPBVuPF5OvPKJxaYs0u50OOvRk12ukOLRHdaK4lqQ2l6jxbS78Q+5ugYCEHpyxDjZpu@lists.infradead.org
X-Gm-Message-State: AOJu0YwBrVqNjf2pTrrJfDueV7rK88qrfvVXWKrZK9Q4GUGfLREM3ICV
	jtkxTVkOm3BWq539gXcJ21IMqBbFX/jIkSdlP+FbVEKhCgWx7mr/JqgOzvxS++Dqpmo=
X-Gm-Gg: ASbGncsfMl9FRN2L8rryFrUquPDbe/WqQPor7IlWrirWnlYtJF4Dk0G7KrmabDOtRau
	L1JfhpZQ0FA8Zv7sL0z2L3uTGbqdjEyceUe+LhFKexIvZXtTMH3KII/rYGd56PSir7rmb0cZHtB
	sLdMKGVtBG2Q04vGmLMpuMgmdeUo1pdKf9b8/goQAWfEg6qfCv07ib9KSRmi/IEKi2S6jIhkyS/
	fi4U02YjwYgdcjTioFyANyto3wpU7w1VEiTFcrz+ge8KMO4JZCvhPkkohEF1ot0Xi8Y3AuRc+LH
	6pvoQ28RwG4g3U+Iz9YuCe0yNUqGykI6QjZJjK9tqI2zJQPdVp6fjoaefX56SUlLz3c6/tkc6Bg
	XHHr9qN7RQg4Phc630o6bNpuJyaOivywXxi76mje78QCvFv/V7rmvLQZfu8PI
X-Google-Smtp-Source: AGHT+IET+pViMkmHfWuU+dAIph0lKCRKrp1cWSJUrymAHEUx2uNDRZI8YqflErDfwiyzgFbu3IhI8g==
X-Received: by 2002:a05:6402:84f:b0:61a:2cac:890c with SMTP id 4fb4d7f45d1cf-61bf86ef69amr2362795a12.13.1755789187656;
        Thu, 21 Aug 2025 08:13:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a8ca8660esm3796686a12.10.2025.08.21.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:13:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:14:59 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: serial: Add clock-frequency property as
 an alternative to clocks
Message-ID: <aKc38_NsDy4G1uRy@apocalypse>
References: <cover.1754924348.git.andrea.porta@suse.com>
 <419658ce1a1009c6f8b7af22a02b278cd695dab0.1754924348.git.andrea.porta@suse.com>
 <d02626bc-a00e-486a-854e-b4555c11ee85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d02626bc-a00e-486a-854e-b4555c11ee85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_081309_405514_CA6D2E9B 
X-CRM114-Status: GOOD (  26.57  )
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

On 14:02 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> On 11/08/2025 17:19, Andrea della Porta wrote:
> > The UARTA controller on BCM2712 connected to Bluetooth chip does not
> 
> Bluetooth chip does not ask...
> 
> > mandiatorily ask for a clock connected to the high speed baud generator.
> > This is, in fact, an optional clock in the driver.
> 
> ... or driver does not ask?
> 
> Please describe here hardware.
> 
> 
> > 
> > As an alternative, the call to uart_read_port_properties() ensures that
> > just a simple 'clock-frequency' property can be specified for the clock
> > value.
> 
> Don't describe drivers. Describe hardware.

I will try to test whether the driver can just work specifying clock instead of
clock-frequency in teh DTS, so there will be no need to amend the bindings.

Many thanks,
Andrea

> 
> > 
> > Amend the bindings to allow to either specify clocks or clock-frequency.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../bindings/serial/brcm,bcm7271-uart.yaml    | 19 +++++++++++++++++--
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> 
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > index 89c462653e2d..96697b1428bd 100644
> > --- a/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml
> > @@ -40,7 +40,15 @@ properties:
> >            - const: dma_tx
> >            - const: dma_intr2
> >  
> > +  clock-frequency:
> > +    description:
> > +      The input clock frequency for the UART, Either this or clocks must be
> > +      specified.
> 
> Anyway, don't open-code schema in free form text.
> 
> That's legacy property. You need clear explanation why.
> 
> > +
> >    clocks:
> > +    description:
> > +      High speed baud rate clock. Either this or clock-frequency must be
> > +      specified.
> 
> Drop last sentence, Anyway, don't open-code schema in free form text.
> First sentence seems redundant anyway.
> 
> 
> >      minItems: 1
> 
> I'll fix this.
> 
> >  
> >    clock-names:
> > @@ -61,11 +69,18 @@ required:
> >    - compatible
> >    - reg
> >    - reg-names
> > -  - clocks
> > -  - clock-names
> >    - interrupts
> >    - interrupt-names
> >  
> > +oneOf:
> > +  - allOf:
> > +      - required:
> > +          - clocks
> > +      - required:
> > +          - clock-names
> > +  - required:
> > +      - clock-frequency
> > +
> >  unevaluatedProperties: false
> >  
> >  examples:
> 
> 
> Best regards,
> Krzysztof

