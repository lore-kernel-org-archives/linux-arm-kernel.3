Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A2FCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QUNyf1+4GK6M6glNGqXfbJnZI6n5ng1QfS4YTKrhtM=; b=igLWU6eseHwqG+mhNkFqaOCq/0
	mjxgaUdk6bgCIURVwGVKIJS5edV1xXa4OAcJh57FD8piKb+jqfWvToNVFbGOThV3CDyaRDh3Ruisr
	eGLnnfyUIjbGi6JV6V+9rQ7pOGg0oclihAKtWmI0c8xVOsF+jWHwNQhZkhovewPxjSfqeHImFQdyz
	QYukEt1whRiLzT7ZZTpbiz+4elUjMJ7MjRLASBGhqGcjyqgvGQtn3b6Yypt8j2DFwxQuGBWsDd559
	f93kBWtFx6+ZoEesNVH30fC4xdx8gfXJa03yLU6+gZL5WGi7AVbBtnyNVqSvVRyWhyapOV3z8r8tl
	UDAHAMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzK7-00000007EfL-0ncl;
	Thu, 21 May 2026 09:04:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzJz-00000007EYs-0hbp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29FC1445A2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E6F1F0155C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354242;
	bh=1QUNyf1+4GK6M6glNGqXfbJnZI6n5ng1QfS4YTKrhtM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=U8xfN/oSnaOrNF+gtWDgNNJlSLhiqu7Q8UxQP2IAYfVXR5xgxWdbaVBaAzXyExy6m
	 EiiCuk3G4CJ5/GOGGPGJAffJtx0E/wQuk3mK/TJjRlP9wLfMhSW/ggsqBOM9vvc0mJ
	 4Q1+ZDu628ro1LYmqb+ztqMz72QHaA6fsdJrfe6qFmosM69fBhVsvkmDbR6GCCjFzr
	 S0ofyit/qO0sxtHY0C1WlU4Xv1MWW0l23zwMhkHm/Ck0RnfSzGvkkrvPYsBRJCWr2a
	 tN8Uht5hGv+3XNy6Y6s8OZja4tXvLwfByMASdUpbVP+Jw8XM0i8ZHc31/tsMxNxSAP
	 tkWQifWvaOpFA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1357c851a48so6594457c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:04:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VVnMgQLJUL5X0HUgO30JkLZPx1xdEqnBqTafKKb4CSTNaIiJip/WEVQvDm/OHWr/jMhHm0mVjnFGy44P5NMtj@lists.infradead.org
X-Gm-Message-State: AOJu0YzkgAgpyiuimmylB73d7JP2FOQpJiRtrpNpo0oGGJJhcpxtpxqh
	ht3Os6yC6rmB5a6Q1EoRGq5yBLwc1HsF0YTnK9tO8RcXmtbOe3bvMCiawZjRMUCjVHnRB3wv8Eq
	z/6LJSBsxTVt9NQ2SSB3GR492TfRZd0QYnCcx4fAdkQ==
X-Received: by 2002:a05:7022:624:b0:134:7497:2153 with SMTP id
 a92af1059eb24-13632b19501mr1138896c88.20.1779354241319; Thu, 21 May 2026
 02:04:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:03:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:03:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520183815.2510387-3-arnd@kernel.org>
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-3-arnd@kernel.org>
Date: Thu, 21 May 2026 02:03:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf=JGOJUfs__HxxqTkiEk5NrkMX5J6RkO+=ybHUfWGShA@mail.gmail.com>
X-Gm-Features: AVHnY4Iwi65kxiAOYAXhfVUikEld9MZPsgLFlTgVHCPfkqhuImHkvGx_B84f6lE
Message-ID: <CAMRc=Mf=JGOJUfs__HxxqTkiEk5NrkMX5J6RkO+=ybHUfWGShA@mail.gmail.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Lamparter <chunkeey@googlemail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020403_254818_9CEAC66C 
X-CRM114-Status: GOOD (  13.08  )
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

On Wed, 20 May 2026 20:38:07 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
>
> Add an #ifdef block for the parts of the driver that are only used on
> those legacy machines.
>
> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> passing an IRQ number instead. In order to keep this working both with
> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> the gpio number if an IRQ is passed.
>
> Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
> Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

