Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A741C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tXQAF2bsyNbWlsBbqkjhEmm+WtYW644Xg0Y6GwfCig=; b=lipWBXUUB/3nObFgx7v2Adp08v
	X4euVBhRyYTC06ighCcTG4fCvI25WubO6miKQvsu5nETMnZ+Xp5DgIn1F2uJO32DmnY7PvHnGkYL5
	1Zjt4vWaRH/Q1YD0b3QwnqO/c2aPrOYzHkqWt1vc1lv0JnnQ+yD6C0oyVMZBxCZU3YjmJ0IlqL2BP
	Lwc/z3SSgusVs6fu1rEK5/1cYQiomNtvElyA7nb07FqVLGN1R3CMJy++4e4PYTv6N+UPZH0I8bhJP
	SVPDML01Ejngfl8h4U9GNrvWNcym+9X/UyQcmLn/eas//OGp7mxE9Ywbl/Uza6foUJkKYV2lQye9x
	x+7F4kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjip-00000006nqk-1JrB;
	Tue, 01 Jul 2025 22:45:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjGW-00000006lTa-2s8J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:15:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D12FBA52F63;
	Tue,  1 Jul 2025 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002AEC4CEEB;
	Tue,  1 Jul 2025 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408147;
	bh=1V9bluvj6qQ90+PrLqZ0V8vdxa8GaJjq9j4rh/X5piw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cq4PLqhBNXHPRoseG61W93iWlprbyQW36RTApzIjVnz5kYav6/kgFrWTTZvIsG5nm
	 dalNoS4X9NsbzXZX5ylxeER34FL6ZwzgcxAhw6cpai9ZNmEhFLc2TDbvQMseEoKCyl
	 lhkStm9uRunHaQXLtsWAjItmhmcwmsnh8UAXNUB+4vpXSv72Tta1D5TrWWeDSdqEWY
	 nGkq5IntSVX0Jf5CXcdFR+c97TDOwbswm0F42+9fap/0a6iZFtpwZbaDdzZf9JD4SE
	 ncjhdj3vypRpxv6Gvz4hYKdlApTqBhFUdC+ghUYHeKKqh0akkrrSL2+4CDf/Flwjh0
	 3+FBqBlRlJiow==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
References: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
Subject: Re: [PATCH v2] spi: stm32: fix sram pool free in probe error path
Message-Id: <175140814573.710092.14100565010751985098.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_151548_793862_28F6A9AD 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, 30 Jun 2025 14:59:23 +0200, Clément Le Goffic wrote:
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


