Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15003CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQDqTDRzNTPwZsPjGf6RDDjOef9CQeyvOpIJfJ3OCq0=; b=JEkzAGU98YZVeyZsgGpHySofob
	bvhP0RZpl1y40hyWVE2wkwtgl+h3qs9vxbFMR4JIVoIH+bc4rSYX59yqiZxwD6YO90CuV6lcmgQsd
	Q/9043v57wb0wNcjbG5+5xHVT0z9fiYNq/tx5JokOGziBjc9G0eeORptfWoHeshjYGMM5IH2uDfnm
	KIU0B/1lNuIY8UTvk3aqCo/Sc0ginvE9kI8bUYoz+l9JI9MkrC3/AtidoPJ267cPMb8pH5rh+1mtL
	ZhoxLiD6gWTUQBwJj+Fx2HJMnU9QbyI22BTJAy2DFTyYmWTFZTk03B3565NC73dvMbmhVtToSB/Y2
	micvr9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3XM-00000008Czb-2RM7;
	Fri, 29 May 2026 20:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3XK-00000008CzV-40dH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 20:10:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 190BC605E3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F6C1F0089F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780085429;
	bh=oQDqTDRzNTPwZsPjGf6RDDjOef9CQeyvOpIJfJ3OCq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hr0FdYjpscSqOgX6XAS7vi179k5c+4IiLv3XINZ5NYNN/JqEKjhv2gt4CMAt0IP8Q
	 1X/TM5PJg1e4ZlShrD6O/HNgq8RKlNw3hIzreEPnWWMwyMh68ZyyB/5kmoaWrmhgtc
	 yV/JISHYI4ywXs67aBR/X40iPXIoyp3nMJl/EkUleFdZ5b4KR79Eht1vk7R2ZZvetH
	 zUodYB54OTRDYsPIuMQA/Bkq1/tWkH/X5ozy/+6EBkvt8RPGNKIP+mWQ2Z4Q+1kfFg
	 8i4rV9h4ezta4qtUiDt/8t5CZABtjhOCs3y71fFeHjpgNVCdrvugNroW64BRNhU31f
	 X4mSFsNnslgKA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so13272443e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+r1sVNtM3UkgLUMXUW5dwV8iYtwEGtW7m/tRHe+MlYrsyU8vzYQ2k3rITUtXHz1hSDDLkoXB9svmfba3imKiWC@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/olX20jG5o7vsq7YBDmBMZG6po23EVggi9UlnC8XtuoIM9Sr
	68jv0nO4nDLxEmPz3yKaCh1NbEzX8F+gTGEU/3r4BjHYN88IQ1OC/Z8CmiWjVesjeZ65wFXfYPW
	k348bvy5WsavDms5t22jajQcC3ziDnvY=
X-Received: by 2002:a05:6512:3d8f:b0:5a3:e7df:2396 with SMTP id
 2adb3069b0e04-5aa607bc2admr441921e87.13.1780085428571; Fri, 29 May 2026
 13:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-4-jerrysteve1101@gmail.com>
In-Reply-To: <20260525144629.498630-4-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:10:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v0fPeOmyN=rW8dqNiExogf2V4GN5jjJFJuMxA=i1rPA@mail.gmail.com>
X-Gm-Features: AVHnY4KYuAdI5WTslUv2iX3q4rH-Di7FQSijsq0vHVgdtoE9bbcWaq0tBRNjUrc
Message-ID: <CAD++jL=v0fPeOmyN=rW8dqNiExogf2V4GN5jjJFJuMxA=i1rPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Tony Lindgren <tony@atomide.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Robert Marko <robert.marko@sartura.hr>, 
	Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
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

On Mon, May 25, 2026 at 4:47=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:

> According to the IS31FL319x datasheet[1], the SDB pin is active=E2=80=91l=
ow.
> However, existing device tree incorrectly configure it as active=E2=80=91=
high.
>
> Add a fixup to force the consumer active low for legacy device trees.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

