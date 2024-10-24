Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E711AD10388
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd8x1e93gyeJX8KDkGrIIHUTJan7juKooq/kAucfUrQ=; b=e4pGFuR7e5WNCRDrJHQNWoXdOl
	YoFgaO/xmykb7kUz5Bi8r6IH9Mpe4YGOThdzYhN4pOLlVypCW6KCAn1Mpby+rlJEnNmt0xYF591eg
	LkBdI4Mob+1XrnxhadYvaxizYge+xBhi8Lq6zoDWYN+DEdzmjT5c0YkOTHKkAmx1UkAgPwMgoy9Pc
	XgM2Kive7Z2jjZbqszdOPRd6EVMPd9cpxKWZBGjBJ4qX12SWN4UN3DdLr6qz7DrbvC9cly9BJ6P9B
	eEibIxmCXuTiU+x91jBd39Wap2hXX3JYdw+1xLho89XAptAWb0sVdOHnRuKx823+NF9KIW75WDLi9
	jKWr8n9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t46WH-00000001yjh-0UB2;
	Thu, 24 Oct 2024 22:41:29 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46TG-00000001yX2-29B8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 22:38:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1341638e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 15:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729809499; x=1730414299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd8x1e93gyeJX8KDkGrIIHUTJan7juKooq/kAucfUrQ=;
        b=KXXoi/dlky3hawXIULwvoBlwgYe7KMy8FuT8m2v7+XjLYOwr+cbYjnQlzepMxSUTHC
         HXEeqmzFveypANxsvZ8B20aCpYqMoMZopgiWPON+pEWo6omPXsN6xhpu+53a99XPsIDw
         uyqoEy1HxGGy5W3mriRrV9A79VyvWSxe7JU8Mf/Sobcb7fbZj3xzt5GtxNP3PfWxvgTD
         HMJ5WWXW4WsE89+IRodJIsoCJ7M42q0u0cHHGICFWrylRF54D64RXsIhHJYQ1uQRrrRv
         TvzkPs+6vQCdJhPhcEdMb1i3KiYNFzxdkDD7QjBYlk4UnaD830lprWtkjwtbCNMCzE88
         2vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729809499; x=1730414299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd8x1e93gyeJX8KDkGrIIHUTJan7juKooq/kAucfUrQ=;
        b=b8uJsfiLaC5210swHanPbK4glnFLxijMb2bpM1yB9Jtrx8mPhZhh6rtOzam/7qBt/l
         JytieS018eLELI2APnqoU+8ubUWp0CqEsaQ76oufo8MHMe3frD2OXctNmKGUSeh13YDB
         3jAofvjruDyaASjDuFQRB+JBjHlNuVjApLQXuktDbzyAbFgELXUpRfqMAawdV0Z7Sz4h
         5uvdz8iJFzZ0U+mcd999QnlOUnxjQ1+bEtkfn6HnIdqOI7KyEprl9Oqnc7SyrTy2tNJu
         3+kpz16u8ojyas/p6EpR67PSWfhCiMwOyhXBq5vLJwdY4zkn+57HzV648HC9hZg0zS1+
         AKAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQJjpErg+uAz/oXvhUV7BoeHQbhHlg9fI1dJBxb+8o1JfgFSmqtt9q4cEDib+AgfnIMyuKNqqVaaNYPyrMXOU@lists.infradead.org
X-Gm-Message-State: AOJu0YywUMiaiWT9uPEtTEY2cTV+vXfSKsILND2R4x1vqrHeuGvy9bzM
	DLOOzsCv4GsEUiStPN4731Dfcpo+cle41FEr+lFIyxwEoYqBWaF5y3dQS7c5fy9zTEZM/7EbuNY
	FTw8sE3f4Od7Ve4PE2scEvGtt7fLNxbfR9RAD8g==
X-Google-Smtp-Source: AGHT+IE5xxtC2Rc24n40JWosDcNQf9KHvHXEMlpBefnnaFUNn8d62HXfg1mRdDkM6cR/UQGw/6tcJB7OYxes1hC/wMA=
X-Received: by 2002:a05:6512:a8d:b0:539:fbfa:4a9f with SMTP id
 2adb3069b0e04-53b1a3a7a4bmr3558958e87.58.1729809499262; Thu, 24 Oct 2024
 15:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com> <20241022155658.1647350-8-antonio.borneo@foss.st.com>
In-Reply-To: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 00:38:08 +0200
Message-ID: <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241024_153822_604966_3E3FA6F4 
X-CRM114-Status: GOOD (  22.33  )
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

Hi Antonio/Fabien,

thanks for your patch!

On Tue, Oct 22, 2024 at 5:59=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
>
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
(...)

I want to check if we already have some of these properties
and if we don't, if they could and should be made generic,
i.e. will we see more of them, also from other vendors?

> +          st,io-delay-path:
> +            description: |
> +              IO synchronization delay path location
> +              0: Delay switched into the output path
> +              1: Delay switched into the input path
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

This looks related to the st,io-delay below so please keep those
properties together.

Is this path identification really needed in practice, isn't it
implicit from other pin config properties if the pin is used as
input or output, and in that case where the delay applies?

Do you really have - in practice - pins that change between
input and output and need different delays at runtime (i.e. not
at startup)?

Otherwise I would say that just checking if the line is in input
or output from other properties should be enough to configure
this? input-enable, output-enable to name the obvious.


> +          st,io-clk-edge:
> +            description: |
> +              IO synchronization clock edge
> +              0: Data single-edge (changing on rising or falling clock e=
dge)
> +              1: Data double-edge (changing on both clock edges)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

This looks like it should be made into a generic property,
it seems to be about how the logic is used rather than something
electronic but arguable fits in pin config.

Isn't this usually called DDR (double data rate) in tech speak?

What about a generic property "double-data-rate"?

> +          st,io-clk-type:
> +            description: |
> +              IO synchronization clock inversion
> +              0: IO clocks not inverted. Data retimed to rising clock ed=
ge
> +              1: IO clocks inverted. Data retimed to falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Doesn't this require st,io-retime to be specified at the same time?

Then we should add some YAML magic (if we can) to make sure
that happens.

> +          st,io-retime:
> +            description: |
> +              IO synchronization data retime
> +              0: Data not synchronized or retimed on clock edges
> +              1: Data retimed to either rising or falling clock edge
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]

Can't these two be merged into one (generic) property:

io-retime

enum [0, 1, 2]

0=3Dnone
1=3Drising retime
2=3Dfalling retime

Retiming seems like a very generic concept so I think it should
be made into a generic property.

> +          st,io-delay:
> +            description: |
> +              IO synchronization delay applied to the input or output pa=
th
> +              0: No delay
> +              1: Delay 0.30 ns
> +              2: Delay 0.50 ns
> +              3: Delay 0.75 ns
> +              4: Delay 1.00 ns
> +              5: Delay 1.25 ns
> +              6: Delay 1.50 ns
> +              7: Delay 1.75 ns
> +              8: Delay 2.00 ns
> +              9: Delay 2.25 ns
> +              10: Delay 2.50 ns
> +              11: Delay 2.75 ns
> +              12: Delay 3.00 ns
> +              13: Delay 3.25 ns
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 13

This looks very similar to the existing "skew-delay" property:

  skew-delay:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      this affects the expected clock skew on input pins
      and the delay before latching a value to an output
      pin. Typically indicates how many double-inverters are
      used to delay the signal.

can't we just use that?

Feel free to edit the text for it in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
if that is too clock-specific.

Yours,
Linus Walleij

