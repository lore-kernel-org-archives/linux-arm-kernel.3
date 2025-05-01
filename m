Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA849C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 06:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9bxSIjZcR3jzR4JBTTJtiTc40O2VHMHqkmE31E+j/E=; b=k3K6XzGQHsTOPtHunft1PgQJE7
	RONS5LufhWhIcg3WlwdpFRChD183SRoVN53X/J/0vpZv51qRrMo22OBHF9oLaG0D6l20Z9rd743D2
	zfcTP77CeL9C4JqEAqn+zxBHacccFhRPGA1muZmz0J2gNGXBV4P/Iyky2ktfIedQnBWXJU/Psu7Ua
	9IXMG00A0QOw2JSFUnGKSm9cxxKNRrO6IpPUmZoUFD/MkvFtSlGLgZ+irfSEADoSq8er3i6p2NiPs
	k4yyzGry736/PvkspFxrbvRO60V2uyH6LXbC1xhqMR7sixXFvHw6l7SLnrfqVKYlss7p4n6En8drh
	jX6z+LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uANaX-0000000EsII-3dhJ;
	Thu, 01 May 2025 06:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uANYd-0000000Es7m-2OGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 06:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75E134405D;
	Thu,  1 May 2025 06:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE5AC4CEE3;
	Thu,  1 May 2025 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746081486;
	bh=UAP2AV+qSbFSO/2/N++l3ypruXuDaFFIRSPyTIofkqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nTK9N3wFBMkhJe08xeOfs0C9EN4ztFCTh7V3x7cbBbR0jT5Wd68xB2EcCgKupe7vj
	 DMnGWRYowzYv7KdRIGvxdPra3V571FpD5SgH8wudI2jmNigkHtleguUE+3hymi62DU
	 ZcE9DY186mYo9CyQGHEOOzs3DiVTx/VTfjCiBQzDjJVPbqICnlWzA+J37d/A9NYhHT
	 lkBQwunLyYBoI+uT+Ge9aPReAx+9quY0zhLB/ZaJCj9Vy1rvPPrsnLU6ZHGuAYNfq0
	 KVL3zmVq2VcijwmMSIIYIOnxBMZOUydXa6wZbr/pHZi9T5mp0RB25OswPcvHuiLF9k
	 I5+ojStYAwv+g==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH 0/2] ASoC: stm32: sai: fix kernel rate configuration
Message-Id: <174608148419.4032397.674149169345577452.b4-ty@kernel.org>
Date: Thu, 01 May 2025 15:38:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_233807_633496_7D73DAC8 
X-CRM114-Status: GOOD (  11.27  )
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

On Wed, 30 Apr 2025 18:52:07 +0200, Olivier Moysan wrote:
> This patchset adds some checks on kernel minimum rate requirements.
> This avoids potential clock rate misconfiguration, when setting the
> kernel frequency on STM32MP2 SoCs.
> 
> Olivier Moysan (2):
>   ASoC: stm32: sai: skip useless iterations on kernel rate loop
>   ASoC: stm32: sai: add a check on minimal kernel frequency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: sai: skip useless iterations on kernel rate loop
      commit: edea92770a3b6454dc796fc5436a3315bb402181
[2/2] ASoC: stm32: sai: add a check on minimal kernel frequency
      commit: cce34d113e2a592806abcdc02c7f8513775d8b20

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


