Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE1BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nwd8qadBr0UxQpeVs5pWLNg1qZ6CtGQ15NzXNboPOx4=; b=XoPDUyYIjMLanhVJx1w5Uw++Do
	lBzkquBryGjlbef0PSVCYOUVZpx1dqIlFkbVjLtbFmYd1pREslzcAWEzg3WFOK+2OIdg7JiPABQve
	+6vN9d0IEg1uCroanJ1TRqltBDzDFXdTz0DIjooB6fCOCz82ADZo6rInGiHkbChh13roKbtABB+dh
	W2Bn3Lmh0gImkSTExgZC2DupMWjq9rVX31aeZPU8xXUu7qbfWkfp9yOt3hDgY2h8xJyWiVhnrT7P6
	twS5jEUivxsZLYAdPTxYmxycNNBB4h+jWEu6K6/IHaDQ7ZHs7nmQEMlukQy7ZV5xaqwsCf++LfnBt
	xeC+wXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyr-0000000Elr3-0WoR;
	Sun, 04 Oct 2026 12:06:13 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKyo-0000000ElqT-23rR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:06:11 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc02279so510109a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115569; x=1791720369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwd8qadBr0UxQpeVs5pWLNg1qZ6CtGQ15NzXNboPOx4=;
        b=cfqfN0HZ8oY9IxYFyDECOEj9WDPGK3yvRYXn4Y4F6k/DjcAvTEQBUynALpnEy1EvXS
         M7esXSU8dCcbD5JAbY3sQE8yzNtz0ngb37FQICFBtYiNFw3ixFDxsXpVsGkxVrdYZuom
         0EOWG8075ge51IGZl1OgYyfjRRZ8pm48qLgb48p0Jjg5+VlSH9QzC2QZGjDNzcKRrX/z
         jiPVzhkNjZSovtOrJm3mfWac+Kq3UcLsSmxiDux2uK4FxP88YuM6+ReGEqLL1pB9vuXj
         JH90MqhQttxgdq4ZAyypdUudsaeuNma60wHJ3xwxF/pQ48b63K88DAbN+OKI6BqdSd59
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115569; x=1791720369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwd8qadBr0UxQpeVs5pWLNg1qZ6CtGQ15NzXNboPOx4=;
        b=m2ySD50wJGu8BqA/5GZCm5L4NTLB+jfbqtnkJFzHBKEUHKAaFdkxl7mYBE+3bCk60a
         jpCJZihxNzdxX5rrYxhNpiYlIIkkASd5JThz47RMWZRffiwpHkiQsG7FUwSCNNhT1Hf0
         frrUjc0RX4gZO5Fd5Oo3pDFGIiHF2pFEIk+eu1XiWEV1JYkoCjE2URFnweAg4l1iCw7T
         WTGx1yFsS0ozlCVeN+rpnfShI+inXAbWlgN63Q/gHMMvQbKDlRB8TV7DldcdSJ+3m4Z/
         JIq4GZcLj8oQouL8RFdbUVU/W4xDXEEt/KQW97vU+Cq95yKAw4UMSNQePGVPhVnB+Eiy
         KSxA==
X-Forwarded-Encrypted: i=1; AKwUvByLVeLP+prjXP2OGzCSiOrKFfw3yZHmiS4ujNMAO53rfC2tjKz+KgWH4j3pQOI9emc5a0DZFuTh8guqmyo4ZRBr@lists.infradead.org
X-Gm-Message-State: AFq9FYJcsRjgH5C18ZqVQq9mvHTufIzTOf61r+dL2A5QmqfupCBJUAAf
	yQp0/Gj/MAovc9V8ET2HTD9Ypcx4aEFRK0S14D4JQ3boKAY5ykMt24W3Vgk8Rw==
X-Gm-Gg: AYBFou1E11FsqROT9alwh9lkvZ8H8gJRuVLgpSbemvq5FRAluPtdeGy2iXTgzZmKQ7n
	iaNkdu6w31kbNHNYy6JjTXdp0HXDgwgcfkiT82kEQqyM5GD2LbA9qmEdw3ZyPVzastZQ1D2g8Kg
	EO8qJ2Wi5c/NESIfBD/j7OjSy3KvedrxYoAXkxCjMbyyA991h6W8uBwJdGWgyOuefQrNdspBWP6
	RJDv97LQoPMgW3OhmTGfNqExTXySc6UQoq0NnoQb9k/WfbmQ6qPHlnlx2+i1SoxhRhebMDQZXOk
	8uAeex90SM85F9qRxjTmAOk0aEPqFzJ5BvrSy+k8jVXNw+gNawswTFwitqO44YJoOtF/QXDPZzj
	cV2BbEquzmKEwl8GmQ1yw/6oVSRTiSahKyNeSdHtUGV5PAtUH5LkZyGsG2cJ+YtwaNoVPzY/wmC
	rVqLa3tfz/FrthksowIWNPO5gVqBdtiOy/4wtupIaUnZTGF4NztDSABro6fn8e/sZod7aKvg==
X-Received: by 2002:a17:90b:3c4d:b0:3a7:8350:49a5 with SMTP id 98e67ed59e1d1-3a783505109mr3878592a91.32.1791115568964;
        Sun, 04 Oct 2026 05:06:08 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:08 -0700 (PDT)
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
Subject: [PATCH net-next v7 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Sun,  4 Oct 2026 20:05:23 +0800
Message-Id: <20261004120526.2728564-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_050610_539456_8E743312 
X-CRM114-Status: GOOD (  13.95  )
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

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the ATSFC FIFO
clear to complete, and holds aux_ts_lock across the whole
trigger/poll/drain sequence so a concurrent PTP_CLK_REQ_EXTTS
request cannot flush the snapshot FIFO mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero
PTP_ACR channel mask: ilog2() is applied to the mask without
checking for zero, and ilog2(0) yields an out-of-range event index
that ptp_clock_event() feeds to test_bit() unchecked from hard IRQ
context.

Patch 3 wires up a dedicated DWXGMAC2 timestamp interrupt handler,
following the guarded pattern of the shared one.  Before this change
the XGMAC hwif entries used the generic stmmac_ptp ops, whose
timestamp_interrupt callback read the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20.
The PTP clock advertised the aux snapshot channels, so
PTP_EXTTS_REQUEST succeeded but no event was ever delivered.

Following 30300d9f9150 ("net: stmmac: xgmac: Disable the Timestamp
interrupt by default"), XGMAC_TSIE is not added back to
XGMAC_INT_DEFAULT_EN.  Instead it is armed on demand from the
PTP_CLK_REQ_EXTTS enable/disable path via a new optional
timestamp_interrupt_cfg mac callback (mirroring dwmac1000).  The
interrupt is only touched after the ATSFC FIFO clear has completed,
and the handler refuses to drain entries while that clear is still
in flight; it also leaves the snapshot FIFO alone while an internal
cross-timestamp owns it (STMMAC_FLAG_INT_SNAPSHOT_EN), is disarmed
when the PTP clock is unregistered, and is re-armed on resume by
stmmac_rearm_timestamp_irq(), which redoes the EXTTS programming
under aux_ts_lock before re-arming, when a channel was left enabled
across suspend.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/

v7:
- Rebase onto the current net-next/main: stmmac_resume() now only
  re-initialises timestamping under priv->ptp_enabled (8181678a92f0),
  so stmmac_rearm_timestamp_irq() moved inside that block.
- Raise and drop STMMAC_FLAG_INT_SNAPSHOT_EN under aux_ts_lock in
  smtg_crosststamp(), so concurrent cross-timestamp requests cannot
  lose the flag.
- Restore the enabled auxiliary snapshot trigger on resume: the
  platform init resets the MAC, so stmmac_rearm_timestamp_irq() now
  flushes the FIFO and re-programs the PTP_ACR ATSEN bit (channel
  recorded by stmmac_enable()) before re-arming the interrupt.


Zxyan Zhu (3):
  net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
  net: stmmac: guard against a zero channel in the aux snapshot handler
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 36 ++++++++---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 59 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 17 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 51 ++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 23 +++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  2 +
 include/linux/stmmac.h                        |  1 +
 9 files changed, 187 insertions(+), 11 deletions(-)


base-commit: 62d7b9186cad08324d6b9d262631104bb215e67d
-- 
2.34.1


