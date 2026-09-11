Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0731CC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/gVuEgQ+O1MlxzayRMNUxUrBsV8eHwDdB0w2KFHMt4=; b=uCn9zxXEyLcShPh0t/dxjC83/w
	kU1NAD/ChR1peLE0wKEsbIjHAH2HLp8ddH9NfX3O3RQfQgn3XzvQKiHbfJt3gXW/57cD4Zk1g3M48
	b/ijF/ZLOpt1KI5RtX7F5zKsSkHwZxtZUDjMeyjS8/GlF6CGcmeSChjgrlQcUAzVSilu9o6dD8eS9
	N5eXanTYSIRPulcQ4OLj1pwV6QuO2ouHFZBsS6hD9ZDf+rXHiJMGPwQVG+yW0NLJO7D/qirZVguwH
	/QCBtSI7/2PZo5746QENlWrpJW2a/pU03K5APJ78+O5IF3WOPAJoeNU1xvd/im6NKzrq/YuuRajji
	yL5J8zwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWx-0000000FvIs-3Wgy;
	Fri, 11 Sep 2026 06:14:35 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uWv-0000000FvGQ-0C88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:14:34 +0000
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fc2;
	Fri, 11 Sep 2026 14:09:30 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: ulfh@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] pmdomain: imx: reject a missing bus power domain
Date: Fri, 11 Sep 2026 14:09:29 +0800
Message-Id: <20260911060929.94481-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15dceb03a1kunm8126a0a81c7377
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS01NVhlDSUpPGRpISk4eTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=j930sFoJBSDlrQKg5hhUbpgFngB5t6l/UFcdtdQtZ4DttF9DdBRdN8GcPFX+xlwHvGz1gEmpkkJAIVosHU3dDF6yE+mY7Zj+eUoVmCjseS7mtUufsXJki71slHoqavXBfrGQOQSQKymp91UflSBQJBmoe61S81PhhHamLtKGd18=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Q/gVuEgQ+O1MlxzayRMNUxUrBsV8eHwDdB0w2KFHMt4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_231433_301647_C6AA4668 
X-CRM114-Status: UNSURE (   7.69  )
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

The named-domain attach API may return NULL for an absent name.
Treat that as -ENODEV before publishing bus_power_dev to later unwind
paths, without changing the handling of existing error pointers.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 2 ++
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 479789009c7f..9653a8ac9a6e 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -228,6 +228,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	bc->bus_power_dev = dev_pm_domain_attach_by_name(dev, "bus");
+	if (!bc->bus_power_dev)
+		return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");
 	if (IS_ERR(bc->bus_power_dev)) {
 		if (PTR_ERR(bc->bus_power_dev) == -ENODEV)
 			return dev_err_probe(dev, -EPROBE_DEFER,
diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index d255c20f58e2..e952b4ee75c0 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -655,6 +655,8 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	bc->bus_power_dev = dev_pm_domain_attach_by_name(dev, "bus");
+	if (!bc->bus_power_dev)
+		return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");
 	if (IS_ERR(bc->bus_power_dev))
 		return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
 				     "failed to attach bus power domain\n");

