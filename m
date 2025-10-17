Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E17FCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2kNFlyhP4N8aj9Ptcmsv+xjSVKFThE+9/oYUSZNQEU=; b=lG3jYRnWdxiTkQLQVmC22t0ibd
	lN+FUN0eXKfVYpzT/Fw1d3Up12b3aT5UMGCkr7N1uoyMA+c8TzQU+vA7toKTjraB06S5EOSo22yTR
	GrFF69zFNi7NO79XcpLzVwvu05stkT07xvepO1FKId32mR3Zf4vyzOkGmBQQUWAWYpj5PL7Ooajxc
	Y9Kl29cPcztm+E7tDR8W2wqY9fdbK2OhcHXI/lox408hePpLIgGNxUSVKAfiFkNcuTq/vLluuiPV0
	FxKaR1TiZf/yvQqhaWR5FlABwRbfuKNngGF10Cuu1Zryo6/YOIDs8gRyFUCVXLavTv3uC5ZWloMSs
	5YWBmPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAx-000000078w2-3d3P;
	Fri, 17 Oct 2025 08:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gAt-000000078sA-2Zrc;
	Fri, 17 Oct 2025 08:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E8F7441D1;
	Fri, 17 Oct 2025 08:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8F1C4CEE7;
	Fri, 17 Oct 2025 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760691059;
	bh=SvzJNk+DqsvUzhRIiCdh9c4/NM7yKR2xIHNC6vUjOLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TnIae8sq/IBlZzHRCHOLf+FL5lBZYiEzRrvgxY41PvR7eSxm+ufAVeIMVeyLPoBNk
	 vGF0bU6kB+gRZjB0inw+uXcjKuwCGZel5hKwqIlJNyMDqxkPJPOvCwy8oIylQRRDYo
	 LQPr+KWw+1cdm8x1NlSEBB98J2auhDV36FWn4+ducA7m0LabjuNXSZueiUNY9wCdy/
	 3Fp7YPMm5qdZgZhH5USRUbyc4JW2qMf0lamDGfh0QpQistWKmxZj8+8q+n3lSPhUJa
	 FbcTmjQ4TkmyH7eabQt8HDX1TmQHpVNXTSL9m8BGtYWhJ0iOIvU/w9UjbbKCCTstRg
	 h/YC7bBTdVq+Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Oct 2025 10:50:31 +0200
Subject: [PATCH mt76 v2 3/5] wifi: mt76: Add the capability to set TX token
 start ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-mt76-npu-devel-v2-3-ddaa90901723@kernel.org>
References: <20251017-mt76-npu-devel-v2-0-ddaa90901723@kernel.org>
In-Reply-To: <20251017-mt76-npu-devel-v2-0-ddaa90901723@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_015059_687877_1FC939B6 
X-CRM114-Status: GOOD (  10.92  )
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

This is a preliminary patch to enable traffic forward offloading via the
Airoha NPU module available on the Airoha EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 drivers/net/wireless/mediatek/mt76/tx.c   | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index b0ff65427088128a6a83557b195f0e98aa012b32..a66b89bc4b4a5b9a4a8a21a0fea6c465d34ce552 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -944,6 +944,7 @@ struct mt76_dev {
 	struct idr token;
 	u16 wed_token_count;
 	u16 token_count;
+	u16 token_start;
 	u16 token_size;
 
 	spinlock_t rx_token_lock;
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index b09b7dfab4169357901a001f89d16be64811044f..9ec6d0b53a84ad73472e6f4fbe9672753d43b9c1 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -847,8 +847,10 @@ int mt76_token_consume(struct mt76_dev *dev, struct mt76_txwi_cache **ptxwi)
 
 	spin_lock_bh(&dev->token_lock);
 
-	token = idr_alloc(&dev->token, *ptxwi, 0, dev->token_size, GFP_ATOMIC);
-	if (token >= 0)
+	token = idr_alloc(&dev->token, *ptxwi, dev->token_start,
+			  dev->token_start + dev->token_size,
+			  GFP_ATOMIC);
+	if (token >= dev->token_start)
 		dev->token_count++;
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED

-- 
2.51.0


