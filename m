Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D9CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tES0q+TYNnYuVdAOmyqrMv/w+xs/tzZD1dDvpgip1pg=; b=VwQT2Vp2kH+E5FAuT2fzZ8DKRb
	f/tbZNkEbJa7fq23KhptXdvGReaeE8xB7Kaf8RRZi3PnGuGQ1ewYgoi+Zr6Bjrg108iCzbwqYuQOA
	rc1I04X1zpw/Co2ib7hX3zQT6n0orqhaqOlFEizWebQ2CiqE/QPqJWeNh04m9SqVTP1wJxXRwKxiJ
	oyHAxVvMJq/YyM8s+ZdeUC6Hrp6IrJqeeGtzDwgSwngBXQ2F3OtMwzMIe3fzwqMFlzpQApmginmI6
	xSSJbdhg3ZGGcnlQsYO4Os/KDgdD0EB5PzPw5xvbjLIKadOK0fyYhxNBb2ngZFVctiemsF3hjruvH
	twlzVz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qfG-00000008JvI-2zch;
	Tue, 08 Sep 2026 07:54:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qfF-00000008Jv6-3MqX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:54:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4330B60AA2;
	Tue,  8 Sep 2026 07:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6101F00A3E;
	Tue,  8 Sep 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854085;
	bh=tES0q+TYNnYuVdAOmyqrMv/w+xs/tzZD1dDvpgip1pg=;
	h=From:To:Cc:Subject:Date;
	b=TdL6EJMolIsymQu0svjdSII2NkiWQlfkoqG5jZHPcnz7py7Xt/XHJJkbrF7CpTJ7u
	 9WOWQw3LXOGUb8QfmYoZRBCmLr5Gni2PTjxYmv00F2L/pDVJJjBpTqY5K3WL9Q2z+8
	 HxAS99E17yZAmobOxyyTiWhAynDcX8QUPL4tysoKyZyIjUMsqEXpRN5WF1WImKbi9I
	 2sp5GpvtdNJBN5OtTpKxHjO1sy3H45eV6wS1TB84i7THOFuNCrHEHOPscsYbDK548k
	 Go1RIYDOXNjvaz2SeKwUe3mCWGhO0KBp1a/wjsZW9efyUJboFTHRjb8Z5Ti5tYAHow
	 4Y4VbaUqMl2vg==
From: Thorsten Blum <blum@kernel.org>
To: Harsha <harsha.harsha@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: zynqmp-sha - fix NULL pointer dereference in init_tfm
Date: Tue,  8 Sep 2026 09:53:40 +0200
Message-ID: <20260908075339.396499-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=blum@kernel.org; h=from:subject; bh=PPzNN39B7L/5123kefcOgUmHTJUIHSjPPl6fOtNhApQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnz9zMfXPBuy+ODFzaLvazjecqfe8Xt/IsDa6erzulP+ Hf4w6enbR2lLAxiXAyyYoosD2b9mOFbWlO5ySRiJ8wcViaQIQxcnAIwkac+DP+9ObwqrZpc+JTX Bx7I/m1mJFgQm2jDYPtC3u64Ep/IplkM/yvK9Z4+WHjT7AHz1w/u9nsbU/gOyV+u0u+LtFh54Jh LHxMA
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

zynqmp_sha_init_tfm() checks crypto_shash_statesize(tfm_ctx->fbk_tfm)
before assigning the fallback transform to it, which dereferences a NULL
pointer since the transform context is zero-initialized. Use the local
fallback_tfm pointer for the size check instead.

Fixes: c1dd353d18e5 ("crypto: zynqmp-sha - Make descsize an algorithm attribute")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/xilinx/zynqmp-sha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/xilinx/zynqmp-sha.c b/drivers/crypto/xilinx/zynqmp-sha.c
index 5813017b6b79..cd051e1f4275 100644
--- a/drivers/crypto/xilinx/zynqmp-sha.c
+++ b/drivers/crypto/xilinx/zynqmp-sha.c
@@ -59,7 +59,7 @@ static int zynqmp_sha_init_tfm(struct crypto_shash *hash)
 		return PTR_ERR(fallback_tfm);
 
 	if (crypto_shash_descsize(hash) <
-	    crypto_shash_statesize(tfm_ctx->fbk_tfm)) {
+	    crypto_shash_statesize(fallback_tfm)) {
 		crypto_free_shash(fallback_tfm);
 		return -EINVAL;
 	}

