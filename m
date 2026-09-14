Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA796C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBVUB+rZ7j2Dok9x4TAglY73jOcPB1CQmY0vslpUrio=; b=Q/v92bzTIiMj2H9sfmrhyfKdMP
	XJ1/S9p6jC6DqYlBvzAwVvBIUlcEj6OfQ3sIBaQubB9yR2Y+wxxuYxmW373BhIb0JVh086fiNrpDc
	Tf6qQs0sUiVfTJ+yGFe+/W0f55ZleguTyz45/WUqksS5xkQEauoVv2CPjN6/SUut2fc2KpDeKgOzF
	/aAFRxpqyNwQxDimbo1pJnC56GahQG4UEo/SouNTSekE8z1NMoq23ZTjDIkio+MAimBUBPmxwYi3X
	7b+Qy/a/TXSntgonKB6lLn7EgQxPAAw4ZIVlDApBVsf6OgWglvDHV1Zv5R9k3SLmeMmYy89zs1qU8
	pD/b0IFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fjs-0000000FXly-0HkG;
	Fri, 18 Sep 2026 21:03:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fjq-0000000FXln-3PXw;
	Fri, 18 Sep 2026 21:03:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43BA9432C6;
	Fri, 18 Sep 2026 21:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEC21F000FF;
	Fri, 18 Sep 2026 21:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765398;
	bh=zBVUB+rZ7j2Dok9x4TAglY73jOcPB1CQmY0vslpUrio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EquH21eDjld/an88BVJInTO7kzqLbzkbhO4GX8J8pNG8p1QYnwb4dRn3iAgBIbfWr
	 OkT/lCUUqO4yXOWNjNhOVEHkWTAl0rPrKD7JrS1ABU1sRhS2I2jkt6x/H9BZq8CQiz
	 EyOZoikrcCrvDPm8Ia/PUMsgaY2JcW8RmvD8Or0TvNHGWRys9AQtM1fpec216z+gzI
	 zJMexvjUOdcIkSbgU+s54ncFfdKhmm2JezDhrQlHvMImZKzQKr/Cm882nGO/t+rv7R
	 1D65458XG5rZ14aF3reQ39elGXlbZQ0nq5wn3m0waz2zqTDQnOelGV1zLVRqV2pN5s
	 ts3i/y8NF5qBQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gary Yang <gary.yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/12] ASoC: Use
 devm_of_reserved_mem_device_init()
Message-Id: <178941200290.1239410.15128719985401962631.b4-ty@b4>
Date: Mon, 14 Sep 2026 19:53:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2791; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Gb3QfmkOrVGIOg3Os7Iaodaux/izAj7p3PV3IKXh+fU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqracOJJWQrLPDtSKiJSYpghDcGeKoEJK1wdvqo
 513w+6zGRKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq2nDgAKCRAk1otyXVSH
 0MLgB/4jhdeXKcFGMRCCOMJElsESDYK/RiLzcZOpc/umujbrAhMQfEtatYYIqDO7C0PzI8ZYQI9
 MdMEsMKSBkFJ08aEIR5tjImNZQ7SuNNJ/SgjtGVt9Hhkj0OEjN0eNKQQytEntJacRYMQO1UPgPk
 Uf3ruANx91aa3b15+zkFxy6kr8RuwQYFP4nddp1PMt2PChGYL4/4G2ipzwkuf2ksBUvCTavby97
 P8nBFtQ3vuF7kquhtSHsgobzow6bwfySpj9+rvteitlbionrYAYYofjlp8tH39cFcdZxCMXZPPm
 YeoW1w2tzJfFKdmd7p9RQ7IqHdHaOZciA996BukFHe1eHNx4
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

On Thu, 03 Sep 2026 01:17:00 +0530, Mukesh Ojha wrote:
> ASoC: Use devm_of_reserved_mem_device_init()
> 
> Several ASoC drivers manually manage reserved memory lifetime by calling
> of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
> in remove. This pattern is fragile: any error path between the two that
> skips the release leaks the reserved memory region for the lifetime of the
> driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/12] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/14318426e2c0
[02/12] ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/68cd0442f674
[03/12] ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/573d1749fcb3
[04/12] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/34dbfae252c2
[06/12] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/f33929d53089
[07/12] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/55be77e8a5fb
[08/12] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/3167f3ca6c77
[09/12] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/4169b6a5cdd3
[10/12] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/6b006d357f03
[11/12] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/3531143e9cec
[12/12] ASoC: sprd: Use devm_of_reserved_mem_device_init()
        https://git.kernel.org/broonie/sound/c/e88fd9fe81d7

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


