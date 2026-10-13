Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185F5CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=appfE2biJzgupkODLWKmH2RCHw/QKJ3ERvS4ShHq1T0=; b=nRdnmwqqJ1WsFq38ITCKyxvVj2
	xqBkFlMYa2yVOQ//PvBA9MdFKTcOJqeOoIrSjHnWRpVHKhLcSmw7BGbKxDxxOI4n/jHz0CRiy/yz7
	Ly0nbDVizD7OTURraix8n12LAOxuEPWZgoXNsDzbWt/4LDOrkCFK5ril0Ha/xsPDRZLIe8jXt8pKO
	nbqLDjZ6E3c8xqPc9i9hXy96yfhvl7AxUUNVbLdijvXp89/jqvinCvlpSmViYYfU34cBgTDxGwkAd
	HJChsaauy46g+sH1tEssOJKU2DVEBLm/tJcgq1+vbMpviDsBTTAH7e91y0WQtQ4oBvKLy+UawgDka
	qSJrbjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFV-0000000BshD-32Ib;
	Tue, 13 Oct 2026 03:32:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFT-0000000Bsfy-1Gzk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:32:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so2012223a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862338; x=1792467138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=appfE2biJzgupkODLWKmH2RCHw/QKJ3ERvS4ShHq1T0=;
        b=BNi2COewO7wS1HqK09vNnr3iEQGo3u+T6IXHawAP0G6QyUlwssuayj2v4SJ+0f4rI7
         FeLx6RSy9fFlPCjxaHtXOxqRm9Eh4VXKWgm5KgC4guv8yhvPm4t6WpkVDUumV+qWwodb
         56nSNIgzW4294ftmzfrw2JL/GWA43lzhXodaQn81kQarGq1xrx/RzvuT6aSXO3Cewsyy
         al4eq623nUyn14M4lbNtEycr6skr+wNjqAqfU1Z276PfNyznpvp8RYn1+EPDdCDcLVGl
         yfQjqdNPZCaYiodRXcLH1J4c+UH8zCQA9UYun4q5NMiKVEoZybifO2PlkMPaa1w3ozHm
         FB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862338; x=1792467138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=appfE2biJzgupkODLWKmH2RCHw/QKJ3ERvS4ShHq1T0=;
        b=KFwv8FD0dem9uuOukCArYLJZNE/ZPZTrQsBSrMKy3aW0dLLZjVNV/00xVpiZ33jF4O
         KxeB1VM+DoeQfLxZtL/TL5NhSJ9gW7ZOUMtMBSosArT58rTyzC0kaXDDV7a4E0hhI97U
         7WBlXiyLlcFlNRCBP5y8Qhh5rRQESwVYXUuxPPwV2ZnI8EfobTphyBdQQ/PXdDztbEK5
         Jo8r75LvjX9O3UmyHTOJO07AgOD2MtuVMT8MAsL4HTU9TLZpUn8yLlKGvw+ha7axydA0
         qgKOjUOL4tmwywR+r4/kBOlmr0134cd2jj134jNppQEyQifu3o+2d3wr7qrQcdTwd233
         9NSA==
X-Forwarded-Encrypted: i=1; AKwUvBwCwlWmXzAn+pPa8dea3h4UIpvNT+2vEgBW0+c+l1NeKS2yv7KwKlTFP9MwiD8zdiqnuqUZRCjcC01yf5eliJuq@lists.infradead.org
X-Gm-Message-State: AFq9FYIH7EIxdiyq3yRdc06eSNcZwL9WVmPnO2gVcPcPyPQvWP+U7EhZ
	wwK4DEpx/yXIG6p21AhM6FOUvr9QAijOsHu29b04Sn1UkYw1HUSiB5Yh
X-Gm-Gg: AYBFou1q9fj/QseXnwvKuAFQCwkLNa+hiTy+jQUhPitegiKZM1GJ7dhTTjoe+pmh7GA
	cG6D/oDWrNTAzzItq0U+TMm5VVIjfBrq62Xou7AbDcOkl4lrFI5RSDIVZG7eWxZ7qE+v8Bs1TGA
	VGKOH02SL1Gua47XbtYtWWbKQGHOctnHGGPH7Yx48vF/R0zzV4uCT617Arp5oi8EikkWz4CZfmW
	VnDTE4y4zWAzS2CdI+kNhZ5BrFt+l4e6qqsZKko4A3nYJMiWcRnTzkTwEJweUk8BF/wdbPi0Q8Q
	TTF5n8YRy7JkfnQHOaWvNPt7G/j15Sk1TEta1MY5xLyz5Ijp5IMnWLupqxYdZxN9qWNIKsstu9T
	2raMapudcJpfiC3kXDu+OUb/7OLYu4dYoElLZYEaSrFLIyY2x4sY+yXDaTMs1Gt/eKhiJ3ZEmBQ
	jL17R9bYP2tSiwPeBVCIbcU1kjno3Eh6I4vSpdVle8C2zChJ2Zuwzjc1GO/ErhMxO8yfnv+w==
X-Received: by 2002:a17:90b:2e86:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3abe5522014mr4067518a91.54.1791862338112;
        Mon, 12 Oct 2026 20:32:18 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm19541303a91.12.2026.10.12.20.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:32:17 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v8 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Tue, 13 Oct 2026 11:32:05 +0800
Message-Id: <20261013033207.1684328-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013033207.1684328-1-zxyan0222@gmail.com>
References: <20261013033207.1684328-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_203219_347899_C6E6D318 
X-CRM114-Status: GOOD (  17.97  )
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

The Agilex5 smtg_crosststamp() handler polls XGMAC_INT_STATUS for TSIS
to learn that the auxiliary snapshot is latched.  TSIS is a transient,
read-to-clear status bit, so the poll is racy in two ways: a stale TSIS
from an unrelated event satisfies it before the snapshot is latched,
leaving *device unwritten while the call reports success, and a
concurrent reader of XGMAC_TIMESTAMP_STATUS can clear it and make the
poll time out.

The FIFO level is also reported by the ATSNS count in
XGMAC_TIMESTAMP_STATUS, which reading the register does not disturb.
Poll ATSNS instead of TSIS, after waiting for the PTP_ACR_ATSFC FIFO
clear, so a stale ATSNS cannot satisfy the poll before the new snapshot
is latched.

Hold aux_ts_lock across the whole sequence so a concurrent
PTP_CLK_REQ_EXTTS request cannot flush the FIFO between the poll and
the drain loop.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..ee79b74bf21b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -337,8 +337,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear, so the poll only sees snapshots from
+	 * this trigger.
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
@@ -349,10 +359,14 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Poll ATSNS instead of the transient TSIS: the ATSNS count is
+	 * the FIFO level and is not cleared by reading the register.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +378,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,6 +388,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1


