Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47647CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WbqPTpVsUSqxzGbhEjJKYLBCr4VtJGNv2jZWAZtG8M=; b=bQn+PKyhY1VXPa
	tnTA71EJTKDqV11Z88eaRzDlWqf6zE0mutQXOjub4Y60eRpuAEioneaPnLv8UKtMzOQIqFMHRozcp
	51JAZ5AKWxlaf5aTMfgLTMIhf9aJLeo2WfRCr+HLK+dIQ0E17sc8aVkFSJMraIc6kjiO93NUoSCvC
	+DcC4fiBIANURvBpzWIOJON2JZSdhrCI3W9V9O03RaCydqhTDE5gYaR8jdt0q/nv30cTHxTQU043Z
	EvANenifXqfgdun4S9Ug/Q4YH6bSJ2oq5zDYCBPggmUjXlPbJp0tfSeGLfUAJkxWSg31IXlHkEn5N
	KdYrtd/K+w82qtN92+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzQ-00000002Bzk-330J;
	Wed, 07 Oct 2026 10:35:12 +0000
Received: from mail-yx1-f54.google.com ([74.125.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzN-00000002Byo-3AK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:35:10 +0000
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6756a01fa01so1892422d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369308; x=1791974108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbqPTpVsUSqxzGbhEjJKYLBCr4VtJGNv2jZWAZtG8M=;
        b=fKD7sA4c7pD6IZn3m2Cc9xX/kJUAtcWHEEs7IJde/BtcLjgtNV8yuYZyogs4ucYFGu
         BMRzNb/vbUFHsJq5RQjNnhlm5dIthSMQYHdpv2wX9k1x5uwXkd7R7oXZfl2f+tuJ2DAP
         MlzKyu4wIz35L0BIkQ1boKx+lZyhdSz3sV4/LRRwBRdFWsLpu+U5JYqmcRjCmWHo0Bac
         9LWLjHnPCBKw/6fr8F03sV1zLriWbvbrgsiaJUPaW2lVWybULg4p9e52wE0Gi6HFWaLK
         zD0044zHTNoBt83xXAGxlZ0SDeYzvaaDoLZkHLVYuEvrbwfFuFhMjMwgBKNfmcKegklu
         c5YA==
X-Forwarded-Encrypted: i=1; AKwUvBx9VEtvj+p3F3ICg4ZzhWN+tD89dDEwWPhIyP8gFVxT87qaLyZZsfr2HOM9Qo3P8EVmZGYJIpzxMseSE1a2zufr@lists.infradead.org
X-Gm-Message-State: AFq9FYKLc6Bo+S+T4+oMEDUpf22hVZ3qSWzDLuPqoA8/dGQ4n/8mlOvp
	I2u7S/DAHRnmKMVE9oKNcKfIoJUI9j2deqNzEYvN7Py8mT5KaITZEmqVpIGseEwke7nnAA==
X-Gm-Gg: AYBFou0/iYbonKdJ5sbATjQ15/D53V/leRk+AdQb3XX2veM7IdMtYFLvM375DrwOtNu
	sS3TGHuGlIQv2AFUpICo0At4zTHVlQN3nSN/d/Y/vyDSIZh65CrSbBDhKHk3MGORfHY2sq48FDB
	2/Yt6qlTH6ugT4igxqbIjAFUROjMnmKzRZvFq9XJ8ukp6Ut9HXpkxt3dtWSLastEr5I3jlk71QT
	Zifps+zV92hYeSB2hMWzAyLtZb9/qKQQyyYRkDy5/NEox/viC+MswbVPsrITByG8n9bQc/ZMqs+
	IIlMDbWylF8rfiDwhg36Ixyc4Im0nbCrLzdYpyc/2ohqLjLa+oKFXjbw8LXeaIdzGD9qdBiMaLF
	H92/OTdTvCFXsD/5DH8xAhQukVGRn3uu0GXxtAGrFYojiefDKDywpaYbsYsiBcsNfC6law53ZHi
	vjMuiAtSg3j7uqQMtzJv0FeLPEY6V0ODi+XWghbTYbsi5GZ0zdFORYZdk6gAXOuxEH1j/SzLizK
	rVqJ4e4oNy3WNsii1RKL54bHZOXntlPUi/xX3w7KJkkO2PrkzqO4/nRJXFi3+HWhG0=
X-Received: by 2002:a05:690e:4889:20b0:671:16e9:6b5 with SMTP id 956f58d0204a3-6790a4128d0mr753144d50.53.1791369308083;
        Wed, 07 Oct 2026 03:35:08 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab02413sm7008657b3.12.2026.10.07.03.35.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8726acc5eadso13838537b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdCdKT2OqQ4k5mFCRa0A+SqjqbpjqSeSD4LpwlJIQ6vYMZJyS1zlHH25ArP3JHJn4I7/Af5nfQCABFeB4myOKM@lists.infradead.org
X-Received: by 2002:a05:690c:c748:b0:8ae:c60c:57ec with SMTP id
 00721157ae682-8b05b04e271mr11794257b3.61.1791369305826; Wed, 07 Oct 2026
 03:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-4-tanure@linux.com>
 <asYWEwjFO8g50o1i@squawk>
In-Reply-To: <asYWEwjFO8g50o1i@squawk>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 7 Oct 2026 11:34:54 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
X-Gm-Features: AclHuK_YBbfO7x4D_vDdU1kkRmRoPOMNGgSI5fmJQcVUylonsGY7I5HRmHvp2sU
Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033509_803614_968462F0 
X-CRM114-Status: GOOD (  25.17  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 07, 2026 at 09:26:23AM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches memory through a pipeline stage that this SoC inserts in the
> > bus path. That stage has a gate of its own, which no other member of
> > the family has, and nothing else in Linux claims it. It is therefore
> > switched off as unused, and the port can then no longer finish a
> > transfer.
> >
> > Describing it needs a fourth clock, and the fourth clock of the
> > existing list drives the timing adjustment logic, which the T7 never
> > uses. So the T7 gets a list of its own with the gate in that place,
> > under the name the SD and eMMC controllers already use.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>
> Didn't I ack the previous version?
Sorry, I didn't receive one.
>
> What changed?
Nothing.
>
> Thanks,
> Conor.
>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >

