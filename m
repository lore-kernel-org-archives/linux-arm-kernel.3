Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3692C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cejd0cZegTiU5eLrTw8z7B4m6z4YgdNMNLU4CE0opBk=; b=oP7Z5r+CkBc761okAlHycsD43T
	nqS1BgWqmThCFJ8PQQr//eqxEFWaA5k6uoIbQOAmb+HBufdlWeTII6ETeRkzcTCzERvHdoPrGA4Hz
	+dc/p6xPAJSqukuodwnT5phqw7IoudKVFD76HfafIvc7MCY+Mk6w6EgbbYiCiHV/TLIEfBbjQdQt8
	Y10CZP8MKcVbY9q4dJTePzlc8mudkkkNjlK+Ltf99TAEQCjKOaHCTB6QR7NYJiUMUsBqTOJh5o53k
	SQOqNuFz/c0odVk1UYF8GdsyYj5rhyKmF0FW5QhNG+gvEgzYXNj15DksB0PZjF44w3JTDEtQYKuo/
	tgsN6z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1koG-0000000EmIu-2XhP;
	Wed, 02 Sep 2026 13:15:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1koD-0000000EmHs-3ggG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:15:23 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8557c3f270eso501103b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354921; x=1788959721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cejd0cZegTiU5eLrTw8z7B4m6z4YgdNMNLU4CE0opBk=;
        b=SI63igwNieNzUh9d5tMJOZMkL4zWNUl6BuaI7btOtt6X8Um3zNoc7kUeuLt/VaWpPc
         +9INfLQUVuX9A+ylwZugyaWff+e/OvMT3vHJKdNQoYVrlu0z2Gojn0nr/OzdWtuKZR9F
         UKrs/RpuhI5jO2gtCk2BCC6fqBkJco1u52dh5mrqwlrkpgLKWS9Dtv2S/hOMDn56S3u8
         wfi/3EqsocE/U5zu+anDDgRjuh5+oG5pV89kHWRKARa4HGkxGf1BgQvxH/idaZSo8h/z
         DOmY+ZzxFGcums2CK/mkk+q5PlR6ggzr69jbPzIWEMhdK23nZGEaOSzqu0COP7/hXN38
         sKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354921; x=1788959721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cejd0cZegTiU5eLrTw8z7B4m6z4YgdNMNLU4CE0opBk=;
        b=qJYG851YJIhgip1iiEw4661UPrW0+EuTRk2S80HdMy2RDgM0z1IAfQNmZv6t3lJ1qM
         dGEcnU+36bO/+V6leR9iOMR5vLrlocifvIzGp8Kzfa2KB3JyIxnz0mr5szmF/UySPbBX
         jGtC5Iv4BS9F822Uaky6HuoMHUHPNWHoGxsp3HOICkjbidJJG5GRl11raFW3zKDdwMSK
         5smEMHSTEn1qJTsz72O+iW0r9zFX8OmZOtyivCABjJv2xVQPlhZXYK609LsdrlxIKCVr
         3wEIQv3UODDHxhHnS3zAPh9nWCyvT5E0zLO0g5WvXZLNjFYSjIrPsUiOD+cxRZtGrCDS
         cMTA==
X-Forwarded-Encrypted: i=1; AKwUvBwzHOa75UpY1xzOPUbnLizZwTVHRGeQXaJ9ofIkmy57n/AlwfhIyAf/o4cEGyitCfJxK813pRzX1MWIsawllg/Q@lists.infradead.org
X-Gm-Message-State: AFuF++nKJ9tqZaxJu0BSUiPCVOdI+L2Fx0xfDEH/K3xNOpNA3YPmdu0q
	zVHZGVM1VPOzQMBoHK92q8GN/R6M2t6fDqZ+IrPTax/ts0HDNEaxEETo
X-Gm-Gg: AYBFou3pkgOwXmwZZcJpsTyS13/mQBOFriakbQMi80IkNfljHKLZIhDOEfn9KEnSV7E
	JPW5rLWTF50mP9H49JbRWEno3LMAdM95jigq3YQPgrQ8gh1gtBrVhbDxbSr292nYuIdZ6NV5FNJ
	zk8AB0ye8QTHX+Ui7Fgrzoo5FmELxv7DmYe2EXtIGoqV1adPXtCCw3UfNn5ns58BaTpqxIunIKK
	jLe4oJjwAzLoB5dZbXYQrwFJKiSGaKORrEAfCtvemMyrv4++NUhGIzytV7xo6FPTPpeXObAb+8I
	J7gxktEn0xPjQqxz3WYOg6vHOIoXgXE7pscKnES2WT4/G4ZcnwJIhGxx59TfJu2zTzysjBfolpg
	L1+ZCFpV4cvp7ztZzR+BfsPD+g/pWqLasx4ggosEnKe1uhpVeNhwXYuogrJSlMGOw3WjKrPpgNi
	AWkkTItCPc9jgW9eAfq8EfBOzC1YTAiSJtsi9GrVIEPQkhq33XxV8qe3U62Q8=
X-Received: by 2002:a05:6a00:6c99:b0:84c:4b58:2cec with SMTP id d2e1a72fcca58-85ed8ed8ca3mr7824675b3a.15.1788354920846;
        Wed, 02 Sep 2026 06:15:20 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85da342023asm1398533b3a.0.2026.09.02.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:15:20 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/2] net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp
Date: Wed,  2 Sep 2026 21:14:41 +0800
Message-Id: <20260902131441.322167-3-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902131441.322167-1-zxyan0222@gmail.com>
References: <20260902131441.322167-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_061522_396415_68846B6F 
X-CRM114-Status: GOOD (  14.02  )
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
process context to learn that the snapshot is ready.  Unlike the Intel
cross-timestamp path it does not set STMMAC_FLAG_INT_SNAPSHOT_EN, so it
relies on nothing else consuming TSIS.

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


