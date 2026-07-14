Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06217C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=; b=kIt9lqEkVM2iaNVPZ9qxN2E7KH
	TZoeAHrXhazhBuB/9TULi4eAH5RljHBNdAlqF+S0tQBOcF+4nTlRUEctTka7h1ukzS96IAsmaPlku
	cgTzfCfS1qX3Y89iG/8/1+nufnjoTrRR2bKzPN4S/638rFNOjOkWXdN4LLhoIZmIGL5wHpeVB8zQG
	mu3vuahrs61wETbO+hjDjYbh7Ta2a2ozi+x1G0wo+4NHu80521X5gTRtDiZRs00AhyiKjN11mNNBV
	2dWq75FeiCBd7KyYb3VftWSoWcZsUq03qrkyIxFrwV97HVmNmPFrdimQEA+XXiS42tiFQEleJSKhL
	EBUtv5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXLd-0000000B8XN-01yO;
	Tue, 14 Jul 2026 07:14:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXLa-0000000B8WU-1b7z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:14:31 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15ec1da77aso456476566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013268; cv=none;
        d=google.com; s=arc-20260327;
        b=amgBTfvsiL562Z2VYw2gKB63hIS9B7XiNOFVBTrzXLxRPNojzRPZJ6OHTePVN3Prgc
         pm5Qm+28udJC2cFJx4XLLVMDGk5mV4+lxA33+qq52dZfq1BzAWF19MR1kH8t3YTrV05o
         7rciPNWDp1XupdFOk1pR5nsLsAAhO7LXbnJZWewSDwBoM1oB+APpQJGCFNBdgxTGClEy
         NI6qt9FQQFXf2dnJp8e8aHxTvvDyho3bKb8POIZLogSMNQ7RJsUysTsafNgS8gC4AmU3
         OWHELjHsZnxZUCB1rFz8K1yKsaC6+QhAdGFr1gz36wSycVCGw8p453d6IK4IS2sfDuvd
         dSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        fh=40NX0dC5CKa/moZB2oI92WiXzPhTk+CJEhdqjsy9U4U=;
        b=VT+5TxKmlkMZ8UnByMJtQwA/ySnUX6cMlMjVfPw6mG5EpVXryw8lSYL9EXN/33vQ0x
         /xI6e/BDGJsdav9NyZ6q/K6moZx3jWaSbIIYOFBQVmJ8CHlivmFzIXY0aCa90ITEItT0
         ADSEq0CECz688mRzgYsaRtTbpzKM6bNYjlN8gOY0W7729cN1RZb2nUOvdmaFPBss+ppu
         uU19ljwzauF8AuO1ljpprr6bSji5A59vfbN2ySjIM12QHP1wYDghwnzSyBY3IrJ9OHVQ
         v734+Cd1h7SBhzRsENq6Ujpq6kMx2H/3RjZ09BxfDgRvZb/++FlAMIzUNeRJSxzM/5if
         dQXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784013268; x=1784618068; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        b=bp+O94wfB4LxZsDnOAGbzTBi9rjdZSK9UPi4NArLzC2RBqh62RFDZKbA0GT5OuepIg
         THDPUundwfjJ+xeAtnFAitWa4u8ABFujK/a/w4p3ofjjGJxxkbpQoQmx9CyuHGw1fwyU
         NGjxiKnHCIIfIO64OahQtvK4KU2YbGvAWPXw9RKKhW+x3E6TWFe2gZQFQwcGrBQpsldO
         KHWwIuZJgi+MXoyA502I2alQgn1ghFvA7TELEKVBi6O7HYUi8fZyiXsmQJjbvn9NsNOM
         tWfNlFqic5evE1WH42ENv8flwerckHa0lR3leu9AZZEXOPFWcrv2zUiIS+uRo9O5u/NF
         O/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013268; x=1784618068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGRru2gQA+Baamgw+dIgFvngJo1yoHHQsL5cdXvYIZ8=;
        b=Yzldf+UUVo/Tw1qw+v97F40Xp9TUpRzjaVVm6wpAxC82w3Fu0h9JKPwiLhazHrQK5y
         PecJQZpex5tMLM2irN6s6kWVGslt7t/KHS5vsVnGhgk5lpzJLuh+NzqepHjOqeDoR+Xu
         4Oe8UdTkOXDyDcR9dZFMVXb5h4YStuCWRyMSvJsJZBAEBR9F/ygMOOeY4Le86lXAArfl
         EcPsnQpK7J5y2J5xLpIwHMdc2zi/sJJR9H2kYyUGdEHmaxzDznPgsr+WpGc/NScAVFds
         X1TqQWnPamEHvzfgrg5rjn+WXHx7qtVSCuDf26/ycGIdsUUDbGv4fR+VL3kvN2GX7J0X
         Noew==
X-Forwarded-Encrypted: i=1; AHgh+RqK05ITvU/xuSCvggS4JNyu8h0raTC6qhY6U8mNA+Q5LXMSm1b1M4dj54n96A2FXooZNn2UA1XfZJo1ktgjb870@lists.infradead.org
X-Gm-Message-State: AOJu0YwWpCD0ZVC0hsGwbfvtJ6CI61K7oRQ7bTq4ap/6btQrcjtetdx7
	Hra6CjeJLuO5Blm45+qR1qu5NquRojXJw0PjrQlIKOE/vh17340ZCDMw/eeGibrp1++w3oSZ3jC
	AejHYjq75ccaOmw2zXropJuF+yds/Q30sZhgup/ZqYA==
X-Gm-Gg: AfdE7cnNn1CQIqM0sZqDPCOaSNT9X+5cyIKHKpNzd4qarqUW4SQcrRAcaypMb5ZLKwm
	t20PntzRqEjSwCB1ufyof/J52PY899yrGwvIoGULXMGPW2cxdJYTHaAE+GBHwNvBhKvjIYCAgs5
	bAXp7EF4vq2PI1QxzsY+5zermW5mNeXvi6Il32wPljlj11AS/bf+35WRZMpzSVj1QEaPw4EQPnB
	/J1qIJPADLuJgDZuaqO5lFWyKu/GAE4PKhtWQvP1w851DAwBAK3EcpbF1JzxNjD+nOVNBFghRXd
	9ubsQ4Lq7JQoffctoxo9yzsBhcg7Oc5iK/X6F8sDusTnJkr3sMtHLWgrsFy/W5K1tJwo
X-Received: by 2002:a17:907:934b:b0:c15:b368:28ba with SMTP id
 a640c23a62f3a-c166196554emr121126866b.56.1784013268492; Tue, 14 Jul 2026
 00:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <501428d6a6cb1548bf357c25313dbc319724ead2.1783524645.git.gregoire.layet@9elements.com>
 <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
In-Reply-To: <20260709-shaggy-discreet-dodo-e5ffbb@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 09:14:17 +0200
X-Gm-Features: AUfX_mw1ITD-w1oVJUIDHcxSt_M9AD3AkUSAllXjq-zp-XksDV-7pwC0diYVWEo
Message-ID: <CAFi2wKZqHsEa3B9KMDyVk+1Ef42u4TqWzqf6O4SXtamRnWD8Yw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_001430_444730_8C7AA4D3 
X-CRM114-Status: GOOD (  12.40  )
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

Hi Krzysztof.

On Thu, 9 Jul 2026 at 10:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > ...
> > @@ -27,6 +27,16 @@ allOf:
> >              enum:
> >                - aspeed,ast2500-vuart
> >                - aspeed,ast2600-vuart
> > +  - if:
> > +      required:
> > +        - aspeed,vuart-over-pci
> > +    then:
> > +      required:
> > +        - syscon
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: aspeed,ast2600-vuart
>
> else:
> ...
> disallow new properties (see example-schema)

Yes it was missing. Acknowledged.

>
> >    - if:
> >        properties:
> >          compatible:
> > @@ -223,6 +233,12 @@ properties:
> >            - const: uartclk
> >            - const: reg
> >
> > +  syscon:
>
> That's explicitly forbidden by writing bindings (and mentioned as the
> antipattern in my older talks about DT).

Missed that.
Should it be named to 'aspeed,scu-syscon' as the aspeed SCU is used
for all the peripherals.
Or should it be named to 'aspeed,pci-syscon' to specify its purpose in
this context.

From what I have gathered, current convention would use the specific
name 'aspeed,pci-syscon'.
Would like some feedback on this!

> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the SCU syscon, used to enable the VUART over the BMC=
 PCI
> > +      device. Only applicable to aspeed,ast2600-vuart.
> > +
> > ...

Thanks

Regards,
Gr=C3=A9goire

