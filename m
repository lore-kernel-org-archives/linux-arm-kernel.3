Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A83FD2D9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ohidppn0DDN3kquQ+UkqZeq+6ADdLoEMttZZlZ8FD5Y=; b=fzcsjnpcF22pCcPrRHY8B9UWoP
	FeGM70gqyYcAA9GXu3cOkL2g7DlKkg4xVyESyloD+PoWIboycuAaVNnhyjxvY0LpWTS4RERmFSZWN
	PcAu4z7EbqPcR2P8Y1M5+PwPEVzlFQJRorxm9hOhpELJ4u+4O9kkILOSKvF7YGdkzszAbfBBDmBi8
	7ejpyZ82mNjC3vdBnZ7Fvka5l1tUt24mprY+C+nFlqBLBttvc2QofR+5phWd+bRMVImScpiRysOo5
	g0z2N5Da9H5ykG1+5d+ALEsqVSADiKPIu5zLzShJEtQ0MoAUtObHgm3X2uFi+mK8jYI+H+Q4/mSTq
	y6oZIp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxex-00000009eLq-38KS;
	Tue, 10 Mar 2026 14:02:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxev-00000009eLT-3lzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:02:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439b78b638eso10199247f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151323; x=1773756123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohidppn0DDN3kquQ+UkqZeq+6ADdLoEMttZZlZ8FD5Y=;
        b=ENNxQNZAyJvLB8wz8ksnYaOa13ECrUNmjdiHpQq9iUk81PiVjkX7RX+ZyhJq6VnRoH
         wfspBTrKEw0OOsP9KGyFqyKT4y6k7g16lErTOEcNx4BuOI0sMv21gLxFjZcgMhILeyJE
         H4/v5E0LZu0u82jggR2fZH/On3KSXoLS6UwgaPNXqLMj4zruyc0kd5It5YFVu9kUynTe
         vXOC0e/fNazKETr8GYvb+NlWZYuqLkVTlZeLJJbZZFASubwOx060GRmObj8g1V1LgAJo
         tKkRM/vTqqIgBKk57GMy3mWbhwNMt/IZ2m83z8GabKwlKQTT/4exyN5aCEeghI/1A4zj
         2VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151323; x=1773756123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohidppn0DDN3kquQ+UkqZeq+6ADdLoEMttZZlZ8FD5Y=;
        b=JPSRdNnL3sCPVlAAuZsXyVs84QKXBiTLSOWcY+m9EG5qLRqS0BQjqsbafH3+s+NcRM
         /O2w1Qc+vyVwiZFoD330SnFrBZ4BjS0gt24hZ6Pc/WqDd+odSXUyBn/eX7iIPTqPQs8L
         YOX7hzNz0ZUy1QAqGGtfIzsMZlF50vmCK21lgitvmBtV+IZYShEQjnd5cxdf6PuImkhn
         WcnUMG2ys4G95xJLbxAI2IX7hKeG3egnwOO77gWKxiLF7OFPpULzNwwQjQ2HSBIOCNGU
         0lMuJbNOsuzagFd9lzf8uw3dc9S3l1303mW2tqw83cA00fjU+0keZabBSDEPCDO4TKHQ
         0jpA==
X-Forwarded-Encrypted: i=1; AJvYcCXkGHZXxK9pdDplTcWyMEZRksAki4wgxaG4Pg2lyToXhfI73kZVMPVdxyooPSyCKXwHNJzX9HonZOZSZIM3dTRd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3gagcYSpsxnGpK5g3Fy4gukXXulAG38jBfP49AiqxGAKb/ojS
	CkN667Ou3+pfdSBqAL2kyc1qJMGHgeuJLzJWqSVkrz2B49lP8k04Pp9nCdNdYFyK
X-Gm-Gg: ATEYQzzfikSYlZjSr+tGu+UQNsvDdsvzbGjlN7V77OtSTS1bfvSvSNSIOIxlWceySSQ
	wtfjZDVrT1Cm+/uBj+d9pvk/X9a8wH8n90HniyQrmjq2ApY2U+D0zJS9KSDQyAWNvf/G2H9hVWa
	Cct07uUNdzmN58pqrKC6Hhsvq3b2XdCGzReMc3nH5sjFBPLDSOTZDm9fXFGzB76jmcgyfxk2z2N
	wJ6cvaormyyXe6xOtqjEhLAFa9YivpJ2K2GZz1al/4SmNBM8B7jMHtKQXLUbKNf395m++EiGQKH
	O3ukmYRf7iHr2sbBA+G2cWbe/sbJoMaKU2ehZbKPWLKgbcZ1DEDYBs4JzmPjehs0jA7wBI4GoIj
	MkouiP0Ef2mPLTwnbplqcLz5AXlF8YB3SfiZYXSDbacQDKufg88ANR6+7SdjNkXdOPYGWdsB/Fo
	WEXzbG9AnukWyZ0uYk1H+Ch0a2TChFogh283V/PdF6pR3pZQJWW2sXSjPtk5NroAwVDJwcr6TXF
	TVJIckl3Wju
X-Received: by 2002:a05:6000:144c:b0:439:b7c9:2ef0 with SMTP id ffacd0b85a97d-439da88cebcmr24963018f8f.33.1773151323051;
        Tue, 10 Mar 2026 07:02:03 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3f267sm34409645f8f.31.2026.03.10.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:02:02 -0700 (PDT)
From: david.laight.linux@gmail.com
To: Johannes Zink <j.zink@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH resend net-next 1/1] net: stmmac: actually error requests to change the auxiliary snapshot capture channel
Date: Tue, 10 Mar 2026 14:01:55 +0000
Message-Id: <20260310140155.3359-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_070205_959999_30E32025 
X-CRM114-Status: GOOD (  16.99  )
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

From: David Laight <david.laight.linux@gmail.com>

Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
request whan a snapshot was already enabled.
However it tested bits in 'acr_value' after they had been masked off
so the check would never return an error.

Change the code so that the test actually works.
Note that when the commit message says:
    Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
    auxiliary snapshot capture channels were silently dropped and the new
    channel was activated.
this only refers to two commits earlier (a few minutes earlier).
Prior to that only a single fixed snapshot channel could be enabled.

Note that the check will reject requests to re-enable the currently
enabled channel.
Plausibly the best fix is just to delete the check completely.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Resend with corrected subject and To: Richard Cochran.

Found by a test for FIELD_GET() returning 'constant zero' from a
non-constant 'reg' value.

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3e30172fa129..aa17335a2031 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -222,19 +222,16 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	}
-	case PTP_CLK_REQ_EXTTS: {
-		u8 channel;
-
+	case PTP_CLK_REQ_EXTTS:
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
-		channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
-		acr_value &= ~PTP_ACR_MASK;
 
 		if (on) {
-			if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
+			u32 enabled_snapshots = FIELD_GET(PTP_ACR_MASK, acr_value);
+			if (enabled_snapshots) {
 				netdev_err(priv->dev,
 					   "Cannot enable auxiliary snapshot %d as auxiliary snapshot %d is already enabled",
-					rq->extts.index, channel);
+					rq->extts.index, ilog2(enabled_snapshots));
 				mutex_unlock(&priv->aux_ts_lock);
 				return -EBUSY;
 			}
@@ -245,6 +242,7 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 			acr_value |= PTP_ACR_ATSEN(rq->extts.index);
 			acr_value |= PTP_ACR_ATSFC;
 		} else {
+			acr_value &= ~PTP_ACR_MASK;
 			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		}
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
@@ -256,7 +254,6 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 					 !(acr_value & PTP_ACR_ATSFC),
 					 10, 10000);
 		break;
-	}
 
 	default:
 		break;
-- 
2.39.5


