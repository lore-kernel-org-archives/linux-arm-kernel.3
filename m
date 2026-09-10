Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE7C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31zePXVLBWNEdCU+Xr18Au8ugINcScI/iDLGt4y6SQ0=; b=OiYIVV3M1KNEdT06j59ehNJt35
	kOloMbrejHNU/DpbeSQfHlOxDEBdNLLTcypXEygv4YqGdUDJ23iQ2y3I4pM9cSiC8hr4cZGw6hxFl
	JUjujJWXy9vbh7cChup7cayrNbx1qi79O+KMLlOcik9kWdWzjS7LgPaVjIYYelMg5ddZlOG86PDGu
	WIBaTd1L1z8xf9H651XDFHSyxtAfJjAdw3MDxJWZfUq3NcxTwKG85Cym0Cvom2Dl1YfFrgFz0rJZQ
	8ClXD1zI6rrX8XbspaXiIWvTppXqokwcfWLgcY4Se8NPA70PcCH/T8yINukEWJKDdH0V/3IqH8jjJ
	RgR1jpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zrk-0000000DhJH-2vWQ;
	Thu, 10 Sep 2026 08:10:40 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zrf-0000000DhGZ-00QY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:10:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-398b3d66515so6972076a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027834; x=1789632634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31zePXVLBWNEdCU+Xr18Au8ugINcScI/iDLGt4y6SQ0=;
        b=RNLRQ2MW1gd2Uh7w9lj4cDywpTtJ7AkkpHCMAXT3U1Zb4nj8DxpGuUqrNmreTNycaV
         h6glyN68J1E3G3qOPqEu/CgE/ZdteN157kHSPKrKAGOO+Aa4xeCy4gCcUsBAHVhZC67y
         ecUwuWNikiEvmeYppIr8mxqre9b/ZTIHvT6VBq9N3rcxGYz5GcLUW5+14JzIeFyAhLNx
         DzIP02pDX/uW97q9GgXbsJrs2af7mG0ZquWIzctRTTKj2DUsgN3ojWF+jZ/lkzMz+1r3
         7MykhwPLRj9mxQli7FuHxkYLmTEgt29GDA+n981bcU2/bwXvmVYFw1ML/nwn+UUi4kyG
         J4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027834; x=1789632634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=31zePXVLBWNEdCU+Xr18Au8ugINcScI/iDLGt4y6SQ0=;
        b=NeQJd8R8TGl3dMG4RKq1Ey5Bll5Ge4bTIaj3nSzOZwbFrYh40502ZvGNUf9kwHe+bD
         S7UxV6CX3M9+M0UiD1g1PkhQIAy4mndhPEeCiRiHb1A9NMcvbg2yL5gM3xA2bPriYH0g
         0AUAeaCxgvLrqxRG1V4vE6eLG2iBe092s5Q1RWaNSMKzYr5b9+6Vw9yKoP7xhOKoUF3l
         9jtnoOa8a0yyXXD1Tw5UbyuojLu3xyB0sXhB1spFgerd88Ob32703DZN+rCdh6C8GNBP
         gd8V/mqFksU2cxuvNGmsny8xYS+UVJB6lBu6P6P/bIyu3eS8Zx33exZx1MQw/8Tu7fzI
         quXg==
X-Forwarded-Encrypted: i=1; AKwUvBxV6/UPmIasjByXwgSXZhl7j3lKn96RX9rUDxz1m9zH/yxHTRstdLt/omoKEBdCKb3z3q85kUFcitcvOiScu316@lists.infradead.org
X-Gm-Message-State: AFuF++mBSoFkCOYv0hbQZSWJWq7nit06EhG0UHwvsttRZCoU3FR713Lp
	SMMWNCfFViBBAwBZA1Ft9EoEUI/0d9X4+7zJ1HC8uA0MVlojM5aFmww3
X-Gm-Gg: AYBFou0mlExMTeE/NxPPVYtigYCOogk3nDQ9V+/UURiI5fdRiMmw1JWgqpljWvM++Xz
	xHSkEyH/99eJYY6NHzVX/9F95FeR2W69Wx80F3nj2QaTza5Bc7ldzv5cUDCjWx1KrucP/9atwW6
	uM7LBbHAvCAt8/99oUkn2dt+/FaTCUpHWBcp9HA5x7/rEzgJnfsZzEtLo6iNW9WeulfKHXgDQX3
	u/IE5u3z0SZDPO1Z5eXt3z8TaLUzFzmfmDHciMKEfp2OFa1ZhtRkN5LmGKiF0nvujQRpI0mJlzn
	PVqF/sCRsoboK4z9XJIs5jXrhCdzGPb+k2DO5kggPVGmf+MRf+A7r4RwIYRd+B3l4EQNAeXsaf4
	ETBpMDo9ArSTBewUZmBWwgxW9/1DA0mYjDMHcw8JxDU+hYA2rfrSDdD4AQWk1r2xc6UB/wW4s27
	7WqQ9dObk+Be3dxfgg5q3RZrLkN8SfURmURAPKyvnj8ZbBWTdGXeDRqV6iwow6Isp6tRtq9nv15
	jDB0pai
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr59997599a91.19.1789027834038;
        Thu, 10 Sep 2026 01:10:34 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4442434a91.2.2026.09.10.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:10:32 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/2] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Thu, 10 Sep 2026 16:10:19 +0800
Message-Id: <20260910081020.86227-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910081020.86227-1-zxyan0222@gmail.com>
References: <20260910081020.86227-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_011035_161779_3CFAD3FB 
X-CRM114-Status: GOOD (  20.23  )
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

The auxiliary snapshot FIFO is also reported by the persistent ATSNS
count in XGMAC_TIMESTAMP_STATUS.  ATSNS is cleared only when the FIFO
clear bit (PTP_ACR_ATSFC) is set, so it is immune to the destructive
reads above.  Poll ATSNS instead of TSIS, wait for the ATSFC clear to
complete first so a stale ATSNS cannot be observed, and derive the
count for the FIFO pop loop from the value the poll read back so it is
guaranteed non-zero on the success path.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..ee6f28637878 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -340,6 +340,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	/* Release the mutex */
 	mutex_unlock(&priv->aux_ts_lock);
 
+	/* Wait for the FIFO clear to complete so a stale ATSNS count from
+	 * a previous snapshot cannot satisfy the poll below before the new
+	 * snapshot is latched.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
+
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
 	 */
@@ -349,9 +361,17 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Wait for the auxiliary snapshot to be latched.  TSIS is a
+	 * transient status bit that is set by any MAC timestamp event and
+	 * cleared by reading XGMAC_TIMESTAMP_STATUS, so it is not a
+	 * reliable completion condition.  Poll the persistent ATSNS count
+	 * instead: it is cleared only by setting PTP_ACR_ATSFC, so
+	 * nothing can clear it while we wait, and it reflects exactly the
+	 * snapshot latched by this trigger.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
@@ -364,8 +384,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
-- 
2.34.1


