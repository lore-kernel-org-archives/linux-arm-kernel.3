Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DE7CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiWo8+aHvG0/CfpdcA+HSuWIG8COLscBNytdiuo+mSs=; b=idCiK/T5EGY/hGAlTs+cMzjHGt
	0n/uxh8MdBoQMuAFY08kwcNx8vmxuvVfqO3rzxkjLs9ZZXj0JbHKjKXAhx82aOE74V6FTfnitx0qp
	v60xbcsDS4B55C5fUiEZmZYn/S4UGaE0gW1qNMvSMz9UgA7MLYrJpki2o9q4q87+YTrIBjIOdn3MH
	Ubw38uf/symgg1tUjQfeONW/UMpDeGnwNLRV1gs32V3Lmg2AkZvX4gVo8n3OQobTa2ayPkm+3J3h7
	RmrSIRqqRFiKZ1dk7zGNL1VnGRBHLw78UpRhpDLqklzR6ztqtWqpIenuzCNQsDZOoL754NtkZcF9e
	MdRK8RtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tkZ-0000000DHRu-34CX;
	Thu, 25 Sep 2025 21:43:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tkX-0000000DHQP-3Ica
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D14F61270
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 21:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D9DC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758836616;
	bh=TJ16OtksRGCK7Zaq7zAHkC37DGIRAMtba+MXYoDW2iA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qj/IjYuXUiGKlzf5TAUDELCQ4fH0sHVxKdTQiF/ytNkHP8ruW9ZdAhJBHU6G5VCfo
	 KCTiXMBDASTfeCWjoxJnJjSzCRnPUGgYhe4HXYwE1uzbi04813xAhHe52jVQD1HcwJ
	 dFJ0sv1X0N2nGmgD53Ap5ubxt0cL5dmwk/tHOimXOmXY9O8VdnOMGaivjbcpIi4bpt
	 MooKv+ed4xAkgTGcH103MFqwOxApGqPAhVzCF8fGSoxnKD1mSZQ6l6S11RV1cY8M1q
	 Y6RaqX1n0bYxlpMZBInsUYufDEJ6GQtDUlIhoAli8BLK1qqItlF1tehKBXSWtEJ0p9
	 lcdSXkoH5gwEQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fc686dc41so1442811a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoc/rqqnlx6IoaeI/jtts6cK4v1Nk0tSxgWGzC2drkD1QLzCD7TI9V7/y3E/4KyO6ZgTTc2FU6fMuYP1wHaFZT@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbREvJ4ZaxyniPEDGPU4peqj60gxr8fR1CEPt6caZKv0V2bIX
	GAHl0bQRE/hmp7nyxyCB9K5YKWO0K9cPm/UE029eild4jYe5fZ0zUoX0MqsfxZqqTUxU9u/SKWG
	384E5QemCkO30aEz7lYmoCUFvDsbEyA==
X-Google-Smtp-Source: AGHT+IFmBy3JjHkNR0N57qjvw9kAWYt/wRLGZueKtaKvROWm4D/h/tqXxOmVgeAkz5iuD6R7VRhJ0fVUkEbgu7H38rw=
X-Received: by 2002:a05:6402:682:b0:62f:5424:7371 with SMTP id
 4fb4d7f45d1cf-6349f9cc038mr3172814a12.8.1758836615417; Thu, 25 Sep 2025
 14:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com> <20250829164057.GA976361-robh@kernel.org>
 <20250925204925.GA637503@robin.jannau.net>
In-Reply-To: <20250925204925.GA637503@robin.jannau.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Sep 2025 16:43:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
X-Gm-Features: AS18NWBo7dNaKxAu5ak_ciYzqjTskfLTXRAexsnPq6bwBMAHQaTN43F9iZdY5xc
Message-ID: <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
To: Janne Grunau <j@jannau.net>
Cc: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 25, 2025 at 3:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
> > On Wed, Aug 27, 2025 at 09:22:36PM +1000, James Calligeros wrote:
> > > Apple Silicon devices integrate a vast array of sensors, monitoring
> > > current, power, temperature, and voltage across almost every part of
> > > the system. The sensors themselves are all connected to the System
> > > Management Controller (SMC). The SMC firmware exposes the data
> > > reported by these sensors via its standard FourCC-based key-value
> > > API. The SMC is also responsible for monitoring and controlling any
> > > fans connected to the system, exposing them in the same way.
> > >
> > > For reasons known only to Apple, each device exposes its sensors with
> > > an almost totally unique set of keys. This is true even for devices
> > > which share an SoC. An M1 Mac mini, for example, will report its core
> > > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > > SMC does not provide a way to enumerate the available keys at runtime=
,
> > > nor do the keys follow any sort of reasonable or consistent naming
> > > rules that could be used to deduce their purpose. We must therefore
> > > know which keys are present on any given device, and which function
> > > they serve, ahead of time.
> > >
> > > Add a schema so that we can describe the available sensors for a give=
n
> > > Apple Silicon device in the Devicetree.
> > >
> > > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > > ---
> > >  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++=
++++
> > >  .../bindings/mfd/apple,smc.yaml          |  36 +++++++
> > >  MAINTAINERS                              |   1 +
> > >  3 files changed, 169 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.=
yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b42=
8088f96240266fa42e8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> > > @@ -0,0 +1,132 @@
> >
> > This should be something like this:
> >
> > "^current-[A-Za-z0-9]{4}$":
> >   $ref: "#/$defs/sensor"
> >   unevaluatedProperties: false
> >
> > With the $defs/sensor being:
> >
> > $defs:
> >   sensor:
> >     type: object
> >
> >     properties:
> >       apple,key-id:
> >         $ref: /schemas/types.yaml#/definitions/string
> >         pattern: "^[A-Za-z0-9]{4}$"
> >         description:
> >           The SMC FourCC key of the desired sensor. Must match the
> >           node's suffix.
> >
> >       label:
> >         description: Human-readable name for the sensor
> >
> >     required:
> >       - apple,key-id
> >       - label
> >
> > Though in general, 'label' should never be required being just for huma=
n
> > convenience.
>
> That does not sound as it would be compatible with skipping nodes in the
> driver if the node misses label. The driver could of course fall back
> to create a hwmon sensors without labels.

The driver absolutely should.

> I looks to me it would be a
> stretch to call the presence of the labels human convenience.

Then it is an abuse of 'label". "label" is supposed to be literally
that. Matching a sticker on a port of a device.

If you need to associate a sensor with some other piece of h/w, then
that should be via a phandle or something.

Rob

