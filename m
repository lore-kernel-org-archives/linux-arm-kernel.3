Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74DFCEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beSnFJ8Trwr8NU5yMFnAE91LOqMeda84E52oQhVHrp4=; b=Jnqq2WRPn/g/vHDcBnFLtgcKyv
	B4EovVhtxFJGRqtMQ3bhH4QXEemBev+dCKbtfZheI1JucJZwLrlvtqwYJLPmE7m8WC9VU1ftw8gmR
	wK+AogEu0fOnA3GRE/Nw48Zks+POONOvDq6yLQLp4w+Y9gruighxC3WRci4Kdfvze2+HX/fyRNSXU
	JAEwL+p4vhOorx9uMplR4FWmZoMoSGdeipIq7Jdl4FSvK/M9X6NbdUsEBLhkQZL3QDsNfwDs3QvCx
	uzICZQER7Xetpw7rX4vU2suVmxrQv62OqHV+u74IJ/S2WP2+mCbe8i29PymMY79UcXHxHB2mwY8lY
	w/gB+z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBkb-0000000DfkD-25Ud;
	Tue, 06 Jan 2026 18:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBka-0000000Dfjy-1NCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CFDA6013D;
	Tue,  6 Jan 2026 18:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36CEC116C6;
	Tue,  6 Jan 2026 18:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767723947;
	bh=slrVtXqGp2rp8qqJMjz0DpynF+Z6Or1Xuns3k46Q1B8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rq/W70gkO2HuPi2yJnnK1gFp7NtCie2ZrAlZQ37kEFnObCPHO69ZHUXn7r9VfI+5x
	 9f0UdgZCrPIYV0/or6CkdnLp0AHqGatHy6Jcjt1z1okYaNQsg5vQUX8iJHfNEK4rje
	 An7i1I3Z0Gay4gmzHrrxviHMf/XB70zmVfQw7Dgodz2WL4jmCLB+ZMEuaM9N3p2scy
	 y3/F7Ne8pjcv1A4YF2NM30mC4RNyDbMPeTpbyXRHDD6WQnz1oeAGV17tmge2XC/gmw
	 VB4yZE/VP/Qap7eqiLDx//H1ajk+74Z7ERkTORw93N8iO3a7pC5F9pGkXpabZfPhZ1
	 nHQ2mY3eYNFgw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
Subject: Re: [PATCH 0/4] drivers: spi: st: use pm_ptr and remove
 __maybe_unused
Message-Id: <176772394559.309686.18171199857083341971.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 18:25:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Tue, 06 Jan 2026 13:14:16 +0100, Alain Volmat wrote:
> Update ST related SPI drivers in order to remove the __maybe_unused
> statements on pm related functions thanks to the usage of pm_ptr.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] drivers: spi: st: remove __maybe_unused for suspend/resume
      commit: d4469e4ee5da0a93eabfcb89a8c6ecdf7cf1e9be
[2/4] drivers: spi: stm32-ospi: avoid __maybe_unused and use pm_ptr
      commit: 2a2d7187f5a7238582c2bbd4a6da7595c20e55a9
[3/4] drivers: spi: stm32-qspi: avoid __maybe_unused and use pm_ptr
      commit: 10a6d7507791a667fe1d327056ac3f72934cc7de
[4/4] drivers: spi: stm32: avoid __maybe_unused and use pm_ptr
      commit: 75d208bddcca55ec31481420fbb4d6c9703ba195

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


