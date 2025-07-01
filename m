Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E025C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAv/pbQd3bsA6dJe3dpQWXxPwPryRPbQxlsAPAhX5F8=; b=qyLBBTEZIsU8d2I1UDojPspiPV
	MY++jyRfGJhRCuow2gy0Ksg6jv9GLRzUvkoFyLJDn1yd/wcWkkWa12tk6hTyLOYCqTtrk8hjQtw4t
	48fvCbBn72YvYk5bdTyyuQGmbEV5qXyIH85owxxD/honT57hLGtulZjVbmZqpFrBbcsw/zcB6FGvB
	I7VX1Qpk16TNp44ZKyeCcTmncLI8jef0EM7gvKvhaA2BBVy8iFlUYWBKZJ9Uo/SgFpDF+t0xlJrsq
	Qb+llmML03b47v2CyPgo9umU+yHwdYoi9A8tzPa5ZNjpjezZPxGkHiOaP/Tb1Z5hZ/r1FR3VRHILN
	rbpSR7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjeD-00000006nXg-2gOs;
	Tue, 01 Jul 2025 22:40:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjGS-00000006lS3-1vk7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94ADB41569;
	Tue,  1 Jul 2025 22:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70DCC4CEEB;
	Tue,  1 Jul 2025 22:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408143;
	bh=om0fQDtjhAjEN0F2R3PcJkGfAKXzLObNEQ/Y+tVNkbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VxM4hLbdRT2JwAiGwjLVCV96RoYnb5PaCzoxjy3ovonGASbUuhStsrk6lwdlvawq7
	 MviA9f6c6l+5Am/yO7UILWod6+YC6guAhjXGZMonuESE7qvJFEb5CGujTTI22368e1
	 aL4r4Wnfv1Ar/SseKlHkgWiOr1L+bGSWMQIuYl4wWBpkeIWclaJ+LUuAqCjXSA0dTO
	 GyL8dLWYUNi1ATFHTUvTuqSioYVZ8jBxj7wHsBY4VcYeGDwbsxh2KE8uOpsOIbpjL7
	 UOMzKzirjVrRelOSnC/k+3nCXAjwk8kBFJ43Gim53RcH+m/BuJ+HrxwRX/qqLkXxve
	 XY8XNV03Ttwpg==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
References: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
Subject: Re: [PATCH] spi: stm32: fix sram pool free in probe error path
Message-Id: <175140814155.710092.6699776738839101023.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_151544_518726_B6D544D1 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, 30 Jun 2025 10:20:13 +0200, Clément Le Goffic wrote:
> Add a test to check whether the sram_pool is NULL before freeing it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix sram pool free in probe error path
      commit: f4d8438e6a402ad40cf4ccb6e2d2417d9ed47821

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


