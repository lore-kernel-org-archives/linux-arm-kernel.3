Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B6BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnqhiVTVPifAUYWtiZycC/ZSPcXsJoWNBQ104HXxAMQ=; b=j46lLla7YbxsQMz5jtNBFYgSF5
	HTwbB6tiVaJ0xOQsDVcbnFvGz3yoVuvTzkxg6PbbLGmfEvfuQyHTEcg/7T+Eu6ZurB4h4082NokzT
	ym/BVhGwDZxfMdVZw0fUlMYEAIalm6Uny1aQgDgCansVfsZShA5FhiFX+nkMNaFb3MZ3UfdUCK9cZ
	1bZFJHyfjhdJ35Ne0UZvB6MERSbzIb8Lp15YIUi15S0lsZRgeCyMvqW5etNERveYSxgwMQ6vm+Dr5
	bVS8lCXJmlX8ImU4JMCGtyLYeeAWHm7yJ9z2GAecWEBd6VTmF9qp34tR/U33A0Vy6wdYjNiriaUpM
	H3Z28gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe76-00000004otC-1dDM;
	Tue, 28 Jul 2026 09:28:40 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woe6q-00000004ol3-1xBO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:28:26 +0000
Received: by chaosmail.tech (Postfix) id 0C6E11CA4B2;
	Tue, 28 Jul 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnqhiVTVPifAUYWtiZycC/ZSPcXsJoWNBQ104HXxAMQ=;
	b=sidVafEGZDy150GlCHevn2Y+jXwdmz2G2ZLbFQbFH+4D/sQ0zrtfsi+thcndLdnAU2iJt0
	qgjsEB0cDMoP75NGHQzBBMNnFnLRCjOZovc6AH5CUVx4nH1zAHDPvaRDsbzsPhZ4EESubP
	GAdhCWcmf4z/kcQj8p3qw7auRM0p9k0=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:11 +0200
Subject: [PATCH v2 5/7] spmi: apple: lock around FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=2563;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=HIGPdSOyNoSvcvIlT48bLiPi1O7LBdmNtnBM38tbtWk=;
 b=RNPNjndqIZhH/rNXJBspeVICwnnLlnxbVOi8lpZU00YvbGLJcsJH41PIhRA8yaXG2GudGQW8U
 ubNmbAsUBVMDqphYzhF3vLq+V5ZeYcTKEYwuFKWHGWixrykH6xK3eun
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_022824_698245_968ABDA2 
X-CRM114-Status: GOOD (  13.85  )
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

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index aed18b7df15c..2cd4ed1803d4 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -35,6 +36,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -73,6 +75,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	mutex_lock(&spmi->fifo_lock);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -86,7 +90,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
-		return ret;
+		goto out;
 
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
@@ -94,7 +98,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
-			return -EIO;
+			ret = -EIO;
+			goto out;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
@@ -107,6 +112,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	mutex_unlock(&spmi->fifo_lock);
+
 	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
 		dev_err(&ctrl->dev, "command not acknowledged\n");
 		return -EIO;
@@ -116,6 +123,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		return -EIO;
 	}
 	return 0;
+
+out:
+	mutex_unlock(&spmi->fifo_lock);
+	return ret;
 }
 
 /* Send a raw command with 1..16 input data frames */
@@ -181,6 +192,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0


