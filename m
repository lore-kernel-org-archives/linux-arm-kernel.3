Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=069svORtyCtYRHYaLHWNs2IVK4x94dg6+FEW0jE90ig=; b=H2sAOkK3B3g2gSsHlieGiCd+jt
	TcHGGaK61miHQVyoL3p9wBkU1VjMTmL7LPYs81GKfKODPGdX4g1+SFxA+e6QFyPePfEyz1sSh7njW
	oD6r0Z3izS71uiD2HJMZ1uB+WM5FKT6vYNylY9umQyBvZREHEDd9VpqSspJtfmAV+sZwNml8FVSv9
	UY4unrTfpWGPHc+GwwQv1/D2xqLmlTAlnwv7U/Heber5N1xMZRnbHtsRl85+gpZYvuvdTVRb/23tr
	NhBq9DKHJSUCtqcuNi8hS8PeOBQguDxnTOrcq7o9u7Q2/l67qnjTHuI9+CNOWDttnJpd69VY/4au+
	aJcP+rxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjumi-0000000E8VG-3hu2;
	Wed, 15 Jul 2026 08:16:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjumg-0000000E8UW-2l34;
	Wed, 15 Jul 2026 08:16:04 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784103357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=069svORtyCtYRHYaLHWNs2IVK4x94dg6+FEW0jE90ig=;
	b=S+VeRqtG5jBbEUtIk/aobk8kRiO5gVxLPO/2xwGMHffxZuw5FuTltyoWFzKrfQFVpAdE34
	Jl+ibliUh8TXAW5Z70ThtVx9Y0keOLIU0SLSYQUspaLTZ0F/6+UxmLOm+lluMBRrQyqbCO
	U1Ki6umQVT7far+z4iefIieKFcuKA1F25gFcJmLlOzjHRewh4htFoZGAZRRwvpEkEZfNJm
	cI0kYA5UninTshHJkq/n/mKqIdP93kLZFD9uuQmZeClT05gfQ9Tj7/wPhhjy2m4Ut8thF2
	0OWlSBi85yIbG+QpCj6UToX/sMKdCr1F0lJ29u6Dmd8dq/9NpQuIXvGkkd7WLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784103357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=069svORtyCtYRHYaLHWNs2IVK4x94dg6+FEW0jE90ig=;
	b=K6wu4rnQ1ce5y0zo5F93CG2EgbmU5dIuXh+ePpbjHxEarAL7PgnebMyiR7S7jNOOVRV51C
	hBe1VfXQcMPq/4BA==
Date: Wed, 15 Jul 2026 10:15:49 +0200
Subject: [PATCH] pmdomain: raspberrypi-power: add remove function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de>
X-B4-Tracking: v=1; b=H4sIALRBV2oC/yXMQQqDMBBG4avIrDsQgxroVUoXGv/oCGqYVBHEu
 5u2y2/x3kkJKkj0LE5S7JJkXTLKR0F+bJcBLH02WWMb48qaNQrHmRXzuoMrDxus62qElnITFUG
 O3+/1/jtt3QT/+U7oum7kWY3dcQAAAA==
X-Change-ID: 20260715-rpi-pm-remove-4ce2f27b5efa
To: Ulf Hansson <ulfh@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784103357; l=1632;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DUMpCtmzqNZECMm9DCH89x+Qh2EGRoVif4z9CSmaRlw=;
 b=7Vqo1EJ6O4wEXv/6vBSIwOV9PCjZmGsxxCW8jc9inW5fLCsIxVbw9OHMBL3g6IXpq2oJ2uBlZ
 MrCfMdowNI7ABWa2RpIn81fuXOVMxbK81Cb5R4fqV2XmCVwRwhqYDj8
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_011602_852000_E8F3E107 
X-CRM114-Status: GOOD (  10.46  )
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

The raspberrypi-power driver registers resources with
of_genpd_add_provider_onecell and pm_genpd_init but never removes them.
When the driver gets unbound and bound again this causes error. Add a
remove function to cleanup all registered resources.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 drivers/pmdomain/bcm/raspberrypi-power.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/bcm/raspberrypi-power.c
index b87ea7adb7bea..2c2135c17afb0 100644
--- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -232,6 +232,17 @@ static int rpi_power_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void rpi_power_remove(struct platform_device *pdev)
+{
+	struct rpi_power_domains *rpi_domains = platform_get_drvdata(pdev);
+	int nr_domains = RPI_POWER_DOMAIN_COUNT - 1;
+
+	of_genpd_del_provider(pdev->dev.of_node);
+
+	for (int i = nr_domains; i >= 0; i--)
+		pm_genpd_remove(&rpi_domains->domains[i].base);
+}
+
 static const struct of_device_id rpi_power_of_match[] = {
 	{ .compatible = "raspberrypi,bcm2835-power", },
 	{},
@@ -244,6 +255,7 @@ static struct platform_driver rpi_power_driver = {
 		.of_match_table = rpi_power_of_match,
 	},
 	.probe		= rpi_power_probe,
+	.remove		= rpi_power_remove,
 };
 builtin_platform_driver(rpi_power_driver);
 

---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
change-id: 20260715-rpi-pm-remove-4ce2f27b5efa

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


