Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF1DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=; b=mcHudcvI9SWBxsl+30ypUpOr5L
	HK5qgUtlPSkKc0suwq/RhiSg4Nx7vuKlBpaIpPdaEdoJ/BaGz9voBpwFf3mBhOzQLzy3wSFOl+cxB
	KjHUW86ydTE4D2cGqUO/XUWGsr+4BxMlDoq5ZiUAJu0dJ0xvRSo9HQu2hkEKOR84m9nHp6NuzehrU
	6HD1nzJgWwjx6A6N3upzJVYYvNURh53C3YtsXsUkg8ly8QwHG3lj668CAi5DvsX4KIevxEfI5oVCB
	gtOwsBEz0Mfiot2VeyAEbeiX4+q3DU0vepmXfIrRhGq4HF84UHZ6NGM3wZMg4w4mvzIIsaPLDkXT0
	9FZaCleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNB4D-0000000FiCE-1YPt;
	Thu, 05 Jun 2025 13:55:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAiv-0000000Fetg-1WJS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:33:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5535652f42cso1032767e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130415; x=1749735215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=yqkIWABmGL4ldS2BBPEZoF/cR+yDX4d0klUw4Au7CszuYMbLjKwglTRqf7MCWNfePP
         PhzjoKNEfhms6fyst7/9DrrETyrJa2OtzcVcEioPMwdGh0KbRcN3/WMlNLz7rSe28SA4
         91n7klMBev3/e5maFm0K/qUYqN25yglavAnWodXFvRecEpkxoqCTPIWJdMEbpSn3XJa5
         wJv3i1UQW3QoShLTqKVBKy1Z7I50H164MqTy/EriTMtPwvfJ3fQbPJNx98XxoR0IQh5q
         TB56fcWbYlrvPVBe4OX0Q8u0FxBECe00h5dmN3CrXzglpueGj6qKGv+6a60BiG1bltQG
         /JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130415; x=1749735215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=JvclyYsGBpMbnBeaFWDpzEQqbRB1UiBt/plOoBoz2BYTZmkXs2LWumCLWLkBIsNSG9
         U0UyE6u/OsF4sGyS4yBqu9dUIjYcu0blY493+h2Je+fN6GLBoKkzI/JAl2FQg0b2UFtZ
         N9yRlLS0og0b0253Lbm1oME05/6cDqAlBOCBnBzKZwQaoiIqYxJjqbRzIhIiZIE+ih0N
         hEcoxEj+kBfig7ks+B6MjHezZaenpSfPHkk2fIQYr+WCZSH8IovfEmtiHaFQyMEu9hZ3
         Zujm34zIfnNNkvNjk0CZyFFmtUeV65qQjqqy8kgYhV3hbV3ldHJlcWxhOqsXhlijFOfc
         +MsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXReTuZ6JOrH/SIkvCmsx8J6ajFb8kS3Cw6/nD/AyQewR6UbHZ91wq6DOqpxmHhZhRYrSTEZZiqvhmEfj9MwbQu@lists.infradead.org
X-Gm-Message-State: AOJu0YxTG3cRMYSXw2CRzwzjlrjxcP2YUTXapTufYL0KGB/RXtymSpX5
	aZ1RhFMnDTX7ajuQsiXWhsnx4ZDUabDcPYp0A3SMtI5+umUjgDo4kGtlVZh8ZxGzJ1w05LW4XhJ
	uG1O+qB+c4A2ubYOC7+dxJRTWpZie3SA4ovETzIoPcg==
X-Gm-Gg: ASbGnctgAP2PYINemSNs8zajmayDCy4VUROh270UbgHWvkWkAssCplOkCyVg8yIxKhP
	BIaKEL7X9/4ew5peMCGEYiVV9KR6PGkZ8NNhAulWKWNWCq71lu5g42QNBuveJKOqO3wS+usXgKo
	1+7lWD+AyIJ2ez7oE04obP79wX/v9ePOLwMP3+80LqJBJvuGACixOxmQ==
X-Google-Smtp-Source: AGHT+IEgjC4fcmg+OD5IGVLjZUrIMPEfYs/w9+6VTW1vagtiTaUcBabncwsUcBazgBGF/ZYxoheFQtZJR4MPvZFNfsc=
X-Received: by 2002:a05:6512:3c85:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55356df1e50mr2121333e87.55.1749130415411; Thu, 05 Jun 2025
 06:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:33:24 +0200
X-Gm-Features: AX0GCFvHxiWRpP5cMCB8iSavv_JwXNB2m6sizTI16LHxsIHw9CZ-Y-5vnZK5ofQ
Message-ID: <CACRpkdYD1F_AGXkeEhKcfS8BZxgznmfj_r3BBaK8LJLQJkDMvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_063337_407267_1DAE5A1D 
X-CRM114-Status: UNSURE (   9.24  )
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

On Sat, May 31, 2025 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.

Excellent cleanup, as always!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

