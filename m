Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA27C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEZ9rS7/NXTY3zEczaXynPBZzIW4AuyMNhGiGUWlNJ0=; b=tuxW9GFSHCJBjK2WVpZzybiEju
	ycEiSUhlIGFbRIkWr4POJAK6qmviKEQiRzSgRGidZY8qq0KwCjIp6NMXFVA0t2wUr6mdOc594SpWb
	YRQXViQvUfjlck2LE8ZWLJbLjcjA0L1rEbXTcrjrDQH2RArcQf2QLcJv3+AhiFpB+f6PnJY32yi/R
	kc1h6DvPyQTwlxTpKOlob0FDZH6RdyZwfmzQC+2zXOCaQq3dTKWqZEOm2uNdJqLXQN4IU5roVjbQv
	qC403IfUao7OdNySOtn4qlVj55ooeEiqTg+iW1eoqG7vpw6dORzpQO2Tu1MRcclOJgr0JCxFAOEs2
	chyv6NcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdue-0000000F43r-1shg;
	Wed, 21 May 2025 07:30:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdhG-0000000F2aW-3Ga7;
	Wed, 21 May 2025 07:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AAC5629D5;
	Wed, 21 May 2025 07:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F66C4CEE4;
	Wed, 21 May 2025 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811821;
	bh=v3IDqAlY8Az7L+Vv8S1TOU7ZJgmqIP9lDQvJud2e9V8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DAnZTiv4wisfgfcLcXxlQuuqejtk+eIFHgyxjTtv1GO1v8D2G68zp51CxGsx/Qw12
	 bcVsO5P52y5dzB1Irx0RjlfpoN9zPAXFIKi7tefBVkRMdoPMk5vXFq6tgxkkj7ZMVH
	 8bWttSvsk3f5hIDmSFY5sxgc/LVv8hDPrHwMHFUW6wrvE3zwWuc/v9Ik7wBd8+AaCu
	 s5p+XywdIATVLfloXkBr3zQUvvXeyS5u3iFnkUT4JF7CUOgWiz9Du1U2flpvw1tH3n
	 qKdU5OBIJjdF7bdhX4KECjI1L2FTUbO4TRGn1cuC56msLKBY0nbdbdvDS5wRc1Pgrk
	 F3wPfMrilnbiQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 21 May 2025 09:16:37 +0200
Subject: [PATCH net-next v3 2/4] net: airoha: Do not store hfwd references
 in airoha_qdma struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-airopha-desc-sram-v3-2-a6e9b085b4f0@kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
In-Reply-To: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Since hfwd descriptor and buffer queues are allocated via
dmam_alloc_coherent() we do not need to store their references
in airoha_qdma struct. This patch does not introduce any logical changes,
just code clean-up.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++------
 drivers/net/ethernet/airoha/airoha_eth.h | 6 ------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931fd9532aa3b8cc78f41afc676aa117..5f7cbbcbb1d469836dfcea95137c960bfd076744 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1081,17 +1081,13 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 	int size;
 
 	size = HW_DSCP_NUM * sizeof(struct airoha_qdma_fwd_desc);
-	qdma->hfwd.desc = dmam_alloc_coherent(eth->dev, size, &dma_addr,
-					      GFP_KERNEL);
-	if (!qdma->hfwd.desc)
+	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
 		return -ENOMEM;
 
 	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
 
 	size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
-	qdma->hfwd.q = dmam_alloc_coherent(eth->dev, size, &dma_addr,
-					   GFP_KERNEL);
-	if (!qdma->hfwd.q)
+	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
 		return -ENOMEM;
 
 	airoha_qdma_wr(qdma, REG_FWD_BUF_BASE, dma_addr);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 531a3c49c1562a986111a1ce1c215c8751c16e09..3e03ae9a5d0d21c0d8d717f2a282ff06ef3b9fbf 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -513,12 +513,6 @@ struct airoha_qdma {
 
 	struct airoha_queue q_tx[AIROHA_NUM_TX_RING];
 	struct airoha_queue q_rx[AIROHA_NUM_RX_RING];
-
-	/* descriptor and packet buffers for qdma hw forward */
-	struct {
-		void *desc;
-		void *q;
-	} hfwd;
 };
 
 struct airoha_gdm_port {

-- 
2.49.0


