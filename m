Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D0C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55jBginyPAWykGAECg1kcDGv2/bNXqJ6rxbJ7xeJwNc=; b=XmK+W7smzPm2tYjBZ2eXj+izBm
	ZwjuHWoj147GVpvZAN0dKzPRttobzrg87RjLjkhDfV2nNfK0Mbd00RtAenaFwZTl/jHN+2qtox1jY
	F4ZE+aAl7vUO4d7jhlKrb9fbMP1ShS2ucse2i4K0OvsJsbH51CLtyZd57mfLiB2iNsFKqWuLnB+IR
	FTYnLqUUAR0gAdRcyok7sEz7JtbViqVovZ79kc1XRTFbSmiYnFlMuQtjirs2Gaz3PaEbQcDJiVgHA
	68qqogcSPciFtkhmehWzdpESn+aAfTTA+9LL44rbOfZiIVuweUUkyIotCy0vbcaU7nX+atqzcxm5W
	sLd3l5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fPk-00000002UO0-0Xv0;
	Mon, 21 Sep 2026 14:54:40 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fPd-00000002UJq-41nN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:54:36 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc745abb731so616837a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002473; x=1790607273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=55jBginyPAWykGAECg1kcDGv2/bNXqJ6rxbJ7xeJwNc=;
        b=CRXZMCFBdaIs0p8BX7gbxOVGB1ofkzM5oZYsRiFMQNrkScj9rPpa9Gfxmk+fiE95k5
         4UTu0KeYAs3IelDr0v+6KbyVjiq0Z8xlcXJlKDnXZ9qagc5PiAwV3r1OW3OuXriT32Tu
         mW4XQ1s60AbUkcV42xmcRIL5ev9hfdeayWxeINctQz5YvMTttaHeQ3IiI19OpaWb7nP6
         dkms3cYeWvPAZCylOQgIdWXHGQt9XLuz4bjstEaejkdfpQ7PxQ270rpWQgNen+suemQx
         HlYh+6/5Hf4OEZWf7Hccli7gIoIldGqUwn7S+B22M6W7evNOvmPz1IDzku47Bi4b+ZeS
         UuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002473; x=1790607273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55jBginyPAWykGAECg1kcDGv2/bNXqJ6rxbJ7xeJwNc=;
        b=n5LcKMN/H51IfUrAla6brF7QFELcPBJL5W/lHubm7Tn/mWNh8NPyjzAuXytTjKVMPB
         8vm2UgH8zx6TFlW4+OYpTCxP4IOpPl0gsoIb+forZcW82lo4EL0QUUkWTIVvSV9xMihN
         5fU0skARpPQjSWyOLYd2EY2hILY1+tUVuRVd5si6+G6YGUSywoZwzGjwJ424jViZ70y9
         BY6kvSLojsnJG9A8G/4gz5Dn6M5jj+FQM+tZsQp/Iw8zddp1b5wh5zzlv/x1rRkaSw6/
         JXxIvAflsZzN1hoC0dgTuv3BWADfuxeDa2RdtMGsRSXlyFaqr68VI21E7rhEZfioLce2
         OcVA==
X-Forwarded-Encrypted: i=1; AKwUvBx4mrNYdUho0hvsL2Kx6kFTj2rXkeNiVNjdm/5/w+rOvLZeUw7zx4nnQt48pIUMm6z/sWfNZsbLdhpikS7UZTnl@lists.infradead.org
X-Gm-Message-State: AFuF++ke/hfFaBVlnsk2HerIgfZsFXb6eNLOOpC1R2sDtSfqng6fDAN7
	/qy5Jvk0Hc68TxsfRwetYp/aKnUXz+cfA50r709d5mv0o+JQgeYz2FPy
X-Gm-Gg: AYBFou3CuSqx7Q4+WGaARSTzAbmJNdLIi+/VQND6OLbw0XGXTzLO7wRqwEAfGePEU61
	M3+tVmVY3kEYG23Xl4iMwCnb2TUxl+Rd6CRNvJt2+NEyXsH6zPfkWvDdwCvMlweRm1qZT6SisdQ
	D/iAyCGnHVDgyw8tTrGLVFkvrSCgrFfdWzJqSpGxWWa3SVIhVySffHE1Z9hu4MVxoTIhTCUgtay
	pkrQMu3lfelFod6kOknMNskPd0ZCqu21LBC5U/gMRsEBOkpskzlD4X4eAqdVu70iiZlAYfqae30
	iSx0iAXoZG0DfbJ86/t5vToooT4UZiX2cfr0kydovOTB9ZmYnxoItsg3uTDkMP8qLBYX9xCbD3b
	Qa/V5AL+SrNDWjGGUe27ZEPe0p2JHKXhTyvCqtY6EF95QxxZVQkfgQ4DjpF4xMacQYQVg/cvT9J
	LSBvjKxHFTsEd+o9rliwsZ5hIDzCJxMO0XZ3aJ6LtYIifsoIAvHYpl1uMEunTv2KbaIA==
X-Received: by 2002:a05:6a21:e584:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3dd8c41a56dmr13850919637.26.1790002472781;
        Mon, 21 Sep 2026 07:54:32 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec901sm3343453b3a.4.2026.09.21.07.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:54:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] net: mediatek: fix PPE resource leak on remove
Date: Mon, 21 Sep 2026 22:54:21 +0800
Message-ID: <20260921145421.443018-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_075434_042824_FBCC952F 
X-CRM114-Status: GOOD (  20.19  )
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

The PPE teardown is incomplete after both probe failure and normal
driver removal.

mtk_ppe_init() initializes a per-PPE l2_flows rhashtable and creates
debugfs entries, while mtk_eth_offload_init() initializes the shared
eth->flow_table. Flow offload entries allocated by
mtk_flow_offload_replace() can remain in these tables for the lifetime
of the device.

mtk_ppe_deinit() currently only destroys the l2_flows tables. It does
not release entries in eth->flow_table or destroy the flow table, and
the normal remove path does not call mtk_ppe_deinit() at all. PPE
debugfs entries are also left behind.

Drain eth->flow_table with rhashtable_free_and_destroy(), clearing each
PPE flow entry, dropping the WED flow reference when necessary, and
freeing the flow entry. Remove the PPE debugfs directories and destroy
the per-PPE l2_flows tables afterwards.

Track initialization of the shared flow table so partial probe cleanup
is safe and the table is initialized only once when multiple PPE
instances are present. Also continue past missing PPE instances during
cleanup so later instances are not skipped.

Call mtk_ppe_deinit() from the remove path to perform the complete
PPE/offload teardown.

Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Drain and destroy the shared offload flow table during PPE teardown.
  - Remove per-entry PPE and WED state before freeing flow entries.
  - Remove PPE debugfs entries during teardown.
  - Continue past missing PPE instances instead of returning early.
  - Track the shared flow table initialization state for safe cleanup.
  - Call the complete PPE teardown from the remove path.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  2 +
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 13 ++++++-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 37 ++++++++++++++++++-
 4 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..04d0a1eec4cf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
 
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
+	mtk_ppe_deinit(eth);
 	mtk_cleanup(eth);
 	free_netdev(eth->dummy_dev);
 	mtk_mdio_cleanup(eth);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 0168e2fbc619..c1ca8af6f356 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1344,6 +1344,7 @@ struct mtk_eth {
 
 	struct mtk_ppe			*ppe[3];
 	struct rhashtable		flow_table;
+	bool				flow_table_initialized;
 
 	struct bpf_prog			__rcu *prog;
 
@@ -1508,6 +1509,7 @@ int mtk_gmac_gephy_path_setup(struct mtk_eth *eth, int mac_id);
 int mtk_gmac_rgmii_path_setup(struct mtk_eth *eth, int mac_id);
 
 int mtk_eth_offload_init(struct mtk_eth *eth, u8 id);
+void mtk_eth_offload_deinit(struct mtk_eth *eth);
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data);
 int mtk_flow_offload_cmd(struct mtk_eth *eth, struct flow_cls_offload *cls,
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 8451dc3fd00a..f41df3cf0e2b 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (C) 2020 Felix Fietkau <nbd@nbd.name> */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -946,7 +947,17 @@ void mtk_ppe_deinit(struct mtk_eth *eth)
 
 	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++) {
 		if (!eth->ppe[i])
-			return;
+			continue;
+
+		debugfs_lookup_and_remove(eth->ppe[i]->dirname, NULL);
+	}
+
+	mtk_eth_offload_deinit(eth);
+
+	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++) {
+		if (!eth->ppe[i])
+			continue;
+
 		rhashtable_destroy(&eth->ppe[i]->l2_flows);
 	}
 }
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 99b28aaa7cc4..5b14c7b3052f 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -678,9 +678,42 @@ int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 	}
 }
 
+static void mtk_flow_offload_free(void *ptr, void *arg)
+{
+	struct mtk_flow_entry *entry = ptr;
+	struct mtk_eth *eth = arg;
+
+	mtk_foe_entry_clear(eth->ppe[entry->ppe_index], entry);
+
+	if (entry->wed_index >= 0)
+		mtk_wed_flow_remove(entry->wed_index);
+
+	kfree(entry);
+}
+
 int mtk_eth_offload_init(struct mtk_eth *eth, u8 id)
 {
-	if (!eth->ppe[id] || !eth->ppe[id]->foe_table)
+	int err;
+
+	if (!eth->ppe[id] || !eth->ppe[id]->foe_table ||
+	    eth->flow_table_initialized)
 		return 0;
-	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
+	err = rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
+	if (!err)
+		eth->flow_table_initialized = true;
+
+	return err;
+}
+
+void mtk_eth_offload_deinit(struct mtk_eth *eth)
+{
+	if (!eth->flow_table_initialized)
+		return;
+
+	mutex_lock(&mtk_flow_offload_mutex);
+	rhashtable_free_and_destroy(&eth->flow_table, mtk_flow_offload_free,
+				    eth);
+	mutex_unlock(&mtk_flow_offload_mutex);
+
+	eth->flow_table_initialized = false;
 }
-- 
2.43.0


