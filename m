Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9563C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKN9f9mba5XMlPWTAXN8CweS/tPQvXMpBOs+FJWbbU8=; b=bbROTIvXVL6J/Suvx7J5JnmAVX
	70HwCR2II2QHpDz2IS6MwKygvx7n6/ZHpP3VGAq8qDpWNY7VCALx9JZfMcA3aUMfyJJBvRLbeAsoQ
	nlHuEcZkLjmLI6Ne/BKtyo/iv7uaFOrT+9G2J+jbmdilRdT2GSoc7Cb79vlF/ti704Ia+IoY6xBjc
	xOyMol9JZOj5FNqBqfxrkBH6a2IHKiSx2C5f5uDYSOg3TaaH/QBCw6oDTCODyErY54yWyMU7yMRqH
	ugEUvSZSGKumCKW26lPLAA6MIS22dX1LCHl2/226+s/SzaZpdUVAhDUKn0eT08bylDA9RFwtCIkD7
	XQgH8Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumGs-000000028ZL-19nR;
	Fri, 14 Aug 2026 07:24:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumGr-000000028Z8-1rKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:24:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36FA043F68
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFD61F0155C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692245;
	bh=BKN9f9mba5XMlPWTAXN8CweS/tPQvXMpBOs+FJWbbU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iEKqK7FXDAkSNHtkYLTRt3Y4M/r5fWbebShTWtHq/CtTIKjZgSsJlURV1lQXBsUMS
	 8HAaBv/qmXqU3qI0Wonv25AVNbnZAsqq3msF1/iXCkw8IKEX0sAOHmEyYgh/JUwAKl
	 S1TL61mljZPaBTtO8QbEpjyz9OlYukat2h+lQMB55Ol90JBDkiA7qvbcW8BtyC5Lg+
	 jEgOpgobtR9EwZtP+MJwLs5r8RSd8JPuZRnpcp4wgqWo3VSYH9ZSxlc6QudcCS5tUb
	 ImAo7qG5qhuMkHHevXOr9raKXy4jOYioQiqSTYvHBtGwSfdo81v86jJ8DXevjtrAiB
	 bf7wuJB5xncOQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so895065e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:24:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXQLP/s8gLV6PlpRsuzZn2V1PLEh5f7JtRzTMRNz5OPxy9qWV9c52PeUWvDOF2NHIjw7Q6mxe7qETvOjH0a3YW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3MW26XMdOzVa2aPF8RrfF6JIYTh+8jdbEmwBIDWA7CM2zr+TN
	I1dJz+310ulkHsyh9sMx/dd475uB2+9SyCrA+KNNgkoBv7t13L0gZOqwG/6gOy+gFjFGd/kWNZg
	kTKj8dvfAqXCmYjCAPX0ERy1WMqIjR8Q=
X-Received: by 2002:a05:6512:b93:b0:5b2:d7f2:90af with SMTP id
 2adb3069b0e04-5b4591417a0mr459623e87.37.1786692243871; Fri, 14 Aug 2026
 00:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-1-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-1-6bf32d45ad0b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:23:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkf=Ko-S-iPOt7toDRBb0HAEiAZMKXOTkD2sBdt31JWbA@mail.gmail.com>
X-Gm-Features: AcwNN1WiSU-hYtd-LW1Xs-Nm42vxr7uIUwiaDPkA7srTL7iPWg9d8CwHinkdzg4
Message-ID: <CAD++jLkf=Ko-S-iPOt7toDRBb0HAEiAZMKXOTkD2sBdt31JWbA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
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
	linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, Aug 11, 2026 at 9:37=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The core types of the M4 SoC no longer carry individual codenames.
> Apple's device trees re-use the 'everest' and 'sawtooth' codenames from
> the M3 generation for all later cores.
>
> Instead, we use a combination of the SoC's codename ('Donan') and the
> type of core ('e' and 'p' for the efficiency and performance cores
> respectively) as compatible for these cores.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

