Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D85CE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKhgvYd/B30XQnOdEhkri59rzk2MdTRvmoML3PKvj0o=; b=L8htUsMs0Jlqkq030zc7thgPmw
	Dd7xaJgjtfwD/VEracxcJBmzeNnnfK/WPELm7NOR5TP1dxtmkmS328V3PFUCBJeBZfIzDd+d+gz39
	p0dSyN8ppKBBbv7nx6wFUj5hIUmsWpNjSzK3T1rA+hd+Ss/JGTTl03pMCgub63oEsDDJSGfa/iXOt
	hwu3/olIkO6HOKm0JllYLr/dSsWwDDduYmDjkG07lUXRrIf4IDqHgMaydQBbmlLxPEBTUraLfs9fD
	lIKwPSNIIbSCeOrSVqwFL1rHR/ToLAqdQFZx9eOUqApLU3cjNC1kN/gk9OWNJqVDvbVIoip1rg/7E
	N9fCo9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0DY-0000000DNR7-377l;
	Thu, 09 Jan 2025 21:37:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0CL-0000000DNDo-0fFO;
	Thu, 09 Jan 2025 21:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C9B65C5C25;
	Thu,  9 Jan 2025 21:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BE2C4CED2;
	Thu,  9 Jan 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458572;
	bh=oWeTJvSV3nU7lPJyh9EggaBihBXttmXhilPkA3sJrXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oVbQgnr2o9IBzXfuPGiy6YIzq0h+rk9umsnGXfNRsbuH10pOIdeP0lI6GCklflxI3
	 /ZbXvbCbz201neyTUEVSVQ0jMXTgBMNG/3qF+isFJBhISHbtdanNLA86+vvZY3PLf/
	 02mS34PvKCf3VL8shO43TxPmfAbn7qL+L9NFHnV6N62/p/BL2CHPHRuiBNxP2ouUTw
	 +VrJDJYWPkkE9OfQWwqvPT54ONYeV2uhlGiOapND+gZBv2o8Z37lQ/4BXFwP77aYIC
	 ba76SHPNNvpi5rlKVwsfXpoApETbhi6wPHfimN1q3B7KsQX64Or6l4YBvnm3cLH+0T
	 72c+zuf/Uu9+w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250109182303.3973082-1-robh@kernel.org>
References: <20250109182303.3973082-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present() for non-boolean
 properties
Message-Id: <173645856449.810998.11706229796048790590.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 21:36:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_133613_244913_98E7CE3F 
X-CRM114-Status: GOOD (  10.66  )
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

On Thu, 09 Jan 2025 12:23:00 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_present() for non-boolean properties
      commit: 84eac6d478c00f8f9101f91716ea3866d2fc1e54

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


