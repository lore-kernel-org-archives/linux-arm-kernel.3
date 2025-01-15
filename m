Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=; b=nsmxbJFoJXkP9e6f0wahxD/hpU
	+Qjf5Ozk5DTkIs79kBmusepwDKz5XfE9LzeYTHnL4tm7jZaAZawxo5Kv1qzAG3/tuWCbun2dfsF4+
	JIrU12cr/5y0aQ1hovWiunIURTRtC5JvKshiKbzFXvpjzxIuw9HDKYbgQ74h5kWFP1QIvA9QA1qXX
	DxQRMukNwS2k9WQbixaPNpP2jb2aAz97BhltFZYijIqhyEOuMqEu9mlrFKmDVwkzHiGGmqdxD6d7K
	Z1RTTYRFqPqCJ0PmkyYfGHngok33xXJdlA/8hvcu2uZkLja4AdyMMuGoSi5a9tEAElyYK99pBqKz7
	W92vGVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY32X-0000000Buti-0vEI;
	Wed, 15 Jan 2025 13:02:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1wL-0000000BkPk-3czj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:52:07 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30225b2586cso7299451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941924; x=1737546724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
        b=HK6JOuHbnFg1svK0TKaKz0ve6OihaUHDBBcaeLtf0T/vwPn1yDJhlAIcFfEFx1x7uM
         hEhrcnXCSl0fgJ15izlOC1vt087RgDkpql1A745h27PMjUp5IW9pFqliDMykvsZe0B/o
         1wvxdvjv1sh5xRpYibDqHcA9qf2K8ej9al/tBA0yrNTowd7n9bvgxu90XDh8jBbuWcg3
         G/igLSqy7cISDJO83kOWbqgIdHM77Ohx+iYYxSeUdw9spFNS8d9mZ5YFgoJA86w0xEJA
         QubKd2OPlLj7SM+2Gqm7yLFEVMdDkG5xclHmyfRZj6pKo+cbIpKfIHkKqIyIbq7+3Vgg
         +/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941924; x=1737546724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
        b=H+PRzvccQcAQP56+8QJo1GznPY48fntgKtrOoTg7w9jS8OCULF27fKuQjXfIzLsp9r
         j8K8vtWdUq4k6RHaywCwa3bgVupyJ/S/JhMtajrg6YdwZsM+YtDWAFmb8s3Q+8EPhSAk
         LNrTUPKSvBdbw8NfMh7L1wpK5JSTlrprmywK16NpoiokiFOHIh45Jc0s6ZgSqakXMjkv
         3R1RcoW7nhMK9wfWdxny5ngLC/xwNsfbhjezTlLFJ4R+iAuko96aJTPiM6AyQkcvIkQL
         NpxkYsKld1CLAF3ThtAu5sevtTAL6z/fD5RiuEX3Kyg6uychcyx6W3pUhsUtIj02xDZk
         biCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUgxI0194kDfoB4Gu4XAGsj0PasMQUu4b0wAhhHGn9HlS53EUCk0WYYF9a/IEv0XyKo5tSdoSxih0VIBBYBxjr@lists.infradead.org
X-Gm-Message-State: AOJu0YycylVstXpvEkexYTe61t2Liw7gtdwyBF+D59ZDjXqdTZgXFx1k
	9PRzFb/BzDpR6cbg5m97C2/8llSOPFi9lRbl4lKAx/dSClS814R2WKsOxxNplqX5xLfLVwAa7B9
	2hXtd3QdP+Ir9hgEc7UVAdh7FOgRAA8ityIDu/A==
X-Gm-Gg: ASbGncsxu/QsWAXD5WWMbZsOV9ckz16mq6AJDYUcdFEUUXNN6Xo6M57yXNgudymsQW8
	yBqOg/duXElfVQllznM9/KQez9xwUuaHrwerC2g==
X-Google-Smtp-Source: AGHT+IGKcxZyPOd7E7UVx7R0mhE5720LI7mD2xNitAn5d4klzms7tIsW6xzgbwpkS78QWTFRsjjqnZvLe4xu3sB+q9I=
X-Received: by 2002:a05:651c:2226:b0:2fa:d086:bca0 with SMTP id
 38308e7fff4ca-306305b3d9dmr9266981fa.10.1736941924002; Wed, 15 Jan 2025
 03:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:51:52 +0100
X-Gm-Features: AbW1kvZ75WbEH74lqZTgQ1yROwYhyIN7pTh9_hdZdknNaesgXbnLlLUetNHb884
Message-ID: <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Nandor Han <nandor.han@ge.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_035205_919500_DBCEBF5B 
X-CRM114-Status: GOOD (  11.09  )
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

On Tue, Jan 14, 2025 at 8:14=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For a while I was critical about the string helpers but since both Andy
and Krzysztof like them, I will consider myself convinced and start to
like them instead.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

