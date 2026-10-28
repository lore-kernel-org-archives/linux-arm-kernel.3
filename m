Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA25606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVoT+6sz;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z419Tq8o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oqFzpPIOsYawPJQ8wrBui5JE3wbzUk29Kop9UX3xfbE=; b=oVoT+6szO1X81m7RMqh3YyrE5n
	tEGAaPXlrhlPqZC1M8hw299fggp1MjMtFfu/BZ+TYRchXaUD45VLXyc7KG4F159dxJN4OwameGA1H
	cmuSO5bgmHmbgJMlBjJJBfSp6UE35A4FMy4wiKQ1Y5KkCmoPo7foOrV9NqT7ZJQJ3WzYD75PeXU+S
	mWxSUYNUxOGSWz8x0TVsWGgkONBTT/elWhSGuOXsukOD0fvIkEKPcEooTsU31rg4JSfkidQ5SvvxE
	MEYyW3h476vZ7PS4TZOk6BiPMc1lk7Bl8pqbiqfxlRRgqAvwQmeM391Dowrz1EmzsTtLggnzr7hS3
	2CDfF87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvic-00000006Iz2-23Oi;
	Wed, 28 Oct 2026 04:56:58 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLviZ-00000006Iyd-0xpH;
	Wed, 28 Oct 2026 04:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oq
	FzpPIOsYawPJQ8wrBui5JE3wbzUk29Kop9UX3xfbE=; b=Z419Tq8oLy6kVM5E47
	xrwRESrXv0q0Ey+kkXjEakKq+jCBZEEq7E/YGXNyX2+ix+1i6wx2a7c9H0YciRQ6
	BFYx1i8eqdfFtO4iIOghzt8NvPcbdzkZY6aOdXJwn53AcfuRaYDhyynVdfX7OGyV
	m/8n5ToS/xaHkFwI4ktkiJumw=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3XzKAgOFqq95iDg--.12927S2;
	Wed, 28 Oct 2026 12:56:33 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: drain mt76x02 DFS tasklet during teardown
Date: Wed, 28 Oct 2026 12:56:30 +0800
Message-Id: <20261028045630.112769-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3XzKAgOFqq95iDg--.12927S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DJw4DGFWfZry8tr4ruFg_yoW8uw4xpF
	W7Kayjk345JF4UKw48Aa18AFy5Wan7Kry5GrWYv34rW34rAr1FyFWYgFy2yr40y3yq9a4f
	JF4jvr43GrZ5ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgL0OUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQFTjWrhgIGC4wAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_215655_575845_86E115AE 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MMIO interrupt path can leave dfs_tasklet pending when an mt76x0e or
mt76x2e device is removed.  Disabling the tasklet does not remove
pending work from the tasklet queue, and the cleanup paths eventually
free the device containing both the tasklet and the DFS state it uses.

Kill the DFS tasklet before tearing down the DMA engine and device
state.

Fixes: 7bc04215a66b ("mt76: add driver code for MT76x2e")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/pci.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt76x2/pci_init.c | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index f8d206a07f99..0c6befdbb98e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -224,6 +224,7 @@ mt76x0e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void mt76x0e_cleanup(struct mt76x02_dev *dev)
 {
 	clear_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
+	tasklet_kill(&dev->dfs_pd.dfs_tasklet);
 	tasklet_disable(&dev->mt76.pre_tbtt_tasklet);
 	mt76x0_chip_onoff(dev, false, false);
 	mt76x0e_stop_hw(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_init.c
index bec84f932311..e454efab9739 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_init.c
@@ -280,7 +280,7 @@ void mt76x2_stop_hardware(struct mt76x02_dev *dev)
 
 void mt76x2_cleanup(struct mt76x02_dev *dev)
 {
-	tasklet_disable(&dev->dfs_pd.dfs_tasklet);
+	tasklet_kill(&dev->dfs_pd.dfs_tasklet);
 	tasklet_disable(&dev->mt76.pre_tbtt_tasklet);
 	mt76x2_stop_hardware(dev);
 	mt76_dma_cleanup(&dev->mt76);
@@ -317,4 +317,3 @@ int mt76x2_register_device(struct mt76x02_dev *dev)
 	mt76x2_stop_hardware(dev);
 	return ret;
 }
-
-- 
2.34.1


