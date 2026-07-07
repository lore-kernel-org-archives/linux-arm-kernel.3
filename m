Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C471C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IDMoN0bEsmLd2wW0JNho3RIDJxtQ9qetIskk897+fdU=; b=pjn4WzuCThYwnH+v81tqZVC2NQ
	cN/x3GWAioP5MrVtlKvkL+V+z9UrmxA3zBZjEjUbu3LAgJBfZSD3jEYaNkzfFz5PMd4vlQPlNQb+Y
	XCAGbvzIsAepw3a99v17tLPHG3hwvW68OgXwY2X/+95Dm9TYxZJ1sTKHBvE/4fwwnnDLTfmW+J2XD
	N3Lc9sF7mG53k9Z5L05r74jcppNSnR8DKSgwVWvUtUVo0vkiIEGLCIW1x9RilZZrDl9ma+0qO4iSO
	sf22yj4EfPuiBbu+zVToFkapLOUpNTCFL4K5C4z3qLOIO4W4jZUUzpTMpJ6+Do+7fbLosIMfdY8mp
	kmv0ld7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7iX-0000000FHmc-0aAP;
	Tue, 07 Jul 2026 15:28:13 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7iU-0000000FHlv-3KVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:28:12 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c89636920a3so2231012a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783438090; x=1784042890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDMoN0bEsmLd2wW0JNho3RIDJxtQ9qetIskk897+fdU=;
        b=qgzDzzomDketPA+heMXkPXuitvn4205Qy4r/BPznYaBIQFUOBf8fimx5rZuPAVFC3c
         o+3PypkdwSOIVufthaf8fLpVQb7KFVbRgJ0GQQSxHzKglAyLSaVOH/QSIYqagQWGhYpb
         la/aoqFrQxeejTxJyEjHzg5jZk28Yq346/gHEAKWTKnD2MqqFsmpiu2AgMI4lUwrLXpJ
         kpp9v8Doq6ysR0THzhbXNPrEy6zlTiDAHN5eiQY19Ra/Zj88yfRkuWA/yOwVB47xLbf5
         gCP+cTTIbUhLzD4tFcbKMrzjmqVDd73mJcslOHrwYaYEeKOcyUnntjneB/AjO32CfNhs
         bpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438090; x=1784042890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDMoN0bEsmLd2wW0JNho3RIDJxtQ9qetIskk897+fdU=;
        b=BMRdvEuk3egLGT12DTn5WO7Q0ktWIzUwlWUU0E1CYZG5FhKCpFMYm7wyeSMzrLTVb+
         PT0arQfVYfJM0IDPN4NmuqI+WI8mSISduvBTKSQabb+sw3Bz3hVumQgB0lBjE88YiQrz
         zJFes0vLetku1Ywn/M4n5tzyjlHI1yykPzGZ4te5Qj6rnUQzFRKD3BgoFPwAAneb8zEb
         Pj5Te2U22R5wC2RPUBy55SPIDUQep7SLzNoA5F9nKvrAMWwobUzBfKC3RGEG92IKCWm8
         w8bgnNLAH1wDXi5P4yl5mCbfr7LgNDC9Y2k70eYdIQshxzHIrK27Y29ehZD9e5crPT+s
         N7rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhPF155T1OaqSFHcuofhx3DcBHEDl/jYV0UHpStqKYrq6K3woImUvKyJUVq5QHPRvwJoVrSKBTZ7IhDIruScnf@lists.infradead.org
X-Gm-Message-State: AOJu0YxlR1dzXWE/BkNR/ZdHDiwIExXtgGBMaqQNxwnjTIMjyCQO03AR
	GSC8t9sHfo3MAB/Tc2xmCmHllxmNIBztYmuN+py1o8+Ym2+3wgyBn4My
X-Gm-Gg: AfdE7ckbJ5Avyv1Wwm4UTml5QeaxBW5TH68XY3ViQ+5XkTevQgwhQAAp1u1a4aVzc0b
	4Alq2aCgRWPsTv8yrrGZfgUtn125MsrqkbhJgFWjlS3XDqRQoIeyvgIKbqb3iTq0b3Vknxko6lu
	zOmMxB1noR5FbTfwNcW33A+bVIaL54s9nFMusOQ1p2wLVFZ3apbFrHzbpFjSZpB6BTQ9SkttnKe
	vsAcqcYYR2iG79zxfn8fmMmTcLICxOGHsHDwYZ1E5eJ2P8l7SDoUAsfy6nRwimsfCLRq21fStHi
	nNlHIJbA7JR8YVawVb4W32/b6rdjDxvAGCrcfNXtfrLymgqZjaZ2ilKBtlPhz1cn4qGEiyR4Cl5
	/1rZXPa0nV+ZqRwDGGhv1CWeT20KaM48e1g+AdwczETmKOJxHGaXK98qcyTLAVQ+udZu8CEIsUO
	jC1/uUAwiXcyHFP2fwhE5zQA==
X-Received: by 2002:a05:6a20:4327:b0:3bf:9cbd:9a39 with SMTP id adf61e73a8af0-3c08ece2d18mr6988091637.10.1783438089505;
        Tue, 07 Jul 2026 08:28:09 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:6cd2:7b5:da34:d79b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm10878316c88.1.2026.07.07.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:28:09 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: netdev@vger.kernel.org,
	lorenzo@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aniket.negi@airoha.com,
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
Subject: [PATCH net v5] net: airoha: fix MIB stats collection to be lossless
Date: Tue,  7 Jul 2026 20:56:39 +0530
Message-ID: <20260707152639.105628-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_082810_863347_028D2DB9 
X-CRM114-Status: GOOD (  19.71  )
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
  hardware total directly into a local variable; clamp with max(new, old)
  to prevent torn-read regression when the counter carries between the
  two reads.

- 32-bit registers (drops, bc, mc, errors, runt, long): accumulate
  (u32)(curr - prev) into a 64-bit software counter; unsigned
  subtraction handles wrap-around transparently.

- tx/rx_len[0] ([0,64] bucket): combines RUNT_CNT (32-bit, delta via
  tx_runt/rx_runt) and E64_CNT (64-bit, absolute) into a single local
  accumulator; max(new, old) applied here too to guard against a torn
  read of E64 when the RUNT accumulator is unchanged between polls.

MIB counters are zeroed by the SCU FE reset (EN7581_FE_RST) asserted
in airoha_hw_init() at module load, so no explicit MIB clear is needed
in airoha_fe_init().

Merge airoha_dev_get_hw_stats() into airoha_update_hw_stats() and
move stats_lock inside. Plain spin_lock() is correct: the function
is only called from ndo_get_stats64() in process context. Each dev
refreshes only its own MIB counters; sibling devs on a shared GDM3/4
port are polled when their own netdev is queried.

Fixes: 8f4695fb67b2 ("net: airoha: better handle MIBs for GDM ports with multiple devs attached")
Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
---

Changes in v5:
- Link to V4: https://lore.kernel.org/20260706154730.36949-1-aniket.negi03@gmail.com
- Drop MIB clear loop from airoha_fe_init(): SCU FE reset (EN7581_FE_RST)
  resets MIB counters at module load, making the explicit clear redundant
- Rename local variable tmp -> data; drop prev variable; use + instead
  of | for H+L combination; inline max(data, dev->stats.x) per
  maintainer nits (Lorenzo Bianconi)
- Extend max() clamping to the hybrid tx/rx_len[0] (RUNT+E64) bucket to
  guard against E64 torn reads when the RUNT accumulator is stable
- Fix undefined behaviour: split i++ out of expressions that also read
  i as an array subscript in the same statement
- Retain REG_FE_GDM_MIB_CLEAR/FE_GDM_MIB_{RX,TX}_CLEAR_MASK definitions
  in airoha_regs.h as register documentation (per Lorenzo Bianconi)

Changes in v4:
- Add max(new, old) clamping for 64-bit H+L register pairs to ensure
  monotonically non-decreasing stats despite torn reads between H and L
- Use local variable for all 64-bit H+L computations to prevent lockless
  readers from seeing intermediate values during piecewise write
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
- Link to V1: https://lore.kernel.org/20260630111834.233643-1-aniket.negi03@gmail.com
- Store _CNT_L register reads in val before adding to stats
- Fix double-counting bug in the RUNT+E64 combined bucket
- Replace 7-element tx_len[]/rx_len[] shadow arrays with focused fields
- Rename inner struct hw_prev_stats to mib_prev
- Rename airoha_dev_get_hw_stats() to airoha_update_hw_stats() and
  move the port spin_lock inside, removing the separate wrapper
---
 drivers/net/ethernet/airoha/airoha_eth.c | 171 ++++++++++++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  27 ++++
 2 files changed, 132 insertions(+), 66 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..90aa8b0210bd 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1686,11 +1686,14 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
 	}
 }
 
-static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
+static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
 {
 	struct airoha_gdm_port *port = dev->port;
 	struct airoha_eth *eth = dev->eth;
 	u32 val, i = 0;
+	u64 data;
+
+	spin_lock(&port->stats_lock);
 
 	/* Read relevant MIB for GDM with multiple port attached */
 	if (port->id == AIROHA_GDM3_IDX || port->id == AIROHA_GDM4_IDX)
@@ -1701,152 +1704,188 @@ static void airoha_dev_get_hw_stats(struct airoha_gdm_dev *dev)
 
 	u64_stats_update_begin(&dev->stats.syncp);
 
-	/* TX */
+	/* TX - 64-bit H+L registers: hw accumulates the total, read directly.
+	 * Use local variable to prevent readers from seeing intermediate values.
+	 * Clamp to prevent regression from torn reads between H and L.
+	 */
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
-	dev->stats.tx_ok_pkts += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
-	dev->stats.tx_ok_pkts += val;
+	data += val;
+	dev->stats.tx_ok_pkts = max(data, dev->stats.tx_ok_pkts);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_H(port->id));
-	dev->stats.tx_ok_bytes += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_BYTE_CNT_L(port->id));
-	dev->stats.tx_ok_bytes += val;
+	data += val;
+	dev->stats.tx_ok_bytes = max(data, dev->stats.tx_ok_bytes);
 
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
+	data = dev->stats.mib_prev.tx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_E64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L64_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L127_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L255_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L511_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_H(port->id));
-	dev->stats.tx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_L1023_CNT_L(port->id));
-	dev->stats.tx_len[i++] += val;
+	data += val;
+	dev->stats.tx_len[i] = max(data, dev->stats.tx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_TX_ETH_LONG_CNT(port->id));
-	dev->stats.tx_len[i++] += val;
+	dev->stats.tx_len[i++] += (u32)(val - dev->stats.mib_prev.tx_long);
+	dev->stats.mib_prev.tx_long = val;
 
 	/* RX */
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_H(port->id));
-	dev->stats.rx_ok_pkts += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_PKT_CNT_L(port->id));
-	dev->stats.rx_ok_pkts += val;
+	data += val;
+	dev->stats.rx_ok_pkts = max(data, dev->stats.rx_ok_pkts);
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_H(port->id));
-	dev->stats.rx_ok_bytes += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_OK_BYTE_CNT_L(port->id));
-	dev->stats.rx_ok_bytes += val;
+	data += val;
+	dev->stats.rx_ok_bytes = max(data, dev->stats.rx_ok_bytes);
 
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
+	data = dev->stats.mib_prev.rx_runt64;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data += (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_E64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L64_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L127_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L255_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L511_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_H(port->id));
-	dev->stats.rx_len[i] += ((u64)val << 32);
+	data = (u64)val << 32;
 	val = airoha_fe_rr(eth, REG_FE_GDM_RX_ETH_L1023_CNT_L(port->id));
-	dev->stats.rx_len[i++] += val;
+	data += val;
+	dev->stats.rx_len[i] = max(data, dev->stats.rx_len[i]);
+	i++;
 
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

base-commit: 60444706aa17616efc03190d099ac347e28b3d0a
-- 
2.43.0


