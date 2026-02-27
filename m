Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6010DFD9E26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 01:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbwDoKzGUN9NNNLVVxeHarI72us0bXwlUjVwmKZUKoo=; b=LCWf3EiLIjtoldJd2f3gaqwwC7
	M4n2qhuYpVM29KfBl1xb8LD5YHnuuWBZn7lL4GbkZbmyxX6BN9Okm3SPn1bdE2V6vqznrSNosnRwZ
	pfQJhq/Jw7tSAtJgV5V4Y8cTlr4dp62+jaEaMgWNsYRoYEHQmCURvvOi4xthGcTl/DK+wHHk0UWGX
	M64Qcwu+aJlNbJ8UfOrG7i6sJe+6bioPjbMtm+1oe72I06jsaK9s6HotzHwZKjSD1M5MtV/M/E/DU
	aom0LCT9lo8RHcYE9wmJv3L36RKH7hJRQZxY0xbNjK98oqAVqZBXK1Cjt+Ab6xw+S2s7Rvb0LoGea
	eVunWdgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvma6-00000007U4A-0uuW;
	Fri, 27 Feb 2026 01:23:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvma3-00000007U3n-0YPR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 01:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1339441964;
	Fri, 27 Feb 2026 01:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435E8C116C6;
	Fri, 27 Feb 2026 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772155425;
	bh=iNpKTxg26EiS2siUu/UFXfqcUPELCw3aJIOd825qeUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dc1S994qp+jOc8gXIv6G2LFN3/qfv/eWmKgFRDsdR1w3APFpqOdiZxFftHDSg8gzC
	 CDmP0WwK0nXCevcWBvwtJAkn8IoCZDzVPW3W4Y2qcRhh5dXnt8ub0RR8ugV2fvD1J8
	 PuHE2zjPiv8ew6ZX5t5t9UqVP6Yi1N6GOrhb9pLGrRoBC9dEpuQ/w98zIhg7MZxNrf
	 jU4/CLaXUCQF+mAYfCl+2J1bXjvF+llAydGF62wNDBbUZMaI7KdT/qm72XWUTVXPcg
	 8zU9dxidx00SgAlgXp0naH8yxdmIRvYY5+cwBPxzIOtxISbcfLpK17KrjhwJuXTLmb
	 1zp2k7phOHuzw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Clement LE GOFFIC <clement.legoffic@foss.st.com>, 
 Antonio Quartulli <antonio@mandelbit.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
References: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
Subject: Re: [PATCH] spi: stm32: fix missing pointer assignment in case of
 dma chaining
Message-Id: <177215542400.421349.12022854371341188766.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 01:23:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_172347_197935_9B3BE839 
X-CRM114-Status: GOOD (  11.66  )
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

On Tue, 24 Feb 2026 16:09:22 +0100, Alain Volmat wrote:
> Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
> introduced a regression since dma descriptors generated as part of the
> stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
> to the caller function, leading to mdma-dma chaining being no more
> functional.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix missing pointer assignment in case of dma chaining
      commit: e96493229a6399e902062213c6381162464cdd50

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


