Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05639C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGTao/KdTdduxv+yT3fMuwnoAGn1zACXJ7pG0Rb21UQ=; b=lH+ASm91gCHL2fNEMM/EP5rhAV
	csTbjM53hm6F/wFStihqiUJMyFIY7aUNoAOrxHEN7v6/HeUX+LqB3NK7Q6nNQ3DPjF2QVPP4RVBwA
	rbHuPRSFXVLd4/zHqB2A90zjfDpkAqnxz8qFLWRhz2dUSJZbobbvFPRTOGQHtYPQVC0RsCMUuEf90
	IrlYValVNKsNnnnhRcxC3yg/NK689wPWMQ9RAqBdw9rg3xsOjHs3veXD1VxdW0pvbv58NjDuNnM67
	4LjoBNaU2VFL66pQqma5449J1KrzWNZEa0MoYToY3w7RWUaa5qZ/X1OKUOyOzXyZrTaeiXcEdKtb8
	d2IDLBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zre-0000000DhGU-299F;
	Thu, 10 Sep 2026 08:10:34 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zra-0000000DhEV-28r8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:10:31 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1656726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027828; x=1789632628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGTao/KdTdduxv+yT3fMuwnoAGn1zACXJ7pG0Rb21UQ=;
        b=FmzdDBPM9EmzE43Swx1b8hbFmUSvdll9UW2GtKg1tGDUJlCYd1BeBuyjVcoLUwKKWg
         cnRALn8/Z4hfWQ1SdLFxprX2JckEmULiXUOnjSR1ifrp1kqnW+K9hz7ucY+524hcfoTg
         KLqnQLCTaCIefQGJ5AwNHSZotywHJjA9N/t+9YSYAsDJLroKkXVw43dpmY/9c2dVs04T
         ZMAzNvUle5vKF2j0o23KrPO4nuTHZsvaxwa5mGOAk4dt+T1crlIEnsxZ8/ttvO7tcIDM
         hCEXB8g5I4Vi6hQbkCctW+FaWyi5ajYKbgleBkefkryHVbpwl2Yf6lq6VA28DC31FLhu
         iiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027828; x=1789632628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGTao/KdTdduxv+yT3fMuwnoAGn1zACXJ7pG0Rb21UQ=;
        b=A1IQ8IejjGW4+A2sjZWWQhCNL5/+QCIQuuBeCnS+kgFcLxAh/JX3L8iW2pBtT+zWjT
         1bRT0BYtlW9l/G3u9G5s1mcJDoDreAbqfv84rFT4+kfb8jOvj2t+DVVgy20Hi32QVOHt
         uwAadmH/G9UCbL9Nb6IEq20MkfeELw0LFNrEy8/V3549Li+K9DVVgd6BfQBTd5uzqO61
         zIO/eze/dhtrGBDUwU3MYWHoCBZZQX8KFSlU5FzS/F+rJtRcO4duMtV5Tu3yYhWrVc7H
         rA7I6pZbyiweuVVw0LEgxXiFYKT2oOVMTHWTPYQPc+o2bRfmV21MTyAYAauSKnMlpdh1
         R4YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzwud4kx3D8RA7hXwyY7G4CQgG6ius/bQcT6jGV1wwxrslRuJ1eq1AZSzozimG8bvHvZKSHMnyXSPJRiq+Vhyk@lists.infradead.org
X-Gm-Message-State: AFuF++m6WteI664zfUJdDgvU0Hf+ytviq/eVAb/v1JfPSH6IngGLvtjU
	vYKovnPklSm2oG6RQVomiFlEKQkZYca6YbNm+jAa9tPK5Md3QOxpziLa
X-Gm-Gg: AYBFou20j08QPNaV8avCNCBmusipAd7m9gb2i4Nxkhbjsedqr2yMC3UjHwpXmfUFlUt
	G9p7dZGxno9tkqqus4RXu/dkxsqXrtJlulLYoupray3cfYq/URMKdDOgUaoo9Bky6sOQW6Nc/c8
	HhPsRqQOKJO9KA3UY06lvfoXsySEPZDT8m1s4mAxG6nqusMHY5t353OCAyVwj+yUJCueSlg9bCu
	VSJkfilD/MoghWuPpFypUeKp2ahRbFcPvJcHbgI/Mz7njc5H0oGjzAoqYKUpW9iQ6bMUmj7GsUr
	ahv7LkfSe2OzOjPFEaHdc4zOAIJCWexgQ5seZOxxRXSJ5WRAKoY0bVYWWkpZXlBuqm25SWtY++5
	HAf8V8mtGug0/slJk3hidZCZjLqaEWeXcdTmJbkU2sMBOipeDOJ+jON0Lo6wStfQ1GfVjdcuYQ1
	rf9+dGsN399vS0PIV5InYyZxqfnO/YUpsVOCbQMh3pMPNSL0j+VMvJWiW317hPp8EiS43dpLdE0
	SmRJvV2
X-Received: by 2002:a17:90b:4d84:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39bac138257mr15353888a91.1.1789027828457;
        Thu, 10 Sep 2026 01:10:28 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4442434a91.2.2026.09.10.01.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:10:27 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/2] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Thu, 10 Sep 2026 16:10:18 +0800
Message-Id: <20260910081020.86227-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_011030_551619_BFD3EFF2 
X-CRM114-Status: GOOD (  12.67  )
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
DWXGMAC2/DWXLGMAC2 and fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS count
instead of the transient TSIS bit, waits for the ATSFC FIFO clear to
complete before arming, and derives the pop count from the poll result,
so the completion condition is immune to the destructive reads of
XGMAC_TIMESTAMP_STATUS performed by the DWXGMAC2 timestamp interrupt
handler and the TX timestamp completion path.

Patch 2 wires up a dedicated DWXGMAC2 timestamp interrupt handler.
Before this change the XGMAC hwif entries used the generic stmmac_ptp
ops, whose timestamp_interrupt callback read the dwmac4 offset
GMAC_TIMESTAMP_STATUS (0xb20) instead of the XGMAC register at 0xd20,
and XGMAC_TSIE was never enabled, so auxiliary snapshot events were
never reported on XGMAC platforms.

Because v5 changes the completion mechanism, the previous Tested-by for
the mask approach no longer applies; Patch 1 needs re-verification on
Agilex5 hardware.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5:
- Replace the XGMAC_TSIE masking approach with completing the
  cross-timestamp on the persistent ATSNS count, and reorder the series
  so it is bisect-safe.
- Wait for the ATSFC FIFO clear to complete before arming, so a stale
  ATSNS count from a previous snapshot cannot be observed.

Zxyan Zhu (2):
  net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 ++++++++++---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 7 files changed, 84 insertions(+), 8 deletions(-)

-- 
2.34.1


