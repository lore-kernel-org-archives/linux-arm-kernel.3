Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C377C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J84kiW9iX5mOxMVYKrjk297JoG/oOAwt36k47y73SM0=; b=wznZPS2AaC72ZTPCGK0SJUHJ2C
	vh97SguIBE2ayl23hH0kkD2r370ublFZTMp17CPcZ4EcmcuIeaclzWI6iuNRzeQad1Ps7P9TgSq17
	0AjDPOVa/e4tf/IisWWLi8641npYBhrSk89I1e2Wj69SvIZCAkdr7/OHrB8SH49EGtKm6+8yF80sg
	CY3P+xEDzuq4HHsj8cf1nSuBbb5J+gIwPlX5mRfJZut5FqCEbcxmIUHCcvtWW1rHAQYAlU8F3Kwat
	tjcGHov1xjJALEhruvaLGB/sr0DmCvQtdIzKxGixRkckjfxtudQaHSDvtESyTyGFiw2zezRLHcCSS
	uJpmX3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAwj-00000002In3-3w22;
	Wed, 26 Aug 2026 10:33:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAwh-00000002Imb-2J6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:33:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED64E4398A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21001F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740406;
	bh=J84kiW9iX5mOxMVYKrjk297JoG/oOAwt36k47y73SM0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l+t1Y4iHO9CxMo9RrV3DgRh6SDeClWzPDzjkwNnLzmR1DjfK1lbfDx0YuMnV9s85n
	 jYm1Ld06qsw0UPYjyAcW5e0WTA7MPI+WjDuGD6SQ6p9qCtaOYTT1oKA+iAE5SJy4jd
	 soi6UmspTi9Pj5Ze53u2ggic9SJw4Z1o5UfZ7DhMCqWEorEDiKcHzMkXhUndx5Za8e
	 iOVYqCY1hwmK8p2PTfiWvx/ukvo45GSfaXWa2MYWhqxoiyFZ8R57Gf1z9s5vWh4bM6
	 /sIRarw6Q7GeBEJ5pRQKfsqMbr5tRuQybO4i9pP5KQbCf1V9jdEsdOLs5NuKdqdzpX
	 PtTBR0mt9LcJA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso726003e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpd8VOb3asH5161pNiDXGuuZCVpAr35aNFWDeNNsnM/0lI8R2m2WjHWVpkLBbkX2uakmqRz9RMnZmH58MJ4YdCg@lists.infradead.org
X-Gm-Message-State: AFuF++nlRwhbt5eliAIsTwjOCuzyDSlIxxa9jGoxlN7BkXbHW54kYm1H
	HTb+mK1v7qNrNNQKj01wT8OW77ini886r+CM6s+MEKXHIo2ZAnSvGZN54A8b2iiKjCfZNVbjX08
	3K3MZ7Zi34VzIcOIgtxPiEE9N6by3z2TbiSl/nWTGkQ==
X-Received: by 2002:ac2:5695:0:b0:5b0:1760:facb with SMTP id
 2adb3069b0e04-5b4a90b961cmr1822631e87.21.1787740405522; Wed, 26 Aug 2026
 03:33:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 05:33:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 05:33:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 26 Aug 2026 05:33:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
X-Gm-Features: AcwNN1Vqwk4Q0RhFsCFlkk4UPtd-2YY_gEyhjjPeI7BFhdbdnQTIsNX2gbIeCC0
Message-ID: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 24 Aug 2026 09:42:31 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> There are handful of drivers perform the same check in different variations
> over and over with a potential to make subtle mistakes. Unify the check by
> providing a new helper and convert a few users as an example.
>
> Andy Shevchenko (4):
>   gpio: Split fwnode_is_gpiochip() helper
>   gpio: shared: Replace open coded fwnode_is_gpiochip()
>   pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
>   pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
>
>  drivers/gpio/gpiolib-shared.c          | 6 ++----
>  drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
>  drivers/pinctrl/pinctrl-pistachio.c    | 2 +-
>  include/linux/gpio/driver.h            | 7 ++++++-
>  4 files changed, 11 insertions(+), 8 deletions(-)
>
> --
> 2.50.1
>
>

I like it. With an Ack from Linus, I can take the series through the GPIO tree.

Bart

