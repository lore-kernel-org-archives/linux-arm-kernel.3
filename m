Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70050C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeaaGkfj+CmXQK3D7/sp1H2v+3bv6fIBMs0uAbi+VxE=; b=KQVh/GX5SS6EJ2w3x1THOWA9Hg
	Ere4Dn/VaiHpC7/BF50Jsvbe6jIT0JkHRx5FJPKfx9F9NI83gDZbjorE3hQjuvr2NoY0/TRnFw8e5
	k5SZ0QPHklx35bB/kVaceHtPKV+u5bgTRYuh95mKKgPn2+2jLUXUJb6oUVV6mnLs38SD4hsUjo+WT
	80SyxgdwwYTbUgrzC5dtF80Re85t0TYygfiETV7uTuJWyfBZImvSR5wDpALq+KqhA6eHrsrY4h1Nq
	wT5lMpmMRq5ksevGZ+PANwjwk9Wz4bG9OHc5lJOwdN1Qp+fXi7o+vTYgOLVqQtwwCJSfI4+b+W2ck
	0szM5DFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9va-00000001GYn-1pis;
	Tue, 04 Aug 2026 07:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9vZ-00000001GYh-1mqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD95343D25
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 07:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914A71F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829868;
	bh=UeaaGkfj+CmXQK3D7/sp1H2v+3bv6fIBMs0uAbi+VxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lh//8K/BjNLfqPOULpksK3++stnAXFzDO7EQjE7RTS72eRu03/yiUQxcZSuM+L5np
	 2PKIOyi37oW7GwEbPksUNbxSo142sphFkeF4sJQ1ori5DYjV9Pwmr0baYlAYiSHLPb
	 eh1O0GhAMkgXyM37ZPWKVVmOe1ehK9H9TiSyBO5MntPmbqhkY1/Z58FKTvjoyb1hIQ
	 VJU7ZAnZT3orLOwpdldiLYNuyZximnx/qx/wcY4RCithAZ67jozuXoDr3RiJruvih5
	 39i1vgGKDKngp41aQZBCvccOATqvJWuK5911lTscvbF0OnTEza5c/+F0nqMXTDmJY2
	 61T2CXr6Cke5w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso4870486e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIjn7aDpCGPLqC53Gina9sdIu6SCvM+7BNE9ctIswBDZfiPD6tIO+iAO350cjb1hQSFf4xBJlrlO1Qmi6M1PXy@lists.infradead.org
X-Gm-Message-State: AOJu0YyINvsZH86NemBd3k5crrE3KNKqCcSOTfZhL8SlqPJ0WTypGX1V
	iqO4gyQlouiPCe/bSHm8VlOIG0H5HGA5PtvjW8aM/5dFWLfh69c6bYx5qrmsD/z2IkAAkl5IhhZ
	UxdunKL/wXWa8+sS96iWzX7dhCtY5xAw=
X-Received: by 2002:a05:6512:10d5:b0:5b2:9c9d:6448 with SMTP id
 2adb3069b0e04-5b2e4f11a0fmr2873674e87.12.1785829867354; Tue, 04 Aug 2026
 00:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-5-5cb07cc275da@cyberchaos.dev>
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-5-5cb07cc275da@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 4 Aug 2026 09:50:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLkkvrHR9nqO3gTiyU0s=q2-7mr3FY_07JAG4sFyuCENQA@mail.gmail.com>
X-Gm-Features: AUfX_mxbSJUYZ_-VvnAPg1iAT8y_V2wQkeDasemCN2JDNhyPEfoJfdRT5MtVKyg
Message-ID: <CAD++jLkkvrHR9nqO3gTiyU0s=q2-7mr3FY_07JAG4sFyuCENQA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Hector Martin <marcan@marcan.st>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
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

On Sat, Aug 1, 2026 at 11:41=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple silicon t8132 (M4) SoC is compatible
> with t8103. Add "apple,t8132-pinctrl" as SoC specific compatible under
> "apple,t8103-pinctrl".
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

