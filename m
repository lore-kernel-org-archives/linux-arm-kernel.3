Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FE0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4hKne9IRQO6EzSNU8aUUBRHAuvSrJt2vOW6NdUcWG4=; b=cz0O/Zn+FEROwmS9B/EvCnVQ0S
	Pa9sKr1hHFMzSdPFBG/xqJrqgRNwp+HTqZyxpfo5h2vYaTuPm0Q0eR3loi4sjKGFfdDW86TUJGmtx
	aigbQtC9ENL7AeWRIUa9459/tymDpxwspdQ1rUHlj/RtV4CiDyinedzwl0F5GTMKJP67Yd68G82mI
	li7dp0LkxrAo4+bD8V1S9MeJ/+v0QLfbker94k4/ZRFbE8Q426YcjdcS4dmyd9uxEerAC5md1uBce
	uA0/3TVioshvEjQtymo1Fn8dmsu7JWmy7+hrUk33cJz19VNp7IUnHg5l2U532WOEAlVKx/Trz8kof
	LlhGwy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVKd-0000000A2QZ-1pj6;
	Tue, 18 Feb 2025 21:40:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVAZ-00000009zyk-3jeN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 21:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57880A41BF3;
	Tue, 18 Feb 2025 21:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7B3C4CEE2;
	Tue, 18 Feb 2025 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739914218;
	bh=iugNd5aqwShQWPWcFsJiWz/STHgr3PfIz7/YAOGm5qc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ynb5WF9Hiq1Ft0QF/6eM+Ek0mJRXnUxpfU2cINsFQTfyesCyOxJh652LXYTeFB4u/
	 f0wwseXMxCStQQWq2pa7HE03YSGIf2REOIJd4NnoNKOlyilv+0d9FOCdvYOpzH9a01
	 uo9HructJnsihzc2zJ23spLe+DnwP4I5U1K7TuzQ17k3H4Cokw3RZ+2cbfqz5QJzkQ
	 BViO8R9kbblsN9uShQPcVhrtN+sEGMj5dV9++RpN0euWY0qBEJ9cMP4VIjQq7Ls4Lx
	 URbgHg+suF0U301Oq0UAEnne4I3y3qGyQaCa60xxnAYerbd8apQk/J3IxS6+UitglQ
	 IX5jbNM3bihPA==
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <68973636-eab8-4d82-8359-ae2c8f60f261@stanley.mountain>
References: <cover.1739435600.git.dan.carpenter@linaro.org>
 <68973636-eab8-4d82-8359-ae2c8f60f261@stanley.mountain>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
 imx_parse_ioremap_memory()
Message-Id: <173991421399.1713371.18034640725263597167.b4-ty@kernel.org>
Date: Tue, 18 Feb 2025 21:30:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_133019_997339_E49B67C7 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, 17 Feb 2025 10:32:44 +0300, Dan Carpenter wrote:
> The devm_ioremap() function doesn't return error pointers, it returns
> NULL on error.  Update the checking to match.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in imx_parse_ioremap_memory()
      commit: b20be2c77ce5341ded1a2d8aec119f6dca8ef1ad
[2/2] ASoC: SOF: imx: Fix error code in probe()
      commit: a78f244a9150da0878a37a1b59fb0608b1ccfb9d

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


