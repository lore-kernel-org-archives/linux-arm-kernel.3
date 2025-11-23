Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1475CFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pU01KkEaYjAA3jqyJ2FxF6eWXDcwvevlb5/EW4UE2Ho=; b=y21MGSr54r9RFe+wVBzImiTIuu
	f1okpdRceytqpgU8AaqWcyuV7wI/25vVVA3qpZ70ehRZs5ZYszUdBp6NhfVclB6lCH+WcbpNcOh/j
	0ysOJL0Ij9xG5/zFfE9p4CgoqFaVpSPqQBNGEi90Fm8sKvj+q/WInCNfpZaMtEG4tR98oAyGtFCuN
	U00fTHMR9tgN9/oHdyhEDwoNRfTzc1OFhzqbe2VFmg2mcGdiFxBJNAGCEUsQBcnWRA96lAPfoCT1W
	esNJuBhDR2WyCSmLb2AZx9xvRAGXXLCruvTTl9PQ2GVC6FCx0JYl1wu/LO9UAIU2UX8Rd/TMLkoQ6
	ThTRZb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNCTC-0000000AWoi-05z6;
	Sun, 23 Nov 2025 15:57:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNCT9-0000000AWoF-49gr;
	Sun, 23 Nov 2025 15:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39EDF43662;
	Sun, 23 Nov 2025 15:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC57C113D0;
	Sun, 23 Nov 2025 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763913463;
	bh=DA4mYMYeSzQXc7AajabPfNH5s8hK81KCWelaMzYP5fw=;
	h=From:Date:Subject:To:Cc:From;
	b=EqBCl/u+P5d8cz0pXXAJc7NGZqTD2yIZ5ZYEbhlqI7xEiJaVHDWFkVvSKtO9nB6wJ
	 dvmnOjYxrZxxty3wXEqNsh8L3QC/NDxeLJhJj+O8NMC6hkz3CXDNQnvYt0SLEW8ywj
	 hMq8OAsP+bY1Iot5+k7sFqN3GthRVy1Ry5cxqKOo2HKgDf3IPYGukqt79gYNzlQBKJ
	 UGz9v2pBAUQ4jDSI+wqagzkX4TbYTolhxSbK2G4f3h4jzcLs8Kg8/8clcER37FLeia
	 M8nLe1DeK3OGYOMlPrY5wVVQiCc9fpaVNw5YICp7mXviGcpZZXCVeS0Q9ROwhSIaIu
	 ujx/Nv4o6O+4g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 23 Nov 2025 16:57:19 +0100
Subject: [PATCH mt76] wifi: mt76: npu: Rely on rcu_dereference_protected()
 in mt76_npu_setup_tc_block_cb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-fix-airoha_ppe_dev-sparse-warning-v1-1-1972143d259d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5G+hGukK/UoqkblZzWZcEtCD+v
 YvHOczMCS6m4vDqTjDZ1XUrDULfwbxyWQQ1NQZ60DMEGjDrD1ltW3mqVaYkO3plc8GDrWhZMMY
 5Uk7fMY8ErVNNmnQ/3p/r+gMa8GwNcwAAAA==
X-Change-ID: 20251123-fix-airoha_ppe_dev-sparse-warning-66c62fdb7f72
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_075744_077720_2E56E018 
X-CRM114-Status: GOOD (  10.59  )
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

Fix the following sparse warning in mt76_npu_setup_tc_block_cb routine
running rcu_dereference_protected() to get ppe_dev pointer.

drivers/net/wireless/mediatek/mt76/npu.c:314:63: warning: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/mediatek/mt76/npu.c:314:63:    expected struct airoha_ppe_dev *dev
drivers/net/wireless/mediatek/mt76/npu.c:314:63:    got struct airoha_ppe_dev [noderef] __rcu *ppe_dev

Fixes: 62f1347fa5bf6 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index df5cecd05f50366397a25f14092702513049c5d6..ec36975f6dc946f5dbc5ab6029b0574fbc602615 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -304,15 +304,22 @@ static int mt76_npu_setup_tc_block_cb(enum tc_setup_type type,
 				      void *type_data, void *cb_priv)
 {
 	struct mt76_phy *phy = cb_priv;
+	struct mt76_dev *dev = phy->dev;
+	struct airoha_ppe_dev *ppe_dev;
+	int err = -EOPNOTSUPP;
 
 	if (type != TC_SETUP_CLSFLOWER)
 		return -EOPNOTSUPP;
 
-	if (!mt76_ppe_device_active(phy->dev))
-		return -EOPNOTSUPP;
+	mutex_lock(&dev->mutex);
+
+	ppe_dev = rcu_dereference_protected(dev->mmio.ppe_dev, &dev->mutex);
+	if (ppe_dev)
+		err = airoha_ppe_dev_setup_tc_block_cb(ppe_dev, type_data);
+
+	mutex_unlock(&dev->mutex);
 
-	return airoha_ppe_dev_setup_tc_block_cb(phy->dev->mmio.ppe_dev,
-						type_data);
+	return err;
 }
 
 static int mt76_npu_setup_tc_block(struct mt76_phy *phy,

---
base-commit: e1ed98b1836e2bf0aba98f9790be4f3c6bca9d0d
change-id: 20251123-fix-airoha_ppe_dev-sparse-warning-66c62fdb7f72

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


