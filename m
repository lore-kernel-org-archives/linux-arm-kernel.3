Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EBCCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3OimdfZgjfY9/HT+h0JoDDZq5EDc2SRALwvB4NSvXE=; b=mRU2p0AYEiHvCeK9f2zzED9IOj
	T9Nn4KbN49hmGxB2QIva/PjQ8FMS94qSHVFOV9XeNxbLTb1RYlbcitHm7ZfCtNNQqfnLRWSo8CK9B
	8nXA64EEDy+qon6Zev96XKzPBCIxX3s4m12V+VUmuUm622RKdORbkk1YWJzA38psR6/1ZRPtvoVZ1
	t+vo7m3itfhb+JHloB7TygR1PVmBaw+yJFGayKT1Rai7rAunTuQGrmY6J7Kob2roKIAmmAq4cqyh6
	aEbiy0I65JIAEbza/anmesAt/m/9TMnZnDx0cjCq/dWppoOpbaGJyrMhSrLWKUJt9Lp3Cda7ZvlBs
	PSVURr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90OO-00000001WA5-3idN;
	Wed, 15 Oct 2025 12:14:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90OL-00000001W9e-0eiQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF27845140;
	Wed, 15 Oct 2025 12:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30FBC116B1;
	Wed, 15 Oct 2025 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760530444;
	bh=U0qBfTAoLQ2lXuxhHDpAiZcucUrXqzfYam7mxeAjgzM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=o/X8KPLmQwvaZ/4jk3aNbggMUsmUtSiTRQlSMl2XJzeWcdxeAHYCVUEkxd4xyQRUM
	 lm9j3UxOz9eAQqeEiw4KJtqK6D9JhqFpzt824g1F5aOEiD9IDRQTb4jnryGTQEKfOs
	 iAlvzz2RFp1CxWICKQO4xi1XyoRewABj3vRnEl7xWHSRMxzN0SpSnDF43LOvksIYR3
	 ACtYefsh+xgYcs1L5mX2EWAr4I/iNRCtLcWAjJJMe7vdTvlm8DBDul72BwYuelziYo
	 OjknTg03VXAm8mwyc8gDIxE4bHcrkdHE7kiuKHSn2QefE+Gc9U5X0I+y7ygwupdVFi
	 /eyOx9e5W702g==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, BMC-SW@aspeedtech.com, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
References: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH 0/6] spi: aspeed: Improve clock, timing and address
 decoding logic
Message-Id: <176053044168.105519.1540910122531672579.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 13:14:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-96507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_051405_222006_E4781E03 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, 01 Oct 2025 19:25:59 +0800, Chin-Ting Kuo wrote:
> This patch series introduces several improvements to the
> ASPEED SPI driver, targeting better stability, compatibility
> and, flexibility across multiple ASPEED platforms.
> 
> Key changes include:
> 
> * Clock selection strategy update
>   Improves fallback logic when timing calibration is skipped or
>   fails, ensuring reliable boot behavior.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: aspeed: Update clock selection strategy
      commit: 31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c
[2/6] spi: aspeed: Improve timing calibration algorithm for AST2600 platform
      commit: efb79de36e947d136517bac14c139d494fcc72fa
[3/6] spi: aspeed: Force default address decoding range assignment for each CS
      commit: 630a185fd06109193574d10f38b29812986c21de
[4/6] spi: aspeed: Centralize address decoding region management
      commit: b546e0023a203e7edf9377ac8f4f490a6965afd6
[5/6] spi: aspeed: Add per-platform adjust_window callback for decoding range
      commit: 0586b53d4a0c7c5a132629f99da934cc674ea4cd
[6/6] spi: aspeed: Only map necessary address window region
      commit: 64d87ccfae3326a9561fe41dc6073064a083e0df

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


