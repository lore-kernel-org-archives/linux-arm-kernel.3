Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9CAD232D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYsJsSaR8Z3tmRCU4nljO0csrE9Ejc+yAdQdvP2d54o=; b=Cf5mBygM3hOWgEoHT9J0QW3SOz
	AWqBNCTvu6UZIZQsZqTfK0jjAs9k9p58yAkTHHNa3xPFC1wwpRuaa3VyOUQo0by2jf7/AqE6LGVsA
	7PtrGIDfvr+GePF0mpGCdH6UcJHdF0x9E1jRnAPm+NF15hzTs2ETWJ1gS8aIO/8LN5U9r7WKoa/tm
	tNp1RwLBHhSW/u+SuXxLC2hxz2SHmowy1MMogCc75Q+TwmMIVIxrVwb14BWTfxMKiIipsIREZny0I
	RgVepDWC8CILXjBNCGp+NvL4XMHWJPQDYxnUAiSLWs+SEdVE+aSTJ/HSQDqUiFBc3qMW/oU99IvE+
	4j0sqDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfERS-000000056C3-47hT;
	Mon, 12 Jan 2026 09:42:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfERP-000000056Bh-1JrR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A8E4430B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CA8C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768210946;
	bh=lmEIHgZZMTtEfgTs7wp1ji1qT8knJHXi6qHATGkhWmA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=HnImlPhoaCFm2bISOyjk88a4CVqpbY3KWNbeZ3jFsnwgJPxD/5yf8LKOE38hrbibO
	 zgkMRC8nsEyxceiqeSkSyZq5vlm5EDaJ8xd9/bwLJjr9HQaZ9IcoT+smpl9lrNd32F
	 jFg+KqRdPkbD68wxqM7He0GD2Yk5LK0xoMg56h1VQAuWYTQYDHDKE4NlO7B4AlSkX5
	 hdhrthHslcOMJoMC9gnM+JIIgWOhQ5AMCElOMJ4MIHmQFmijJCKn4x993YqeWj2oPn
	 SlueuNJiYUzfsLnMOFHVMEaOQV5KfgwoqDUGqBeXL2rTdx6cm/gi3QkSqA8yL3427e
	 tjt+tDhjcQ5+Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f9211cbfso58981551fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuPw0H6lkQGdfl+qyThjRKxRr2q9a9Uq+IdPIUreYIBF8ARnYnqmswCtO//d7ejXzk8xLpxToUaTFIvcOfCcKt@lists.infradead.org
X-Gm-Message-State: AOJu0YycSSceljgtauoYB7jqtoThNPbWN2Gl9j9L7smyRxxop7Cd4eMm
	RXako++AJtFSdle0DuzBTc4qya3PXWSmN//SFITVTvPRZpqySuD6mROnFqTsct4eb997/a/8gaz
	hgQQiWMna+bY7RLQip2G/c2uQ6tZ/sX5T2jF/2Bf6Dg==
X-Google-Smtp-Source: AGHT+IEtDU+WBNOMzPFWFYbdDtZdfSoBBnPH4bow2OTLMBFEfML1j35lhmcFxxrqS3oiMugmPR15HNq83oUCcqNtA9M=
X-Received: by 2002:a2e:b88f:0:b0:37b:b00b:79a2 with SMTP id
 38308e7fff4ca-382ff688d40mr47968331fa.3.1768210945088; Mon, 12 Jan 2026
 01:42:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Jan 2026 04:42:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Jan 2026 04:42:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
MIME-Version: 1.0
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
Date: Mon, 12 Jan 2026 04:42:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeBdpYHAxSL89t+EajJVks5Q=NxWzuBpM4gCCtBViqJ=A@mail.gmail.com>
X-Gm-Features: AZwV_Qjtecxh9G9cjaV0tjKCB1xKJ7hY_aonWV0TTWc2GDEruWoxCMny_Vcm7M4
Message-ID: <CAMRc=MeBdpYHAxSL89t+EajJVks5Q=NxWzuBpM4gCCtBViqJ=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
To: Linus Walleij <linusw@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_014227_395095_AE859D18 
X-CRM114-Status: GOOD (  15.62  )
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

On Sun, 11 Jan 2026 21:29:20 +0100, Linus Walleij <linusw@kernel.org> said:
> This fixes some uses of the "unsigned" type to "unsigned int"
> then propose to implement the .function_is_gpio() callback.
>
> The Apple pin control maintainers can comment on this: I
> am not sure that "mode 0" is GPIO on this hardware but I
> find it likely.
>
> Toggling a pin between a certain function mode and GPIO
> mode happens on any sufficiently advanced system sooner or
> later and this callback was implemented because Qualcomm
> ran into it, so let's add it to the Apple driver before
> the users turn up.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (2):
>       pinctrl: apple: Use unsigned int instead of unsigned
>       RFC: pinctrl: apple: Implement GPIO func check callback
>
>  drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260111-apple-req-gpio-func-3010ca45a118
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

