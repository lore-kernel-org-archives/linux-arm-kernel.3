Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A062C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xMq8l7gT6yB6KuF9QRWCL28yujf4mq6rtubflHZD75Y=; b=KQPvlPI//nhaiXc4cC6n6i/O2u
	zQkxH0pN30HMzfMQfHX898pj8HFLESmytkGsQ2W3dmS/snDY4E4tCoGh7KQgN2PPdtj9PoK0KjdyY
	3sA2xg/6451EvCJwMCRib2Rt473bL2gsgRGIZkJ8ywzz42OIhzzPpDIxYAl2aKZfvHDPEXO0qrYoA
	9HBMJcqar/NJOO6eVJcWDr7948Z7yRaryP9QuUi+TmFLPgvlLfmrcPo2V0ZhINpmkhQZmoZDHcJUt
	BWDYYb5n0Bhu1aS/2tuEKDnVd4kESguOz2qbQM7c19sh/CbQL0ZoFSJSkfqYYnDsitrobbB2iQ2UF
	qEhh9hrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41Iq-0000000A2xB-3TwH;
	Tue, 08 Sep 2026 19:16:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41Im-0000000A2wr-2rDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:16:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B82E43ED1;
	Tue,  8 Sep 2026 19:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A40A1F00A3A;
	Tue,  8 Sep 2026 19:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894976;
	bh=xMq8l7gT6yB6KuF9QRWCL28yujf4mq6rtubflHZD75Y=;
	h=From:To:Cc:Subject:Date;
	b=FiBgZpILqusTF6OW8Sna+WwhvoBP+hyiz7cfB+tCzf7IZikJNl9TVqmlmUADOv9H+
	 T1eTEIpH4+D6jLMFIMa4/rbzDTWzpAHsKeysoI66xL22ZzeXjl2PnMLmpxUeeJxl13
	 2CVKcw+pP3/2fESs5oli+DKZ7ZxYNF3Q9WaTGe+ruajAAxZY4lE5jEVLcFa99QZGFK
	 AUBzNfq4o+CkEg/Mt8Y8MOEUH9R+hMbMPK7XWWnADjN6vJ2kRhVxjev7cOL5D5C3Ec
	 PHFoZRDXdCpShrMgiv4MQsYMX04DGPTNG5nucTUhG/O/1Id9aCgHoCYKvcoIQN2dvs
	 KYy1tK6f1p4TQ==
From: Thorsten Blum <blum@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>,
	Harsh Jain <h.jain@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: xilinx - clear AES key buffer before freeing it
Date: Tue,  8 Sep 2026 21:16:06 +0200
Message-ID: <20260908191607.405177-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=blum@kernel.org; h=from:subject; bh=cog+oVLaKQct6BzbWKYJueIWkbLd1K/8HinrtKRYCBQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkL4r5vf2fzboLsGc0Djwtd9L6o3bFbkDPLPW3NOqE/B qs3O9bGdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEmr8x/BUPu94jsKbVMEv7 p6hSYoLiz/rXIhHJ3/RWcm251rO+6Rcjwy6+/etf/+g+39l7/+HTMjVP1ocCTL3loR6FSpeD72n 5cwMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

In xilinx_aes_aead_exit(), the AES key buffer is freed without being
cleared, which allows key material to remain in memory. Use
kfree_sensitive() to clear the buffer before freeing it.

Fixes: c315cb0005be ("crypto: xilinx - Change coherent DMA to streaming DMA API")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index d54c268dfe34..ebee37dddb1f 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -766,7 +766,7 @@ static void xilinx_aes_aead_exit(struct crypto_aead *aead)
 	struct xilinx_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
 
 	dma_unmap_single(tfm_ctx->dev, tfm_ctx->key_dma_addr, AES_KEYSIZE_256, DMA_TO_DEVICE);
-	kfree(tfm_ctx->key);
+	kfree_sensitive(tfm_ctx->key);
 	if (tfm_ctx->fbk_cipher) {
 		crypto_free_aead(tfm_ctx->fbk_cipher);
 		tfm_ctx->fbk_cipher = NULL;

