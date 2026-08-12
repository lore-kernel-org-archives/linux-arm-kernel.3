Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB043C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58Vxr1ewmacSO4oLjVc12aVhWqqIgFPJfyqFJRG5hDM=; b=mZuDHD/I0rMxYtQ+DcUk6NOsMF
	Xj/H0wjtaVXg3qrY8b4yjmGnqO0z0ARgap6iTm24z94D3sSTOvOA5E95XH4trntxy3sP87IWbyB35
	MHEiDeTw9V7R3RG7eg9cLtTQzCNVjNfCVRvdZKxjNqpo8W3oOI+yoPwDb052IpVUowAJe+KRsLAAX
	DUfusFV416rIalb8K4DFzKBPpU7YEQI/WWEhzzvGkQX4JeqYzqKY4XnENUA9Ddi/gRdeVcJ3QaHsu
	6F70isGSL7vgyRx6jXEiWG+rTH1B4TF4kx0m2xwQi4+XKc/1b8OX5Ieq00jIQzuIYN6WYOFzDW7cM
	SWnDuNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByW-0000000Gbbw-0zEa;
	Wed, 12 Aug 2026 16:38:44 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuByQ-0000000GbZk-0y2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:38:39 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-93695893ac1so76496785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786552717; x=1787157517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Vxr1ewmacSO4oLjVc12aVhWqqIgFPJfyqFJRG5hDM=;
        b=vTbn0JBDLRPjWCPG/kAUpYvdHHFOdfPDaAs/CW5wNHGPVZI3z7KZCn9/w3eNoDuOtP
         kNAZMFmTbSEOG2inBB65dH4HP8YSjOGixcdDfs7cOL5TuISnNSYhThQg7+qIA9yXjy2d
         6QHHf6IvCJqCzBwqppOhqQE07eYuBZrhHZGx37jpUFnX8WLjAmZU/p85u6Oqszb7vI37
         lGzbJmuVAvQvRaIEWtFVBKT5GVCZClBhmPsxw9E5pjGfiEZIIlos1gAuPDU7dbP52Fe+
         KPlhQPagaASQTdNu8H27N4xaG9/q7pYDdszCb04a7TEtoAGxV1q1zRObepE19aZI1fLS
         2zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552717; x=1787157517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Vxr1ewmacSO4oLjVc12aVhWqqIgFPJfyqFJRG5hDM=;
        b=QJlZfHLggggT5rPj/vtWU05G0GRoSbJEfyfkan0TU0SR7pHGKM+nS56M+DNhQEiDtj
         s9RUh6E1hgA0wjDF1MOVm3S+MQVRMxHsl43yfsxD1jiXA5C3cKy2fV+JseFC7I6hsX2i
         c5+d+4IADm2PPdJqszKyA0TWiq4fmFSB8/dwjyJC7utGu1erlbW5O0x3trr16mk+ifuN
         ppa7NIV2cmvsNjyBesrncnRzVDxikQUO0KXVtZsrmEb4ilKaG5YfK+zBkIUd2N7XBkub
         xIzFPUP0V/Bgr9Kjb6pzxkiAalrT/SXowayLyLP8mUN4Ve0hY/hSUNxBd9mGv3Fw2ueU
         XSVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvjseW9JgBrqXUjEcMES8ZhC9NaAkekOLCmp2of9qNeJrzi2B2DoOCzj2+Vu1XcZY/DQIpfDKnitsUwQXA0SP8@lists.infradead.org
X-Gm-Message-State: AOJu0YyTo4yT/fSKEIWnP5lKkfhFMJ4v6tAqErn3PfrFWzXoGa6UIb8k
	K1j3eOF+ETGM/HqWWu0joGT9J7nw7AutuHA7lTWk2EdLQnO+V3oBtqxXZmB08BU+ZDI=
X-Gm-Gg: AR+sD12I8m/tnodlUqqHS5Wn2Z3L7/AjiTmgE7+24SKBFdUcdvyRgo4xMzkxJdGJnvt
	88PRxdI4zQg81xux8SESWZvoOU8sUwaoH0QGhG+++xhfJBfILzAZ3KuP7jQn3rifw6LUM+uON+x
	sRt59wemBBaOvtrn/0/h6Imdfz4An8m02Ii2lLLGFA+a0TXS08HVVo2oBLwKkUktprR15LvhBVL
	1jYWYadYEOdQXnxvruXPnR6+3KTuzR25cush1DdUkYOWdh1ZZgP7rnbv/Ay/wgKEcqC49uCiZg2
	tPBfUmNYm/hBwk1o07Fr8onBidnwl8xoqKwvzQe4Fm2EYP+tFzTYAwGlvHlzQZaD3JmcGaz5i+R
	aPp8WbuyNGfb0TIfEJgVvbD5tU+17e9Zg0gHP4yX7t/+fTZOde4JIWMrYvbKCS6d7IDQW76TMpT
	IDpg0cBXb81zcCQhOLSQh42THvhVGzzIdVXDneekVIujboRCbky3qyBtIX4X9/0y4f
X-Received: by 2002:a05:620a:199b:b0:92e:4859:49dd with SMTP id af79cd13be357-936b3d3af54mr541451685a.26.1786552716869;
        Wed, 12 Aug 2026 09:38:36 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5dd3d4dsm166040385a.3.2026.08.12.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:38:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: sashiko-bot@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: stmmac: use dma_addr_t for DMA addresses
Date: Wed, 12 Aug 2026 11:38:30 -0500
Message-ID: <20260812163832.271742-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812163832.271742-1-elder@riscstar.com>
References: <20260812163832.271742-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_093838_273850_C3F9C6B2 
X-CRM114-Status: GOOD (  14.08  )
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

In jumbo_frm() (implemented in both "chain_mode.c" and "ring_mode.c"),
an unsigned integer local variable is used to hold the value returned
by dma_map_single().  On systems where a dma_addr_t is 64 bits, the
subsequent dma_mapping_error() check of the returned value operates
only on the low 32 bits (whose high bit won't be sign-extended).  In
this case, dma_mapping_error() would return 0 (no error) even if there
were one.

Fix this in both spots by using a dma_addr_t for the local variable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-devicetree/20260606010122.21A211F00899@smtp.kernel.org/
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fc04a23342cfc..ec25193d287bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -20,9 +20,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
-	unsigned int bmax, buf_len, des2;
+	unsigned int bmax, buf_len;
 	unsigned int i = 1, len;
 	struct dma_desc *desc;
+	dma_addr_t des2;
 
 	desc = tx_q->dma_tx + entry;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 78fc6aa5bbe95..664d8cfb58cdc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -20,8 +20,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
-	unsigned int bmax, len, des2;
+	unsigned int bmax, len;
 	struct dma_desc *desc;
+	dma_addr_t des2;
 
 	if (priv->extend_desc)
 		desc = (struct dma_desc *)(tx_q->dma_etx + entry);
-- 
2.53.0


