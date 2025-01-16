Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95C5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd6Jvr+VnmvstD5tVjlOA7Eo0FM2Nz2OlhblfHEYfF0=; b=aNsANVSmsAj7ykUvPVakroFmZh
	LxJj2frtbGsvbC5vSkiJBcwj6KNGwIsACPpIvCNMAmw9bLshZdoaXDEx59vNpOXPGfZ2ukuuVJJJQ
	GHtrmuKOKZrjlg1lEjVZBa/bClyYYHXiYxHXfF+5cu9zLC52wOCIbH3OE+O1/W8NllOAqYODyHPrJ
	llD/fMCPswnAJ6hjMJBGhMrTU64PrLsUFDMOOqL92t7Qf0WhPRcGyYUlkUVF3b4I9QBvve0T//bj8
	xN8Drncfc/YBtvwsUcRz4nZ3dNJSOetxJqWo5rB8dOZx2Hk+ID7uxKUaC3qLPeXZ8JE3LM8Js9OAC
	tJzKAZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUtK-0000000Foxq-3Fgp;
	Thu, 16 Jan 2025 18:46:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUs4-0000000FopM-2BpA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99A57A41812;
	Thu, 16 Jan 2025 18:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E758EC4CED6;
	Thu, 16 Jan 2025 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737053135;
	bh=Rx6JqiDk5Io328mQckcw4xdvARFhgOe7jeUjdR6Tcio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cAm16EvyKBiWRoafbd8CNELUCAfOMTVr8FvGXPWt4uIU5VHACUtcgJPfcmFzTcEtc
	 oPsrFk6y8qp7wW2wvp3jyPvitz2do0fIg0jwY+YVSBKcQW60q4acHiSlmSUXDTpxNQ
	 BvGZLwxWvUrtAra7gtmX2h2CPucw4YeLHu7qNNqaDLlquVixURf2n/VXh6e6RntiYW
	 3naW5wYMtmuFNoMB16MwdRDeIiKdydnWl7Hj4Ibs4CDBnlLOR864LtUm21v1y3ctqW
	 QEFSbqcaEggoFVvLM8oot8ASZ9yJzYyqYq99VV0q5ewnU/SiYjkmMy20gYo5lrHe3x
	 ObD8EX+oa/QGQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
In-Reply-To: <20250116162109.263081-1-andriy.shevchenko@linux.intel.com>
References: <20250116162109.263081-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] spi: pxa2xx: Introduce __lpss_ssp_update_priv()
 helper
Message-Id: <173705313363.60002.5624145474915701382.b4-ty@kernel.org>
Date: Thu, 16 Jan 2025 18:45:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_104536_635390_3DCB1025 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 16 Jan 2025 18:21:09 +0200, Andy Shevchenko wrote:
> In a few places we repeat RMW IO operations on LPSS private
> registers. Let's introduce a helper to make the code better
> to read and maintain.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: pxa2xx: Introduce __lpss_ssp_update_priv() helper
      commit: 78b435c9044a9ec321da29d299c70cb14b059682

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


