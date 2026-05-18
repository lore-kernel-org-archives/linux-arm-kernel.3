Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB6q31k0LytJMcDQwueRs0FoTanae9kZTeJ8zDyM3+0=; b=eUODzp4UjiDhvvQmQOZe3az8l6
	Xu2wcw1OHuuG3V0VOqzVdryzriKkr/5nNbP8D4B6JA791bokN3wxOi5aLw4Q3RZ4qsEwjcDgTHhbR
	EMnx0ysstUCJttV+hRLggYI9xQxi4rFLQeC/KZKcAeRT5WD081jY1GJNxb0IbFYcJTsGoEVFwLR8p
	YPX1gz3EYb+N8tWYcZRhwgsvSZttJhcNB6UU3hZH9vRrb990M6kktczxQ/DV4okh0H9k0PCvuBdfY
	Bp7inzSH1JHMlWHHGF3PFRyY/KuLpBGs/ufoG16WSTlGLMkwd+9uCShsdgM5UjN35q2pirKpvrbmc
	2RgHczcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGhY-00000000uno-1UyS;
	Tue, 19 May 2026 09:25:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGhX-00000000unS-1yKD;
	Tue, 19 May 2026 09:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E637960126;
	Tue, 19 May 2026 09:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE13C2BCB3;
	Tue, 19 May 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182722;
	bh=iFOBQrSNZ2nMXqB6+u+Z7u9D0GpUYhiWHSHlDRAvya8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PtiU1HzIPX56xJHRFwwtmKL97cZVTvmXImLcoWFP1yBckScaevop25n4pTqesy64/
	 selgm52QCcN2EPKHzP0lwO88Qt8LnFsFXU8lGMg5x6JERsETeVLAv5Dp1hkNiWRvys
	 5k0LIHV7dNyu+D1DQbOQXchnm87Zl5hVrOr9tjGU/vUfYNVR7c4LjkkU1BkjL4Fx4b
	 3GC3ysia3+L86UjsM2P/2qB5L6PfeNdUQegN1VkzjbJHPZ1bStPgytyrOscaGgGqHh
	 NVebStCNg4LOcsqGPFdhEA5/YlyXEi0fdtlQIvtRD/17yrJrSTFCgTg9V1UWb+3GLE
	 FFSoCc7bWG+Lg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
References: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8196: Fix probe resource cleanup
Message-Id: <177912152253.31945.3862884738428622527.b4-ty@b4>
Date: Mon, 18 May 2026 17:25:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iFOBQrSNZ2nMXqB6+u+Z7u9D0GpUYhiWHSHlDRAvya8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqDCx/ax2u9yF4K5DNV8lZ1HlfFlyY1FliDAHiO
 N41z+FGNIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagwsfwAKCRAk1otyXVSH
 0No3B/sErmVf4EA1gqpVz6orSuSFtNRKz5nrNCdol8y9MjDvM/dQIllkshc0W9DuTaCeCm3ptFS
 +Tx3dsy9M3kZgWOBQldAzsDWDSh0exUzGFKPj7HDH30wiLbmPLwK0KCJBOc5HFA90DnmULlg14l
 ch7m8+I3P/ixjqtc2H2C6pVtA3Zas2X0G04pCRxFWrppBnVNTOpFUyTEBJ/bwHF55AlwkAKdDFU
 dpq+NZ5yHXJUOkpPBQpFIkBkuH6IG9xkJITNGoUwNKPhD6UaelcdcCe3miccB+X/CI+i0hgtbwg
 1h0C8mrtqJ8T/QNG3oAghlSORygv/mXS9BUy5tGeLRaTaEA7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Sun, 17 May 2026 23:41:07 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8196: Fix probe resource cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8196: Fix probe resource cleanup
      https://git.kernel.org/broonie/sound/c/e38353138a09

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


