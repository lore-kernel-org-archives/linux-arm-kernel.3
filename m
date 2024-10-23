Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58404CDDE67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3XhHKPkoxwCFa+QumSpvkYZ5brNAJybuSuf1JsI9+A=; b=bsBkzFv2+n5cMq
	fZPrX+FfzvuZEk3G4+KyePRCqzv14qfScpY5vOdjZc6HuhJEztakMc680X/yBRMGA4bmdvRCQHokC
	ckgxLbboccGA0pI95SEr6Yf3jNeyxrq6hNaKRop3UxwIWlt9hc/lVCpdezylBYGWe2awat0K3Dvty
	T2TeG8RyHrxHgorK5bwZhXN5eu5ggMackUw+wPE8WyrU6Xijww5Af3JCWVsceEJvBKXymgMwomsxz
	cq1cFfgaMt+RGDgvwNKaBbkB+UvGnkAYUFtgUhZX61crdfeTSoyeFNiXbQaeLPAyEH4bMzw2C+B4n
	NMQFI7N64vFbIKQO8oOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z4j-0000000E49T-3cZn;
	Wed, 23 Oct 2024 10:58:49 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yqa-0000000E1cc-0N6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:44:13 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Oct
 2024 18:44:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Oct 2024 18:44:06 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <linus.walleij@linaro.org>,
	<joel@jms.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
Date: Wed, 23 Oct 2024 18:44:06 +0800
Message-ID: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034412_145751_F895700A 
X-CRM114-Status: UNSURE (   8.02  )
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

Add drive strength configuration support for GPIO F and G groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 6ecc656abc44..5a7cd0a88687 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2607,6 +2607,10 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB8, AB8 }, SCU454, GENMASK(27, 26)},
 	/* LAD0 */
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB7, AB7 }, SCU454, GENMASK(25, 24)},
+	/* GPIOF */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D22, A23 }, SCU458, GENMASK(9, 8)},
+	/* GPIOG */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E21, B21 }, SCU458, GENMASK(11, 10)},
 
 	/* MAC3 */
 	{ PIN_CONFIG_POWER_SOURCE,   { H24, E26 }, SCU458, BIT_MASK(4)},
-- 
2.25.1


