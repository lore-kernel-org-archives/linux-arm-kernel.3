Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DABC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRt75Cw0D3zOWFN+00SWJIuIxB+ErtT9mg4MKtDgEDI=; b=UGRtoMwKuiQOVp9LvuT5PXZYIT
	0F/ta5mZJHVP5KhiKei8J9L4ODaXxYG3fvHh9Dvrq5prfWt2W6e2caXkmzcLIagY/UYnUQF9MlTrc
	a16jub3Qre9aHp9OuI8brvmQf3jcnscEWM/HiaVvnOMX6GyTyph/b/GTo63lPpgSA+YjJ8fxmLtrR
	lphlXYFw7NU0Q2VPyBCX/kc+ucG6YNLiqDm26O5v6KKfwNYIQdTQ79lCKbU2IePJu6ymlJzkDKdR/
	tThtXoLYxdaTD7RhW1aSu13xbtOWirNRjgaLUfP3njkX/XIIjMnu2LMOaxhEbwvlmMlIyKHbr7Jfy
	ULnvlTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJqw-000000082t1-3nQ5;
	Tue, 18 Aug 2026 13:27:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJqt-000000082s1-3Bqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:27:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so42252245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787059658; x=1787664458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fRt75Cw0D3zOWFN+00SWJIuIxB+ErtT9mg4MKtDgEDI=;
        b=mnPY6m1SAEjmIQFCP73ME2NZOSn4aDKjtqtKGk/3INZ631H3aeHnhlXBoft+asXL/R
         KYtdYC0cHnFdRo/iP616IUCqhKiJMytZYu3a3clVvuWhcL2CCFIfJr28llJt+jRdpKj4
         q9Pcj2QcVVYqIwJAxvVG3RZdI5UiAZkwp/o8CUswz9m56MErNtxN9vq7SUpuRyV/8odP
         S8e197Ajo6IXSQhUwOxj0swX4dNOwKNPiy6cUNwTQGZCPMK0Q9rGV+CmCH6WrHrYfLAR
         t1XIW0lZPqq0vBXj04IBwb/NQ5UJhD9HUickCKHu8aoC5CCnCycN3AumRUHs2/eeW5YY
         HbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787059658; x=1787664458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRt75Cw0D3zOWFN+00SWJIuIxB+ErtT9mg4MKtDgEDI=;
        b=iTwz058BgFCA69qG/iqeltqGPfU96CjltedvMSBHmWmwNc3gL1uLvV87TFMgowyqwD
         kdEFBH+zvdSmm6LakPcUlZRwX8jTvUnB+YSZ+Qo//1vNniY8PbeC7DRZefImJTLgHxow
         h385HaYNIlnT1RQldZyXc4J2U53MtYaE6osiuy5UVJqzd2RvbVlXJs6BfTWi/vqPfB/I
         785GHK1XeR5EftFXBsa7ZqbKT33ruAjIELnvF4QMOPFDHKyCEPFF4rAyuEOJ+wJF8YZo
         8QF1NWnpEh9ysBRKGBOpX0kKfbpeTbkE+p8BabEZ2DINY8ZH8MG/sLM4eYelpvmfzn35
         plXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3QwPM3ZGS3bPzSyE3iGehym6KHajrjrUcrwUqdaP1ybVuh1BlpIHnJMgx2CEdGuwLCW51CZwAN3eWW56ZwRuP@lists.infradead.org
X-Gm-Message-State: AOJu0YxhjhqXEyokI9w1K1LnZ0+6OnxUkih66zbD3m6ak8ZQwmsyvjvH
	dYQDS0qc4pPVl9EqR6rTYUe8HN91q4HYeoVngGeBRZm0RZKZvj8xVfIJ
X-Gm-Gg: AR+sD11Y0PaMhvqKha+Ao8Bvba1Wz/sUzdUEndVmHvSYdpNIA3DaAsYyemYSnt8mMHf
	6/6Akd4DspcjsnVV29xvKoLHf83TOmbQSLIKLCc4TZHDDIolFX291DAOzXZ+tmAuRJCFDRMiH+N
	A6Co4z8k1epPHihTyjzCTKc0ByCk5dqAMwU2+HkaCOCQcHfbfFLuXvc1YyiQloNi0dEB9Ax0l58
	5ALxExuM7AxjDT6PuZBUNvIiLo+hZPhaG10A8s4K909OL6J5uxzwKc/7vukHZkgkcPTjvWwLg84
	QlIvYR4ptI6fSZSUzCya3tKtCZMgeaQowdvs+BOf4s/g6esye19aRORj8GSlqHYPjbGILLLm+O4
	ZqH/x6mvuRJxuGmXIz9xS5JsccPPYG/pO4CQu/mbrMapsOZpv2kDXFDDPrEcrh132tSADuEswNs
	Rv6eKzEtdoJnHFkztdzSXe4kC2ASIb3VrT147IdSbmajcO0U54wprkEdrHmU0=
X-Received: by 2002:a05:600c:5286:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-4998933fd79mr572811735e9.3.1787059657466;
        Tue, 18 Aug 2026 06:27:37 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7c568sm12140145f8f.18.2026.08.18.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:27:37 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/2] net: stmmac: dwxgmac2: timestamp interrupt + Agilex5 fix
Date: Tue, 18 Aug 2026 21:27:20 +0800
Message-Id: <20260818132722.1852876-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062739_822370_CF77457A 
X-CRM114-Status: GOOD (  13.64  )
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
applied, smtg_crosststamp() no times out (no "Wait for time sync
operation timeout" in dmesg) and the PTP clock registers and operates
normally.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3:
- Add patch 2 to mask XGMAC_TSIE during the Agilex5 cross-timestamp, so
  enabling XGMAC_TSIE in patch 1 does not break getcrosststamp() on
  Agilex5 XGMAC (reported by the netdev sashiko review, fixed approach
  discussed with Maxime).
- Patch 2 verified on Agilex5 by Nazim Amirul (Tested-by tag carried on
  patch 2).

Zxyan Zhu (2):
  net: stmmac: dwxgmac2: add XGMAC timestamp interrupt support
  net: stmmac: dwmac-socfpga: mask XGMAC_TSIE during cross-timestamp

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 11 +++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
 7 files changed, 71 insertions(+), 3 deletions(-)

--
2.34.1

