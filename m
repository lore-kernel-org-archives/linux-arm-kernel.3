Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SqyEJaZtkItNx+kOGGjlkfVZFMZUPPzB+63/kzBYOLM=; b=HdlXOL+T/8AqRC
	yyYe1li0aZ0QL2Inci+w0+QFgn6pV5CnQCm44RfjCqbNh0Jgci8znGUr3TZ7x0Rp8vo8MPkOEYS+/
	TMPtuFazfI+q9vzl3KCmhe8TPCxEvOXksHD/fHVhvUr7fygDK3QMqddMn/AMdri35XCOzv3CkM20T
	/KwRS/ODv2plTlWIGkvqmeI3fmcnnmJhnphYGsMXATyqbkcqCNsBO96L932s/S+c9ET41s43bbZLy
	ob43RYjdUwp79qTyOG7cRRiLRAeuFBRUMumKx5jzLSqjtBtfZY3h24oBWbKoeiPhoh2ibFPtAA6BL
	rl4yNm4o4XCpnHJNSlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqLY-0000000Em4I-0o4U;
	Thu, 12 Jun 2025 22:24:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDQ-0000000Ed66-0E7X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5E05629DD;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66850C4CEEA;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=NJlC89e85kPwnIrRRCWxs5BdJsq3vAE6W0Ymwg3gpew=;
	h=From:Subject:Date:To:Cc:From;
	b=Iiihbi9s+/pIYtVo3kda9DFbAQHj1W5wOvWbbRaeqNxsjpNokpWuj6L45S2eONyuJ
	 z5ZjNdbX6l3tfFmftfHTp2/1teSRAWg/3EeiNYV+GJ4wmmedWnf5QH60wONxMU3lTy
	 n/rRSvlzhpTklFRslxFI2jWl2fc1S88YMZTYYDX0/O7KMgVMucqRcyeOTKlzCOYcrp
	 Dk80UcrIXXSOdPfmQmlfEosrkWM1jO1oLXrO60K6tLwQgjbUQW3Mx3aLF39efZBQWV
	 giDzstIr1fU4T6X5SZIjlEt8qb9eLedQQAgFYRM9atModgeD+cb+g6RVGxbR4XjaGt
	 kFfPnUccqezKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB4DC61CE8;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use
 defconfig instead
Date: Thu, 12 Jun 2025 21:11:24 +0000
Message-Id: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxCS2gC/y2MQQqAIBAAvxJ7biELw/pKdFBbaylMFCII/55Et
 5nDzAOJIlOCsXog0sWJT19E1BXYTfuVkJfi0DatbHohUIdwEO729I5XXMj9ZKRUqu+0smaAUod
 Iju/vPM05vx3OGPppAAAA
X-Change-ID: 20250611-apple-kconfig-defconfig-b558863a8cb9
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=NJlC89e85kPwnIrRRCWxs5BdJsq3vAE6W0Ymwg3gpew=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a3U6dZ4Ztcjq5zQonza32t3J9YGMQ0PjDSnbD/jIi18
 ITHgQc6SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABN5Zs/wP5kp4uxT2Zp2YWsl
 +cmOLgVCpo7J3D+thMpvP3pTXrp6IcP/nIMz18Rev6yRM+OVyuwn8YGHl875+rOvr9AyS+ldk5g
 6BwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

When support for Apple Silicon was originally upstreamed we somehow
started using `default ARCH_APPLE` for most drivers. arm64 defconfig
also contains ARCH_APPLE=y such that this will turn into `default y`
there by default which is neither what we want nor how this is usually
done.
Let's fix all that by dropping the default everywhere and adding the
drivers to defconfig as modules instead of built-ins.
None of these patches depend on each other so we can just take them all
independently through the respective subsystem trees.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (11):
      pmdomain: apple: Drop default ARCH_APPLE in Kconfig
      soc: apple: Drop default ARCH_APPLE in Kconfig
      clk: apple-nco: Drop default ARCH_APPLE in Kconfig
      nvmem: apple: drop default ARCH_APPLE in Kconfig
      i2c: apple: Drop default ARCH_APPLE in Kconfig
      cpufreq: apple: drop default ARCH_APPLE in Kconfig
      iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
      Input: apple_z2: Drop default ARCH_APPLE in Kconfig
      dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
      arm64: defconfig: Enable Apple Silicon drivers

 arch/arm64/configs/defconfig      | 19 +++++++++++++++++++
 drivers/clk/Kconfig               |  1 -
 drivers/cpufreq/Kconfig.arm       |  1 -
 drivers/dma/Kconfig               |  1 -
 drivers/i2c/busses/Kconfig        |  1 -
 drivers/input/touchscreen/Kconfig |  1 -
 drivers/iommu/Kconfig             |  1 -
 drivers/nvmem/Kconfig             |  1 -
 drivers/pmdomain/apple/Kconfig    |  1 -
 drivers/soc/apple/Kconfig         |  3 ---
 sound/soc/apple/Kconfig           |  1 -
 11 files changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-apple-kconfig-defconfig-b558863a8cb9

Best regards,
-- 
Sven Peter <sven@kernel.org>



