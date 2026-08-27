Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA522C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xmip4nYv6eUji045nMgRI6RIBtW9arz3x2fQo9GKIkU=; b=gd9HCt7F1RoJ+XkHNisdWRH+As
	GgES4mp45e4AVe5D+00dxeXk1G2fa4ZbpnraCCqkggIAylMDaR4DUvy0EdkXBQo+4JN7tERD7DxcH
	bSLfzbH4vizodZZufINjKcf107LtYDsWMCAU/l+9IqGTlwncOxMpbgYk6+jMc0jS3EcwuLUFOGskU
	ITHF7nfvGUIUB6ZneB6izzOIK2Ffl9lN8SHKNxilIOi2EfrMI0rTXh1LpRLhSwuP8CFguYnMDzQvt
	DgKdXkcpIwin85VJOztMLlnddAZGWuJ99tjfASzyrC1e1UUZgfjJkCPXV/2WXFbChqDe/xRFAgjZY
	ZtdNM/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV6B-00000003b7F-48dc;
	Thu, 27 Aug 2026 08:04:35 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV64-00000003b3N-3KV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:04:30 +0000
X-QQ-mid: zesmtpgz1t1787817820tb37c0f3f
X-QQ-Originating-IP: j00K5DidhhOWMSakCHDJzAVTmonswQ2s0q6/QxIojMA=
Received: from rd.. ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 16:03:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11111018256627874167
EX-QQ-RecipientCnt: 10
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Dalin <liudalin@kylinsec.com.cn>,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH v2 2/3] rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove
Date: Thu, 27 Aug 2026 16:03:19 +0800
Message-ID: <0238203A74C9B9F6+20260827080320.3351155-3-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OJPZoS5g0J6bfbqlS1z88AoTgHtFMwlzEyt1+nliJIbYnDJQWohFt8jX
	+UXJQps9TBfugyZmlik0Tyq/4yHqV7A63/LODegM/OMIHHn6/I0PzizZ0E09Z1blo2Mud1M
	pxffALfQPCOMv0KLQvfKmr3N9XZgBl/NlNxlmtaKduQ6q0c1F3qnee2H4U5ZzR83zYV8vSS
	GvpMXG+8YixEHD7LnXEIwGFto0A0kgV2X70cpqaqsHFTEKJqhrQSwymM2jCqaR5j9sqBNwB
	ayUm6YcInTiUeBMBYtvMkp5ezkp49KrSInjzuJO9A1Rh6jZDHgsdVxRJf71vexBd2Gg8+HA
	LgbY9oYiSIikaUDbUj+l6UJLgteNRgtez3iD8arT1QlaWT5XGtX6dRLUaPT3j00LVkIoeQz
	jXeH0YUzbkigOnkKpIzEib6531GWE+rxzl1lo8M5OiEkt2yrU73aNm7F5+9DE0hEQETsMbS
	Vz4odJm0z2Vn8QsHDbIH68J3jUpEWoAk9ozXJucU0qO/S4HfAi4IH8QQfLmRqojUxR7Zlul
	MRdoeykupU/WveuKUioN1C8gneSMpFQNHdqLOIkTMF/Vl8Qqjo+FfQcG0asI7NUyZRp/qFT
	GZNbDc9R/GFpBdoUChMNDXmgvW5SVm6oVde2VzkgQSrnvFNeeG2MzCjxA9fj1DEpchgnkD1
	Tu1WMOyKGZxsYg+lBmgSNbw7pa3HHI895ZRs1c3ScCz2yMYxQch3V9/VcGF5u78TVd+QGas
	WJVbWlIYG+o7fmpxCRDCTjite713OpsuImLM7Zr+AVIlMd8D/d2U2IXwPVjGTqwLrpBsEIF
	31RzUUIrlxQVRXiAwJFAPvTOoEWMd67vhTBjxMGdnezUpP9pzijgz7oSMAbs8IV/eLEWMKU
	N2eQcSmwqWDjLK3aQOcZLXv5tGDxoxibcEr/ZRLVKw81LdtH+J4vOFd/o94XpzqkDl+rpnv
	lwHfA/M+WzC4EQhgV5h5ZBMlmPgwIhdhZxK69h/lUa/CnTyPnMsWDmiAKDNE8buwFUmNDX8
	LCWSW42eBUa0ndgYrxHe7LrXXfockOjjSFhxUQvAOKyCg4dEfqjyD8KkEB1seav940FBpGB
	+JrPzkiZ8bY+TVccq+Q6eShF5shsQQyghsnT+PQYBwLonWtubGo1Ep98DQxgPuYdw2rAviI
	3ESR
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_010429_701555_4FAE1A1F 
X-CRM114-Status: GOOD (  15.13  )
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

The driver mixes devm_rtc_register_device() with manual clock
disabling in ftrtc010_rtc_remove(). Because the RTC device was
registered via devm, it remains registered until devres cleanup
runs after .remove() returns. An unprivileged process holding an
open /dev/rtc0 file descriptor could issue ioctl(RTC_RD_TIME)
during this window, triggering MMIO reads on clock-gated hardware
and causing a synchronous external abort.

Replace devm_clk_get() + clk_prepare_enable() with
devm_clk_get_enabled() to tie clock lifecycle to devres. Remove
the manual .remove() callback and the corresponding error handling
labels in ftrtc010_rtc_probe().

Fixes: 1d61d2592c1f ("rtc: ftrtc010: Rename to Faraday FTRTC010")
Assisted-by: Sashiko AI [static analysis]
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-ftrtc010.c | 67 +++++++++-----------------------------
 1 file changed, 16 insertions(+), 51 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index 512790bc3f2b..19e6333bfbab 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -119,51 +119,33 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->pclk = devm_clk_get(dev, "PCLK");
-	if (IS_ERR(rtc->pclk)) {
+	rtc->pclk = devm_clk_get_enabled(dev, "PCLK");
+	if (IS_ERR_OR_NULL(rtc->pclk)) {
 		dev_err(dev, "could not get PCLK\n");
-	} else {
-		ret = clk_prepare_enable(rtc->pclk);
-		if (ret) {
-			dev_err(dev, "failed to enable PCLK\n");
-			return ret;
-		}
+		return PTR_ERR_OR_ZERO(rtc->pclk);
 	}
-	rtc->extclk = devm_clk_get(dev, "EXTCLK");
-	if (IS_ERR(rtc->extclk)) {
+	rtc->extclk = devm_clk_get_enabled(dev, "EXTCLK");
+	if (IS_ERR_OR_NULL(rtc->extclk)) {
 		dev_err(dev, "could not get EXTCLK\n");
-	} else {
-		ret = clk_prepare_enable(rtc->extclk);
-		if (ret) {
-			dev_err(dev, "failed to enable EXTCLK\n");
-			goto err_disable_pclk;
-		}
+		return PTR_ERR_OR_ZERO(rtc->extclk);
 	}
 
 	rtc->rtc_irq = platform_get_irq(pdev, 0);
-	if (rtc->rtc_irq < 0) {
-		ret = rtc->rtc_irq;
-		goto err_disable_extclk;
-	}
+	if (rtc->rtc_irq < 0)
+		return rtc->rtc_irq;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -ENODEV;
-		goto err_disable_extclk;
-	}
+	if (!res)
+		return -ENODEV;
 
 	rtc->rtc_base = devm_ioremap(dev, res->start,
 				     resource_size(res));
-	if (!rtc->rtc_base) {
-		ret = -ENOMEM;
-		goto err_disable_extclk;
-	}
+	if (!rtc->rtc_base)
+		return -ENOMEM;
 
 	rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc_dev)) {
-		ret = PTR_ERR(rtc_dev);
-		goto err_disable_extclk;
-	}
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	rtc_dev->ops = &ftrtc010_rtc_ops;
 
@@ -178,29 +160,13 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
-		goto err_disable_extclk;
+		return ret;
 
 	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
-		goto err_disable_extclk;
+		return ret;
 
 	return 0;
-
-err_disable_extclk:
-	clk_disable_unprepare(rtc->extclk);
-err_disable_pclk:
-	clk_disable_unprepare(rtc->pclk);
-	return ret;
-}
-
-static void ftrtc010_rtc_remove(struct platform_device *pdev)
-{
-	struct ftrtc010_rtc *rtc = platform_get_drvdata(pdev);
-
-	if (!IS_ERR(rtc->extclk))
-		clk_disable_unprepare(rtc->extclk);
-	if (!IS_ERR(rtc->pclk))
-		clk_disable_unprepare(rtc->pclk);
 }
 
 static const struct of_device_id ftrtc010_rtc_dt_match[] = {
@@ -216,7 +182,6 @@ static struct platform_driver ftrtc010_rtc_driver = {
 		.of_match_table = ftrtc010_rtc_dt_match,
 	},
 	.probe		= ftrtc010_rtc_probe,
-	.remove		= ftrtc010_rtc_remove,
 };
 
 module_platform_driver_probe(ftrtc010_rtc_driver, ftrtc010_rtc_probe);
-- 
2.43.0


