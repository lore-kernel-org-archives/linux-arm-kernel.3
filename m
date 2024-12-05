Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAA7E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0HmfRBKBkLsgyW/HeIjKXTJHSnwiReWOxGDbcg2lig=; b=iJVMLmbxFOaxV0DP7+Uh7cbI0H
	F20jmTHHrDLh8BmZlWP93l/BFowx1x6afVTLGDhWvQVHOVW1IWA0tbMPi19uO2lUWW23rGr8tovyv
	l9c/S2KbTCsLEiH4kP6paWSo9XmioVMc7myps7iNekUjYGApfOykxKzpctUCN6jSVcvKwq4lDuuB+
	c7mi+fQKZoNCgQSeoxiiVuetTZK59bRFB8j3CZ0wnho7Chjqu2+6CmvALXV+QwZAGkDZvkjUrHpSn
	A2YTWJLwtd1laMttVWFwPHJnu3zKqo/rgGGVXS9Frpge/DBW8VVuDGj08ZkQeBTBU205OSHHUTbsi
	WsFHPfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ82i-0000000FLVE-1GHO;
	Thu, 05 Dec 2024 09:21:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ81J-0000000FL5E-2s1L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:19:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21578cfad81so5506315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733390376; x=1733995176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0HmfRBKBkLsgyW/HeIjKXTJHSnwiReWOxGDbcg2lig=;
        b=X3gh6SwoOy9jBU8T5/8W8yl576QmnlWJA6bBLkw0kMqddS/loHNYoPxIJzdUSGOIsP
         hj2U8nTT24H7NbG68EmY+I1A9VY3BNRs6sU6cbeGDCAfM6EjF2tK3I+MKI9c5JxS8wTj
         nAIVFp0p0IKzr06EBg19clEqhW5HS0VQrG6zREdcregybvhfwbB0LJOJ7CeWaTqWJmYZ
         ukQDBzxUBPw6YIlLwnKuTlPEY9RndxhR1GlRa6uFJs+ANwEkaCiKGFeVGZZfZ0dYDWEo
         Siqzsq1+sYzDG6HN123yNaChSs/ZYQjvLMoYXUIy7PkNfaq+3RGzv/19/NmQfaZ5PkCT
         XA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733390376; x=1733995176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0HmfRBKBkLsgyW/HeIjKXTJHSnwiReWOxGDbcg2lig=;
        b=Ut4Fr9O2YjI9ITjcNQRxC0VTpjzLTm3e7n7LL31ct1lpRkl/3SAXGwdDv6bDKlUyys
         V7fXRajYFWgSVyivHYoBDEyrAz0gqKijpg6Jt/FosdbE1TJSqx2uZLKZR/gj0l3cjCnP
         iqbop37BGmWgoW1rDlPW2We648Qsp+YF/79BiOlF1Lu5u94hKbxH90/a+BeqWm+yq1N2
         woxh44G5nBRN/myjWUiW8LWDG7Ovv9PNZJJmI/cGMLZtN47W5jcUvtRZ1/QJBmO5X0x+
         oV1XP9iPHGZx9aoZof89kR8dTysEon3dj7ihwEmuLzk16GVCZuhNZx/yXvTHfLdaS+xU
         S4pg==
X-Forwarded-Encrypted: i=1; AJvYcCWwaIGog+QEyJm27jecaxz2GmElckplfU4WUi83LsuZRezSTzYFzFihjkghJCYa7/sXPjuy5MYKKKC03U8eFHm2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb2iBkQfMGWWxuQOiNgYLjS8fBzqYJAQAhCE2Q65vjdO2fbTZ2
	BGLGuOVncl9w+izVjgUFcK/qz299qkYUv/mMjmeiDkCMM2AzN3fF
X-Gm-Gg: ASbGncuGVvZLO/LuKezfvT0HbW/dfGT8h/qSQVkZTIxk2wl5/pOLoD0tgoun9SQZ71d
	LwwhFbBfH95RUAxZLa9UseXS7ZGvoD2HRhugJsdlKasbMhg9cn+2stDCTbNMv1aKMEDyVQzuOHk
	V6lfFBkBFE69HbfFQlY8QXYVoqfoeT0AbD1h1oU7/FjU/bz1grauBkeGhfDePpr77wOj5YIGCbD
	x+9e2Q15l54x3yxeENYDjf+iB0QKJc6gcAyXndck57OTw9XsSBHVBeNZVoa+FM=
X-Google-Smtp-Source: AGHT+IHFjK3cGcjfncsTvxz/JQr72PK97p7r+aYYZQ6H2u3kZ0kfRozsXNPN9a0ZsbcFy3VaXfTZ0g==
X-Received: by 2002:a17:903:1ca:b0:20b:8a71:b5c1 with SMTP id d9443c01a7336-215bd1b4604mr141553115ad.1.1733390376224;
        Thu, 05 Dec 2024 01:19:36 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-215f8f09270sm8234895ad.203.2024.12.05.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:19:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net v1] net: stmmac: TSO: Fix unaligned DMA unmap for non-paged SKB data
Date: Thu,  5 Dec 2024 17:18:30 +0800
Message-Id: <20241205091830.3719609-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011937_721261_CFEBBCDC 
X-CRM114-Status: GOOD (  12.75  )
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

Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for
non-paged SKB data") assigns a wrong DMA buffer address that is added an
offset of proto_hdr_len to tx_q->tx_skbuff_dma[entry].buf on a certain
platform that the DMA AXI address width is configured to 40-bit/48-bit,
stmmac_tx_clean() will try to unmap this illegal DMA buffer address
and many crashes are reported: [1] [2].

This patch guarantees that DMA address is passed to stmmac_tx_clean()
unmodified and without offset.

[1] https://lore.kernel.org/all/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/
[2] https://lore.kernel.org/all/klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw/

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: Thierry Reding <thierry.reding@gmail.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Fixes: 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b262cdad60b..7227f8428b5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
+	dma_addr_t tso_hdr, des;
 	u8 proto_hdr_len, hdr;
-	dma_addr_t des;
 	bool set_ic;
 	int i;
 
@@ -4279,6 +4279,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			     DMA_TO_DEVICE);
 	if (dma_mapping_error(priv->device, des))
 		goto dma_map_err;
+	tso_hdr = des;
 
 	if (priv->dma_cap.addr64 <= 32) {
 		first->des0 = cpu_to_le32(des);
@@ -4310,7 +4311,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * this DMA buffer right after the DMA engine completely finishes the
 	 * full buffer transmission.
 	 */
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = tso_hdr;
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
-- 
2.34.1


