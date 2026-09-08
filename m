Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1EFC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFouBrDvOF7lxX1bdyzrKECZyS1XzB2v6ceuwETk4Kg=; b=WP8Hw5WeyVPW0DJ2TafbyOP5i0
	x3GcIAxKepRneAbSv38AwMPp5ggtqlwmZ52Oh44qbR2vW2vxQpnY8z5kdopTxkVyGMQ4NlPKLkch1
	Imj36GDmX2AsQsLqvq+AujAJB30GaZi1vf9SI3s3HpzhcU9Z3jxMDIRFvUnSDZcigoO8IdIWs8nbm
	ex7a8aUEKYaHYKBGGH4VpiZXyHly6WzV25gD+N0sdviNVORKgBWf1zeamTh+OB4akpIUbZUPyoB7F
	pmIlTgiLgqGZ8vIwcz4yMURI/cJJiNxeBv58dgDcoin1bbalR4zzbD4bGgP/vH7vgSeqexX0IDpaO
	p6lr2rDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x413E-0000000A1P5-2ceS;
	Tue, 08 Sep 2026 19:00:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x413D-0000000A1O2-22b1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AE7A601DE;
	Tue,  8 Sep 2026 19:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DA21F00A3A;
	Tue,  8 Sep 2026 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894009;
	bh=HFouBrDvOF7lxX1bdyzrKECZyS1XzB2v6ceuwETk4Kg=;
	h=From:To:Cc:Subject:Date;
	b=N/cQyMPRycKSXLy03V/MOuTeh9ticoR1otYyI4v1VNPuECDDaNiE/lvwOLw66QzO9
	 MSYQR6nOWjY/uAr6c49z/h/VlHo35cIp7zHDWpzs2aj5Ju9766NKEnvuepN/CuaakM
	 xTrOMM2wI8/8Gi88R+EWPuMBjhMdhk8k+ZeV13J5NcxALqmhuTFkjG2nUUK4y6MrYG
	 JxpWsnBmGDtKa1RlGkdq908lZMJSt6qKghNdXAIh89fC3Z2fW70H1SewcyuhtGLHgc
	 Hm7e9vGqGUZ+00xuiGX8AI24w5odN5DOJAoqhowRnmXeiMn/Yq+Y37ToG4F2XovWw+
	 wO0a7HXNDR63g==
From: Thorsten Blum <blum@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>,
	Harsh Jain <h.jain@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: xilinx - use kfree_sensitive() in cleanup paths
Date: Tue,  8 Sep 2026 21:00:00 +0200
Message-ID: <20260908190002.403337-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=blum@kernel.org; h=from:subject; bh=8+uza+k5pHXZ0MWaODzess7JwDpGQss7ZmEM/0YU67c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkLoo0CiyRj8rY+n699qSJvlcx8kT13lgS2nnkRdX2y6 XqlqTvWdJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEZC8wMszkezo9ymSrMJNc M1/9rChW1YbeqfyVD+r65OoceuX9Ehj+CgRJyx/LzGpmryv5ffVQx8wZkU3i3gwW+97v9p2WuW4 dKwA=
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

In zynqmp_aes_aead_cipher() and versal_aes_aead_cipher(), replace
memzero_explicit() followed by kfree() with kfree_sensitive() to
simplify the code.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index ebee37dddb1f..d9bd6dcd23a6 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -230,10 +230,8 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	}
 
 freemem:
-	memzero_explicit(kbuf, dma_size);
-	kfree(kbuf);
-	memzero_explicit(dmabuf, sizeof(struct zynqmp_aead_hw_req) + GCM_AES_IV_SIZE);
-	kfree(dmabuf);
+	kfree_sensitive(kbuf);
+	kfree_sensitive(dmabuf);
 
 	return ret;
 }
@@ -364,11 +362,9 @@ static int versal_aes_aead_cipher(struct aead_request *req)
 	if (unlikely(dma_addr_hw_req))
 		dma_unmap_single(dev, dma_addr_hw_req, dmabuf_size, DMA_BIDIRECTIONAL);
 buf2_free:
-	memzero_explicit(dmabuf, dmabuf_size);
-	kfree(dmabuf);
+	kfree_sensitive(dmabuf);
 buf1_free:
-	memzero_explicit(kbuf, kbuf_size);
-	kfree(kbuf);
+	kfree_sensitive(kbuf);
 err:
 	return ret;
 }

