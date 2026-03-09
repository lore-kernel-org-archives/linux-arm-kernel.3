Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93DEA854D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wKWvDKTbIUsCJpxdrNNsaynS0NyECmn3rdHITCYgoDQ=; b=zlQqdIrLPW4QZBIoo85xNP8hbG
	7VARvo9ymMCUG8EiGFZqT3Se3be+Vfjp5H8ztMx/RNAbJ7jbk1OBOB0NZ/MUjwkW/Qm25ILa7bE14
	zb4xdL+umLiWgM5fqd1ZOBTiM2jzocqN6OOaFHjX06c8x/4rdtsC2ClyRWqDwfkAnLCsZ/A+gyVb8
	v1AtU4C/T2bHis7xL3mkiVDv8Mtg3bQs2POeKUn9eaJPbULjiV8jEHld6pzRtV1HKZtqhPqg4bAmQ
	CoHxFYBx0y+TixI3VjkH6C6F0+eVKf8J49OB+74GbjrHrXcnjjM4Gnosc5Hl/mtL2pcl/p76qPUzr
	tycix4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQRI-00000006YVz-0JRE;
	Mon, 09 Mar 2026 02:33:48 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQRF-00000006YVa-1DPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 02:33:46 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 9 Mar
 2026 10:33:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 9 Mar 2026 10:33:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Mon, 9 Mar 2026 10:33:24 +0800
Subject: [PATCH v2] hwmon: (aspeed-g6-pwm-tach): remove redundant driver
 remove callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAHMxrmkC/22MQQ7CIBQFr9L8tRiKFbAr72Eag/ARFi0EGtQ03
 F3s2uW8N5kNMiaPGcZug4TFZx+WBuzQgXZqeSLxpjEwyjg9UU7ia75b/8ZMxEUyZc6DtFRA82P
 C/Wj6bWrsfF5D+uzp0v/Wf5XSk56gRIPcPpQdxFXliGhW1O6owwxTrfUL8+YoPqcAAAA=
X-Change-ID: 20260306-pwm_fixes-7982ad548f07
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-hwmon@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773023612; l=1632;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=ywRswqAB8D2YY+rXs//gmPTNZ8Sm18BNmrehwVM8z98=;
 b=AjSLGbGkPUi0r9yURsISZag5dOKqICck0v+Pkigi8eYhfINb7b4EQUNTQcuYvJHDMcHMJf0zU
 oIRm2AqrarzBw0452ZnJee0amYrENPrG33y23d/XHSVsFYsUIHvCPSh
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_193345_373505_4AC93A21 
X-CRM114-Status: GOOD (  10.70  )
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

Drops the remove callback as it only asserts reset and the probe already
registers a devres action (devm_add_action_or_reset()) to call
aspeed_pwm_tach_reset_assert().

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
Changes in v2:
- Drops the remove callback.
- Link to v1: https://lore.kernel.org/r/20260306-pwm_fixes-v1-1-e8ede6fbaf47@aspeedtech.com
---
 drivers/hwmon/aspeed-g6-pwm-tach.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
index 44e1ecba205d..4f6e6d440dd4 100644
--- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -517,13 +517,6 @@ static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void aspeed_pwm_tach_remove(struct platform_device *pdev)
-{
-	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
-
-	reset_control_assert(priv->reset);
-}
-
 static const struct of_device_id aspeed_pwm_tach_match[] = {
 	{
 		.compatible = "aspeed,ast2600-pwm-tach",
@@ -537,7 +530,6 @@ MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
 
 static struct platform_driver aspeed_pwm_tach_driver = {
 	.probe = aspeed_pwm_tach_probe,
-	.remove = aspeed_pwm_tach_remove,
 	.driver	= {
 		.name = "aspeed-g6-pwm-tach",
 		.of_match_table = aspeed_pwm_tach_match,

---
base-commit: af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
change-id: 20260306-pwm_fixes-7982ad548f07

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


