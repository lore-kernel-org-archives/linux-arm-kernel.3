Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E3C7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5xjzkvhUCUqCbitEwKOB4Kh6ItWZE0qqZgFDh8DMcY=; b=TwVngx/u03oyfdU8DhmyueGtjp
	MAP/6Eq4ymI+bzq2rhDu6y4NdFqkqsBzGA6wfI33WfBCkH3RPSuP1G+KLMAXLuSAcRiWcRuBY32xB
	X3WpMJgB39x7EeUOrIp/w5St5brzzjHWqMLVq7xMqukvTPFEjSwts/OiMa+VUlHXY2zzKXlANt47T
	sE1RI2aWXMwEuGgATtUf5Ax3MvxgtGDyn/Xt/vuYlY4azorsGPuY47F+vkTC9xuO0vX8hjn2F/1Yb
	yDTBch5nFhxs0EAiIr/NppcvRc3nzWqxO3i34+mxTswo8cLzVa/nv7LsBDrg9NIg+FENCltMfzfwD
	IGEKF3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphS-0000000EfSP-3jm2;
	Thu, 12 Jun 2025 21:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDV-0000000Ed7E-0A2S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=l5xjzkvhUCUqCbitEwKOB4Kh6ItWZE0qqZgFDh8DMcY=; b=FkyXkdQMucWJgydmacYMssdt4N
	0Vm7CIoXy5sMzuLgJFnMZug+XCFmp8X7dhnicHvoKiSvWWnDzcsvto0xJjzdR0kJWQocOkaqf1PMj
	T2p9b5YKuBTG7huTbzCgdK2JYjC16xZYsPBi3zWL0Hw+DM8j9kIrBw5LO2kEq6cQ0WI66vVXoQ7eW
	Uo59HIt6guPdv8JyHhr1snccb72ISVMmlaZUs5K/hCi+ejvaFviCcGhKwqr6icTd193RMqgD4S3ff
	cYkuZ5IM7hLNjQxvj2bzIBRAmDNFnRNcGxj19sFBFiYYuwbfFlt54YqvgiiyBHBQRumGp4W0HGxDL
	mlMZIpiw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzG-2BtG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFAFF4A83E;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E250C4AF0C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=1ktk8adW9Q8MazSYAza7zZHZaiASrCb+ItILUqRabHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QvMMcEk8u/fQvarrIkABKL1Sr8sJ4PpHVmmyHsimR/7Y/mjdjIDUsFdl9qKLDph1I
	 L/wu7+yqGhzbO86W+ruA8SjcSeyWNY0qerjF7OSf2/jSAcX58HvuJAIp+ZWzmw/MJp
	 hd6vtbB31v0+EQWxUUhPUvkacQnOQR0ZINe+Wx8qxM5rDs8zzzTschUy/KCO3bjscT
	 wrWMjlyjx2vFGot+lnlXRS1deEAy5MYxlZA29E/RlBYVJTJheiu+YsX69EnT+J7Pu5
	 Z+vd6WM4UiVYuSF89N/TltmWvzHZrN6SHAFWZ+kSeh1C1if0Lm6u5aOA2ZRerwkKGJ
	 2+Han4tqIOBgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDFCC71148;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:26 +0000
Subject: [PATCH 02/11] soc: apple: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-2-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=1ktk8adW9Q8MazSYAza7zZHZaiASrCb+ItILUqRabHI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a308QpomuvNzTHFunsvpOzQYPt/dn00ioHC64jf48yT
 /NcO/94RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiU7kZGb5dbpp4bXq8vCdf
 5OnLvw7tjj8dxvdAOo4rMZeXQVJ1kywjw+8LG7V/apnUcOdNUrp44/RNV10J+9Rr36eq3JKtqb4
 QxAQA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_314250_BB992BFD 
X-CRM114-Status: GOOD (  10.37  )
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

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index 6388cbe1e56b5a9d90acad3ee2377ed6ac0d207d..ad67368892311bed5a94d358288390a6fb8b3b4a 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -8,7 +8,6 @@ config APPLE_MAILBOX
 	tristate "Apple SoC mailboxes"
 	depends on PM
 	depends on ARCH_APPLE || (64BIT && COMPILE_TEST)
-	default ARCH_APPLE
 	help
 	  Apple SoCs have various co-processors required for certain
 	  peripherals to work (NVMe, display controller, etc.). This
@@ -21,7 +20,6 @@ config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on APPLE_MAILBOX
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Apple SoCs such as the M1 come with various co-processors running
 	  their proprietary RTKit operating system. This option enables support
@@ -33,7 +31,6 @@ config APPLE_RTKIT
 config APPLE_SART
 	tristate "Apple SART DMA address filter"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Apple SART is a simple DMA address filter used on Apple SoCs such
 	  as the M1. It is usually required for the NVMe coprocessor which does

-- 
2.34.1



