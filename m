Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9B0F5140F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=weVje6VkStlr/WzV2kfkWiuSUPkbEVkQwhRLMAxr5Ko=; b=uwoN4Zox0hqe1p0cIDfkEsV5jw
	ttguf9uhV8Zf7XiJQrbTqs3Y0rA4Pp17ZgmMGj05MusSJP4ZkNdvTLgHn235/Coo+Lp/O2MowQwJW
	iMk0QrFtGRn3PLcSFzEfihB7KIBZGu5qzLuNZmGHSl8kYZlub0fWHIVthogSLHoI298fRcO44XSNt
	pnAPdUoJOsebEDZa7EjQ+1zKd/+S0o0nd9b4XQZTUXTiFyake0HEnNHDzpTv2pG4Dg0C2exo7R1C2
	59onqNhxOtt0YqQ3DU0RdS+urmkj2yFHx07cjLdwxwAcqo5vAkPWNNbiUKe0pmupISmAZOXDzeV4d
	2C5WvZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOve-000000036O9-3LcD;
	Fri, 06 Mar 2026 06:44:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOvb-000000036Lm-3pSJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Mar
 2026 14:44:43 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 14:44:43 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 6 Mar 2026 14:44:31 +0800
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach): fix driver data handling in
 probe/remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAM53qmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3YLy3Pi0zIrUYl1zSwujxBRTE4s0A3MloPqColSwBFB5dGxtLQA
 7d/zWWwAAAA==
X-Change-ID: 20260306-pwm_fixes-7982ad548f07
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <linux-hwmon@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772779483; l=1393;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Hp31w4Jdd8sbOX4FBY/G7j05d+Zg3ydoO83w3jExP4Y=;
 b=09OrdeecveOCl4q7/xzNvFn8RPwEs0VhaZWGUH3DjxtVv/MYLVRvpS5M+R/B7fmZ9Wu/kcLtQ
 7t0gVAB7TCBBGFnoYzwXx3sDDYB8WQH3a8GZW4Y54TPRZDxzAppIi5m
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224451_956114_029407F3 
X-CRM114-Status: UNSURE (   9.24  )
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

Ensure proper association of driver data by setting and retrieving
the platform device's driver data during probe and remove.

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 44e1ecba205d..0c03d272279a 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -490,6 +490,7 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 
+	platform_set_drvdata(pdev, chip);
 	pwmchip_set_drvdata(chip, priv);
 	chip->ops = &aspeed_pwm_ops;
 
@@ -519,7 +520,8 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 
 static void aspeed_pwm_tach_remove(struct platform_device *pdev)
 {
-	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
 
 	reset_control_assert(priv->reset);
 }

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260306-pwm_fixes-7982ad548f07

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


