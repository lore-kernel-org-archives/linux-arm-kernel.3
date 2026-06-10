Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AXF4TiGWRD9gssnSZPpvDBAiuDASCdIK20Xtb8YYC4=; b=mMTGGNrpzAb2zKZtNb2hzjNsx7
	u+JQUvTf/qrftrTWbenpEeIHqZvyg4ZC/gpoSXGfuPTMvd9ZgyD+G0Uo0Bmu7zJS4+YKhgafshKno
	BhWd5MI/wqMDJ8gw7Q2AqYT7ZOduAvJ7nZWm8QZ6krNoyM9VAfmlT3KJRfW3oLa2eSYwicOgptHvL
	FoIl6ooWam9EoUXre+WOELTpSMigdpxdnOIEzQ6TT49Ieew2COCtg8zXgYVYSqT7df14NHA0xhzbr
	m+daniY/naymi5biSzZhpx55BeAeEHYaDhW6adXw1utDD/cE/11YASDMklPyrEccJ3ftEecqGggBE
	GGilw7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJQf-00000007p0r-1AoF;
	Wed, 10 Jun 2026 13:57:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJQd-00000007p0b-1OaB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:57:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B05B5600AB;
	Wed, 10 Jun 2026 13:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EEA1F00898;
	Wed, 10 Jun 2026 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099830;
	bh=4AXF4TiGWRD9gssnSZPpvDBAiuDASCdIK20Xtb8YYC4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fmcQeluZlsBtVz47/xZCWVIIkhZfpEfMjEEBzMF76HjuDdKXVrOTNK2T1Sy/mH/v5
	 +I0DkJF/IXCa92wEUJ2N5CLYu343kBcAh2o6QrOZdYUDdgM7TMpj1li679igMb1AbM
	 W41jHIw1ozr0CYgwiJWPJ6zyhwVjrlKok3rBsrXMzydjS7qJav2BTflUeJbTH/nGGp
	 e5mHSf6XkdN9f9jFYiKOTUfqbZ7IU3dcFqJamfmcf3U7r0pqrEg/2Es+i44mLvhjl2
	 DwSM34f/kkQs3RcgfQbI57SYKWmk2lel1vjj/2WAZ6JLDTS2q9/0UuaNztIR1H4Azn
	 HwERQ5H1kr8vw==
Date: Wed, 10 Jun 2026 22:57:05 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: Mark Brown <broonie@kernel.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sangyun
 Kim <sangyun.kim@snu.ac.kr>, Kyungwook Boo <bookyungwook@gmail.com>
Subject: Re: spi: uniphier: KASAN wild-memory-access in complete() on early
 IRQ
Message-Id: <20260610225705.37b09a7f876e5ba07757377a@kernel.org>
In-Reply-To: <20260610115622.773149-1-jjy600901@snu.ac.kr>
References: <20260610115622.773149-1-jjy600901@snu.ac.kr>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 10 Jun 2026 20:56:21 +0900
Jaeyoung Chung <jjy600901@snu.ac.kr> wrote:

> Hi,
> 
> uniphier_spi_probe() in drivers/spi/spi-uniphier.c registers the
> interrupt handler uniphier_spi_handler() with devm_request_irq() before
> it initializes priv->xfer_done with init_completion(). If an interrupt
> arrives after devm_request_irq() and before init_completion(), the
> handler calls complete() on an uninitialized completion, causing a
> kernel panic.
> 
> The probe path, in uniphier_spi_probe():
> 
>     host = spi_alloc_host(&pdev->dev, sizeof(*priv)); /* priv kzalloc-zeroed */
>     ...
>     ret = devm_request_irq(&pdev->dev, irq, uniphier_spi_handler,
>                            0, "uniphier-spi", priv);  /* register handler */
>     ...
>     init_completion(&priv->xfer_done);                /* initialize completion */
> 
> The interrupt handler uniphier_spi_handler() calls complete() on its
> done path:
> 
>     done:
>         complete(&priv->xfer_done);
> 
> If the device raises an interrupt before init_completion() runs,
> complete() acquires the uninitialized wait.lock and walks the zeroed
> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
> return false, so swake_up_locked() dereferences a NULL list entry,
> triggering a KASAN wild-memory-access.
> 
> Suggested fix: move init_completion(&priv->xfer_done) above
> devm_request_irq(), so the completion is valid before the handler can run.
> 
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>
> 

Good catch! All resources used by a callback, should be initialized before
registering it.
Kinihiko, can you fix it by reordering the initialization?

Thank you, 

> Thanks,
> Jaeyoung Chung


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

