Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=; b=vvAMM9NHTIUhUj1PStc5c0Gmne
	KWx8u7YxIEFgnIN74ke3u00WhdJ75MRcTWkTi/aDd1cDX2sVeAhnsecSPHJ4FEUr0yOPGDISSDlQX
	Qw2YqoLCRIZZ6VDKtB+FCG4qrI/KCTolr8t0769lWFhLiacteCxA13Tud53E+PNIM4kvATfEv96zq
	pdKuGfHPKsAIoKWHBc51HoaRmPYx5J75iANTwkmyZWxxripYIXWqTbGcQejCuU3TWZ3bsxF18lYOB
	KzeVLSTLeCrRQzHnIiVnTWrJtNa8fdbUytZan7Ii7zJETwYhKPLwxOLtWk/wjiyRN2JILkqx4A9vl
	Yk7nmbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdNT-00000007yKp-2vR0;
	Tue, 14 Jan 2025 09:38:27 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdMC-00000007y1c-42ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:37:10 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso8447774276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736847428; x=1737452228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
        b=RakxHprVpuSi5H714B2h9KhocQBzkrd0PqgE9El9C9NvcvEeXMzOX8HfH6KhHWSy3N
         hzi7xH9tZ9+JL1EQYBYpxaFhCP6Ij0jb0euOTcbL0S9zVb+vx0LXGZxZ5dx+UOwDkyQJ
         /a5PWbxwDW75+O9ClX3N0zo/6gAW4bm0uD+os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847428; x=1737452228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l89tcIhQpLFA95BmF/dtjUV+SmX9AcHiGhoZt2rDB4Y=;
        b=kHHPlsm43D1ODGvqIpVUo7TCX2ilP1lKpEPi0fUn5lZc52rKHYp2+MWMX43LwDFULP
         3dTiQEua8rEvJOmOeCXEZvnfmTxSTMPEmo1z1t5r3Xo2JAm3Vdp0PLdszshlFn4tNzwN
         QE579xvucUT25EMkyCSREa4oIrTsx+QgG3J+NRVzRpco1JPUD1injrCsMm3DfkHIlA97
         MP5xOo7ouC7Vb7yN2fmgYh3PxB0+GcV3tjxIJzcLp/uj3ApO8+zuqiwVF5KoOHiq5PqM
         uowFVZPzKTQwoP7XGGliu9nhwNkr+OTGR75KdusTHnrsZ4nlOri5obtGL3/U+Dp13iKe
         OLkA==
X-Forwarded-Encrypted: i=1; AJvYcCXTNpzojLlJiPUVeB+hkGIB/L4R95mQDdsTk+p/GgaRkr27zLsrYafAwMTxm8ewG819XA7Lk8nVioLj0R4HPkS/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHmucqNBYo9wHhMudq55EjKOsFFEGLrNI+U6Xza6QStPBHKjwP
	J/xFU8inhrUs+QT/YRi4n296CqogX29vDPOltX+UeNkpH07+ZrO5AiZYkIzK60e6RmCt6BhZEqz
	ww9oiaSdYkuUwrCxnyvtataf7HxLlaNgyPIGZHA==
X-Gm-Gg: ASbGncveSM3VN+sXIxUGex/503Et0im3sXZZZAD1Ju1gwCgbTLgkZKbNNLVF1JbotkV
	GYTa4+zDcvJgwwt2IheNV7F7Y3NWaezKPmuwb
X-Google-Smtp-Source: AGHT+IF6e2gulZmmKMZM/9qfdCNmIYsXwgatFmybYBzO3L6nSNvtxPxQhBPTkQU3rmXIGx0U/IzVq/5dxO9CIKDtZus=
X-Received: by 2002:a05:6902:12cd:b0:e57:2a07:a97b with SMTP id
 3f1490d57ef6-e572a07ab0bmr10989327276.19.1736847428039; Tue, 14 Jan 2025
 01:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com> <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
In-Reply-To: <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:36:57 +0100
X-Gm-Features: AbW1kvbHaMA7-gPSLKl8JCA0np6oyUkVl3x_8EI0Z9Yf3VmqaAgjofQDW5nCXfo
Message-ID: <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_013709_825788_EC15F357 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Jan 14, 2025 at 10:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/01/2025 10:11, Dario Binacchi wrote:
> > The patch converts st,stm32-rcc.txt to the JSON schema, but it does mor=
e
> > than that. The old bindings, in fact, only covered the stm32f{4,7}
> > platforms and not the stm32h7. Therefore, to avoid patch submission tes=
ts
> > failing, it was necessary to add the corresponding compatible (i. e.
> > st,stm32h743-rcc) and specify that, in this case, 3 are the clocks inst=
ead
> > of the 2 required for the stm32f{4,7} platforms.
> > Additionally, the old bindings made no mention of the st,syscfg propert=
y,
> > which is used by both the stm32f{4,7} and the stm32h7 platforms.
> >
> > The patch also fixes the files referencing to the old st,stm32-rcc.txt.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>
> Drop the tag. It was conditional.
>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f469-rcc
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32f746-rcc
> > +          - const: st,stm32-rcc
>
> Nothing improved here.

In my humble opinion, there is nothing to improve. Any modification
made causes the tests to fail.

$ git grep st,stm32f746-rcc arch/
arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =3D
"st,stm32f746-rcc", "st,stm32-rcc";
arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
"st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";

Or am I missing something?

Thanks and regards,
Dario
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

