Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF22C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYjTRnaAL734uawtRz8rlkHtipNlC8V1eUrqVt8032Q=; b=r0dyR9HAvwkGH/rFmNjYSnYW6J
	YCQ2+cQt8Gm02B7/L+Jw4+knDu221n0GPAMiSoDMFh/cqiWUcvbHL4tjGNZ9fNsXQ7oJECXQgo2yY
	sJXh2mhe5dcXY6Q+XxH068kp3zV34Czqj/p8fZpwmEL0gslG/gXwYLUTYiLdxO8QDSmhFu/+YxrBn
	K4Myu07Do7HVOMJFiJS4LqjozgrRs5Y5B8twZwtUOebCMQ7RzJWjH6U0USIq9tar/wnjloSLrCjDa
	u3rXNKTnY8R5l8sz7+jEWOeLOi8yrQBOMLNOURyDbCfHGf0eLkXkp9ENL4VIHkkMRCXZRG0bDFl3s
	SGbp/PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEeE-0000000ET37-2WqU;
	Wed, 13 Aug 2025 16:48:22 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9J-0000000ELgK-2p32
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pYjTRnaAL734uawtRz8rlkHtipNlC8V1eUrqVt8032Q=; b=WQVtUd
	Gx1tsYEcBl7STSCHoQpxHTAnS+wujtevjz8pWK5JqONna7QgJmZu4i5FZcJNz3ET
	+VL4XRV16QVokeImdllrOmYh79tKvXFmp9G0a6qElUM1RCPL6libLcr5t7+pVcqS
	b8WkYq35GH3hm980j14G+XjEn3gC8Khic8mOOykPHmS8eBFpSx8DYlsIs1wGDSHF
	Y8qHjsDS2Qu89yiTlIMckZ3JPtYMLGxys05f3+4OdR4jNJRkn4jEHS7VRkuuNcou
	G5wESZSlsM8Nw61MpcISdRls3/UMp6Ul1xUuaNlRjXC5hV7IA5ArObGqULkLmlIV
	M14Lcjpn810aDfog==
Received: (qmail 694780 invoked from network); 13 Aug 2025 18:16:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:08 +0200
X-UD-Smtp-Session: l3s3148p1@305neUE8PJVtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-input@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/21] Input: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:52 +0200
Message-ID: <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091625_985283_C5461F69 
X-CRM114-Status: GOOD (  10.77  )
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

 drivers/input/touchscreen/fsl-imx25-tcq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index a32708652d10..ff270b3b8572 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -39,7 +39,6 @@ struct mx25_tcq_priv {
 };
 
 static const struct regmap_config mx25_tcq_regconfig = {
-	.fast_io = true,
 	.max_register = 0x5c,
 	.reg_bits = 32,
 	.val_bits = 32,
-- 
2.47.2


