Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B93C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xglRKTt4KUB+6yAUqDnkPRNrWgjj9VvUzr7120MLrIU=; b=il4z0ylOA446VbKFrvKCm6tpM2
	CFZoYE2NbCptvMQAba4GTwXDl8VqtJ+fBkxiXqRPzyE0ldE5zDJZAJTOZhFA0jWpIRlHSwwLmUgTl
	xyDx6EBanepBaiEfLVSwYLyufTIOtw7f9x+t3ouvCmwyyTuMrBfUEZxdOhOhuSki2dZMaIk0nfxF8
	YiyS9pe/5hKofoLB2tFsljB9MX9dAdF4eUfQNeCSLSrORc56MPK5Vg8piRo1wvXBPq0TOmnsdo34I
	+PCl5DfhF9vU2U26Dhj0rX8FpSuQrPTuXWho29MLpXvo9ABrYVfWyv1fvn8w0IJI5LG/p+yi+92dT
	0HVZdRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviaC-000000057da-33C3;
	Sun, 16 Aug 2026 21:39:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvia7-000000057Wg-0s9V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 21:39:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698aece3d7eso509922a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 14:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786916389; cv=none;
        d=google.com; s=arc-20260327;
        b=qotfpCvUi9OUfyHbrrqi+aaE+1b0W7edZVaYNkvv4gPbr+941tYMiE1D13C3PdOsrz
         +r3bFgMvmWG2e6joogYM+xWCzFchKBG1/QTdHnuhwnyvO+Hep94dHvZZ2H0L1p9jrl8/
         Z+eQ0YY/EYFJD9rAca6G2q1LqiEat0RWjewuOlCmXVUbmWf73yvK6c35hGhN+bGATRz+
         NiXqbJtS0hXIAZirO5HkQvq1dMyAIbiXtsBZ8kobx4gT2xnRwh1+5SNbqlxNSc7IjdEE
         YFbyN5SHAAlHe4TzPZubFAwyJlb5xQVkFbrjkCZX3SG0fltL388+n72qZ8oMF9jJODIB
         y7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xglRKTt4KUB+6yAUqDnkPRNrWgjj9VvUzr7120MLrIU=;
        fh=ylKA7vRBqmGMqWLfE6fU+CXXlC4jwwPFiRzBG6OWrFg=;
        b=Uqy1IcJzWVuVeULk1TOuzbfHcsdMvZdkvEiM6ykF9pX1TAmfJ0knZUPH8sP36P8Zdj
         HUcE67WGh6fAv3DKaSEK8hugRpHgg2QRwpjCNVhwaVhVkj1VpdmqsnEA0NONEHhNMCHg
         EW88zOXA0/WkvBGtNvTzWIsdAZsR1w9QlvR5hx2ieSCySH8rS/cwPRGlFlXMuS9qATG7
         mD2Nq/slTH5niYYCr+2xxIMTeTz0TNpx4noPnvXekagFBdRbxiByU98dXvmNVCXcsaXq
         18gaoUFYz2oXHVx7HyQ5t+7rJQI62RzBFV5Yyhh7CJqgk7JK/Kd9YbqkkuWwh/Qy9MZ1
         eK1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786916389; x=1787521189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xglRKTt4KUB+6yAUqDnkPRNrWgjj9VvUzr7120MLrIU=;
        b=QLZeytSA6n7wcxX5e1AeVHC7nFr1rkTXt1rdb484l5PpEhoFy/9dnPmye4ryCPbH68
         iD5ASc3Rr128Ud3Hs2vDzT7hVw6VwyX5bMKzJFC9ZltjWBrPTapSNAc+EtqXewPhF2EW
         WYhrb8P+QVAi61WcFLlzv1M3kMLYdHLrth7JGP7p//BFaGTMbyZf/lajdJTci0El6StI
         LszyZb+SjknB7xEYJYpqrKRAQ31oRJdHg+Pf2Y1fYaezW4uZDR54gI8AqzD3o9y/UZuy
         MZ3SJbj55Ck1+6TQaKTP7MEOIUz7zKKnWa6T5WLSE5wOUlzTk/5DGor+MdlvPiQcYz1/
         1ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786916389; x=1787521189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xglRKTt4KUB+6yAUqDnkPRNrWgjj9VvUzr7120MLrIU=;
        b=ctsTxJ9IMW0fPj4W+7cDncuLIlC5WFJRH7aK2zK2s9CrYi5okZJo7ClRL5Zx3mOCxl
         xlhbAOJJqCGThyBrZCpYyAdAqPOu3en6SvD+rIH+fy+9BbIAy0Oss+6+3KSsXdS5/bhE
         eP8viLoB3riybKxoINO94AWe1iByr5nKfbungtXSKWn/Lad1dQajFQONxxMXCond7GA/
         AsGVpbkUw8p1VUAHkin4YQs/7FKr2Sza73HW/0LF+cOdB9tQ2nEMVx38l+/6mTeYYwu0
         WsdqdeyMuDckrjpzsJiU78x2GVb/bnQjrh08b9xCvqQi2DHKV/L3wgsvBujwv2RUNtjz
         7GaA==
X-Forwarded-Encrypted: i=1; AHgh+RrA9Z21yvcnJe9I+bahb1KeOqjQCdKXpQcbnNud9aDxU6aBQeR05UdEG+eCkkhDF7N7Ndt3RfZZuV8zyXSh+4aa@lists.infradead.org
X-Gm-Message-State: AOJu0YxSA+D6GVOmQVE1ovxpld1ixPF1qXoFASjKWgTQAwYgnSGstDJr
	rYit8UDMdHosXIlAyKw4aym9UGcnp9YyXunlM1l7O7GrqvQ9O1prwrhWkDj8iAGgeDSSkss11wn
	Qlikce7I+MTB/n7tEHCS35uGTEoKnJZ8=
X-Gm-Gg: AR+sD116AQQ+qcZh1z2IbMWAeeUid0UeC9EPyb3/XBymRgUonuEg+rDioMvsiwB9uOw
	NdtUTB0JNcpaDLCjdAnt1PuqU0Su4JlBhwtb40Qbo4Dzg5wdFrO0x8RZ+bDsNBNkAbn7Op1pO5D
	pyH34tpVdF9BIQMqFxT43E3iFobAXfNf/U+TpQ6fHDtMvh4eFDZsKUWBqmKwgTC2FxFuBzViq4J
	hDzf+QQ5RjPXZKJq12pG2oxOkqPg1t97R6lfBNvkixZM527deKinShvmb0wyP8tAyh5YKnk4c6z
	b7ryDU6vaBC+i0IhisJly2JJFk9y2LegrMeLfe8WOV23
X-Received: by 2002:a17:907:1c13:b0:c16:604a:b2bd with SMTP id
 a640c23a62f3a-c212a1f6ee6mr425274466b.3.1786916388402; Sun, 16 Aug 2026
 14:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
 <20260816-ti-davinci-spi-v2-2-6c6f5171422b@gmail.com> <ed2d4520-f09c-4be2-9c0b-5c6636e74653@gmail.com>
In-Reply-To: <ed2d4520-f09c-4be2-9c0b-5c6636e74653@gmail.com>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 17 Aug 2026 03:09:35 +0530
X-Gm-Features: AcwNN1XNcnn9rjXY-wCP1UnwjDFl0JIj6YGfUBtyZpIqNmQuy5EagFVjYzqBJn0
Message-ID: <CAOWyW_7_gwXzjPh2yZZ-5wR5mArbYZkGJvkCMijpWaML2P4D+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT schema
To: Dhruva G <goledhruva@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_143951_274748_0B40FE08 
X-CRM114-Status: GOOD (  27.54  )
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

Hi,

On Sun, Aug 16, 2026 at 11:09=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wr=
ote:
>
> Hi Bhargav,
>
> On 16-08-2026 03:53, Bhargav Joshi wrote:
> > Convert the TI DaVinci/Keystone SPI controller binding from text format
> > to DT schema.
> >
> > Changes during the conversion:
> > - Create a separate ti,davinci-spi-peripheral-props.yaml schema to
> >   properly define the ti,spi-wdelay peripheral property.
> > - Add missing dmas and dma-names properties.
> > - Add constraints to ti,spi-wdelay based on the 6-bit width
> >   of the SPIFMTn.WDELAY hardware register field.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../devicetree/bindings/spi/spi-davinci.txt        | 100 -------------=
---->  .../bindings/spi/spi-peripheral-props.yaml         |   1 +
> >  .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
> >  .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++=
++++++++
> >  4 files changed, 144 insertions(+), 100 deletions(-)
> >
> [..snip..]
> > diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml =
b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> > new file mode 100644
> > index 000000000000..b685082de721
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI DaVinci/Keystone SPI Controller
> > +
> > +maintainers:
> > +  - Bartosz Golaszewski <brgl@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - ti,da830-spi
> > +          - ti,keystone-spi
> > +          - ti,dm6441-spi
> > +      - items:
> > +          - const: ti,keystone-spi
> > +          - const: ti,dm6441-spi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +    description:
> > +      Should contain a phandle to a PM domain provider node
> > +      and an args specifier containing the SPI device id
> > +      value.
> > +
> > +  num-cs:
> > +    minimum: 1
> > +    default: 1
> > +    description:
> > +      Number of chip selects supported by the controller. This
> > +      includes both internal and GPIO chip selects.
> > +
> > +  ti,davinci-spi-intr-line:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description:
> > +      Interrupt line used to connect the SPI IP to the interrupt
> > +      controller within the SoC.  The SPI peripheral can route its
> > +      interrupt output to one of two lines (INT0 or INT1). Set
> > +      this based on the SoC-specific wiring to the interrupt
> > +      controller.
> > +
> > +  dmas:
> > +    items:
> > +      - description: RX DMA channel
> > +      - description: TX DMA channel
> > +
> > +  dma-names:
> > +    items:
> > +      - const: rx
> > +      - const: tx
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - ti,davinci-spi-intr-line
>
> The old text binding lists #address-cells, #size-cells, and num-cs as req=
uired properties,
> but the converted schema omits all three from the required list, was that=
 intentional?
>
since #address-cells #size-cells are required only if there are child
nodes so i omitted it but will fix it
v3.

> spi-controller.yaml defines these properties but does not require them, s=
o this silently relaxes
> the binding and permits controller nodes without the SPI bus cell declara=
tions.
>
> num-cs was also required by the old binding. It should remain required to=
 preserve the existing binding,
> or else the commit message should explain why making it optional and rely=
ing on the driver's default of one
> is intentional.
driver defaults to 1 when num-cs is not defined in dt so i kept it
optional, but since legacy text binding required it
i will add it to required in v3

Best regards,
Bhargav

