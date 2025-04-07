Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14281C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyskv1uRbs0ls6L2UFl3juDSCNS1luBX3/uFjFdhzcY=; b=N4gIkEODiY2EuFhq3fq1gzNAS2
	60Ya6A5N8EhxptmwOwhykz7ZUxuRgMtaGuD0XliM6OHhiHS+4WxHEPairMqolItVKen+ofwCSamc/
	9WSpfss/C4R5pzKG/bMBAigx6lMD+YbSHMCeM1Xd7m3VM6BAOq3dLUpR11Eexp0Z5Zg4vCvvrJrEm
	D74B9eSpfxG3XBBwiWeFjWED/C9seh+WjvxYiBGSnVt6hv/s0R5jp4oR5W4aAyaYu4Q0NhrzwoZS3
	H/Y2jIJ3jkuWMrPEOIgv+xxEvZNcvhCjZLJiiQq/EFB6bfWh7YU+jf2bDJw1/s8jWfATYXhpUa/yJ
	2Hu7nm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1w1w-00000002JcM-2niU;
	Mon, 07 Apr 2025 23:37:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1w0C-00000002JDI-2QCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B0B361154;
	Mon,  7 Apr 2025 23:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8118C4CEE8;
	Mon,  7 Apr 2025 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068939;
	bh=ey3ZWWQUwBjFT6PlnWPEdOonvwkhLxWm2BvUZXqyVl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nISzhuc5wT0HPam/o+wlMO9LnXkuKbdpP7FGoZx33WUCKjMkaXLkeKRkoftECL57F
	 87z1Yn0t+nkjHUI0oRLuJDG8Sxw1L93S/zNgdhhDKy51M4ZMMxhl8QFMGAXqee0OeC
	 i5GPwyAEGfNEkQKw3wGaf4lN09GEYXeufEPe2ov8DdSNUrXK1EmpQRy5ztWB8gT3Oc
	 J9yLo73GCpnyHDHUwvj7zBWIbunlhrsqFOBJP7Yn5zgWfkAUCtIi/P22qUMgUerx57
	 kChpRf/VKrbdqrLI3XW7WsNDeqPZCij5xdjkuO7VoC58qxUMQTM4V9HhuFlg0Rn74s
	 ACPz5guilxqPA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 ckeepax@opensource.cirrus.com, u.kleine-koenig@baylibre.com, megi@xff.cz, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250325092640.996802-1-nichen@iscas.ac.cn>
References: <20250325092640.996802-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
Message-Id: <174406893648.1337819.14955796765462981962.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Tue, 25 Mar 2025 17:26:40 +0800, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun8i-codec: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
      commit: ad20e1f877b6e0c523154d2c6533b836d4d05260

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


