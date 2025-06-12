Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C54C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7urv+43q9m5//eN/fBrHnA2GxbG1zcAPVe31MZBFY0=; b=CJNW1Ci5XTjsMx/WDuRI7KjkWP
	0/7SOi7utesNUxPw+aO2gVl6ag/wl8K1S2PU4ngmjGmc9MLSFBkYSl5KcfII1Z0qRJYpCK6l3O5GP
	ojuzaY1xvrNz81kqQKaTYownNIlLob20PuDI6l3CjTPhaI2qgHTuVgB2I2zNBUAQXQZ38Jo/VY16q
	llKfIxt2PozL9hTn1mJvj9XrRR5a/poQRQPlRtyGd62CdQKhchxxZfV+JtBxQ4NRYWQl/3i9IDs3X
	Ib8OzX/xG1NqfzkO0cTjPXMzCMqx+EmKInCHjjoC19MFHa+GKkDzH9X3aqsSG4/3b0ZcRfmm10Ts4
	MSx3TVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowd-0000000EXi0-22ET;
	Thu, 12 Jun 2025 20:54:43 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjOQ-0000000Di91-0uVz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:59:03 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53118db57b4so330749e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 07:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740339; x=1750345139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7urv+43q9m5//eN/fBrHnA2GxbG1zcAPVe31MZBFY0=;
        b=T/fAZlAQwQsi5tsWAK730FCJIg7uKdAEnZ0Lce9R9UKtvlKPNDKCZH2W7BqtVxnZAy
         8hgrq5bklIv0ftg50iEc1DdcaKdrFzacGsD3gSB40p/kebBkUv/J+3PGtXh3J5EseySk
         BpRN7lk39KjDhsU4g+0QR6y3zH88JcV4jxKgYUznfKj55hnnAyLLRxe8Uj/PzrxyuIiG
         mKUpXd62AhDFDsi49GWJX/CQ1CHvHbkWbx+KCem+Z0VwqiNa1DmJ9Ciusywu69POgDVn
         Fu7W2bYrbMpChu/nbz5gIlj0q1x2PvX7Xdn9GiUyu8Qqh+rDkRQpa7jXIDEv8KHvYWR3
         FaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFk9o/GPGNrmluPy2OKUFRpSId7f7hCK3/kJNrK3Z4UVJKmhaE/kXs+USZtcTjpJfoXAw0mYoSCIC1q0JBH+dm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1YFyr8g7MXcSWdesXFJy4knJgUFwuMDCf2AubcMmAfJSI6pE
	OMIVFBLZCh2sMwZd/jZUHxPAwt2RDavKOZTRSwLj98AcmpjlKsbqEilln1O0BNVF
X-Gm-Gg: ASbGncvFGI5bt8NZXwYA3z8ewKpnxcaAahaE2TdtZMyutU6XKbNq9cpsW0fC10aAcoE
	oBGXBeh/ytvbOHxzS1u5zAduf46wrYBdAdnz6uE08jYJtsF/XdjTE3e68AVgEiDly8Zv2K2S2m5
	UqptK3/uc9mRgvwBeLkJWAuBG48canAbJUksqUr6aacqFi/oV8C+E6KKGp3UnAn0+BgiPrbbE3X
	ar8wrC5/bAbFvgoSlzTrMHklJIqC2KHubYmewl/EfojLNmVQDgIVKDUORyD1aanjbBSnJ9d1rx4
	10bnDjBKHlYy+xA/P6wKPjXhC54XL+OsxQtWiNHfvmzWePyyCKC9DDvEfndIa4jmcQHQ9NclKAm
	3fbYpNmGQf+QYXq84dn02aYeI
X-Google-Smtp-Source: AGHT+IH5deZItB/yhtdH/gM8m9ArMF8C96UPVHs8y94wBGdau7c7k1ucGg9nj4lxIyqj3pAk64pzig==
X-Received: by 2002:a05:6122:1d49:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-5312cdd6ffbmr4126956e0c.5.1749740339373;
        Thu, 12 Jun 2025 07:58:59 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f493001sm315447e0c.1.2025.06.12.07.58.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7ccab0776so225226137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb4lH0cMVzpmflVlT8Y9x0rKVyeojSnkbiHdICp0JEtPEhOI8QIvXFmsz7Dwq9mDf9F/HwNSqqSqIqIo0FNCjH@lists.infradead.org
X-Received: by 2002:a05:6102:3046:b0:4e6:a338:a41d with SMTP id
 ada2fe7eead31-4e7ccb9decbmr4392145137.11.1749740338109; Thu, 12 Jun 2025
 07:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:58:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
X-Gm-Features: AX0GCFuo1dTCSfHZ3zIJsOn9_JIHrUSOYlkHewmTg8yRd6ll7bXt9Le_Qc4mtYM
Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_075902_253261_BBAB5EBC 
X-CRM114-Status: GOOD (  18.04  )
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

On Tue, 10 Jun 2025 at 14:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

