Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E74CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=; b=jwH2tESsGGnbn+HTEFL3WC12nv
	PUWlTfb76mqyYw70SCQ4LU9mgfS5sYrsUAKB3EG90WfNt2/AIXuA5UCRRqb9rSJVi9iNGXOIY82aZ
	OEPt7oH3D7MQlItXTTcMtRHRyJuPQb75YguhcWU50k1kpM0lBmCyKMFHaw0cbSqjPcL/JFqe24kUn
	84upKbuyoZemyIk46U5gcBGO0EqDx+55J3btriTT0hNeozVnmJUzLzep8qOi1Yw/cjacz+UZxn4Bf
	JiHF6/U/M+z1XNEf0FQx/QMGAR9o2hX+8ozalRhxvD82iMyna6dZX1iXgPgs+6CCSg3+yKITfEEgx
	BvE9Qufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyv-0000000ElsD-0zx9;
	Sun, 04 Oct 2026 12:06:17 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyr-0000000Elr7-3abT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:06:14 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so404146a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115573; x=1791720373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=OW+TLQu7tLcao/CBFtO7xUTjne+fehHojPKBqJEEXFJigsGI/2H/DG5+vsYgpyTBBU
         cf0UxHx6x+wvTvMX4iSxvmpq3foNyiNzsKq6y9KqXrLqXUEjb66cLjTC+uXbQ1xz9DTf
         ZkQSXNp25ZQ0glfrHD+yJp4zYarYqCT9tQnleCtJYtp5jS3m8zfhzg+1TrxfnGXJIujL
         3oB/ADhtLNqavbGXCvq3clNxqyZNtfPo42BXWLO1p27DJ9kfCFSiZKFx601PiQN6rNdy
         bivswa+ZCtuOqp/y19NAqC5UB3GqK5FHv5LEZFlWQlsvW6NChuQU/t2+EjB2BZMk1xfF
         BFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115573; x=1791720373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=Jvurm/hao46DAgJ22lkDHF3gNtCJ8yU9kC4Hr9hw4elH00w64+7aE0Qf22tODG/EwU
         +NpDcC0dqPCiLYjTI+Tw+llw7rWvudj32Mnsa+hgFh4AsTanpZXAw2OPt2EGrypk/9dJ
         vLtzlFPD1zYU1Piy+KfkIkPytw/PDILMOUSLuMqs+sos7ndaNvryjw6Imdg5BZJif2RP
         HTmycTIpbcJyTpL8y1NdABtnKp6vFwEXwYdNO8BHd+MjGbVp62+0W5cQ0rXLXy9CUhri
         31HtGkuvVvIgaitEfen+QTH/7cfmkIeNClMGH2r9ww+56hD6loN0DXyv6X4dc9/QgsKA
         n22w==
X-Forwarded-Encrypted: i=1; AKwUvBwIhiA3Ov20gDHbFY1JRXIWSrk/p67+pb2AIhyijYZsdy0WtTUWWV/o/skyVa9sel0yaYy7BK2L9fIHWD67ieFp@lists.infradead.org
X-Gm-Message-State: AFq9FYLoaMNah5/cfhyYSZHZZKeyQoXYKOyCU3Pj4ywVpave5s1g51gr
	/LjPx34uydGbGEmb+AT6lbM+rzpD05ykpY3uHUDEyV3hQJ7JcFN1Tv48
X-Gm-Gg: AYBFou1UjFp+f0dSaHjlgrcpF5i6kGvSmxjNra7UGEbWRXzWHdM+g9z6DZzwa2RmVMw
	kr2LpXWRniB/xYQRVe7KAePK3eIgrRr3pMAglMEm4jqyRaamy0pUHYt3lrkAcm+SPGLK2SVgx2N
	AB/eBTDsipZ9Br/VHu84tLF+1oT5312Ywq02KsP+GaB1a66KvQ6e+r8EC8U1KgiVGhPnhII4LRO
	M1UbBxXjL5iUiPVn8NFoKruXw0VTme9zcZ1RrEq+rFaChmf1Z1c2cRIDLoV9ma84V7f0uuEauv6
	S5Zy2WL9w2gi7K+PYbN2gyUCBg6/mYe9g8x4jKLRU5A1JikB41SWfSWXeG54kmjQhuJsm+b/55Q
	/RtRhsbR9a7yWy8bkNOFafUQRt++ZMMLUVuq4d5QTp+R5x80b6QB6SHvuKd1ycR6CLPYGK+oTlL
	jTPvxpeZLJyd7giZ8VRxMF1DO9AeveHRnKWIStjYWyyH8UwpYeWGfmneWInu3X3d90WjH0ug==
X-Received: by 2002:a17:90b:518d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a6cec143d7mr6861879a91.14.1791115572650;
        Sun, 04 Oct 2026 05:06:12 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:12 -0700 (PDT)
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
Subject: [PATCH net-next v7 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Sun,  4 Oct 2026 20:05:24 +0800
Message-Id: <20261004120526.2728564-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004120526.2728564-1-zxyan0222@gmail.com>
References: <20261004120526.2728564-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_050613_905107_3A63DFDA 
X-CRM114-Status: GOOD (  18.17  )
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


