Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZaFrh8kt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxFetTzI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+hr47Hk813AYik5NJU+yw3Rz472y+fvQdwF0l6BcStY=; b=ZaFrh8ktFCgDTi
	iDhzW3J0aLfuqDtqOFL/+k8HALx1a09AXV/5RM/BWjV3sCtQjtV4buAD4Cipo6xtCYRt3si2S7+AY
	rjv3g8T9D0WDyJBAMKv3qR7QUrZ3+YxBoF/eASA765vT7pEUr0ZOvAaOqmwwHwD6V74ilHj6B5hyX
	1FmvVVFV34DWaAH1c4iyGmJ7KyRlSBJktj24Im4gG9TT/rG2ngwBjghEkqh7TMj6haho7QsGW+XEE
	uksDRjVNPR5J6CT7YWnXp8etut60ShycE4uwtCfXqhoO+kihXsDGYKf1owVyeJqqShsVHakO9D+sa
	IRMrWwlrcDRehXrUf+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxsp-000000007LG-2xAW;
	Mon, 02 Nov 2026 19:39:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxso-000000007KV-1m7u;
	Mon, 02 Nov 2026 19:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87563600D1;
	Mon,  2 Nov 2026 19:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220C71F00A17;
	Mon,  2 Nov 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648393;
	bh=+hr47Hk813AYik5NJU+yw3Rz472y+fvQdwF0l6BcStY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nxFetTzIL5UYnLxX5DgqK6jlWZuD5mc1zgg0tMiild6CJXEvpGRGc1RbL0gXp1Ngp
	 EQbuJgl56kc607IB6i9lP4VsdBiivh+hDHpnipv075t6XuVOxMyB3Ioas6BJpUk0CE
	 kB74+yTnc3MTF7r1D3WHdCCYwEEWHaUdm1/QophHHDkZEP09x+0oo/7lp9Nr/RAH3U
	 WZzz9dpRmX5tIc5kiGpbP1OxG6vraMSjm3cMGu1CoYb+bASemUo0M+fB89ALA8d568
	 /23c0hQUHuYzVZcagzx7bghyfSL7vTb80voiruF3VBVJmhwFP0asi5HZ9/ylt7xjsD
	 91WVicG1ND4Tg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6FD1123DFF84;
	Mon, 02 Nov 2026 19:39:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
Message-Id: <179364120718.2092401.6849557179336319452.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:40:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pXl5T8gsWLu33daWLNNPPXrdCPSt2HvsP3yyJzfM4o4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJePGdX2PtX/PncCBXdGgbDCUu/SE6tE+/OcuANKPkoY
 5ZskW7XUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIksOs7wT/3BZ01T4Z3eF9/u
 nJZ27ImI6avmnRODFjGHZp1heLm3X4fhn8r6DzO2ekt+6XpX3yz1QvjX0cplh6brPbSuZ9nAv0h
 kGz8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 18:14:56 +0100, Jerome Brunet wrote:
> ASoC: meson: axg-fifo: request the irq with the clock enabled

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: meson: axg-fifo: request the irq with the clock enabled
      https://git.kernel.org/broonie/sound/c/82fa7bfab6b9

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


