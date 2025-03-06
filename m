Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E16C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS/HUEtioF8XhAW5HFWA7Zi5QLa5IcIMBLJqim9hCWM=; b=qcMku4OP6eufo6GpwzsL/6e0rF
	0KG4eTdWqZQEZwHmfalt9SeuHttNp0Fq1dRxuRX0vwC8uEOJ9dEj2b7l4om2nqVbagH8IzHcpuLi3
	x4dEHtea/+q82lWpR3v5/4D9IVhhIWDO7D4OKFf/CiWskZQi49ctFyex47kfkU6XbzAqD7OgSOLQg
	0db4gTYoHC5y4FVfOdnbGLC+u1Dypiii98Hx9icWWhLXxvpPnw0YDWtyb2mJOkcdpgh/o7eoTC7sM
	LgC5+CVCUBa+HmtFKWG4Y+pul56dIK3GCG+K1ZkXK2t0fTBpQpsWTUmv8rqiB7Pu4948bcUsSLDvH
	o9perfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGd0-0000000ByMa-0Yhv;
	Thu, 06 Mar 2025 19:11:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGbK-0000000By99-1W5t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A425E5C12ED;
	Thu,  6 Mar 2025 19:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F50BC4CEE0;
	Thu,  6 Mar 2025 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741288185;
	bh=4gUFR0sw4nvaIHYvLbMR5g7jzOxVgrFF7Jlbd+HjFT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o5KIu1omqX47y3cQX8KbvJ5UFo1R84Uh3XRliXwF6CU9WGGUI7Qw5M/XTzsFqYebY
	 OkNV/ONwZe+58SepWv9QhN33zIB78e9ZMa1PFtKepcj3aO43hB4rav939frg2/rjFa
	 BVrLGbQ1LQ/cICb69LZfWlCVRg8z1KnjkZOkrchRdlg50WGnM/+2Bh/CwQ1poaw7on
	 breaoY/R8U2sb8b7Dz8tVwlOi/XCYb5rfegBsVUQNfbv1zG/9Tj9ixXEVO/Q59+BWX
	 RP3eVpOEo0/pL8cAgaXwDmMwIDNd8aOVm77sycsB84A6/fhxwIymQj4wiV1PkzuGCT
	 HgU1x4cZQnQsA==
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
References: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH -next] spi: stm32: Remove unnecessary print function
 dev_err()
Message-Id: <174128818323.185591.2600414701558020572.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 19:09:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_110946_459142_338A061B 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Thu, 06 Mar 2025 10:47:16 +0800, Jiapeng Chong wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> ./drivers/spi/spi-stm32-ospi.c:798:2-9: line 798 is redundant because platform_get_irq() already prints an error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Remove unnecessary print function dev_err()
      commit: 3707fd9c383fc7ae19733a3ad2e5a82bf86370a0

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


