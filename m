Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A722AC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djPZzMb89wYlNjLL6Fty3Ib9LSWHKIU4RnghfXD9YU0=; b=WrCjSa2sVI34E/rYh2tNvUPEzz
	YWo8SctIUyH2q1KxTBjb0HHK+byDeA8koEkbhIg/5jnk1QCbIf1Zf2Wv7zgHErIelW06IULCM97v7
	QC5FidrqtWHr75xSIuDuOnAsPyT12UdoTDt1nNntIsbt+VkE6eEJvnUSZn8hUVr4fuUQln/jLTb5F
	rw3xMMufWi5DCtizXor2BKmz2ElKyihLFd18yX6k3nMdQ7sEupuV3Hjiv6oOf6PeqOXyuuJexwkRR
	A1lXUP7vCk39C9pq8srqMYfo7urFN2tgrfi0hZnV5drJ8IpNHAMOQWpNMudMyvONv2wiRHKqee7e7
	SiR29gyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJrN-0000000830M-1CT4;
	Tue, 18 Aug 2026 13:28:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJrK-000000082yi-08DJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:28:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fd4531020so2792928f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787059684; x=1787664484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djPZzMb89wYlNjLL6Fty3Ib9LSWHKIU4RnghfXD9YU0=;
        b=pszF9ghh2prZrTnyVzkr5yF2M95qpIzGJ2LbkgwlszgUyVbIsHA9xeu7QD815ed/xH
         YZ6HuEO3L/OmHMFwmPuSGTkJqHtjYP/malZ8/3B03nLfp40LUTXgRtXObG0giBErOSQf
         BaXmE/ppkR8EH90UAiBfVIFNLld5P3ZmH1kjuGa26V17FBYlbl4jkXf9dXaWcwXxP9YL
         Te7A8+UUoW5Ipzd+eaGrrYybXNZf2ByJaLhgm04fCgt0Jo6S6CxRwdaNA9zf1RSajBeV
         cVGsAG7PW5mvtPzTMJmCWX2QpHTtWNtHfzNPjKyDgqOUaeYZuHJ7dFCQM8RbhQlOYTRY
         7NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787059684; x=1787664484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djPZzMb89wYlNjLL6Fty3Ib9LSWHKIU4RnghfXD9YU0=;
        b=AAYS1tggHrg5Ojw96Ob6jpU/gsH91L4AU2C5Wd90PAQHVe8WZdOPsJrBpK5alvlF+S
         RzGPql5DkM/fK5ee0iciRe6Y8AX5u3x6lEYB/B7jh+lfdWdc8npu+qJjVrnU2Mh8C1Yb
         xn/nSOU5IfZiXWweZHw2C9YNcml7oOevwHqFIgv/oy38Y9bRwPIHcUNsORLYWpCLEkLO
         0/RvvVc2N+FTwReaESU3nMkPTudSp9mo6oHcG6vCEBWQCp/rzT7GF2xTejVd9epxktuk
         +iqp/bLjl+0+Kg6ZagxqgnUN9NwSFaFovxrJA29q4APyAGT8AyLWrRAeKc9ZHCDNTrS6
         dkdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqORdDO2awOaWDVolbzFskSnezWeZfNvbGruGuUaNggpdOuTJKv6qWdtZ/fhv1gZpe7LEOzRTeNi3yVNHteIVB/@lists.infradead.org
X-Gm-Message-State: AOJu0YwA9s4fjE10ASIs5ZMA3I3jQluPKGEapC4VuNSOcIR0Xjx+OTbc
	0ax45pGpKDWKG6RIkqecdb4p2Lm3OYUA4I+HqAuwRWoD9U7+TT+1Drx+
X-Gm-Gg: AR+sD10/yPcTEIavmNBC2s3wdxrA5/uNN56ZyDklLHYKyFhjCOMC8YSoGjUSfScxF2S
	n7nT3PRICXjCyIEfPUxBLR8n1/mTGKzLa3iROiRCm/Zl0uPmFDdqoWq7fgcPn9WPsb12UvrU9rE
	iYuuUMwgGVlmfEjk1k3RH2S/ADBS1BQeVW5oKSbQQbyYNbMxoiDAiEBsA5jz28oVNZRKQddaloF
	iElmK93MZpfom2Qx7Is13IynKInGnulAxsXGo+xfOzq1EBH6UcTOzVLjpK2gQE/Xjc6d2q2NLgu
	aWGUqKe9LNx996S3l0jQboKbTs80zz8sTjo1jXkoAU08mfF4qVep1WMGBmI36qpppxlGU/qWGM9
	c88S9Gyqv7DSraJXs3vLa5QTR5P27sxg2/QmRLGhUeuN9BO6BQpgkrYYE8ITq7Ueb5jbzgg6yN+
	I69G/0HyYFhFfMRbuZoOD/37PG3V6GJjAbQpgphUh+Zd1rKjvgg841cl59cLE=
X-Received: by 2002:a05:6000:1a85:b0:480:c5:d635 with SMTP id ffacd0b85a97d-481606ac8bemr51077592f8f.0.1787059683663;
        Tue, 18 Aug 2026 06:28:03 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7c568sm12140145f8f.18.2026.08.18.06.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:28:03 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	richardcochran@gmail.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v3 2/2] net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp
Date: Tue, 18 Aug 2026 21:27:22 +0800
Message-Id: <20260818132722.1852876-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818132722.1852876-1-zxyan0222@gmail.com>
References: <20260818132722.1852876-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062806_095536_CBD0832A 
X-CRM114-Status: GOOD (  12.43  )
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
snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS in
process context to learn that the snapshot is ready.

Once XGMAC_TSIE is unmasked (done by a companion change that enables it
in XGMAC_INT_DEFAULT_EN), the DWXGMAC2 timestamp interrupt handler runs
from hardirq on every timestamp event and clears TSIS by reading
XGMAC_TIMESTAMP_STATUS.  That read can win the race against the poll
loop, which then times out and makes PTP_SYS_OFFSET_PRECISE fail with
"Wait for time sync operation timeout".

Mask XGMAC_TSIE around the snapshot trigger and FIFO read so the hardirq
handler cannot clear TSIS while smtg_crosststamp() owns it, and restore
it on every return path.

Tested-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..a4d00bf81423 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -310,6 +310,13 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
+	/* The XGMAC timestamp interrupt handler clears TSIS by reading
+	 * XGMAC_TIMESTAMP_STATUS, which would race with the TSIS poll
+	 * below.  Mask XGMAC_TSIE for the duration of the cross-timestamp
+	 * so the handler does not run while we own the snapshot FIFO.
+	 */
+	stmmac_mac_irq_modify(priv, XGMAC_TSIE, 0);
+
 	mutex_lock(&priv->aux_ts_lock);
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
@@ -329,6 +336,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		break;
 	default:
 		mutex_unlock(&priv->aux_ts_lock);
+		stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
 		return -EINVAL;
 	}
 	writel(acr_value, ptpaddr + PTP_ACR);
@@ -353,6 +361,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
 				 (v & XGMAC_INT_TSIS), 100, 10000);
 	if (ret) {
+		stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -375,6 +384,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	stmmac_mac_irq_modify(priv, 0, XGMAC_TSIE);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1


