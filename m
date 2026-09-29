Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B81ACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=; b=dKg51JNlCzGOU2sSPqDKGxQxzU
	hq/IcAUDAu+rtmYvxL1hI2Nwms0qXjfbIsmqkBTdX0XqG8VXCibdatDkylqX9rrQeDPPmREopnZHh
	7nkFIcDulIyJwnwFSR/67VnQoLjcxEe21yW7VG/oPU+n/AsEj4jV3NXnn6HgYDcXPX74Jl6klzbEm
	hdhC8yziqp4MNg6036JqkpVYtyjm0QvZd1uIoVyau5dIhOOYLf2OGMvXcdF5spvMezbL+pzJyndYV
	SvZDQVHaiTHtTMv8KgaepCE0joyng4Ip/iLNj7rHaL3zKK3/I2CKHOTmaA4i+xNr7mrv9mYq0uB/B
	8/O9bN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSOv-00000002dHf-2RkN;
	Tue, 29 Sep 2026 07:37:21 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSOp-00000002dGE-1ahH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:37:16 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccb65437so2234752a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667434; x=1791272234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=Hqz8JnRP1sdFiQcTZvG0YjZ3wUiRw6a2zc1UL+FC+aFk8frG9J2hqX2y1qkUeUrOQy
         dhd6uroBN1RQsWhP5xPFgnSeVi0JHQf5cmkL2T324m4LDhZkcppbHv84elyiYVmUTfTl
         MGnHWn9SIsb+RN7pCgbOVARFGhzZwNOC4zgMzqLGac/hD+v2dzfHhfqvzPC6UhvEWsNm
         hMmyq2RdGvwfvkpxlZT+KWrjJHIGEhv2wD9XvIkCukzlxPtuRgto0E5psStpekBhUdx8
         ovFXOJH3qeCWMZUro012ungpvfd0ww46a8cChhi3a8zobAOcu5RkyZp9aOktRVW+G3RY
         D56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667434; x=1791272234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=Z7K9TMn5HCVD8lXRQZTLANSkUi+lR9f4VQ2DcAVdpaRiW5R24LIAol2ZYZsv/vR1/l
         wZlGvHS0bHF2gsRu64DBjTY1rRyrgwE1uVPhelolaIVsrraYOn82s+y6ULMO0urdJe/K
         je5Qdwcl6oB8wA8LmwmYxtkKfO35J08iWvBNoP+8IGXBHtSvD6IBe+Q37/Ey2FxGHpQc
         gtwuUDMo3s/caV5VsqBf3lqkU03GbQ3G9y3l4h4Ha5NT8dxyhu92wxAyyCJQTJGnwigv
         Z4KWKCA8JVz4N3NcKr6dgKQ0mSOY1u01p94HY6+czKsfe9pS539NtyPkn72oO+o95fBs
         7PBA==
X-Forwarded-Encrypted: i=1; AKwUvBwRiaMf7CIKK/7orUEAWoOQNwPdNUWswzL3BnOMGHKuvHrG6aCZ1DGC5I6Vst1phW7ZJ+YGoWYjuRG0O6sPi24k@lists.infradead.org
X-Gm-Message-State: AFq9FYId9woRt74/IOQPuGeRvUTTdXxPYQabGXpJTMuhG1yO4WsAUfo1
	6Y4SwquzN+DrIlEWB4sDBIhOe8xzMKUOR+z1cEPUcbR01vVWmd/BtiqV
X-Gm-Gg: AYBFou0hYNIVqq0HuzZUGLMCYvu1b2s/FEZMmJj6IbuKdYmaJoR7GG0aLsnRiNaPd91
	kqpDxwh8OJqdD49wVCnltD8sN18dOHCNwHSEYuoB/bC4373iGsUtMtJQyo2khRHjMFW49m3Pikh
	cpG8PEhQCx9WlNpH3u3J24fIyPTnWrS7txG6luO87Axgl3iqcaYzqHhS4gB9AyAxelK2SyX52oj
	dAvQhxgOz/H8Y5PspkV2p1yUNLjb9hLmuB8V4hA3DWmphdytFUGGtxMfz+viW//dViBwkFExsFc
	XJRXrjOZO3GgwuqxpoyCk8YlUiApWU3Alg6HiSeBKDM8bAwZXnimhI5dej/2jBiSOvRBsKsDsPD
	9/+F5acqNPp+Xb0znm0rB54QvO00XmffzXpBc+6LiIt5weNvtkGTOmoxNmGvX/b5Uqu0ZfAcjbq
	YKr1DnCHt6SFYDUmFE3dbWXWw2w8q1kjgI8h11VZqPZ194jcxW17agzeyT/F0jsehaALcaiQ==
X-Received: by 2002:a17:90b:4b12:b0:39e:6c6a:4b78 with SMTP id 98e67ed59e1d1-3a098e43c20mr13687872a91.66.1790667434388;
        Tue, 29 Sep 2026 00:37:14 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:14 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v6 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Tue, 29 Sep 2026 15:35:51 +0800
Message-Id: <20260929073553.4136336-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929073553.4136336-1-zxyan0222@gmail.com>
References: <20260929073553.4136336-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_003715_427497_BAC49F74 
X-CRM114-Status: GOOD (  19.28  )
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

The Agilex5 smtg_crosststamp() handler arms an internal auxiliary
snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS to
learn that the snapshot is ready.  TSIS is a transient, read-to-clear
status bit: it is set by any MAC timestamp event and cleared the moment
XGMAC_TIMESTAMP_STATUS is read.

That makes the TSIS poll racy in two ways.  A stale TSIS latched by an
unrelated event satisfies the poll immediately, before the auxiliary
snapshot is latched, so the FIFO comes back empty and *device is never
written even though the call returns 0.  Conversely a concurrent reader
of XGMAC_TIMESTAMP_STATUS, such as the TX timestamp completion path, can
clear TSIS while the poll is waiting and make it time out with "Wait for
time sync operation timeout".

The auxiliary snapshot FIFO level is also reported by the ATSNS count
in XGMAC_TIMESTAMP_STATUS.  Reading XGMAC_TIMESTAMP_STATUS does not
affect ATSNS, so the destructive reads above cannot disturb it.  Poll
ATSNS instead of TSIS, and wait for the PTP_ACR_ATSFC FIFO clear to
complete first so a stale ATSNS from a previous snapshot cannot satisfy
the poll before the new snapshot is latched.

Hold aux_ts_lock across the whole sequence instead of dropping it
right after arming, so a concurrent PTP_CLK_REQ_EXTTS request cannot
set PTP_ACR_ATSFC and flush the FIFO between the poll and the drain
loop, which would leave *device filled from an empty FIFO.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..c5f71bfc7cf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -337,8 +337,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear to complete, so the poll below only
+	 * observes snapshots latched by this trigger.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
 
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
@@ -349,10 +359,16 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Wait for the auxiliary snapshot to be latched: the ATSNS count
+	 * is the FIFO level and is not affected by reading
+	 * XGMAC_TIMESTAMP_STATUS, so concurrent readers cannot disturb
+	 * the poll.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +380,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,6 +390,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1


