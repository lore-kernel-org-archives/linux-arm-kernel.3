Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29650D5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=; b=cVZ8vAjYqmGDyfEh96p9c7HIew
	11fki1LIy+4qf2n24PGvSU3o4HuK8XwbBrhSLso4wVmwiddU8co4JyM9PT2VGHp3na8/EE+QO4QHM
	h0BUBWkXuHRdd9h4pZlxsaFNmJb1chqDRRXyyN75ffifknGkh94vhwfG2IKP/Q2WwmjywgHLPEq9e
	x3TLhivkNPzkYRnHOXVRmq3Zs5VgUrTy7CypcoreDd7GoS3wO6QC7iuMfx5lwVA05kNl5/4TLdSsb
	b6P2UkG0jHsKG7r0A1Mom9EUDuYCJ5ZGdrwGWPqq/L/szw2u4rSZzWZGL7qaHwqJqEZQ/MSQxOT9E
	Hk/8b72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KTc-00000009noN-24YL;
	Fri, 08 Nov 2024 08:36:20 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KN9-00000009m6O-1teq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:29:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1633472e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054578; x=1731659378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=JoOfWv520eUwgCgiG67++u8AkL8hqqHK4e6ZPujozulW0JZWJjMyMaUxeRdpQzGXA8
         1XWkz7lyMpb1Iby++9xYnV31hNdT97e1WUxabgpiMYyC+1xSz26O8GWTVARtXodpCBfj
         YmEWTTbj7SMWwMdWH7Fz2yE8FIT2LCiaKjZ74qbg6EyKbnZehOuxoEdjatn3+AdaRtmi
         M5LpvwrHsjc6wxL2jBVWGG7nT2Q3OXdbHeXgHZCIJRYAFAaohY7CRGE32beVOefepmLD
         QIxQWjLhmey/ISd0dDyp+mmsX/4WfD6vLzvQgcwNLbjNaqAq6uYIvrWG7I5DvTytRQC8
         A+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054578; x=1731659378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcnPKxuoTZu4QcepzzkfkZ6URfzy3g7lXsQ5uVtS0eM=;
        b=QRnErA39W30bqron4pguwJvkFt5v4fI2dbZsRptcHDRB4A5BRHsXy9rP5XvPcKQmvY
         k0pS7DtR3bWp4ahGmfAngDWC222W5+618qn2YeEfmyx/TKqVomFq6zRE6/k/VeQ5PvaK
         zxqq8YPQQmKy+5lr7x0/vadYy1Y1Wqb0TewSDlFFY3rZ1qKnZwLOHlf4o/TxZ7ztO1yH
         pJWHXUr7+Pi+QWc7i3pi9/Y8I/kRWZjei2X7rVCe24bcsMptv5Dwo25lOU7rzbJBgLWq
         5wY5L+QbvjuD2YzNSP4jS1O/vgOl/G1q3+ErNO8zKXgOtf6WIWEQOE5jbm0cNo8lA8WP
         YFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDuQuMCVzGk2am/nPeiaGOzSkUD0SVJvUP68M4rLZJrOcmD7PInWeJs8SOUWevIOj3h+C228EOFKDR9xydHAXG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4sn7Dew9R7Bhf1B5lqCaEzDdi6Yi0q5p9Ve2Ibus7jne4UxBT
	Ml+HpFSP9hdDpnF9PKKScI8IS8gPk/McvqxZkQvL0i28jwb51fCbkGVuqlQBpUwZC2mcmha5pmC
	II9s2AmauyF7F3pI3wpW4Sjvk9QbFfCyNez7Lew==
X-Google-Smtp-Source: AGHT+IENM6vfeCH9jGfRGzsvajDFe9k4SE9omtWG0eiWqQPEFEarMA3/0+sqGJR+WelYaCDndudO9wf9Qnll7perQ3o=
X-Received: by 2002:a05:651c:881:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2ff201e7398mr8693241fa.3.1731054577786; Fri, 08 Nov 2024
 00:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:29:26 +0100
Message-ID: <CACRpkdY9VMRQftH_eqxikpKSh+a7yFKsHa9fANZUkZx6Md3vpw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] gpio: Get rid of GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002939_521574_16FE1169 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Nov 4, 2024 at 10:36=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

If the series flies, by all means:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working on this!

Yours,
Linus Walleij

