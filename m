Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9206F8809D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ouzib2uDKqLfHGyQLFzCKHz0uHnNcYLbPBlx79v/t1k=; b=hvBkcnrfTl4v3r
	SwxxnKhuJrzTR00iJ7MQ2gmATyCaq20NTGMn+3iFBlQE3YiIO9Uso66PARx7IqGAkVQPxqQXUFHQ7
	U3A+WlPUq+ro90aoOdxEMG3k2+QveEZxK9pY0CefXquHw1rYtwQNK7L15BFp4DEolOD60RaGOICiV
	zDe+deIvsOmCWqxXm6gGFLIi8X3qe+rJEpTSIuWVQ4k0PMM5skPFcxLWPzSIlIUJKyVJL5ZKtkrF3
	TAC1boNSheGzBsNAG3mmQSZ0xpJZelI8WhH2IduVgpc6NEnB8jnrWEDJ+6SyosuMRJ7yx1fF+lKmg
	pHWEkwl7+U7FTSYxLekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH8k-000000027MX-2sub;
	Thu, 16 Apr 2026 07:27:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH8j-000000027Lw-13hn;
	Thu, 16 Apr 2026 07:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 474C56012A;
	Thu, 16 Apr 2026 07:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A282CC2BCB5;
	Thu, 16 Apr 2026 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776324472;
	bh=mJpU45QimDn5hC6G2LUQKcDSNMK6k2YS8eyW01woreA=;
	h=From:Subject:Date:To:Cc:From;
	b=i/hLLrjxuanYYYEH1jbzdlaUiozopn8AI/z7i7q0nN8ttc5fZWadm2FHnw4R7MTFT
	 Xb+lJMDfGOscV1EbDc3mL6v67cyF/kbxDN57lAhnqhTiXEnCBOHKFFyLuAzbYj8Yft
	 0jx27iGrcj7rLVmERMKHtHlB9KapGQczj8EnLRHBV6rd/t747ML1/cmHBtQoWvOfF9
	 kwMv/N6q42gJJlsJGj43lxj6v2mUKW303OIs4ZQlsQin1iSLj4KszxYgw+1geFWngM
	 XYQljeAQrbwIQVcz0E1iR2pP/orKnX0xwaGcnF53Vx5O2E/F8UFCqTTQW+b7WLK+bl
	 Q2yTFXyddHb9Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v3 0/3] net: airoha: Fix airoha_qdma_cleanup_tx_queue()
 processing
Date: Thu, 16 Apr 2026 09:27:38 +0200
Message-Id: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WN3Q6CIBiGb6VxHA1QgjrqPlpjhB/KMlRQZ3Pee
 4yjOqvD92fPs6IIwUFE592KAswuus6nUOx3yDTa14BdlTJihB1JSQnWLnSNVkP11Mq0oP3Uq3F
 RwwQTYOsW7GHEp6IQ3HIASSxKqD5AmrLmitIB3VLZuDh24ZXVM83Tf5aZYorvggpqpKUg5OUBw
 UN76EKdDTP7pJY/UlmiSsEr4MIYwtgXddu2NyEPrIQ0AQAA
X-Change-ID: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
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

Add missing bits in airoha_qdma_cleanup_tx_queue routine.
Fix airoha_qdma_cleanup_tx_queue processing errors intorduced in commit
'3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order
DMA tx descriptors")'.

---
Changes in v3:
- Move ndesc initialization fix in a dedicated patch.
- Add patch 2/3 to move entries to queue head in case of DMA mapping
  failure in airoha_dev_xmit().
- Cosmetics.
- Link to v2: https://lore.kernel.org/r/20260414-airoha_qdma_cleanup_tx_queue-fix-net-v2-1-875de57cc022@kernel.org

Changes in v2:
- Move q->ndesc initialization at end of airoha_qdma_init_tx routine in
  order to avoid any possible NULL pointer dereference in
  airoha_qdma_cleanup_tx_queue()
- Check if q->tx_list is empty in airoha_qdma_cleanup_tx_queue()
- Link to v1: https://lore.kernel.org/r/20260410-airoha_qdma_cleanup_tx_queue-fix-net-v1-1-b7171c8f1e78@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: Move ndesc initialization at end of airoha_qdma_init_tx()
      net: airoha: Move entries to queue head in case of DMA mapping failure in airoha_dev_xmit()
      net: airoha: Add missing bits in airoha_qdma_cleanup_tx_queue()

 drivers/net/ethernet/airoha/airoha_eth.c | 42 ++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 7 deletions(-)
---
base-commit: 3f20012a3964f487ae1e9ff942e2f35d4e9595bf
change-id: 20260410-airoha_qdma_cleanup_tx_queue-fix-net-93375f5ee80f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


