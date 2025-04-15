Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=; b=4UoAQ3P95qUVU1APMsDYybd0vx
	tr6xXTjhHkFFB0VNC/WD0C9EVDtvaNI/Lh1wSIeZYEM3qSfuLXehgeAIxuP4DIZr30nkpfSEct2us
	VKePLUpNDJiAypei56mCzeH4TIDxnlK4NV/MQGh+0iq8eo14wvqLc1GiOd+mDrmFirppraCMWy0tf
	FZHqqBLbd+80QRLaj+b9pAGkThPq9QBE7TbM1+zeNodpkujwGpoxB649NLEfUXPFc3w2bPyEIqoI9
	F4xDTw4qlBAjM9iYaaX3Os/LHIqyqobooM94fCfV6PTe+dIPlzpfURW+23anl10y1KFsdwr3i5n0K
	oiPb3Wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bY5-00000004yDN-1vmh;
	Tue, 15 Apr 2025 08:21:41 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bMR-00000004wCB-06O4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:09:40 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549b116321aso6145214e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704577; x=1745309377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=whT6K3uRrPxXhBSoMwFk/CW62Q9HZOYbqE1Iy1N3r5lKaL052X4eA7bXmnYD6yei6M
         HJdqgwf0x+aAO/uJ4ZmuhflqrJr+aTqQy89lcj49RkDOxBVWZFPUQ1OzVaJ6jKXqZNAA
         jgahnqJG7noR6kUBHmHeFBtt69EvY4E4DFb2EFOxPe7NCP0TV/IKufjJmuG1z3ZoF8yE
         XrSWM5zOrlbfi+PrYchYsDD5Icos0uk8CUKyy8KrEK2p0SzdDIubqj3tiSFlUBy1axzE
         VBsxH63ssJQ7L2ByyGRo7ERLgu5HcA2L8ZQBsB0H8NRkAai3uJSSnBVraDw7o4d80nv/
         MJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704577; x=1745309377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=aQs1eC4K2B151JIqL22w0r+MQeRUhyavvAef4Ko7jxloAqQ14qeWY6NzCBzfYeM6uY
         F8Sjjey+V/N5o2m8QF9UtzVW6kSfaZt5gOdeZ7kqmnSX2ZhuSuBp7suxYzAkq9hJor9L
         /vLi51FBkikAVFoBsAL/V5/s0xUHlNCWqDbLmvwWxXNVu09B4pgMYOJEYmJeuS1e4CB9
         C9NBLgaTKYuZoLgd6h3zH4DnT9doz3XOdXWPGwAM2zun+m094VJ7/6mdVV3PEhMxP2yF
         tmBKW8SxNN/qgOTSDLWLfXrFQ2NiG5o+C92iSUU20ztBj09UCXtn4Hc4KyTw24RXJqhr
         h14Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUT7gBpGtXrEXZkyIDc9DvC/w7YAvsFypgS3qPOWTKdlDmWJ2WH4L7TIwwSI6SGqRDZh6KOeA2zrnFZtda3GVP@lists.infradead.org
X-Gm-Message-State: AOJu0YwOBF18ZNqcY2LZVjUY7GycmYLtBia+V31bMG0FUHOfIdSMtNLK
	7HR7nhkDegxuRsjLex+JNW6yihCd/0NP0dsFbYSEw1PRq1UOOKmjwnZo2gRmTOOcsMt9Ufo0WFw
	IbbFanyp2dzF1ttK6BSFbs0/pPbW68td09jlLJg==
X-Gm-Gg: ASbGnctio7xuUd89QCKvIzaTZWFe7bm7LMn3tkgfAAdeGduOkn/uP4zB1Xia/4abjoj
	J75JggtdvZWpQ1DKn15I9+MSlvTMXH9DBneoYWZWDPLsnnQ0B4uBbEI2MeoQcLLl6N/KoQfwQOo
	9FUe28JLmIqB2DagerJozA2Q==
X-Google-Smtp-Source: AGHT+IH0Y4jm0LaYVhqlf4ygy8v6EM0HqVDr1pCml9YV4eSiyilIsQJQAcufVd3/LXkLFdiQwaLxvtXP5qPvFl0mrI0=
X-Received: by 2002:a05:6512:4019:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54d452d692amr4312543e87.53.1744704577064; Tue, 15 Apr 2025
 01:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:26 +0200
X-Gm-Features: ATxdqUHY0rsQZ362mf1eSV0hA552eBY6l9M2A3A0WPZhzC_XlT3-mPSct8oGVPI
Message-ID: <CACRpkdZr-s2sW07M8f-qr6YzRuNxJ_vRE6-kFaXaX7v+3g01FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010939_064408_87D9DC57 
X-CRM114-Status: GOOD (  10.46  )
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

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij

