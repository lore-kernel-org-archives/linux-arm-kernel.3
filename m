Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068D9FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9zaJmxmPtYn1AnHNsGSnxP0G6t9RJZXJdc+PeFZxIeo=; b=uZ/0mirJUU762WhRJKxx9Q7h8O
	ijlhCx1lLmmds6WQCNuNHlCygqeKq/8/t/4J3H+aKcmQbACDLWg0oVeDYThoLciK1GmvT/XH9vncb
	Q0xWGAVxj6cbHqKLa9y45t2EkeUefi/7akCKMI3IKza2e8iIkQxr/BQMJ02zGGJsdNnCcJCb237mT
	YeLagAyjFddCx0f4+P9o/JyBQ7hvQ9EvFbL502poGHrPk6AxjUWtXLlxTVW3QKVd7W42CJZDzOvl8
	CEqKNfsgOS0WGQa+LvwtrJtoRiiZ3OvU5y9uCgh1dMGjfDeXWR7EJzUdRGxIsaRizR+g9Jv2ZOrzk
	7eHLF5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTjf-00000000ByT-1aOL;
	Mon, 27 Apr 2026 21:43:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTjc-00000000Bxy-2yAN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:43:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44509921fbcso909493f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777326198; x=1777930998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zaJmxmPtYn1AnHNsGSnxP0G6t9RJZXJdc+PeFZxIeo=;
        b=U1CBq+YuiVr+0bCF6pGdr8ElyXBSbuZCqH5SQPZTH9pReScQw5K30zY+CupS5Zue/K
         8+OpQbK6toRXIF4cNpT5Hgp7jQmBEWevjQT7uE9I1zgtV8xTHVwag8+VN/IrrFU/4jwL
         Z+JfTUOMYgt2PQ5zy/QoU34FKzypzycOX5ocIFoqiSK45nSvnw3jQ/lJpmodOgkOYMkb
         d6xvwD8bAU95lXQ2YltC1Pf93HklCu64VPtQzAxoVFM6BTIKjOZLG73dNrSe257AYTZG
         XXXej94aUzDhBWfL6M26/XtdATX7M8boTWLlWSxfBS4XW9DLzZDNdD7FnkdZHvaLWFVU
         iceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326198; x=1777930998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zaJmxmPtYn1AnHNsGSnxP0G6t9RJZXJdc+PeFZxIeo=;
        b=IGRq4OvnYGIG/fDek2T4hxhGrR/+aK/9ElUePgw9cnGCyMlZEjZXxfUrko1O13rGqi
         FS+v2XNPOVJqwu2i4oiPLIOtWVPZdwhN6h6k/p4iry5r6Sg2FjVz77hZLSl+WdJp/ooM
         W503gOEEoojlQ9ALQYocN1qn/cIN8cSD+rJ+/a+n2s2YiewmbZDT9FTKAr6Efb9e8YtR
         DpOD+KQBvMUTujW8ckWKNkzWZGn/kcQywO0oI67UPlUZlgT23vjd890vAQmHovsB0cZf
         kQNmyVhQKkDtcST/1mI/zTgoKL79+GSjXwqe7xxEoNdURnRq9RY+6Kj5VEpXj58JDGhM
         hNPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eng3KsKj2qqAUlFSXPbGmJlUb9BZGBY34kTsw0WwVoDbg0lt+9CJGOSMYKS0hbT1UuoG24agKZO+7pGQ/OrWW@lists.infradead.org
X-Gm-Message-State: AOJu0YzCrlH95TE2IypmpQuHCeA4zGilg6O1XuqEy1OOROcbXqmgjNez
	6FWh81xp4TH8Q9QFMpc6GxgP1lUpzuAqjcaAcZdUZVDOROWM+OM3QZ0w
X-Gm-Gg: AeBDiesx8+q1PiHb+K2nBuB7SZ/bjkh5Bla9PbE310wtYl6bI8z9UUCKx63B0JCcnMc
	e4eCya8HRCtkcgf8X29v92ZYgtTay86yAy34UxBFm5ujRjIUa9XRTHXdrkD9V76Px6REGTvANXD
	XLni2NZFudBb6PDXwBHfPlk/EW9d5Uobzzx+/rLVjNYO0MES7FalWNwKnaA/ejWRRWpRi+j0YP4
	2IGVfkntrcU4L1rTQqQ9FB9udqZ18Lm9ykj/oTVng63IJzrWx6OJeAAtYFDSouznN794mk6WI3S
	6DUTcPydyB3SuRJb1GNvN8hop2VlQQR5q2QDckPPFudtGNeFDPlE1DA0BK/PAb7uLEiBI61DPeK
	3aNmNFKkM93BbRRlFsW4/k1DxCi7gpfxK3OuH4ZcUjQGoiKaci1+Zj4i/UsnnFK6LF3V3KU7wuw
	96iDDtPyllQc+yYHoAcno+b7Wn/+Qz46LKLX9Wvi3QSik5z4epFm+EHU7cl1fFQ5XhCRFAlkTQ
X-Received: by 2002:a05:6000:3101:b0:43d:1cec:4767 with SMTP id ffacd0b85a97d-44649c98decmr874235f8f.36.1777326198308;
        Mon, 27 Apr 2026 14:43:18 -0700 (PDT)
Received: from ST.. ([102.187.193.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f2a2sm1174592f8f.10.2026.04.27.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:43:17 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
Date: Tue, 28 Apr 2026 00:43:10 +0300
Message-Id: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_144320_760636_55131872 
X-CRM114-Status: GOOD (  14.04  )
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

Most IXP4xx platforms are Device Tree-based, and GPIO consumers
use phandle-based descriptors rather than legacy integer GPIO numbers.

Audit of the IXP4xx platform shows:
- No gpio_request(), gpio_get_value(), or gpio_set_value() users
  in arch/arm/mach-ixp4xx/
- No platform data using fixed GPIO numbers

This switches the gpiochip to dynamic base allocation, aligning
with modern gpiolib expectations where GPIO numbers are not globally
fixed and may be assigned dynamically.

Set gpiochip.base = -1 to allow gpiolib to assign the GPIO base
dynamically, avoiding global GPIO number space conflicts.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 drivers/gpio/gpio-ixp4xx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index f34d87869c8b..669b139cd499 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -311,12 +311,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 	}
 	g->chip.gc.ngpio = 16;
 	g->chip.gc.label = "IXP4XX_GPIO_CHIP";
-	/*
-	 * TODO: when we have migrated to device tree and all GPIOs
-	 * are fetched using phandles, set this to -1 to get rid of
-	 * the fixed gpiochip base.
-	 */
-	g->chip.gc.base = 0;
+	g->chip.gc.base = -1;
 	g->chip.gc.parent = &pdev->dev;
 	g->chip.gc.owner = THIS_MODULE;
 
-- 
2.34.1


