Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C28C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVfmWdDuT2KhVf4CTGvop1Fo4MSH/UrlPEoJtglHb4s=; b=IxoDfBV9s6+rCzZEH24++IGc6j
	o8LPI1e4h3uS9q7QbQFSUI7t77MB0F+hDHyMC1wE6hQr2SfS4R8O34X7N5yj3Zo0zX3HA6tKzDEuX
	hGT5XDMmldA6qaDqldDCYFzwHPNs3+FIIeH+AQbq6iQ8MTHqsRs4xmyfFPS4PoskImU1AdgLHYm1t
	gejO+mAtEbpb/uyBEmuNnncXP5fswFHbuyRwM4y5SaN6xbBSzbuags5zqKKYG5GqG12ZgOD0xyoH9
	1qytkazx9jsxw6wPn3pYagB1BNKD7DndqkTjtU0QN/EIgR3gV5YCpHRBK+Fn97SJIcJv2CuaSLXz4
	TMNyc4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi1F-00000009Rui-2Bzt;
	Sat, 08 Aug 2026 14:27:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi1D-00000009RtU-1M3G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:27:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495437bb891so3700325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199241; x=1786804041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVfmWdDuT2KhVf4CTGvop1Fo4MSH/UrlPEoJtglHb4s=;
        b=i9wA0arCVHPNAjHzae1AhjVwoQiemPYqojRw+enIz3oiCzJGyJLstgs1akE4qYKUTv
         HOz3GWy6Yr+7arrPXh169KB5gIIaHfuAtfaFOquc7zDUWX0kIupwhmHN6GkjUicZ5FoW
         kXqWNurPRfqCGTp4LdkFca42aXD4MHl6j7XMS9J/HuG7ih0bVDGzpxflcUL3J8yI3XOw
         Ibwt2q5TkrGuIa2GDzwPmw4uNrdA1ZPU4ZWANy+rcDrsMbaKuJBlOl7HPeg5YGsKYqZc
         DWAeEEHE52GdaiH6LQ7XCU8EZde/VmE4HnA7BcJTsW6d1x2WXg91WthT/AcC67tLrzGq
         Gm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199241; x=1786804041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVfmWdDuT2KhVf4CTGvop1Fo4MSH/UrlPEoJtglHb4s=;
        b=TJw5R18EKCtWKqCLJsoUehr1yaKAcMmwYbS26Rc4fdTCoXlFmIEyIqwS4yQnWmVsUO
         tGcoOy591rwoYyPzjWa/czT4aQP0DIvEhI9VMa+hZevdequoTL+YlZ4YW45YM3ItY0Fa
         gCaFfFwbrhYWLaOnuAl7RnoVqAm6Mb+3Tlm1uN2TomUyPrTe7i1bBQAndNwUT9CgkZEM
         zltiXodlB9cAHb5aMDtgzxU58n2mO+QaZfysKYT57Io9pXlRhdznuz/M3XNl3SSRJs30
         U9G+4g2kPySpDTb+ptKkFfEvi4uIxbPMP3Iw5gw18/9UTrTsZjJFSF1YLqpmSD+yJENF
         868A==
X-Forwarded-Encrypted: i=1; AHgh+RpYwi59sGXFDxxnva2CaWRStB7oSgbc6H5LXgsUlGNmI1wh/thIwx/oVWoWNXfFTPs8bt3Tix5PqecYeQdKRnVe@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCXvEbFGvB/QNvS5em8KPciJ8qg/V/XFFALsEIY4B1ABnxSky
	uqDITtuLHtcKWkwW+dZtwIIFYJj6a1nwVlPhLy9JRLlIzc+JJPVA7jZe
X-Gm-Gg: AR+sD10oSa+uUYgJBQAdYCULKcYW45WQbgxoYy0HVC5odKq+45NwP5KfaTCkyZdmzv8
	Nnq4DlIifBgqbTJdyHXY3xie74ucqSZH37/P9YsrxDmNH+LF3yLitZKJUVAW5kma7Gec3DKJZcw
	o9a13k7wVRLtCjUKjePi9gPtK3eIcNLsXrQlcfkuvKx9RqAPIdg5T8qlEDU0nVniAQ/wffzau4f
	f6vd5yDvIeDdj+tP36eWZt7zztFd4C4Mi9LCPx5xchNzLF3LO8KXBEdARmneWSmgmKEk/Abofk+
	WSkHKDjj0dVlG35rNfWpX2jh39F/JEOTdtdT1aym4RqvUTQKbkItgU/vPd28qiMzWRzp43rpXmT
	A9099JzoXjETs8ls8xW9h9PklMJAPKsGLZ5IqkN84mI5cqPMXT2De/cOw/w7Q4Tp9OlkJ0R3iSb
	ykJYHoy1RdViAdHpwJpSt0YeFaMqHaiqvm5RUp0VFSR1v0k8v7eFASCKcactxP83Hp
X-Received: by 2002:a05:600c:4714:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49962473fd0mr61427325e9.7.1786199240544;
        Sat, 08 Aug 2026 07:27:20 -0700 (PDT)
Received: from fedora ([46.205.218.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2dc4esm140041065e9.13.2026.08.08.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:27:19 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v5] net: airoha: npu: use coherent DMA for mailbox messages
Date: Sat,  8 Aug 2026 16:27:04 +0200
Message-ID: <20260808142704.1873849-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_072723_390777_D04FAD3F 
X-CRM114-Status: GOOD (  22.71  )
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
fit. Allocate one device-managed coherent bounce buffer per NPU core at
probe and reuse it under the existing per-core mailbox lock. That also
keeps the buffer valid if the NPU completes a write after a mailbox
timeout.

Introduce __airoha_npu_send_msg() with an optional reply pointer so GET
callers can copy the trailing response payload once. Keep
airoha_npu_send_msg() as a thin wrapper for SET paths that do not need
a response buffer.

Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260806072601.1815487-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260807064058.1117747-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
v5:
- use u16 for reply_len and split the reply length check
- drop inline from airoha_npu_send_msg() in the .c file

v4:
- drop rsp_off; copy trailing reply_len bytes into reply pointer
- split __airoha_npu_send_msg() + thin airoha_npu_send_msg() wrapper
  so SET callers stay unchanged
- fix reverse-christmas-tree local variable ordering
- constify data argument; clarify reply copy comment

v3:
- move coherent mailbox buffer into struct airoha_npu_core (buf/addr)
- allocate one buffer per core at probe
- add optional reply buffer to avoid the extra copy in
  airoha_npu_wlan_msg_get()
- document AIROHA_NPU_MBOX_SIZE vs ppe_mbox_data / WLAN payloads

v2:
- allocate one coherent mailbox buffer at probe and reuse it under the
  per-core lock instead of per-message dma_alloc_coherent(GFP_ATOMIC)

 drivers/net/ethernet/airoha/airoha_npu.c  | 72 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  3 +
 2 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..907e7ef6cf75 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -23,6 +23,12 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/*
+ * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
+ * WLAN TLV messages (header + payload); largest in-tree WLAN payload today
+ * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
+ */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -160,23 +166,34 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
-static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				 const void *data, int len, void *reply,
+				 u16 reply_len)
 {
-	u16 core = 0; /* FIXME */
-	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
+	struct airoha_npu_core *c = &npu->cores[0]; /* FIXME: core */
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (len > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
 
-	spin_lock_bh(&npu->cores[core].lock);
+	if (reply && reply_len > len)
+		return -EINVAL;
+
+	/*
+	 * Mailbox payloads are bidirectional (CPU request, NPU response).
+	 * On EN7581+MT7996, streaming DMA_BIDIRECTIONAL against the
+	 * caller kzalloc() buffer can leave WLAN_FUNC_GET_WAIT_NPU_VERSION
+	 * reading as 0.0 despite MBOX success. Reuse a probe-time coherent
+	 * bounce buffer under the per-core lock (also used from PPE
+	 * foe_commit under atomic context).
+	 */
+	spin_lock_bh(&c->lock);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	memcpy(c->buf, data, len);
+
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, c->addr);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
 	val = FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
@@ -189,13 +206,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	/* Copy the trailing reply_len bytes of the response. */
+	if (!ret && reply)
+		memcpy(reply, c->buf + len - reply_len, reply_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&c->lock);
 
 	return ret;
 }
 
+static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+			       const void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, NULL, 0);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -442,8 +467,9 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	ppe_data->func_id = PPE_FUNC_SET_WAIT_FLOW_STATS_SETUP;
 	ppe_data->stats_info.foe_stats_addr = foe_stats_addr;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
-				  sizeof(*ppe_data));
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				    sizeof(*ppe_data), ppe_data,
+				    sizeof(*ppe_data));
 	if (err)
 		goto out;
 
@@ -497,9 +523,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -770,6 +795,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
+		struct airoha_npu_core *core = &npu->cores[i];
+
+		core->buf = dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
+						&core->addr, GFP_KERNEL);
+		if (!core->buf)
+			return -ENOMEM;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return dev_err_probe(dev, err, "failed to run npu firmware\n");
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfeef6..16a988ad7467 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -173,6 +173,9 @@ struct airoha_npu {
 		/* protect concurrent npu memory accesses */
 		spinlock_t lock;
 		struct work_struct wdt_work;
+		/* Coherent bounce buffer for mailbox cmd/rsp */
+		void *buf;
+		dma_addr_t addr;
 	} cores[NPU_NUM_CORES];
 
 	int irqs[NPU_NUM_IRQ];
-- 
2.55.0


