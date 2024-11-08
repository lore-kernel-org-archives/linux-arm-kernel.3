Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C73D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=; b=gPuZP0/wOP4pQHNRrp5UmobBn2
	TfPtV01E+TwTEOFLo7R0mama3ZNldYoVujaZI0Zuo2iRUBeCPnw3kvz2NANQvFLgbHrZHMlTxgshN
	2Q2ouFBrM09ARX1cusgdANWXAcA956ziHnBmv6wcvOY7Jk9V5O2JDpuFUt8p7FoqPrY1APIyFQaeq
	XtH47QnIAloS64i08aCDNSNgx4u49NRzFfzvzQqVuiBREJuaN0Zne/rYBaOheVUXXuHffC4t7CZye
	SLZjSTbYbAayx1u5h/O8uhIfxZxbF3xOAxwPpKSDY8hQfOdtzd6XdUgUmT/Jgtn9ZN0LBhBIrWoJ2
	Em0GVddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kab-00000009p5d-3ymo;
	Fri, 08 Nov 2024 08:43:34 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KRR-00000009n5H-2Sbi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:34:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fb5111747cso18556191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054843; x=1731659643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=swRr9v8yRka4/UqFO67rmOMmz2xIQniJgrc6reDzyhBcyn/3mSTShPZD6EVr+UFhct
         LkpmXAQiYXdJsTqwhh2hp4XnBth8OMmFDNKBUAD+vx5Ero3OwURqPDdjtdCTffO86tnW
         5qI0x8pLQhfuxq9Mi+LfAkRISIpjJoaMSIzQTao+D944jzIaVq+n+i0t3alfx3jDqg3Z
         pLUdVi2AcCFR7APvzD/LcgoD8cfnWQGDzQmcO8QW2ksIxlfyQXb0GYofynvadZoN5GC1
         orpqXxj7RuJuGu79xE0JdysOOfndLBq6wyR1Pb9u14KeN45CYzxq828nkPMd7jtYwdLj
         IWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054843; x=1731659643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVqCqej3UEHzQjSpv0v/eChyYMxhKtzxsLYbfjRtEsA=;
        b=fgNC4AkuyFf5Zk61qjvrCnidat4FC2g8lP62dgstFIDO+OWW9/wsDdJ85Wnxvzr2X0
         gmA9wXonNTZFy0EMx1Zc38UyVeM74cM2xXQ9QlT2v2ekB3FLEI2cwZDZ0YGyi/17gqJq
         Br+CSp0NQNnq1urevr35Vf3QRqWMpquiez2A9GsCXbWs5eYjLPDm8UYbFChMkD6zYEAT
         4LmAY9LwhdpcX9r0LXIEs2w0i2LlVkVtEXVP3fKHBmz2z26x1ttwtnvpvWibM2nA75sI
         rBAE8f24XoujKqPPP6VixSKxPoYQwGTbjs3MAeRndRjkO3Uv22zwmeXHlZnzPNdN8gM7
         lKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKGN3dDTsUgms3YDql3/3VD11Oeqbv1tYsWB41PBmZJw0jpDh4ohjyrdjyQIblQqcWs3m1O0lRYjbDzCYpb6cd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6klok2GpuJiQhXpgORFcX1DWc2xmzXQvhSDJv8tTLQ5kaHPnp
	605rKD5EGeAIGxWjC5vpN57SlZezJYZA9VR0yp0nHunNj+/whiSkQowSdmblXPR3y+JD6/Inogy
	kp+FxIP8yYDWLi8ROFradNLm6yWyie+voePxsEg==
X-Google-Smtp-Source: AGHT+IGtlBw8/BzKpYwXBVKDarOJwHXN0bQ5Y2Edkm/hG0GzbaUmoWPVA9ksvjdd8kLv/JY3KG1mkk4/qEjDQJYnfQs=
X-Received: by 2002:a2e:be86:0:b0:2fb:59dc:735a with SMTP id
 38308e7fff4ca-2ff2031a659mr7523931fa.41.1731054843501; Fri, 08 Nov 2024
 00:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:33:51 +0100
Message-ID: <CACRpkdb2NvL3-+BahUHVWEj+gPKLRmVi3aTrLUSemFoNuj2nmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using GPIOF_ACTIVE_LOW
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
X-CRM114-CacheID: sfid-20241108_003405_634874_382C63BE 
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

