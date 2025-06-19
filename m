Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748ECC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=; b=R0Fw2z1xP78q1EEQNwkPoN4jGd
	iZkBRFLTTpZ/wSUiqFrBlsMGK6IMxC/KrK34i3AqT5TCHYE0WpqYeA/G5QGbDFMU1LdjKKJSzpbdo
	G1LusrlUHNcEZCKI1AWIHa6wxu9nzAjtw/yTJkWp4Wj9AXz65XwKf1NIsmYVxH4YtTyrnbPQtc5VE
	BTOy06gdpDUAdO/2IJeYZcKzGnLIIj7OXi9q+TuyDb+dovFnaPN64v3sBw3fqDFaA76X4MrjC7cyi
	jQxbgrewptm+8087SkhxThExbntsqUSVKgYk+dth/1Z8qDEeZO3JlLyI4TzN44fVvMX9dBzcdmcpE
	2pzpea1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBTY-0000000CbaA-3GF4;
	Thu, 19 Jun 2025 09:22:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAjO-0000000CRYY-2wra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:34:48 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553dceb342aso283795e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322085; x=1750926885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=hfb4TwbE0yuaQe/OoJBgvcs1Wg9MAteVtAtuZgPsGOyLrOI3qBjK5hvUHjjVaLwyXt
         jokXwwQp4J3gu/KbieaZq6V3h9Yf0ODlxrIU2uGHt2sKIOTD/O7VKNp68zLdg4wQxdeu
         CaEuQAbiiV3vzd069IhPEezUWhz23+y8Hsmm9q1iALXg37izPt/RC0OGgWP8U9473kAR
         QCP9VcgYCHLQVIM7Lpq7E5mZesRyAnihtjVMR81heW4bW6p0Mtxl96lf9G2fZYGxc43y
         po1HRV1lIVtWypDIoDLKhrKKs+ing3gg/yHTTpjPiagyUq9jR9rxmMwbCnTnRXS3WKAB
         X6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322085; x=1750926885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0nhDKpQpxXWzr1mFcT2IFoKimPE79WTa7ayNr/hzWs=;
        b=P8B7uSpbcvsU98xuW4K/oKySp+4mJ4gVGFIk7lbQq7uJl8wqAg9qHRPSSQlizK+UmF
         YTHwkOlWqibWNFKcbpRDF5RGFiz4S8Eg9NUoTAjnc3SlMuD8414hFbQCvPclogzGDhAj
         Q1P6ASDSdFAJVugnC9/ajgM1gG/TDXAq0FoECIj/symI+kTyVopR6cIm6T8K0cvHzcSO
         DhZ4jorxvkT+yqrceYi979UsM1GW5nN6BX7VsTNMOf/s4anh7Hejuvb3S8CJshN5ZZhj
         +iTJSmFiZ4Ei3YAl5orc8kh5Noy7vVUX/0Od7uyA18iSON7FjxgXBwwtsAfqo2v2Ctvl
         hN9A==
X-Forwarded-Encrypted: i=1; AJvYcCVIYvYUuykgyiy796jQRUj1N8xvxgUFBFi7Ik5g9OAluv0w6jqoMhPoZET4kwU5lG+O7rlxByjIGwDlvceNsH6F@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq85liwjz9RwrcKGuKlCZd2JN00wWhWLngiiwsYf4loVg17UYw
	yblco6L991XPmDtndrlSu5FrZ43DQnZNAMV2W94qdTx4xmRQ58LnTC5UBLovXRmrgpDi7iC5dCq
	tholQyTbewllLrSUfTdFN6zDf2Gdn8ITQF0RA4wQ/8g==
X-Gm-Gg: ASbGnctG/XZo7O1AS1Jnf8jj6MvfxYfKx46C6UloXMXrSsPklVbwz7zR4BjxezHudja
	mpRepMAa9oT5J0vZPU4Qag+phksemCrH9j3gUbS1Tk3gL6Qqh13/lc+dFubyasJ5tbP5Idmw3IA
	fzPoNUD5za7Ss39maXSmxiOCv1OUreWnX2fK7+La9heqak4GR2s5YAP6i12V6PRW5lP5Kw6tsgy
	rrS5TXYznYF0Q==
X-Google-Smtp-Source: AGHT+IFDp85PzWD62QjUEKS6MevtLH60iV1DaBb/nwT7ioJL8BslMyztOttEsa1fNI7Da/cNBk6S/D+nhCaUS1yFP4Q=
X-Received: by 2002:a05:6512:b26:b0:553:252f:adf3 with SMTP id
 2adb3069b0e04-553b6ea5ce8mr6017773e87.16.1750322084921; Thu, 19 Jun 2025
 01:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-3-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:34:34 +0200
X-Gm-Features: AX0GCFuzcvha5PSQAEYMfe3d61ki6vxUCoj5DyKshbRkn7FeS0Wil9VqaZ6ngBs
Message-ID: <CAMRc=McmNfQHVpDtvJMJwGJmoVTkgQG6riGxfxYMed1Xre=GLg@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] gpio: pch: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013446_738324_D01671B2 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Forgot to pick up the trailers. :/

Reviewed-by: Andy Shevchenko <andy@kernel.org>

