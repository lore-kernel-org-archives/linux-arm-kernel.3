Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F24D11700
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVi6ec1oDgxbgkdm3GfyCju7h5CMxsePWQ18XwBCj2M=; b=NkB4CCYCtQVXHRnpQOipW3adan
	eEf3jPMdW1snN5fdYwG45ZwKl+qzfZzZrjD+eSMcmnUA+1wuMD4vrckjWZKZELkaBCaKHuclL/fsc
	3QWEqj/c6ngqkoyYWnQD4YSPhF/vDT2dz4ZNPp+0YykZP+lcg8wVMRTcLwtc8uIDloamdW5MKYLfz
	4i1XaufkYgni6yhEH4jNEV8GQv3s7RweDJXaO28YcgCEePaYzI620S9eM7jEaGhYHjq/3mGdFd2ED
	1LDIpuu9XIqFEDDzEwjksGZSTyfs+gCck98RQa8aatJ1+AtVkOe1s5Dz/YkNtnOqVeF9UuVTvl0Hc
	EpM96kjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQKC-00000005QZx-1y96;
	Tue, 02 Dec 2025 13:21:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQK7-00000005QXf-45WC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:21:46 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQQJu-0003pJ-No; Tue, 02 Dec 2025 14:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 02 Dec 2025 14:21:02 +0100
Subject: [PATCH v2 1/3] pmdomain: imx93-blk-ctrl: cleanup error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-v6-18-topic-imx93-blkctrl-v2-1-e73501034adc@pengutronix.de>
References: <20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de>
In-Reply-To: <20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_052144_049354_77DD3C57 
X-CRM114-Status: GOOD (  11.82  )
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

Call dev_err_probe() directly during return to make the code more
compact.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index e094fe5a42bf646c712f3eca4e66a313fa5a914c..2aa163aef8de4ee901b9cde76ce2aad246c8c08a 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -240,10 +240,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 	bc->num_clks = bc_data->num_clks;
 
 	ret = devm_clk_bulk_get(dev, bc->num_clks, bc->clks);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to get bus clock\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get bus clock\n");
 
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx93_blk_ctrl_domain_data *data = &bc_data->domains[i];

-- 
2.47.3


