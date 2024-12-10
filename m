Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg5/FcAWuQpY0OP13w3mM1D0/LGF82jD15rwRjhct9Y=; b=wvWqe4vt4vd/9bRc8N7H1DUW2B
	A8CruYxJ7plKIioTph5+0yZhE1OcjTEvcUDd5lw2gs5n8Ns7nc+QRjaBQ5ZtwCmqqT40cuAD1Dk5A
	WsRYJR/BjTQcNxh6FjkxslCAxAnMqlqOJqqdI43/Nkil2EaLHCr/iKXGHADE4yRie+WgEL39wCgx/
	iyVGWRpWIDAVR5oF24qMRDHxRF/J70ZqxNOdx9sB47EOogUoe2W1X3ZiD/YdOzhzbdzTPVZXiJ4SZ
	UcKjP7MlqiPmUWrn4YWMHH/UPmoe1oOpPvab8uUYw2RcC2gayDnKFDmyZBPhlqTUT6sT4JdcRZWBX
	gKbXedBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzx6-0000000BX5W-2LbA;
	Tue, 10 Dec 2024 13:07:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzrF-0000000BVgp-2yhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3C1F5C62D9;
	Tue, 10 Dec 2024 13:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D1C4CEDE;
	Tue, 10 Dec 2024 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835656;
	bh=zEwmhiXWSNdbVox4v1ywGDTEkwYo+ZA+AQNMZDvtC0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cZHyQRb09aVdckaqkajo4eVvvzHyNC8KLVkdZP6Yf6i4/uPqc7gFZGQ8MCOo7O2E/
	 XSaNPzGv8jbL8bfjO6sZuNk65bMm4nqT/3u90zls+2YoVwfujB1EuyToPt09NU6ZHF
	 JR0gAAp2xG2EF4+JI+W2TsEObUJjuioGJ1tI2WaD1nWBP6OXjgU1ON/KiyeDcibd8J
	 /uOwC/lHNPX2J4RbKcQVp7DJrj0piWQ6OVXqrZj7nrbvPHNaeglnHhMCBYbiGbEzrD
	 4R1NkJsJ0z5+R321AlES+nFWpAhpfzBlzvHU949s8THLJNUj2m2vyV8NJ5T4jPZftd
	 qN4vUGUNWbwBw==
From: Mark Brown <broonie@kernel.org>
To: michal.simek@amd.com, linus.walleij@linaro.org, 
 Mingwei Zheng <zmw12306@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
In-Reply-To: <20241207013258.3615645-1-zmw12306@gmail.com>
References: <20241207013258.3615645-1-zmw12306@gmail.com>
Subject: Re: [PATCH] spi: zynq-qspi: Add check for clk_enable()
Message-Id: <173383565535.34030.14188162384074341857.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050057_792652_250F80B6 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, 06 Dec 2024 20:32:58 -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: zynq-qspi: Add check for clk_enable()
      commit: 8332e667099712e05ec87ba2058af394b51ebdc9

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


