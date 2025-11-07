Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1036CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rect4RngIrk1OXsg0j7vkKsHi7JuTB0+B7rGOVMoyOs=; b=MHZaE/QdxZmPewUU/bu6oVU8OA
	WabluG/OyDop4eqpD9qD1xunaiihr/BBIzR/pCfpRO7VZ6vpvQb+kruYRLRBkjNRJDlAsfS9X8M1A
	46JkTtCFVDSyjkAFOhtkGzo07zyVLPubXN2dLyhFjp2q2WF9DrTyAJlEhIiZGXp64A2atFaN18fmX
	p4yCSreb3LD3LUx0q73cQLlgv1HueEtUcAeQNbQ9m8lBT5D9PTIkNakHfraMFxMxQV6McpZxmcboR
	m7FCINSFO1VcaaExGyMFKlpQlsXmq1pbcbN3Y9b6mBgCdpVoLreTeb6vj+K+LLXo/GMRhlz0VI8ZR
	g7nc3P6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrP-0000000GxrR-3BJO;
	Fri, 07 Nov 2025 09:34:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrN-0000000GxqQ-2kcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E65DC4047A;
	Fri,  7 Nov 2025 09:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B2EC4CEF8;
	Fri,  7 Nov 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762508060;
	bh=b8R1CDSDpojhuYBWHDM+d1NPiz/Bo7/dWl4kOM7jZfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mxDD8XJ5tfK0QAmAnM+hfakfmYb7I5LqEWpL22jUZZXhSravEg9Apis4S7hrrX1MM
	 Ry9nH+dI2jK+iU56vZU6U0P4+UuKh2CfxrKxLJEIGeW9Rr06yScfN+ro/w9ikNUWEo
	 KQJy3mEjBaJnGBJolu3ufIW1926nnrp2cU886rGBwx00Py44L6jua20TL0VsOX8XfO
	 ZH2/qTTFgqopxmADiYFVxtRPNkaJ4TYFXzDDhNlT6viDr0nSEzcYQ61QZvKcv/3UN7
	 mZmcRVa+CJezDNOjrLjKU3GfeVDsg/QJWCh1iNKPz3QXdRCL6VI5ekYsICe07OyjB+
	 yRdQPUpTHSlHA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
References: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
Subject: Re: [PATCH] ASoC: stm32: dfsdm: don't use %pK through printk
Message-Id: <176250805658.2488867.15310894982146426101.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 09:34:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_013421_722341_A29BE4DB 
X-CRM114-Status: GOOD (  12.86  )
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

On Thu, 06 Nov 2025 15:41:57 +0100, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: don't use %pK through printk
      commit: 4db4ce15706d6423cc4cac4b05114b0469507bad

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


