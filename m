Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148CFC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djrKksg0US7wjpYKbjxhKXGkwEFNIq44MXbCORg+NoM=; b=TDZxbL5Fsv9kVr//k7idh9xTV5
	ZiIu9Dyvx2are3jRqglT1P1WtQaqkilp7W+jnS0e968FmYCzku9SQYz7WjBgXiLSpdl4WpxDC7QGX
	0v3SOkF8ynfsGFeGswsGsSV/vJO4+VFFX3NT2zPp92PRdSxywKoGPqzjpZfF5L4eq2aGv5hrm9Y9p
	zunacxAjUEY9ob/AzQsAYLDhq/P3biCG6T4x4BOmTzOPhF8j4FDnuVLInY4dIDnjtDcuimUJvxIfm
	oRy/VIQKqV5abfsdo74HWhCMGQdcRWqPGx99B1nRyyH1sMl3TXfmrHz0HMfhZ31uxUxA7vW4M2V2O
	Uv4dYcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5IsN-0000000BvS4-21oE;
	Thu, 17 Apr 2025 06:37:31 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ipe-0000000Bv2r-0PZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:34:43 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c5e39d1db2so19941185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871681; x=1745476481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djrKksg0US7wjpYKbjxhKXGkwEFNIq44MXbCORg+NoM=;
        b=SdDJz4bRFtN3B4pEFO2MVC5237yCOlIEDYOQVuNTHYDYkAKHKoPmNP9MXEcIvqc65t
         AFWrlB60y95LI2FHUd/YO7Zp3sBU3rulBOQcoQiQ3lOYeXyQxbFU96HDyZ0fFUp4T6yw
         ctFTsFTzbXX3sXktRpXLHfdnac6Ke1BdctpHGp8EJP6EQdf+uOHr68t0nIxfh3i1O5Cw
         J63aLRVXJGRQq2b6O6RDyAcBRnNwsgTJ9GrAM/zk/9enabfBCIKcZjRTXjgeP/3E7oRb
         xAKWfys2jm30GK4uDNyuozRy5YMMWFUerLk88BQUFpeHl1aNdbVo+D5xW8MAwtVG45kF
         4yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871681; x=1745476481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djrKksg0US7wjpYKbjxhKXGkwEFNIq44MXbCORg+NoM=;
        b=aLwFLpmss90gd3K2rjdGjP4K4wAwWBVCyRkqRC7DMclRkfSMC+avc1PFXvdBORN6wa
         sQRCKiD904AAhx3Npp88VuCY78+22yFVlkTGXv5joWCG1Jb57FXRtizBq4DpBcbCK+Bj
         rS/B+c7P2LDhXmBtWFUXt1/JgqfavlAF5zc9Z2bbS/VsoCuDEw2l4pRDTylS8yYorf+T
         OXXEXa+/0NvyoqMWUOr6nCsIPkTP4ChntSQwsmY0jUrFDq4HEYOL7j4rEKZl9V0Je/eG
         kUL3zTyAAjVezLwSOB9geBiNPDbhWG2Xtp4HyVTKzJLWZQJvaVvkeXM48iJU+w5ZBXIR
         gymQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt9O+CG3+pg2chFDDVpB0XNVapnhoaSqIMr5856anV5mGYBOZaBlxfu0onxGPrQ1ImKF6qwi+J2AFq3Yd1IsnO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0VL9dERgwUcSCPFhkDGC9WkPd2Qf3eldjU0EATfPvT7d9Jl4B
	gVRwcOce4W/4ORaxfrR6Erzc+p4mvqwuYmzbpsv6g/mMNBI7aA8f2hTT+TYAWqyCKAPKtL6DxQ0
	EoE5smYr8UqlUEIT0r5H4Fo5D3LE=
X-Gm-Gg: ASbGncv5lmZa6mlghQZmBWmmC/nDXMiX64j+okU99Rn1x3ebgdt0zoqnOf1iBTFaFHz
	6JbTBrOca8Jervzc821geKpLFTZIBH+Wp2ML/3Kjdkn1RxUJjHzu7jgNbg3WdSoQFC8p1lK5ppV
	VUtaLc/vPW11MqUBEk1GWw9lyejNwAZiMNYvTEY/NkvGWGT9bK9F9c8mQ=
X-Google-Smtp-Source: AGHT+IHgsGgJmwmxEKpnhc3KaUBpTUWHrt6Vox1Gn3UnUAAe0PK/gYXRZtPTbixswh+oM9dFXyzr2ky1IWWsAGRzgTE=
X-Received: by 2002:a05:622a:1984:b0:476:9b40:c2cd with SMTP id
 d75a77b69052e-47ad8166f80mr66686231cf.47.1744871681175; Wed, 16 Apr 2025
 23:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com> <20250416201606.GE3811555-robh@kernel.org>
In-Reply-To: <20250416201606.GE3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:34:36 +0400
X-Gm-Features: ATxdqUEmV2dRyfh29pPC1NXM6TzAsbkslAEtgKdCvmLjQOkkOfZg9YZfF61iss4
Message-ID: <CABjd4YxKe0cb9qwS-ZHxuYmq3exD8TUPrY-9ZLsT5tCEdvPzWQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233442_135996_2845CAB2 
X-CRM114-Status: GOOD (  20.04  )
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

On Thu, Apr 17, 2025 at 12:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:31PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia timer
> > as YAML schema.
> >
> > The IP can generate up to four interrupts from four respective match
> > registers, so reflect that in the schema.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
> >  .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 37 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.t=
xt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> > deleted file mode 100644
> > index 901c73f0d8ef05fb54d517b807d04f80eef2e736..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -VIA/Wondermedia VT8500 Timer
> > ------------------------------------------------------
> > -
> > -Required properties:
> > -- compatible : "via,vt8500-timer"
> > -- reg : Should contain 1 register ranges(address and length)
> > -- interrupts : interrupt for the timer
> > -
> > -Example:
> > -
> > -     timer@d8130100 {
> > -             compatible =3D "via,vt8500-timer";
> > -             reg =3D <0xd8130100 0x28>;
> > -             interrupts =3D <36>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.y=
aml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20=
ef6b7e0367c5a36f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500 Timer
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-timer
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 4
>
> Need to define what each entry is.

Will do, thanks.

These are OS Timer Channel 0~3 Match, respectively. The hardware has a
single 32-bit counter running at 3 MHz and four match registers, each
of which is associated with a dedicated match interrupt, and the first
of which can also serve as the system watchdog (if watchdog function
is enabled, it will reset the system upon match instead of triggering
its respective interrupt).

Best regards,
Alexey

