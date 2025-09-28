Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF78CAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 00:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0SQxdo3RLHRiJ7AnzgCm7ZcELugvg2FhH462RqaNN4=; b=lh0wAgaTB3AlMRqGE7dMD1wkFd
	mueFlhy67Sh8O2e7N3nWDr2D3jd5knA/sAws7UY719gE9F+oDnZPqBaCWts70lKS1zIOfvKGV1evY
	3enmKpWxcm+aa4i1oaldeY7U5JjgQH+3x31CJhkUvhxaqyK9BAjUAP+fFQEmW83kNb4ajufn+t2Ir
	Dsc5RDv8Ek2e5Y+C0YXlzD7HXVpwZvtecC9A5H2AqCZPiP8mXqeWC394eXlIXLVToyqrdrE/84kU3
	UTLJvBTXnRFLBKZDFgv5QAzGIWbyqss7ORgXsbvXHDzi3az0xE9VIYgqY1lY3DgymVlxinuw0Oz9G
	AVE4tmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2fYe-0000000DDCU-0pSy;
	Sun, 28 Sep 2025 00:46:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2fYb-0000000DDC5-0nCP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 00:46:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27ee41e0798so37959765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 17:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759020388; x=1759625188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0SQxdo3RLHRiJ7AnzgCm7ZcELugvg2FhH462RqaNN4=;
        b=AqmGSJ5iTXkCRqe0dCHJsHipVOX7f3dU84IzCCRV/3g6eN/OpeYxTNn9PK53Y/bF5l
         6IWF6CJy3khAiTH2z5cUTctu/PYM6ijRO8ca4ame4WKO5Ru2Kwk7nYTrC/M0diQpD9IF
         PZaoNAu8COyPbmnb3iOfOcdH0ViCM5BQtuzKQcmca2AebMs0QS2EpEIelKI4Z4f2O0hi
         U4dUjcrCfEaG1d0OB9uwKemj0/EcydnyuQ6Z9/yY8XAzFwcTzdeeyE9ROXpsP0ZYAy6a
         0jj3k4rqO9WUo3Mbdslf1lmRivp8JVzXIS8E0Qq3GBP1J1wh5D9+QEDelvSsqjr1WhqB
         6HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759020388; x=1759625188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0SQxdo3RLHRiJ7AnzgCm7ZcELugvg2FhH462RqaNN4=;
        b=uYuIX2asYFkcYnKAk8rMZpXqSgYuRy/P2y9DMfsyjm18Qau/FpkRUihkrjdl046XLn
         45jsL+btRbrajTRHkHgKax8EpJHQYZWwkkia+S5jjeRpNe1lq6youJzPaAjIKe0Q/TCi
         B9Oy3nkPV6NgllyaRwKYJJTbA8hyN7L30Wxkmt3hNkkue1QbPVhy0TVzqELMva1XlDQR
         L9DzHanIvsvQVI1Yne9BbyJcP7aMqzBrSsj0za04gIeSdiTe1B+RhF87lg+/e/9F7ahW
         JxYBo0xMERunlgjl69Vr1z7PPZoVcmYnb4vEVPT0AAzojnamWi0fdsuAKv0SB/KU3Svf
         MNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU26xWmulAv1z328iFP5DsPqjdx3bkZLTcQUHxe0As36T1dFxg6MKYrt4xYTSnh/jUcCBjcpBay7CddDvRNP/N1@lists.infradead.org
X-Gm-Message-State: AOJu0YwsxqbKi4WlNbR6O/BOnHx2AT0mZkkujF1+R/xm1EJCTbDXe35D
	7WJYunUrnUSOpZ+jCN4Eg09guWAUpvuEQbc4cxPuely3b/229/upW9bK
X-Gm-Gg: ASbGncua2reZfwmKRb5P+y2impqcdewuppJUE07At5NKrn10DgoPr+NzuJ/6+Z7FrDW
	Fua28IFdnyVYQfO9g38CaivFQWn/VQ3mrwbFj+EluysllYb68wCxS1dxNZjy6WjT9urkGzyC485
	a6xklSKrVsle/db5/Aq1jdR7G/U0yRPJUbJIUOBCwOw3eBCvvZ1VdkGUS1CvObCGnyPY9sdnlvc
	v+OiqPFz8+osueBaO+Lz/nAxyy2STNuGvFQpzzolgAUaIXXylCK0TcEFDXGp1DKAXybH3r9f08G
	osrMz4nJGwf3uqtmSTZqM5PQT/7xayV88wwcckr8PLODMez3HMr50TuDzj0Pf46WGm3pSONuWa3
	fpNRPjt+FBp9XVbMegRHnhCf3mrlxBsO3lZsGpL6qCrm1L7P/Mfl0iiq0BNaHbnPEVInXHTwz7V
	SE3aB0AdkkqoP5rrauuoQdpn1cWpSlnOs3
X-Google-Smtp-Source: AGHT+IHh6vp11a5YTPpS7Cpx/YPQS6tq6OUbtGBtN9cobxgvPjCMMdsgzvmVq+T4sqfObnWyrmGxdQ==
X-Received: by 2002:a17:902:ef03:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-27eef126f60mr78326435ad.55.1759020388025;
        Sat, 27 Sep 2025 17:46:28 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm88980475ad.135.2025.09.27.17.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:46:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Date: Sun, 28 Sep 2025 10:36:03 +1000
Message-ID: <2537878.PYKUYFuaPT@setsuna>
In-Reply-To: <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250925204925.GA637503@robin.jannau.net>
 <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_174629_233543_19B6625E 
X-CRM114-Status: GOOD (  26.77  )
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

On Friday, 26 September 2025 7:43:23=E2=80=AFam Australian Eastern Standard=
 Time Rob=20
Herring wrote:
> On Thu, Sep 25, 2025 at 3:49=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
> > On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
> > >=20
> > > This should be something like this:
> > >=20
> > > "^current-[A-Za-z0-9]{4}$":
> > >   $ref: "#/$defs/sensor"
> > >   unevaluatedProperties: false
> > >=20
> > > With the $defs/sensor being:
> > >=20
> > > $defs:
> > >   sensor:
> > >     type: object
> > >    =20
> > >     properties:
> > >       apple,key-id:
> > >         $ref: /schemas/types.yaml#/definitions/string
> > >         pattern: "^[A-Za-z0-9]{4}$"
> > >        =20
> > >         description:
> > >           The SMC FourCC key of the desired sensor. Must match the
> > >           node's suffix.
> > >      =20
> > >       label:
> > >         description: Human-readable name for the sensor
> > >    =20
> > >     required:
> > >       - apple,key-id
> > >       - label
> > >=20
> > > Though in general, 'label' should never be required being just for hu=
man
> > > convenience.
> >=20
> > That does not sound as it would be compatible with skipping nodes in the
> > driver if the node misses label. The driver could of course fall back
> > to create a hwmon sensors without labels.
>=20
> The driver absolutely should.

The original submission (and our downstream version) do this, but I changed
it for v2 per Sven's feedback [1]. Outside of development/experimentation,
we will (should) never have a sensor in the Devicetree of uknown utility.
If we know what a sensor is for, then we should have a label for it.

> > I looks to me it would be a
> > stretch to call the presence of the labels human convenience.
>=20
> Then it is an abuse of 'label". "label" is supposed to be literally
> that. Matching a sticker on a port of a device.
>=20
> If you need to associate a sensor with some other piece of h/w, then
> that should be via a phandle or something.

I don't think doing so is particularly useful for this platform. Few of
the sensors that we know about are directly related to any one piece of=20
hardware.
It's pretty much just the CPU cores and Broadcom module. The rest are things
like fans, palm rest area temperature sensors, ammeters and voltmeters for=
=20
entire
rails, etc.

Even where we can reliably associate a sensor to a piece of hardware,
(e.g. the WiFi/BT board), doing so does not by itself do anything useful. We
still need to write a human-readable label for the sensor.

I was trying to avoid yet another vendor property, but would something like
'apple,sensor-label' work here?

> Rob

James

[1]: https://lore.kernel.org/asahi/4a95cbf3-b3ae-4b26-8db2-dd5cf14a4c0c@ker=
nel.org/



