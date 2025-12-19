Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DED78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDiNxcz4uegGRRY8c9t3buQNhQ1Ps/klNqdRzhAu+eI=; b=mJCtY00cVAmapRzg5TRZPyISTS
	gXyyg6pnT0lRphKVzkZLmBiBu6DWhsYO5pexcK2ELMg9uLWNHabBxsZvLIFiSkF7udGW3BQGioJnZ
	M3q1ijBtF9vlSE4I7Kq1KxRioC2CvnJTWVVZ4+OJJxQLHx+TdPVktPj++xGDydJQ4Sqa72UZOdrVT
	2foawmuhHzNPrRVLhh04RJc0QOuOb/85+YHqMVVGzw5MEoT5hGoFfYg/LLUnUsW4CxLxpSc+xJ1p7
	cc1K2aNcAvnJxiyOX8SwIBLFz3vDUAuyiEf0KOyTKspUQ3t4ClhO0wypKwjmDuRrQ5d0DfIJhAC6w
	hVuXtofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa7M-0000000AKJP-3pSL;
	Fri, 19 Dec 2025 13:02:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa7M-0000000AKJF-09Yy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23C7E60008;
	Fri, 19 Dec 2025 13:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4FAC4CEF1;
	Fri, 19 Dec 2025 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149318;
	bh=IcOQ2q6331x/sFy9lNcJP8nlM9e3AYGl939jb8gmCmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sGE3TLtDns0o46iHdyt2yvjTYf+qmBLsez2FBT/V+f8PcdkRmfkKQuoytOLGJwQsx
	 JrU/G2tXYBvJeDh6wdUdhhv6mggP/NFZ/SiOoLImEh/cE0652FHY+bIiBzN65UnbXb
	 nWswUlTNCLY2fahu2y9WyWPfibt0zgL7D+OQ/hzsfcnsihTSGmcf6otErRikPD03w6
	 V85TY33eKYxD5t2N5dS8jBy4GwVBJhP3EGdrSXT7qajTwaiD/NLQi5uuZ33TEk5odc
	 vh/ZM3vqGCiCUNui6megm0KqlkbTHV8F0AqkGWPOP9CPUOVSX200Kh94nDwtGhHZPH
	 RFOguO2yd9DhA==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Deepak Kumar <deepak.kumar01@st.com>
In-Reply-To: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
References: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
Subject: Re: (subset) [PATCH v2 0/4] spi: stm32: stability & performance
 enhancements
Message-Id: <176614931636.368879.12913941748381812149.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 13:01:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Thu, 18 Dec 2025 11:48:26 +0100, Alain Volmat wrote:
> The series fixes a stability issue when dealing with <8bpw
> transfers, as well as enforce an error if the DMA information
> provided within the DT are incorrect.
> 
> Performance enhancement is also provided by allowing a polling
> mode which is triggered when the transfer is so short that
> polling mode transfer would lead to faster transfer than
> if it was done in a interrupt driven manner.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: stm32: properly fail on dma_request_chan error
      commit: c266d19b7d4e5ed993ed9fca25ab9d11789c41ee
[2/4] spi: stm32: fix Overrun issue at < 8bpw
      commit: 1ac3be217c01d5df55ec5052f81e4f1708f46552
[3/4] spi: stm32: perform small transfer in polling mode
      commit: b39ef93a2e5b5f4289a3486d8a94a09a1e6a4c67

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


