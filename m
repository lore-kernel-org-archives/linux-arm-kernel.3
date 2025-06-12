Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDEFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt55w9x7Ii4e9yHLow4yHm87TwRsyGn6Htp1OEe/9RQ=; b=lWyw2fsvkzsW+OeSl3R9JWCDL5
	qEMLeC4LagAOYKZiKW2qWceHAdh7wTnlzUInwqKy8788/+qPEnIAUs+a9ftEy0T2XJG55dmJc7h6L
	BVzu3BBnz5wODCgbVgYCHn+fYQL7GTkT+1MYKEHA2z4mbKpxit820ePJWxe8DXjjAoWG3gw+z1llW
	odn4HwFh//w9uon48Lt0R1c7ZwV28YtTwOOGWoApotCOeeE4uqToQ0/CxalBViYH66cMoifoTdrr0
	7Wnr8h+GeaSIRIBd3uvuAHpE/YPfLeUPSZMX2BZuUAodwD51QN/+KGXGmZvk0/5DWwOqcfmoHcP7z
	xBtCOqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrM-0000000DPdQ-2N3N;
	Thu, 12 Jun 2025 13:20:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPh7b-0000000DGbk-3Ctc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 12:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75CBCA509DF;
	Thu, 12 Jun 2025 12:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC6BC4CEEA;
	Thu, 12 Jun 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749731610;
	bh=XHmQstvfanfzC7FHLXlVhn+/xiU+w0Rr72xmTwR0M/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uzy2FMc79vbPGrR43FVIRsW3RKK2BWPs5tvdvyhHo3bDQ9dYV1OHot8dEKGiUkv5i
	 Vqd0z7T4DoLAo0ylOfrW6XYtXff+4qksm5pM3IlbUma2a4N6zgutsOVo0gcn4BxX4P
	 wZhj86qHv1QQJaiAPvNRQxw9YGjrzkiRp0jyXX1mjZ38k0/buFdv72Gj3J6YtwdeYW
	 076BPvDjjiFIua3RTBbG+piMmTiimVwTcf26gBMTxO/YIobw71ZckdQmWjWvoaAHwy
	 XXN4WEJU6aRr80V42EPitKowp3AuPZPS9nFYBQtBNu3i9hI2yu3LUOOxDxvwvzracR
	 dDU2DcbQC2NXw==
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aEmAGTUzzKZlLe3K@stanley.mountain>
References: <aEmAGTUzzKZlLe3K@stanley.mountain>
Subject: Re: [PATCH next] spi: stm32-ospi: clean up on error in probe()
Message-Id: <174973160798.39704.11177150841033836429.b4-ty@kernel.org>
Date: Thu, 12 Jun 2025 13:33:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_053331_867890_7F6AC48E 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, 11 Jun 2025 16:09:45 +0300, Dan Carpenter wrote:
> If reset_control_acquire() fails, then we can't return directly.
> We need to do a little clean up first.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: clean up on error in probe()
      commit: 83f066fac3c231e58e9adf3b307e96fee172dfb3

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


