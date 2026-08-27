Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E40EC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 06:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xmip4nYv6eUji045nMgRI6RIBtW9arz3x2fQo9GKIkU=; b=PhqbqAAJcjZQUp33Sh1f629/uw
	a8oJ2zhTuZ+EiEHRV2aU55SFhoJtt7SyUOjySi3cUlyPcMZu4imnIZwhwnvCPJ5ThV+PCLlV4zzJu
	p3eOkkbCla4skX8HzjbsqAzQmKRzNRVNDZNEVerrePfR9ZybxliYnbKqEl2qSXuGx604WCT4uzH9T
	+Q/dyJXcm+uwyjMc+z2qOG5W76DlVLBRVEGxH5rIVYiebNv/xmLyLTKI89GGylNXGmFhpkiPpsvKW
	NWnhNnYycir17mVEOtU6HpRreM9FCxpESc3dWDN8bfW3UX5lIL8bAFzs9LMnpDkkAaCI3c64DTZS6
	0WJCKp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTeD-00000003UBm-35xj;
	Thu, 27 Aug 2026 06:31:37 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTe7-00000003U9H-2rbJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 06:31:33 +0000
X-QQ-mid: esmtpsz20t1787812246tf69520b0
X-QQ-Originating-IP: ZXeObjIOicgx6bbgtANZd2CIhj1mWYEEWSlY1MfUDts=
Received: from localhost.localdomain ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 14:30:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17649052534252163041
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
Subject: [PATCH v1 2/3] rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove
Date: Thu, 27 Aug 2026 14:30:18 +0800
Message-ID: <17C4ADB7B3B875B8+20260827063019.3342085-3-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827063019.3342085-1-liudalin@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <20260827063019.3342085-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NkHKfw09D6j8P79CX9CZlLA8D8mp26Y61sEywqmWQxeBpHlZSCllH4au
	9eCS+mz90VVG/kaMPWxaXOsAn67mLIQICBltI1OnH7wLUF+x8KiPZUlqbNn3ztrtymUOD6L
	okeGpRlO7deuUl98z84t7z4rO8unRUsFv6zC30HEfs/DbF4yaZaD8KACGE6Eq90w/cc2bed
	E40R+GBeI8oPJzcIRwvCfYFkHkHMGJDwIHAC0phVHYmVCKTjglZ4dvk/S7z5fJWWy2crUvW
	aaltqE/n7WnYGAHjja4WqL3v7kXi3Bh65iuVxL7FpeUv1ym7ursA2FvFcN8v0mNRCEffHFM
	1SViCXX4+ci4MiPPkZDJb3DIsKM1EYDMHaXoi/3h6oxNT7WkfFLX9/Tf8gc+1AFpjVLaTc+
	Mj1J43BnxfI39tG0PN9IAcKmgdmaVxClaQMANFgHNRBHxU/TVsjrmSzmt0rYfj5LktPo+Yt
	zoXAgPbPcn65RmgpYg0g7dJfdNtRfnJqu6IR0j0MZkgg0inBLxQ8Vwc6CMeBWL3oRcExaIB
	Evmci4AOsiggqaoqcYhV9+di5G9lq/1iQKGibPYs+kizwGowMs2vzib3jUJ+kI5IqBlFOdf
	w3kP+XLrctsB1s0GMb7y3GkgFg5ksL5dtnzKD0J46X2QqpjSagZsi6JHqhSFGn8Roml3Jx+
	XBnDGuYKNOPyeam5802jAuoSfGv03EoaLP90TcCIFwRuSzxTTEtdnGjWY3F5YQKjfdB9BFr
	7yfQvjKVZWm36ZMgRi+twiBZYBt/L3H+iYFRH9hbVVLGZGDGUky5wHsOwmGvfHQKKv1mSc0
	lclejAjh1J1JG55ID/NWs0d4yCQKD1x8buHSnpuk8qKCz3sWKrhN758Hv7YQisB1EvqluCj
	pIyy/5tc88xC3A5cRI/SR2ntRd6D/6DvY36uxc8Xb9HWYFp05BnATUGN/xMcjyc2TgWi6q8
	Wshsr8R0xBUwKxLC53BHcJzrhPDxiBqVaBaTMsgHAP6oQn/XOYI6rECVoG7vVuqR7vrdhxq
	8/lTCaLfDHXD1oPDHfgi7WadnmXM8klWYedUTMxwlqz3KnENdshtRCpmnUD3xmoBne8UXzl
	w==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_233132_117832_A18FBFAF 
X-CRM114-Status: GOOD (  15.17  )
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


