Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FC4EE644A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV16ip+6JwuZnL/TM8VaCJh+nZpSyXHTVW++zK0HfUU=; b=zEpN4nTuckjlGuV99eIOOxe1lJ
	hdwY2a1RkoIhscMFM9xgXn/sIiUG5xo/3syoUMV+NJbEU7S9UHQeuxEvjMCqLLrCzuEhmaPHKLUJ4
	M5f+q5RMJ6G5f2gatWj3fkJRF8LjkIS88IP6cquE8JurIf8NYw9KvWFjkV6hmvPDNiMBrL4wvQdqk
	I1MEa2lnk6SKEGyLlMetEZ2HSWhe6oOH7XdjhrLXcOCQSE3cvL2JEz50gSlQX3EEicBoCm2OoDJGM
	bi1NHth60Eendk78a+JLxCq2E7OMuGAxOh75xxrICagBATTZNEeWPZ8D1Tp/PMjbL/3GgEiAlRgsp
	cv61it8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb465-00000006Mzu-03wH;
	Wed, 31 Dec 2025 21:51:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb463-00000006Mzm-13W5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 441C260017
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF51C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217866;
	bh=1dgOiCMHW+Z7a4Iq31trxTmP5l0kzHmrGC9ib/clXB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sUhkrStJSwjGZ2XRy9OJb6HUvUKwET0l9AiU6cNZosCauIHjFKzQ1b7TOKHLwxRdc
	 b5nPDpnnlCBqd2zATN+TSwKN09UnT06oJMorI7qRZ7tPu617nyFv3V/JLc41jgAqRO
	 XU6yU5g2bc8G5DLtO5Ozd0fkI+hOKqEXLWbIojJAu9ZZq+xWNlLQtzqq3P3Qsr3p0t
	 gYJsWSrl/Xsmn9vIJo+Et94QdgZtWVQIlhq/FSVhksJkp97iiSl60ZHTNxClwhfB4M
	 GKWL2T1hvzLJoPdTS5xcn/Tl7IuVvFRWwIxokPYKkN8VdOAA4Gf3DDXugPLUC0V6Df
	 uho202+Fyh+LA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fd0cd23faso78868327b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 13:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTs5ZoXjwFBiyTMaB6ydRVe8fepOGXCSijE1TROXRyZMPWt0ouzv3fS2RWOOTl3W59/ZadVIwm25JW3O91/vUW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv7Y/p3dmf7OQyNTePirCWUAk9QFqICuD8v3k3U+hzN6PBfyth
	Fz5yaXwPSjOdCpl896E7e2K1qj2ev4Ln5bxnDpBNeK5aJKHFqvW5jiMppBFBh7ZyqcrgLqXyL0Z
	YExtWawpNYHR57wpGPJ6WIyAKCkip+pE=
X-Google-Smtp-Source: AGHT+IH29S99+HYf8SuC4lZx27OfrHABr4tetzXdccaN2xUVWn/wgVS/NlKdgLQVr0jKfoYAGzsi8EIIhZ5XvfkifzI=
X-Received: by 2002:a05:690e:1486:b0:63e:b41:cebc with SMTP id
 956f58d0204a3-6466a8395admr30714655d50.17.1767217865999; Wed, 31 Dec 2025
 13:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com> <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
In-Reply-To: <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:50:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmKL4afaOn_eka6v=j_Wu0orZMb-2NbPZgP4SM2q4V7qw@mail.gmail.com>
X-Gm-Features: AQt7F2pjZLgNxaiWJYqspkMb-XGMxgFbeL4lckn8FGNkckGZmMd1GQVA1LvpjDo
Message-ID: <CAD++jLmKL4afaOn_eka6v=j_Wu0orZMb-2NbPZgP4SM2q4V7qw@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

On Fri, Dec 12, 2025 at 9:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 12/12/2025 08:41, Thomas Perrot (Schneider Electric) wrote:
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    watchdog {
> > +      compatible =3D "aaeon,srg-imx8pl-wdt";
>
> No, that was discussed many times on the mailing list already. Fold the
> child into the parent. Your driver model really do not matter for DT.

True. For an example in Linux check how I spawn a watchdog
platform device from a timer node in:
drivers/clocksource/timer-ixp4xx.c

It's just one node in the device tree, in Linux it is in two different
subsystems but we just deal with that in code.

Yours,
Linus Walleij

