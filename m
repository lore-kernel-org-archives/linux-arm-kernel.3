Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2wIb61d/vbPBh3LQKJdX0mxih1u5j8yQcVxqysPPzU=; b=mRgf1VyrD+BNG41O6WcG0MYLEi
	MSlQHUCB4bk2nk6/fMwu+BVZJy+w7P9DaSU5isXuMBWxnNenqdXEGvSPhuhZubAgvFwFLvwbQU+Rj
	7yyfSiIjZfJ8kz3dNVJLTHdZBb/wHLjDCgM9/TsV3gvYhItRM9rjY/f/E8Rx7lpTm4Ai2EbI+4dw9
	Uf1gUAnppH1BUzbS14ZVbH8+FsoIh9MNRcBdDJ9cVja4gxEdhM4oWuVvSAPSdvk24j+PR61ek1oua
	9B03hcny0p9rWABtDGloup326F6UE6JA0Zo7Ak03vGbDFdDA0V/Ap6Kyz/AMXgSM2nHRXeMbXaapo
	y2GFlQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFN-00000002dY3-01Uz;
	Wed, 01 Jul 2026 16:57:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFJ-00000002dSL-1NDg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24739C4FECB;
	Wed,  1 Jul 2026 16:57:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19A3D5FD9D;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86291104C968B;
	Wed,  1 Jul 2026 18:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K2wIb61d/vbPBh3LQKJdX0mxih1u5j8yQcVxqysPPzU=;
	b=cSuZuf8GDIuNhZ6U5aARBc6UsrU538PsigMWIn47bQOi3xRZ4rhckFNXxD9iuPK0qjHWde
	EBbHuVASC58WZVkYEtEfx2e6M+WjcvGanFpAzlgUp5Bc9lQAoo71C8vxDhuuO7yaKjOAN/
	MERhxkvZ/lPKSCf3BkuUr22TNulcwMElLPcD2R1yphq7bRrrGXCcqtZx55dpXgvwLvUYMj
	Pn3KzcNrX5g63O6RK+liQSID2F+ytFPTo/X28/VldBh+9OYAxpxJq0Bw29154jiYbXMiS5
	kWAckrB3aoNvunrvi//33soqtcQlp0Zh1dB0cPWQ2bk7NLBlcSkxKPclHsNZqw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:00 +0200
Subject: [PATCH 3/5] gpio: nomadik: drop duplicate probe error line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095709_550902_E809FB77 
X-CRM114-Status: UNSURE (   8.92  )
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

Now that all error codepaths in nmk_gpio_populate_chip() log an error,
drop dev_err() call that is made on nmk_gpio_populate_chip() failure.

Current boot log:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
[    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct

The second line is always redundant (or is logged when we shouldn't log,
like ioremap or alloc failures).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 4a7db282bad8..eba095eeb3d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -651,10 +651,8 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	nmk_chip = nmk_gpio_populate_chip(dev_fwnode(dev), pdev);
-	if (IS_ERR(nmk_chip)) {
-		dev_err(dev, "could not populate nmk chip struct\n");
+	if (IS_ERR(nmk_chip))
 		return PTR_ERR(nmk_chip);
-	}
 
 	supports_sleepmode =
 		device_property_read_bool(dev, "st,supports-sleepmode");

-- 
2.55.0


