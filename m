Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E67CD69112
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9T03i0gzxNbf0agsZ7Lvsc1uFwXMAZb0xxRBoFTc9Q=; b=NdxM0jhJhx70HWEkRso8kQiId3
	O3jtIA+JGHdQS4rY3W5wfn85NyFByei5YZYegv6DPlDlDV0HS0k4qT8/UEhgRHb5IKnhzCumkXQFN
	wN2mu9rbYKTNQyJqsRR6S/o3ggWgB0IQ0FZRFB//EvwV+IX+HRoh8gsitVMlR4q+oriP6lK/z12Sp
	TSFP7UXEDDoQLqro3e9m7sXxQAo6xPzkFYzGNYtrYtujTQI7tKftjhej141xQP9sRXv/roo5SSNvt
	BwrEXy4Dfv+GrBHpXQTqzobQoaAmuTcgznumASnUcbRyd12NX6gJKPVXRe29q5XZwwPoGYsoVtXHQ
	bDS64DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfhR-0000000Fmpm-1yZE;
	Thu, 28 Nov 2024 14:40:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfgR-0000000Fmgy-2V56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 14:39:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so5735515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732804794; x=1733409594; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9T03i0gzxNbf0agsZ7Lvsc1uFwXMAZb0xxRBoFTc9Q=;
        b=1XlqCKXgJ3AP6wHkL6LaDWGFSXFWFHTHogIIXblcxHSlvu61dQ1nzdbca9JLjBN+Lp
         bOr17WbqWACtheNnIWkHFk3+gg7Vl8i2QGY70EDRmfMvuhsGl2BKX+9Owee3juXJyiA6
         MQ/UWq928InOafj7C/gGp8Exc7t0E81HC96adASWJ/lHTrGq3nhNhjDSsNq+r2xYMp6H
         mzi3daKeFXXucAWeOmXKKnD824FyDK5fjIvpM592Wv92LbaeYCckDla7Fz0OWvqFdPEB
         vEZOQ1OImzGg9tRgolObKFzg0/3nP4KDUdZ/fYsKVwBaLzHICh3xYc9+36UMi5iIWuU0
         r4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732804794; x=1733409594;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9T03i0gzxNbf0agsZ7Lvsc1uFwXMAZb0xxRBoFTc9Q=;
        b=SdvFeme/dFOLEheCYunWm/rI1heGPlSHQX2xPjR1cBgitjjIlrPErCqzgK1QTUec3Y
         lt4Qr8LV1e0easIAeldo33gnhjmd/O1zt0SorqvBfAGPRysrvOAM/eY/RZzZkqptxLyW
         UyPTMTrsr27yOBrfQr4Z8dxuC1UkCwc8VIRPJnuIDgUu2jMRsuVeTUPvjXxI2F/qbWlf
         2b02rc1wZ4fIZ1BW+TJKth40jOKHq2MGVaDhEn0uTHuDWrV6M7hrKebQytxZSvmlIciw
         WxRqhazqSK2Nl/jRKxZh41e4ruzJBcEmZhl4oPsOrd0770QixgWuQaBUGaozyL6/bucJ
         /Zwg==
X-Forwarded-Encrypted: i=1; AJvYcCVFYzTMvV+CzL0JGBQZic+tRqfg1FBikxCqzacQjiEg7MGpcny9DAk7LGp4B79BuDL5hEONJ0FE0ptHozFkOtlY@lists.infradead.org
X-Gm-Message-State: AOJu0YwYS1M0SiTxityECBbCP2LXqIJN7T5szv0auM7c577fgbYQxCDx
	nl9BmgXF4kmO943fVGcbGNjOE9WooIAKkFub0eEJKpdW3HEYS9Ul7nyP+VschhoNzkkWftTrVE8
	v
X-Gm-Gg: ASbGncuCdMrZHnwuDVmzn49ww3eXmm/flmP3V16GS4IeYdVWRY2UfJxaLA84VW3BDap
	U/bWABeSa2a3nX+JRH+d8zSCf0KwnfJf81tuwM7JAyFrCNpfgUQF0lP30kg4I/Ej08qHo8+3nXx
	QoYrPD7bJD1YHGdBeSDYkdgghxRQ3Yy4sWDlF7z2U1WWoEfO2pvUrQ0HFITK+rKwmphcbY0n2GR
	bGoLx1H53YJ/vHbi9ZWEFto/70RtFjsD7dJgPcWOBO0XwHfow==
X-Google-Smtp-Source: AGHT+IEfrnXry/a2J249x05WOVDUYdJwm8BHrIV6ctpYLw6UOC+tPaq9w6TaP7uwmtjWNU3Zv+M13w==
X-Received: by 2002:a05:600c:4fc9:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-434afba0023mr30871715e9.6.1732804794064;
        Thu, 28 Nov 2024 06:39:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd802e0sm1792177f8f.105.2024.11.28.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:39:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 15:11:56 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 15:39:52 +0100
Message-ID: <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_063955_841936_C5ACE16B 
X-CRM114-Status: GOOD (  21.36  )
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

On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:

>> All clk, pinctrl or regulator are used by other driver yes, this one as
>> well, sure.
>>
>> What special about this on is that it is an auxiliary bus driver.
>> It is directly instantiated by another driver. That's where
>> it differs. The axg-audio clock driver instantiate the auxiliary reset,
>> it does not use it, which is why it makes sense for it to select the
>> driver.
>
> Can you explain the logic behind this design? It seems that the
> entire problem here is the split into more drivers than it
> should be. It's common for clk drivers to also act as a
> reset driver, and my impression here is that you were trying
> too hard to split out the reset functionality into file
> in drivers/reset/ rather than to have it in drivers/clk/.
>
> Could you perhaps move the contents of
> drivers/reset/amlogic/reset-meson-aux.c into
> drivers/clk/meson/axg-audio.c, and change the exported
> symbol to a static function? This would still require
> a dependency on the exported meson_reset_toggle_ops,
> but that feels like a more natural interface here,
> since it's just a library module.

That's what we originally had. Reset implemented in clock.
I was specically asked to move the reset part in reset using
aux drivers.

https://lore.kernel.org/r/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org

Eventually that will happen for the rest of the reset implemented
under drivers/clk/meson.

It allows to make some code common between the platform reset
drivers and the aux ones. It also ease maintainance for both
Stephen and Philipp.

>
>      Arnd

-- 
Jerome

