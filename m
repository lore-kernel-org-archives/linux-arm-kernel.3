Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6101FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=; b=jTTvT1j0iNkDR9i7EzZPY/GFPb
	mZvyYlmd1aSTTFUUYtxpur2nEvtRWLhmJkNNvcGlUBXSR43vNR9Z8v2QlU49PV4eNeZk9An6D4UtD
	xX5wUa/BDNxEXfFkI8D0PyIHjENNcwEy5fuv6L5CAFxHVQFdxBvBN9rCMJULZCBmCYZjUhu0+vVdS
	uG+mZQDdSqOUz7YXRVSE8inoMucXFJWfZgmewuBlAGxHYQLaNXwiRgvLpmeoEhTPySgQDZxYhfVFE
	3V7iT5InW30U8Cr9PkxGGTootKqOEad2mExMKCZCk4ODEXka6LWzKIFRm2ko89NUKlQsrovj+g064
	g7ooTyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXn-0000000Cqjc-0T45;
	Thu, 03 Jul 2025 23:40:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRtz-0000000CfFF-2laJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:55:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-555163cd09aso332046e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579729; x=1752184529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=y8m6T/2YKZKxNHk1s6DuoEAGP4lXZkIu0nbwfjvDNGCmWI6rl0ru0W0NDzn+ZUqHMv
         +a12gB8EGQzVHC6Lkr4HZXPOQ4P1GkbWAWDy5UyOYguhjgJkd9U4yOu5XDzDIsozvVO3
         b4iYKU1iMS7JIgyGB+3uFyISqvy6qLo0sG8hSqRSbFR4kshhS/YpMv8IBnWFUZIwXZ7w
         9ZJhhP/v++BgethKa1xRHMGd2OoPH8c108GYJvQplegYCG2Q8Pjkmf0b4op/Nh6A2wGU
         THU2enFmmygiCUgl3vYqfLWfDPQxFqftoRYEDqcxQfIt8pSszNRHNfxZT1owW7icx+hm
         ctSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579729; x=1752184529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=kOVTNNXFGwlzwL3FLUUUthvaNakEzzq8jDzFvcs0ynFCOOSyRwTCesRN6qMePUtb+J
         xw4WOwibXUO5QcB8095o5gH+sfzhVoNYFQEtMYB4wyvk4lJ/eP8XIH8n/XcJkwQ8i0WJ
         hF3s8erg8kRJgS7lLTdCBkHMS/XvavgYfLRmFE7Oe2jx2NAXYtGr8p6+oiRiay75/TPT
         lXCZ1A/RBC3HWtilthGnCnXKiH3ussFz9L94LCMrHdclSd7DZ53JxKHZxt/k2jwba2tr
         EY1lXtq6Pta8kVJt7trJe73p6wSXYDJZp2MkKe97OMOwmFdeaIJx3aRugS1ivljJ09bk
         04wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQK+3Q+nooggol8n1DTG+GFon3JsnqN/bOc7I4Z82tBhvLCPCZyt/21sQDSBSdlCLUjkmZ8bQqoJHTvIElZKG@lists.infradead.org
X-Gm-Message-State: AOJu0YwwYFbU9y13vUVvDvrMG4fdDU+Opjwr8pZLUeaSoZMHqECCritu
	Ra2l9/EDHTQktmxNsuh+eHH3v6UDCbQ1ywtOPD9YMMhsD3V7Th+cPc7LF7pBa+AAhP9Pr8KzVDS
	ecYyeJerDqG2Z7EBWONPP+lpWtHbMXIliw1Y60EUeFw==
X-Gm-Gg: ASbGnctZb7r00vvAWrK5n82aha2P9KwTKpKpgVMBfTs3p6MwSIFJxXOmVCydftffBux
	tP7D0dQb2syxVPqSc/z9ACOYuAQ0caRT5J9APnS5UIA7McE8u19855vp3/h4S1XvLeC8n8nlfaB
	wn56mfOn5B3LwiY4GDsBOe5tnDSITOlGxZL7x4yRkpLx716zSLkNI2og==
X-Google-Smtp-Source: AGHT+IHy+6VU1NwR5hSQKpWzK3RCXChUuB9Un+z3AYwhqdaiRedo471AkDhodxUcy7i+LlhTDM6edhCtprSC1oAz8MQ=
X-Received: by 2002:a05:6512:ac1:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556dca2b8f1mr22283e87.15.1751579729319; Thu, 03 Jul 2025
 14:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:18 +0200
X-Gm-Features: Ac12FXzOS746MKEQ8T_6q3redzT1OE7J4o6V1m0jt5q39x7cc8PQ_RL8cK-Gjdc
Message-ID: <CACRpkdYgx-XGu+yg1u421Pwb8o+7OW7xBgCkcP1KUzRUz6dUuQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: stmpe: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Shevchenko <andy@kernel.org>, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145531_695453_7489F4DA 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 25, 2025 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

