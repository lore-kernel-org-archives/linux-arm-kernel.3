Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC88CC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Du424wcgYsHlMuGkMQaZEV+CEPsWQYn2LKtn2mdtg4=; b=CuF8pqpCBkwiXYVcbA7mzNtqyh
	Wz6HqzlrgW07OPQv+gYFcGA6OteyYLqhKAFOeS0rCgsPTmj8UKgRBH0g1RIzW2R/J3sVQNBHmYOnh
	3odWV51qG9pvq1o+rP/n18rugMo/ZLqC/vdEDSnmCG64CN/fleysp3HYHfemKMh2nnGsuiJtVq4z8
	5Stc8m451A4glyPvixyFCPkLiz/jSGy+8p634oVpcZhDdDZMx1EUZtkUCNOjE3FVwNN9h7LxaSyTi
	piGT7mRTWaUsEIOfkul/VSDH2fJP2sZ+GtlkY60hczMQQ6CFm55q1ngewtOZNvza/21CaEL5wMSBo
	pxkL4DQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt5SH-0000000ARtl-0oAQ;
	Sun, 09 Aug 2026 15:28:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt5S4-0000000ARs8-3C8a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:28:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4957eefd361so7263265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786289318; x=1786894118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Du424wcgYsHlMuGkMQaZEV+CEPsWQYn2LKtn2mdtg4=;
        b=DpcIIyrT8eW7k4dyrt2qKRbapHF7xY6q/htBksr8YiFwDJmKFs4F75wwSvsobc46Au
         HMq1o5WodpOTuPY/oQWqSjuLF6nX2QD9F2C1I1WZ1IMt/TNxOsDpZx3bJ5KfeaUBp9Zh
         b7ldRAO90/dYTlJmrkrrIhZObHzuSsb4z+v9DzJS4iCilHKKRzI+GAcqXm4/uugYXTQP
         7TSw36o2JNADFmjNMkwL1tFA4+o7X4JNM3eeuPXMDPwqgffeD6Z4aMGJtt2Wc5tHLqQj
         vj/ECzte0jwTq0P5mtZpht49crwh+jW8tM/SMMhNO+LVpSjAjnWfS2SJVeLIX20/N7B+
         ebRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786289318; x=1786894118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Du424wcgYsHlMuGkMQaZEV+CEPsWQYn2LKtn2mdtg4=;
        b=Ngv7XYhrSOK7GhuV+tTXouBR1RX5dL4GB21qGafZtTTQ+/wW0Wh42hbYsQXFqiPUgF
         ONX70RIjgFlWIQmmcU0ZzpIOiZMh+XmIa0wCFgDanPQGStBFlc80jf0yBWrujlduotg2
         Nlu68R4I1aEASzAIEFsbE5lBTW+nWW2Vnp4p7Qw/iJ2uRUVnV/I0oJvFrYiOn9NOkNak
         jNsZS8tvCXpCQ3rUwM8mHEXHGYHaqpevh2IEartY4412r91oe5DsB2B6unpOCAG94qw0
         nJGqaSSXAwhHJ8Ji2+VzA9hkj6lS81WXzCaULU5434pxyitmQwhgxMttFiDgxgFHF6Dg
         bOPw==
X-Forwarded-Encrypted: i=1; AHgh+RraU1kxEshiihZVyxeCq6St1oD9scna8zq9/q/v8vBVth6hkq3bI5COBwXzs9gdxQSopSLw+kIA6XjC0Kp90YW+@lists.infradead.org
X-Gm-Message-State: AOJu0YwF0iwcoQ1WwAYB5SDpAc896J0sHPMM34QuYuKmh14W6qjztX86
	jAg5ZuGAPH3RqHeTA1N3d0dDryLz/ACAxIoVAHr8YwK7JycSFba8w1HK
X-Gm-Gg: AR+sD13P+PG0KCxi4HkAkjxhDPaDLhINziINR4wjUoy4ufBBDxG4tpeHfOWUg3D4rZp
	mVpbV35QlFbDPRnDkZMLw/8+HXLftKuGV6NeGIqmbqYdN1ZtJwFzgCmhK5VdUuGxW8VhTjKMAjb
	cqcuPLmpeufyszTWUX3iU1kL0OdiFEW/aUbUnHpw/jOMWHhSH/xlVfxys19IIAt3fauczFnPkyK
	fwKqyZ/rlPZzU9cPQ9hXxeoQ2OO1rawzPzzLyBhqsSxYXQarRUZmWRqvLBBBngm7VQ6UijzF3Dw
	ctijGPmODUMFEw4pUEhkU18Q0YZil+yg/Qx4IlhOvdct7BwUsZ2+683oG/FuezskLheEk7kwqxM
	olcX14ysLByaM6jfdWf0EAofiCLEgy7daKyBZ37JDdu/fq+ImfkYC410wTr9aj5dtAOtDyaol7q
	lR2e2lSTMJdPGRKhOPDhzs03ltbG01xMQKz2qz+87xwEP0ICTiL6IwNBMFzT+gDIDsuw==
X-Received: by 2002:a05:600c:1c19:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-4995e07f45bmr220387665e9.3.1786289318104;
        Sun, 09 Aug 2026 08:28:38 -0700 (PDT)
Received: from fedora ([46.205.218.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm207379925e9.5.2026.08.09.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:28:37 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v6] net: airoha: npu: use coherent DMA for mailbox messages
Date: Sun,  9 Aug 2026 17:28:13 +0200
Message-ID: <20260809152813.585797-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_082840_834557_AFBA757D 
X-CRM114-Status: GOOD (  23.66  )
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
airoha_npu_send_msg() as a wrapper that copies the full response back
into the caller buffer, matching the old bidirectional mapping.

Verified on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996).

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260806072601.1815487-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260807064058.1117747-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
v6:
- use airoha_npu_send_msg() in ppe_stats_setup() again
- make airoha_npu_send_msg() copy the full response back into data
  (same as the old bidirectional DMA mapping)
- rename local core pointer from c to core

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

 drivers/net/ethernet/airoha/airoha_npu.c  | 67 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  3 +
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..c839e0a419aa 100644
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
+	struct airoha_npu_core *core = &npu->cores[0]; /* FIXME: core */
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (len > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
+
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
+	spin_lock_bh(&core->lock);
 
-	spin_lock_bh(&npu->cores[core].lock);
+	memcpy(core->buf, data, len);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, core->addr);
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
+		memcpy(reply, core->buf + len - reply_len, reply_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&core->lock);
 
 	return ret;
 }
 
+static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+			       void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, data, len);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -497,9 +522,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -770,6 +794,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
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


