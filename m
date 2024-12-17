Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61C6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRRaNmpt7m79Lli27h/dTzjVFHedQgGtIYGvBx+49eA=; b=gFtWRY9JZ2d6uSkrDtTlRRR256
	r92+s7qRChs3srGLdjW3farnQf07AGrj+cRfIf+o9UY8c1hHlzY8rU6+pgCHnKjiYIAIXEEyh+kMJ
	HaCzz5SVq8wSLLJEL6ZcPsFnTjqFmHkGP48l241QIKX0ZkIbn+nPTUPQJxvqyDDPa5YBBGTblTijn
	7es2ifnhMJYZgTN5YFd/Sg40bZqPyc9Ib3Ipat223ISGIjX25K56QdSuSL5674OttprnxQic3vmsR
	w1uvtv41nwF89hs3VH6adnJNHILWlf28kYwh/20PrqtNDcMWpH+DKUTggn2q3kJjcg0tjyrgqoIyG
	8cN2SiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXcy-0000000Da5K-3E5F;
	Tue, 17 Dec 2024 13:28:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXbt-0000000DZoW-27JM;
	Tue, 17 Dec 2024 13:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABB7E5C62EC;
	Tue, 17 Dec 2024 13:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B085C4CED3;
	Tue, 17 Dec 2024 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734442056;
	bh=pvcne/S7h5GxuzsVAtKGGhSARJDAW+nt0TG3iuNsj+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dzzba+p5x2f9pOP97NAyWQKMZ3yTMna2Ad+pX58avKeU2yFyyQdarWEghTmw8+66h
	 abU6dXZkGNvlWdBV0iS1sr982UgTK55tTr6Ttf1j/cjJJ6cVaP0uoy7Mrm7W4BE88E
	 zwyajdVFB0FYkIjC1Bg9CasIMc/+HhA3r2S1VyV8kFb00lN5Ok12faVXxzJxIIuW8i
	 Ph3Fdc7X+yRLKW0Hx4joeiDV3oHTEf9XGLOhx3VEW8eZeLC2HbwXWLpL4BJQs8ywnC
	 Ex5oFJedrH5e2Z+y2d595wZlrFJQ/n1uuaPagbTrxpkzEDUeovaIu1Un09AaxuRBVt
	 PF7q5s6+ezhNQ==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241208130311.1324024-1-jon.lin@rock-chips.com>
References: <20241208130311.1324024-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Support pm ops
Message-Id: <173444205510.31817.16108705113990702119.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 13:27:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_052737_591368_DA62B515 
X-CRM114-Status: UNSURE (   9.08  )
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

On Sun, 08 Dec 2024 21:03:11 +0800, Jon Lin wrote:
> Support system_sleep and runtime_pm ops.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Support pm ops
      commit: 8011709906d0d6ff1ba9589de5a906bf6e430782

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


