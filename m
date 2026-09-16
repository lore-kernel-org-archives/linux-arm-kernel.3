Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBBC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlDHHiMVqeXgdpn1Zj7e0N2hLgqwzeWFJxceKYb+YHU=; b=q0zB7hM7oBVVsm+5zQ/TwXq9je
	q0hQqXmST/+XsjVbG6dWvDfRZ84a392WMwrG1w5jqMrSF4PEORvIqHWwAabLVLEzegoywOnvT+RHi
	r6mDetLM81cdBw7MRouqRnT05y/BW5lSHLqpFHqhjfnJj4qzR00L9JSk7RN7xaln+BqKLox1/bcCC
	OK/zA/yyci9CJuFi8H5s64kFYrEoENwsgYPkh0MiPcTE8jZiNeTnA37XONTVQuq9fUeVT5tK9ili/
	7dADXSH8BEttQkAcZigl1nlyJY3waiAm82k4zJeJxkI77BA03CpP8qhb4Nat3g2GZfaECalMZi8JN
	c+3OM+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6srQ-00000009nKL-1Lvd;
	Wed, 16 Sep 2026 16:51:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6srO-00000009nK8-2ZxB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:51:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 128266022C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5151F0089B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577509;
	bh=jlDHHiMVqeXgdpn1Zj7e0N2hLgqwzeWFJxceKYb+YHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JcbHzxFvgLrpPJkR5R3XBY3y2SfCcwhDFnSiLhJ1B+/JTtnxdxndb4zLLznpRuxMr
	 zDUB6DlQP+4KRhUFQ8qZIwmbtMSg4Sa213btbd920xJW3yvf/Rn4Qzedge0V2JpjlX
	 DSseYM02zkMboFVManwZ9pkz7gBcwpL3z/fAJjcC2l/MJBjBv12ZukFan7Y5adtLR5
	 PKISREbVUR980BR6UCPR2TSmSQ7nhb1eCTbfCo2hB8HPqtX95CCZxk0cjc1OeNxXHC
	 wHby+UM/xrpkpvxH7mvJSJwmMZRLimAjK/eOXdvW4CtjMIwx6V8jFLqWrsv0qByTdb
	 TzMjmwn1jm1BA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso1242447e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 09:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLTAo0etJnOqSXcpyFAPsQ3D0zWz5RS/PxMC6yF5IqA85RG+pmZrrGLQM4h2EXxsQNeMlBT6ziumGbkcBtVSGg@lists.infradead.org
X-Gm-Message-State: AFuF++ljKd3L2Hp6sYI1hbfh91ZyM9L+y+VO9IseDUZTOrfVfRsSnQGl
	ruNJtd6cphelwYJIh9QRxlh+L3rhaWFPIv+XLlaSQKSAldc72KSJDx2RaKy6qopXnUyya6OZ91n
	GcOG+6bc4Z/Ke0mQe62WFFmZFzf3vutY=
X-Received: by 2002:a05:6512:3d10:b0:5b6:17b6:2224 with SMTP id
 2adb3069b0e04-5b8b665478emr1974764e87.23.1789577508492; Wed, 16 Sep 2026
 09:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-13-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-13-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:51:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLm253spmn1Tq2Jekiw2Q9xD_HDQ+AFRgWovLyE=veAfhA@mail.gmail.com>
X-Gm-Features: AcwNN1Xrn_ibUNrql-q0n8N3iTosx-ZSLrxjHuJr9HzfGfgIlGS2dfpxQ3q588w
Message-ID: <CAD++jLm253spmn1Tq2Jekiw2Q9xD_HDQ+AFRgWovLyE=veAfhA@mail.gmail.com>
Subject: Re: [PATCH 12/14] mfd: remove unused mcp-sa11x0/ucb1x00 driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
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

On Wed, Sep 9, 2026 at 3:24=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The sa1100 platform has been removed, so these drivers are no longer
> used anywhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

