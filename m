Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=; b=BQdMyvxmia84L6YOhLRZLI7KmT
	3L6s+PLg3+DkDD136epo0LfA0JzwsfcaUNRV034Xex9wEwHqCeYDnRnWX/CJRVXb0BHj1P3VYYHlq
	QtU+TB4Eb7z8Himi/Qx84JANIkrUz3r2k6QXcwKhoGF8P95+Y6EBEgFy5wKpbl1RF9p0gh9KwLZpv
	xVqBHnuS1uAfWrWm0zhQM3FZZ28XuvW6p8o8+BhYZS5Pn0VF5uuU1MfOcdJn07YT3wwqp03rpxyqQ
	TWavHjUrA7pfvyVnPEMjBH6YTx5EehyVxXxnEzGoRoR3lU/JG53E7GeXnKDWdxfirCRitKaOT/ZNO
	7L3diWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf4F-00000008FDB-0UIz;
	Tue, 14 Jan 2025 11:26:43 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf30-00000008Eyj-0Iyw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:25:27 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e549dd7201cso9644232276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736853925; x=1737458725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
        b=YWPLjG/zy5xl2PJvC4vURI3GRHK7MO6sx61E470JhzT3yoHFTy+vy92ZqihhHTB5eK
         a0ZwYFPbh+rXrxiPPmw4aUg4+ispk1l+ecbRh/dkj9lee6ey8A3Hj00Xim5QsJu0YNPG
         +bORZhDRicnOcCFUdbY3dKFzOuEn3tsAf/7y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853925; x=1737458725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNeWxGrE8uIS0WDqmIGcYolBV0o+ZDhi6egQ4fiiws8=;
        b=JQnAQ1ZS7O7MQx42UAZUX5kTvHtzu3DPtzbQMw8QgMIYEnPBMJNyxnkSw5u5hSW+a8
         /KVP6qn9LJotxwMOVT/YmR1z/NfylpZKMjwRps66yd6/CUSheSJeyIrTjRGlB37HccVM
         Az6y/HP8sqX6IBaakt5NdjNgGPIpAfvLMHc9s7PspiwVld+PejZz4/N2qb0hLRLZw38K
         z0bAUv2pRT+SluCE1qJFJ7/ZXqJHciEUoouMV+RiyH38gMd0ChKXjw97eekS/I0BVcOG
         6J4+oEtfQ9BqbGPkn9CkPlSkfzv17LJNC9OcxcKb6zcjvJgpqyJW6SknWpeijz2H+WFV
         wQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPXVOPWz3rGkS5UdiARwF55LfHaJfTI9/CoI/Rq2n3A205AvC06FUmMv8UWbiuoWIris5PFPMq1XJWlyMcfYvh@lists.infradead.org
X-Gm-Message-State: AOJu0YzoUyI8lyctJ/KoHVKy97+2fjn35mNHpQx5lzZhji8i+wkPz9yk
	jE+0csiA1NEOEdO3Sis11QEZMaB8tPt2c7b8riqvJ5HsF32c4Hi4N1n+I4B3g0tXgGuDkIuRgVO
	WWK8WjVYkfFMQ25qph1M6s19YdG4kFkRe4ULcNw==
X-Gm-Gg: ASbGncvECPzpcf8ysMoJHul/ETPaeNGk2AudDc9npRMSSIqnYxVO51x6P13zd5vHwk0
	yv5SRnUyLNIozIAOfaeZ7OidzivcOqqrNtok+
X-Google-Smtp-Source: AGHT+IE5ADFy4Rcdxdx8eIWS6qutMEezXMUhyeb5SIbQjo2wdqwdsiAVueYpuLW3T5twpKf4mq41MGduOKyevWn0ZOQ=
X-Received: by 2002:a05:6902:988:b0:e57:3a77:99b6 with SMTP id
 3f1490d57ef6-e573a779d1bmr8361818276.19.1736853925209; Tue, 14 Jan 2025
 03:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org> <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org> <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
 <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
In-Reply-To: <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 12:25:14 +0100
X-Gm-Features: AbW1kvaNobnTd2MQAHzRF4uGLRR152GowylzO20cIOWKbfYsbQamDcVMjctIi7w
Message-ID: <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_032526_165258_16334633 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Jan 14, 2025 at 11:13=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/01/2025 11:00, Dario Binacchi wrote:
> > On Tue, Jan 14, 2025 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 14/01/2025 10:36, Dario Binacchi wrote:
> >>>> Nothing improved here.
> >>>
> >>> In my humble opinion, there is nothing to improve. Any modification
> >>> made causes the tests to fail.
> >>>
> >>> $ git grep st,stm32f746-rcc arch/
> >>> arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =
=3D
> >>> "st,stm32f746-rcc", "st,stm32-rcc";
> >>> arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =3D
> >>> "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> >>>
> >>> Or am I missing something?
> >>
> >> How can I know what you are missing if you do not show the code?
> >
> > Sorry, but I still can't understand. I run multiple tests, trying to
>
> You don't understand that I cannot improve your code if I do not see the
> code? So let me rephrase: In order to tell what is wrong with some sort
> of code, I need to see it. I cannot tell what is wrong with code without
> seeing it.

You told me that this code was not exactly correct for the parts
marked with *********:

properties:
  compatible:
    oneOf:
      - items:
          - const: st,stm32f42xx-rcc
          - const: st,stm32-rcc
      - items:
          - enum:
              - st,stm32f469-rcc
          - const: st,stm32f42xx-rcc
          - const: st,stm32-rcc
      - items:
          - const: st,stm32f746-rcc ********
          - const: st,stm32-rcc
      - items:
          - enum:
              - st,stm32f769-rcc
          - const: st,stm32f746-rcc
          - const: st,stm32-rcc
      - items:
          - const: st,stm32h743-rcc *********
          - const: st,stm32-rcc

I haven't found a way to make changes to those elements without causing the
tests to fail. Could you kindly provide more explicit guidance on the kind =
of
modification you're expecting?

Thanks and regards,
Dario

>
> > modify things
> > based on what I understood of your suggestions, but the tests failed
> > every time.
> >
> > Could you kindly provide an example of what you'd like me to do?
> Any qcom binding? Any other SoC binding with multiple devices?
>
> Best regards,
> Krzysztof
--

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

