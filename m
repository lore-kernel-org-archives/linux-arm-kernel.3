Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DB1C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uzv/JmEo6dRoaDeN8R/MmzC/JFKPPs1P6QOp8MtYRWQ=; b=eSc3IsToC/fchDhP8sLZnBDR3g
	W4aWsw7TQh3xskDw99hrhVMbHn1YtezoBS5eOy25gimcw28xGnynDGPiV6qM8NOX3LLtkSrz3rLZB
	uZc6BkWEo7jB+ddnQxgBCPaqrkmOdyVfyX7mzGk+qvvtAo7T6ZKEDj4OpPTvm0Pa6rKL2zDc+SuFS
	gSlXfRW+7r8Zs5Yp93vb1lyHYwmU7AFhTKaohz7em5DpghdurgltDxD70UoFBoq/QCEWBNdwXBT7G
	Q7sBFtqae+vAJKJTQK7IPmWpltRp700XvxBa9u/3Qm3S5vBxSCkyNoa6rRj9oId3m/H2IqQtgC1Xg
	BJZcU8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ko6-0000000EmFU-3oAW;
	Wed, 02 Sep 2026 13:15:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ko3-0000000EmF1-3eZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:15:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so834129b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354911; x=1788959711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uzv/JmEo6dRoaDeN8R/MmzC/JFKPPs1P6QOp8MtYRWQ=;
        b=js3zJqycFQnM1dyXAztNmtU4aDcoUup0btFbM5Op8IlVZ2WFcoDPR/gl+pwZncLM7F
         I8w03r0GlSKGhte0g8YU94kjQOouv/0R9iibUuX7y5dUT6693RC3a846na5Oz0akWZ6l
         J1vq+E+dIIJ8y4TJJTRqqr4R+GEwDJTZasjnvwUPFEdesoMGwdtMWrIyjOtK+wO2vzvK
         L3wwEB5F3nF47NsoMnW10ZekIKjkkjqxjfJaewLLqnaLwTN72KYxs+2DjI1H+T/hQI90
         x9O0B5xFPw3NR370pmHyxEV240M3GUx57Wp4FNYKxKJxPmtTRtR8tVBujp5dopxtMRdm
         uB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354911; x=1788959711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uzv/JmEo6dRoaDeN8R/MmzC/JFKPPs1P6QOp8MtYRWQ=;
        b=rRlrZg7QYRXoQ+GxKIEe0huNbhYhPkJV/ZqBNWaeczMzdgmtsFYHEvyQmhY9fiOQkE
         4OwAZE7B9VuCStSUlUUaA1uPht3hK1sHb41cHG3lrNyvrQzoGUcdp5BwGb8mZYWQsVkk
         X53Nz/yLu8Uertgw0HnDbCFFJOmVv6c66r0w1ZOnYUxzCKtPv3vXscQx6h0wuqR0TOie
         7wdYaZA/bVXF/nKlU6z8Swd0CaarprF5lbc2EtGiwdsLGUB8hnPwiRvOQ228I1favSbD
         IqMBuaWFc4FwgVyLTvqA6vtRh1AAgkFAVwT6fk9diS83EmNW0pYbsG8ROXfgaJbJQ8MT
         dYGg==
X-Forwarded-Encrypted: i=1; AKwUvBxwNT/4UXDTj6PxaJF1QK5jL+/VyUnRbsoL4FpuU/UsnDB49tVXBlSgJhqrRtglvi5IQjENftadeLmERvSEujGn@lists.infradead.org
X-Gm-Message-State: AFuF++kAS05DlGK15oDSxRKHql88J5rJK04gSmeLoA9H9pqdkHMSH9hm
	NwRD8IdNw2oU9u5HUtnK+ulVtyqPwMVV5XA5rdt+6LoXZF/j5QDUkDLe
X-Gm-Gg: AYBFou1qLegIZTf6S1dKCfOTp+jYqhQBq/pw5HRXaA+7/Tz84FAfVd2R/3US38Ii5La
	LqbR2RB9jnQonoCWdQ9kzPfZP1nN9sr8NqQY57XoPGFtM95KI2mLmMUe7KQI1V2TnsBdM8RDnlM
	9vjnzNaj00twi9626x+I913JpAcCLMwmrFXog11y4YLOhioU9sGWp+DKbOS4zFYKf2c66kJOyIt
	i/LkUGGikEqE1Sm13+EVbWiloP7yZ6L8k+fuZ2vO3+zgJx/siyLk4ZW04Co4tCbcH7TWrR1Ccrt
	V8Vt50Zdn1RzbBEe0IURHkGqOAZyQ++JRnKOYSYp7x8XL9gOj2/OHgAo+t1hY8Y/eY59HJKlL5A
	9fbLU9JfmrWsL7UQ4T0o2txEp3p785e9hwd2ooiJ1+liLhG0N3zgW7NeOQi799/c0JpyfRCZU6j
	yYQzGww7ZXtkGE9y7vmMzbz1izk4J/hub8eTuVY6norWyv+XgpHTMZfLABR4E=
X-Received: by 2002:a05:6a00:f88:b0:858:b809:6ec0 with SMTP id d2e1a72fcca58-85ed4d13780mr8488702b3a.23.1788354910497;
        Wed, 02 Sep 2026 06:15:10 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85da342023asm1398533b3a.0.2026.09.02.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:15:10 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/2] net: stmmac: dwxgmac2: timestamp interrupt + Agilex5 fix
Date: Wed,  2 Sep 2026 21:14:39 +0800
Message-Id: <20260902131441.322167-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_061512_045426_5557B965 
X-CRM114-Status: GOOD (  13.74  )
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
DWXGMAC2/DWXLGMAC2 and fixes a regression it would introduce on the
Agilex5 cross-timestamp path.

Patch 1 wires up a dedicated DWXGMAC2 timestamp interrupt handler.
Before this change the XGMAC hwif entries used the generic stmmac_ptp
ops, whose timestamp_interrupt callback read the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20,
and XGMAC_TSIE was never enabled, so auxiliary snapshot events were
never reported on XGMAC platforms.

Patch 1 also unmasks XGMAC_TSIE in XGMAC_INT_DEFAULT_EN.  That makes the
new handler run from hardirq on every XGMAC timestamp event, which races
with the Agilex5 smtg_crosststamp() poll loop: the handler clears TSIS
by reading XGMAC_TIMESTAMP_STATUS before the poll loop in process
context can observe it, so getcrosststamp() times out.  Patch 2 fixes
this by masking XGMAC_TSIE for the duration of the cross-timestamp so
the handler cannot steal TSIS while smtg_crosststamp() owns the
snapshot FIFO.

Patch 2 has been verified on Agilex5 hardware: with both patches
applied, smtg_crosststamp() no longer times out (no "Wait for time sync
operation timeout" in dmesg) and the PTP clock registers and operates
normally.

The pre-existing FIFO-pop / PTP_ACR / flags races that the automated
review raised are not specific to this series (the same shape exists in
the dwmac4 handler) and are left for a separate follow-up.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4:
- Rebased on the latest net-next/main (v7.4 cycle, after net-next
  reopened).

Zxyan Zhu (2):
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
  net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 11 +++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 7 files changed, 71 insertions(+), 3 deletions(-)

--
2.34.1

