Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EABCD5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=; b=4BHBJwojTa5TlAn+brGba/fbQs
	cbH3mJoj+D0UrohjK92SjvhBX6qCOjbZYfIwLQaOyUd35Kp5uJPkRQIP3lJsZ9O5XXUGm6KZFNFDr
	v+egKp0MO5U5d+o0Vd4a1MPQ2hstXr56qXLIkAs+1uhDvokuvUPiL5nCnAY96ElQva7qfDz2my6uF
	6Je3PDB3+Cff9R/mLTsAH1qbcIzmZuZCJAG28+6uVIP+SGBpWFFbBUjb4WIbCFkkIJdtc0w2oBKM7
	9waSmSrRjN9YEyBX0T7FTLn6wkO5nRDbFSCP68alYaeoVX3HE0I0w502qbMQNPvA0xVY6h2TFIS6w
	ZruoXNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KcK-00000009pHk-19OM;
	Fri, 08 Nov 2024 08:45:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KRv-00000009nCP-2m4h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:34:37 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb587d0436so20025451fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054874; x=1731659674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=BbEoUWoLbqwC6fO9zY6cD27ZwDgdwn1O0KuGfePMoQPpuGnLI/k+jJMVRd0UN8y+xH
         +qA3Fy4t1XFdSPpD5z/brXWKbwjGV3+j7XU2TxVGdCvCWa4+1LIu7BPl97lHWb6p2/3F
         +LU/MTHXhIXOArn6LJPXO435Aas/IaorDYClrJzE3Yc9mQilbI/bmh9gebcfz/5R1kpt
         sEUsnejy+/i27kw+Sndnsu1L//g8I5CtuiYvRc70CHGBhNzW2GA1eeSlR41ZAtDXOhGT
         WmlD9oaTKkHOqaP7mO0Ok+GP2HS8yT/RyxFeB0RMzu/pncaiTfrpbZNRxQTN8puWfV7m
         NWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054874; x=1731659674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K+9SzWuLqo1fVpHFezCjov3Z+u1nFxQFcoG02nQW0=;
        b=G4WztA0KrSXxb+NnLcAz0dRjMApvxja2Qi981jb3wAxUZgqX/0TKawcbHqp3Z/ZQOg
         xKzUM1RBonIsG+eyYcZJbhj25q6Pm/u/9fGxplQtAHxYaw3RGnwKbW2yqQRtQzF8Gjd7
         /B827vSylaqur4LoteGc+1U3+wn24wN9fA6O2J2TPmqCoWjdzUAkFgrd4vYQujCCGmWs
         hltHf6gYjNTmBlEAl8ZMvlp/eUmhFgn8XlmcV0rhVX3lDsT5ftL07KZB+w996LAeMuYO
         tp4hxDC4zz/ETMk+CaBYBTYSS6wENxol/jidcAo69tmPBAygGEnMvqOmuUuCWLwtER8X
         6eEw==
X-Forwarded-Encrypted: i=1; AJvYcCUFgupBcteJvviNCWYSTUIRd3QLPBdODox4gJoC1T+bhrXh+ITj80RrEIkfb+BqH5ugW9syaLHT9+3xS4vwLjYc@lists.infradead.org
X-Gm-Message-State: AOJu0YxT178ZvRY3VyK6e8tD3x6/5cuhXY8yDvzCoX56oljfq9LiaEgR
	Vmc7u50alu4d/6d+l2ce1CaNdCVPXflkpEl+D/j+MW/bmfVSQTvw3LIMO2GzDcI+pq5RTOIPt7j
	/Nrs6ct1TVFGA9LNlnFnoqW1lMTDGhKZ1mrMXYg==
X-Google-Smtp-Source: AGHT+IHx7mAPhJnzxE7EYgyRjyP79PfLYtwkdmgWKx0QpJkHxCqAuAqQZIcNr65Vl/TTpb1mgGDc7xzfzo1LsoeLK4Y=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr8041491fa.22.1731054873529; Fri, 08 Nov 2024
 00:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:34:22 +0100
Message-ID: <CACRpkdZ6gYfbkjcWMNOOyN9owg8n6ApFVv5XZXUA2CY4-JXOVw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
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
X-CRM114-CacheID: sfid-20241108_003435_707862_D72ABD17 
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

