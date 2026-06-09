Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F825CD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwx2gnjzoEu6wS23A8/5F0BeRt4mUzsviwvSFFA+naA=; b=s+zwTDAJFyvPjHN4US3fA8utZG
	WZMp5XvKGQkJc9tby+mw4eU1o924wO1Mpx6d3IcBq1nyI9s2Uw18KF+2MBcerMOwfdSzjDL0wDbpy
	xGanEF8l0LE6uAwtcYaZkSaQBP+Wy0RCyvNtZ5fTtDh01U5nz/Swo9VHYb61sxrf9V6HpXHwvaZsA
	9VK4jCp4pqtcF5jqD0EQUNqtGYux0CbQY6Yo8+MzWy1vEQISQ2GNDx2+dXi9fePqWwt9S1/84E/BI
	QqyESj6OkepmtmUJaHBZch9EhP8h7PFlx3I7Dlkc9RPYtNzz2Wwg34fSI0W7ur0380KBRyIicjC05
	rM7PePgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrdA-000000052dS-1qmU;
	Tue, 09 Jun 2026 08:16:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrd6-000000052d1-0oKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:16:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98880601E1;
	Tue,  9 Jun 2026 08:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B8F1F00893;
	Tue,  9 Jun 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780992971;
	bh=Pwx2gnjzoEu6wS23A8/5F0BeRt4mUzsviwvSFFA+naA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOGtJdAFu05vzTyBNYkhG2GJPMKtw828JD36nf94w2GGCiM54FlLj92vY85ZhQWzP
	 IBGz6JOH74vtZ5Uuso2BrhmwZMZBhG0qbsFR7kdOII1mkcOL0OHzckvaCzqUsfx3MU
	 1K0MugCOw9vD3D41NUdcQzPB3LU2qxGV0VQh4dxHfVyEXl7+Qu+em9GBxjDK840RTl
	 Qk60eJI2nutYACIIyKpPbTI9yZVdz48EjF+KASGrJej24cnDZixytf2UFE5K9DSiMy
	 77OAeX0T+sg7/7+3Hh5LX+9Z2/wQSCQF0zjq+up8njry9PhtLfx1eXqs6widOSyHM2
	 znZiNvsg7kVyg==
Date: Tue, 9 Jun 2026 10:16:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: aisheng.dong@nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: fix resource leaks switching to
 devm_dma_request_chan()
Message-ID: <aifLtWlPdLr7EEnj@zenone.zhora.eu>
References: <20260520093323.2882070-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093323.2882070-1-carlos.song@oss.nxp.com>
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

Hi Carlos,

On Wed, May 20, 2026 at 05:33:23PM +0800, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> The LPI2C driver requests DMA channels using dma_request_chan(), but
> never releases them in lpi2c_imx_remove(), resulting in DMA channel
> leaks every time the driver is unloaded.
> 
> Additionally, when lpi2c_dma_init() successfully requests the TX DMA
> channel but fails to request the RX DMA channel, the probe falls back
> to PIO mode and completes successfully. Since probe succeeds, the devres
> framework will not trigger any cleanup, leaving the TX DMA channel and
> the memory allocated for the dma structure held for the lifetime of the
> device even though DMA is never used.
> 
> Switch to devm_dma_request_chan() to let the device core manage DMA
> channel lifetime automatically. Wrap all allocations within a devres
> group so that devres_release_group() can release all partially acquired
> resources when DMA init fails and probe continues in PIO mode.
> 
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

