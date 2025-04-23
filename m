Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6EEC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcgUKrLSvRtm6DxpsSrm7miLamityP0bxXeI15jIP6k=; b=CQLoqt0JX2iuQ3A1XpDYiPIFiv
	Wz17ZxP5nRscIwgTpKAN4VwY1BvLgcQCzCVm/DU1jE4GpEvzFagfWw9BBEoLQuLpdbBaJ7x6oVRwy
	9drSjqUob0wkiPjRk90hUlYt8YjlBqLkoE9xxc8IBE63SGxA9CWkdGzjCCJYZ4Kcdg8QCYKnPnIlJ
	oUBWTIKU2A4oeRPPlkWhnZtwp41Hz7l7k6klYi+1SitGIkQBFLCd3o8k1mrcEifYv8WdkOz38c3jp
	RG4VXZXDMJoMZ+of3lpVBaUaPEEtsorrRxDvxUSKGXeTFx1b3Gua5PQS6oFfQ6vta+Nn7khRiNRLY
	VOo5WfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZnY-0000000AXm0-40WS;
	Wed, 23 Apr 2025 13:05:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YWi-0000000ANrb-20WN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A3C15C60D1;
	Wed, 23 Apr 2025 11:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A09BC4CEE2;
	Wed, 23 Apr 2025 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745408667;
	bh=5cQQ2k3EMTyhmzUp7//r0VkHXfsAWm3XNAjUaKxYfeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KUwF4t6t487uwT0ohnuanuQXtWNurrxiMBebUH6vxSwX5yH0Tw2/KTnMxUDmHBki7
	 nbKsWGXM6N2YMMhZ/01UNvhT+W/vhKfCCsf356vtSTOilONszEn/yvXP+KNNrLSahd
	 EMPy5RawgUx7sTFvBsGjSaWGI3gI6F1xy1xaKy2lgbe6xoCNhmmJ3k3Vw8yqx2LbaG
	 uBMCNyho0hRJXJSr1DZGo1Xp96zUQf3iTX6T5RPXlSU/uzFhY40tZ995cJ0svqMqdN
	 0cF3vqjjvdT8shUAEJIBofeEg6b5ZEaOPqOBKcW0K/sa2OJJEg6zz1PYmGE68ydWms
	 Y0i9IX+SDeacQ==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] spi: stm32-ospi: Fix an error handling path in
 stm32_ospi_probe()
Message-Id: <174540866515.26715.3420851726467928798.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 12:44:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_044428_578309_FC83F885 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, 18 Apr 2025 13:27:53 +0200, Christophe JAILLET wrote:
> If an error occurs after a successful stm32_ospi_dma_setup() call, some
> dma_release_channel() calls are needed to release some resources, as
> already done in the remove function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Fix an error handling path in stm32_ospi_probe()
      commit: 460b14b0929fa9f658a7e159ef646ce456962ab0

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


