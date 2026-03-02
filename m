Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAE2EA4E04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ul0BAHqDWT9y7Lf0RPxXAyGsoPR4fTjyzeIz9cGYc/4=; b=Us7zOtL05hzVBGtpN++CsaxtQ/
	PEl54bim4/+UHphUniyFf+oTMxGFbLLmIb1c4LuhOpyJwK8tURlWfjBPres2YPdgdUkifwwqr7PjL
	qZQnXunNT3tjx3ROeFR0YechiLfekOVbrw+wdOesCDmQVYXrn9ua/gVd7yV9Y88VRjZSDsSctX+1U
	pzskA3MBsI//iQPqFh0JJx2Gkzzkm6PzhPLATuePM3VzYehczkvkj5AdSGiwg+LBnaO+Z8gJlIkw9
	J7je7IQabW75DsTzliYwL3nvTjALwFYOExURmi9Zfr4YtCFBVz0TFnRPQcYEC6ZVGY52/JwdETkiG
	wM0o2Qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4XP-0000000DGIf-43Pz;
	Mon, 02 Mar 2026 14:46:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4XO-0000000DGIT-1G6g;
	Mon, 02 Mar 2026 14:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78DE160008;
	Mon,  2 Mar 2026 14:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF46C2BC87;
	Mon,  2 Mar 2026 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462781;
	bh=m1vFph3OdU2InVKwuqLjx2hbi4olnyABK+OIwFM5rrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r/sCJFaIGbpNGX+Hg9IcWeea6/9YRLmXcuJ8RBXsGNhyAKotavjQ/lcTkn9ZA3CNS
	 znjigIM1owzvVaOsd3sCc2IgDVG6oQlKhFW7cw0DuQCKtiDa9I4b5UCbDPZOzvap6e
	 jsWU6USqc8eoU3q4i3xiTuriQjrCgFlvVeLEyyiKnuJoYqXdIIo4t9D6WbNvqeDlJa
	 Dzzm+vWFjIRk4xazyJXjbu29vzt0HELppGqag6xuanHtU+vXqRIUvTSjHZZyL5HyIv
	 v0lwM+ECbNykfcFS2DBweAYosKKoJcbeQywEzobiIQOxwhyOrFockUBV+GdPBJPvjS
	 dhx88c2b1BIXw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260223-mt6363-v1-1-c99a2e8ac621@gmail.com>
References: <20260223-mt6363-v1-1-c99a2e8ac621@gmail.com>
Subject: Re: [PATCH] regulator: mt6363: Fix incorrect and redundant IRQ
 disposal in probe
Message-Id: <177246277958.202807.7465555858082044279.b4-ty@kernel.org>
Date: Mon, 02 Mar 2026 14:46:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1
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

On Mon, 23 Feb 2026 02:24:34 +0800, Felix Gu wrote:
> In mt6363_regulator_probe(), devm_add_action_or_reset() is used to
> automatically dispose of the IRQ mapping if the probe fails or the
> device is removed.
> 
> The manual call to irq_dispose_mapping() in the error path was redundant
> as the reset action already triggers mt6363_irq_remove(). Furthermore,
> the manual call incorrectly passed the hardware IRQ number (info->hwirq)
> instead of the virtual IRQ mapping (info->virq).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6363: Fix incorrect and redundant IRQ disposal in probe
      commit: 23942b71f07cc99e39d9216a5b370df494759d8c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


