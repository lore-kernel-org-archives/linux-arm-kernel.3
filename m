Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFC0D690E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PTVe6tHU+QUhSHuSARrd4RmERiwOyLRYV6vBOxjAC90=; b=JmeItPrdfX+Y8JbzCoAPuACbeL
	ZK2fdGfG8fF1sD4JIeVr0oD0Dw/sjYP5W12s8Vq4JCPOf8pC74D9s1OcZ69qIByXVsAk0K7Hn0Bf8
	dp8XeqnlOY4IaKeX9bu1Mw8/apL42VOllzmbLZrna/flYoVem7q7uvy3U0hglIi5ZwUiNLk2iZfe4
	6WuqbttyK6qT01Sm4MpPuK/JLO+OgF6xgDv6RioRwOJy0J8g4v3gLeSd0y4qqGwkOB9rAZiCFc0cF
	CyOWNmbQ6NcVB4B3Izf7p8a5pDiwWhOv+slxkO4F3hqoevGMQVTZZlQsXR5TyuAayXwZ6CXRctnPz
	bZimzisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYsP-0000000EsK5-0wQr;
	Thu, 28 Nov 2024 07:23:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYrQ-0000000EsG6-0Iq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 07:22:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so2946765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 23:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732778566; x=1733383366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTVe6tHU+QUhSHuSARrd4RmERiwOyLRYV6vBOxjAC90=;
        b=wmA1SDs7ol4hmxIW8dLRnMLNzWqwijaL2bLk5w2S+bQJG3JZXkoSlKhiESq72A37MD
         2Wof2+2b/fUQrLdXJ3o3BzbXzOSZdVXgv6g9pcxnRzk2rURx4LUKVAz+PJFlC95FO0C+
         DDvL9yGs6HxIRgTyr/4yA51vIVMjjlGRpaiKYUjr8g47f7mz8fdXTMFQ/lY8UHNEW8Di
         8t+o9Q6BnbxO2M3HqiTDpPi3quaROnAmzmDy7UJrDkOolWzDNPnl7/ovLj5TaqGTVPP0
         l5YW/ehwU1KdvzabZ9PfL3lUjcPgnW3MjnLMuFBfU90E7sQK7jY9T0woPCSNedFyDrfv
         BtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732778566; x=1733383366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTVe6tHU+QUhSHuSARrd4RmERiwOyLRYV6vBOxjAC90=;
        b=W+A+3yDfLvdHajexn9qRXqLkwGULyIkqR2kssWNk8SisrGElXCgHcQSyuo0Ak8F/6L
         rnbrFCttDiB49HEaJ4Re4T0V77FaCw7Hz0qWwJQLgmxia2G5FWTLecaha7gfpgYBiMqJ
         inPptmK/ft7dLMTzFysHZ8E/1nSyUp5FG1BitF2G4p3wJ2v+MGXS32x1IMoZ06ARGdjT
         1hDhOpkU3752fGDom9S9Fjp6ljI1agI6WDnl7nvz8Msi17QFWRY/C02TMuh1MveVyS6v
         m1jcjrAGrQB8Z8cb0CgeEflwQ0Lr9gbAbD65hQzf4sH+738qLYVaWUAOmerRNmZwE1QP
         yFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftNZHOTGMK8DL2eeAv44n2YThAhF355Z5WZY7ePdCx6qwq4bU0ZDwMeI/7IMhsOyqeDOar696dizVBdjxMtTb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2uCJo/cGSvCjIhAsbkpXnHXRcy3Sr0Y52svZD3LDuslqz+mIH
	/jub4K9+LPg7xL+BSIEHgDOjnK6wKauo2LlEv0cw614zYtML9YU2W4R3ODA8/vk=
X-Gm-Gg: ASbGncs9q4tWJtq9TQPIGlD1GoH9mG6lVV9YXUHpVrsDMa/qXzl9YrmHxhlHAdJUXmV
	CoBKd9mcMWf+zAVeon7LZY3KUtAj7IjgweJBelYAlHNmkJ+fKj3mMpj8qI5jnLWd/rkmRn87dk9
	ZtIdhftI2/E+g4lyL4p3AAIHPluITAraNoiblnsnaazvyO1P6GZqEez1gazgPw2WPfWFhEFvMcX
	1VEoMl6G47GZR1My+7FsRng4JS3bZbc4yY+iCtWsJ+hxamaIhHPHg==
X-Google-Smtp-Source: AGHT+IEKSb7Ar28Nb1YZxg/V2OBSEtpXATH7MY0ZG2xhK4Gnc+17q6QjH/1fj2El41zQpkL+O6mIJg==
X-Received: by 2002:a05:600c:1d0f:b0:434:9fc8:63a7 with SMTP id 5b1f17b1804b1-434afb9539dmr16815245e9.1.1732778566286;
        Wed, 27 Nov 2024 23:22:46 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:d1f0:9fd7:467:6a80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d22d4sm43589655e9.27.2024.11.27.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 23:22:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pcmcia: Switch back to struct platform_driver::remove()
Date: Thu, 28 Nov 2024 08:22:35 +0100
Message-ID: <20241128072235.711764-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4826; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=cYiMQFUepr/7HIOZlaZuHcLmID0r11UiHRyOy2FF3p4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhnQPKZss5TeFRenaRq5Ct/a7P/xU+Njv3sLmEFbds8UhN m9rjbZ1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRCfzs//06c3P+Hbt/WH9L gM98x74/leUz/lmpSYjkPu225zBTndYz8bCvgY7ebtdP/8u3ccxwueMm9E0y1Op2qN6KjHc9d0V 21vt+CFcTqFLQPrP7/ae0r739x6cbhnAbyJUceXU2Jdc1hNsndekn1X+22uznhT65rflXuHRN/2 uRtVvulgerNW6tUmUv9rl1e4ZPlP7H/n8tMeuaRSf2Cp9nWXapd6O91mFDr5ig6OjNSxSjCy7PX r0rOizxMMub27Fsypy7vHfNrZCY7/S4/KzA50XV0jcd/IM2rk4K0+0wqeJpP1HmqvT5YvtLbdV5 bF5tzuxLT81ItS/VP3pCrPR3zLIW61mPOd/aL3m5YLkrAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_232248_379128_735B82B4 
X-CRM114-Status: GOOD (  20.59  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/pcmcia to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

En passant make the alignment of the struct initializer in
electra_cf.c consistent.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on todays next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

The change isn't urgent (as there are still quite a few users of
.remove_new()) and merge window material.

Best regards
Uwe

 drivers/pcmcia/bcm63xx_pcmcia.c | 2 +-
 drivers/pcmcia/db1xxx_ss.c      | 2 +-
 drivers/pcmcia/electra_cf.c     | 4 ++--
 drivers/pcmcia/omap_cf.c        | 2 +-
 drivers/pcmcia/pxa2xx_base.c    | 2 +-
 drivers/pcmcia/sa1100_generic.c | 2 +-
 drivers/pcmcia/xxs1500_ss.c     | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 5bda3e6d43d8..695a24967474 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -453,7 +453,7 @@ static void bcm63xx_drv_pcmcia_remove(struct platform_device *pdev)
 
 struct platform_driver bcm63xx_pcmcia_driver = {
 	.probe	= bcm63xx_drv_pcmcia_probe,
-	.remove_new = bcm63xx_drv_pcmcia_remove,
+	.remove	= bcm63xx_drv_pcmcia_remove,
 	.driver	= {
 		.name	= "bcm63xx_pcmcia",
 	},
diff --git a/drivers/pcmcia/db1xxx_ss.c b/drivers/pcmcia/db1xxx_ss.c
index 509713b9a502..85d2616061dd 100644
--- a/drivers/pcmcia/db1xxx_ss.c
+++ b/drivers/pcmcia/db1xxx_ss.c
@@ -592,7 +592,7 @@ static struct platform_driver db1x_pcmcia_socket_driver = {
 		.name	= "db1xxx_pcmcia",
 	},
 	.probe		= db1x_pcmcia_socket_probe,
-	.remove_new	= db1x_pcmcia_socket_remove,
+	.remove		= db1x_pcmcia_socket_remove,
 };
 
 module_platform_driver(db1x_pcmcia_socket_driver);
diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 5ae826e54811..00c5aba50844 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -341,8 +341,8 @@ static struct platform_driver electra_cf_driver = {
 		.name = driver_name,
 		.of_match_table = electra_cf_match,
 	},
-	.probe	  = electra_cf_probe,
-	.remove_new = electra_cf_remove,
+	.probe = electra_cf_probe,
+	.remove = electra_cf_remove,
 };
 
 module_platform_driver(electra_cf_driver);
diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index 80137c7afe0d..f0ccf479f36e 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -306,7 +306,7 @@ static struct platform_driver omap_cf_driver = {
 	.driver = {
 		.name	= driver_name,
 	},
-	.remove_new	= __exit_p(omap_cf_remove),
+	.remove		= __exit_p(omap_cf_remove),
 };
 
 static int __init omap_cf_init(void)
diff --git a/drivers/pcmcia/pxa2xx_base.c b/drivers/pcmcia/pxa2xx_base.c
index 457fb81b497a..370a8e16dc81 100644
--- a/drivers/pcmcia/pxa2xx_base.c
+++ b/drivers/pcmcia/pxa2xx_base.c
@@ -336,7 +336,7 @@ static const struct dev_pm_ops pxa2xx_drv_pcmcia_pm_ops = {
 
 static struct platform_driver pxa2xx_pcmcia_driver = {
 	.probe		= pxa2xx_drv_pcmcia_probe,
-	.remove_new	= pxa2xx_drv_pcmcia_remove,
+	.remove		= pxa2xx_drv_pcmcia_remove,
 	.driver		= {
 		.name	= "pxa2xx-pcmcia",
 		.pm	= &pxa2xx_drv_pcmcia_pm_ops,
diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
index ccb219c38761..7b5ac8fe811d 100644
--- a/drivers/pcmcia/sa1100_generic.c
+++ b/drivers/pcmcia/sa1100_generic.c
@@ -177,7 +177,7 @@ static struct platform_driver sa11x0_pcmcia_driver = {
 		.name		= "sa11x0-pcmcia",
 	},
 	.probe		= sa11x0_drv_pcmcia_probe,
-	.remove_new	= sa11x0_drv_pcmcia_remove,
+	.remove		= sa11x0_drv_pcmcia_remove,
 };
 
 /* sa11x0_pcmcia_init()
diff --git a/drivers/pcmcia/xxs1500_ss.c b/drivers/pcmcia/xxs1500_ss.c
index 2a93fbbd128d..f84dd5914a6b 100644
--- a/drivers/pcmcia/xxs1500_ss.c
+++ b/drivers/pcmcia/xxs1500_ss.c
@@ -316,7 +316,7 @@ static struct platform_driver xxs1500_pcmcia_socket_driver = {
 		.name	= "xxs1500_pcmcia",
 	},
 	.probe		= xxs1500_pcmcia_probe,
-	.remove_new	= xxs1500_pcmcia_remove,
+	.remove		= xxs1500_pcmcia_remove,
 };
 
 module_platform_driver(xxs1500_pcmcia_socket_driver);

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


