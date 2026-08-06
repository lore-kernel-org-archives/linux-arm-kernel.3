Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE27C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZGj/L3nadsNc5+G4zPPi1gGSB5LzCydIBvRZmooxYk=; b=kVnDsd1X3T+V6VqAqH3y2mxaHX
	LOuvobUcaQDA3InbvARBDwR66qyLlXQjyQzgwx3UbSa6oQ+OC2oKtIlNY+MlrUgSYzong+j/BQvA9
	xBiwil4Fq43cENeqbJRXVprKXacRZ+squtSKEWfaStxgiPglze0PbowafagSfYMbvzR5tRrQh412R
	JUuRuk1/zEK0oAg2cseKXXmC2IuRiXrSJhM2FukY/TYFjAEnTSh32LRRbaUPMmDp75ZfEIkEHzJEs
	xOsVF99DOY5bASAMGr+0d74yeLT77kp4ZapErhTO32RTy7p1ZH6s8WgugWRn+BDnzFGkWpd9leZrl
	8HB07TZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsUe-000000058i3-3VLY;
	Thu, 06 Aug 2026 07:26:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsUc-000000058gZ-2jxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:26:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1362478f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786001176; x=1786605976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZGj/L3nadsNc5+G4zPPi1gGSB5LzCydIBvRZmooxYk=;
        b=sJmUwmC0zRuI7t3x4GZ6ugI36yhVUrcYIHZpfNt292ktKDg8I5KurZPJY7RgY5cljM
         kmYzVKhJaVxzda6pjrPZ/XHPzhdW8XwcnRy+JPSY+EDXmmG792oMM+3HL55qu7VJMSWj
         J1TSFHg0Bdjq7klfTQ8rzAZPgcRianUpzW6BUY0493XphwJ/JL0ycaxpVsht/0R592Kk
         1xmZ8LfbrClWqm/FJDrJJDq6cXnAsMf8Bz+kGyfXmc+2GyR7Tb9iGzHYfdvKvF4leFxk
         D9sOLou31/QxhuCj5NOfF4uKlbM60B2GO+IZkXtthpZdCmvn4awoD/h8pc6Pe1dibmGS
         Yyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001176; x=1786605976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZGj/L3nadsNc5+G4zPPi1gGSB5LzCydIBvRZmooxYk=;
        b=rGqdu7I2kI0lI74h3pVHoe2dWp8Q3zjjINZ/OyO6xX7uR3Xuu3Bmma3R6I6wjfogvZ
         M8KkHK/nsUsk6RRX4rJONrTW1LYsmyyA4gercJepZRm0hL6PgVv6SrD6iVeNcm0b8i1+
         g3sVZiXahwHnS4Lc2BYD4jmRwZzWuc4RgS+v/qPFosDC6S188v7WAmPSH0ITliiLq/4E
         EKQ47Z+eqnO20qmC3HA/Wgcd7zgkPXZTYV7eAyct+2iyqyiMu7Hzrc0SvH8t2/E/0uyg
         ggaj7BNiKybfxEN+VpIunobwdLLWLI8npBrO6WanJnW7V5y28NASEs2V8KWRT8K4pDMY
         JThA==
X-Forwarded-Encrypted: i=1; AHgh+RoWpOkqmG2OBYaQ1CNGPb/1vLKFmgedVlaRJ+oDUZ/0WUtuFQftxM+O7vdo7VMMqIfUUvH64TTB3ZC+5t9/k9iB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl9spkPoMXk9NV3ONWYrX0Y60r2PUEG7YaDYz9bSdAw3kBBRNp
	f2jzTpNZmang38xgub8ztGnQUSHPdM0WeNhoYQ82gWFGcETZmTpyt+eg
X-Gm-Gg: AR+sD10dJ7jVFj6DpjaJf176Bc7rE3eThaXQFPXXiZMcHunXW6Ywg7tR0qtGDVfXCbl
	dMjuomHRRxY7SiYqGMyFZAbNXKdXA5I/oXRkUllh0z4bXAZKV/m0VvKQM+Mx7dwbu0YRzj2ic4g
	dk6kMKlEWNoqnOpx3HnJHCcgsx4YpjaBE0f+/X5izo6xZefZ8DwZc9G42g65DeRUM+qBlKOZAAj
	Qa7aTttevOO0e8uh3BAGtbMlC8UxFHY1ziRvLNQdruHUOCT/xr47Cu4g6VMWA/eC9jsJ02Hp9VR
	1JGCi2XeYpOGDrVWDyoNWaKsUmDisBhKnZfiBnLwcSyh6v5Gl8O65XKb9VF+k+bku73V3oq/T6i
	bXF+JbOSxOxckq7aDPnDxpO4JMMKRSsbD6ZNTc78DBIhgNFJfWTVC5m33ncTwKYid4gJFmNZOFK
	fWYQo8lEA7Wuq4Aj6LPtmuVt2Cy+diu4TpszyXYAxETxqIc0XfFR+C4L8=
X-Received: by 2002:adf:e992:0:b0:47f:c648:e280 with SMTP id ffacd0b85a97d-47fec519539mr16086894f8f.18.1786001176240;
        Thu, 06 Aug 2026 00:26:16 -0700 (PDT)
Received: from fedora ([46.205.219.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b25b4asm3900021f8f.26.2026.08.06.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:26:15 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v2] net: airoha: npu: use coherent DMA for mailbox messages
Date: Thu,  6 Aug 2026 09:26:01 +0200
Message-ID: <20260806072601.1815487-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805070851.2885888-1-pawlik.dan@gmail.com>
References: <20260805070851.2885888-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_002618_707851_1CC777DF 
X-CRM114-Status: GOOD (  18.35  )
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

Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
non-coherent CPUs invalidate caches before reading NPU GET responses.

On EN7581 + MT7996 that change regresses probe: the mailbox completes
successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
mt76 never binds NPU offload. Healthy boards report 0.1111.

airoha_npu_send_msg() is also used from PPE foe_commit under
spin_lock_bh(), so per-message dma_alloc_coherent(GFP_ATOMIC) is a poor
fit. Allocate one device-managed coherent bounce buffer at probe and
reuse it under the existing per-core mailbox lock. That also keeps the
buffer valid if the NPU completes a write after a mailbox timeout.

Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
v2:
- allocate one coherent mailbox buffer at probe and reuse it under the
  per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)

 drivers/net/ethernet/airoha/airoha_npu.c  | 31 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  4 +++
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..dfa09fed907e 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -23,6 +23,8 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/* Enough for struct ppe_mbox_data and small WLAN TLV payloads */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -165,17 +167,24 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 {
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (size > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
 
+	/*
+	 * Mailbox payloads are bidirectional (CPU request, NPU response).
+	 * On EN7581+MT7996, streaming DMA_BIDIRECTIONAL against the
+	 * caller kzalloc() buffer can leave WLAN_FUNC_GET_WAIT_NPU_VERSION
+	 * reading as 0.0 despite MBOX success. Reuse a probe-time coherent
+	 * bounce buffer under the per-core lock (also used from PPE
+	 * foe_commit under atomic context).
+	 */
 	spin_lock_bh(&npu->cores[core].lock);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
+	memcpy(npu->mbox_buf, p, size);
+
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, npu->mbox_dma);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
@@ -189,9 +198,10 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	if (!ret)
+		memcpy(p, npu->mbox_buf, size);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&npu->cores[core].lock);
 
 	return ret;
 }
@@ -770,6 +780,11 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	npu->mbox_buf = dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
+					    &npu->mbox_dma, GFP_KERNEL);
+	if (!npu->mbox_buf)
+		return -ENOMEM;
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return dev_err_probe(dev, err, "failed to run npu firmware\n");
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..afd481233489 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -179,6 +179,10 @@ struct airoha_npu {
 
 	struct airoha_foe_stats __iomem *stats;
 
+	/* Coherent bounce buffer for mailbox cmd/rsp (airoha_npu_send_msg) */
+	void *mbox_buf;
+	dma_addr_t mbox_dma;
+
 	struct {
 		int (*ppe_init)(struct airoha_npu *npu);
 		int (*ppe_deinit)(struct airoha_npu *npu);
-- 
2.55.0


