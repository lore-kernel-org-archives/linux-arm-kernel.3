Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D6CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 03:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p4d3CtqHUPjK4TCiWScT6tHr43tsZcB7KMP7S55pcsA=; b=MfCgLL8FV04/azyZSc9h1RlGu/
	ZhLXzulm0/aW7fwp7DQ89vCWFgZwTX/4402m2nrNoP0lqLOC4iZbtyq30Hghuh3ChlWU+5WrJ+IfI
	6PIaya1WNV6G3X6/WXfp1LZ7jlu0Xe3edll712AQb4mJZrg5yCSQr7pPqZk+sS4WIKWMMhDlnO39t
	5nerrWvKQv5yHYSg6k2aULcuxi0GYEbPIHPBiVMDh5eQtvqSzBN81KKikVsNvu1yJ1QDvSNsm2jFc
	2cFVBEe9os1/W7i9r4HzMZReIxcIGuPkDBIPzteaCeGD3hXLTGFv7iF1QN0ODpHNcPSlqAX4Ij4DX
	gcP5mQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpWl-0000000EQOR-3qVV;
	Wed, 14 Oct 2026 03:19:39 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpWi-0000000EQNt-48mS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 03:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=p4
	d3CtqHUPjK4TCiWScT6tHr43tsZcB7KMP7S55pcsA=; b=DT7b9zEFewTz8piT9M
	GxINXx+xRQ2Dc1qFRERcIKXg+sIzhwcjLHpIzyqBxkEU5bX8D0b19rfHKh4m77c8
	77nWPrZ+b9yQPCM/gP+fyinZDY9ytCnumhsxI5c+YqtbmJIjnNyW/3qThQn2xSIV
	h4atQUw1VSrjGjXY8CrQu4qKs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3v+q69M5qU34YEg--.64934S2;
	Wed, 14 Oct 2026 11:19:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: patrice.chotard@foss.st.com
Cc: Pengpeng Hou <hppiscas@163.com>,
	thinh.nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert failure
Date: Wed, 14 Oct 2026 11:19:20 +0800
Message-ID: <20261014031920.8390-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3v+q69M5qU34YEg--.64934S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1fWry5KFy8KF4fCr13CFg_yoW7Jr13p3
	y7Gr4ayr1IkFs3t3yxJF15uFyfZFWftayUGa13K348AwsI9rWDJryj9FyrJayjyrWkJry5
	CF4jqFnY9anFvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEl4iUUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hu5gmrO9Ltq7wAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_201937_400866_C29F1DC2 
X-CRM114-Status: GOOD (  16.41  )
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

The ST DWC3 glue ignores reset deassert failures in probe and resume.
It may publish the child device or access the glue registers without both
reset operations having succeeded.

Check both results and unwind DRD setup failures as well. A shared
softreset provider failure must go through undo_softreset: the reset core
has already incremented its deassert count before calling the provider.

Track whether this driver owns the deassert pair so suspend and remove do
not release it again after failed resume has unwound it. This is reference
ownership, not a guarantee about the physical reset-line state. Resume
itself needs no early-return guard: the paired suspend callback clears
the ownership state before resume is entered.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v2:
- remove the redundant resets_active early return in resume, as Thinh queried
- keep failed shared deasserts routed through undo_softreset
- retain the independently needed suspend/remove ownership guards
- rebase on current mainline

Previous version:
https://lore.kernel.org/all/20260922004312.3589-1-hppiscas@163.com/

 drivers/usb/dwc3/dwc3-st.c |   43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 5d513decaacd22de15825dc061c2747cf09fef07..1a2f38f9407ae0aea25edd616f8d77f953b3b404 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -84,6 +84,7 @@
  * @dr_mode:		drd static host/device config
  * @rstc_pwrdn:		rest controller for powerdown signal
  * @rstc_rst:		reset controller for softreset signal
+ * @resets_active:	whether this driver holds its deasserted reset pair
  */
 
 struct st_dwc3 {
@@ -94,6 +95,7 @@ struct st_dwc3 {
 	enum usb_dr_mode dr_mode;
 	struct reset_control *rstc_pwrdn;
 	struct reset_control *rstc_rst;
+	bool resets_active;
 };
 
 static inline u32 st_dwc3_readl(void __iomem *base, u32 offset)
@@ -242,7 +244,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 				     "could not get power controller\n");
 
 	/* Manage PowerDown */
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
 
 	dwc3_data->rstc_rst =
 		devm_reset_control_get_shared(dev, "softreset");
@@ -253,7 +257,10 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	/* Manage SoftReset */
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_softreset;
+	dwc3_data->resets_active = true;
 
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
@@ -305,16 +312,22 @@ static void st_dwc3_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	reset_control_assert(dwc3_data->rstc_pwrdn);
-	reset_control_assert(dwc3_data->rstc_rst);
+	if (dwc3_data->resets_active) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		reset_control_assert(dwc3_data->rstc_rst);
+		dwc3_data->resets_active = false;
+	}
 }
 
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
 
-	reset_control_assert(dwc3_data->rstc_pwrdn);
-	reset_control_assert(dwc3_data->rstc_rst);
+	if (dwc3_data->resets_active) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		reset_control_assert(dwc3_data->rstc_rst);
+		dwc3_data->resets_active = false;
+	}
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -328,19 +341,31 @@ static int st_dwc3_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_softreset;
 
 	ret = st_dwc3_drd_init(dwc3_data);
 	if (ret) {
 		dev_err(dev, "drd initialisation failed\n");
-		return ret;
+		goto undo_softreset;
 	}
 
 	/* ST glue logic init */
 	st_dwc3_init(dwc3_data);
+	dwc3_data->resets_active = true;
 
 	return 0;
+
+undo_softreset:
+	/* A shared deassert holds its reference even if the provider fails. */
+	reset_control_assert(dwc3_data->rstc_rst);
+	reset_control_assert(dwc3_data->rstc_pwrdn);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef


