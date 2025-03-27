Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFE8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntL/r97AdlpWnW+HECsFa4zjnJTd1uAw3/3VEUgoZkU=; b=C+l4ep7rhmHmXzyOLjfzH2sQ9v
	VKybFbmQCZwUMRAkS/q7akGKwFVTtU2F/J7Tz2At9g/s1rK2KroN/ooutkGkJyvOSajkmI3N96faF
	F8ubgzdkMs28wdGjiA37J7QSMRbvQR4HCzzkRJAqQcbBequw63ivC5fCIGWHmWcunRgempNvUsrB8
	wayAzX1r4f0z+B3nFlRrJmRU3hrTt2lPMGBtVfTasu7ypUDI1d9zhFnDkpSFxLt0iu4kldo7cDW1g
	9dre4aRHb5szosMAIMYRkI+yoSBGAr9BR3x8ZdmK89DNKZnO6NWxnmWu+BQHnEIpbEUyORG1kCu6G
	hcua/sIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtkH-0000000BxGp-3z1t;
	Thu, 27 Mar 2025 20:22:33 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtOG-0000000Bub4-2pMX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:59:50 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 15B8EA07C8;
	Thu, 27 Mar 2025 20:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ntL/r97AdlpWnW+HECsF
	a4zjnJTd1uAw3/3VEUgoZkU=; b=lplCpauWoEdxdgEUgrZgRfCLiG3oZbsXyuzX
	rW8iUImqNjJUM3ZlwmOkB05ge+6ElpbGLTLD3bRI7xOVAvzctSNuQycbGdqy0u/Z
	ui6ltSXmpjl9R1o+pafc8bFcvCTTtiEG4UQEMH7HYpok5z8nNn+jS8gTTjsat5TN
	MLTcr1sHoh2jBL1HgPxfAhBEwwKxs1J3xGyOV2pasa2Ph33lt52iVRljGXq5Osuh
	W24+UAyb0vQcWUZ7EOQGz9g2r2pwbzJGKO5dFHJcgKJ/Ypz+Ah61ejtxQZxq7YUr
	tsC7z/L28oelzo/Iu35HdmEZje39GBmS0jGNOxClynvqs9u11M7Znel1gdvH9oPB
	f/Wne1sx25yUQroUp7X9OSYiVZYj12iGIpaf98l3Qw+ZRPufQL8zD47NY8nYvAu3
	Mg6XhZeYL3Bd93HA3VFTqxlcAmKpO4VQGqwPHcYm9n4UDghq1xWB5aqLLbYH+s/c
	8GnzBBMQTvrAobd+zQvl7wgS+wktiBn8mK8u0qGCmpFMY7ocGf6peC1qvlbZ0ro5
	pVzg0XjnIbfoBR68PAQz2H84Bv3cVxN1ekeySRAVGMRgpkElD2uijd0Qa+KvJSIr
	ZjCt5XLJzVI9h4LXWUqv1e0qATvNS7oQCekKDyubfGXmjrxFGUrqI1FNKsUEhTR6
	7JOBnmQ=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v6 2/2] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Thu, 27 Mar 2025 20:59:27 +0100
Message-ID: <20250327195928.680771-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327195928.680771-2-csokas.bence@prolan.hu>
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1743105585;VERSION=7987;MC=2725881566;ID=112016;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526C776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_125949_174385_F0963641 
X-CRM114-Status: GOOD (  10.54  )
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

Fix unbalanced PM in error path of `atmel_qspi_probe()`
by using `devm_pm_runtime_*()` functions.

Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250110-paycheck-irregular-bcddab1276c7@thorsis.com/
Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 244ac0106862..e7b61dc4ce67 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1436,22 +1436,17 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	devm_pm_runtime_set_active_enabled(&pdev->dev);
+	devm_pm_runtime_get_noresume(&pdev->dev);
 
 	err = atmel_qspi_init(aq);
 	if (err)
 		goto dma_release;
 
 	err = spi_register_controller(ctrl);
-	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (err)
 		goto dma_release;
-	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -1530,10 +1525,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
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
2.49.0



