Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E2F36C41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIxFM4cBCmTZ3VQvCVMagv4DMQBxu6L9h1p7hNWUSU4=; b=31aFFpAbNi2lyu
	XcDhbCtNu6eyWAE+wy0nKS48NJfaXcfi2Q9u9I3IXXRpb8J7mnBfUETEZRLPZXNBkp3TZoeJgYxm3
	+dpv7RZlpxa/VftTl1eahWDkW5Tg828Np8awUFpt5HKa7wJxCWRyPpvZ7KFA3bMe7u0w2oWR9aX2y
	t6/89j40jHOloDyAOk3jaO86v8Fg5Fv2EXHkrrnSpTnLYdHz0bI7uZUrQ2arbIo2adFS6GmM8abTp
	OmyFYCu4uupTxtB1CvZazFOxVjMr4eeL356kENBykwUw8pqrPqZwBqjmyV5wBdcpASyUZiaFxh7DO
	C81JWez6+rz4OIWyQ63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjfu-00000006ZxX-1cg9;
	Mon, 20 Apr 2026 08:08:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjfs-00000006Zwe-0qnG;
	Mon, 20 Apr 2026 08:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1676860055;
	Mon, 20 Apr 2026 08:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC22C19425;
	Mon, 20 Apr 2026 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776672485;
	bh=0MlFO6P0m8/NK/SYcNlmOcWF1m2ZQhsuX9z7XL/3XC0=;
	h=From:Subject:Date:To:Cc:From;
	b=ZlMNJzI7t0Y0qGiYo1CDXuQmn4Z9R5ZnKzV1cF3a8WLcnF6jN9IUeymCJEf26bo9f
	 54Zl2NwTEWKJhqVq2ZITZPoTi2M8Ji84oEjt3MXZjPKtUH0FYA1ANzz4dNa7JDYsBC
	 hpPCbiaTotKQH82YNRxEn+6kc3gtXfqkpsAb+v1ssf2GihHIHAlDmTftjwRVpLVvMB
	 Mr35MGZV39COFzv57XODIZkzVeWj+EIaMQEVCoonpkGJueu7ORqjbguxmyFIAM0WW4
	 xZEk/U1A3gznpIApYsWDaZ6Ew0gduJBWnyJUer+dG8tnLbNuL728dCGaVu+zvT6oa3
	 t8ZXtjaSBDLUw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v2 0/2] net: airoha: Fix NULL pointer derefrences in
 airoha_qdma_cleanup()
Date: Mon, 20 Apr 2026 10:07:46 +0200
Message-Id: <20260420-airoha_qdma_init_rx_queue-fix-v2-0-d99347e5c18d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NWw6CMBBFt0Lm2xpKeIhf7sOQZrADTNRWpkAwh
 L3bsAI/z7nJuRsEEqYA12QDoYUDexchOyXwGND1pNhGhizNyjTXlUIWP6AZ7RsNO56MrGacaSb
 V8arauu3QYqHLSkNsfISiPvp3cDRBE+XAYfLyPT4XfUx/5hetUmXbusOC8vJCxe1J4uh19tJDs
 +/7D/h0LCLQAAAA
X-Change-ID: 20260417-airoha_qdma_init_rx_queue-fix-b9bfada51671
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

Fix two possible NULL pointer derefrences in airoha_qdma_cleanup routine
if airoha_qdma_init() fails.

---
Changes in v2:
- Move page_pool allocation after desc list allocation in
  airoha_qdma_init_rx_queue()
- Move netif_napi_add_tx() after irq desc queue allocation in
  airoha_qdma_tx_irq_init()
- Link to v1: https://lore.kernel.org/r/20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Move ndesc initialization at end of airoha_qdma_init_rx_queue()
      net: airoha: Add size check for TX NAPIs in airoha_qdma_cleanup()

 drivers/net/ethernet/airoha/airoha_eth.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)
---
base-commit: 0cf004ffb61cd32d140531c3a84afe975f9fc7ea
change-id: 20260417-airoha_qdma_init_rx_queue-fix-b9bfada51671

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


