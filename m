Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA719F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJbijBDttFNCz2nTXq97GCNnHKIGfW45DMlLADuw610=; b=xwmVv0yQIfQARFAYdInGB7NOrQ
	zr+ZOrQRKmL4zW7PFd4WeXs4rtNF5HRR9mVotrM2nlb5xGYoLMvkhoMn3/SPbzGcuOlKEJ7THbJAJ
	/lo0oB1LiMXU3MuTLCmmxjBlVkUExN+W8NkrS6KN6tg26YvMnoZZCepwRcKLYqJlETdojl2JcXErA
	DNbO4Ht4uex1gynO6+sO9Q6FC11Duyl0IqEjyb1OxWwCpEjHoGZq3ok6K1JcSdwdRjWXvz8W4vuNt
	Goif+AlSKGa6NQOv2DrmOBFcOJ/uM8aPnAwarj9bj5Q/3zT+Vo9+HphUg5BgY50rS5Z9PjJJrf3Ry
	bv3l2vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDel3-00000003gm3-1oZ6;
	Fri, 17 Apr 2026 08:41:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeky-00000003gj1-0djh;
	Fri, 17 Apr 2026 08:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9831460139;
	Fri, 17 Apr 2026 08:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1568C2BCB4;
	Fri, 17 Apr 2026 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776415255;
	bh=/bR7VjWpqFgfa6L8lgi5/ItZRSv3tGrpAuLfLnEUdNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X3Ro8H85p1t8j3dSdfqT0dwKe92lMtz5f3Xhr9c8g3bmjt4my8QxJyQFIKrbasIsf
	 Q7eMv2avzwVW9KubiZCB3WR74Pie1xfoTIULmPgfSEaYVHK1KV3KSdlY1fEN24XPJi
	 ghcPuPoR4knU/Tt5JJGHLuQmOhaQOEGmWcDZTO3/+BL8Y5WCA9Yktn233g4yjPou6J
	 dPDQK7QF3myHqFSH2RjQNnRHIjeAGUIUqBzVBnFYmfjaa1IfL+KreD3OBf/6ITpfCj
	 TsFyYwKBB9gudFdUL/UhR7hhfQhD23CcyF4pRV8Ip3CsjqfWQU04CfusvQMHMi+Wpr
	 JSATGwM/LNweQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Apr 2026 10:40:37 +0200
Subject: [PATCH net 2/2] net: airoha: Add size check for TX NAPIs in
 airoha_qdma_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-airoha_qdma_init_rx_queue-fix-v1-2-db9fa5e468e5@kernel.org>
References: <20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org>
In-Reply-To: <20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

If airoha_qdma_init routine fails before airoha_qdma_tx_irq_init() runs
successfully for all TX NAPIs, airoha_qdma_cleanup() will
unconditionally runs netif_napi_del() on TX NAPIs, triggering a NULL
pointer dereference. Fix the issue relying on q_tx_irq size value to
check if the TX NAPIs is properly initialized in airoha_qdma_cleanup().

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index a6f8b231583d..1ca4087e675d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1398,8 +1398,12 @@ static void airoha_qdma_cleanup(struct airoha_qdma *qdma)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
+	for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
+		if (!qdma->q_tx_irq[i].size)
+			continue;
+
 		netif_napi_del(&qdma->q_tx_irq[i].napi);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
 		if (!qdma->q_tx[i].ndesc)

-- 
2.53.0


