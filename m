Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BF3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irkOxPEAYOTR+5YwZO+w9qlMMVucv2iMchYWL1WEcAY=; b=J9FiVTdkhMXL6lLVwsq5hS23Dc
	O/07YCph/pdjTubI2VHgosCoxdmsxQv+KFpX2m848cmF8l4KMt0C0rogLWFb+fwB71+0p4shyzp7H
	Sz9aGhixw0Kkh8A/eGSDt5ECHUbkbi0pwc02A86s7zlM5XzenpVumhq1EbcABmP5+gO9TFxNXfc5o
	9IkP8GUhRdJfVjHU5zcAfB85n1jIqjyAno3+oo5uyi65bjgBNAvOHOlNXMPKGY9+pSUoQs/PGi4kA
	/iQPfVF54Xbq//uNJ2Yxm57JWMc+R9M0OSNNv4MTxDzLFQl5OQUH2iyO755RSm3zEikEjn/dl7Odd
	HaIDmKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMP-00000004rO1-2bLP;
	Tue, 28 Jul 2026 09:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMO-00000004rMr-2BGh;
	Tue, 28 Jul 2026 09:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9C9243F13;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9D93C2BCC6;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785231867;
	bh=erZkFTXMOMihPG3tf2Kjcg3MRSbkrk4OZSGbmy7Rtk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GK4sZQWwd6EKlsXaL2KUJVaWL0WXwXyisJn7I+B3cRt5Y3tyuUFvjgaP++A6fxp86
	 KxA8UtbjYVvyP1l5C3iCfSsrs0RWDVEqVFuT9khMC32iYLoQAvJrUj1+5FRzIni6XY
	 7MupKd+Ac7CJaL6girxeENPQLMt3UKMSqIyYaaqy2KPvifDQUH1ckQ31luBk4zVC7F
	 ATy59phXUaiK+ZSQRB20h77sYcrT4dryVrVP2W4BL0xy0X/C9BvZdR0l9W+6rEKel7
	 HI74XZdSHXeCRe3Tlm4oWKR4yj46eYMV3X3MmsEshqW/lmbjIg/KkRA7lHPNkv3ht8
	 4LWtWZ7pDylEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940FEC54F54;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 28 Jul 2026 12:42:48 +0300
Subject: [PATCH 3/3] mailbox: mtk-cmdq: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-6572-gce-v1-3-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
In-Reply-To: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785231864; l=1755;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=wlNt8w4pK42NOY4pipdycMZ5TzX4r9IY7xlPIXoIXu4=;
 b=em8m3keAx8V+DEbFxfHYM9caC9+m2KxyazIAl9NkghlYodMVJLxPtOwvaJrzxthYwgXX8ILn6
 O2oPz0eD9uwAJe10xMRTPsdOBs/VuAToBRcn98foH/+ksODxndUn4dX
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add legacy_isa field forwarding to the cmdq helper and a platform data
for the mt6572 GCE.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index e523c84b4808..5e7bc52baaa1 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -99,6 +99,7 @@ struct gce_plat {
 	bool control_by_sw;
 	bool sw_ddr_en;
 	bool gce_vm;
+	bool legacy_isa;
 	u32 gce_num;
 };
 
@@ -119,6 +120,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
 
 	priv->shift_pa = cmdq->pdata->shift;
+	priv->legacy_isa = cmdq->pdata->legacy_isa;
 	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
@@ -787,6 +789,14 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 			   cmdq_runtime_resume, NULL)
 };
 
+static const struct gce_plat gce_plat_mt6572 = {
+	.thread_nr = 14,
+	.shift = 0,
+	.control_by_sw = false,
+	.legacy_isa = true,
+	.gce_num = 1
+};
+
 static const struct gce_plat gce_plat_mt6779 = {
 	.thread_nr = 24,
 	.shift = 3,
@@ -848,6 +858,7 @@ static const struct gce_plat gce_plat_mt8196 = {
 };
 
 static const struct of_device_id cmdq_of_ids[] = {
+	{.compatible = "mediatek,mt6572-gce", .data = (void *)&gce_plat_mt6572},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_mt8183},

-- 
2.54.0



