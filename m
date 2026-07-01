Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1523AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKVQLAIpJBqpULw36UA4BMH9WLN/5GXEfLx3U//uxu0=; b=Ham8sv+z8tTKo39Ao1oR9DxW2c
	iqocYfKhZ4k0r0jvY5uEt/QdXH0/Vjp8tNw980swq9BwGMccwHW5I6pi6mKlYP8nY+bI6AsANZDJv
	zBPafgCwjTRrintaKU81pRzErDft/v5QgrVJnoz0wY8KSKDJquwYLodFvcxJfJ303B1pQg5nE3Inn
	5uI3Jsuu+nAql6y3f7XDt/YBdaDVskAYy7gVgVcnWGtdoVhomjZqB3C9gXhn+D7RM4clkhSOZiEe1
	t7Y6C96773anBwdBviB8XZnBAbPlJfEBdlO6kgGQitPb85ctRpQoZzrLlPzJfYNXXYBJq3T/9mFn0
	CuhHEcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezER-00000002m0S-19o6;
	Wed, 01 Jul 2026 18:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wezEP-00000002m08-31p4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 18:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD2A56001D;
	Wed,  1 Jul 2026 18:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF52D1F000E9;
	Wed,  1 Jul 2026 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782928815;
	bh=IKVQLAIpJBqpULw36UA4BMH9WLN/5GXEfLx3U//uxu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DPquNYnqFVNYTSn3zrpf/OpIxbIMGloGzttGIlxPtmUty9+qU68cpnMwHuSOtdX5V
	 Lc710+E6btaik5PG3QKbgUrSigED5ZB+SX+3t/YugZikh1chuFY9sviEdveOybqcR5
	 JfZYj+o5CDf66Xr8YI6EswrVAksZN/ul9qukz488X0CTMaSnAQvl7aZvZq9fQQBxKh
	 4VxrPJ/MSaCqS/8PhgIF7et/OfwzwuwzHpgSUisRRK+NR2cRE/63PKZPRk90Wr4d5x
	 ZG9A+QjgW646Ur9Cc2XxGoe8vGGERn/LYzkosD9uGMzSUvJeXYau9QP/ffh79Gl7jl
	 s++P6qsJ2SiJw==
Date: Wed, 1 Jul 2026 19:00:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 0/2] add mcf54415 DAC driver
Message-ID: <20260701190009.04cff040@jic23-huawei>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 01 Jul 2026 16:17:22 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
Applied patch 1 to the testing branch of iio.git.

Thanks,

Jonathan

