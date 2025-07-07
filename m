Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E7BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=; b=XxpQVZMK2NhNCj8Bk0inoQNP6c
	WqH3RG1+79N00ndaMLDUZgnelIOfWOwbRHEFFdGjvr9QeGKypjE13tkQXyFedxYDhmA+lYy7PItmh
	yNiXzncHC3DRYU7ntdwvhTn84enxuP5W09HkCwZmY7vRuQKM8+x1ghIn/Coj8d3UAmYmQ+J1hq1T3
	80gwHw6fojF6IOaAQqEGUHfEEItB4vMs+N6XuqphCNxB8jHWilM52DxMUJ1uKw0P8joIkxXAcs0+S
	Ir/G9b+DYe/w2fv9beZtDahXsZj4nlVKKkOnpfczQiRxy4QqaoQB2oBR2rH5XgrKYV/DbCASAN7pI
	GkV3hXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYi3v-00000001yCn-1uc6;
	Mon, 07 Jul 2025 09:22:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhEE-00000001rGJ-3h1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:29:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234c5b57557so24227785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751876973; x=1752481773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=TasdBE4XU5uoT8R+2zv/wEncDxVjopxKY24GtN5TP8n+UvA1/HHUWeUcHHFTKHsxZN
         7WVtgEMjQXOHkwOCSZ67fGafrwNTrzmoG28Qk+3vsier+l45+xE/16zm7TXgP5Rj4xN+
         CzV414N05mD/1pJ+G4oldnW0lYQlJRgxAgSZpLTu7H44eNL0WCZ4/vESW7+7/6xYwqpj
         jUU2kwX8fVM2PtdORy0D6s/6bL3QCmAWHozUmjw/dZAjjO5o5o2J0hmOMPT2p3q0n7pF
         NNq0ei0mAiCxFA7o0RAsoh4C1cQ/iARWWcs+DVM+Qyty7nIZ8wBSzBXYVUTvr3w+x/0O
         VnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876973; x=1752481773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=v6AunE2A/tSkco2c3x4hl81KGQJ5G5fjv23vgLJAyyL7PLcbWxO4gsUudWliqnm5TW
         bqVElvQZWp7398dJwT7aoDtn0IE2hceddJmPg6S8moI1/3SFiuB03ILfelEVJ2Utbowi
         /WKhrsCA3si8XM3/Yb2zZKP4Hmg4/jyLS6pDXb2eIJHHqDa9bs0LqUuD9XoccdX2SeG/
         ya3j6WklrXC/7pBFrConoxVXOGcxCsuMDKiHZJVpDwQ5bq+61YaSUDk+di+9EwlC0aIg
         /KM9wgrFC0lLkzudgPjnQAx+dWADu3/AtYVZQZCpVOMBrubr7ImNiiMsV3UzhcqSXxIO
         I6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUSXhY+vUUdw5bedE5btgU/Ht3u/NAwvs6LcDIy729Z0COytOxpglmQUffOqQ4B9ulX8qjJ5j6UE+9y6V0Buc+b@lists.infradead.org
X-Gm-Message-State: AOJu0YwyVZhG6263j56NDyC5QkXH42mySdCmgDBTN16lze1Q/SSMUjf/
	KGW7PBMXt1bS/y7wAW+k5WX28E2iAs7G23RW35w2F3B/spGDoPwXsL/EvsOfjhpz7ag=
X-Gm-Gg: ASbGncvm7HKFN83wPSXDN9N5C3kzn7SP6HhNJpWxpVzmKGDXsBCmAQs0qPEHlHWZGMR
	Kptt0F4dvrTVhe0ZP1HnpvUK5B2xq8tUmRyFYM3e4zBHcqbMJnL4KJlLz5qn47hMbYoniji1+Wd
	1Ptbw+Lb5m35MUyUG5LK5+KlB1DkMqSIduNA+/qNbk2IONsSeLWeKxfYz75AJBoq9q2WJwRXv9F
	ocZ6tJCtiHNGQRLLFoBza52CYj0IrXEhfaLpVqtegkszV/lPZek2BlR3Z7nZEsIzcsFDM/V8d0j
	Qy9ulGgr4Mimv8qfz3JxIhN0p6okxhyzA+X8ovOLIzuoRWIeDCEgj1LKCl/8YL0=
X-Google-Smtp-Source: AGHT+IEzG4PTUXHjQ19lS5u/nsqPLFIxy4HYD8J7svSUDedR3HYEqjepBCTrT6erZSMiBmj/Gzsypw==
X-Received: by 2002:a17:903:198c:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23c85e745b6mr148490455ad.31.1751876973579;
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845894a3sm80048605ad.187.2025.07.07.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:59:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: virtio: use new GPIO line value setter
 callbacks
Message-ID: <20250707082930.boxyt5lrfmmxjrmk@vireshk-i7>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
 <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_012934_950263_008A4FC4 
X-CRM114-Status: GOOD (  12.55  )
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

On 07-07-25, 09:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-virtio.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

