Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377F3CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Xsowmeu2RyzTVACoqAzvMX79fACSIN87yT/5+JNn24=; b=m1LxNwKlFQIb49+nUAbcAOk4lU
	4JYpSB8mVH9Lyn/frpBKOBNiyY/dncYMlxEAGpUBdZuiFRGuPQEnLqA9B7xi2+NcRJWX1GdWIE/mM
	+vItR4FLoCppx2ZcO8uGS62xsBbahapSO6+KV8vEeyTkFOJKR89eWWFG8iVGo/61RWmR9befEGM2h
	kDUZF/bOxWRZxHdyJ5rvRCc0n5PtQ2iNYsW4kaHGEkjfE4btXSk6Y4Vj2VS/vthwrFJ+UdWkm1vMH
	NZtSHJ6aV9dE7skMoFr+fXGhoXAvlD8QFIwPiTeNdcNtwNb5PG6lrTAvmmGhu7sbEEId1f2yKLJ7o
	DaoK1FdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWt1-0000000EfSw-1ajh;
	Mon, 11 May 2026 20:05:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWt0-0000000EfSm-0vAY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 990AD60103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5237AC2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529953;
	bh=2Xsowmeu2RyzTVACoqAzvMX79fACSIN87yT/5+JNn24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ut/rzfkEkxSQVJ7hvg2gtO6RIoATawPoLO/LzBoFHk1N3oMedL7fWii5dcdw9dz6b
	 J51kg8bIAGfkyUvBmduu7zpL6FKRE22Zr5QsHn0BtEZuGshRBbXLv4WjMdSyPQdgvT
	 OeUDgJMgA6DsdYZ6YEhEPRHYYZwa2AfkpN7bzsR/7JFLpnRpYi+d/cb1PIJLY3GHyh
	 MBH5LsH/Lzfd+LeqmNU8AltNw/bYfFNBtt2l2tdwqYTmwEJ0LUQviIEL85TuVwcSD3
	 IMsYVCZPvqM40y1b0nOdlDeeJZc21FPfsYORXiFvbLkRXG5T45nHZjowBSW7dDVu6R
	 ayQ8YXFRatRbA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2792375e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/obLlV86HM/YAbyYcVFiT7tnsVmWVQok0DgzfxtauJYZJcWuCcXxI3zx2oEiJcMK+K9biAjA0Tv14kyeCJztsJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzzrmT8hUESUwP8hOqC6Up3E240Qzg6XM1RK3qBJf3yjRR1auQZ
	XXD5RskIE8DHvky/xJvUXr1XwxFBWQvCFwd94lvwLRJYETMjMVOc3C6YFkq2eXcgjEbb/pVp14B
	zlYHvO3DpmEyBq9UFcBKLNJxvl1XM6rk=
X-Received: by 2002:a05:6512:4008:b0:5a8:80ce:ba55 with SMTP id
 2adb3069b0e04-5a887ae1e90mr8495895e87.11.1778529952053; Mon, 11 May 2026
 13:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:05:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJn9MOrsF0EPte26ZVbwVWHGuubqmTpss5D6Ep7kAY9A@mail.gmail.com>
X-Gm-Features: AVHnY4IWb6Oao5TaGJ75WC2JjZJs_EcccJqTLmElh9HpaEFa4BQJq1a2vLp7XN0
Message-ID: <CAD++jLnJn9MOrsF0EPte26ZVbwVWHGuubqmTpss5D6Ep7kAY9A@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] pinctrl: aspeed: Add AST2700 SoC0 support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, May 6, 2026 at 10:12=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> AST2700 is composed of two interconnected SoC instances, each providing
> its own pin control hardware. This series introduces bindings describing
> the AST2700 pinctrl architecture and adds pinctrl driver support for the
> SoC0 instance.
>
> The bindings document the AST2700 dual-SoC design and follow common
> pinctrl conventions, while the SoC0 driver implementation builds upon
> the existing ASPEED pinctrl infrastructure.

Patch applied!

Yours,
Linus Walleij

