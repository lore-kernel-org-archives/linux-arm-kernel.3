Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6062CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOOUWMIdhHkQ+tRZU4YDol3EV+jZsKR5HFpybqxFDYA=; b=Rge7c0X1ISMXSTce3eV3Nx/WuG
	dFqbL6vpFdaKZpv/qMK0XYwYYVaMeqqiVKuRQiBNrlSMcB4MGznWnLo6VVT5eMEvL+nJ82qwP7qkv
	6VDjZe0jPaff1ZGlSBMa8wGgaonO4Cq8nG7eusOkif25xgB2IyedKbunoPx+/wKykp0GiG9ZG2DWX
	fIXvgfmk+rDajROobAyIquT4lcyshfjr+NdlwMmjjnBQfdKmCr2Zjf4SxR2t7s1KU2JaoGTygWYNh
	/tuZff2dhVN3AoS/5xxLOSFwFvuzQ2TD29xpPd10Rzzt4xYX+taC5Dc5YQuzvV0FgSe6AK6Kp0UJj
	Indprtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaswj-000000000a9-3Liw;
	Sun, 13 Jul 2025 09:24:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasKq-0000000HYJR-1z42
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:45:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1767277f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396323; x=1753001123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOOUWMIdhHkQ+tRZU4YDol3EV+jZsKR5HFpybqxFDYA=;
        b=PmXQY9KQzf1l9S/zct/tHhmmjGYTfP0qFxHi9yGXy3Z2ANFyNYG8jhDZNUKwgLTFOb
         W5PjHmDr9Hzrh0tJZQ8iKi2sj/6DwAAPLL2DSnwo1BqVe3EhBYWGnUy1RgEsG/yhZDP1
         KsAxCwFL+cP9rNslCSsVqJRDDXLoDEowKsf4G+3THf7jV/EIQdSBtBBDgSg0rquOC3ik
         7n3YuCU+r8l8SNliY9SZFS1YvZ5A7C1WSrXsA2Zhs8c0OHM2p+Eon5p7LBKjoFlitfZA
         GnKxwvypC18BFy1l5c2MizvNn2t3X25Nv+BwV1Enu1xn42rQ1xVRiIWZnVmI8jJuWFhl
         7Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396323; x=1753001123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOOUWMIdhHkQ+tRZU4YDol3EV+jZsKR5HFpybqxFDYA=;
        b=PDIGCZyI2tpO5MuUvFCB1tJPQiowsg5hdQoGDKgxPkqhexaKjCw6yBs/jWKnMMp7d7
         LCP20jW0fI1Y6W9o4dzJnMS2lVvuU+3qh0WSm8/ezIqwsWmu6e6RwzkUiATF00wbCtcK
         vhbKMYfi7QDMnhhlskJ8NYMsgIU3nfVyRu76n5AssFK/nJMROdxYf79BDwC1jKCnAvSn
         75LBxsQVsKeibi6LaCJLAPP0wD4aW1MHA7RBCsVJZojZVfxRsbq9Sag8zrG00dR9O8Cx
         /RSS5DKTdjFJX1rFqKOrz4P2XKxOOtmA0EV/WkgRRru6fLAaQwbQCHagtENdNfGOnGOU
         aZAw==
X-Forwarded-Encrypted: i=1; AJvYcCXCfCKUiVIFfNVwvYro6E/g68/vWcUhBSPYnnu+GCn476qE5jkVhHxPcwYBwT5G546ZmxwzRR3+QBO7TTWweTYb@lists.infradead.org
X-Gm-Message-State: AOJu0YzpBNPGT2CACBPe5iPKPSfEzs2hFWY4zXnkn8+fI1wG7NYBVDUS
	H8rfiL5Fnw/ggu5oh8fjWqqZ0Ov/CYz1KdnHGP+Fpw0zKJu3ZoxGAkc2YhszLiIflFM=
X-Gm-Gg: ASbGncsnPiHGkYyl+P77Wq642u8Ks6/AYI+BtjMUA+cb0DX8XcfsX5P34BKrtieOTBR
	xIMiVNR0/CNVgM0+6VTEDbUX3J93RCmq2bL5p4xHzBii5CqY/092kEOuQwUPazAtxH0d16QU7Cv
	4/M0gCmF0VF2+E83UrW46I0kzPYJr1sAw9f7YmmMbs52twknJ8H0oPmCVW09/G6qdRa0/0QuAaa
	7jjPOWOc8c5KzfTUgTRgle7nYX2lQaVO97e51v+WBj9A2PbeANSu01JwLcqFHlR6NC52klVbbwY
	g2vWdHyIOXS3f7CBFMr5Oz0UhBvRTwDfCn95EhJdsjzjp9D6ZTT9J6NXy1rYLJkXRFCXy9gRw3V
	rMDNbyYy6FD2doictMQ2yI1A=
X-Google-Smtp-Source: AGHT+IFA2prv4K400SGiTJz+5nwQs90KuarJOb9H+jJVA2bKFFKRJN7i5BSkPopM07i32Va/RQqyOA==
X-Received: by 2002:adf:e18c:0:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3b5f18dc494mr8398012f8f.34.1752396322894;
        Sun, 13 Jul 2025 01:45:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f695:8645:1433:4418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50ded8csm134569945e9.20.2025.07.13.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:45:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Sun, 13 Jul 2025 10:45:21 +0200
Message-ID: <175239631858.6478.15774208043366926710.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_014524_513372_0FAB2C05 
X-CRM114-Status: GOOD (  10.01  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Jul 2025 09:50:13 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> To:
> 
> [...]

Applied, thanks!

[01/12] gpio: tps65910: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3e498b3c7b96a17037b5777c56ccff33d3bfbca5
[02/12] gpio: tps65912: check the return value of regmap_update_bits()
        https://git.kernel.org/brgl/linux/c/a0b2a6bbff8c26aafdecd320f38f52c341d5cafa
[03/12] gpio: tps65912: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/22cbcfe36e9724fda06ca873e20777d863445ab8
[04/12] gpio: tps68470: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e41e51f07b1c8a642fed121d01da37c1c2994f89
[05/12] gpio: tqmx86: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/9ade48906b62fc7c5b999422891408a4f02c255a
[06/12] gpio: ts4900: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ed8497dc6683cd285ef4335a315d398524c4af52
[07/12] gpio: twl4030: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0446ce284bebe192be6e0da6e969379dc3dac587
[08/12] gpio: twl6040: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/77ba4640cc1564f29b280040b312688b79039c4c
[09/12] gpio: twl6040: set line value in .direction_out()
        https://git.kernel.org/brgl/linux/c/79880eba2c0feed895e6d2aa8f7e5489d113d653
[10/12] gpio: uniphier: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/42fbbe31634d116a7f6bee75c0ae455bf10a7737
[11/12] gpio: viperboard: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/55e2d1eec110f1278324882714b64465e4e58ced
[12/12] gpio: virtio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e502df58b5e3767c00e887744b6eff43b7fde3ea

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

