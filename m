Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=; b=CJB3NubaGqTNQesA+2U9spllFf
	ouneCEEMFkdjebpzy/ryaKJH0NxzeHYVQgGZOAi1TGkexmpX0bgqILY33tGtpu6e6hhcAmnJy3Hfq
	z+RiWEg6KjS1V+KuisnLQ8gst1SEhcrL3b3gzFoOZW05TxLFGRu+CYNfd76CX9julgUHNB/FnM9hI
	WnGxgOPS93hMIlAOIzwEDd04w9aLXN9kTZJJOktkYTOC+TbnHkqRFn9JyDXidVUln3yxUounbNE+C
	A6fnKrg+b3R9tVen+e4kZlgrLu1/DiVW2/flQhzswXWv/MZukcaE6VTKobCu76kxAAzPb0rrYfXKF
	HEEpieZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtIQ-00000005m8k-1Hmx;
	Mon, 17 Aug 2026 09:06:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtIK-00000005m3Q-1zOK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:06:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47fd4531020so1864506f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786957570; x=1787562370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=;
        b=Ip1Ud9S8MhhCovqAhdNEJFh++pNSlHArG+k0drRnSqKZAnTMuWkWr3VUTS/3kgDkjF
         CaeITAMzO6lTu0ApbNeHkiXaPPB6IRd8GdYO7yKHJbG/zHRog5WgKPXcPdb7LqLQjBns
         /QYrZlpp09qIR2haoDRZLLYjDMJkBy3RxTtvfE5DvWXWouQjeOOgioktjxWgr+5hm+mx
         lItSoTze6yEkyKljJj0ksZTD1yeQktRrFp6obHEE69efp3+X30FEgjD7TpfAFHyq3Wuz
         BBPCt+FsSrmCneHv1vSPKU4SJKZGtsJixspea0dBIi8dcjK8GwRrfUcJlzEp4N3TZGdv
         hSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957570; x=1787562370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luZ6/X1fUnmPIAGg7u9rfHAcCpIwRBZ6wNZmQs6CnhI=;
        b=ObrqoD9U/w3CxogEjxijOEbndEPZK3R/Fzy7bXusXy/ZjFxP/2vQqpiXDG1xI/ymfH
         G2JNYCYwcrOWLHPv28tVQ2I2TpXz2v0kYdIEE/rlwlLi4ek4MmZxaGV3Cb8RI3Qnq9Jx
         aaqEPwug/rmXVf0xGg9MIBHo4EywidWPqyYOufnj71soIdtta3VodlOQ/4xoXJZpNytq
         roPScoylep3ku8j26XTmzTOmwHw4mjt8qnNiWLVCv4E+Euiy9q6M6bqirXVAgDT67Suk
         sWXVJcI9ewBueXpIY8AdF5rnI3/3S5DoaODHFcMuYUg7JiKK4JaBb0vQbJ6JA4C58OyH
         MLuA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg+OtRXVU2vcmh0jfjiKQVn+grRP1KthpwC0bWgdgSYC0P7fASuvx0Iolt7Vnz0IvtQtgAN0lfX9VG61c3FZL+@lists.infradead.org
X-Gm-Message-State: AOJu0YwLfQjyFaAmO1mpNTUdCnCBu8nA4ayvvgGn2ou7oH85YCU2Dg1z
	nxk0LboQJwGXzGmF54iqKlTogGyQ8CVQtTzXSdtLXrDbsOZqu9cLNnW4
X-Gm-Gg: AR+sD10xt27L5RK8FT1vRU2SOnCb5SdlwTjjyIHQr38RAcEoDJ72C59CuBej1mIiN+s
	+KqoQ8+4ML0O6qBrZSIQ5NwvXOpN36kdes4kbVV3VO2Zc0xka91JavSmwXZ7fkdGabaI5yXaJFF
	kixWQ03hB0KMkzbqs4Fsrj/jpvUgFV/yuorFF3JGrfmgAfoynGgm/qWa9TwQTk/wV4b7ec35rX7
	D/PxzYAoNtbnpJmwv9hsRrkm0c30UtAplP6DMgEfeq5CpP7NHeKH0ChIigerex6baGhqByNgiGX
	huI+mdXBSfg7YhXl1mQVBbvJ/4ecnHVssVAn6VwH9XoWSBoaNC1VNLdMBf6kYXxA3zHNqdd7HP1
	aDampjTgycovyV5f8fodw9t/4ymh2K9lBF4yI++2/qugRV+WJZLlIzI/gsohIb0JQAIBaVmTxZd
	jYZL+hzhNvVaVEjGx6jqPiahOIZs4TcZFj1B4sQE3kqQN/joAs5xCO3EorPy/jGLKpprrR0FTOy
	lfxhyRVm/kF0WS8ee7Xk+bav7n408QN/DQpEQQpLwEwIUpaQdMYg+M=
X-Received: by 2002:a05:6000:230d:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-481607100bdmr40751188f8f.6.1786957568437;
        Mon, 17 Aug 2026 02:06:08 -0700 (PDT)
Received: from fedora ([46.205.219.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm2507130f8f.9.2026.08.17.02.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:06:07 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for mailbox DMA
Date: Mon, 17 Aug 2026 11:06:01 +0200
Message-ID: <20260817090601.1256389-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020612_553338_2A67EBD7 
X-CRM114-Status: GOOD (  12.27  )
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

On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
0.1111.

Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
the original payload length into the mailbox length register.

Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
6.18.44, including two cold reboots and sustained WiFi use.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..d560b8763753 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */

 #include <linux/devcoredump.h>
+#include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -160,15 +161,21 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };

+static size_t airoha_npu_mbox_size(size_t len)
+{
+	return ALIGN(max(len, SMP_CACHE_BYTES), SMP_CACHE_BYTES);
+}
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	size_t map_len = airoha_npu_mbox_size(size);
 	int ret;

-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
+	dma_addr = dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,

 	spin_unlock_bh(&npu->cores[core].lock);

-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);

 	return ret;
 }
@@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;

-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	int err, size = num_stats_entries * sizeof(*npu->stats);
 	struct ppe_mbox_data *ppe_data;

-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;

@@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	int err, len;

 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;

@@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	int err, len;

 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;

--
2.55.0


