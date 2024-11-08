Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C36D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=; b=sWSKD7aiG8Z2QZNfd/sbV+7vMN
	DvxktfK00B61Fo/TmGUxtWBdGrHOZJiBEcwXaaql1rGtLHiFzpKNRpV3r2tsHdHzKorUP2PohPhv+
	1K8srKUnQggD+UdI7BJMpDNGBH3mVVthpZIbA0XJWm/kaRWTWtK2wGU9Q9mibfk+Qz+nuEIbxaUur
	QwsxsS9dDjE1jIAnLNns+4sHPM/CkcZYtxZhPhC1df2helncM0Aaj9ozz6uIuPlv3AimalaYq6Ytt
	hCUpHj6jfIsG0mhMDfWFVUUvSQX2p4vB0ppmIhuFxgEfy44Z3TlE25R1eMlV//G/mYj+nUn/i0GhO
	Cn86731w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KYt-00000009orm-158E;
	Fri, 08 Nov 2024 08:41:47 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KR6-00000009n0E-1Vs9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:33:45 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso27519501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054822; x=1731659622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=q0FM+mspjjEra02Rpfr5A7NlzqTZujNMXbLEWADvQ6Cdt7uNlBEiu+4WEaG6XWzwQn
         kR90g5zyEKf9koMVjk8W3p+4NhNOaakUDnbMyM483zAQFRW8rgat43coqeZ4O7NYzVg2
         LjzCxQtPhNiHnclDwtzeS8U09/TGfnU/MAWCLurtpj9Kdirw6JKlwL0OWm/BZg9bctY8
         YWuESaWW3l+6F3FhYmtUnxosoUR1CNgcqi07PGT6jDALaE5WXCLFSLUVvaRq+U9YScv9
         5E6uXn7+MsKZjH/fW1h5j4Z0mU+iScPAf/j4EINWFXTrploKICdCJnhQzhVlcSsdkkpj
         KUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054822; x=1731659622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=D1jWIhYqAHUwTvIeM6wQ8Le+Zrcx5jrTLGSMH1x6CG0OP0zoNSxGCVe9G1gGwSXb7q
         aqwpoaINv+rFBMJVyunFwPQUawNSlA/Pa8eR9+i4X8+MXVy7NgtcI6DEkYewZxCFikYB
         yab1GYDZStATMRQ5E+FdmI8KKRdguOKIacR8RHQ7xy/4jDvo45wgr+DASk9oxKUQV8tq
         rgncGZkcDjHOdC6zKwyQVJnOjTgEju08aUVE45sZbLaLcxXyAtekTGpb4M5PgUA0Culw
         h6jnre/0xcCeXuyVUP98Jq8xtbp2ZYuC2C0T3G7EPKxAlzG6HTEMt+zidphLrHKNpigg
         inJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+QzjAFgkQTBu5zbfkOeaq7NJhcwuJ4MZIev5IVL5BVcUcI7HSQXoBXDkN0u114wZ7NjMSMR1NzDyGMUg5XPWc@lists.infradead.org
X-Gm-Message-State: AOJu0YxFgAVaYNUFPgvaXdPNFUyQe3vqbAdHH4XxBVVEmBVhhHl/aMvV
	Ho+XqTMldYHU2mcPiIqgP88X8SBbGsgBUzkHhIJBzUtJjNJ3UKzlR+xtl3PgJj6j9bmT7ItQnaH
	OJnQ2iQqohefg2DA0+dscD/6clTgvSFD4s1WGLA==
X-Google-Smtp-Source: AGHT+IFyr+pHYPoU9m0KAAV5TzGf7UWj3G1xJPS3/nNGmi70pN4W31YM52rF43tSYPY2jobLCKLiVuwMjSY+Mo67UYc=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:63b5:c0bc with SMTP id
 38308e7fff4ca-2ff20162837mr14265851fa.3.1731054822269; Fri, 08 Nov 2024
 00:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:30 +0100
Message-ID: <CACRpkdb251gJhbcoh9ewqh=TLjTgWA9ZKRAXc6dopjRHDrCVOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
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
X-CRM114-CacheID: sfid-20241108_003344_434085_3AED0FF9 
X-CRM114-Status: UNSURE (   9.08  )
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

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

