Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A40D44D71
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=; b=FrIFToXm/9YDfDYaS0MgGduuq7
	0HNktha2J2XzjQBgVq0MEvmsUKP9D3GhFcqeN2x2M/3qm16hFVP7YvW+HQqHvWZ5QF6Jv8JeghTpT
	5Mcdije+Q+fA9Jb9fCdwZH69AbZ3UaTszVBahKGyKB5dBU6Ve5cnYqioWzxQfL6x5v3IK6+JFQV8e
	Vtj7S3QI9BesaSkEUkCJ8W86N26jWUh9CVra8pmOOi7UMyEqGuZThq/z2Tfj45Cb+3pwK25GQnljo
	JqEEIOa9bpzI4HBMiwuuFU+xaRE6dKXslJ+7fUFpIICCJaO5V2e9T9ZYtlbFi/tTG7HYRtpUBnzyq
	0jn2Yy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gcU-00000003Wuo-1teN;
	Wed, 06 Nov 2024 14:02:50 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gLo-00000003TKt-18AI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:45:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so71682531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900733; x=1731505533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=XwbLveN0Vrx97pwYOwNKDv/VdAAqqsAnK3vFVU3tt3KVyjH1Xf5LJ0WRuqH4z0okv9
         Yf174qeee2SFZIy0lQ33qG/4dHgQJdFXKIe/MmqVfzVK8irtutGkmB8At5CN3znpSD4c
         7dnvdEch/pnRBfepKkJZ3zZR1y8S7Av84c75V/k4/4Wbvg2EZUHsqrK8eUSND+0Lu5GC
         q2Lx7p5UzLmNHLZO+3T1PD3KeR65jPP3a2/aZ0tFiD9j+OgCHEG+HEBGig9zx5BUEPdd
         vsrdHzO+ZpBX/HXaLRIhWj31kgMQlyxSbN2Mt/yt2iTJuo6oc+BNJnBLcDrcousLhvVU
         Om9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900733; x=1731505533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=EhNI2bkH1NAqYhmyZm7oPbcWvrGMbcLmV0ONEZ8cZluY9Gq28q9MnWD5VBJ4kGQegW
         QgvG8pgwk/16zhd4o6rgNeoA2YAUFEY+SG8upq/aCtVRVEubqf4/rp3caqi3M15+Ll1I
         NNRr76zMBuEFMbgv3xWDPq5rZznXKBGdled+092WcADY6dNH6Jaw5Elf0MNPmt4wLYcr
         yYjXMk0nUUnYgz0TpQJjYP7kXU5d+XCQdWA2j+whfVQ2MrewxxxT3PskcZgFxGd6t/1P
         g/qlCqsUkCV9HmZhGVrEENI5Ci3tCjjF5VLD/X4Gk8VcY8xiul02RkyTJI2TG9qe8RqR
         lZpg==
X-Forwarded-Encrypted: i=1; AJvYcCWaX4aYtYEitvW1Sv7NvdxFsbG+ZxozTpVrx9LVWH+OR1M7VDoBk4LRXHa7rlUrZkjrg5sXf4KucCCIJy1A4ZOU@lists.infradead.org
X-Gm-Message-State: AOJu0YwMUq+Mui5J144DK/kYW9BDeoDVpl6Umj5xW2EPVQdb1wgJrkHV
	+ufmza2QtDm8CEWs2QsItkHTuY+GzGMxXz+PxB7oBgHyDVWMyCcoV3udCcXvFsjERlAqDxHSs1C
	CwjrL6JAxVxMvjLWpwlmi9QIg7vi1CpIJskVjgQ==
X-Google-Smtp-Source: AGHT+IHvynIL7AAsGHjP0xg8VCy9NFb8IBkKD896d3DxIuwUkQ972HHVN3qYlfPKYVhD5LyxxH0ykk/nP4raab/ulSQ=
X-Received: by 2002:a05:651c:19ab:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2fedb770dfdmr103418931fa.10.1730900733100; Wed, 06 Nov 2024
 05:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org> <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk> <20241106110046.GR1807686@google.com>
In-Reply-To: <20241106110046.GR1807686@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Nov 2024 14:45:21 +0100
Message-ID: <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054536_334383_9D9954B7 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, Nov 6, 2024 at 12:00=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:
>
> > On Nov 06, Lee Jones wrote:
> > > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > > Add support for Airoha EN7581 GPIO System Controller which provide =
a
> > > > register map for controlling the GPIO, pinctrl and PWM of the SoC v=
ia
> > > > dedicated pinctrl and pwm child nodes.
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Con=
troller
> > >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > >
> >
> > Hi Lee,
> >
> > according to my understanding this patch has been already applied by Li=
nus
> > here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/commit/?h=3Ddevel&id=3D50dedb1eb1e6755ccab55f6140916c2d192be765
>
> An interesting choice.  Linus?

Yes I suggested that I merge patches 1-5 on oct 29 and applied the
day after:
https://lore.kernel.org/linux-gpio/CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=
=3DdZqRiFy12w@mail.gmail.com/

It's because the bindings are dependent on each other, this one patch has:

+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
+    description:
+      Child node definition for EN7581 Pin controller
+
+  pwm:
+    type: object
+    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
+    description:
+      Child node definition for EN7581 PWM controller

Those refs will explode unless the two others are merged at the same
time.

Usually we merge the whole shebang through MFD but this one felt
different because there is no actual MFD driver, just using simple-mfd.

In hindsight I should probs not have been so trigger happy and give
some more time for this to settle... Merge window stress I guess. :/

It's fine to apply textually identical patches to two trees though as
git will sort
that out so technically it's no big deal, you can keep it applied if you
want.

Yours,
Linus Walleij

