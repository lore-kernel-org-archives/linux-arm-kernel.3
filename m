Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72297CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfjvWDlH74aBokTz23r7fE1Dwv67vVeYYEoQzFsEUhQ=; b=yKReIKePZ6X1nGXSUrW2auSx15
	e+97GEwsLp/N4eGJTreNHCyvh/ah6beoTdQaAIoCkI2hni+qYFD77QtnIJk4O2hPKkSYkKjhaaFLX
	I1XyeT05fOPJkw4U7tA0+YKLHeXC9Xabi6A9s2eFlSOa9xOLITltxvhItZTiWDTqMbk3Darzrw1Yg
	u48Dhse3K6PNXqBv7w9ljFs5TSv7FiLPUt52gYMhvFyIdfIM9V0fPUM5QLwyo5h8IZoXDno2eKTqu
	w2mxpWmh91mv+eXYByoNaUTIIleK9ZcEV9c7ASjbleUZCuRkRdFy3lsmjNKgdBAotjS7Pvwz6hhCC
	8XYKmihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AP-00000007i2T-32BW;
	Thu, 01 Oct 2026 04:13:09 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AG-00000007hzi-47TO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:13:02 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-80a18990c76so3834434a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790827980; x=1791432780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfjvWDlH74aBokTz23r7fE1Dwv67vVeYYEoQzFsEUhQ=;
        b=g6SiPL/f3P1uuhkfdHM56+FuGsYi6lJjt++877xf/qZkxoQCTZ9MZG2pv+zj5I5Snt
         K0F1fEFOlcWFfVo/WiqtJ4ndTiyiSb4i2WPNgyPhChZSkJOfd60zm6dq7Ja/OilzWH2q
         LLVmYwMwYSZluYJSg2AAytUCiQl19U0BFkOHCvuqZiAkyaeL4mIpwP34+3SwJEBR2+uD
         B/qRfHCsSGvNyU5sSdJCUm5nMnhJQcsV8a1H2JCcfW0D8vugcKrC2M4sTrfdiVu30UN4
         gUmdmpy2N7MuvcNpI/vXttfjsibLSsLVrPIFTLyzE81KQZpV4RUjuV/PWvYB5SMSN96n
         vGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790827980; x=1791432780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfjvWDlH74aBokTz23r7fE1Dwv67vVeYYEoQzFsEUhQ=;
        b=LetW94I+lgDhNfM6rb/1TUDxARwtCR+NgL+Hv4apTcPFax/jks9bjsTBzwyXYvyur5
         JrEqsVjuexSD48ZHnT56pcXJNqGOVu8jr7oFYl1by7s+gNJg1P0xXdkN+bF7scSYZWVb
         nF0UmbzFII/ATz1ASNxHXEtZSeYjvUU55qal+W9IdtNqN75vrxOXGTvmnIEJotJSODTi
         QHkDq1s+f4c58gsc72YwhxXTA1AYxfSKo8n5Aq8nbhEAa8Bz9RGileD7QmPgo0kcgTg/
         Xh/vb2WzbtVWTbEVpLPDD+udkGGoPNrWUTbzV/ECavm/m+XiKHcKlxFeHtx6KMpCIyTp
         4L5g==
X-Forwarded-Encrypted: i=1; AKwUvByQgS7Ea8KWcP5u16cpTYJEhGFGxbmUDQbgS4CjeJYb2sTTRy7+jh2L+FvelwY3vxUQEf/Fz5B0LkOdSdv9NCFx@lists.infradead.org
X-Gm-Message-State: AFuF++lxMuQ7erMiUO5XcLSa3HfiX6QjIt1ZZeigB/ymJVIjXbAsgngH
	/O+j7xS4bIEZpKb0SKiAQPdinrgu5lqkQLawmvTDQNrxvNGTfqbMuQhZ
X-Gm-Gg: AYBFou3LLCOzDTqDaXHSgiLNQgeCfbrm3SjQzwN9uHR6QdHe2ViiW/O8pp8JJZF4KXa
	r+GgC7mzS+oq9g8LjRmAo1uNuUFkrC3pdTMuD9yyZsMLyYq5KQDCaBR+ryFrM26+zd/AA65UvtP
	GmMlnObeOGhqsf2pcIQUgg0tkaGFkNgDFHHUytb+CHKAUyzM3tMk03lTPGh+7IH7UwKi8gBR2Au
	irumaTx3LvHj2ce4KKx/MTyQqhfqzv8LDBY+gYZoBtoVefnR3j5bMa3JChFpf0tO2Ejl0sBfBmV
	aeo+eeVt4YCne+JCxcT22Ka5nXrO9Njtt9U2bXE3WZzi6VKS/r3Yd7N471aSpVCkSwx6RKXePM8
	GPJ+qHSqOMnutE1o82X2X8Jlbm5tA1rjMHkqs/Sw393c+15n0Y8CkTR2q5d9XZAXBNVjGQ+RNJx
	OHBKhJobz4S/Zphb0C8yxEppavqsQLwbiDhXOXnoZpsN1xTsWseZeROmoS2qvg4sbMU8LfA0+VV
	U1kckn9ldnR7tKk4tk1ofDVtKzO5n3gBCUwYIZ8Z2/so68l3/cHeTtHqGr+zPDvc0R71vt0jbXF
	qiTPWDnMHE6NyN2Qke1p9RKtHx2oG3kq3NJdF/Z+SkwLZbez6niDENuDeS9Lds6ihxHGQcC1aE5
	B5t+Nb63lohNYH5SAfcSK
X-Received: by 2002:a05:6830:398b:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-82046ebb400mr4300712a34.4.1790827979789;
        Wed, 30 Sep 2026 21:12:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212af3c1ecsm1708657a34.21.2026.09.30.21.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:12:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:12:50 -0600
Subject: [PATCH net-next v4 2/4] net: stmmac: pass the desired EST enable
 state to est_configure()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-est-reapply-after-open-v4-2-9d4366587b73@gmail.com>
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
X-CRM114-CacheID: sfid-20260930_211301_233882_D4EB7FDD 
X-CRM114-Status: GOOD (  17.88  )
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

Pass the desired EST enable state explicitly to est_configure() instead
of having it derive the EEST/EST_INT_EN bits from cfg->enable. This
decouples the hardware programming state from the priv->est.enable
flag, which records whether the taprio offload is attached.

No functional change intended: the callers keep toggling
priv->est.enable around the EST programming, as before.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index a8a5c8fdd5ed..1fd9f1ab316e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -617,7 +617,7 @@ struct stmmac_mmc_ops {
 
 struct stmmac_est_ops {
 	int (*configure)(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate);
+			 unsigned int ptp_rate, bool enable);
 	void (*irq_status)(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt);
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index afc516059b89..f15d4d046aa7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -26,7 +26,7 @@ static int est_write(void __iomem *est_addr, u32 reg, u32 val, bool gcl)
 }
 
 static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
-			 unsigned int ptp_rate)
+			 unsigned int ptp_rate, bool enable)
 {
 	void __iomem *est_addr = priv->estaddr;
 	int i, ret = 0;
@@ -62,7 +62,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 		ctrl |= ((NSEC_PER_SEC / ptp_rate) * EST_GMAC5_PTOV_MUL) <<
 			 EST_GMAC5_PTOV_SHIFT;
 	}
-	if (cfg->enable)
+	if (enable)
 		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
 	else
 		ctrl &= ~EST_EEST;
@@ -70,7 +70,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	writel(ctrl, est_addr + EST_CONTROL);
 
 	/* Configure EST interrupt */
-	if (cfg->enable)
+	if (enable)
 		ctrl = EST_IECGCE | EST_IEHS | EST_IEHF | EST_IEBE | EST_IECC;
 	else
 		ctrl = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 2a4099fe470c..64d890664421 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -74,7 +74,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		mutex_lock(&priv->est_lock);
 		priv->est.enable = false;
 		stmmac_est_configure(priv, priv, &priv->est,
-				     priv->plat->clk_ptp_rate);
+				     priv->plat->clk_ptp_rate, false);
 		mutex_unlock(&priv->est_lock);
 	}
 
@@ -104,7 +104,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		priv->est.btr[1] = (u32)time.tv_sec;
 		priv->est.enable = true;
 		ret = stmmac_est_configure(priv, priv, &priv->est,
-					   priv->plat->clk_ptp_rate);
+					   priv->plat->clk_ptp_rate, true);
 		mutex_unlock(&priv->est_lock);
 		if (ret)
 			netdev_err(priv->dev, "failed to configure EST\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 357d1eaf0d7d..67c6fc32d0ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1082,7 +1082,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
 	ret = stmmac_est_configure(priv, priv, &priv->est,
-				   priv->plat->clk_ptp_rate);
+				   priv->plat->clk_ptp_rate, true);
 	mutex_unlock(&priv->est_lock);
 	if (ret) {
 		netdev_err(priv->dev, "failed to configure EST\n");
@@ -1100,7 +1100,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	mutex_lock(&priv->est_lock);
 	priv->est.enable = false;
 	stmmac_est_configure(priv, priv, &priv->est,
-			     priv->plat->clk_ptp_rate);
+			     priv->plat->clk_ptp_rate, false);
 	/* Reset taprio status */
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
 		priv->xstats.max_sdu_txq_drop[i] = 0;

-- 
2.53.0


