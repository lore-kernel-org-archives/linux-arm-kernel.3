Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D429EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAELMdD28uRnWdmZM6U9lfBnfk6B8A+WDHptdWUHPCM=; b=Ymum5/vkjEth5+CBO74PAYoqKr
	yCvj62HLqgIumwdDKAwqFGDB8SybRVl5hlSFY7AHfTZW/nAqUgiM5tc0fCH/pWuzarxfwq555KD6D
	y1vW60HfMc0F6oTOxUE3qhzgi2d5MtzwnJL4pzZFSEhuHZ5gjR/ymo3LMDhW8v92T8UgQHMhH42gh
	RTFdENoPn4/cIY57pGjMwQClx9OPRfdX91IqrXUILA5ADVtkfgZyRD07S+Ufi723yVSEPPs4qTIkv
	6Hw7dCL4guUs1/s+H/xk+/2n1RCm+14xX2OkupCYDcfzsBNSKJ675Yvq8Lyem0VDAUeutk9hVj7z+
	XYQh0UjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPwC-00000009UWE-0zX9;
	Sun, 05 Jul 2026 16:43:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPw9-00000009UVq-2cPs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 16:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=GAELMdD28uRnWd
	mZM6U9lfBnfk6B8A+WDHptdWUHPCM=; b=PdRaf902Qlmj0nfltRVYKhEPRG7ixa
	dzPjp1QeBSg0xA9eDxJeXTcuhE4Vj+cC5BAwPr493DDoPdt67APbf41qt4cebozj
	74+wnJIqTIDcUvw/a0+YEKk0/ns24ENUq+5kuS0JMrnCB68zk0k2kKl1I+ELGAuz
	7pnvNq1uUGxmTWfaO58/fxDb8XBPAmP/Z0NpMpE4ESgv9NBPtdalLrFYeNTbqA+z
	5iI3T76rl5gRNCRS6iZAKVddDrJoQF02L42MUN0KRkOAsGcqQkZaNl5XHp531QeX
	Rcq9E7kB4FI0b+QdaI2nQQx8xv81ZyCHn2t8A1Ut5RP//XdEvu/VsHmg==
Received: (qmail 2289317 invoked from network); 5 Jul 2026 18:43:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:43:18 +0200
X-UD-Smtp-Session: l3s3148p1@QWjd2t9VkCltKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] thermal: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:43:12 +0200
Message-ID: <20260705164311.2273-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_094321_955703_4873B6AF 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/thermal/armada_thermal.c | 1 -
 drivers/thermal/sun8i_thermal.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index c2fbdb534f61..252d5afecea1 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -722,7 +722,6 @@ static const struct regmap_config armada_thermal_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 };
 
 static int armada_thermal_probe_legacy(struct platform_device *pdev,
diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 22674790629a..284684137c43 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -149,7 +149,6 @@ static const struct regmap_config config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 	.max_register = 0xfc,
 };
 
-- 
2.51.0


