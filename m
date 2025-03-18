Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEC3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71bezMcj6oTYgdvShxp6IE1G2GbKCrGpkhEqic0PU3w=; b=Psn/9qGfoWQgB5AvVZs7DJIzTs
	iWLDjD7YCG/iJb8IJq5geSOrG37VoeV0zbMaGc74lt/uERq9qfmbGtkKSM/a7cDlRjzUfqfWUiwd6
	VJankVYntGGdmESOAdsvFpCP4ZxnRlOB2Qylm6TzJLHNfrvcem51ZO62b2chrSS4nu54LgMmcD3AF
	Pf5BbnOE3PEPKN8+TZhbjc7jYSYKhZSQYv6v5HSUNwgAJEoPsIt2V3ZFSRIBubFmpjG4bxWAQUYlT
	ntMhuciF6w+gr/7awBGtFZXUMs3aZHuZESkD/GxbaxP1pCoUpqLPWKVkoUTUKlcUYq5QM5cAfyNEZ
	fSKCE7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua5I-00000006aRf-075u;
	Tue, 18 Mar 2025 16:46:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZoQ-00000006XB8-2izC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6CE29A48B7F;
	Tue, 18 Mar 2025 16:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F165C4CEDD;
	Tue, 18 Mar 2025 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742315345;
	bh=CQkTVR5W6jN8FTtFT51uf7uIVr+B3UlEoOqBrGiOb7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A8rC+aMSvzneKuAVXqlowQjEw7mMOE4/yL/vfEaKET0LPR91ma51QNlLHPWtzcks4
	 +dq6bkEy+qPOMq+nSVqZfAhnu2PUvSgT0+JRElYe88LOBhKHlpK6/UMiQXeQ8rG53G
	 DyLSHfS8W91e5XoTwH8PC994bEn/K3fIdRiRUokhrL1wSn/p8j3pMRx0zEeL1Tr2jl
	 Ooo1+6t0v/OjdAZIKud3IuNVceS+qBJG3ET+pwwpfnYRCArE7Y6JVce2E2frm191CL
	 T6NGdX83EMKP881E9Swm086+ITvUeXiXjUsCqWtdwFuHsKdGVxoHFb4EH0EWjzk4om
	 PrPEX6+lUYaIw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Subject: Re: (subset) [PATCH v5 0/3] add sof support on imx95
Message-Id: <174231534280.179247.7213620173027724495.b4-ty@kernel.org>
Date: Tue, 18 Mar 2025 16:29:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092906_770176_964A4A1A 
X-CRM114-Status: GOOD (  11.36  )
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

On Tue, 11 Mar 2025 12:32:52 -0400, Laurentiu Mihalcea wrote:
> Add sof support on imx95. This series also includes some changes to
> the audio-graph-card2 binding required for the support.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: support imx95's CM7 core
      commit: 811944a790451169876947a89338d2b86ff9fe5b
[2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
      commit: ed92f40eccc801bd0e5dfd78b1058072638471f1

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


