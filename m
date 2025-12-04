Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C5D1D898
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSA2Xto6gaAotV0xyUKQUfFLHTWUSXfavZvPkedNAPU=; b=HZOoc14/vxuQiZ5BZEX0/WZzsd
	rCV2UyQVGf+4CLo4i+k6sgG1W6BhBTDrv/KShjrCwg2z7ad5GLOz4Byphh0fP0uQgVVTvCsW+YFlQ
	ruDzS+rtEbBrFLx2HxLd9hLyM9+8M+wVpNksTnuFkBn2dU6uffzIZmljqMcO2uV5pPo7bA2I2qsSK
	oObsmOE8NIvPRiXwIR772ABMJAKVMJh+wqa9NOWKTb5ZpBO3JmYgeDUr4HcHKwEwUdckne92Nla89
	9I+uJ8ZPII7YrcYKa4HUNM7NbHKaROcKWPZA8WweqUy0OZuGreh3nwrMBesyA22XYbLljJEv5VUjT
	ataBzIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RG-00000007erJ-0YCW;
	Thu, 04 Dec 2025 08:11:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RC-00000007elR-2GnH;
	Thu, 04 Dec 2025 08:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3810844094;
	Thu,  4 Dec 2025 08:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EFDC16AAE;
	Thu,  4 Dec 2025 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835902;
	bh=u93GlNGVtfbcwxz+yLwcIQ5xn1Ynxqrvt18EqeLQzgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wgt3/Ld7dVsUZFMPeTl6QPQpobSdRbQNpr+mtWIzfvYILT4lDL63cX7pXs3/qrKRh
	 xXmeyQxq6phxV1/y6mtQeSCAOaBic8fVc512iHBJoxShh9PE4cE31/vccuv37JD/pn
	 vkvfNNBrg4a3E5oMIRHfUbFGfBUv+fyOPz/sLI0bg1wRicztLCbulN9WrokZdO7mAG
	 nF2s0t4suSLwXwErT5eQYvI7UNGx1mHMLLA7sP48d0pWHp3YB8DUEf3nPD4PSCm37a
	 OfzA/Ae3dfXjuAQQ7GXn632EuBk6rtYgcvtJ0vAxp3KxiQhIwKSf0k95k8XeTxlkuO
	 Ykj6y8844sVuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:49 +0100
Subject: [PATCH mt76 07/11] wifi: mt76: mt7996: Rename
 mt7996_npu_rxd_init() in mt7992_npu_rxd_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-7-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_001142_627172_9B75D5F3 
X-CRM114-Status: GOOD (  10.83  )
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

This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index d79f8dfbd7faa7695ea54b632ac86063fa8ffe3a..a9569278f73bf83454a0357e93602837c6ccaa86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -122,7 +122,7 @@ static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 	return 0;
 }
 
-static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
+static int mt7992_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 {
 	u32 val;
 	int err;
@@ -304,7 +304,7 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 	if (err)
 		goto unlock;
 
-	err = mt7996_npu_rxd_init(dev, npu);
+	err = mt7992_npu_rxd_init(dev, npu);
 	if (err)
 		goto unlock;
 

-- 
2.52.0


