Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B787D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Se9iykGyBG/chmZUoFvEpKM3NIz9y6V7vYmAmFmIKg=; b=VMofLXJeKXrUQYVVzjtH5gglLk
	wHcGpEsNT2V2HwVCniE2JsghJVgVezEWVCYwTzlpyi6m3nAlQcPQsKyDjzPLNVHpgh0fVmjeVpGea
	Q2SwOoxhii2XLul0W/G/26uBMn2hje55qJ53oMyOBKRBmOPDJXME74mF9NSgmm4q41WRfpUYkgLay
	F95RoxX6NBhzWQs5C0tzLleZ8EHNEQDeo+R39JwWShdIUILX7M3GxPsrcNLlGtLZwwSLuBj71Zexl
	sUZ8nm56PMreXfU5HClZgEVINbVSN0XTmoCDamGGXWpcTPkQrmVsl/ZwTw/lhxL8uocItap6ZTBvR
	4DK0Bjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Y8O-0000000CVdu-2xoK;
	Mon, 28 Oct 2024 22:22:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Y4X-0000000CV4l-05wC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:18:50 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb561f273eso43233891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730153927; x=1730758727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Se9iykGyBG/chmZUoFvEpKM3NIz9y6V7vYmAmFmIKg=;
        b=ajibVyUPps6MY0YvfcQnFA5H9arGGwCGMLcHCqsIXGJqYwLhoSba43uqSKtI2KZrRC
         5juk1JMxmUHgTLu/Qw0Lr9w/PpZdz/InC5fOObcgNtWKMD+rc0AVzIRcEnHKyY/HBRGm
         MEIYMx8kT25FYBpKgbTSQhwJ5CK0sQRTZzvdNb4S9uC9Up84zEsWTBegsk48KIoSiqqv
         K7MqAFy/zRklZT7KbXv6F94WZVI4BR2SeoqeZKZtPZ2TYJXCbOG13ajBJfr2oTYBeZHH
         fY3XixTV+N1/mN0HsjG35k9ABLV6C3K1Z0GuoCqo5ffZOJ8dWTq8tVABZBhJPWPWoPwA
         Px7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153927; x=1730758727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Se9iykGyBG/chmZUoFvEpKM3NIz9y6V7vYmAmFmIKg=;
        b=sEk9NV2yaw5UDNXtVNHxN5VJXKqY7LXmgaLc2M/kAe/6C56+4u4LMv56rKPSGKDgxA
         ritDJwFvQAjR1Qr8JAjIDWwaBH9luyqAYjXZz12JsonO0LvH7/pJFHO6dLhHxJgQABMH
         ClH+lw5Ivo8Fr7Aoogru8twMiOpHxB+BYQ0XsYEmZGgEx9eQ9lHmT/yFDaw/Zb8CScpC
         Edo2vvRFc6wiV1FKtjNSOKvhxi5r0ShjHUi2Gl255ImwPf5G3yoYyFqHr3uUwASD6/vk
         mvgux40UJO0R1CKqqhU05sCRgl8RzB3O8axIw+R7G9jBKi1TkLesSGok0xur1O2WMLCd
         0bsw==
X-Forwarded-Encrypted: i=1; AJvYcCWjkavaW0N45sna7wM7T/cm5HK+FhTQyBGl4OyMk9IqFweVYV4IxYcKZXly/emnRh/gufuddfhMXCd6bfqlfZWE@lists.infradead.org
X-Gm-Message-State: AOJu0YyteFRZiN1Y2DLjBmnOF38SSgJW1QH/1cE/JB1ifJ6RUH/B/xen
	CX+VnC5Qsy2KeK3Zafivgcrry6ilBwSA0YlwhbeYKWzy18QF1f/V9W6WEFYUxLWLKr0FY1Ef8yi
	QOJ/XFUevp2XsSGSeREmwyKkUp7NqPJ/Y7TNudA==
X-Google-Smtp-Source: AGHT+IHaahqy5DPShaY8Y+oAdhFIt+zH9Ye+ooBv20FjvxHxSAXvsJDg8v4Gn3ijuKz+t3/EBWpVyq1RsiK+6mnMrto=
X-Received: by 2002:a2e:be9f:0:b0:2fb:5bb8:7c00 with SMTP id
 38308e7fff4ca-2fcbdf5f01emr41441461fa.2.1730153927011; Mon, 28 Oct 2024
 15:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730123575.git.andrea.porta@suse.com> <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
In-Reply-To: <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:18:36 +0100
Message-ID: <CACRpkdajY9efD_DMwoE0wpKDVf=+kcWzYQXOQMHC+pQS-ntsvA@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_151849_151170_48DC9E85 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, Oct 28, 2024 at 3:07=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> +config PINCTRL_RP1
> +       bool "Pinctrl driver for RP1"
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP

Just a quick thing:

You don't happen to want:
depends on MISC_RP1
default MISC_RP1

So it will always come in tandem with
MISC_RP1?

Yours,
Linus Walleij

