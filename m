Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DB9C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 00:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynrKw2OZA+fq1yLVZAofNqD/8RgZrBsA+cLVvC8wmTM=; b=iknan8YCnkonmUkr12Kwds0j4U
	w/qm5rpXG76eSzkBzr9wnVkhfWH8FX8EKoGZHvU3jrCIIAtzEtKDQ8c1IhoPCmxfCF1fgMXhZDOwS
	7dHhXhjRu8mLhkQve+FAmSRGe3XBen/9pX1PREbfFyPm53nvgHHbAHNIiwP97bgrzfDWTNGuxcP2u
	NyETeQT9hc0AVkZyHzC9PfzvFxKLA3PZ0mwVXdUSeBI04HJMNG3mD1FYg8OZ++u5sb2xp/JGaiDD1
	fWZDkpyZGkMSlhNM/ZaDn6qrNwhd0xVQKR4RVjF1hWs7FtFSuB6WORjYjAtuyZv8jdt/zo29dBE1x
	wssEk9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwH5-00000003s5W-3ybu;
	Tue, 08 Jul 2025 00:33:31 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwEj-00000003rrl-2p9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 00:31:08 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 08 Jul 2025 09:31:00 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 34C662069FF1;
	Tue,  8 Jul 2025 09:31:00 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 8 Jul 2025 09:31:00 +0900
Received: from [10.212.247.77] (unknown [10.212.247.77])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 3CC7B10D84B;
	Tue,  8 Jul 2025 09:30:59 +0900 (JST)
Message-ID: <c300d168-797e-4812-b957-1b761e40ea44@socionext.com>
Date: Tue, 8 Jul 2025 09:30:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] gpio: uniphier: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux.dev
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
 <20250707-gpiochip-set-rv-gpio-round4-v1-10-35668aaaf6d2@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-10-35668aaaf6d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_173105_832096_99D8418F 
X-CRM114-Status: GOOD (  12.48  )
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

Hi Bartosz,

On 2025/07/07 16:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-uniphier.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Looks good to me.

Acked-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

