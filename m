Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7627CE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKAKOw5AHSSA271RHj0PbuCadekf/r4yr8s/+3x6ls4=; b=ICzw2/t3J547PzKfiYoUQaieEd
	yWMml7R1c33WAmsMMK1yc4fnIJZIvdwZ67+qqjzgvC8xFVbpY+exklAKr49f+rSx3Q0FFwZqkSCfZ
	AggoOHCNBQYEGbuumHXdAp8UWv0aFBo0V0n+fkGIylBXQEhwOukA016go+4JlIvflW8Mf+HdwlAGH
	bKJ6wepEpqDnvl7UAHuWG/jvTsH2tHYZ8w45bQeCkw+nGV48fcH6AenuUS/jpfACsaddfJhfKHK6a
	OcQiGtdDlLm7TocskvZvIadP5ZbhEo76i/AEsUD+kPOMk8YQM8xbjF8O/pfs6Hlswys11n1jMXnML
	f8zqQiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXK7D-00000005B6f-2Dik;
	Mon, 13 Jan 2025 13:04:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXK5y-00000005AyZ-0p0t;
	Mon, 13 Jan 2025 13:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4F19A40CF8;
	Mon, 13 Jan 2025 13:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88652C4CEDD;
	Mon, 13 Jan 2025 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773384;
	bh=gxKUzAtTDd8hl6jQZuFLEfBmWufxBWklf6Zp182WRmM=;
	h=From:Date:Subject:To:Cc:From;
	b=Z8VuwfbcDocbz003Zb1iXhy9oxNyb6kXolp3Vr5DUg1LJtHri7cNClnTwkwewtEpf
	 dK/Pla2NlR8CkH7QDIPbsddNkqTE2sit3tARjh6Jj+YAoe3/9OB0KKElR1gBY4WB8k
	 Osli3oFGAsnuGj3JdTw4wGZx+M0py6RHvmyoSXckV2UzXiJrNZyfESKkD2AVgkqGhj
	 U9eAegX2NUzwxbjxywVbUOGGUPNHYu7MartHg7cJ74ljUCUtGU9l+ad36tLH2Wjqmv
	 GEHcVHKl/bxO6l3f9iheWNtozZkPkWow4Rv1REAIOYi7rUKQHwoFlmg2Nj7D1oyj5i
	 YwwYjz54hik9g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 13 Jan 2025 14:02:58 +0100
Subject: [PATCH v2] spmi: Fix controller->node != parent->node breakage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAEPhWcC/42NTQ6CMBCFr0JmbQlTIgZX3oMQUsogE4XWDhIN4
 e4WTuDmJd/L+1lBKDAJXJMVAi0s7KYI+pSAHcx0J8VdZNCZPmeIqGbn2SrxIzeT66hpA5mHibm
 +uORam9IitRDrPlDPn2O6qiMPLLML3+Npwd39Y3RBhSrviz1lsMPy5kTS19s8rRvHNArU27b9A
 A3431rHAAAA
X-Change-ID: 20250111-topic-spmi_node_breakage-f67322a9c1eb
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736773380; l=6539;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DqX1WVd2JuumRTJdsiTYoseI5AlgMkGptxuwXEqoFHE=;
 b=TG7O555KEHCny2KxcOoz0npZyLvP2Zsq0HcIr+1elTK9JgF0RIjAUWSOOCQYa7Osc8HZ7bNWc
 VLreZVn+EqpBxSdE+efGfw+MoRB/nNWiEZ+r5yx3CvTHcZL4tRXBA8L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_050306_367392_9FD5C799 
X-CRM114-Status: GOOD (  15.16  )
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On some platforms, like recent Qualcomm SoCs with multi-bus SPMI
arbiters, controller->node must be assigned to the individual buses'
subnodes, as the slave devices are children of these, like so:

arbiter@c400000
	spmi@c42d000
		pmic@0

	spmi@c432000
		pmic@0

The commit referenced in Fixes changed that assignment, such that
spmi_controller_alloc() always assumes the PMICs come directly under
the arbiter node (which is true when there's only a single bus per
controller).

Make controller->node specifiable to both benefit from Joe's refcount
improvements and un-break the aforementioned platforms.

Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node reference in device initialization and cleanup")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Fix compile errors
- Link to v1: https://lore.kernel.org/r/20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19@oss.qualcomm.com
---
 drivers/spmi/hisi-spmi-controller.c | 4 +++-
 drivers/spmi/spmi-devres.c          | 6 ++++--
 drivers/spmi/spmi-mtk-pmif.c        | 4 +++-
 drivers/spmi/spmi-pmic-arb.c        | 2 +-
 drivers/spmi/spmi.c                 | 4 +++-
 include/linux/spmi.h                | 5 ++++-
 6 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index dd21c5d1ca8301d508b85dfaf61ddfabed17aca9..030b4f86af6329d1c5694ec6440aceaa60f563ad 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -267,7 +267,9 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	struct resource *iores;
 	int ret;
 
-	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
+	ctrl = devm_spmi_controller_alloc(&pdev->dev,
+					  pdev->dev.of_node,
+					  sizeof(*spmi_controller));
 	if (IS_ERR(ctrl)) {
 		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
 		return PTR_ERR(ctrl);
diff --git a/drivers/spmi/spmi-devres.c b/drivers/spmi/spmi-devres.c
index 62c4b3f24d0656eea9b6da489b7716b9965bedbe..e84af711714d1892a5781111dc538747f5a5e835 100644
--- a/drivers/spmi/spmi-devres.c
+++ b/drivers/spmi/spmi-devres.c
@@ -11,7 +11,9 @@ static void devm_spmi_controller_release(struct device *parent, void *res)
 	spmi_controller_put(*(struct spmi_controller **)res);
 }
 
-struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t size)
+struct spmi_controller *devm_spmi_controller_alloc(struct device *parent,
+						   struct device_node *node,
+						   size_t size)
 {
 	struct spmi_controller **ptr, *ctrl;
 
@@ -19,7 +21,7 @@ struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	ctrl = spmi_controller_alloc(parent, size);
+	ctrl = spmi_controller_alloc(parent, node, size);
 	if (IS_ERR(ctrl)) {
 		devres_free(ptr);
 		return ctrl;
diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 160d36f7d238e7eb4122091a53b779c18e9d91a4..8cff60f68f98a9d59d8f4423d746018135514e41 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -453,7 +453,9 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	int err, i;
 	u32 chan_offset;
 
-	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*arb));
+	ctrl = devm_spmi_controller_alloc(&pdev->dev,
+					  pdev->dev.of_node,
+					  sizeof(*arb));
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 73f2f19737f8cec266a051a956ce2123661a714e..226f51d94a70328c6322664d2d05a8b64645674a 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1674,7 +1674,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 	int index, ret;
 	int irq;
 
-	ctrl = devm_spmi_controller_alloc(dev, sizeof(*bus));
+	ctrl = devm_spmi_controller_alloc(dev, node, sizeof(*bus));
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 166beb2083a3f801435d8ffd843310582911e3ab..c1a03da55a265c9294f6a16bc285310cebd00726 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -435,6 +435,7 @@ EXPORT_SYMBOL_GPL(spmi_device_alloc);
 /**
  * spmi_controller_alloc() - Allocate a new SPMI controller
  * @parent:	parent device
+ * @node:	device node to associate with the controller (usually parent->of_node)
  * @size:	size of private data
  *
  * Caller is responsible for either calling spmi_controller_add() to add the
@@ -443,6 +444,7 @@ EXPORT_SYMBOL_GPL(spmi_device_alloc);
  * spmi_controller_get_drvdata()
  */
 struct spmi_controller *spmi_controller_alloc(struct device *parent,
+					      struct device_node *node,
 					      size_t size)
 {
 	struct spmi_controller *ctrl;
@@ -459,7 +461,7 @@ struct spmi_controller *spmi_controller_alloc(struct device *parent,
 	ctrl->dev.type = &spmi_ctrl_type;
 	ctrl->dev.bus = &spmi_bus_type;
 	ctrl->dev.parent = parent;
-	device_set_node(&ctrl->dev, of_fwnode_handle(of_node_get(parent->of_node)));
+	device_set_node(&ctrl->dev, of_fwnode_handle(of_node_get(node)));
 	spmi_controller_set_drvdata(ctrl, &ctrl[1]);
 
 	id = ida_alloc(&ctrl_ida, GFP_KERNEL);
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 28e8c8bd39441fa6451be3364006fb3b47a47dc9..9de74000911456800237a3244d5e8158fadf8317 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -105,6 +105,7 @@ static inline void spmi_controller_set_drvdata(struct spmi_controller *ctrl,
 }
 
 struct spmi_controller *spmi_controller_alloc(struct device *parent,
+					      struct device_node *node,
 					      size_t size);
 
 /**
@@ -120,7 +121,9 @@ static inline void spmi_controller_put(struct spmi_controller *ctrl)
 int spmi_controller_add(struct spmi_controller *ctrl);
 void spmi_controller_remove(struct spmi_controller *ctrl);
 
-struct spmi_controller *devm_spmi_controller_alloc(struct device *parent, size_t size);
+struct spmi_controller *devm_spmi_controller_alloc(struct device *parent,
+						   struct device_node *node,
+						   size_t size);
 int devm_spmi_controller_add(struct device *parent, struct spmi_controller *ctrl);
 
 /**

---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20250111-topic-spmi_node_breakage-f67322a9c1eb

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


