Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149BBCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xX55VUfzLKlrT3hfK4oyi6LOjpzbgNl+xyMCeoTYMs=; b=joBaQGDut2av2A4ioELJ1f9HN6
	YF1egwi31eZHaXcW4PNFte9Z93Qw1Um5KCKh9BXFjf6rldrjgqRn6OqLHiRXlL4CHUWHc2W/i5XLm
	Vw0k1kH19EZ9XhNe147MHZoJy5aJCRgnwNXyOivZr4JC7T1tBGBNg9YhKM/Hyu60DMZUoPKdO045S
	MsZxJK1PE/G/VUVI3jcPURv+RNTALgiSWhmqFbjAwOysxE8E5OPukZkf0asK7zFf1ys8L6Lpt5Id/
	GfHgGsRRcr5NVyywlBrBKJ/VBeuVh0MTxdpM2Eaqjl7tt0qZrnZSmODolnWmfbAhwgcDgULVvzKfz
	0HMix4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkjx-000000042BK-3wBL;
	Thu, 08 Oct 2026 09:48:41 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkjw-000000042Ac-0Qid
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:48:41 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-141395927feso4464509c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452919; x=1792057719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xX55VUfzLKlrT3hfK4oyi6LOjpzbgNl+xyMCeoTYMs=;
        b=J2oAA4WzS/WJ0Wiv93Og1ZoQqrIH6ZOfGsQ38k9ryInWWZfsoiqUdl4lnXtHoGsabm
         0KO0x4NXT0BnGKrSV6GZcrLdtVoiV/C87t9CLssV8yrWyt+4W4I2JKs3v6ySjn3aoZZa
         cFdzR0vmreLZRyDkDXdQtNDX8oPS4Imj6mrv/ahVq/b1USvgv41HdHyXMtc0NhNV2AdL
         DPCxXngVlqOXAr7G9Tc4OLQ92nUlS1yFonwcqPxSAGmCbgZ+hqkPazI3zi3wov4sR7zw
         ecY0qHCeXXUANOdABiIahYx/+9YR4t1lkNBBbbiSXJZA0ZJbAOUfiWwLBbbh0eQAyJbj
         z8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452919; x=1792057719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xX55VUfzLKlrT3hfK4oyi6LOjpzbgNl+xyMCeoTYMs=;
        b=rGB6P+zbqBXRzur1X52gGHNLUED5t5AE0hNG++BWL8KTInTc5bgQyZG4I54C5AlG2D
         ugEdMg4qIVaH3htfhQhlszJmar06ujwz3A7s+OCbey2DXtnmFSxSc3QFlnxu1Ylq449c
         mGfvXXmjWUDVF2OX/1aqMBnU6Y3yE8w5+alohkQzCgGk4XEBkQRG2fsQ0shAWIJTFNmA
         uzdsIq/juOaBYkIsTTDwyj3+SoKfzBeAzks3GydmwE70gOAUq9+cgyzAQ5vVyWDMSktt
         Y33uWnYvySwfbGueTqUQlCk20myyqTvoVgQywyesgqdKAp1pkBmqqrLFmIdPLSsw8/S1
         Y5gg==
X-Forwarded-Encrypted: i=1; AKwUvBw76i+MiMjAZ1E6yBx2tlAl+WvoTdW/1kcGxcIxg4faL0kxVJPxf0zKS9eMgXuKqOztOLBo4pdTlEVpjRvOhN1p@lists.infradead.org
X-Gm-Message-State: AFuF++kB7PtC9DCpAt2jgID558rDJd/aaPeirBjeRa/EyFT/WZhWmZQF
	awQ0AMb7peaaly8SknYg9Uw53baL3HxjSFVbSz/0PorsaL7gA7QvV6s1Cu8W8oCd
X-Gm-Gg: AYBFou3IjpkuGYxlY+Kx3BRdram4FZ7ZynPrc5TLvsjlUlNYdggh3egCIAASqCVcis/
	o6A0HthR7vQlGrKKppk8F8Wa3O53IGcihr247d0WwLgXOOMb12+EPnh+J8YzaN7aq3WPxWcF3K6
	0wMGqpVB22EPLCvp1F9jvE/SDQYKaNcuIiLJi67y8vF87pHdF8dua/nHNt79uq+5pzriCAQvlYy
	a8haLpUO2Ex9r4G7lDbyk8d2zcgYesTEg9tsPZhjOa2ogTtneKljhNXTk93wLU1dAdaTSCeSOnt
	2Y1hUMUVxwVk07RHP0lHuaYtk2jJiOIaE2ZzixKCtCfYYi9FntmOjGl0P2niQZeddlPwJCGXUT3
	qj3xjt1AEd7UEi2iRlCBVtj1E00mP7eQ8QUh6QXp5R1D5t3Rs1Aqf8Ohp2hXDU0qWOBsDBI/FR9
	ieG6ME4Us8tCcPmVq4HS/PWqi4tSkNiZ8lNMXZ4iucts5Dub8TrkW4Q54g28NgVZ69o5dPOJr/9
	ZEsroUsRnelCy3cJYhU7DA3H33RFhsTd0WS2OScAMVP0wVrfg==
X-Received: by 2002:a05:7022:3d10:b0:143:297c:82e0 with SMTP id a92af1059eb24-16206c267aamr7410634c88.32.1791452918834;
        Thu, 08 Oct 2026 02:48:38 -0700 (PDT)
Received: from nbai25050026.. ([2403:8600:2090:6f:26c1:d3cd:9bcc:c4d3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616a49546fsm13107565c88.18.2026.10.08.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:48:38 -0700 (PDT)
From: SAYANTAN NANDY <sayantann11@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bread.hsu@airoha.com,
	sayantan.nandy@airoha.com,
	SAYANTAN NANDY <sayantann11@gmail.com>
Subject: [PATCH net] net: airoha: keep PPE offload when NPU refuses flow stats
Date: Thu,  8 Oct 2026 15:18:28 +0530
Message-ID: <20261008094828.15458-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_024840_150256_C555704D 
X-CRM114-Status: GOOD (  20.73  )
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

From: Chad Monroe <chad@monroe.io>

With flow stats enabled, PPE offload setup requests flow statistics
from the NPU. If the running NPU firmware does not support flow
counters, the request fails and the current setup path aborts PPE
offload.

Treat flow statistics as an optional capability so that a failure to
set up the counters does not prevent normal PPE offload. Record
whether flow statistics are available and continue PPE initialization
when the NPU refuses the flow-statistics request.

Also treat a zero NPU statistics address returned by the firmware as a
refusal. A zero address does not provide a usable counter region and
must not be passed to the address mapping path.

When flow statistics are unavailable, PPE continues to operate
without NPU flow counters while retaining normal offload functionality.

This combines the original SmartRG/Airoha fixes for:
- keeping PPE offload active when the NPU refuses flow statistics
- treating a zero NPU statistics address as a flow-statistics refusal

Based on the original SmartRG/Airoha work by Chad Monroe:
5ce96ab ("SDG-9458: keep PPE offload when NPU refuses flow stats")
0ad8528 ("SDG-9458: airoha: treat a zero NPU stats address as a refusal")
Fixes: b81e0f2b58be ("net: airoha: Add FLOW_CLS_STATS callback support")
Signed-off-by: Chad Monroe <chad@monroe.io>
Signed-off-by: SAYANTAN NANDY <sayantann11@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c  |  8 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 20 +++++++++++++-------
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 4 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8277c1c87bb3..bd5a94fce843 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -617,6 +617,7 @@ struct airoha_ppe {
 
 	void *foe;
 	dma_addr_t foe_dma;
+	bool flow_stats;
 
 	struct rhashtable l2_flows;
 
diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00f7..b32a01dbe06b 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -450,6 +450,14 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	if (err)
 		goto out;
 
+	/* The firmware reports success with a zero address when its SRAM
+	 * pool has no room left for the counters.
+	 */
+	if (!ppe_data->stats_info.npu_stats_addr) {
+		err = -ENOSPC;
+		goto out;
+	}
+
 	npu->stats = devm_ioremap(npu->dev,
 				  ppe_data->stats_info.npu_stats_addr,
 				  size);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..fbc200614de3 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -37,10 +37,7 @@ static const struct rhashtable_params airoha_l2_flow_table_params = {
 
 static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe)
 {
-	if (!IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS))
-		return -EOPNOTSUPP;
-
-	if (airoha_is_7583(ppe->eth))
+	if (!ppe->flow_stats)
 		return -EOPNOTSUPP;
 
 	return PPE_STATS_NUM_ENTRIES;
@@ -144,6 +141,10 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 	sram_ppe_num_data_entries =
 		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
 
+	if (ppe->flow_stats)
+		airoha_fe_rmw(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS,
+			      FIELD_PREP(PSE_PORT6_SHARE_DIS, 0));
+
 	for (i = 0; i < eth->soc->num_ppe; i++) {
 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
 			     ppe->foe_dma + sram_tb_size);
@@ -1456,10 +1457,13 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	if (ppe_num_stats_entries > 0) {
 		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
 					      ppe_num_stats_entries);
-		if (err)
-			goto error_npu_put;
+		if (err) {
+			dev_warn(eth->dev,
+				 "NPU firmware refused flow stats setup (%d), offload runs without flow counters\n",
+				 err);
+			ppe->flow_stats = false;
+		}
 	}
-
 	airoha_ppe_hw_init(ppe);
 	airoha_ppe_foe_flow_stats_reset(ppe, npu);
 
@@ -1608,6 +1612,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	ppe->dev.priv = ppe;
 	ppe->eth = eth;
 	eth->ppe = ppe;
+	ppe->flow_stats = IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS) &&
+			  !airoha_is_7583(eth);
 
 	ppe_num_entries = airoha_ppe_get_total_num_entries(ppe);
 	foe_size = ppe_num_entries * sizeof(struct airoha_foe_entry);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 442b48c9b991..aee06c058586 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -72,6 +72,8 @@
 #define PSE_CFG_OQ_RSV_MASK		GENMASK(13, 0)
 
 #define PSE_FQ_CFG			0x008c
+#define PSE_FC_CFG			0x0098
+#define PSE_PORT6_SHARE_DIS		BIT(22)
 #define PSE_FQ_LIMIT_MASK		GENMASK(14, 0)
 
 #define REG_FE_PSE_BUF_SET		0x0090
-- 
2.43.0


