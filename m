Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynSkEEn2AayaVItGbc0pik8ORE0zJfA+LwEibXbCBjk=; b=aA79pDAon2hn3eJ2wxiSyzjWOQ
	9twsPnOuvP1qWHRe82tv46AfWoXo3KFPQGw/tB9omwe0JUIht7y4PRV9tt6VM/HXnvTYPlhOn+UMJ
	0I74FSVJc98wAl+miNeq5tbFEDnIgETc0rbaZSSF7P/ZtbhHFJ6kG0l9nMO3YDb8jBksg9n9h/mp+
	/dBRu6gYii5xWxojIt+WZ9n+lFeEjYZthxe57N7WrU5/Nc5JumGkCfS6vjnql99PtoXC5SA/GH+Hk
	tOUwstKtfmR0vMhU0Rqeh+RptmmF9Bv8+eV3Q6UdndEQvy79Gzifq/Sl5ZPx8QG7LZEZ9FwceKJiP
	HlE4RkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Un4-00000002MnM-3wmN;
	Fri, 04 Sep 2026 14:21:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Un2-00000002Mma-1zLF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:21:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED3ED1A19AD;
	Fri,  4 Sep 2026 14:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE0176057F;
	Fri,  4 Sep 2026 14:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76F4511C7ADF4;
	Fri,  4 Sep 2026 16:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788531667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ynSkEEn2AayaVItGbc0pik8ORE0zJfA+LwEibXbCBjk=;
	b=tHBUi/AGMm8DW2aVTEPEjh48i2U9lZ+F9u0U7awvVM3b9eUzHau8rUOJDEyO7kXM/woCVk
	PrgTmCiux/8t5NnxUeDY//FeilfLK5UjQsU8u3QI7m+QMgDvqWQh5hJLWSsL9E/x3XpyVt
	E/wph6bV7nqz/KLHj6NxHgBcdbEOas6kYHBWi/lmH3nYSK1gXc8Uz/4NTNV6pNJ8nuJ8Xc
	y3myPHp6pUCithVWKI+haBsrYyergxoSzlvQbElztJ0CxSXWy0gOaQkN9IIj5azx3rCnZd
	2B55e+VKFzjR5LzIFyYT4Sri/8hSDBq3m6Sotyb1w811kihV5CUo8NvzgrQ7gA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Brian Masney
 <bmasney@redhat.com>,  Richard Cochran <richardcochran@gmail.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
In-Reply-To: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
	(Miquel Raynal's message of "Thu, 13 Aug 2026 09:28:10 +0200")
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 16:21:01 +0200
Message-ID: <874ig52j3m.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_072112_644138_92B221E3 
X-CRM114-Status: UNSURE (   7.45  )
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

Hello,

> Instead of declaring the parents in the clk_parent_data structure, use
> the actual HW clocks to lookup the parents directly: parents are
> described by an array of indices into the controller's main clock table
> (like in other clock controller drivers), which the "new" mux helper now
> resolves.

Sashiko complained about this:

```
[Severity: High]
Could this lead to a kernel panic if a parent clock registration fails?

Looking deeper, from my point of view the issue is purely
theoretical. The only possibility is one of the early registration
returning -ENOMEM. Despite the fact that this is quite hard to actually
reach, if someone gets this kind of issue early at boot, they will
likely have bigger concerns than their peripheral clocks not being
reachable.
```

Brian, Shan-Chun, Stephen, what do you think? Is this worth another
version?

I can send a v2, or make a follow-up, or just ignore
it. ma35d1_reg_clk_pll() and ma35d1_reg_adc_clkdiv() are equally
"affected".

Thanks for the feedback,
Miqu=C3=A8l

