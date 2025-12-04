Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DCBD1D884
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtR+GOtwR7Njn6FFxHEtX1HegrsAya79LezwICRyiY8=; b=ILR9EIYb388Xug+ucRhhzHaBNC
	RZPMvPsQPCt36z4VZ1qhmdSHX11cGBjk4fW5HC8zYT5PPvFvjCai2ps2WRwW8v5YB0f/q9Ouwswv6
	+ZUEN2MFE+UJ/3tlZQpAzSqoGsYn9CgM3ixDFnTaoDUCK6Y/B15+cQ11S8mYXVgbT96sXVWmBvo8C
	SjWEZQ9PvZFab+bS6aIpoonNl0vN+ZXXVXCjLcw1xDMabCcOE4PFwt+2+EPlQTVyVjPkN9KevSz4b
	tkswlh21szwV9vTTv0RiYqfeafw8V9vr030UGmLfGqvu5qrI8+r0BrCUCyWeE+OCYOMV/VeYMemt+
	gVBjBpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RM-00000007f1V-0fmV;
	Thu, 04 Dec 2025 08:11:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4RK-00000007exx-1Oe5;
	Thu, 04 Dec 2025 08:11:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1EA944303;
	Thu,  4 Dec 2025 08:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8309CC113D0;
	Thu,  4 Dec 2025 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835909;
	bh=kykoTyEvweJTm16xpQdKbqME0mmSqg6UDONuyX5nazg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ahFW7BVM67pBxrrVtQu3UpmLsaKRyo08zPS8Xa6A7IIraQO1nEb3DsJ0OrGMgkLEk
	 Ef9NgLw4B41lejEPnATK1BIPXXZNcU5LPYNDWvtLJHQ3/1/LDbd2n8qJqySADnpBnT
	 K+lUwEv3i8otpESo1sz2dyOsH2efsWS96OLJK7jPmK8dOUXP4uziciyXRjd4nK6Um5
	 uFFU/glImcSxxHsopwsNr2Aoc91KG8eMQhpbhtJNjcorNfas+Edrlpz6FFEFNi8XYl
	 qgpQ2czS7L+D0zOu1SYeT3ls7xAK7F4WMZKSpVt3RcbIYbMeUq2RGzMUH1UrwJWfh+
	 MAyGAllfo3kVg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:52 +0100
Subject: [PATCH mt76 10/11] wifi: mt76: mt7996: Integrate MT7996 init
 configuration for NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-10-7819c52c0893@kernel.org>
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
X-CRM114-CacheID: sfid-20251204_001150_411763_7DC17140 
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

Add NPU integration in MT7996 init codebase for MT7996 chipset.
This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 03c1ccb49ef02ebe9c2ae91db836593e680ee2c0..526a2cb298fd7f9dc8d0fcdd8de0e4071c07338f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -592,7 +592,7 @@ static void mt7996_mac_init_basic_rates(struct mt7996_dev *dev)
 void mt7996_mac_init(struct mt7996_dev *dev)
 {
 #define HIF_TXD_V2_1	0x21
-	int i;
+	int i, rx_path_type;
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
 
@@ -606,11 +606,16 @@ void mt7996_mac_init(struct mt7996_dev *dev)
 	}
 
 	/* rro module init */
-	if (dev->hif2)
+	if (dev->hif2) {
+		if (mt76_npu_device_active(&dev->mt76))
+			rx_path_type = is_mt7996(&dev->mt76) ? 6 : 8;
+		else
+			rx_path_type = is_mt7996(&dev->mt76) ? 2 : 7;
 		mt7996_mcu_set_rro(dev, UNI_RRO_SET_PLATFORM_TYPE,
-				   is_mt7996(&dev->mt76) ? 2 : 7);
-	else
+				   rx_path_type);
+	} else {
 		mt7996_mcu_set_rro(dev, UNI_RRO_SET_PLATFORM_TYPE, 0);
+	}
 
 	if (mt7996_has_hwrro(dev)) {
 		u16 timeout;

-- 
2.52.0


