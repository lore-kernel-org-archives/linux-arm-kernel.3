Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91vGKH59fvOB6uF7f30sPCflWM08DH4/8R/h6OH+xOk=; b=qutOcmMDeOYDly
	MxPb3rgd+gGa9UTOYekaujeyeN6ccWEzVYF+tJ4fN1sUspDCH2KBrnqOK4vAcbuoTC4uvbcoKhpZ3
	j+rimCPNEksev/b+Tutz6lQ1H1CaHcYzs1Wt+1Nq3AQprENBnUp2QKvUGjJPslM+Qwy22EIdgRAwp
	TgPcYQvF9ieWw9PdMSqJvJ/GvMfP4fOpW5MDE4XS0wsgaP0Xf/4nRUBS5oBed+YcI9Ykd1Ze9NbaG
	He6ZN2NrfD9N17m+ylgIBvg2jjVeYH61VaD+gHmD8RP5TE0othD15HlnvdHdT2a/OOXYNG+RwoLZi
	IoH2CHc09euNsaU3QLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNqH-00000009ZnC-4AfN;
	Fri, 07 Feb 2025 12:52:21 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNmE-00000009Ytq-3AJQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:48:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5F71CA1B00;
	Fri,  7 Feb 2025 13:48:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=91vGKH59fvOB6uF7f30s
	PCflWM08DH4/8R/h6OH+xOk=; b=UhJfmbjox9I7Pv8JXx0NkD5Yy3+79iEgxkUi
	4etXnmKevAOaYoX2eQe3M1MYVhT/U5KVbz9ffvyyENKFiMKySEFsEcesQ3SrbwV6
	kTdVWbOgJ+4FRg1KIL+3LP00DU4CYyDN9IexLk9A2KODf92IYSP5mt1mPM8Q+pAa
	R8UfY2+Tbjil2/ajUKMvsix2qgamkOyJ+Fn0rjPezUtK2wlqIBdeo75havH6Xf3Z
	UVOj5eXOHmQUUxCuBF2vTs+9JLn26T7DzcxLDdHYjXTON78lObH34D7fhyspB51J
	aDqUwF69SCi2mdC1a8HhE0dZteoH7mQWyYsMEsF1CxzKaDQ/iMDZg1B2i09x7c25
	P+chjJcvqwJzSrC0zYOC+EHPOGF7dewFtH0qH3qsmuT45JaE0Kz2KkA0oV/+UNG5
	XsZh+bKSG13SZptKjwZFTHsEetQ7xXCiwqtvS9e2RpqU9URmgDfEWnjEtg0R/fcW
	H30+KL6FOh4LTakhseuiNML+frmdKt2hrslmXfSzVFl5PBGsY7EEmkGkW7tUIAWF
	0JpeqmcsU4Ovxi1S2HZ3+EONHcp5BrYqyQsm6uQL26g7qQuHOGT7ykhHF3LjNF+I
	CxlNrU1rDUuWVtoweC4ncaDnjmXgZgQbaRi87LFcyJqU9jP/mI5Yj/fiA+syMoKu
	1G8m5U0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	"Varshini Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH for-6.14 v3 4/4] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Fri, 7 Feb 2025 13:47:59 +0100
Message-ID: <20250207124802.165408-5-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207124802.165408-1-csokas.bence@prolan.hu>
References: <20250207124802.165408-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738932488;VERSION=7984;MC=3743399358;ID=414258;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852617560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_044810_947514_916C05CB 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
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



