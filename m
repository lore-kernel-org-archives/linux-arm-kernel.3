Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3717EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0XjqYUV6uWOO/CR3IsfQubms5Qr7YsKpk3FucyopeU=; b=4Xjs4sze0Icx1smDvk9yTHjMeV
	/6VKtT+jTqKTNZGMmGZDdaMs+NrgH3loy8uwAMOWTTsCT05dFKmIeC9TbCxEkCNcsD1tE9b0jKZyz
	FwepxQDssjY/1/agHzUqaRt8P6lYlrnEWsYN348t/CUZeHtB70OftjjE3dbx1LWJN2eZr1Ftmc46/
	9vVLs8Svxjy5WOGTSqdX8p0pszXMxSe+Qe7mYFtCI7DIIiHN33NKPLqmnR75XKwKzQVK2RcqWPHIN
	JOHvi7a7EvpUTrXpX+fd9o+KOrsmBFsqY5x+flfulYOnLApEFRHJZ62lZ7OZPX37G/yZsNUgdt53Z
	NjKr2Zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFO-00000002dZR-0N6x;
	Wed, 01 Jul 2026 16:57:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFK-00000002dTy-0r4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF93A4E40BFA;
	Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852AC5FD9D;
	Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5BAB104C948E;
	Wed,  1 Jul 2026 18:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0XjqYUV6uWOO/CR3IsfQubms5Qr7YsKpk3FucyopeU=;
	b=int3NKhg7SLAN8ZzlX+3Ualoffw+mXJvJgs8ByUX4Y5GG+8c3errKU+GrG/8yIZ42JkHc+
	yRz0T9LYqR46hIRad8KaaUOwDZr0kLYpN3lOF36iWZwGREZbyhxj2zu7pj1VQZVUycUrfv
	shaLBkjF3TaUhFbpspWM5bv33geNWiEEUozbB9tashUxRgqnljFSpQpUjBEuHpqGVFMuTv
	vTOuehDsG8CK0jzSCXQMA47Qu8qOrs0Cg49hAmvRvH0fA6bfWZZDC09nePKVXeo1xB7/C1
	5ZBxNEUcD3L2O6mjI2sBFF0KrVCBbfJcNb2ySATGpoRzkpIpqhrLn9gAlGBlFQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:02 +0200
Subject: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe
 success
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
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
X-CRM114-CacheID: sfid-20260701_095710_409874_E08EFD50 
X-CRM114-Status: UNSURE (   7.71  )
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

Successful driver probing should be silent. Drop unconditional
dev_info() call that is done at nmk_gpio_probe() exit.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 1ee46f59d708..244331f468cc 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -712,8 +712,6 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nmk_chip);
 
-	dev_info(dev, "chip registered\n");
-
 	return 0;
 }
 

-- 
2.55.0


