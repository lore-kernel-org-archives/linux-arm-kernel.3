Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A6CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgWNR/UWl89yBwxnkMpky/KdBM2t+PShu5clbINkwhs=; b=FCQ3ONoy5mVMOhfHZUO8z5xmBM
	HZ0zMIk2L7ivNSLt1UuqyBylNTKwBJR8bmL4O3wyjdHmRE5w9rF9tJtER7sdJM7mjFFvV57f1Wgub
	D+lF2bIXJRJF7L8F7L2oDhQUqBqj9629Z/p7kQ30Iae14BNEcziXPfGVQdyeeoU+RbdzkrkEbtV/e
	5DSK2CS6nAjxS2q9VW4eyIeKGP+aEskiYHAes/V5zSClabizSir3RgNSUdpART3AVMs47Zl/nbYsN
	aZBqJ1m5ai3Ffawj5iuwqJhTxCMt9FZOrLd/GtPnRdgd3bMBhZg2KY2YqhrJYlrdol4iGU3koq58a
	wTC035aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiWg-0000000557o-2rh7;
	Mon, 09 Jun 2025 19:51:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiFb-000000052er-1nJS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 19:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACFE1A4D466;
	Mon,  9 Jun 2025 19:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD30C4CEEB;
	Mon,  9 Jun 2025 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749497622;
	bh=8brKecVuvoIHo4faTS4qU03vkO3sVX0GBCpsE0YwiJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JPHRbBW+6o7hCF/rretPK8Fd8mYgtfSi6r9mEsf5dWETA3XkHy1JsHUG/uPbVpE3q
	 0aAf3FiJU6t+g9pOQNN38isOEIpeAYb8lSvcWfXEhFVC4uMRJMzrdvoZ0wvngkeQwG
	 uumGElx9PT8QlDIRvs2UQI5lmYe9IdyZiSbdjjkaFQuixFyY6CHKNhxBsQwMb9yfus
	 ow653GAYvLvM08es10JOZThS+rghLh2aH6BJRe7ccy1AC25RFtKKb7YJuzS0vcy+gd
	 xO8cX796dvJeDTe1Fl2am8dXeTBaLCrcR2Rftg+bwq0r6eKDaVwLC7aM/RPbv3PABi
	 PrQCoO7AcksUQ==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
Subject: Re: [PATCH v2 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
Message-Id: <174949762071.256775.12630399981085475300.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 20:33:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_123343_536249_8961B6A9 
X-CRM114-Status: GOOD (  13.85  )
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

On Fri, 11 Apr 2025 14:41:09 +0200, Patrice Chotard wrote:
> Add the released variant of devm_reset_control_array_get_exclusive().
> Needed by spi-smt32-ospi driver as same reset line is also used also
> by stm32-omm driver.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v2:
>   - Rebased on spi/for-next (7a978d8fcf57).
>   - Remove useless check on reset.
>   - Add error handling on reset_control_acquire().
>   - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] reset: Add devm_reset_control_array_get_exclusive_released()
      (no commit info)
[2/2] spi: stm32-ospi: Make usage of reset_control_acquire/release() API
      commit: cf2c3eceb757e3f28e6f1034f9bc178e1535f5cc

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


