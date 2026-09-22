Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA26FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSepEe8gJ5V9PTOvT2CU7X853Enuy+dQkLPVUAgV/zM=; b=JeqP6rB1cRaeqMJCUuid2uvh1h
	EBNwH2+vlN6vtSQLn+g4O0hmytIrRWHwwRnhbuJpNjQffXtt4h7ahEy3zOzDq2VuGgyKmvSi315AF
	jKeWJ0vX1eWOqiWLOZfKI8IXu0wLL3LD3CQ2PD8peRYDHfe8Ol0QvZNcckEARr2F/Cv1DNZI/hdB9
	GQFVBSSOiMoier3FDbm0IgrfY8fSeHi5X8WMn750fXZMPUm6ZYBZLHbDP8pgX5Gpoqfe8z6F18VsX
	yQogibdqw+t1NzA90MU7o3Jv5hMvZloZHjRppRXXqgXn2SGXMZs6cjfy1Mz5sjGs7nQ4/VW4E/94o
	PsFoG2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ynK-00000005Bg4-3r1d;
	Tue, 22 Sep 2026 11:36:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ynJ-00000005BfX-3ezI;
	Tue, 22 Sep 2026 11:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E76A460DE9;
	Tue, 22 Sep 2026 11:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80681F00893;
	Tue, 22 Sep 2026 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076976;
	bh=TSepEe8gJ5V9PTOvT2CU7X853Enuy+dQkLPVUAgV/zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOz7HibIFdheMN/q4+NYcN2EVOdq4KZAhUqJR4qXWTSSriVa0LwVfRGcSIYB1O6N+
	 bBzOY1zPRlv2VQT6RjL2gDelowLsMgwTAkLxui6wX7jc8G+um0oz4R+dpUp79IvDLl
	 xq5XBFYqNDp3ffnaCAI7NZbkmWzXGEOJXTrhI08t6tuRdYFrGoZaHJZUSpn+G9/3ML
	 7834fV6oXKNvPLgVDQuqiHcrOCribPTTPi3RKbXO1/zu1KhjPHbO1qDlFVKPgAti2v
	 3bpt/cozM2iK8deadZJAITpRm67wTqnjUSiG4OyhUc+bch1ekNhw4TUxfw20llgWr8
	 gB4YUB25OsbVQ==
Date: Tue, 22 Sep 2026 12:36:11 +0100
From: Lee Jones <lee@kernel.org>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260922113611.GB3277918@google.com>
References: <20260911081022.3475479-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911081022.3475479-1-triet.hoang.dev@gmail.com>
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

On Fri, 11 Sep 2026, Triet Hoang wrote:

> Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr().
> 
> This allows us to drop the __maybe_unused annotations from PM callbacks.
> This is a straightforward cleanup with no functional change intended.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
> Changes in v2:
> - Change commit message prefix from "drivers/mfd: " to "mfd: ".
> - Wrap to 75 ish chars for commit messages.
> 
> Link to v1: https://lore.kernel.org/all/20260821092508.324787-1-triet.hoang.dev@gmail.com/
> Link to v2: https://lore.kernel.org/all/20260829050228.42638-1-triet.hoang.dev@gmail.com/
> ---
>  drivers/mfd/iqs62x.c           | 8 ++++----
>  drivers/mfd/max77843.c         | 8 ++++----
>  drivers/mfd/mt6360-core.c      | 8 ++++----
>  drivers/mfd/rk8xx-i2c.c        | 4 ++--
>  drivers/mfd/rn5t618.c          | 8 ++++----
>  drivers/mfd/ti_am335x_tscadc.c | 8 ++++----
>  drivers/mfd/tps6586x.c         | 8 ++++----
>  drivers/mfd/twl-core.c         | 8 ++++----
>  8 files changed, 30 insertions(+), 30 deletions(-)

Already applied.

-- 
Lee Jones

