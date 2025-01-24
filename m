Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00906C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91vGKH59fvOB6uF7f30sPCflWM08DH4/8R/h6OH+xOk=; b=TMk9G09rXm2nLE
	mxB8yHYN+5bbrqaAkaMVCpTw7ymYn7CfiFgZHnM0K3BFXysKKngpZ4FiNKIfC44uwHmV0KsJA1nH4
	KOxzkiBsdUtISEJZlV+BIOFNcjvzJ2+u+KKHZADaXvL55LTuFWn5J9QmG/OPQ/QQTmI9C2wlgnFhu
	NOSJmj66d9uTt1XIAlQUgsVngJyW+Rf7MB+MR/qntyXL/boLzLM7E43hEfSSz6qUdyA8/S6EPgQbA
	+mll38fuZs1JEc+eDwEkWV3uMfIt6BEfopNboQOgPQjgxf7cnmbA88/lvzCW9YVRq7ups8WzpWOGB
	w9swM2k0zV6lsLviAA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFc4-0000000EJtn-0xNr;
	Fri, 24 Jan 2025 09:04:28 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFWP-0000000EIiy-31xb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:58:39 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 67C1FA09FF;
	Fri, 24 Jan 2025 09:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=91vGKH59fvOB6uF7f30s
	PCflWM08DH4/8R/h6OH+xOk=; b=bWYdEBiIDfkr5t2LBwXOpExJcaNdyEpjr3q2
	ujGRpZDepB+Fx3X3FYnLbdlDmMxfY3wHv0NYj6BUtLajCg44fS555JfAKXu/+f49
	qu9A574fniGVyIevXemx7T1caMjd6NJr+sZSb/2sW315WOaAuQMgB9x2MqhTNkU5
	On4CKaM4B/ep3/QMX9gY8i9nJJSoKN8pajGpyixUlc5blKLnoIFkc4lHc3rmBIdg
	rQWc+cKNU99krC1xf8pOMHpVXaRbB7XDlK55Ek5GU1uS9GieGzhqx0PRzduawBUU
	sgr59jdZzZHacGyk9t0Tyr6zLp1tYoHB1trhaDB4UnsWhaKoirFEwnHtvhntNpTG
	7k/APjH6FD3pfQWHiG78iYXuFVQ9r0gdCZ4sE/Vz98Vv/lUpemkky1sKAYu0XjkS
	TVBNa2Z7F8vb1MgrF3DMe3hBUvgl8R9TtNM+FAvBBNayDlgrroxxA/FKQO/BXh3e
	3aljHpxEVc0tyUJx1t+gu78iZTUPVELAE3NbEk1ncS/zoilz1InQAfMz7oaQSFZE
	VKZ+lXImIMm4fM2U542tYqr6Er0Ni1im0U9lzAJuycrW88k4LVyM/zEpPYA7DV0J
	86WA0YFH+JE9KQkZfJw2C9vdjQrmup3iGmI+qNdrOump5JWjQLZlIIAm+UpK1VIq
	yTsUm3g=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Mark
 Brown" <broonie@kernel.org>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Fri, 24 Jan 2025 09:52:27 +0100
Message-ID: <20250124085221.766303-15-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124085221.766303-4-csokas.bence@prolan.hu>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737709115;VERSION=7984;MC=139577634;ID=70505;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005837_912157_33F49441 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org, Alexander Dahl <ada@thorsis.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fix unbalanced PM in error path of `atmel_qspi_probe()`
by using `devm_pm_runtime_*()` functions.

Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250110-paycheck-irregular-bcddab1276c7@thorsis.com/
Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index b1fb4426c78d..f2164685d3d5 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1426,22 +1426,18 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	devm_pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_get_noresume(&pdev->dev);
 
 	err = atmel_qspi_init(aq);
 	if (err)
 		return err;
 
 	err = spi_register_controller(ctrl);
-	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (err)
 		return err;
-	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -1511,10 +1507,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		 */
 		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
 	}
-
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static int __maybe_unused atmel_qspi_suspend(struct device *dev)
-- 
2.48.1



