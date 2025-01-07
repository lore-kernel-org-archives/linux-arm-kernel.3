Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E69E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH3oAvp8bwSVOl+7lxPgGXBypHNDNXEmgka/N1WZQ2Y=; b=s0PrYNFpMG095Qh2mrd9g66lci
	2RP67JBiv0/zz9dGz9P3DTHGktBwKz8xbikLPyWtwXU6nzsGxUJnQvs42+2NwwxcAR9A23MjHd0+h
	k7zE5hIJSNYWREBJu1M35hvihtIWj9Nvgy5QSpwch/iwO+qQ6W2yunUrZjTSmK9iXtH9jpyNoTMVY
	rUtGjjocEf4LDWKBhFQzsL/j7LN4mm///2Z+1bq+X6s/F6SqgenwnGj8LflxIB9gDmjX0MMck3ulf
	kzPwiYbXrMtEqDxtA5fQdmbdS5tekLHgrqd/x23um+et2oS/ZEf9X9/+v1TpXxwIFpIKIwJDX2OCS
	1hIOep0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8PT-00000004i77-3CJX;
	Tue, 07 Jan 2025 12:10:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8E4-00000004f2X-2xGJ;
	Tue, 07 Jan 2025 11:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 198615C6171;
	Tue,  7 Jan 2025 11:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BBAC4CED6;
	Tue,  7 Jan 2025 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736251104;
	bh=JHRpYXNzTasLGOx33u2irRAWwer3YDDAnZyLXm0wAk8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RaoM5wfXo6eVfWrThIoBURxwQmBgYs9zHZgSpVc4tbaEKrpl5CpO7qkY2+GtbPDa/
	 QEPCFMm6/KMi2I7Nyx+IYTCINU5OJcgmdha9r7x7dAsMiBc3eycuEr9Ozg2XcBcsPD
	 Jt0mW1yJnbCG/Jqjld87rNaVhjtMMti4owMSktUc0mRP63u8JeVzLeXz7bGgzZhHqu
	 D5JSPky5ThjHtrrT/9GeNM9G7QFoThi4L+sQmGS9nm/LV5oXrUgZ4AzN4x7Onk5ker
	 5prw7/KmSoBz7WqvNzP3wZGuuYPXZ7ngD31A3dUGjAdlxMDmoyZDQ79uB83zuWVDWB
	 wcmUdtKVVJsgw==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241219142216.2123065-1-jon.lin@rock-chips.com>
References: <20241219142216.2123065-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Support sclk_x2 version
Message-Id: <173625110270.23847.15036834629603583307.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 11:58:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035824_787943_59915E45 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu, 19 Dec 2024 22:22:16 +0800, Jon Lin wrote:
> SFC after version 8 supports dtr mode, so the IO is the binary output of
> the controller clock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Support sclk_x2 version
      commit: af103eb7d7d881cf6ff7414242bce2d8e394cc32

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


