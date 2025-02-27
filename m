Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBAC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbqQv9mTISgsVsoSLPq0DwlI+escD/wkkpwj8GOQ6IM=; b=Czkx30coLE/orsZ4ZWwa+yMok8
	n6vjVRMNUdRdDVQk3iqok+0DetWnzBJ8ylu5p2VzQizwyf8T3sTuqQ0o9BQnBxHrgO8BKapdtZ+YE
	wF0DHybcqMgRpAVJ96/Q2zuYP5xTIP21zk+UEiUXLgrJ+wPC1RYIfy1FO9T+7pteV0rjHX151G5wB
	snoYP/o5xPrN88bvhL7qigZPtGVeKcM7zdSDOP63L/YI98TMZ98SQdEB991IGau/tkeBErUkoad5q
	LL13pwdH/H3gNbHt6Qe1i29mKIp6HGEnnB+I/HsPQ3TyvfIU9k5pAt4d3abKsvL/HEEtzsndBtKKu
	BqV+4RYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjil-00000008Wqf-0Abj;
	Thu, 27 Feb 2025 19:39:00 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC9-00000007y0a-3qjD;
	Thu, 27 Feb 2025 15:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2F3461F21;
	Thu, 27 Feb 2025 15:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908FEC4CEED;
	Thu, 27 Feb 2025 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740671585;
	bh=TBF7wUkwR5l5SAlFOkV5L7qayuPJGqlI2MqDmi1e2Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cy8dsJl5R0GGYabMm31a4uFGRKRsFfxDV0JxeTwy/T+jLa4Rls9aVmvo9ZR/WQ+5D
	 L5UAIUySR+ivTBBEiktecSu+8ja+NV9S+XuODphYxQIzh06YTnKgaDwdrHlwhTCpCo
	 kc0sfT4pcosTadJqQpxMk0qSVpQLocvBZZTiTLGnBXENfvcfHs4bMoQAuyETw4q/2I
	 w+0hY4OrS7uikMUTjszPLDLiOf0lz7+kjX9+lptK3DayTJ4A8OchnIT3HMmNQn5bOO
	 owKGVkvrHForNoID6Yn2elgqZ/H3GiRQZnO3F6Ua7CR0B/eThfOVp5QuSxpudr4rrQ
	 dc75GWBzG50NA==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250227131939.1040168-1-arnd@kernel.org>
References: <20250227131939.1040168-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: avoid uninitialized variable
 use
Message-Id: <174067158231.70060.14955037927245786834.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 15:53:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
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

On Thu, 27 Feb 2025 14:19:01 +0100, Arnd Bergmann wrote:
> The 'msk' variable has no initialization:
> 
> sound/soc/mediatek/mt8188/mt8188-dai-dmic.c:311:4: error: variable 'msk' is uninitialized when used here [-Werror,-Wuninitialized]
>   311 |                         msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
>       |                         ^~~
> 
> Set it to zero before the loop.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188: avoid uninitialized variable use
      commit: 79ed408b2402e8113aa5a298f3bb9088ede58f6c

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


