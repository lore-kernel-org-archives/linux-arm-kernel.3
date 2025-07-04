Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03220C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRw8bJBUl7TCVNH8Klw5RQtx3+bFYmtsMNcnAX9UJTI=; b=FqvtrpfDBZ4sVJjks0yP+chsDS
	7kIPtMm1SdgLi0G7X6/AR7WOcQnps3tj4nxeMfVB1qVQrZiW17jul1gR1+zNkf2N+h51DDF0AR40g
	kMIPoDtn2cHNQNAI0G5FUBl2/4S3bon1HiL+X33tdfefUJY0dMP05+WG/tZ5N9s85RKgrVlT3sHhg
	JCagJ9ljEwvhbHuiAhst5j0kLNQ2c7Rdd1AWc2YNQkP887/ZbyAfvvv4zsQhbG/L7Y3gouhOFOXfN
	D+Gvm7lfGTVqsIVS/tRQP7xFHP3vBU5+lYV+7l5rmMkdbGv9hqRFsWkPUaCgNYRIiAkojgwCk3a7E
	44IvJMJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiwk-0000000EuWH-12kD;
	Fri, 04 Jul 2025 16:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXimt-0000000EtJT-09qx;
	Fri, 04 Jul 2025 15:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67E965C6294;
	Fri,  4 Jul 2025 15:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C95C4CEE3;
	Fri,  4 Jul 2025 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751644638;
	bh=8AiV8GZ8dXSm8Gr4E1ix6z5OY/73wpxxP/YoaU2wWsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCYB0L4ef5CtdNA76NK99aEBeqswiQI3Fr8kzqCEAdZLZOggQCVZGyBB3vmBB34NW
	 4qx1EkPEHv6V7bWrQfJ+aqgwHsY/fnSnxF8nKrGisZxTP4gRiX8qqnaZsk8FUxdXQN
	 KQ3vjX7XtRXJNKbsN9f1rwng5MYzR/4x7emG6fhHMjULEPUNnXSbo0lERflm5YZnx9
	 CAiaBXdUJVF8u9cShVm7CLKV+lfl8o2EHovC3hToDsycP1AFRFGwI/CmDzFNUIcaF/
	 VjEztecmEpBU7W27v7ueEfwcRUxjjdkA52FJljwFQHHl0GDnzC1aGn00SOBd+/6dN0
	 Yk5M9sG81tcbg==
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>
References: <20250703183523.2075276-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-Id: <175164463151.103413.17242498440518772923.b4-ty@kernel.org>
Date: Fri, 04 Jul 2025 16:57:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085719_122796_AE42F4AB 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, 03 Jul 2025 13:35:21 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: bc163baef57002c08b3afe64cdd2f55f55a765eb

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


