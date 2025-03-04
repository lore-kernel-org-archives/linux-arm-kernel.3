Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76177C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myUgTPjkOQjiKaCrTOc1vFYqE39f6Kq/aKoq9TyAcTw=; b=vLHEw+PwX3u/GPwGzoloefUwX3
	xyM6smB8iRxIPUf6vR3UnspWVIbpPAUXlNqQwsYAxP28qPMej+4pWXKDe0dq/Ebj69rQtenNrccs6
	bUm/ZYybDkXsY1bxZZmDbGGylqadVntigdRXxDBEhweKMpN5i7AZxOpIovbYAhY/+8yO6DaU20TSL
	BEOJReZDFDM5Gh00I5fNbCnaYH1zonjbNTaWznXZI91BW7CPXBuECiBMo+dprlJQhwk76CP9NTcFP
	U0duMimQXqGIvz8xlu59DC0xRJmkxV4qeqfaD0BN/bndiP4ttRjff+ky7l1ew9A4mv7WSgFM0GgRH
	GtAim8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTAZ-00000004y4m-3kYL;
	Tue, 04 Mar 2025 14:22:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT8c-00000004xjQ-0WpL;
	Tue, 04 Mar 2025 14:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B31455C4D01;
	Tue,  4 Mar 2025 14:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE699C4CEE5;
	Tue,  4 Mar 2025 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741098049;
	bh=WsLsXCtD+Dlf0AZ4MInt08fRHGyplcvRXe4mxn6hA9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YqCdb9clAq+xJVXfnR8BdKp4nNTMz1YJWpKQM463sXS1cw2Cj6suON0yS3QpsRSKZ
	 uJayxcXLLRMx1UCjUwG386QaFW4cXyX+TqicMkGmjeBFy8t/9IxMhRgr8oeZLYSwvW
	 asiDUJc9sFP5VP6y6AmfikTBb8/j4zmIdKCZo0CF5O7RiiVxmxk+Mh+yJxPDZWcKm3
	 talKqXDCol4K8TgB1y3125eLg1OT86kBfzVM8iIy3guvuhfNrKBdi7tY13xJd+IJQO
	 NqBsvE19xDMGkgfq9EmPdDO427ig7L6ZFh1Ouui61OUYEFwVUBjge+jK+ROA57MoRR
	 AeCog20VFuaGQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250228-mt6359-fix-probe-failed-v1-1-64941d387b2c@collabora.com>
References: <20250228-mt6359-fix-probe-failed-v1-1-64941d387b2c@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6359: Fix DT parse error due to
 wrong child node name
Message-Id: <174109804670.69310.9373110369182366922.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 14:20:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_062050_210756_08D5FB89 
X-CRM114-Status: GOOD (  12.43  )
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

On Fri, 28 Feb 2025 11:32:19 +0100, Louis-Alexis Eyraud wrote:
> A recent dtbs_check error fix in mt6359.dtsi file changed a node name
> (from "mt6359codec" to "audio-codec") without modifying the mt6539
> codec code that uses it.
> It leads to a probe failure after devicetree parsing returns in error:
> ```
> [    1.354025] mt6359-sound mt6359-sound: mt6359_platform_driver_probe() failed to parse dts
> [    1.355066] mt6359-sound mt6359-sound: probe with driver mt6359-sound failed with error -22
> ```
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: Fix DT parse error due to wrong child node name
      commit: 79c080c75cdd0a5ba38be039f6f9bb66ec53b0c4

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


