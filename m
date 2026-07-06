Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8602DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bxo/RBici1KHmWo5VMuoBPKotHXzJ2Oo7XpCXsYzf3Q=; b=U7XizZfutAlFiZafTaViipF68P
	C1UJwKkpI07BGC1LLK3LsU6O1Pdz8K9FuivkjMZmLjWl5YK8xU/1eoOcJNZktvzPr6EzCg0hitJJX
	AzWSYIZuOCtDYCai3RQtBLQW1nnzF4GMWMO/ZCBS0jSGm/YJU6v4EF6bofPWQ0sJ5LQze/Tr59fJe
	ooHakSDXdrx41v0ry76r41L/pswq89cistrUd4usfAQwXz4uKWj47HfBefwOUfw3AkERAYLMLtM1N
	cMa5bJCIMJbiYy/mptPc2LNruhsd0vJpcoOLfaVu312ZchXbJXV4kMnCxei3GiWETkB/lFV1wJeuM
	wVpQkYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXz-0000000Cwf1-4B3F;
	Mon, 06 Jul 2026 15:47:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXq-0000000CwYn-2Asr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:47:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2924177b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783352861; x=1783957661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bxo/RBici1KHmWo5VMuoBPKotHXzJ2Oo7XpCXsYzf3Q=;
        b=Dk0nLhoqgkxfsBCfsXE75MDIpap4Y0LRh29MMNutybZWScvAOIIpFax6GtERCzp4SE
         AYvP4MMGpiCejasXZ8oy9k3F9ERb8Qo7bSHu7SRK82G0GfKznBfVq4rKYrC/LihvNFMK
         6vNdCxUGuo9AkZG4qMQKfSYLJ9Pa7b1b3FXanD51LxdnxxZJ6ne6scr+L/BwefnjtEvd
         R4QiUCOdGSWR5nq4gU5tWBEhL9VmpEdyymTYoi7K9dXMF7QlvzjF2sGPEb0baTZ0eMFo
         OyiQcCRlER3NEO+fRu4X8cOPh6qVHQjAWV2OL8omFalPkHh3NYZEeb7Bwkvt1v4jtWQk
         sSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352861; x=1783957661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxo/RBici1KHmWo5VMuoBPKotHXzJ2Oo7XpCXsYzf3Q=;
        b=mF44ZEzdXy/woK9bcVdrkEkrQWorMqp93iCS7nJsLsL9ZtuuDNtTWmpaAc3d3AgWv4
         oqIACVSroi6dhpT23SZXf1ZvnfUKjnLmo5cXeW5xQbHkezDbx74MeBRjUtBB6QBVGw1f
         bQXF/hR35fibeCQ+Uvym5tN7tqqVpAnP/xEXvMVbicsBsjDzssIH93kMZqdmxDZBhGY3
         MAmw612Tyv+8/tAau0XFYdjp2w2J1B0qGAOEuZDwNqrezkhjtpi7zi3cLBcZd4baAicM
         n5lQsvD7buGVk1MyDzTQmx4Y7QiOhUJGAydbI2gw0O2FdOhkVhJUrjV+p8u+O/mKOI3k
         Qo8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8mXIlBAgGT3SwQ23CITfr1u2Nj4HHwQfILk9QqA7nNzHqcXwHfL50fgEFFwTNyjZld9mJgjSn/GMwrQnMkwGJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+VmC6HFzDmQ8bhgR4v0qpMkb8yOX9mHnpwgLYfcghVlRhbXd
	SG5M3OdBLjJkGPMlhcKS1bxhOBpEr/A44vN68QJWMqjsA7wic5h2DgE6
X-Gm-Gg: AfdE7cmD2qBbXSL3g1crxtReoeKPoLwjxy0HoipTv8Xidy0ieHtWIg4TmyRlfYoUC7s
	TPGCmhOHAifUQJlA+Dk5iOTExOIDTuHor4Gi/qOdX7yZ8gvRsCCWle74ALpFrnvQza1m3Pyq1xx
	bbA/P834WKQcAoQNvKXWuUAPFtcq9bt7j3MYXqoPN5/VVdEjI5CinQ4Njpf9STIFcHbVj+7R+YA
	PkrnmUS7r9HSEVZ40T4iivJffpzKFiVZuKR76onTMS8AGM+cWNLt0x5QmA1/puXiMEj+BW+n0Nb
	w5lvDG6Osp/gPNziZSk/6NlSmY4wr9VmzXMoUu/xiK6GtvTDmqjaffGaFFPer5EdjbK4wyWu49J
	kLKd2UKwVN+34EF7dsEc4zzG7ioVtdnSV/BybYjH1+GQE04BCfB99ViW6XyEJAC+Fo5t7/YcnEK
	EUdGAkyqyEKUA+hAFnkO/oS+w=
X-Received: by 2002:a05:6a21:7a43:b0:3bf:a0e5:999a with SMTP id adf61e73a8af0-3c08ef5aa6fmr1432511637.48.1783352861289;
        Mon, 06 Jul 2026 08:47:41 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:1840:f07b:ed1c:fca2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm56885602c88.6.2026.07.06.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:47:40 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: netdev@vger.kernel.org,
	lorenzo@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aniket.negi@airoha.com,
	kuldeep.malik@airoha.com,
	Aniket Negi <aniket.negi03@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] net: airoha: fix MIB stats collection to be lossless
Date: Mon,  6 Jul 2026 21:17:30 +0530
Message-ID: <20260706154730.36949-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084742_592549_087992DC 
X-CRM114-Status: GOOD (  19.68  )
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

REG_FE_GDM_MIB_CLEAR after every read creates a race window where
packets arriving between read and clear are lost from statistics.

Switch to a delta-based approach instead:

- 64-bit H+L registers (ok pkts/bytes, E64..L1023): read absolute
  hardware total directly; use a local variable and max(new, old)
  clamping to prevent intermediate visibility and torn-read regression.

- 32-bit registers (drops, bc, mc, errors, runt, long): accumulate
  (u32)(curr - prev) into a 64-bit software counter; unsigned
  subtraction handles wrap-around transparently.

- tx/rx_len[0] ([0,64] bucket): combines RUNT_CNT (32-bit, delta via
  tx_runt/rx_runt) and E64_CNT (64-bit, absolute) into a single
  assignment using a local accumulator to avoid double-counting.

Clear MIB counters once in airoha_fe_init() to establish a clean
baseline, preventing spurious stats from pre-driver activity (kexec,
driver rebind, warm reboot).

Merge airoha_dev_get_hw_stats() into airoha_update_hw_stats() and
move stats_lock inside. Plain spin_lock() is correct: the function
is only called from ndo_get_stats64() in process context. Each dev
refreshes only its own MIB counters; sibling devs on a shared GDM3/4
port are polled when their own netdev is queried.

Fixes: 8f4695fb67b2 ("net: airoha: better handle MIBs for GDM ports with multiple devs attached")
Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v4:
- Add max(new, old) clamping for 64-bit H+L register pairs to ensure
  monotonically non-decreasing stats despite torn reads between H and L
- Use local variable (tmp) for all 64-bit H+L computations to prevent
  lockless readers from seeing intermediate values during piecewise write
- Add one-shot MIB counter clear in airoha_fe_init() to establish a
  clean baseline (kexec, driver rebind, warm reboot)
- Document sibling dev polling design in commit message

Changes in v3:
- Link to V2: https://lore.kernel.org/20260701173941.314795-1-aniket.negi03@gmail.com/
- Add Acked-by tag from Lorenzo
- Rename from tx_runt_cnt to tx_runt, tx_long_cnt to tx_long,
  tx_runt_accum64 to tx_runt64
- Rename from rx_runt_cnt to rx_runt, rx_long_cnt to rx_long,
  rx_runt_accum64 to rx_runt64
- Condense the marked comments in V2, remove new line after comment

Changes in v2:
- Store _CNT_L register reads in val before adding to stats, improving
  readability (suggested by Lorenzo Bianconi)
- Fix double-counting bug in the RUNT+E64 combined bucket: previously
  "+=" for E64 re-added the full absolute counter each poll; now a
  dedicated tx_runt_accum64/rx_runt_accum64 accumulator holds the
  running RUNT delta, and tx_len[0] is assigned (not accumulated) each
  poll as runt_accum64 + E64_abs
- Replace 7-element tx_len[]/rx_len[] shadow arrays in mib_prev with
  focused tx_runt_cnt/tx_long_cnt and rx_runt_cnt/rx_long_cnt fields;
  only RUNT and LONG are 32-bit and need wrap-around tracking
- Rename inner struct hw_prev_stats to mib_prev; rename accumulator
  fields to tx_runt_accum64/rx_runt_accum64 for clarity
- Fix comment alignment in mib_prev struct block
- Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats() and
  move the port spin_lock inside, removing the separate wrapper

 drivers/net/ethernet/airoha/airoha_eth.c | 183 +++++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h |  27 ++++
 2 files changed, 144 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..2d032cc6dfca 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -493,6 +493,8 @@ static void airoha_fe_crsn_qsel_init(struct airoha_eth *eth)
 
 static int airoha_fe_init(struct airoha_eth *eth)
 {
+	int i;
+
 	airoha_fe_maccr_init(eth);
 
 	/* PSE IQ reserve */
@@ -586,6 +588,14 @@ static int airoha_fe_init(struct airoha_eth *eth)
 	/* enable 1:N vlan action, init vlan table */
 	airoha_fe_set(eth, REG_MC_VLAN_EN, MC_VLAN_EN_MASK);
 
+	/* Clear MIB counters to establish clean baseline for delta tracking.
+	 * This prevents spurious statistics from pre-driver activity (e.g.,
+	 * kexec, driver rebind, warm reboot) on first poll.
+	 */
+	for (i = AIROHA_GDM1_IDX; i <= AIROHA_GDM4_IDX; i++)
+		airoha_fe_set(eth, REG_FE_GDM_MIB_CLEAR(i),
+			      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
+
 	return airoha_fe_mc_vlan_clear(eth);
 }
 
@@ -1686,11 +1696,14 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 	}
 }
 
-static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
+static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 {
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_eth *eth = dev->eth;
 	u32 val, i = 0;
+	u64 tmp, prev;
+
+	spin_lock(&port->stats_lock);
 
 	/* Read relevant MIB for GDM with multiple port attached */
 	if (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)
@@ -1701,152 +1714,190 @@ static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
 
 	u64_stats_update_begin(&dev->stats.syncp);
 
-	/* TX */
+	/* TX - 64-bit H+L registers: hw accumulates the total, read directly.
+	 * Use local variable to prevent readers from seeing intermediate values.
+	 * Clamp to prevent regression from torn reads between H and L.
+	 */
+	prev = dev->stats.tx_ok_pkts;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	dev->stats.tx_ok_pkts += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	dev->stats.tx_ok_pkts += val;
+	tmp |= val;
+	dev->stats.tx_ok_pkts = max(tmp, prev);
 
+	prev = dev->stats.tx_ok_bytes;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	dev->stats.tx_ok_bytes += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	dev->stats.tx_ok_bytes += val;
+	tmp |= val;
+	dev->stats.tx_ok_bytes = max(tmp, prev);
 
+	/* TX - 32-bit registers: accumulate delta to handle wrap-around. */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_DROP_CNT(port->id));
-	dev->stats.tx_drops += val;
+	dev->stats.tx_drops += (u32)(val - dev->stats.mib_prev.tx_drops);
+	dev->stats.mib_prev.tx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_BC_CNT(port->id));
-	dev->stats.tx_broadcast += val;
+	dev->stats.tx_broadcast += (u32)(val - dev->stats.mib_prev.tx_broadcast);
+	dev->stats.mib_prev.tx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_MC_CNT(port->id));
-	dev->stats.tx_multicast += val;
+	dev->stats.tx_multicast += (u32)(val - dev->stats.mib_prev.tx_multicast);
+	dev->stats.mib_prev.tx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_RUNT_CNT(port->id));
-	dev->stats.tx_len[i] += val;
+	dev->stats.mib_prev.tx_runt64 +=
+		(u32)(val - dev->stats.mib_prev.tx_runt);
+	dev->stats.mib_prev.tx_runt = val;
 
+	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute). */
+	tmp = dev->stats.mib_prev.tx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp += ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp += val;
+	dev->stats.tx_len[i++] = tmp;
 
+	prev = dev->stats.tx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp |= val;
+	dev->stats.tx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.tx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp |= val;
+	dev->stats.tx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.tx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp |= val;
+	dev->stats.tx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.tx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp |= val;
+	dev->stats.tx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.tx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	tmp |= val;
+	dev->stats.tx_len[i++] = max(tmp, prev);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += (u32)(val - dev->stats.mib_prev.tx_long);
+	dev->stats.mib_prev.tx_long = val;
 
 	/* RX */
+	prev = dev->stats.rx_ok_pkts;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	dev->stats.rx_ok_pkts += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	dev->stats.rx_ok_pkts += val;
+	tmp |= val;
+	dev->stats.rx_ok_pkts = max(tmp, prev);
 
+	prev = dev->stats.rx_ok_bytes;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	dev->stats.rx_ok_bytes += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	dev->stats.rx_ok_bytes += val;
+	tmp |= val;
+	dev->stats.rx_ok_bytes = max(tmp, prev);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_DROP_CNT(port->id));
-	dev->stats.rx_drops += val;
+	dev->stats.rx_drops += (u32)(val - dev->stats.mib_prev.rx_drops);
+	dev->stats.mib_prev.rx_drops = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_BC_CNT(port->id));
-	dev->stats.rx_broadcast += val;
+	dev->stats.rx_broadcast += (u32)(val - dev->stats.mib_prev.rx_broadcast);
+	dev->stats.mib_prev.rx_broadcast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_MC_CNT(port->id));
-	dev->stats.rx_multicast += val;
+	dev->stats.rx_multicast += (u32)(val - dev->stats.mib_prev.rx_multicast);
+	dev->stats.mib_prev.rx_multicast = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ERROR_DROP_CNT(port->id));
-	dev->stats.rx_errors += val;
+	dev->stats.rx_errors += (u32)(val - dev->stats.mib_prev.rx_errors);
+	dev->stats.mib_prev.rx_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_CRC_ERR_CNT(port->id));
-	dev->stats.rx_crc_error += val;
+	dev->stats.rx_crc_error += (u32)(val - dev->stats.mib_prev.rx_crc_error);
+	dev->stats.mib_prev.rx_crc_error = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OVERFLOW_DROP_CNT(port->id));
-	dev->stats.rx_over_errors += val;
+	dev->stats.rx_over_errors += (u32)(val - dev->stats.mib_prev.rx_over_errors);
+	dev->stats.mib_prev.rx_over_errors = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_FRAG_CNT(port->id));
-	dev->stats.rx_fragment += val;
+	dev->stats.rx_fragment += (u32)(val - dev->stats.mib_prev.rx_fragment);
+	dev->stats.mib_prev.rx_fragment = val;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_JABBER_CNT(port->id));
-	dev->stats.rx_jabber += val;
+	dev->stats.rx_jabber += (u32)(val - dev->stats.mib_prev.rx_jabber);
+	dev->stats.mib_prev.rx_jabber = val;
 
 	i = 0;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_RUNT_CNT(port->id));
-	dev->stats.rx_len[i] += val;
+	dev->stats.mib_prev.rx_runt64 +=
+		(u32)(val - dev->stats.mib_prev.rx_runt);
+	dev->stats.mib_prev.rx_runt = val;
 
+	/* rx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute). */
+	tmp = dev->stats.mib_prev.rx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp += ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp += val;
+	dev->stats.rx_len[i++] = tmp;
 
+	prev = dev->stats.rx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp |= val;
+	dev->stats.rx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.rx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp |= val;
+	dev->stats.rx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.rx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp |= val;
+	dev->stats.rx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.rx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp |= val;
+	dev->stats.rx_len[i++] = max(tmp, prev);
 
+	prev = dev->stats.rx_len[i];
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	tmp = ((u64)val << 32);
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	tmp |= val;
+	dev->stats.rx_len[i++] = max(tmp, prev);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_LONG_CNT(port->id));
-	dev->stats.rx_len[i++] += val;
+	dev->stats.rx_len[i] += (u32)(val - dev->stats.mib_prev.rx_long);
+	dev->stats.mib_prev.rx_long = val;
 
 	u64_stats_update_end(&dev->stats.syncp);
-}
-
-static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
-{
-	struct airoha_gdm_port *port = dev->port;
-	int i;
-
-	spin_lock(&port->stats_lock);
-
-	for (i = 0; i < ARRAY_SIZE(port->devs); i++) {
-		if (port->devs[i])
-			airoha_dev_get_hw_stats(port->devs[i]);
-	}
-
-	/* Reset MIB counters */
-	airoha_fe_set(dev->eth, REG_FE_GDM_MIB_CLEAR(port->id),
-		      FE_GDM_MIB_RX_CLEAR_MASK | FE_GDM_MIB_TX_CLEAR_MASK);
 
 	spin_unlock(&port->stats_lock);
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..fe934f9ffe8a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -245,6 +245,33 @@ struct airoha_hw_stats {
 	u64 rx_fragment;
 	u64 rx_jabber;
 	u64 rx_len[7];
+
+	struct {
+		/* Previous HW register values for 32-bit counter delta
+		 * tracking. Storing the last seen value and accumulating
+		 * (u32)(curr - prev) into the 64-bit software counter
+		 * handles wrap-around transparently via unsigned arithmetic.
+		 * tx_runt64/rx_runt64 hold the running sum of runt deltas.
+		 * These fields are never reported to userspace.
+		 */
+		u32 tx_drops;
+		u32 tx_broadcast;
+		u32 tx_multicast;
+		u32 tx_runt;
+		u32 tx_long;
+		u64 tx_runt64;
+		u32 rx_drops;
+		u32 rx_broadcast;
+		u32 rx_multicast;
+		u32 rx_errors;
+		u32 rx_crc_error;
+		u32 rx_over_errors;
+		u32 rx_fragment;
+		u32 rx_jabber;
+		u32 rx_runt;
+		u32 rx_long;
+		u64 rx_runt64;
+	} mib_prev;
 };
 
 enum {

base-commit: a225f8c20712713406ae47024b8df42deacddd4a
-- 
2.43.0


