Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36DCC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jMrRrXO7ToITFTy+Dn74+zcZuWqW3Sm0pnOLR4wKpQ=; b=x0zqnMi7xQhWOtWFv32+xB9BNb
	04b8Y1jVMZ+pqWYsrMtnmcYgppuMl1/mbmNtB44z+fIIhZOH7ShqoOGPDNGbUxcflILJwA7XI+cUk
	3YbACI12lJCqR+3IvAN5wsSWhtHeGWv4z+LeVjL010JA7bAekjummlEJTzJZ3DDLUxVTQD13pdQaX
	GXRyuNzjVYhEBXxveD6Taldt+DDx1xoLxBPRVoAfXXN+27+H4XdQh6KG9gAoY07CHRPXmER0ZdbkJ
	FMmdPgMpYKUtdWYsqYhXVUk+YbpljRBiMS3SnPdD08Xe5jEVjmj02J4pOpDqGKL/wyrOXaqv7L2X+
	h4wcgM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzTv-00000007ROk-3adB;
	Wed, 16 Jul 2025 10:35:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzA2-00000007Ntl-3b2e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D62C5C5B28;
	Wed, 16 Jul 2025 10:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8949BC4CEF6;
	Wed, 16 Jul 2025 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660889;
	bh=ZAJ4hltXuvDrA1GGiGb4i5399iwHMLmhNwupb9CXkxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hOKeeCU/pjKMC2NPJSWQ8DxIWEIVjScFWz7ziwxLtCmiGmFGtOzcvx0qzFB0gHEwj
	 y3OAaC7OkmqXklzm5qmGZyMddX5ZvHHv6x+F8EQa/5mf4t3Mz5v5IEQeyFH6uJt1ox
	 8JIoXzdurcQ2DS5bSHmAiKnPPw2A5jNQca/KpbXj5/OACZlCbUj5ZZ5D78mG3bNOZA
	 sWqPKHNfcwDb0aWX6xKZge46mh1CzDsLdG5AUcSzkBQQnYVSWO+9DZSBhXDlIqmFIC
	 GJPGPGNigitGA8Jm2ggCFE+WNxwyG1EwuLnzjfEH4VMMs58WUl3jzo8TV/TU7g1oyn
	 JYN71CvwLzciQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
Subject: Re: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Message-Id: <175266088527.17737.6588270584150732640.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 11:14:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_031450_975690_463FD893 
X-CRM114-Status: GOOD (  12.57  )
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

On Thu, 10 Jul 2025 11:51:06 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Coccinelle semantic patch:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      commit: 8a4d73121d6bd9a70895e65d6d1014ed6b0a6c8e
[2/6] sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      commit: 4e15a10f6fb254e33d73a6da3c4d00e3e64d2eb8
[3/6] sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      commit: a37d9c8aef1c78876eff0bc8980a889c083de89d
[4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      commit: fc62ed665eb2e8fb0f1e12ab9cdb578666704a76
[5/6] sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      commit: afd529d740028a41fa750d4491b106cecbccba3e
[6/6] sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()
      commit: d5f317fd5cd9dfdf5bbe11384001817760c12b75

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


