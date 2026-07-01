Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8295C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6cCDMcE1p/9I6+WmIV0DfGkYZtlEQgIJeATtpeJyo4=; b=UZOK5hM7bMcup4GFybze2nCKMX
	YfYgddI9HdyCJKdDdhz5qVBItiJS4SYhX6Pi9QkXGqp2XapXnkGwk7+HFXVqKeoOXvYhc3lUARTco
	85DtEsPrCeLws8hRHgw8As3lO2qi5YhEcOa/0yus6Xvx2sGXoySXbOqEZmhNP7hBZ3a1hk2eomXuW
	xJjxl7zCbexiWhhcO+fcKb88kdR74JntNnmW2WOc26oZz/JUegVfRn+trSkVUzxCjihHl/U3uIoFW
	SBWqp+PQij2uU8rRTlq8eTlFmPRfhWi3g8quF2oSq1JTFCeYft0iqA0jbd+ogVxzZEn98c5gdUOtm
	ViCYR1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFK-00000002dV6-1IFg;
	Wed, 01 Jul 2026 16:57:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFG-00000002dRf-2mPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 314094E40BFD;
	Wed,  1 Jul 2026 16:57:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 073D95FD9D;
	Wed,  1 Jul 2026 16:57:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3985F104C968C;
	Wed,  1 Jul 2026 18:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R6cCDMcE1p/9I6+WmIV0DfGkYZtlEQgIJeATtpeJyo4=;
	b=HftNtOmzyhbBMGZvqUlgvKY9D97TOBHEPHo6yBJcbOimL8Dxe3tDhdRVNtywYK2uxesgso
	ofOzOoc8SB9XrcQCjyJlo/klPk2pfpB5B8qmO1zGT1qKBAVZkBFPn2W5CTIhyrNr40Z2Pi
	cVDP9Eu5QyXm8SlKmqIic8HJpgvPMX4A8m6fzQArYrOS46aPv85N/wSMsw1v68k7kj67Bm
	YAp46+7HnUReIX+s0eLxT54Lzp2LDQ/vdbhAIhon0jiB4AUpSZ87eZyUPOhd7ONxG60Zbg
	DqKJAtICVbl2GT/bcCol/m3kb3GLu0vfYn37YkR2dH5VtsK8YhYrk4nZ4+NO+A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:56:59 +0200
Subject: [PATCH 2/5] gpio: nomadik: add missing dev_err() call on chip
 populate failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
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
X-CRM114-CacheID: sfid-20260701_095706_842461_D23A2F92 
X-CRM114-Status: UNSURE (   6.64  )
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

All error paths of nmk_gpio_populate_chip() lead to logging errors but
this one (ignoring the alloc or ioremap failures that must not log).

Add the single missing dev_err() call.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index f25f251f4757..4a7db282bad8 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -578,6 +578,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
+		dev_err(dev, "failed getting clock: %d\n", ret);
 		goto err_put_pdev;
 	}
 	clk_prepare(clk);

-- 
2.55.0


