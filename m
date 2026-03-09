Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2EFFCA19C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzT1x7udiRauncNcHrEy3D+oQPbWR/PeNre1rcvnuDw=; b=c9DcY52I5Zd01oNH0lvoHi2nZj
	9NnuB8l9ybyKNQaS4GDNlhUzrqViPoLXdX84Bb9EzABDmy1Ht7NxEnnOQAGQXBt6eI460Nja3zYDD
	ODEgVbKY+PRfMxvhmezL6FbdL+8EzNa65QPKTjHUP+4pM/oxjiUTq/SJhj+3HDZ4/Ld9EjMMlZjbM
	KKH2t4wzDtWEf5yJFcu3m7PXOOdumIrvL2RF2E7IPyGqbbKkNfJQeu2TXJFTs/KAvcIkHodFjFvLk
	3HwsPwBdN+m8ktpPsM4YsyScEK38AIH4Pw575xZV3fefSX8DWly9xJ7t1ZDvvAl/rISfnuGkvogCm
	JGAwQSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjDx-00000008EZg-0wNC;
	Mon, 09 Mar 2026 22:37:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjDu-00000008EZX-16HB;
	Mon, 09 Mar 2026 22:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6210260054;
	Mon,  9 Mar 2026 22:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC18EC4CEF7;
	Mon,  9 Mar 2026 22:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773095833;
	bh=6BnqkIlhVLViOxVryE2C/8Z+o2ZWDSXu/1ZvCYaDXaI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tf3H4xezIDRsTefv5vg+Fi29V0HK0hXba7SX8Qjpff2LIMJyrIdAUlfUphLpz0vXt
	 VQpGFEczR5IAjz3w0nxB8MKfbmHs4/aNlNfd+DGOIIOp6l134w/5Rp2To/2e5JfMwX
	 jka3hl9HgNEm6orCxeH/SfP3w8jvX/m5fYle80bUygWWmiwJcRPR27vaKPH8K2+jSn
	 2iA8h2SwCIPEPEdAOWaWyB1A1B9vQ5bLuZBgaON2BkDvHjIYMQS0GC1DnqWefCyonN
	 /H0sDUjE5hGE9wW/AFoF2BHq5ToC8S60Ncuv3QlHZK5gJX2tIU+UUy0yH9Lc0MEaig
	 BwfzfclgNVaDg==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Jon Lin <jon.lin@rock-chips.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260310-sfc-v2-1-67fab04b097f@gmail.com>
References: <20260310-sfc-v2-1-67fab04b097f@gmail.com>
Subject: Re: [PATCH v2] spi: rockchip-sfc: Fix double-free in remove()
 callback
Message-Id: <177309583151.321088.16829523155005247397.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 22:37:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb
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

On Tue, 10 Mar 2026 02:01:34 +0800, Felix Gu wrote:
> The driver uses devm_spi_register_controller() for registration, which
> automatically unregisters the controller via devm cleanup when the
> device is removed. The manual call to spi_unregister_controller() in
> the remove() callback can lead to a double-free.
> 
> And to make sure controller is unregistered before DMA buffer is
> unmapped, switch to use spi_register_controller() in probe().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Fix double-free in remove() callback
      commit: 111e2863372c322e836e0c896f6dd9cf4ee08c71

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


