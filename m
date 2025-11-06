Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDwRaQZGETXkq1owY1Dg9cMWZpOopr0Wm9HZZcGCPrw=; b=YX2FDMtvs8iL8vZiMljOHIJddM
	1OTBsR4DlQscdPyFLoM3wjureVJjudYG3xApBRXZjL8H7Mgew1ExuaV65SPkWwyQvupHd/hV5zTB2
	TDv3pZYYB436n1+1ATn42JH07YxlJ84m6BZGdjrODN5ZlMrgS0iRYaq6GrAenLW0bb50AVJQYWLQu
	j2CHwB0lUG8T+hWtdtMZSkFHjXM6kc9EaYjcqtUrE73swwwrtDf9R2El3XXF82Ppt23ooHyvoyfUy
	J58yQD+LIXaoKS6JlnPgMj9AB+2MBcXE9mlKuOeI04fkmMzjv+kqw9l+p1x1igH6AS95YijSfSrNZ
	JU/RUomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9oL-0000000GPmP-2QIm;
	Thu, 06 Nov 2025 23:54:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9oJ-0000000GPl6-2XSs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:54:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2D394180A;
	Thu,  6 Nov 2025 23:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453E6C113D0;
	Thu,  6 Nov 2025 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473274;
	bh=vacWDoP23+KxKASrx7w9Nsp0tGfB2QguzpyvMEsdfY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=czVbaEl1cdTwLn5JGM1WjRnyLDcWhzrZxliIBEs5C63XByratweg7kp/XwWDXbkpE
	 Lk7qI/hHnI7e5ASO6JWJ66I66+/3LXofbXPmO9W5OabHAxUTxuxQGCfp5I5P/oDgKs
	 SmekLxjueUZTpohjAgvQcl/Lo8yp0KJ3q4hEJPqdorr/1qosw+GZiDDW3eQja0thKv
	 YtXl8/yAOpmYichNsZ7XxpRcg3MEnAS0NsRSMYr02v9Wpip1wZGvdGBRSbrAXmYQWb
	 0I9EEkKo970N372vaePr6TXuMOjO35ovZ6hODCgzy67OlghzAfkZvVfEYCHdz1OzCe
	 rNfRiAlsgeSFQ==
From: Mark Brown <broonie@kernel.org>
To: frank.li@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024055320.408482-1-carlos.song@nxp.com>
References: <20251024055320.408482-1-carlos.song@nxp.com>
Subject: Re: [PATCH] spi: imx: keep dma request disabled before dma
 transfer setup
Message-Id: <176247327113.2483158.8547481870212835167.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_155435_740383_600D4F8A 
X-CRM114-Status: GOOD (  11.86  )
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

On Fri, 24 Oct 2025 13:53:20 +0800, carlos.song@nxp.com wrote:
> Since sdma hardware configure postpone to transfer phase, have to disable
> dma request before dma transfer setup because there is a hardware
> limitation on sdma event enable(ENBLn) as below:
> 
> "It is thus essential for the Arm platform to program them before any DMA
>  request is triggered to the SDMA, otherwise an unpredictable combination
>  of channels may be started."
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: imx: keep dma request disabled before dma transfer setup
      commit: 86d57d9c07d54e8cb385ffe800930816ccdba0c1

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


