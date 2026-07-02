Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2006C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=; b=Ssxmvszp/dZ5Z+
	JImM5KaP18YrxXpXN2miPGRRenKt2FpGxcZlrC4JKf0Lwd306f8mP4zLQ19CghQLNNHmuZr6HF6sb
	CCOBj2M9FF/gA0zYC83q5w/ORHvUo5TuQBex0NCYa5tHNK8pBmjnmWKr7YkK83lXxC+g6I+tXDrPG
	PQSKRD9AtSl7os9uZa0oH4FqOK1r9UcvqoCxfokcwxLsZUSu895QO5c/ltTRb4IJxY3UQ1Ytyy4PC
	TJkfY0uAZM0u7f0LxT5onvFvx83KXF39ZRLIfHOkBsYXtW4siL5DyVjTisY2kmBw4wbHg5tTSs9Zj
	S4oP+Tlye51rEIfcY+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHO4-00000004VsD-1iy5;
	Thu, 02 Jul 2026 13:23:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHO3-00000004Vs5-3GSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:23:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44F92434AC
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290751F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998606;
	bh=O/+xDYMCTDVOyhlY3bdOgfogvDZjRIBQUbYt9QjBRk0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lqbaxj3f3sxqz5zXLRjl2SjXgVF2ARha+OAma9+j1biQ+VwgoG5UBa4YwqGIrw3uS
	 1qXzdt/kY8BGNTq0nRffGkovhq/FPQcFGuitj/QOQh4EVlvdOZjtgdCwAMXR3crPKv
	 a9p3F2iAwPgNyMfH9exKu+FoPlltpsyR9b9tti3TCPhqnPtCTm3FBQ4s0qsXadd0xT
	 Yy0vWhz0rVsw4Hnhvys4WT4ssEcGUKzRkUD0kWUCf4Vd1poFUxp4OZI0dSRrN36wIG
	 WSKkFehInXE4OnsbaDnNoqkgYFelTo+mIqZMKTkCgNTC+Qjl40HI5eZ7o/QPdhhjNJ
	 hc25E3eOqDpOg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b1eb7bde5so15597011fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 06:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqxdtPTKt0kg0iqqAH2iML8cZ2DPjNGwWJCKGGiDj/G7WXvGmzew7nNfSQ6r7jzR+frlozor3Al4xqAcXgTGrkb@lists.infradead.org
X-Gm-Message-State: AOJu0YxszGgxSJPDozq4tq9VQoE8hiSJVOtp/lxGnaGcLCuOPULs0MD1
	no6d3s8I76PP/NpMM9O856KgG6FA1Xp0F5rniUB+w3wOrrCH6tBl5x1Zaa1CadOrVgF1LWLvOdh
	GcrzIiAcIYiIakJ7hQ/MW9T6dfXpwOao=
X-Received: by 2002:a05:651c:993:b0:39b:4231:8b85 with SMTP id
 38308e7fff4ca-39b42318d0dmr2458931fa.40.1782998604620; Thu, 02 Jul 2026
 06:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-3-eb2580374de6@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 2 Jul 2026 21:23:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
X-Gm-Features: AVVi8CeV6-IjWgsA2LmKA_98iO6chNHg3C1q7oOyJiDDAU0-Mdj71gMQi3ZmkpE
Message-ID: <CAGb2v66KapepNOPf7ef5dd_AqDQdVBo-cFOJrR_Deu0zA0xWaQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] clk: sunxi-ng: fix ccu probe clock unregister on error
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2026 at 4:10=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
> and the number of hw clocks might be different, eventhough they usually a=
re
> the same.
>
> If they are different, it could lead to out-of-bound access or registered
> clock left behind on error.
>
> Use a different variable when iterating on hw clocks so every registered
> clock, and only those, gets unregistered on error.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel=
.org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

