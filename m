Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0856610BA45E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uX0ZkDshfrjUuQd8q4yz2ndynx0ogljmjvdsdmFxGS0=; b=WCkV+sIQDfFCrxL3WsVWjHYyQE
	aIc8xkO194wrTTMH2VnszOJlaLFKSsrX+SIWXU2tcj1wNzqbMVGT5mM0ulhZUqJejWWIHAkOW4wlQ
	4KFj81a+puw8gUguZCnb4qHu6GlnUeuXpLWBQG+ciFB4FqEdRZtOJQNoX/5CwxjOprdgzsUYrMtaz
	DcUI88goRz4E6BngNzzCOvYDzoK0+2Y5p+nHPzwt3/S8XVtAl8dbZwutbanOS1JsEgExOuV+ZEo19
	48F5RPWOOFChfCYi6nSps4LK/QrrRA7kgMtb58WfP7CCzTrdOtpzSzQzOpTEbio2sw3pJgaV31obm
	bYhgOqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Qz-0000000744x-3leH;
	Fri, 27 Mar 2026 09:24:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Qw-0000000744a-0TOE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:24:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D3F44E4280A;
	Fri, 27 Mar 2026 09:24:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBE7960230;
	Fri, 27 Mar 2026 09:24:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C40C210450F33;
	Fri, 27 Mar 2026 10:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774603484; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uX0ZkDshfrjUuQd8q4yz2ndynx0ogljmjvdsdmFxGS0=;
	b=xSWvcl8Isbuq0d92ng8BHqR2A3YD/pHQymygkKgvTGzvpJ/9TUPBQ5jualNb6iSeS3B/5i
	+57n2WSDTy/VWyaeVK08FOZkJNuKikPRGIapifgdHbDCJ9ZVFrsduV9/fUrJANVTpnRhrx
	2ld29wYDZxahiOPJwVtWp8hdCr5cDNzBt/sfpvNU57UZAp3f0cKeGC0wxuEhl6/8F/JBN5
	nxf5oYT+3UZw0LCt+nwOAmrVcAk20MBawzmq2bBImMdMoN4/plhIY/2oA6nx1SxCpCOKRi
	PDQ/77dJF6F5/n3wOy/p0eR4hlX9LJIZNRVgRSGfYVLDb+B37c4uG8wyb//msQ==
From: Paul Louvel <paul.louvel@bootlin.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: aspeed/hash: Use memcpy_from_sglist() in aspeed_ahash_dma_prepare()
Date: Fri, 27 Mar 2026 10:24:18 +0100
Message-ID: <20260327092418.10476-1-paul.louvel@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_022450_285378_1681DEC2 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Replace scatterwalk_map_and_copy() with memcpy_from_sglist() in
aspeed_ahash_dma_prepare(). The latter provides a simpler interface
without requiring a direction parameter, making the code easier to
read and less error-prone.

No functional change intended.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/crypto/aspeed/aspeed-hace-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace-hash.c b/drivers/crypto/aspeed/aspeed-hace-hash.c
index f8f37c9d5f3c..6f0d03cfbefc 100644
--- a/drivers/crypto/aspeed/aspeed-hace-hash.c
+++ b/drivers/crypto/aspeed/aspeed-hace-hash.c
@@ -182,8 +182,7 @@ static int aspeed_ahash_dma_prepare(struct aspeed_hace_dev *hace_dev)
 			final = true;
 	} else
 		length -= remain;
-	scatterwalk_map_and_copy(hash_engine->ahash_src_addr, rctx->src_sg,
-				 rctx->offset, length, 0);
+	memcpy_from_sglist(hash_engine->ahash_src_addr, rctx->src_sg, rctx->offset, length);
 	aspeed_ahash_update_counter(rctx, length);
 	if (final)
 		length += aspeed_ahash_fill_padding(
-- 
2.53.0


