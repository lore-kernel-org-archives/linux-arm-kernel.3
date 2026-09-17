Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B964C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgMv2zbGxpMjSU1Q12TUieC/fHlr4upj7o7tSr9up10=; b=yzmuZtFRgGfrjrx+11BeKYZC9t
	6CYOlFqS6QcPW7zrBTXUG9FR7ImUySe4hs7+ojJYPvz6hrlpmuSzsb5xEw36Cwv7VLuH4o+jdBLaI
	OX0chOPgvocgjwV2PW4rSx6dliKzooV3OhhL0sgw3XFMnhV1f6dIxGw2oF2LfW0KBHBKyEyprDJ6B
	SJtfW+Fs76rl/XFWi5IoRYD7qmNNDTDxySUhdv7dXbQTQiqLy5c51VilfwYTby1tdYy9A0ej+6oSG
	VvDC86rjDtQWXZVxF6Bmtgzr892dKGsTLsNeIHqqwJc6N5bsV3a7wZUMCYk9OFr/dmf+O/cuB7NmU
	Qdno7YwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VNT-0000000E1Yw-1oli;
	Fri, 18 Sep 2026 09:59:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VNS-0000000E1Ye-39mh;
	Fri, 18 Sep 2026 09:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C8B841E74;
	Fri, 18 Sep 2026 09:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B94A1F000FF;
	Fri, 18 Sep 2026 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725570;
	bh=lgMv2zbGxpMjSU1Q12TUieC/fHlr4upj7o7tSr9up10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Puu3U2cZYIyWJMi7D+z6178AnlTL7FE1Zy1y55J+Pia2TSVMLauoTfBUy3vOIOQM3
	 yZJsMkBSz1D+q4Flx42onJbGinBIvq5VvndXAbuS3PH/cJfBC/K/jH6uGH1HiTG6pU
	 xvUIgrRf1/dOcfUvWmcLdVbitzNEyYjprAlng8K9Q849ic28eYBoCSSTIwN4F6NWfG
	 yOGOgW0Iww8zFBfqyrGj9A4v0o/Vp/TqK2HT6icehU0pAkXgm9ytw6/NjKouPe6lcp
	 pAdI4rtS+fjoaKLLiqeVKHEI6EknVvq30GsAcOoxFrMOCPRAlopNG20bkVoovw16sH
	 q0qXzqrb4epvg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20260917054001.15728-1-hemanth.selam@gmail.com>
References: <20260917054001.15728-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH v4] ASoC: fix typos in comments
Message-Id: <178966626559.285745.8708474287640144157.b4-ty@b4>
Date: Thu, 17 Sep 2026 18:31:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/zRSak1lAxIbHDbqXIouf1cZlAlyfRMZrnChjylsPLE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQt5bTHOE1BAdFm/GOH5MgfjjkzvnxEiNN/fC
 VdR/OVoCgaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0LeQAKCRAk1otyXVSH
 0LA+B/95jFomfKKBgRBZ3Svo7TgDki1UIX7cgIQ3816/CKGuiu8nh3Qj36vZl+2xsX8R4e6+9Aj
 FyFv4gZ2anBe2u8QdnAsP1otAPXZVsvagmbp6t6jIDEQkerLsiUjesAuDdtyIN/DBaM7gdf10mc
 kyDJIx4iGPlf9g1vCp0GeKX+Ysb8mxeV3P4mo6X11U4ELBOvokDC21053xBWBlaWUwLlnM0zll0
 8yJKNt6Hbr8Wp9GyAomW7NaLzuPRIT5jJAToWs7+G+epN/ObyezHBTEDGKNYe/9/0SSaAMtALzb
 oWKiqNIa3OLge9jH+LeFUk9plwFWNOeCWrH4DdpbGb76GqfX
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

On Thu, 17 Sep 2026 11:10:01 +0530, Hemanth Selam wrote:
> ASoC: fix typos in comments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fix typos in comments
      https://git.kernel.org/broonie/sound/c/a603fe4e0003

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


