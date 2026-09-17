Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3534CC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDoZLUyubI5ZtV2PPymIrG3bnffwyzsLNZlK0gUZRgs=; b=SMgkbSbMsMp69hrKrhGgCgVYGo
	Ynm48dhssxUf6Rl7/QkyuC0ksz8geAQve5IXO6sCIZL2o8jBfm2jKFP/6/93lJ2XVAgnrCoQF+7cl
	ZXt2l4MGUClXERlb3K5FBcx1fyfLeFbA7vL7ot+PPwTL2+Xt6aw8QtCaeDrfndxwykl++bAfh9eFJ
	NOP/Pz8xQTUBLf4khgOIRF+2LSfvSXG+OdZUKEbBzuWpZJdRvuaNzLLJ3WAgR7Ff7oAMWsHb4QzTX
	D6HwZCuVIMT/uul/9HsddohAV5To3WWxAWlTZIG/Yg5+8Hwjut50evJ1DokvzGXNuCMJ0WvQ3zZcg
	7LIzUXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K3s-0000000CbRQ-1o1I;
	Thu, 17 Sep 2026 21:54:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K3l-0000000CbN9-2C8O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:54:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C8D34E407BD;
	Thu, 17 Sep 2026 21:54:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD73F5FF03;
	Thu, 17 Sep 2026 21:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C1B111C7B097;
	Thu, 17 Sep 2026 23:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789682057; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LDoZLUyubI5ZtV2PPymIrG3bnffwyzsLNZlK0gUZRgs=;
	b=IlxK1HaJt0uQhaWltczxR0cxi12N8kvh0TKQKSJiTP6AKG96g7Bl/PP20ITvUjfAMFTcYz
	CwhqWr2P8n4gANkWv0hU4u++XMAEYywm/IKZSzNFCNT7iEiTQvVuVptk7vec0a78t49mHd
	Z2o1F0h8+aYZJrWo7y6HXyH3fDbrCYrP0KgCS5YvKROC5loOPtn/QQWcKqtDfJmTRCd1zs
	zI4ixPTCx5p3ojeBCAFM7oACyN3rddNNJdVfmi1NIh8Z586CToHHSGG8aPXiIQq6UfV2fF
	bGMYUq51PSOKMOVBYKiYaLbsGT2+4Pw4HPzBiar7Lqy3FhXeSZC97sH9wlI6bQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v4 5/7] net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K
Date: Thu, 17 Sep 2026 23:53:36 +0200
Message-ID: <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_145425_707980_D6A3355E 
X-CRM114-Status: GOOD (  12.92  )
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

DMA bufsize selection isn't made on the MTU but the actual frame length,
so including the L2 header. On DWMAC4, if the len is exactly BUF_SIZE_8KiB,
the next larger size is incorrectly selected.

Lets fix the comparison and while at it, rename the parameter from len
to mtu.

Fixes: c3efed5ad1b0 ("net: stmmac: Enable dwmac4 jumbo frame more than 8KiB").
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 2994df41ec2c..c6a8f8d73501 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -474,11 +474,11 @@ static void dwmac4_set_sarc(struct dma_desc *p, u32 sarc_type)
 					  sarc_type));
 }
 
-static int set_16kib_bfsize(int mtu)
+static int set_16kib_bfsize(int len)
 {
 	int ret = 0;
 
-	if (unlikely(mtu >= BUF_SIZE_8KiB))
+	if (unlikely(len > BUF_SIZE_8KiB))
 		ret = BUF_SIZE_16KiB;
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..de7aa6d28148 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -540,7 +540,7 @@ struct stmmac_mode_ops {
 	bool (*is_jumbo_frm)(unsigned int len, bool enh_desc);
 	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			 int csum);
-	int (*set_16kib_bfsize)(int mtu);
+	int (*set_16kib_bfsize)(int len);
 	void (*init_desc3)(struct dma_desc *p);
 	void (*refill_desc3)(struct stmmac_rx_queue *rx_q, struct dma_desc *p);
 	void (*clean_desc3)(struct stmmac_tx_queue *tx_q, struct dma_desc *p);
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index f7949419eb9f..d2f0c321661d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -124,10 +124,10 @@ static void clean_desc3(struct stmmac_tx_queue *tx_q, struct dma_desc *p)
 		p->des3 = 0;
 }
 
-static int set_16kib_bfsize(int mtu)
+static int set_16kib_bfsize(int len)
 {
 	int ret = 0;
-	if (unlikely(mtu > BUF_SIZE_8KiB))
+	if (unlikely(len > BUF_SIZE_8KiB))
 		ret = BUF_SIZE_16KiB;
 	return ret;
 }
-- 
2.55.0


