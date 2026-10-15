Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FDDCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 04:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfsP/6oH0zltnAdyQZ1VafpTf7v+axGkkavJD+JKsTM=; b=ojNtnLsoSUkYya4ZX73TNKJMUg
	grSdQhPAhv2pL/98sAid6Vygw9mkGAcziqLulF8FW9X3J/uP3URdLqt9qzX44KNJc3V2mlemW9MrG
	8vjnS1hL+UMS/OhLsd4hyXIDNgWyxBunMbnjpNJ1Nq3itevvgLxWszMCE4+xNRkrYd9usycU/30rF
	jXUT6nZ2tfbxhMavYNaBHBI8k3Dgt1r/OnUvjdv7WZRIPnUmyDh9JeDWn5/gdi+Nv7kfCScuXfhUb
	+suum2ZsCJYbOerDwIl2RQLRzl3bTUiwBqwfYS24leOzMGTXyGw126Z9jPArXhHPJbuxddADwUUn7
	yBw8z4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDWq-0000000GpkD-3CUQ;
	Thu, 15 Oct 2026 04:57:20 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDWn-0000000GpjS-2jAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 04:57:18 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-141395927feso9312824c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040236; x=1792645036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfsP/6oH0zltnAdyQZ1VafpTf7v+axGkkavJD+JKsTM=;
        b=bPfoVX4+Dc264yIFJfBKJClIJSpGsTgchpWkMZ4emerG34PsM6XFunMXdvtWwZ9Uip
         YCFTHmBTpCJ/xkVRZ0zHDH2ds5WjpfGdKk7z1wXntRuW/8Sj26XnmKk7/J2ywOTSHcN3
         4ZxWoljcXC+JAGgVqCbrl7fleIivD3RbGUblrXRk3uwLyfdOj005UiAVnnuuGIJvdRHi
         OD9y7Giv4L+eWTd3ICzKn0OigaTPPbfiOB8gk9Ss7s9gS9nOZrTvTpCr17GLm08lQVgq
         j6velCCHRuMgOBwUHmf61De1L96LtNIiVFFC+QDcUpWwMthWab1+oeb/shWV9stqrpac
         b2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040236; x=1792645036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CfsP/6oH0zltnAdyQZ1VafpTf7v+axGkkavJD+JKsTM=;
        b=l4v8OEH01uHwZDtojFx7dlgFiO5e1wnrfcJ/mkFH4mVkgwYBcLqUBNLmVg0lZp0tCb
         Cro5DHW/fRurNmCqBlBKRmVMLN787y5klgy0On2OVJPdKvQ1nitTX+3q5hUq82Iey0Ll
         /I9mehhPDDJzbDBX09szGlEZP/1rR3pFV01dKFN8oacdUrvtyLMMwqDLhFHjtJ0MXnex
         e8vF04/6adwtKIRMWsH58BnuEUUZR2dg3tsHIePTPO5JPV/n1H5+qw+Jjma9omUzaMar
         UU6oY8T+cd7LwYheaXoQPDmRdhcSENLh0JmWOqSfLgxgJ/9qBobl0MV8TZ256lTbB0He
         tSmg==
X-Forwarded-Encrypted: i=1; AKwUvBy6evrEnRfJxVTiVadxwprbXxcDZxr+Q+8QUrRsJikvhJIQS1gsf8BqRiw8R694UGHh6WF01GGzEQ47sAYeseeH@lists.infradead.org
X-Gm-Message-State: AFq9FYIayfKqQe7KroVV6QI7BVpnQ4wsZsXjPdYbUWH5gpwq/g/uxStz
	5FX1eRyxkETKC5y7U0iCgUrQpObH9+10sgxchGG+0RSZS7uua1H9dIw2
X-Gm-Gg: AYBFou069LVcy7SnwWZHm7kUqz3Qv3d3cZH//6i2mN2lSFGHUvU5JY6W8KVgj7Js8tK
	u+DvWFEjNVFt0syWihlSHBc2NVXBUqasXroxIcuUWeEi0mlnmao/HABoCZU00pmGSTTJCVmja2P
	la4QBo3mHTSTOJrEr8zisJzPx4M+510hY7ZZWOhkXEj5GjJUdYd7i97SH4dLLAiqFjhxpMnRJdY
	b/nytrol0EM6Lo/dZItp2XNzopDIEJY12eIUC/IWY0HT+RGIEDjtzfJW4y8eS8y6gJWYPUFbEUW
	9MDDxnNGbPGir0zABT8/22836daYKnCbWtvOQPifva0N+kVIP1igQYHSBWrieJSmCOKkewO8tn4
	hYUN46tVyDlX/uGg67tP9oERI5lTkdSZhXuwSt2WbM6qzupbMIFVoqexV2uOMHBfhpZPK4J2Zd0
	sU+/V3AIo6Zog7ibo5VHgDGN98T5TeaEz8pB6yhsfSa3LU0K9BKcY52wOfWlCBZ5k253ESkz/jm
	Uv4sHb7rwZT6R2d9eqsfmOnVWtSI4W57+fq9bM=
X-Received: by 2002:a05:693c:2a13:b0:35f:a2ad:603 with SMTP id 5a478bee46e88-35fa2ad06cbmr82431eec.16.1792040236177;
        Wed, 14 Oct 2026 21:57:16 -0700 (PDT)
Received: from nbai25050026.. ([2403:8600:2090:6f:51d7:b8b7:d860:59b2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca329d9sm62391567eec.5.2026.10.14.21.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:57:15 -0700 (PDT)
From: SAYANTAN NANDY <sayantann11@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bread.hsu@airoha.com,
	sayantan.nandy@airoha.com,
	SAYANTAN NANDY <sayantann11@gmail.com>
Subject: [PATCH net v3] net: airoha: keep PPE offload when NPU refuses flow stats
Date: Thu, 15 Oct 2026 10:26:07 +0530
Message-ID: <20261015045607.12999-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008094828.15458-1-sayantann11@gmail.com>
References: <20261008094828.15458-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_215717_685289_5E8A71A6 
X-CRM114-Status: GOOD (  20.84  )
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
set up the counters does not prevent normal PPE offload. Continue PPE
initialization when the NPU refuses the flow-statistics request.

Also treat a zero NPU statistics address returned by the firmware as a
refusal. The host-side DMA buffer (foe_stats_dma) is allocated by
dmam_alloc_coherent() in airoha_ppe_init() from system memory. The NPU
statistics address (npu_stats_addr) is a separate allocation from the
NPU firmware's internal SRAM pool. When that pool is exhausted, the
firmware replies with success and npu_stats_addr = 0. A zero address
does not provide a usable counter region and must not be passed to
devm_ioremap().

When flow stats entries are available, clear PSE_PORT6_SHARE_DIS so
that PSE port 6 (CDM3 path to the NPU) participates in shared-buffer
flow control. PSE_FC_CFG bits 26:16 control per-port whether flow
control considers the shared buffer pool. Bit 22 is port 6.

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

Changes since v2:
- Drop flow_stats_cap entirely (Lorenzo).
- Keep the original airoha_ppe_get_num_stats_entries() checks (Lorenzo).
- Guard airoha_fe_clear() with sram_num_stats_entries > 0 (Lorenzo).
- Replace the error assignment and goto with a direct if check and
  dev_warn() (Lorenzo).

Changes since v1:
- Explain the NPU SRAM allocation separately from the host-side DMA
  buffer (Lorenzo).
- Use airoha_fe_clear() and shorten the warning message (Lorenzo).
- Include hardware testing information requested by netdev-bot.

 drivers/net/ethernet/airoha/airoha_npu.c  |  8 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c  | 10 ++++++----
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 3 files changed, 16 insertions(+), 4 deletions(-)

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
index 92611802801e..74ac3791cb63 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -144,6 +144,9 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 	sram_ppe_num_data_entries =
 		PPE_RAM_NUM_ENTRIES_SHIFT(sram_ppe_num_data_entries);
 
+	if (sram_num_stats_entries > 0)
+		airoha_fe_clear(eth, PSE_FC_CFG, PSE_PORT6_SHARE_DIS);
+
 	for (i = 0; i < eth->soc->num_ppe; i++) {
 		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
 			     ppe->foe_dma + sram_tb_size);
@@ -1454,10 +1457,9 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 
 	ppe_num_stats_entries = airoha_ppe_get_total_num_stats_entries(ppe);
 	if (ppe_num_stats_entries > 0) {
-		err = npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
-					      ppe_num_stats_entries);
-		if (err)
-			goto error_npu_put;
+		if (npu->ops.ppe_init_stats(npu, ppe->foe_stats_dma,
+					    ppe_num_stats_entries))
+			dev_warn(eth->dev, "NPU refused flow stats\n");
 	}
 
 	airoha_ppe_hw_init(ppe);
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


