Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6408CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 22:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwLzgTxmd17MPMjVud2qLnK0Cd61KPIrOzasA94Klt4=; b=WBzKgOj2fzyi/POxgLOOlolSK/
	xboolRmz3iVJxJL4igiKeWmlKtMNDJISrlZ1e3nBpBm/edM4eYeFVPLH7Lp1uuMuhxmkXsOfoCGRI
	/f5yMGQPXT1w+jGLnOWDReqq1YnrLP1KNCFOCe/SYPuSesiufvZkEgudHIwwHQv798WoTWJpvUpWf
	npKyq83L9yVnNNHvHO0towXRG9cxhtVyD/vZ/LKuOi6HVdvq2+joFNbEqgIbpggNfCl33d4udHJi5
	az31htOMsaJpBrF9MqfK1Rc47a6ocK7YeYUDmkRxMxPkI8ja0tYTg1IKL4nNz3rYFVi+ImEROFbw4
	mPJ/I4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyNh-00000000O6L-38fq;
	Wed, 17 Jun 2026 22:05:09 +0000
Received: from sender-op-o11.zoho.eu ([136.143.169.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyNe-00000000O5Z-0fIr;
	Wed, 17 Jun 2026 22:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781733900; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=VoBW12IeSG/YFCRsIpOAw34h/PXpuszDABNyFeqrhtbl/I4ljPTKKm56s/4gqORumKxZZ6L4eRP5qfVzHEUx3s/WomoSOSKlZeL0q/atYT5kvPg5EFK4iVssgzKAWuINl8J/oqeh9xdtGCSvUEY+CcoI9o8tyjntPBfmSaWoFow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1781733900; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cwLzgTxmd17MPMjVud2qLnK0Cd61KPIrOzasA94Klt4=; 
	b=B4AspH2QACy2j6PgvizBfA05OBmNVC2D1pGl2IWX+vPn0TiXU4uZugfvn8JHuVRwfeZ/2Yk0Dt2mpz6DgQSb71R9BjwmaKuGjmI7f1gt0q1Fu2HRaR7RrP50Co/aWDHB9E88FQlnCkg3ID0fRs1UHL47vHkYWobXWJvlU4WVUaw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=dragonzap.com;
	spf=pass  smtp.mailfrom=daniel@dragonzap.com;
	dmarc=pass header.from=<daniel@dragonzap.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781733900;
	s=zoho; d=dragonzap.com; i=daniel@dragonzap.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cwLzgTxmd17MPMjVud2qLnK0Cd61KPIrOzasA94Klt4=;
	b=X/j09m6urwiiFXYm6GBH2zaOdOVbYQnCxx8aK6NUdd23LC7dhr4bCnwyvPY5Z6qW
	LAO1QoRJv23U3NLktZMuj7Xl9yDfN527XP5APUBj5cJtX+KQvjz7JDZ5Whim10k3Zgd
	BmNe9KSNrKAnFpCAWzRruJutViut6vN4n+pkiIJM=
Received: by mx.zoho.eu with SMTPS id 1781733898081206.27637502109712;
	Thu, 18 Jun 2026 00:04:58 +0200 (CEST)
From: Daniel McCarthy <daniel@dragonzap.com>
To: Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel McCarthy <daniel@dragonzap.com>
Subject: [PATCH] pinctrl: bcm2835: Don't remove an unregistered GPIO chip
Date: Thu, 18 Jun 2026 01:04:51 +0300
Message-ID: <20260617220451.15298-1-daniel@dragonzap.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_150506_530701_D715EA82 
X-CRM114-Status: GOOD (  11.39  )
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

If the devm_pinctrl_register() function fails,
bcm2835_pinctrl_probe() calls gpiochip_remove()
before gpiochip_add_data() has registered the GPIO chip.

This means that upon failure the gpio_chip.gpiodev
 is NULL resulting in a null pointer dereference
inside the gpiochip_remove() function.

Remove the unnecessary function call to gpiochip_remove().
No GPIO cleanup is required because the GPIO chip
has not yet been registered. Without this change there
is potential for a kernel panic upon registration failure

Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
Signed-off-by: Daniel McCarthy <daniel@dragonzap.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index e7b35019a5a7..725e880ae086 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1350,7 +1350,6 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	pc->pctl_desc = *pdata->pctl_desc;
 	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
 	if (IS_ERR(pc->pctl_dev)) {
-		gpiochip_remove(&pc->gpio_chip);
 		return PTR_ERR(pc->pctl_dev);
 	}
 
-- 
2.53.0


