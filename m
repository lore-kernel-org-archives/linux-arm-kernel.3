Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8A2C982F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJHrdFB3EQ9vHPNVVakzNrW80ywJMLbi9Gy+1x/NUe4=; b=OS2HdULSsds4NiWNZ28ipLI0FM
	R/zItmoWrJTkh10RP59RlZzJ8Hdr8wNEcWXk9Qqx3KQuNJb27zp1V4cbV4OZ98UCczQgyPB+yLQWr
	R9Qespb59FeHoB8sW4UrBOmTxWu+F3mAkeb1j7Yr8fcLodDKVx5mEPQOMOBzgCRSSWxDIkmkL57fu
	4XSYj6Vg1gWiaAVU2tG6HtdpUDWAgUYP577gKAN44INutN5/zllGuO8k9f9nqAh9aKOjUMpwc+N+m
	iJi6yDVUhp2L/8QgY+RWenVu/5Rrz7IcH8X1bhXMAJAlimEnxla/xkWuZ1uodplL+YDPabFDHrTed
	YL9qb7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8obh-00000003nqV-1Xhj;
	Tue, 22 Sep 2026 00:43:37 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8obd-00000003npa-1USX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bJ
	HrdFB3EQ9vHPNVVakzNrW80ywJMLbi9Gy+1x/NUe4=; b=UxS1jwmi1+GwsBEalc
	5XwKDBrWt4GunP/ZvcpvITeCMjcln+YVVUUfuxjVhbSPplDO8R4IwJjNofClcatE
	KUptPOCDWi0pAlIu+B1XiyGqMs4ubyg+HOEcKl5rZxUN12O1/2+f42xPUb3XG06O
	vjuot8P6s6aD5bdSGpPGUg//A=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnzaoiz7Fqm+rUAg--.25557S2;
	Tue, 22 Sep 2026 08:43:15 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: patrice.chotard@foss.st.com
Cc: thinh.nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	hppiscas@163.com
Subject: [PATCH v2] usb: dwc3: st: balance reset ownership on deassert failure
Date: Tue, 22 Sep 2026 08:43:12 +0800
Message-ID: <20260922004312.3589-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDnzaoiz7Fqm+rUAg--.25557S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4DGw45Xw1DuF1UGr13XFb_yoW7Gr4Dp3
	y7Gr4ayryIkFs3tayxJF15uFWfZFWftayUKa13K348AwsIqrWDJryj9FyrJayjyrWkJry5
	CF4UXF9Y9FsFvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U29aQUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QMDy2qxzyOH7gAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174333_742479_93D319AD 
X-CRM114-Status: GOOD (  18.70  )
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
Probe may publish the child device, and resume may access glue registers,
without both reset operations having succeeded.

Check both results. Balance a failed shared softreset deassert through
undo_softreset, since the reset core increments its shared count before
calling the provider and does not drop it on a provider error.

Record whether this driver holds the completed deassert pair. A failed
resume unwinds the pair and leaves that state clear. A later suspend or
remove must not assert the shared reset a second time, and a subsequent
resume can acquire the pair again. Unwind the resets on DRD setup errors
as well. Exclusive powerdown and shared softreset remain distinct reset
controls.

The issue was found by our static-analysis tool.

Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- use undo_softreset for a failed shared deassert, as Thinh requested
- guard later suspend/remove against a pair already unwound during resume
- unwind DRD setup failure and preserve the original failure code
- omit the earlier Reviewed-by because the lifecycle handling changed

Previous version:
https://lore.kernel.org/all/20260624055728.46078-1-pengpeng@iscas.ac.cn/

 drivers/usb/dwc3/dwc3-st.c | 46 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 5d513decaacd..f954234d2b83 100644
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
 
@@ -326,21 +339,36 @@ static int st_dwc3_resume(struct device *dev)
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
 	int ret;
 
+	if (dwc3_data->resets_active)
+		return 0;
+
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

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.50.1 (Apple Git-155)


