Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97711C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=; b=0tKb7y24PxPzDnAxLIrEmgnN9h
	cIAfLuvPQ6m3zjc0qG6QUwV3qep1bI0GldmQr+P52uoLn5LgGVsDN/P3HGYQ2uugePVhz5LfSgKTI
	Y/sUavT5avZrqDlL629SwjHMCBYbLHvET2yLT3441Q1HCtozh73ZYs4PUW/pUxfPWCB4OK4icU4aB
	NhuzaKzACWCltLU2b2qltP6WElcEYdi4jTFe5u2g7OcvviZLy1tyuHrWSjdRMDA6MKrSupoAj1/tM
	/zFLnTWjke7gXkGJiwr+6wx5UE5y4b8dOetBUc4hGCCs7WtJJXLFP+ssw9utkAWUnhnUEf4bt2Vdo
	2KPCM5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bJL-0000000F0qy-29Hc;
	Fri, 18 Sep 2026 16:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bJK-0000000F0qc-0cEo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 16:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=; b=NDSF8bIpggLNawlrY7nbO5IkXO
	fAB2n8rUuGBzp2tIH7b5vto1kh+LezFFMRyu00MHAJW46WxoVfN9mQs/A40vn3vvDvlIk7N+QT2w0
	eHMcfSd2JqQ2gxUvkGyiUY9yY1pe+weKMBNfNU0AFj4qEFDCfQ5fEumdrG5HHE6tMLnAMO/Dh8qOq
	fTAuO9mtFUpgzp6+TrdiKMI7zXoGhI2rq0rnNhms8egj2psOGU6td8g8FdR14nDScCUEeP9S6Uydp
	N0N9C+PWkDUDpXUAzM57hOXu2qZvuzUmFujMv/kvhlRN2dEhIjtNerlDJeMm+Or7j3hGMXDW7BEf1
	NS9i/WIA==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7bJH-0000000AJLd-0wKS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:19:37 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c3304784so779277a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748372; x=1790353172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=;
        b=GIfSYgLgfevXSk0jkt2RqXPiizZ7na/boO8TGyCTG35hdzJYFNsLevSKFjEXvkoj30
         84599WGZXWfCp1l6974faFzBiILA6s6IAnNNPKc/+eyqdosTEj9NQtMCssEv+7QrBwhM
         ltOQXszSCOZppWsVsyTjUbXLE/0myDS563Yht5WjIyash7powCkXz2JMRWLW7Xo3WCsV
         ceX13wHhLol1eVZeybUdVBiGVrcnu/lVMTbogo2X+yzINFuKi3dqBkFrjS0oh/mfiA7n
         a44f44T4qZFpJr9Cp0paEzUFnmFxl9tsWH0hgOVRCnjjYNzaGOwAZ9jBsRD/IVxqOk9O
         NWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748372; x=1790353172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=;
        b=dS/IMTBOwDcWRGgVNmQg+MG8AMGitQLt112wObYp+4V1+GtKdz8tmmMZTzSYntZYkN
         cXgbijvRRjzNrW7/7WC4DtPyDhmiQXDCEndw3M94dIPzma1rTve4bxLwBh2sjet40K3a
         gsHuiWol3lIGT4DyPK002W4t6h4X1pcSE16wIxWY7erlevCrNIpRE4YyR2KLY9xOgfeT
         IltGgxZzhvuoQOF3GgcuOcODvCqcx+gQCH7e72GOwpfpcd0YaF4U0QmqG3TJHMJgVBXh
         iwwntvT/hXNxYLqTwUIq4IZNZkgpOE5VaJDUcOFPkb7KNkIHThjFLs/9z2c5fN/1aEPo
         1k1w==
X-Forwarded-Encrypted: i=1; AKwUvBxIvuO1C//W++Dx0LAIkVNpy/ATpAKMrFCildBGSW+Y9a5/0odvRIPtvvSg9ZMoof4ahMLZK3KdvVGzQch8h7eQ@lists.infradead.org
X-Gm-Message-State: AFuF++m3OS3ruuqCHrH5/R2g1fWYA/clf9WCEMm4l/c1Yjgop/LmsUBE
	DlgrfV95jI5u7a4SWlc3t59gSBiXab+7H4CVRhLUktq+3AdTzQ6ZRHWX
X-Gm-Gg: AYBFou0O6Y7O/jyHfX8W1ntrG1M6usmfDh1IBa8yR5hMbAACagpC2mcQEBFiliPPfnj
	+6UondCT6yUXeW8Xrwmdd/77i+L2f0dfpoqnJ1PCSh6Yp98AKVVNa5A4GnTKJOQ6HPTEu6duKWM
	KKEQnD9p/g1VMgsSv6hjN5nb8pLLAr0dcul9Kv1csl4oCbYY/8VC8BrlwCCkxxxjpljIlLlFAXM
	7QNXL5Dl3XYruiL5iXwZgs3M6HZAZ8z8JHzYXQnr+z1tqgi38aCtgOghm+9dxQsyB6eOwz1TWej
	qRvS3oZzPNmkhp8bt5taMOFLcnPmXu+NMxCl+fBEYPC2pfxyckjatZuJMKD22ZreQQhCjYHQwYD
	DBULPwS+0QEcEGMpMt+l+7X5eLEGbzkSoslsjBRUbdfl3bqhpdN3Gu4IBC76s+z8zKtL7GaAlWs
	CyEvbOHBC1JAAlxM8DWo5JxOJnhtm+XAujmjtYI7R/GL7XMtEaKwgXXWLCGT1wtpKjx+FyEEI4A
	hnwj0mkGR9gDZ6r
X-Received: by 2002:a17:90b:5403:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-39e6a7ff0b0mr1221280a91.18.1789748372302;
        Fri, 18 Sep 2026 09:19:32 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce046d96sm4934242c88.11.2026.09.18.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:19:31 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ma35d1: fix unchecked IRQ error and IRQ-before-rtcdev ordering
Date: Fri, 18 Sep 2026 23:19:25 +0700
Message-Id: <20260918161925.2639130-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_171935_326007_0E7925E1 
X-CRM114-Status: GOOD (  15.38  )
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

platform_get_irq()'s return goes straight into rtc->irq_num and then
devm_request_irq()'s unsigned int irq parameter with no check --
passing a negative error (like -EPROBE_DEFER) through that conversion
turns it into a large positive number, so devm_request_irq() just
fails with -EINVAL instead of deferring the probe.

Separately, the IRQ is requested before rtc->rtcdev is allocated and
registered. Since devm teardown is LIFO, unbind or a later probe
failure frees rtcdev before the IRQ, so an alarm firing in that window
has ma35d1_rtc_interrupt() call rtc_update_irq() on freed memory.

Check irq_num for a negative return, and move the IRQ request to
after the RTC device is fully registered.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914133532.CBFAA1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-ma35d1.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..76d59b313721 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -236,11 +236,8 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq_num = platform_get_irq(pdev, 0);
-
-	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
-			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+	if (rtc->irq_num < 0)
+		return dev_err_probe(&pdev->dev, rtc->irq_num, "failed to get rtc irq\n");
 
 	platform_set_drvdata(pdev, rtc);
 
@@ -258,6 +255,11 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc device\n");
 
+	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
+			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+
 	return 0;
 }
 
-- 
2.25.1


