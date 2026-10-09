Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A5CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=; b=DxGI+sZihLylaKtzISxRIZeui/
	PkRmfgspKKqEA/k6BHglXZP4Sry0MzUZnDQX4mEOtUV1cowdnQkPIkHsrmvJohSazgdDLFomHLGiZ
	s7SqLg8+o+2+GhmHQx4Osddiq3yP6eQx2OOr+neUEhIrQQ0aPvPdDLpD1ajl2KYx9b7NQTx1mW3O/
	NxAHa4JbTpu1Bn+7ec6yPIuMafyydn2LZg5Li+dH8n9G17JkqhUE/aYJkBsZ+aV2zFOGlBx4TEFR8
	6mIlAZjMjTRDdE0UZrzbhWJuus52Rdt+LGPQx/x2wBcdSFwLLW8xbfXpK6/YMYq9rrvAthUZXTZaC
	i5fQXGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2nB-00000005VF5-32eI;
	Fri, 09 Oct 2026 05:05:13 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2n9-00000005VEK-06ed
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:05:12 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-34bb8b31647so9309007eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522310; x=1792127110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=;
        b=s6kxWZ4ZgSzXDrwjYKa4NLJ+gRrwjgRofSq2qtD4fVMxZL+IFhddWXf//ymkBRGMwp
         /oDenKW1W3ei7ilYTvYrxH/pjPS3DNnvRQ4OeFt9HmWGMaDdjH7sZy3dhziSStbIXZTd
         jjLA6X32jexRmIsh0cSXE5uPvF4gAB2HUbd2Jujkkuf3KWFhgsQkUjvGrHENGmDu4B3w
         MY4KVvQ2oUqbWYYFbm90fsopJegJcJkc84KZDm2v/pIOcPpaVdzlAhbWn+dR6ocaSfEz
         xj6csqmjzfBzceKQk7tI2JlLx9z2KdaUP80ZCfcsm7lUk/vANHOVThhIC7x0hfTT0mE6
         wPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522310; x=1792127110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDt8xmkCjT/Lgq2VDXDSaI4X0hERcMtPjm6ARB67S9I=;
        b=xtOpmyfZ+0UXNbH+gtud5Ijfr8650I2tXRyphAVuwxcjIp+G3HCVmAjm9UqvmEJUgq
         XZDO/S9aPKadkPbT2oYpCmmXqPxKohTpN0aG5QI3k2yg3GNd/nc6tFMMYgcdfm16Yihh
         dOVoDjvTBO03WRJutWsHnf6mRqEoeZyZ9JNkjzvyL5exYu0GU4d7Vc9MhSt9TyXEO3YD
         +EmLBsfNSKRVTytrausGL0qCVBUrOsefk+0apO3CU2k2o9MC22NO5YIogNkwkeSkHzDC
         nB5dMUFS7DmP4vvevKSYrLmudkfbHGk+WGyHmcV8FBLQMa+WruZbKE0rJt15uskQujGl
         bfOg==
X-Forwarded-Encrypted: i=1; AKwUvBxbuA3PuhKmwuCWcHjppJvgu/mrXYefHxM5LFJjpzmNeSukRpkYF4hxLi+QUe2OvHLtyrolWXNT/HoUdprt0JWQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJIzkxvdwq+VnFSe6hhITWDcyiBr7suE9XJKOvAVojEqIxfqyta
	PVeQMRdG+7zGDq/fpVuN3/bmEwnOPJFNMENwQ+MTZ8nhZQuYwCV+yCd0
X-Gm-Gg: AYBFou12tthVYU749YUtzOvScx202Ds59qp/XyGslfNogd4jPzZ4Btv1oeTYIZlHRH8
	IkJwR3NHxlruSxRIZr1/uxXju5mnaJoOL+hFN4XnR+EvUkMlJbGFWEf8w4qYdcKff6t+oVGUuWv
	qQUFnDRtufIp7jZX3oKXMJxocGhfff8K+L45PW50ndu/d8XTWFygsi+7dix8wIMW1ltBbp787CO
	+EHhFbRDOROdWFsQ9exYjEhKmxFQ5+eIOkRmNRgtIbFnUtKq+T//y+BAghpf+9BrgSzvDU6w/K9
	cQqtLphJTsSA2hri4ZPvNa+jt8vdnnQa/YwbgJRl8E+5gTEkmPPwZginGMcYZNMhinOIxzP2yXM
	OGYgLxq6qGa75aCVztFhHeTgb0lvq2l27HHJbkz4NY4n8gCQ0/vzcMb6YEQWWccvsGUr96FVch2
	noHt4/h0/+3a+dJYUkalT/dbP56ClphhWUZSCrbCgmeYHlQPhZLEDwJEScodwDzpyB1jiG9/Ijx
	H45dU3KvevAqH6pB8eV0jB12WfQrCXLXEH7kLFYX0V+Ya2s/g==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr1908803eec.19.1791522309753;
        Thu, 08 Oct 2026 22:05:09 -0700 (PDT)
Received: from nbai25050026.. ([2403:8600:2090:6f:a2c1:990e:e510:6920])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab786fsm3505072eec.19.2026.10.08.22.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:05:09 -0700 (PDT)
From: SAYANTAN NANDY <sayantann11@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bread.hsu@airoha.com,
	sayantan.nandy@airoha.com,
	SAYANTAN NANDY <sayantann11@gmail.com>
Subject: [PATCH net v2] net: airoha: keep PPE offload when NPU refuses flow stats
Date: Fri,  9 Oct 2026 10:33:22 +0530
Message-ID: <20261009050322.39060-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008094828.15458-1-sayantann11@gmail.com>
References: <20261008094828.15458-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_220511_102509_64339C70 
X-CRM114-Status: GOOD (  23.23  )
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
refusal. The host-side DMA buffer (foe_stats_dma) is allocated by
dmam_alloc_coherent() in airoha_ppe_init() from system memory. The NPU
statistics address (npu_stats_addr) is a separate allocation from the
NPU firmware's internal SRAM pool. When that pool is exhausted, the
firmware replies with success and npu_stats_addr = 0. A zero address
does not provide a usable counter region and must not be passed to
devm_ioremap().

When flow stats are available, clear PSE_PORT6_SHARE_DIS so that PSE
port 6 (CDM3 path to the NPU) participates in shared-buffer flow
control, which the counter traffic path needs.

When flow statistics are unavailable, PPE continues to operate without
NPU flow counters while retaining normal offload functionality.

This combines the original SmartRG/Airoha fixes for:
- keeping PPE offload active when the NPU refuses flow statistics
- treating a zero NPU statistics address as a flow-statistics refusal

Based on the original SmartRG/Airoha work by Chad Monroe:
5ce96ab ("SDG-9458: keep PPE offload when NPU refuses flow stats")
0ad8528 ("SDG-9458: airoha: treat a zero NPU stats address as a refusal")
Fixes: b81e0f2b58be ("net: airoha: Add FLOW_CLS_STATS callback support")
Tested-on: AN7581 with MT7992
Signed-off-by: Chad Monroe <chad@monroe.io>
Signed-off-by: SAYANTAN NANDY <sayantann11@gmail.com>
---

Changes since v1:
- Rename flow_stats to flow_stats_cap (Lorenzo).
- Explain that npu_stats_addr is an NPU firmware SRAM allocation,
  distinct from the host-side foe_stats_dma buffer (Lorenzo).
- Explain why PSE_PORT6_SHARE_DIS is cleared for counter traffic
  (Lorenzo).
- Use airoha_fe_clear() and shorten the warning message (Lorenzo).
- Add hardware testing information requested by netdev-bot.

 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c  |  8 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 17 +++++++++++------
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8277c1c87bb3..da4a3ba69e3c 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -617,6 +617,7 @@ struct airoha_ppe {
 
 	void *foe;
 	dma_addr_t foe_dma;
+	bool flow_stats_cap;
 
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
index 92611802801e..0957f331478a 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -37,10 +37,7 @@ static const struct rhashtable_params airoha_l2_flow_table_params = {
 
 static int airoha_ppe_get_num_stats_entries(struct airoha_ppe *ppe)
 {
-	if (!IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS))
-		return -EOPNOTSUPP;
-
-	if (airoha_is_7583(ppe->eth))
+	if (!ppe->flow_stats_cap)
 		return -EOPNOTSUPP;
 
 	return PPE_STATS_NUM_ENTRIES;
@@ -144,6 +141,9 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 	sram_ppe_num_data_entries =
 		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
 
+	if (ppe->flow_stats_cap)
+		airoha_fe_clear(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS);
+
 	for (i = 0; i < eth->soc->num_ppe; i++) {
 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
 			     ppe->foe_dma + sram_tb_size);
@@ -1456,8 +1456,11 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	if (ppe_num_stats_entries > 0) {
 		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
 					      ppe_num_stats_entries);
-		if (err)
-			goto error_npu_put;
+		if (err) {
+			dev_warn(eth->dev, "NPU refused flow stats (%d)\n",
+				 err);
+			ppe->flow_stats_cap = false;
+		}
 	}
 
 	airoha_ppe_hw_init(ppe);
@@ -1608,6 +1611,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	ppe->dev.priv = ppe;
 	ppe->eth = eth;
 	eth->ppe = ppe;
+	ppe->flow_stats_cap = IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS) &&
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


