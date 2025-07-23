Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B47C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrQhxU1qWB2XghZCrM5lXjxtfkRP3+A8ANDjJdcZ3vw=; b=gC0BS6+GRUq9VgcONKpfOApGMt
	Ld2ourB/BwdmVopFxCSECqISX/ClI509R81i/gbi3eiFs4FQpVkV7iHFleCorM/bBi1+yoizSBz5k
	QHUIowq9cfCaCp5FCSlHdaTOs8FhhhYtuUtQOWds9LaRVsE71JwiReYj0BKP1dEUhRCvH3urHpo3B
	yVyV6dqfLVosw4C52x3P24+JfqyF/YeupgMQp/NG3sN297x83Z+CZt7i4XVob+zVfExn5Kx6LrP64
	mf8KmF5VL7hYafFPID0JqKjUNJpx7K+xFhbBaR9K5CVt28QahShkX8bQR1801D+3DMBKXPAXMpbWU
	5JPDqtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedI6-00000005bPy-3IWo;
	Wed, 23 Jul 2025 17:30:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued8X-00000005a5j-2l0H;
	Wed, 23 Jul 2025 17:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B7A143DF8;
	Wed, 23 Jul 2025 17:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB72C4CEE7;
	Wed, 23 Jul 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291213;
	bh=+xv5omMKRWXhWs68ZUxYevMWto8ObMVFNInJ4I2s5B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CXaBp1fhp3ueqDiZM+K/xe/cDfATroDwAGdZjTgk6hJtTBy6ftDSb25ueuyfi4cNN
	 IgQu7fp0f1PZD3lZdrQ4SwebJ3Kx4UIZBFxyj8f9NJfWtMaTRNh0IPsNCP+WxfUgLP
	 n6dXl68TkB2+d2lGKlwb7sjQHRKN0+tDkgyMjtsht10ZPF+SRKrEj90wykhkuevE/e
	 L74MDBfDOV9F3V+EJyArJndnpslN61sI7Comvyp9KMpZVJLYwWJqyZYUVvwvvdjUFf
	 rKaQpkKyjBKYhVoMU5meaYNAdO7+ITwHputRosiHEatVzzFefhDNvUQOKJbOaEy28v
	 iPi+umhooPYTA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 23 Jul 2025 19:19:52 +0200
Subject: [PATCH net-next v5 3/7] net: airoha: npu: Add wlan_{send,get}_msg
 NPU callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-airoha-en7581-wlan-offlaod-v5-3-da92e0f8c497@kernel.org>
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
In-Reply-To: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_102013_744910_46D54170 
X-CRM114-Status: GOOD (  13.08  )
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

Introduce wlan_send_msg() and wlan_get_msg() NPU wlan callbacks used
by the wlan driver (MT76) to initialize NPU module registers in order to
offload wireless-wired traffic.
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC with MT76 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 58 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_npu.h | 21 ++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 60e00eeaf1bf5ccc339ece938d252c338daf9f9a..4352ca10b3d92009dfdc4f466e43dc5ac00fc75a 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -42,6 +42,22 @@
 #define REG_CR_MBQ8_CTRL(_n)		(NPU_MBOX_BASE_ADDR + 0x0b0 + ((_n) << 2))
 #define REG_CR_NPU_MIB(_n)		(NPU_MBOX_BASE_ADDR + 0x140 + ((_n) << 2))
 
+#define NPU_WLAN_BASE_ADDR		0x30d000
+
+#define REG_IRQ_STATUS			(NPU_WLAN_BASE_ADDR + 0x030)
+#define REG_IRQ_RXDONE(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 2) + 0x034)
+#define NPU_IRQ_RX_MASK(_n)		((_n) == 1 ? BIT(17) : BIT(16))
+
+#define REG_TX_BASE(_n)			(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x080)
+#define REG_TX_DSCP_NUM(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x084)
+#define REG_TX_CPU_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x088)
+#define REG_TX_DMA_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x08c)
+
+#define REG_RX_BASE(_n)			(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x180)
+#define REG_RX_DSCP_NUM(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x184)
+#define REG_RX_CPU_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x188)
+#define REG_RX_DMA_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x18c)
+
 #define NPU_TIMER_BASE_ADDR		0x310100
 #define REG_WDT_TIMER_CTRL(_n)		(NPU_TIMER_BASE_ADDR + ((_n) * 0x100))
 #define WDT_EN_MASK			BIT(25)
@@ -131,6 +147,12 @@ struct wlan_mbox_data {
 	u32 func_id;
 	union {
 		u32 data;
+		struct {
+			u32 dir;
+			u32 in_counter_addr;
+			u32 out_status_addr;
+			u32 out_counter_addr;
+		} txrx_addr;
 		u8 stats[WLAN_MAX_STATS_SIZE];
 	};
 };
@@ -424,6 +446,30 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	return err;
 }
 
+static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
+				   enum airoha_npu_wlan_get_cmd func_id,
+				   u32 *data, gfp_t gfp)
+{
+	struct wlan_mbox_data *wlan_data;
+	int err;
+
+	wlan_data = kzalloc(sizeof(*wlan_data), gfp);
+	if (!wlan_data)
+		return -ENOMEM;
+
+	wlan_data->ifindex = ifindex;
+	wlan_data->func_type = NPU_OP_GET;
+	wlan_data->func_id = func_id;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
+				  sizeof(*wlan_data));
+	if (!err)
+		*data = wlan_data->data;
+	kfree(wlan_data);
+
+	return err;
+}
+
 static int
 airoha_npu_wlan_set_reserved_memory(struct airoha_npu *npu,
 				    int ifindex, const char *name,
@@ -470,6 +516,15 @@ static int airoha_npu_wlan_init_memory(struct airoha_npu *npu)
 	return airoha_npu_wlan_msg_send(npu, 0, cmd, 0, GFP_KERNEL);
 }
 
+static u32 airoha_npu_wlan_queue_addr_get(struct airoha_npu *npu, int qid,
+					  bool xmit)
+{
+	if (xmit)
+		return REG_TX_BASE(qid + 2);
+
+	return REG_RX_BASE(qid);
+}
+
 struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
 {
 	struct platform_device *pdev;
@@ -574,6 +629,9 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
 	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
 	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
+	npu->ops.wlan_send_msg = airoha_npu_wlan_msg_send;
+	npu->ops.wlan_get_msg = airoha_npu_wlan_msg_get;
+	npu->ops.wlan_get_queue_addr = airoha_npu_wlan_queue_addr_get;
 
 	npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
 	if (IS_ERR(npu->regmap))
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index 58f4ee04e17161acbe513779638c23fe79a83a78..b81bb9398fed9366a18f9bf79e323372969ee138 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -43,6 +43,19 @@ enum airoha_npu_wlan_set_cmd {
 	WLAN_FUNC_SET_WAIT_DEBUG_ARRAY_ADDR,
 };
 
+enum airoha_npu_wlan_get_cmd {
+	WLAN_FUNC_GET_WAIT_NPU_INFO,
+	WLAN_FUNC_GET_WAIT_LAST_RATE,
+	WLAN_FUNC_GET_WAIT_COUNTER,
+	WLAN_FUNC_GET_WAIT_DBG_COUNTER,
+	WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+	WLAN_FUNC_GET_WAIT_WCID_DBG_COUNTER,
+	WLAN_FUNC_GET_WAIT_DMA_ADDR,
+	WLAN_FUNC_GET_WAIT_RING_SIZE,
+	WLAN_FUNC_GET_WAIT_NPU_SUPPORT_MAP,
+	WLAN_FUNC_GET_WAIT_MDC_LOCK_ADDRESS,
+};
+
 struct airoha_npu {
 	struct device *dev;
 	struct regmap *regmap;
@@ -67,6 +80,14 @@ struct airoha_npu {
 					    u32 entry_size, u32 hash,
 					    bool ppe2);
 		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
+		int (*wlan_send_msg)(struct airoha_npu *npu, int ifindex,
+				     enum airoha_npu_wlan_set_cmd func_id,
+				     u32 data, gfp_t gfp);
+		int (*wlan_get_msg)(struct airoha_npu *npu, int ifindex,
+				    enum airoha_npu_wlan_get_cmd func_id,
+				    u32 *data, gfp_t gfp);
+		u32 (*wlan_get_queue_addr)(struct airoha_npu *npu, int qid,
+					   bool xmit);
 	} ops;
 };
 

-- 
2.50.1


