Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B39CC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lH7vabi1ElgAOD/H3yIzbFBlm3tuRz9eFpdl+CXfo5c=; b=iAM2g6AnUaiu/AouFT2+WMgxWE
	jvqz2GH29FiNmdS/p6B2U/WtGDCYBcXp3OwFZqkYs6RS0GwAPGATtF66ZCKY6DVtFf3a2g/+nP8M2
	cf/Va1vxGH/lNuXN+FTdzhGDXs5GcQ/sT1Q/0ha2SWuBPFTSuwAARHe/5zbUm3PeNve/aojEV+TVu
	Gw0F88/8xYlL6cj4CrEdoMfJCA3ss/u/f1My8o9p+igdNNUvHMoDL6E07sd5hiRsFkVe+yREZvYFR
	8QCILxlBM5p5CuaiRwmaXLEM1wmlOpXXU8gLuHXmb3tTAe/BOebBexH05IW52t59Zpj2NBaL0JRyK
	ELi1k3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSOn-00000002dFl-1w69;
	Tue, 29 Sep 2026 07:37:13 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSOk-00000002dEs-4BLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:37:12 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a494638445so561972a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790667430; x=1791272230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lH7vabi1ElgAOD/H3yIzbFBlm3tuRz9eFpdl+CXfo5c=;
        b=Wi6RUjY0+tWYujJHb1CzNKVSaS0WXLl5lgz9cI9UDiVadbhY1sXHNYPK7AogfizyUG
         aVNpFEzbI46o8eg46psdYX2fKtYcRge/L6yA2MdKK3KIE8+DsrFlnQXFsFrgi3bKer/T
         syIWvKJBU+1qtCTnK2Qtyot5lhyLjD6BBDp5cFtnxpGDz5k+oXIIIFemFyd0eqEne+QC
         7sAkdZTGs6eXMpXsvQh6nGUaytwKaMIBWdk+KvJlRt8tlcBbp9QNtD5qMKz8WSUVvQFV
         JhHnruF+4/tgGT0Oygm6KaZDFUkzE5l7DrMau3OhaqEdAy7nfEAQrXqRgSm+GqOkdl+G
         VoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667430; x=1791272230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lH7vabi1ElgAOD/H3yIzbFBlm3tuRz9eFpdl+CXfo5c=;
        b=Vc2FNAmYQhdjz5xaceu4+QXOlpGEr/Mt/ugYvwtpe9erIeUecOsaLxuf0myOYz4mHd
         Mybp5rVB0Imha/MCL/Y/OgKzEECIPb9Jbps8LP9ect7GB2P5LTZHNtYFmy5/unNjBY+W
         1pLuEJYlMXIiDCl3HhqSex8UpzXSb3+TevmWIsdaM+rw5n8Gy8a6xe5TexiamI1Ya2F2
         a3bukMRkEkAY2/CWZlBDgpDdR4+inv5cxLIhL5Xow7M3KVSFjo7RfAqtVRHS8bzsX4jd
         3wzjo5MweR9un+S7zhAV2EHD0IHzlyNa0ja/2+0SMBfGR9JfZTySDJg3OM9VjRj0zyZ9
         Ko2w==
X-Forwarded-Encrypted: i=1; AKwUvBxW5V+otTWlR2XCCDfty7kiGqyiHakyknf/6ENkbeKkR3yZErpmaGzQuvuvzggz8OltHxv1M4tvMNBFbZKb+Ela@lists.infradead.org
X-Gm-Message-State: AFq9FYI+ARkkm6DxU/AsaeyA9sLgr62nX8bWnBQ2JmW4bybnX8ZYv9i9
	E7/bATIrnxiXzvjXiniwSk4JOiyi7Y4D77yEruNN0mablPe5C7xmJKKE
X-Gm-Gg: AYBFou0oRCI8oZbCylH8iJS3N/NQR7mc6I8Nr5WPQDjnpTMrR9Qy23FHz3d+mrGbDPM
	Iju0D7ruYd/1NcB6z7wYr0a5bRfT3Gsa9fMNWu1vgNRPqfal95WpllOIiwlkJzZMM32egnuxHl2
	fVJD852JkSr4SX2446xnj6g08cvBL7tFyyTrSRE2/B21nhrfsyhDwyroXX3V8mvbAf56El0pM8x
	1J6O1PmeyTyzf7mbw1XbSl5pMNZFLAiNwBRRvlWIFYjut75eh5t01087HTPKnXlA7krxvNVJoV+
	0tFCbTa5thDTU/jTrLohpPDaiA2+3Av+UuJNMJu/2G2+S1nndA01KLKcXCeRBQO2d9lYl6hkj9W
	X2FY/Po1fgThCQV+/8EWIqFPV2/dI/ugSFJfakPN6AxzHeqWT+ecEBDGwrafa7VJVFmb5Tm0jux
	X0YWIm3LhQF2eFr/rJ3RPg/6N+jncpg6J4/IfBuhxBd4q/Qan9bG2tMYK6iRPQ/0kdqxfZdA==
X-Received: by 2002:a17:90b:57c5:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a2b04e8394mr3109613a91.42.1790667429672;
        Tue, 29 Sep 2026 00:37:09 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498ecc986sm1328708a91.3.2026.09.29.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:37:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Tue, 29 Sep 2026 15:35:50 +0800
Message-Id: <20260929073553.4136336-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_003711_042274_D9A05367 
X-CRM114-Status: GOOD (  16.27  )
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
stmmac_rearm_timestamp_irq() when a channel was left enabled across
suspend.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6:
- Hold aux_ts_lock across the whole crosststamp sequence instead of
  dropping it after arming, so a concurrent EXTTS request cannot flush
  the FIFO between the poll and the drain loop.
- Arm XGMAC_TSIE on demand from the PTP_CLK_REQ_EXTTS path instead of
  adding it to XGMAC_INT_DEFAULT_EN, addressing the review comments on
  reverting 30300d9f9150 and on the missing disable counterpart.
- Reword the ATSNS comments: ATSNS is the aux snapshot FIFO level; it
  is not cleared by reading XGMAC_TIMESTAMP_STATUS, which is the
  property the poll relies on.
- Add Fixes: to the EXTTS support patch and guard the shared handler
  against a zero PTP_ACR channel mask, placed before the new handler
  so every intermediate tree leaves the shared path hardened.


Zxyan Zhu (3):
  net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
  net: stmmac: guard against a zero channel in the aux snapshot handler
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 36 ++++++++++---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 54 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  5 ++
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 17 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  9 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 8 files changed, 130 insertions(+), 10 deletions(-)


base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
-- 
2.34.1


