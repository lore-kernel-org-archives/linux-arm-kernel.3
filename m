Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6452EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eF1qilFjbKVyqeE7avrvoIwVhsHudEYJV61sD+GfzUA=; b=eb6FNhJSYysNRge3f2YdXKECSE
	qCEHCMSVNOOPSJT/pWcljRKZk7iQkHZV9k/wy+mEFa4eeeqrQqN1Kwoqln6b5aaqqQTPpwolqcUEs
	9rS5PWNOohg3fMinWRyNiWSuok0F2OT22j0ybt/wmc/egrJ7l8nVD69uPKaSk5myZztENJze61dAr
	y2dLCuUjrNKizk6evEZYyibA9JvuHsbi8YC1ePOTN4U0PBnGNBuH++ixRY92glsk7Xnbzi1bchYIi
	rgkdh8K7XaAb+epYCwFuUsnwF1J9MeA4MpjS+38wNiJCR7f6qeeRaUdPDpJNyp2VOTgCaH5Wmq2Pr
	/VPfBB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCwZ-0000000E6Rb-2Evr;
	Wed, 13 Aug 2025 14:59:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCqH-0000000E0zI-3Fsb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38BC443E5B;
	Wed, 13 Aug 2025 14:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075F7C4CEEB;
	Wed, 13 Aug 2025 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096761;
	bh=W1MMJYOB6Rx7MR8HcE10hp/kPBnLLfMgHsge1n6PciY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fyGEgX4iOkFrB8UgIV9irDO0K00ZAaqgc+PnUKHiIwq7lQoqtY0uwKZSbzQ6uS/8i
	 k3u/HvfLPPVF9n1PGcHXqw8Kv5zSqGrgwOI+UkL8iSQgxlhUbMBMtGr5WGOb973Vey
	 wXEraOj4i6ju1TxMC1/qRCIqDaGxpKcPUYOzCoG5qbGkxFo3l2XLnIPTS7FDXaoiHi
	 C2fIxy4B3rUxToAizViCSzv/EQzeL+wdgRCThZRdLG66rrAh5d7ajZbD+xeZht8B2L
	 amWMuOf0657Ii8/Dx42pEbA6R2taULadoTrj8RovUtmj07TqMBricr0E1UQUr2rd/g
	 o8qoAWyJZzoEg==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Sergio Perez Gonzalez <sperezglz@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250729020052.404617-1-sperezglz@gmail.com>
References: <20250729020052.404617-1-sperezglz@gmail.com>
Subject: Re: [PATCH] ASoC: stm: stm32_i2s: Fix calc_clk_div() error
 handling in determine_rate()
Message-Id: <175509675878.70774.11170404842428656670.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 15:52:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_075241_915231_0AF450FA 
X-CRM114-Status: GOOD (  12.04  )
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

On Mon, 28 Jul 2025 20:00:49 -0600, Sergio Perez Gonzalez wrote:
> calc_clk_div() will only return a non-zero value (-EINVAL)
> in case of error. On the other hand, req->rate is an unsigned long.
> It seems quite odd that req->rate would be assigned a negative value,
> which is clearly not a rate, and success would be returned.
> 
> Reinstate previous logic, which would just return error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: stm32_i2s: Fix calc_clk_div() error handling in determine_rate()
      commit: 0ebbab41fba1bae6ccd96c0eec17026700ac6534

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


