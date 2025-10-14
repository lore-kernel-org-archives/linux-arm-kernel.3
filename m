Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439E8CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ARDdDrOQu66S70j2Pcr0PW3/0XEEAOGuC2dcR/3tLc=; b=R2pXM468mNAqa14p5jEw5vagMJ
	s2ZbjOTWXY2S+hIyy33uwjIVE4y1N9ugGprdVJGfCpS/ih0N+nz4rHmP7v6dkDCx5G+QZ67WDVp+d
	8tru+tX8izfIDRjKYOEtcjImcSLFsw4a0KUl0u5nn1OydjybW9bgCBfJCsma+ag3X/3IAuYWrH/n3
	Z3m/eMdssOHdabeai3orn7ffP/L0JNd6hW8lvG2/81zFDtBQw7MluZ5xFzAI7MPzO46tdBqKSOivs
	qQ5CeA4gMhPxeFRouFG7d9g/ZEthJkzlsfCLKCg7ddHuxN05UwLT/MwYxe81/TJkrexjdKrOhwc4S
	9nuyYOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8km3-0000000HGjl-2e2Z;
	Tue, 14 Oct 2025 19:33:31 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8km0-0000000HGjK-1xkX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:33:30 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6353e91a04aso6126291d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760470407; x=1761075207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ARDdDrOQu66S70j2Pcr0PW3/0XEEAOGuC2dcR/3tLc=;
        b=jKVVHOfc1JbDjyi52Q7sRn1rR+pffQ6iGN2gdivok84M9PuZYGX1YpmVyA48KE2di6
         6PpdPSb0auuKd0DUlKIizg4aVA/JtTmp+AnExcXdMEBQSYZmNI6hyxFbhQVpqPxleQTD
         kfGLTv0euFSba7kBxtFhW0SigPP9neQ27UOqIvm8wYQJsiTc2L+GRomSozudoyVO4g9R
         KKUKlCHkqpXYFVRPHvbpRL+4b/KLaR51P3/PYenPLaJvgEidnYzZAVOoon+HmkLSTe/N
         WFjW/zIJSyGdW2eS+F/ja8c2O7/byPRITf6pc/TZZUA3fk0S6S23FUTqR5mwBxchQfF2
         2drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760470407; x=1761075207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ARDdDrOQu66S70j2Pcr0PW3/0XEEAOGuC2dcR/3tLc=;
        b=UEPbkxbsVEf8aynI7tXhhHKLGtSr21w7t0XSzyWO+R2seHzZfwAYD7nuBYuTWZHFzx
         1zKiJXKD30oQgGsAarcV6wAyeqjJvJn6G+Nv+U4mYnOQnUnHQG7hSwaPUD59nAgL7/gD
         HGjU89vgAlNKp1me4xtZmIDrO3Qj5pdN2GVVVy8Llna+R39X2WLoQCIPpD0OwjBbjb66
         hcdZC2L6qYPF92naUbFUSbitdXDKtMMu8RIgxmZXxRIPRaseRnrYFiaQz2MldXBQitMr
         +MH0SM14gemyhJvBsWAX4O3dFA2k7ozImPcViEypjgnNeo/ItNvvPwo+wXC20N1S0y/g
         4JIw==
X-Forwarded-Encrypted: i=1; AJvYcCWdcYFb7/3DQL2ZobLxt5F5zaatdimlRgqOM/aOu9K0EWRsw0ZW7ufsfDz8m+KdxTN3d71jCUpKvQAKUw2Ni5DA@lists.infradead.org
X-Gm-Message-State: AOJu0YzgaZ+Ctopk01XrLe9GbALbS1TspcP3ocIll8d6AkC7N0ue73nx
	7v7qJyLx6YJWyGkbQgBDsqdzpu+NuAB86sptF8Sgn3yp1aEzhPG3zMQkxT1fR9uMzj0Ex4ldb14
	hMRnmGY18sNWVFff8eCCAFo9qghM2HbGcmBRplQQU5A==
X-Gm-Gg: ASbGnctJHkAq6nCmY/ZEm8MynSbyY/Bt5fyWiDRqrw3iw2YpGz1hx3MBKyAEoFtIYba
	1MdjUFGBUkxNVlvHzv0ApEqAzSwiBiwdy3OdJFIT99Fosd8HY/gy09epINeVbPaKyLnVSjnd6yf
	LniKuFR70JWcOGdzCZLL2e/KNpxNoZo5tJqzWAw2/b9ruKFTesu2QoMVuk2RhZQEQeY9AzH5A1j
	QVKh60PV4AbIyvGWVUrUKhmvX4WFA==
X-Google-Smtp-Source: AGHT+IEUUPaRH5+Gxizt81iSypGUspUlnjKY5P6YXyV0VyPOzdQrWUfDr4OvmwdgxbP2fD1h3jeRBtg0eMKmQu2V+ic=
X-Received: by 2002:a05:690c:6204:b0:77e:5eb8:278c with SMTP id
 00721157ae682-780e16fc173mr396492737b3.46.1760470407083; Tue, 14 Oct 2025
 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com> <20251014-barbecue-crewman-717fe614daa6@spud>
In-Reply-To: <20251014-barbecue-crewman-717fe614daa6@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:33:14 +0200
X-Gm-Features: AS18NWDBmcyoyPtVx855p7YCo6bUFy5LEzs_BFgLFYqVzycznaj08XFuSAiE18s
Message-ID: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
To: Conor Dooley <conor@kernel.org>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_123328_752278_9DE1E403 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, Oct 14, 2025 at 8:04=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:

> > +  skew-delay-input:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      this affects the expected clock skew on input pins.
> > +      Typically indicates how many double-inverters are used to
> > +      delay the signal.
>
> This property seems to be temporal, I would expect to see a unit of time
> mentioned here, otherwise it'll totally inconsistent in use between
> devices, and also a standard unit suffix in the property name.
> pw-bot: changes-requested

Don't blame the messenger, the existing property skew-delay
says:

  skew-delay:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      this affects the expected clock skew on input pins
      and the delay before latching a value to an output
      pin. Typically indicates how many double-inverters are
      used to delay the signal.

This in turn comes from the original
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
document, which in turn comes from this commit:

commit e0e1e39de490a2d9b8a173363ccf2415ddada871
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Sat Oct 28 15:37:17 2017 +0200

    pinctrl: Add skew-delay pin config and bindings

    Some pin controllers (such as the Gemini) can control the
    expected clock skew and output delay on certain pins with a
    sub-nanosecond granularity. This is typically done by shunting
    in a number of double inverters in front of or behind the pin.
    Make it possible to configure this with a generic binding.

    Cc: devicetree@vger.kernel.org
    Acked-by: Rob Herring <robh@kernel.org>
    Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

So by legacy skew-delay is a custom format, usually the number of
(double) inverters.

I don't recall the reason for this way of defining things, but one reason
could be that the skew-delay incurred by two inverters is very
dependent on the production node of the silicon, and can be
nanoseconds or picoseconds, these days mostly picoseconds.
Example: Documentation/devicetree/bindings/net/adi,adin.yaml

Antonio, what do you say? Do you have the actual skew picosecond
values for the different settings so we could define this as

skew-delay-input-ps:
skew-delay-output-ps:

and translate it to the right register values in the driver?

If we have the proper data this could be a good time to add this
ISO unit to these two props.

Yours,
Linus Walleij

