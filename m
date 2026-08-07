Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E86DC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5+6s7cRaD+WPG+s4777S00qOcnE9y5+EtT1GZhZ2W0=; b=OfdjOKadiNwGaQAalVUKKJXHfu
	kJa0Ml22aVfbXaMod/hZ6nNwwN9Y2Wkgn8D1kul40vebo5Ih9At6Ypy6ukB7DUYHJiEWIzZ6+6Hy7
	i8nOQbOfpy8yCTywNZAjHKeCnccqjsXL28i4XH6KA0G4lABLqPWQAZMwR1aHJS4fat8uDyyYkCro9
	QVPL5ZvMFtyaROYJzlb4bHKHxXU1O8p4rSyzLkdhhlaHkSxYfJl5eKHga2vxJeXdXp7ZlfMiRzHP+
	lornbco0/ESWMy4ioSkrOZqRCnXgo5uFpR6bSG/a3BzGYhyu0imZrQpawB1RLzdTL/+J2C06JPwqb
	Zm1z05wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOIT-00000008W82-3j9i;
	Fri, 07 Aug 2026 17:23:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsOIO-00000008W7A-3K2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:23:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DF89434AB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 17:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629591F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123428;
	bh=b5+6s7cRaD+WPG+s4777S00qOcnE9y5+EtT1GZhZ2W0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fWo8BwuNcmOGAUWFQLkWMWs5FyFp/Bw7kBHQPomavEjqezdgKmwOzWu+ZfGhVbLEh
	 GqbJmxzMzrdfDLA6EmLFaiICOTVZ9DQnkwzZILiAO6yZTLqF71dwiPmCjlnATbnyfT
	 tyZc5WxF3GnhG661H9bBufjr9/+N539IQsP5RjCEexLH1pEUy0Mgf3MRLJk4bsdv/p
	 1fblhJV07mhSrLh0zQfuLou/F8Gs+JlQ8Rls8fxhoGlwu8OctUVaRV/3L0drArtkz+
	 4rTJdZJVGyuzUnGOEfuHfIrc9p43UYxa2NBNzSBYFMWbYWoFIwjzGa+RO+WVJxtxZf
	 W7YqGcistO2bw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so29020241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 10:23:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7f+D9HV0a6dutW3KIRPnrquYKip1aBMY5AHnjiiu7IcK7Q6Dt7jJN0mUXNsBxYifviO3Ur5sjGysmNPQE0VS6@lists.infradead.org
X-Gm-Message-State: AOJu0YyOm5hXSI5Yn/q+aHoEGXCKi02jm9x1gRg0i0uOGUUPZTIDfCdM
	cKI5n5yA2b4e5ILwQ4r0neXEx6voBh9unWS0TJul+UK16sfyRh6xZlEg6sGJfPDb9gDjM++YPnc
	LSrAwbhGQknVEwx9UFe1MKQzvJ5LzcGs=
X-Received: by 2002:a05:651c:2122:b0:39b:119d:aa02 with SMTP id
 38308e7fff4ca-39fbae0b8f8mr29204031fa.5.1786123427162; Fri, 07 Aug 2026
 10:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260805-rtc_s35390a_int1-v3-0-e836faba3e25@posteo.de> <20260805-rtc_s35390a_int1-v3-1-e836faba3e25@posteo.de>
In-Reply-To: <20260805-rtc_s35390a_int1-v3-1-e836faba3e25@posteo.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 19:23:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbp5v5oy9oas3q=nDEvdvmPZpX71eHwEUgSKkn4bfCkQ@mail.gmail.com>
X-Gm-Features: AUfX_mwxc-wD_DVhl85t0-cdNZC5rlPz-YW3X4nrBUoCVUhyUW7RnE0ImXvu-o0
Message-ID: <CAD++jLmbp5v5oy9oas3q=nDEvdvmPZpX71eHwEUgSKkn4bfCkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: rtc: Add pinctrl for S35390A
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Aug 5, 2026 at 9:32=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:

> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
>
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

This is a bit unexpected but I really like how this looks
and how it is using pin control!

Yours,
Linus Walleij

