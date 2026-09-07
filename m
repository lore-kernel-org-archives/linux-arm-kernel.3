Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03EFC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AavV2xpSii0uagfZMifEjEwibqVhWCTVz+2LBoLo7EI=; b=uwampkV5nk6h8rKTSk2uLVieHZ
	GpwXttK+Q0hMC4OvKzDq2J53/mdi9LbrlOmEqtetzfudi8zlH4orPJoUa0eqv/O/IN3oV4FpCUTyk
	Xm6JYg+6i+l5tGker4G42sx6XzMii6LWA5aVOZaMYAJUiEmPPbYRbAXnlSHp23ryQeXwYgW5izhy/
	zOgwoc2xMsh9BofghAwpzW9opKg3mnwqY80zpxz7MFUS22j+2aFzLhODjZWpwNa7QXK5nrlkP+FfV
	s6YwZh2HJQl3u2Vixw3WsuG4CaVgpOx2CHZ7tHUrqWCDWKbKKYB+WP9nG0xbza3ZiZENaSQu7JB7R
	zAjqqFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3diS-00000007Xjt-1Wtf;
	Mon, 07 Sep 2026 18:05:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3diO-00000007XhN-0mXc;
	Mon, 07 Sep 2026 18:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF64243ECA;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E81C2BD00;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804307;
	bh=GRj0pdNNSzpsrMELW8XgF2CHX2bEwzjKTOMhYPlvtL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DbVIJVYxR483sw1OgNW3/m3Afl+bmDlWTC+9s4thm2NHJCnl8UPEluefE5fyObYhc
	 G838yMIOt9g7LegOC2xJEG1OnE0ON7yMJuXoMDUI9JTwMXcSUFVR4+CYmRHdhc6gvx
	 o0645r7Vqu2sts6+dyaxonYSVOB+mbdJh0rl25iux/+MWrNEObspns0w2vHaZRiz0g
	 HIE+tDs7kYWXui62ceHwONAbwNKu+oA8a2eFW2hJSB0+3fkLav2QVcNJMhLD6N7yg9
	 G5JWaZWKcc4mixqYND0T1c6eMzUQHLSJYvCkPS7o0CLwwljRX6N79mULFcaqVsGItq
	 IgImiz1zHjzZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C1BC79FAA;
	Mon,  7 Sep 2026 18:05:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 07 Sep 2026 21:03:07 +0300
Subject: [PATCH v2 3/3] mailbox: mtk-cmdq: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-6572-gce-v2-3-412a5b037290@protonmail.com>
References: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
In-Reply-To: <20260907-6572-gce-v2-0-412a5b037290@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804305; l=1755;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=MP44FydKmOzCKLnDrKX8Goxp+gVfwj/6kJhGpboIwQY=;
 b=AFArNDjBCHtPbXmI8WLL+9005tldLqFATBpTrGGwjgF1zedsNeADjzyeHTvLdWYspGaWlW8zv
 c0WTFDjYzXQDTjvHNlVu/U2iKDUSySCaB0Hy5+OrCWnNsT7mWIYs7Gl
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
2.55.0



