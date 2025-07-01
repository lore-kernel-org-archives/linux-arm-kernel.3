Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ECBC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+V1PZStc5mSCivbvLVzdaDQRRIJ2feBAqG7FukluWM=; b=K90DAarj0wYc79wE8xfMAWaQt+
	rSCu2G9mhb5B0qJoyuRvx2voMSYKEhGoQ6IMKSB/evS7B9jz0206Ukg3nucWFo2PfmUyAHY3E5wUM
	FG8sSs9V57Vt63vHeiV+YysPLybSdC2eV2gByEm3hASDqMzt8HiO5iYeHhyhwun3E4CsgOiouz2Ck
	v2EIxfjpqGJ26zJ9mR2yw+6w++ujlUm7jr2yEXNLyZ1dgBogz1U0vMr8Qw+MCeKXCOorrsCpxgwZ4
	Eyd+a7GJ6tPQL3qHKb4eyqIDUJAFOV/2RocnWVvcxQa/ksuNFabAH1Wxo4mvVtwuq8cDNf0XHAcY6
	jrJIKspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjgW-00000006nhq-2aEH;
	Tue, 01 Jul 2025 22:42:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjGU-00000006lSd-21KR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 22:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8B89434F0;
	Tue,  1 Jul 2025 22:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05D7C4CEEE;
	Tue,  1 Jul 2025 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408145;
	bh=4/b8oqiRmO+b+wUXBPdUv0i7HKBQMbmTAdJGmIM73J0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iFSHhob6VYlotEQFMnbn6Z/8/9kI+kAVa2ZTO38a/6avAy4RiCDdgRfKJI5XblMCF
	 pYML2+zZlmGPQoP771B1+10lkm2+n4zASUeKtIIgpXk1N9PsRrowtfWiQxhMa3zwF0
	 Nek4iXElagCPjfQzmQFV28fSUNXzkIN3ebbm+0R+4+/QnhkMXf1utFpJ2/6aA2oEVh
	 gVFzRx5DtM5DhuCCp0AdBD2Cemhpn5WdPUAd71691epNKvg8Ohjyk2810C7ImljUlb
	 rH1F9xu3fMctiylEoddORPaM//OSWMcPyiwcwvGESxdJZHyFqWRlAqbih+0h8yY+8R
	 +PhiOjMvPgaIQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Antonio Quartulli <antonio@mandelbit.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20250630081253.17294-1-antonio@mandelbit.com>
References: <20250630081253.17294-1-antonio@mandelbit.com>
Subject: Re: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
Message-Id: <175140814365.710092.16438205627985189965.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_151546_545607_B8919FA5 
X-CRM114-Status: GOOD (  13.37  )
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

On Mon, 30 Jun 2025 10:12:53 +0200, Antonio Quartulli wrote:
> In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
> and rx_mdma_desc are passed as pointer-to-pointer arguments.
> 
> The goal is to pass back to the caller the value returned
> by dmaengine_prep_slave_sg(), when it is not NULL.
> 
> However, these variables are wrongly handled as simple pointers
> during later assignments and checks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix pointer-to-pointer variables usage
      commit: c4f2c05ab02952c9a56067aeb700ded95b183570

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


