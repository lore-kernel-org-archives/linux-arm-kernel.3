Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FE1CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9cgIVeq76b/ZvdB9vw6DERB2lv+iQya4cpw9K5HZZA=; b=t8zqLG5TQc9AF4mBt0aE80j+1S
	2S6NplIMkTwnf3VOGjH1XuH5exwBgxL/utlG8nbNzkCurwmu+5p63sSOC+yOqps1m6T5qEdeUDjV9
	+1KXWXVkfvLlChu2EJqQqNaNBg/fHtDUO3nXm/luDa1NhsHMKnd/jiwW5GuIC1gIfSLkWPw3wGUjC
	vizCoEDFlTJ2sRXrDtSCY4IAOFdQfhlfOy8mkZB5fh90cvw8tGhHQ5IsVqD3YA9wrooBSIfBSZUpT
	vGHwRyA+m7jCjDoscFI8wiX2JYl/Q381KslU1Kamh2pmCBnaqbehypL5Nx2/TsTdR2KjttE+3vuAT
	3Y88oQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AP-00000007i2A-2Own;
	Thu, 01 Oct 2026 04:13:09 +0000
Received: from mail-oo2-x29.google.com ([2607:f8b0:4864:31::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AF-00000007hz9-0k7p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:13:00 +0000
Received: by mail-oo2-x29.google.com with SMTP id 46e09a7af769-8137b129131so4031551a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790827978; x=1791432778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9cgIVeq76b/ZvdB9vw6DERB2lv+iQya4cpw9K5HZZA=;
        b=AUMDg9MMmeVMOfJ+JyZVe9MnELddenUZqicGuSmZoqO0SJ09attcrAdNiRKFqYRI+9
         X3hnldRlUCGW9Eh2YAz5jFoOZNgA9aaPam2KPc2LKWr3hBkUuomG0dAZ4G+H5a65U7K2
         8ihjmY7a4QjVtCFtsftfVz1Wi33wnv2ty0Whg0SdYUY8LRKniIqs9DxpBua4ZRksJ4w/
         z/74/uZDr6mZ5wP+AeSNVymUPY+tu28xlt2wKRsV9Y6lmpTSb1RnKywjQQAFKHcJy9Pt
         QZFxd5Aivqpzt1TbRthtw/KKElT2pEQj71tRZ0mXIcXgWZVFb4cr8QVM0NstPBgXmWE4
         fD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790827978; x=1791432778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9cgIVeq76b/ZvdB9vw6DERB2lv+iQya4cpw9K5HZZA=;
        b=d+0PDN9UpPNQUOKhHAYfCy7N7kAugfqPbNp265XAxVUh0cGX+ucx0x99orVbYnaTuw
         oewiMU4kf3cmIFrFSiLOcxP7tPgF/f+J8JW3xRI3LFMTL84VFkKo1I9E7M5sDCZd9z1Z
         bUXIpJy4vy8+ioaAHveutkqqQJOTr1GNN7xY2UQY0DqmowibFLrOpPha/6UbOHNKGjAp
         GrZs/U0kMy33w7K0bC1Uw3QadyqOCGuIzSPq0wKsmNfQspsX5Qs9R/gI8TL6hGlT1Gnz
         7r/kkCyZ4ZHcagOn12gbClXAwZvEr1dwEEZ6FuB5Pavgn5XSDSWcwc2QEXAECd4f1eyu
         d2YA==
X-Forwarded-Encrypted: i=1; AKwUvBz38tH2zMezWE7FTN/ZN4gnelXJd3JffDAA3H+8lUqNekexIxcvM/oFGzt4FpUsSNuQNHrmz+a3P0X0ip0pPKTa@lists.infradead.org
X-Gm-Message-State: AFuF++no7VW2TGV/7O1KJrBXak5ra3t6RRrlqLm9ZAh0HDGoIGKT5h9Z
	7H4PRNm4DR07lt+f76ltPojVAOLYmVlgmYlvzWN0QgannMoh4sD1UYGI
X-Gm-Gg: AYBFou1bWi2q8MkVnIMnElBYvYbo27PD7PVWcfPkSnZrCmH7Nr1Lzp8YNFKBP1Yw1ys
	HHaDkoVV7Kv9Ut0DSRHwuVzxgBjYSkW9BQLpFqW4Ng09v4M2kAK59f3cUWOIhR/KyWNT2tnynEA
	e9AoGomxms2RRE30lYEK9ZE0tyWBY7Q8Rn4k/RPO7YbLfqrOV77o0bnNntm2L/vZ+kJQu/1dXUM
	B7AMgIeTIZIH/6or9AX3dDO8fJ3gFF04sumGkVDg/X7QcIp1LU29QNEY3NE7Zq7o9u7wFa9FgsJ
	78jfR0Lj54E5WMgFSdDXI3LZjLLKWrA9aZEI8OzQXbHSfPAoaUFuhLdcjbWUC06lPC/Z7PfhN4c
	f7VyNBJCCR57a4LFY8Omf30Br77cP115s9kb9AhjKokDBwcCcCxzlMHoJdL+fbyMoLlgM3kcjZc
	/uNqyDKAj9tiUZhsku195NoCpkPHdgPKCJmfs/FtuCwkhFrXvIvTd3R9Qwo+P96arOqUN+gzaZV
	Ysvbe0+sRw8prkauGORAtmbqRIfYxxQ5v5iU0oqRhaWhXT+NlvIlA6kPrprNcBaOKNLM7L759QE
	0HtVUukohrymfENSA4JNqh9w4a5+Zx+M/bh5EthgCdI7/YkuPslAr8I/sz0Bc6u/L/PgLabqVhG
	OtrqXXqSLJA8Y2XrfEfBa
X-Received: by 2002:a05:6830:6289:b0:804:ec69:3979 with SMTP id 46e09a7af769-8204b5c0229mr3897443a34.21.1790827978049;
        Wed, 30 Sep 2026 21:12:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212af3c1ecsm1708657a34.21.2026.09.30.21.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:12:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:12:49 -0600
Subject: [PATCH net-next v4 1/4] net: stmmac: embed struct stmmac_est in
 stmmac_priv struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-est-reapply-after-open-v4-1-9d4366587b73@gmail.com>
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
In-Reply-To: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_211259_305915_4B27F076 
X-CRM114-Status: GOOD (  23.18  )
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

From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

This is a preliminary change to fix EST reconfiguration in the open
and resume paths: the taprio offload must be re-applied after the DMA
soft reset clears the MTL_EST registers, but the current layout makes
that fragile.
priv->est is currently a pointer allocated with devm_kzalloc() on the
first taprio REPLACE, and the mutex guarding it (priv->est_lock) is
initialized at the same time. That ties the lock's validity to whether
taprio has ever been configured, so the EST parameters can not be
read under the lock (e.g. to check priv->est->enable in the open and
resume paths) before the first offload setup.
Embed struct stmmac_est into struct stmmac_priv and initialize the mutex
in probe(). This makes the code simpler (no logical changes added).
Moreover, the lock is now unconditionally valid, so the enable flag can
be inspected under the lock from any control path.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 17 +++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 22 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 61 ++++++++++-------------
 4 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..12f353fabd6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -298,7 +298,7 @@ struct stmmac_priv {
 	struct plat_stmmacenet_data *plat;
 	/* Protect est parameters */
 	struct mutex est_lock;
-	struct stmmac_est *est;
+	struct stmmac_est est;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ad9252bf6ae..e93f3238be1f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2745,9 +2745,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		if (!xsk_tx_peek_desc(pool, &xdp_desc))
 			break;
 
-		if (priv->est && priv->est->enable &&
-		    priv->est->max_sdu[queue] &&
-		    xdp_desc.len > priv->est->max_sdu[queue]) {
+		if (priv->est.enable && priv->est.max_sdu[queue] &&
+		    xdp_desc.len > priv->est.max_sdu[queue]) {
 			priv->xstats.max_sdu_txq_drop[queue]++;
 			continue;
 		}
@@ -4843,13 +4842,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (skb_is_gso(skb))
 		return stmmac_tso_xmit(skb, dev);
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue]) {
+	if (priv->est.enable && priv->est.max_sdu[queue]) {
 		sdu_len = skb->len;
 		/* Add VLAN tag length if VLAN tag insertion offload is requested */
 		if (priv->dma_cap.vlins && skb_vlan_tag_present(skb))
 			sdu_len += VLAN_HLEN;
-		if (sdu_len > priv->est->max_sdu[queue]) {
+		if (sdu_len > priv->est.max_sdu[queue]) {
 			priv->xstats.max_sdu_txq_drop[queue]++;
 			goto max_sdu_err;
 		}
@@ -5253,9 +5251,8 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
 		return STMMAC_XDP_CONSUMED;
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue] &&
-	    xdpf->len > priv->est->max_sdu[queue]) {
+	if (priv->est.enable && priv->est.max_sdu[queue] &&
+	    xdpf->len > priv->est.max_sdu[queue]) {
 		priv->xstats.max_sdu_txq_drop[queue]++;
 		return STMMAC_XDP_CONSUMED;
 	}
@@ -8106,6 +8103,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	mutex_init(&priv->est_lock);
 	rwlock_init(&priv->ptp_lock);
 
 	stmmac_fpe_init(priv);
@@ -8238,6 +8236,7 @@ void stmmac_dvr_remove(struct device *dev)
 	stmmac_mdio_unregister(ndev);
 
 	destroy_workqueue(priv->wq);
+	mutex_destroy(&priv->est_lock);
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3bfcc9760dce..2a4099fe470c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -69,11 +69,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	nsec = reminder;
 
 	/* If EST is enabled, disabled it before adjust ptp time. */
-	if (priv->est && priv->est->enable) {
+	if (priv->est.enable) {
 		est_rst = true;
 		mutex_lock(&priv->est_lock);
-		priv->est->enable = false;
-		stmmac_est_configure(priv, priv, priv->est,
+		priv->est.enable = false;
+		stmmac_est_configure(priv, priv, &priv->est,
 				     priv->plat->clk_ptp_rate);
 		mutex_unlock(&priv->est_lock);
 	}
@@ -91,19 +91,19 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		mutex_lock(&priv->est_lock);
 		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
 		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est->btr_reserve[0];
-		time.tv_sec = priv->est->btr_reserve[1];
+		time.tv_nsec = priv->est.btr_reserve[0];
+		time.tv_sec = priv->est.btr_reserve[1];
 		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC +
-			     priv->est->ctr[0];
+		cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC +
+			     priv->est.ctr[0];
 		time = stmmac_calc_tas_basetime(basetime,
 						current_time_ns,
 						cycle_time);
 
-		priv->est->btr[0] = (u32)time.tv_nsec;
-		priv->est->btr[1] = (u32)time.tv_sec;
-		priv->est->enable = true;
-		ret = stmmac_est_configure(priv, priv, priv->est,
+		priv->est.btr[0] = (u32)time.tv_nsec;
+		priv->est.btr[1] = (u32)time.tv_sec;
+		priv->est.enable = true;
+		ret = stmmac_est_configure(priv, priv, &priv->est,
 					   priv->plat->clk_ptp_rate);
 		mutex_unlock(&priv->est_lock);
 		if (ret)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 42a00446e9b4..357d1eaf0d7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -959,7 +959,7 @@ static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
 		count = qopt->mqprio.qopt.count[i];
 
 		for (j = offset; j < offset + count; j++)
-			priv->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
+			priv->est.max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
 	}
 }
 
@@ -1023,24 +1023,15 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (qopt->cycle_time_extension >= BIT(wid + 7))
 		return -ERANGE;
 
-	if (!priv->est) {
-		priv->est = devm_kzalloc(priv->device, sizeof(*priv->est),
-					 GFP_KERNEL);
-		if (!priv->est)
-			return -ENOMEM;
-
-		mutex_init(&priv->est_lock);
-	} else {
-		mutex_lock(&priv->est_lock);
-		memset(priv->est, 0, sizeof(*priv->est));
-		mutex_unlock(&priv->est_lock);
-	}
+	mutex_lock(&priv->est_lock);
+	memset(&priv->est, 0, sizeof(priv->est));
+	mutex_unlock(&priv->est_lock);
 
 	size = qopt->num_entries;
 
 	mutex_lock(&priv->est_lock);
-	priv->est->gcl_size = size;
-	priv->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
+	priv->est.gcl_size = size;
+	priv->est.enable = qopt->cmd == TAPRIO_CMD_REPLACE;
 	mutex_unlock(&priv->est_lock);
 
 	for (i = 0; i < size; i++) {
@@ -1065,7 +1056,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			return -EOPNOTSUPP;
 		}
 
-		priv->est->gcl[i] = delta_ns | (gates << wid);
+		priv->est.gcl[i] = delta_ns | (gates << wid);
 	}
 
 	mutex_lock(&priv->est_lock);
@@ -1075,22 +1066,22 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
 					qopt->cycle_time);
 
-	priv->est->btr[0] = (u32)time.tv_nsec;
-	priv->est->btr[1] = (u32)time.tv_sec;
+	priv->est.btr[0] = (u32)time.tv_nsec;
+	priv->est.btr[1] = (u32)time.tv_sec;
 
 	qopt_time = ktime_to_timespec64(qopt->base_time);
-	priv->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
-	priv->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
+	priv->est.btr_reserve[0] = (u32)qopt_time.tv_nsec;
+	priv->est.btr_reserve[1] = (u32)qopt_time.tv_sec;
 
 	ctr = qopt->cycle_time;
-	priv->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
-	priv->est->ctr[1] = (u32)ctr;
+	priv->est.ctr[0] = do_div(ctr, NSEC_PER_SEC);
+	priv->est.ctr[1] = (u32)ctr;
 
-	priv->est->ter = qopt->cycle_time_extension;
+	priv->est.ter = qopt->cycle_time_extension;
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	ret = stmmac_est_configure(priv, priv, priv->est,
+	ret = stmmac_est_configure(priv, priv, &priv->est,
 				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
 	if (ret) {
@@ -1106,19 +1097,17 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	return 0;
 
 disable:
-	if (priv->est) {
-		mutex_lock(&priv->est_lock);
-		priv->est->enable = false;
-		stmmac_est_configure(priv, priv, priv->est,
-				     priv->plat->clk_ptp_rate);
-		/* Reset taprio status */
-		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
-			priv->xstats.max_sdu_txq_drop[i] = 0;
-			priv->xstats.mtl_est_txq_hlbf[i] = 0;
-			priv->xstats.mtl_est_txq_hlbs[i] = 0;
-		}
-		mutex_unlock(&priv->est_lock);
+	mutex_lock(&priv->est_lock);
+	priv->est.enable = false;
+	stmmac_est_configure(priv, priv, &priv->est,
+			     priv->plat->clk_ptp_rate);
+	/* Reset taprio status */
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		priv->xstats.max_sdu_txq_drop[i] = 0;
+		priv->xstats.mtl_est_txq_hlbf[i] = 0;
+		priv->xstats.mtl_est_txq_hlbs[i] = 0;
 	}
+	mutex_unlock(&priv->est_lock);
 
 	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
 

-- 
2.53.0


