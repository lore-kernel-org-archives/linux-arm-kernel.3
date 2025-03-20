Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4A4C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBXZFZKa8LDjlc/JTWPsNedm+mJ8+H4YCBC/dAQk8YQ=; b=YTFXpovh3qb3dC6hql4rEHAIk9
	DjTVFIARLO69caoIQJ0bO8lBDKuUiMwxEQzEQrtwr6k70Q36HqerxK8Xi0W0F08Wn9O2iVxtggjt4
	7beGrEX4eqwPAF4pg/BEz3nKLWWKo89b2NnfG85LGCzpxCEXDYFF8HBHRYhzwXxhSUxJb1EtuYii6
	GJFZHeMwbviO5m2M3tIB/4TgWm8pheCoCVVPBF5Gc1x/6pquMoD04nwsAlzSisYJmTUQQgsLilcYe
	/rqzL91bCUVvnUN1C8i9f0CItFUqGLa3rZgRRqhpmpESpvyUiZEbImb1Jy5Ramg1NhNGEFd+NYeyt
	hVlkTaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOoW-0000000DQB6-44Rm;
	Thu, 20 Mar 2025 22:56:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOmp-0000000DQ4z-3WAg;
	Thu, 20 Mar 2025 22:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A711615BA;
	Thu, 20 Mar 2025 22:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6FAC4CEEC;
	Thu, 20 Mar 2025 22:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742511290;
	bh=nZPLQ3D+uW+IN0lKkOGwBecX1CKPNktsCOLGMTU1uys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=moz9M5eqGvtHwYSNUow+2yVsDJyG/hiOjsC9y3M4VqmHk4NAhe6dQSuejPIUYSAvY
	 xSaFVmqHjgKt8XylZ1OKLexMGAHguQqo4UaVYIgrGqQRzqQp+lU185cGmDAjBG04r5
	 DNPM9canzRvHmeTPl20Io6QZcq6Ds47b0YCp5oXa2Jt1WEtayA/2BdboKrh1bRYsuz
	 KwrHBun9AgpnoFG3YQXc0AqaeC6vQU1rNspK1r7V91uKfhzrZIe0dcoIFU5hLf5T7p
	 TLbfp+K1BvAo7W26TuFXrwaVWFFBz8V5g39wahTyBgMQ3Qz/k3k/BWoRGzJbG+124Q
	 65T5X7xuOQcJg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 christophe.jaillet@wanadoo.fr, gregkh@linuxfoundation.org, 
 peterz@infradead.org, krzk@kernel.org, lee.lockhey@gmail.com, 
 u.kleine-koenig@baylibre.com, cujomalainey@chromium.org, jakiela@google.com, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250320115300.137410-1-angelogioacchino.delregno@collabora.com>
References: <20250320115300.137410-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Commonize duplicated functions
Message-Id: <174251128562.367646.10336285275014385543.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 22:54:45 +0000
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

On Thu, 20 Mar 2025 12:53:00 +0100, AngeloGioacchino Del Regno wrote:
> In order to reduce duplication, move the ADSP mailbox callbacks
> handle_reply(), handle_request(), and other common SOF callbacks
> send_msg(), get_bar_index(), pcm_hw_params() and pcm_pointer()
> to the mtk-adsp-common.c file.
> 
> This cleanup brings no functional differences.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Commonize duplicated functions
      commit: 24489150c5d9afea54c6909ba05c4dbdd8846dc0

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


