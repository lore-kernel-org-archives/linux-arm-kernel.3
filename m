Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BA6E6B240
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=; b=pubNWjfoQosj2yTeY6yPgapk3s
	eUFtxZznnxD5GlV9KjbPAWSZDOFUtPdasq2icVQaFr0XM/ul2vyT2yds4A8bQoGiePU1s0CcgXVfl
	itT8n1g8C+gm7MzTdyDQiesgcTtbu7dzE1ymU1EBduaXqSed6BaB4pMD7dITIvfJfHOE8VSTBI4ZM
	RexWbfKFi1G/69+2a2ejPTNGLUaRVXt+GQOeKE55uy1qqw7cVhsF5OtFeU8jzbD6rCpsXlp7TVNka
	50jdRHPAcq9OLQpUCcnrnk7gnWf0Gx8SKSLVd2CxRvt8y1fsqIHEIk3V7LSkJlt6je/D3NslPrBxn
	1P+ioQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6p5X-00000006cZ2-0Obs;
	Fri, 01 Nov 2024 10:41:07 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oqC-00000006ZHd-1vOc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:25:19 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb49510250so19128781fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456711; x=1731061511; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
        b=PCmmt3w45N3855qVfWGhoJJkxjVZWcRqfZxgeCI8bKJVBdlLAX7NJDUFK/txlmxEke
         SWydsrU7fD/M+w+hqW4paxwi0XLdMMUPeVtfsCPcCebG/vM2l1spwVG9Z+GKnksBVTv8
         Qgc/sUyLrmG1Y7G6xS0zRX2rzSRF1csLuyA4keb/xmmW0PKnp9FkJMGZQ1RvJ+T8ngC9
         e69JK5j3SPVXg4Rkrmewoc2AnFu+jTrbaUPIvTgVSnGZP4DNCqh27t5/+DOUUwQ973Tv
         oLI2sKVBNtcC6AxT2Lj0eJNsQprqPA6O2f53U3dON7RvPwBL3B/Z8gO/69xsfsZa31Lk
         kwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456711; x=1731061511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
        b=c1wT+iRga+PEMXDwsFPrP0L2hOLzX2LNQt98fKCsMrEchZBLij+jrG4BTXcI31cWYr
         B2MfcFvHBMzgHaHnWJNgHiDeQIBOUocoYYuYcNQqUp9x0OyvwZLO1ZCDNZg4P09o7Rt8
         sh7YRRRtbp5LhQqKnF90Q2FsAQXzeB/9YV2zRepSRliLgl24YUorOdePkLKuEMd5+Ggi
         SFgNMxqxQqkCPuyJBhDNXaZqkWEPDOEAjGgGTkYTgzvq4PmJNRICXhok7dGvLx43ZZao
         pvl+w7Sbx6ZlLMGgFUJdl69dRusQHL6YQPoHIYrHfNHa7ZFxuWt1q7IAknrgdzEFiCim
         BFhw==
X-Forwarded-Encrypted: i=1; AJvYcCVQerzVALBCcot+FF5DqcbMTBelvZfDI1fggjkjF9Up436EJKvyTms0m7iHBwhMLZpU0pctmmfQPkayNsneCDv5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/jen+y64PJCRVTQsyOfV+7yCMud9/WVtXU/q7ur/lEHgnpLpU
	ORyzpqbakRMPW0R2ynuZzZhCipQGeAOZ4h6JcClyCPpQMYlpvfDTFQ+TDHQV6dxqDnqfMLMOY2G
	Ew/ONHcxEW3opi5O8jlkSzK7HrRlb0nYHhorLxg==
X-Google-Smtp-Source: AGHT+IEh3UD7clJCQ/gk/n1lZMbdbxLI4TLsCj8gBPyhuLX6iMsirPWos/kw6T81Ngl9MnmOHHdaCm4w/4b+g80Z8io=
X-Received: by 2002:a2e:819:0:b0:2f7:a5fe:adbe with SMTP id
 38308e7fff4ca-2fdec72f2bemr26733951fa.18.1730456711357; Fri, 01 Nov 2024
 03:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com> <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
 <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
In-Reply-To: <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 11:24:58 +0100
Message-ID: <CACRpkdbne8730=6Hvd2W5ymv3xYNC6ApPthT0Fcb+D-fafA_5A@mail.gmail.com>
Subject: Re: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
 synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Cheick Traore <cheick.traore@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_032516_819576_64469C40 
X-CRM114-Status: GOOD (  32.34  )
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

Hi Antonio,

some responses below!

On Thu, Oct 31, 2024 at 2:44=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> > Otherwise I would say that just checking if the line is in input
> > or output from other properties should be enough to configure
> > this? input-enable, output-enable to name the obvious.
>
> On STM32MP25x there is a 'skew-delay' HW block on each pin,
> but it's applied independently on each pin either only on the
> input direction OR only on the output direction.
> There is no automatic way to switch it between input and
> output path. This property assigns the delay to one path.
> The generic property 'skew-delay' does not considers this
> case.
>
> While I could extend the pinctrl driver to include the info about
> direction, that is trivial for example for UART or SPI, it will fail
> for bidirectional pins like I2C's SDA; some use case could
> require the skew-delay on SDA input path, other on the output path.
> Also the idea of assigning the direction at startup (e.g. in the
> bootloader) is not feasible as the delay depends on the
> functionality that can change at runtime e.g. by loading modules.
> I prefer having this "direction" path explicitly selected through
> a DT property.
>
> The existing properties 'input-enable' and 'output-enable' are
> not specific for the skew-delay.
> And I think it would be confusing having 'input-enable' or
> 'output-enable' associated with a bidirectional pins like I2C's SDA.
>
> I propose to change it as, e.g.
>   st,skew-delay-on-input:
>     type: boolean
>     description: |
>       If this property is present, then skew-delay applies to input path =
only,
>       otherwise it applies to output patch only.
>
> Or, it could be a new generic property (keeping backward compatibility), =
e.g.:
>   skew-delay-direction:
>     enum [0, 1, 2]
>     default: 0
>     description: |
>       0: skew-delay applies to both input and output path, or it switches=
 automatically
>          between the two direction
>       1: skew-delay applies only to input path
>       2: skew-delay applies only to output path

I like this property the most. Can we go with the generic
skew-delay-direction?

Also state in the existing skew-delay property that if
skew-delay-direction is not
present then it is assumed that the property applies to all
directions of a pin.

> > > +          st,io-clk-edge:
> > > +            description: |
> > > +              IO synchronization clock edge
> > > +              0: Data single-edge (changing on rising or falling clo=
ck edge)
> > > +              1: Data double-edge (changing on both clock edges)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1]
> >
> > This looks like it should be made into a generic property,
>
> I believe it is too specific to ST implementation.
> I see already some 'retime' mentioned in old ST bindings
> bindings/pinctrl/pinctrl-st.txt and bindings/net/sti-dwmac.txt, but the c=
ontrol looks quite different; I don't plan to reuse them.
>
> I will fuse in V2 this property together with the next two in a more
> meaningful one, partially acknowledging your proposal below.

Hmmmm. Let's see. I know that e.g. MMC has similar properties
and if similar things appear in other bindings (not necessarily
pinctrl bindings) then that should also be taken into account.

And in MMC this is called DDR.

Yours,
Linus Walleij

