Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AFDE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbW+PaUOzCwCbF61CRYPi7XMG3ao6Wxw90lcjAtKDFs=; b=1eno8o0FTAA2Si
	Bo169iESDaB4YyNAW8YhV3V7zF5pq+2+ec2JUjdZ1HFwG0OdoCnsPcjizd2sC+bDZbKV5vkSIcpJf
	S4nUKKhvfWrqqI/3AkdV9tdZS1eOY1SWlY3u9z6/9Bfi+OzcfFJe1ppVcT9hSM6SqHHenLFBaYJLX
	WqawQu5Lm+/FpbBGBKdWNLL4clS4HX+HFXB/VGWJSzwzoSJ8ODfmGyRgkEeHaYtDLfwXPalOY6WJG
	lcBXMJNPKpWJYUlabH6bR/dPpRnN2hV6uyCpx1f8HhUZ8bQCLBYUFixxXZeSf4/pkO+9B9eXXqPWD
	ajHYtggAcdMBrg9ZDyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjnb-00000007c2u-2kNn;
	Sun, 15 Dec 2024 08:16:23 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjmW-00000007bxn-2exY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 08:15:18 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so4538430e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 00:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734250513; x=1734855313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbW+PaUOzCwCbF61CRYPi7XMG3ao6Wxw90lcjAtKDFs=;
        b=hSu7YNXRyJHbidfiLTE8AHsI/dsuNGtUVdYUIr6i31riq5T91QZWIl5xlUYGTdwueW
         1FngaDr/EofVT3Hl5ljlFAiW7uGpgEV6hPd7iVDYGTs82MahuK9CDGqn2wcWRvsRQA6D
         Y1ktyY1eeiZCtK/jmmcqYe6/qpb5UWtpXI34l1hzzRfCwYByYpNRpa9SN67Ii3Zahg8O
         9wtxgTQbsQYMxSSxHFyuaqInzH1hFD5gZzXh/zm9jjNvmVCfo8pdkppTDVU17aLPPeRf
         uC2puhyBDClwwhbhmrgZLSh4/OAeBTnXyW/1A6B9e5qCwECDVoYHExX3NJfmLOcVDMSv
         BSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDIQf8IyCoSTpJdIOrwgn29PqDYjQi8X6EK+SKvzrNTyrUVhl8WbGlDmPHjv+G0TMQpDlZpiF2dbmJKZ0gORe7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdzq9gb81kkSH6/FShZ0uww3GTf5YY59ZZErMiSzQlmX+8F4v+
	rLu5I8uugoR60tfrOYcAQduN6VAwMPLYcklicAezemWBfS2TNiXKrJpMxYD5
X-Gm-Gg: ASbGncsqWblg+gBy0n9FmLMMP6NcjnFs9CXLEk+nRnzkywt7zrYEuvUbi0LjLsYpa5e
	GqqhrS6FcsMtMRgNEQhyC1Y8XbPWeXiWmbkVJOyo2jHWRj2sXyh6Z7FGlSRXeqgZgF9Q3Gm4isT
	HI6DwhN8gT65emOL3EZtAwh5HqschrfNEyCpZcLnu6fDMt9/XyFn27GtKemvTv6/xobQvqi1ivx
	Pu3F0cB2UygLY/2Czwq6aw03dPeumpZmOLd0LFgYK9nSUZfTsNe+vMzvzyJ49O1Dnbz1gkcOyds
	heYJzANoUgAwnw==
X-Google-Smtp-Source: AGHT+IEa2RJmDacWg0M2DcZqDgU2CXod1PSS2OJDwNsZmgY4Pt2aZ3ohxE+VIsuPgjUm1zpxXRsfsw==
X-Received: by 2002:a05:6512:2808:b0:53e:3a43:9245 with SMTP id 2adb3069b0e04-540905680d8mr2639412e87.28.1734250512364;
        Sun, 15 Dec 2024 00:15:12 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa89esm442750e87.111.2024.12.15.00.15.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 00:15:12 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30037784fceso30402721fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Dec 2024 00:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP0aWBp8ZB9GTUBtqNALOwaEfZsgTyQxikRpvzG6y6THf65dukwrTZLxV7eSOoShRNylIxlxCrisz1pvGpO1i6@lists.infradead.org
X-Received: by 2002:a05:651c:198b:b0:300:3de4:ff7f with SMTP id
 38308e7fff4ca-3025456691dmr30121161fa.6.1734250511023; Sun, 15 Dec 2024
 00:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com>
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 15 Dec 2024 16:14:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v65odTCjkC493e=q57ikeKHWrKYS26N7-0Hjc=S_d6ELyQ@mail.gmail.com>
Message-ID: <CAGb2v65odTCjkC493e=q57ikeKHWrKYS26N7-0Hjc=S_d6ELyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_001516_675196_E997F885 
X-CRM114-Status: GOOD (  16.07  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 15, 2024 at 1:36=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux"),
> TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
> video output on Pinebook.
>
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment cle=
arly
> showed that whenever PLL_MIPI is selected as TCON0 clock parent, the vide=
o
> output stops working.
>
> To fix the issue, I partially reverted mentioned commit and added explici=
t
> TCON0 clock parent assignment to device tree. By default, it will be
> PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
> override it in their dts.
>
> Vasily Khoruzhick (3):
>   dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
>   arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

Looks good to me.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I'll wait for a bit for Andre to comment.

>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
>  6 files changed, 8 insertions(+), 13 deletions(-)
>
> --
> 2.47.1
>

