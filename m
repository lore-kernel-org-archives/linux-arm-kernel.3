Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF91CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYxVUhwHI2nEFsfXbSdXyjPj9ZySNu+edEc+McQzGxc=; b=zeIg+jEztgna9ERrzLjF6itVs3
	50rEd0dO02dP3+WLkmcO77KQQCozOEnrnNV0o8pRgZx3dYbW+yJxJqcG/rLyTW6S9t6DOZcefgCQd
	mrtLOxZSjRTMZa1SWk3+Xw8ZGZqqMe5MNLTQ+d2ROnWg0N+t0zytfW5AdZfUDdcYOiyAukzA2kuLl
	bFiQ/u2jqZbaeCXcc/O7G6kBOj+492K2yYWtxsztiYYkuEIJDDAHHi81NgO6/Hm5Xzq+03mDLeCey
	qcGHzit0SSxRK+33bfIgetfvSbyGv8lJpd++o4w60uX6wQOOzEYeE1QRgG8P7nyr9ZeE54mpYCOmx
	bGItTKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUXm-00000005Dqt-2y8m;
	Thu, 28 May 2026 06:48:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUXj-00000005Dpn-14IE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:48:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso57832975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950913; x=1780555713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYxVUhwHI2nEFsfXbSdXyjPj9ZySNu+edEc+McQzGxc=;
        b=TiK1oU9S7B56nRK0jIr+aHANgQJotNHudWLmneZekaWCpMnKRtSbKRdb3E/U5SYTty
         Y/7FuWbd4UaW+v9nWh9ExV4HALriM7uSGi85b5yNvmHcN8ZPfboUnQbCCdUJ4IBCkSNY
         QGqnPu2L7jCDrh3O42seJnYA1EYgBpmjFEzZ/sZ1cOJf+uZFjIag/XtZnzaq9ThAjjJc
         DdcG5voUaJsMsgYSsMIfHzPAcbOuFDfQ6cwDvQoT938EUauiVuN9DzM4Ptd3fT8UaeZj
         emY6bqo6Fi9fCshyEm2S7wSLlSUwGuGi1mPZf3P09FRcxAtvDSH4lEfOCcXZKaCl3PV0
         vLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950913; x=1780555713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYxVUhwHI2nEFsfXbSdXyjPj9ZySNu+edEc+McQzGxc=;
        b=i1IB/t1nMnhuy6WyPab/kIeyoVO7R/7Vn7iVv3nfpGpFOoTAtIVHY/gNkUXcbvZ8hE
         D+9vgh6SbZNH6aZbnV9A2cbOOocrDLcA2hLqq1JOHT9/E3XcKp1ZBaeeB3ZO4YGki4oZ
         N2sZS25/p5eKou9c3aulK/V7tsLlJRG0+na5WWUSedaQvgWhBUofLeej4tqcqvT58agV
         thuFesqXFC6w1Pi1Yqs3cZODP+gzLc12PbjtLzvT8MvFMQ1oOyhH+cdONO0G7zwYirbR
         Jad1pdFTtBTGJvtMXZeErdHRpM7yPzx/TpZbySdodqoXFL65oxhVwJOs6DXhVdgOSc0a
         VdeA==
X-Forwarded-Encrypted: i=1; AFNElJ//7M5sFQ+zH2vmXYlEv+o5pZVYH+E0g8o6+v8A1zsUx5iNPUw0gypKLrpY+ZENmtlr5WdVxIb7R3x/Ds5KbxuE@lists.infradead.org
X-Gm-Message-State: AOJu0Yza9WU/lsyIrQrpLA7pCI3iH31s3r9IGuLKqJuVBHkvvKCVKUve
	kr3NBYfD5BvN8Co3Zg9OcTIfP2OHSQjdIim9aRBV+chJNoNEBvBsvU++Jn3y7uLtZRE=
X-Gm-Gg: Acq92OEovZqk61d7z4YOb2yx+c0hPDb+jnR4qOSx41p5vfWFr3ZE+Opk0afJ0H1BBMk
	TXbfoHFs/HE281xGpj7osMKSgNy6/zSR/YNXuKlBBRPK+2IejLDUwHBUSeEr2lF6I/fu8O0OmWc
	CI4OKY914xzzofjrja7hhcV02k26HU5/hjLbpqz6KB3s862CaWzwOxhQqUX2S1DoQA/SKvjPvYV
	MdtoSKcU9hbjBBiJzlwBchIBtWRvAA/HcIJgTyxp2l/Y7fFxhqvF3E10Q/plAWWevhLUG+DJUzF
	7hE/bSeQfzDtZYuGoH9ueeerEDrhMvYy823naLxkPi6wDEdjQuKYw1m7gZZdSJ11iJzcnnU36Yy
	K2z0HCEQEebc2c+53FpWQplDHDUSq4qqPJauyqOqR3ljDEWoG7PFslcDG4ByGlclgzdHii9aA0G
	euUW0lLkJCVFMfCobewbt4TLuFi61/uixYjp547JmN+4zJDeM4o0PFFsU3ww51a6606JytH2ODK
	djtOBAmfoVf/vTlcRjtu274UA==
X-Received: by 2002:a05:600c:4e0c:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-490422608cemr452566715e9.0.1779950913231;
        Wed, 27 May 2026 23:48:33 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909284a895sm18273545e9.8.2026.05.27.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] rtc: ab8500: Simplify driver_data handling
Date: Thu, 28 May 2026 08:48:11 +0200
Message-ID: <a909d3c59d00756130ac16051ceedbec0ce9cec7.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+LFo9k0HRw6kn4T7KNhnuPjSjM4RFi9qqPjEn5O+x7M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+Uwjb5Zt6bEszHD/2bPr4HPlfNN3mjVxrfUr es8Vgtfxb2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflMAAKCRCPgPtYfRL+ Th0yB/0fjMTB1KsWQAaZ8hKob+FUqrGTK0+dYFaX+dUyoSiXtEFRkroO75lmMsOl39ZxuxuKEVe xxNoDKBn5NCGuNT2QX9iP0V9qgBynD326FNGrGql0U9qwIU7VeznyahzOA7MuHRXZIjsETfAZH7 E9qsYUWL3TCaBmk/OdB6gywuf17lX5LTV0BoaYu7RMAmIWJhVWXI5l1vOaVHoEdaDAoJx7+ypkS zBArVkbSbz4CfPXaMW7GSVpOLrV9PtKUIEMApiysY7TbaFX9L1wYbi8g0x53xNf9/FMtx6dG8Ux bh2oJBH0LsiC/uIeEIvE901zr8hH9GfbTWUsMYh+vTD9Vm9N
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234835_314626_8CFA4923 
X-CRM114-Status: GOOD (  13.66  )
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

Instead of hiding the rtc ops for the only supported device behind an
abstraction for multi-device support, hardcode the used ops which gets rid
of the need to call platform_get_device_id and two casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-ab8500.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index c6147837f957..0978bd0a3393 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -323,14 +323,13 @@ static const struct rtc_class_ops ab8500_rtc_ops = {
 };
 
 static const struct platform_device_id ab85xx_rtc_ids[] = {
-	{ "ab8500-rtc", (kernel_ulong_t)&ab8500_rtc_ops, },
+	{ .name = "ab8500-rtc" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, ab85xx_rtc_ids);
 
 static int ab8500_rtc_probe(struct platform_device *pdev)
 {
-	const struct platform_device_id *platid = platform_get_device_id(pdev);
 	int err;
 	struct rtc_device *rtc;
 	u8 rtc_ctrl;
@@ -366,7 +365,7 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
-	rtc->ops = (struct rtc_class_ops *)platid->driver_data;
+	rtc->ops = &ab8500_rtc_ops;
 
 	err = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 			rtc_alarm_handler, IRQF_ONESHOT,
-- 
2.47.3


