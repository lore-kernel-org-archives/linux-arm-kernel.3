Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE61CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFhdpRv9iR7Qc8J7Cw//4CHayJHFtnc2pfvbLSWkvUY=; b=FIzNUssHTChuTaMAUCT8cz+ySI
	dtnP4CBZ+pwjVdI4KDoicNijBqsOUVDOybkoOMuX5qXL5z5OzED8AHrzehrRzOIBFC5hcOi6zvZnt
	fvHE8xzY2YLLLwgzTIfgtXZ40euS/sG+rz6D8URO8qkFnccnZgAXchvhhaIKi5DLXY82sYpFkKMsX
	DtY6SOGo3BCeguGeB4KqlJ9cur/YDwA4F2a+ev1PQd62fioNT7Ez4JftQVSkJoCnziUUt4aJDPq46
	6p7knIAAgZXsSNnCYlm4K5aUB2a3IRGvwyzA5f3wa/aY9CqdtzZongV6bzjcQiv+0Ag2XyO+NtqqU
	gpAEKNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXZ0-0000000DsuW-418C;
	Tue, 02 Jun 2026 22:26:22 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXYx-0000000Dsu0-2Iez
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 22:26:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780439173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sFhdpRv9iR7Qc8J7Cw//4CHayJHFtnc2pfvbLSWkvUY=;
	b=OgtWM0zvkiDPhp8fyZHlDO02xUt8hzA9wHXqs+QH5bqDQ7zRmljlsuoRQ9N8STnpgf1B76
	Z9twu5MNXJBxF9EVzqWJed6G4561e3IPelvLpKakvVxLAcDIpCyBIUuVSpTKOBICZXpaKk
	kCx2UidvHC79lpsQdDXqp4t79UPeTfk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - drop dead code in atmel_ecdh_max_size
Date: Wed,  3 Jun 2026 00:25:19 +0200
Message-ID: <20260602222517.1071850-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=thorsten.blum@linux.dev; h=from:subject; bh=GHxDkgIiIX6c6vtHT0FV/dwHUgNRsmaaQ7EjOBafrV8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnyEb6Teu69zq+5KL7i9fmNljwS5kZ9jHMuv66bFrH8z 9fll05t7ihlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJXHrE8N8vKvr4osBQuzwL 2zaR9nNZ758LcbC+fnRSNSitI57L24/hf1GN4HNv8dT1Nwt11yXus7lj6RPk6/hkGksr12SzDgY LNgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_152619_881118_770DBD43 
X-CRM114-Status: GOOD (  11.78  )
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

atmel_ecdh_init_tfm() always allocates ctx->fallback, so it is never
NULL in atmel_ecdh_max_size(). Remove the dead code and return
crypto_kpp_maxsize() directly.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9c380351d2f9..6a1716175b30 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -284,15 +284,7 @@ static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
 {
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
-	if (ctx->fallback)
-		return crypto_kpp_maxsize(ctx->fallback);
-
-	/*
-	 * The device only supports NIST P256 ECC keys. The public key size will
-	 * always be the same. Use a macro for the key size to avoid unnecessary
-	 * computations.
-	 */
-	return ATMEL_ECC_PUBKEY_SIZE;
+	return crypto_kpp_maxsize(ctx->fallback);
 }
 
 static struct kpp_alg atmel_ecdh_nist_p256 = {

