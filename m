Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E73C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqgSkFlCQVJ4CaUUmVwPWsAun4vxgHbAxdBt/2bRvcU=; b=KTSew1/DK01jlF
	zNRbHSOtQuc1UXtfxM8ucBBPp4PBKFc7FyvrUuqyBR0tKX7pXhom/PO2B0pNb4tfuc7nCq4yBR6MW
	U8HgIjfvPRMRPfiX/nLhaYDN+xkUrsuA8+1ceOOG+t5yidBik9qYVo+RoQP1B+m+aAzyJGDTv5V7I
	XUwwEhVwqIx+t0Tvkfx3iZxLE16h5ceT3bZYBAEk4ULdgx6nhmxDYJUrdB86Z5P5fBGcJ9NvhWPss
	1M9gwlHDkjgxqU88AudjBZK5F+7u+OG0grfRIpj/Kff+sGb9Eu23mdJyJW7sNIKLA8hVBY+0alR22
	jIY+yyND2WeaD6bS7qbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6e0-000000014i0-2BOD;
	Mon, 03 Mar 2025 14:19:44 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6Nf-000000010u0-3EE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:02:53 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 02E6340CE182;
	Mon,  3 Mar 2025 14:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 02E6340CE182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741010564;
	bh=vqgSkFlCQVJ4CaUUmVwPWsAun4vxgHbAxdBt/2bRvcU=;
	h=From:To:Cc:Subject:Date:From;
	b=nai7WcceMGUZcGUxKsLVw+ByZ0zB426L99V6BXimgqOYhZ0gpVanAUZ6qjH6bN2NQ
	 JPdn355SI9GJztXnYg9j9JJcOl8euBD3CbkJPzwu8husGgSvIqsokUvUxf07nI7x8M
	 QOwFvGitGwy4NiKVWp8R2jIDFXoYzmRY26HJDwZA=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: at91sam9: fix call balance of rtc->sclk handling routines
Date: Mon,  3 Mar 2025 17:02:29 +0300
Message-Id: <20250303140229.642959-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060252_366590_800DE5C3 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: linux-rtc@vger.kernel.org, lvc-project@linuxtesting.org, Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Fedor Pchelkin <pchelkin@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vitalii Mordan <mordan@ispras.ru>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

If rtc->sclk was enabled in at91_rtc_probe(), it must be disabled in
all error paths to ensure proper cleanup. However, if
devm_rtc_register_device() returns an error in at91_rtc_probe(), the
rtc->sclk clock will not be disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for rtc->sclk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: a975f47f6e9a ("rtc: at91sam9: use clk API instead of relying on AT91_SLOW_CLOCK")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/rtc/rtc-at91sam9.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 38991cca5930..f4b7cf37397f 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -375,21 +375,16 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rtc->sclk))
+	rtc->sclk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(rtc->sclk)) {
+		dev_err(&pdev->dev, "Could not get and enable slow clock\n");
 		return PTR_ERR(rtc->sclk);
-
-	ret = clk_prepare_enable(rtc->sclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
 	}
 
 	sclk_rate = clk_get_rate(rtc->sclk);
 	if (!sclk_rate || sclk_rate > AT91_RTT_RTPRES) {
 		dev_err(&pdev->dev, "Invalid slow clock rate\n");
-		ret = -EINVAL;
-		goto err_clk;
+		return -EINVAL;
 	}
 
 	mr = rtt_readl(rtc, MR);
@@ -405,10 +400,8 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	rtt_writel(rtc, MR, mr);
 
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtcdev)) {
-		ret = PTR_ERR(rtc->rtcdev);
-		goto err_clk;
-	}
+	if (IS_ERR(rtc->rtcdev))
+		return PTR_ERR(rtc->rtcdev);
 
 	rtc->rtcdev->ops = &at91_rtc_ops;
 	rtc->rtcdev->range_max = U32_MAX;
@@ -419,7 +412,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			       dev_name(&rtc->rtcdev->dev), rtc);
 	if (ret) {
 		dev_dbg(&pdev->dev, "can't share IRQ %d?\n", rtc->irq);
-		goto err_clk;
+		return ret;
 	}
 
 	/* NOTE:  sam9260 rev A silicon has a ROM bug which resets the
@@ -433,11 +426,6 @@ static int at91_rtc_probe(struct platform_device *pdev)
 			 dev_name(&rtc->rtcdev->dev));
 
 	return devm_rtc_register_device(rtc->rtcdev);
-
-err_clk:
-	clk_disable_unprepare(rtc->sclk);
-
-	return ret;
 }
 
 /*
@@ -450,8 +438,6 @@ static void at91_rtc_remove(struct platform_device *pdev)
 
 	/* disable all interrupts */
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
-
-	clk_disable_unprepare(rtc->sclk);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.25.1


