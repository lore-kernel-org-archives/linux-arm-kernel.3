Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE21CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=; b=fgMWZlRqLn+I8IVGbi70XAPBBx
	EhnI/GnKaY6GCS25pyfnrzNWIQOeLNK4ptijpImxq3wN7tKFvHKjaNga3trwj0520LuUTd7J386qg
	h7rek2GwtMd/8M9WXxmCh2vH8RgCwOyJk6ELx3tYakx2gcSGoW30G0/cGbgsTsl0wyfLuRX/rTuGl
	5lY8Zdt+9d3osJ79ITI5448Hv/3gjbkIf57GaiQDA2lfH6t3WOKpn2Vm2yjOsTm4FbdHBoCme+7uA
	FMsAGtMO/e30Cpfdy1dHzldaDzYDfSPDjXOxaEASZFUQ5PV3/K19Qym0oOGb1nF9roSwInW8Cto+O
	ZsUKNN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX4Q-0000000BzyC-2xFY;
	Wed, 20 Aug 2025 00:52:54 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVfC-0000000BqUk-20B0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 23:22:47 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b134aa13f5so35893141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755645765; x=1756250565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=meK0V1+KR0Hyb3FF1Oupg2emajhIjZoJcigxn8KfXmJnRL8kaj4ghGqNawxyqdI70S
         Ptd2aOKcJuvgpCmY8qSSLyAQPeVT7Eu8U/e62CtmJEBMQ5CmXtgFUlJ4tObH//01aNkf
         NMJtxNAN1+Jjn9yqk/Ambrtn7MAgcG+Hqq29WWWyRj2VO1Sv5LegcAB4ZZAmAKlQux/B
         hboREWfa+n7QYr4uhZ36XJNVnpju/pMkkM5stNVXE24tUOYacs6OUw9JxDVWnlSA0Rm0
         rEiLWO4HaPEPVzfzZ7u2iYXQ+cmSsBlPavyUbr+0OGp1JEFQ2I72eosiutnBYOCgIhx9
         36Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645765; x=1756250565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=gOX/3r/gwthXW9ipXMWpw0AupokQKeHVzwy7bC/qemnI6lYDSG68mW2SxMHyHc1LsS
         kHznVuPP/F6xKT5+Z4YVOC9dZFs0d+XPneVdxZpGXen/sPu/I8slMwMHaVRrctVBlikJ
         MLfW8xeT+lIY0DpmfRPGh+s7hy4M1U++/qQzHtl/HzV1YbvM3o5dkbw+ddyQ0Dyv7JzC
         yWHOlZOXiPPbX1EmyeLXZAnJSzzV2hhS9rxR4NYJoUhyQCg6iAucRO0d2OqpRnF5IwGl
         Tx4pAIWR3D2nLVwvUpZ8wkVfJAuBAmechiEc7MKyEeqDD9fxDZDhkMscXKeNdndYfdaR
         Si+A==
X-Forwarded-Encrypted: i=1; AJvYcCUau4FEG4/dAjH4NVLw+RI3fwaJ5irQmXy02aznli5Id5EfWbLv8hnItwOItSEw8L/SjhZIM9lL3lpeMzr80hwr@lists.infradead.org
X-Gm-Message-State: AOJu0YwOsAj9uOhb5zq9mrtFnwJu9FYpLQqPeC6PaN5Z60c9T2MX6tgN
	a5Zm4kUo6emh5azkAyRoHNFoIWM/R5hbdzqoB43+8sLRCY7wZwzTIm4D/p4TUmWfYvPaF4FbYcq
	3h3TKFbfNznGB+ANEgJvbZVGwOd2Z1YY=
X-Gm-Gg: ASbGncuN10+O0z7gwxsXWvYBpHFD9gXkuqyRhnDCmLyGY4TbChpHhaRxZuX/3bQEYYu
	N6UvOwi8gpcPZKflCSNo/dQu0nLdj4tRNDMtvcRCyGXvz2TVNmuxk4mVeJQ3hQ1H5g9cZiEgdwn
	zzZAS4TTPdNibkN5Yd8YLtHlyLZ4t4/noYkBp6E2zV/7eY043vCdb7IpxwczezCTpzfAJBNIDk2
	VewkTsSF3ncV8sl
X-Google-Smtp-Source: AGHT+IHJre8AvfYFwM+tKjlP1D/tcobYVeLPY4jalmq308RktLJB1oePkAuJ7BQTBO7wQ2idbBiWEq+aIlj4VxZBRRo=
X-Received: by 2002:a05:622a:304:b0:4b2:8ac4:ef61 with SMTP id
 d75a77b69052e-4b291c0a095mr9690251cf.68.1755645765106; Tue, 19 Aug 2025
 16:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com> <20250819201537.GA1223169-robh@kernel.org>
In-Reply-To: <20250819201537.GA1223169-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 20 Aug 2025 09:22:26 +1000
X-Gm-Features: Ac12FXy5USWNvk81C09AV_y_m0PHlKCGlBXsRbqwyr8NREPpK7i0eE4MCUv2BBE
Message-ID: <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_162246_522006_61B0A81C 
X-CRM114-Status: GOOD (  30.57  )
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

Hi Rob,

On Wed, Aug 20, 2025 at 6:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 19, 2025 at 09:47:54PM +1000, James Calligeros wrote:
> > Apple Silicon devices integrate a vast array of sensors, monitoring
> > current, power, temperature, and voltage across almost every part of
> > the system. The sensors themselves are all connected to the System
> > Management Controller (SMC). The SMC firmware exposes the data
> > reported by these sensors via its standard FourCC-based key-value
> > API. The SMC is also responsible for monitoring and controlling any
> > fans connected to the system, exposing them in the same way.
> >
> > For reasons known only to Apple, each device exposes its sensors with
> > an almost totally unique set of keys. This is true even for devices
> > which share an SoC. An M1 Mac mini, for example, will report its core
> > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > SMC does not provide a way to enumerate the available keys at runtime,
> > nor do the keys follow any sort of reasonable or consistent naming
> > rules that could be used to deduce their purpose. We must therefore
> > know which keys are present on any given device, and which function
> > they serve, ahead of time.
>
> I'm confused because you say this, but then the .dtsi files are common.

The SMC exposes dozens of sensors, and figuring out which one is which
when all we have to go by are cryptic FourCCs is proving very time consumin=
g.
This is made worse by the fact that even sensors which you'd think should
be consistent across devices with a given SoC are often not. For example,
the M1 Mac mini exposes the application core temperature sensors on differe=
nt
keys to the M1 MacBook Pro. We have only included the minimal subset of
sensors/fans that we know are common to most devices to validate our approa=
ch
with and make the driver itself useful.

> > +    patternProperties:
> > +      "^fan-[A-Za-z0-9]{4}":
> > +        type: object
> > +        additionalProperties: false
> > +        required:
> > +          - apple,key-id
> > +        properties:
> > +          apple,key-id:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The SMC FourCC key of the desired fan. This i=
s the
> > +              main key, which reports the fan's current speed. Sould m=
atch
>
> typo
>
> > +              the node's suffix, but doesn't have to.
>
> Why can't we require that they match? (Other than we can't express that
> in schema?)

I made this optional mostly because these subnode names are inconsequential=
.
It's the apple,key-id property that matters. If it makes more sense
to say that the node name and property 'must' match instead of 'should' the=
n
there's no reason we can't do that. Another option is to just have a
numbered sequence, e.g. fan-01, temperature-01, etc.

> > +          apple,fan-minimum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The minimum speed the current fan can run at
>
> This is not the speed, but the identifier key to retrieve the min speed,
> right? That's not clear. It's a bit odd that everything is a key id, but
> one property has that in the name and the others don't. I don't have any
> better suggestion though...

Would it make sense to append '-key' to all of the optional fan properties
to make this clearer?

> > +          apple,fan-maximum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The maximum speed the current fan can run at
> > +          apple,fan-target:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint for setting desired fan sp=
eed
> > +          apple,fan-mode:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint to enable/disable manual f=
an
> > +              control
> > +          label:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description: Human-readable name for the sensor
>
> Surely more than apple,key-id is required? How would it be useful with
> only that? You can know how many fans you have, but have no info or
> control over them?

The key specified in apple,key-id is the fan's current speed, which is the
only key strictly required to enumerate the presence of a fan in the system=
.
All of the other keys are optional information that are only really useful
when implementing manual fan control, which is itself optional as the platf=
orm
really expects the SMC firmware to have control over fan speeds at all time=
s.

> Rob

Regards,

James

