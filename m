Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56694D132D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McnGfctTVR2VWxkXXcgf5j/o1J2LbDCwAz0OKGW/fDs=; b=TH4uutZRI4MZMdycAQrKCDuVFM
	UrjhMyNu+JKUbzIo1cEdNa/WRVR+E0h1TTsgnQHB2B5oHSfqrQk8wDPm7OYeENr54xLPyOyvBwdyx
	HYBWZ3PUlkhjo970+2AF9idn9sRCqhuXsdmCSM6ML2EaMK0+LrUUeuzs4n214OiWZ7ejPwNdS4+pg
	kZnHc3J/Yd3dZghxf6JBX2toJ9cU/LUE6C5gnh/LIIsmgUdHfWiexcM1d89rQK2lyKMc6/SH9B79y
	2VRlgav578XVUMU+cqFj3fYoB18IFtXyXdftBbNH7y8yyc32m+UfFa0dXFckwQtERTVnGu7rG0Rlp
	dKIWCJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yC7-0000000E4cK-3cT5;
	Mon, 04 Nov 2024 14:36:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xjT-0000000DzMC-3BNJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9E45C5610;
	Mon,  4 Nov 2024 14:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA86C4CECE;
	Mon,  4 Nov 2024 14:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729223;
	bh=8zkMh7Y7RhrNZANlbaXQ/bvchiQiKX45qJfKlH1uPX4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WuyirciyR/Y/qm16X8Ejd4C+wT3YaHJCScA0VKtRArg+EJjVBclg49wVJGBJy62R4
	 DGzDWWlnjZm6a+ZW02+pGV5ZQPjNkQnXDhGvlcKi5QDYA0KyWn5+yAlyQNGvE32gG9
	 hAwdruziUxlAH+yxfedRftu+/1pPKCA8m4OgiNeMoJ+jE4lLxmKjur/l5xApFsCncm
	 FUiyPzunfNTilR4x1P2arrM7fZFSAaaG+7cPv4D3rrrtJdbxd46ek4ytC0aCQ8BaoR
	 hUu/wl27zEpNGh0vx27d3Iq2xoB1pkpe9r/TMufi6uSr+jRMJxXzx7kLEAF01c7D60
	 /o8QKIPx3ofeQ==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, naga.sureshkumar.relli@xilinx.com, 
 shubhrajyoti.datta@xilinx.com, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240920091135.2741574-1-ruanjinjie@huawei.com>
References: <20240920091135.2741574-1-ruanjinjie@huawei.com>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_spi=3A_zynqmp-gqspi=3A_Undo_runtime_?=
 =?utf-8?q?PM_changes_at_driver_exit_time=E2=80=8B?=
Message-Id: <173072922129.32316.16371123096263241252.b4-ty@kernel.org>
Date: Mon, 04 Nov 2024 14:07:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060703_859613_3BF31495 
X-CRM114-Status: GOOD (  11.69  )
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

On Fri, 20 Sep 2024 17:11:35 +0800, Jinjie Ruan wrote:
> It's important to undo pm_runtime_use_autosuspend() with
> pm_runtime_dont_use_autosuspend() at driver exit time.
> 
> So, call pm_runtime_dont_use_autosuspend() at driver exit time
> to fix it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: zynqmp-gqspi: Undo runtime PM changes at driver exit time​
      commit: 2219576883e709737f3100aa9ded84976be49bd7

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


