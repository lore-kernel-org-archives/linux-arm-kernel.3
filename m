Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EDCD3E788
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRor0wX1VNLPXmZcndSpRDBN1aoH7CRIkmM0Lcqn/lo=; b=j8oBbIpklrJutQ7Z6r7Ju7TjjX
	1CwT4789wo0XcRAsqz3DVrgF0mRyO6thZRPoikRDFqTwHWBWw6pYp0Bgpp7hI6hNHyGKk9bvu0NHk
	yKU5iBqL47VRZMdPscCH7yfMNltq3sYgryP7BMsYPa0ARBy0GuMd5BFettM7Wus/vsWNwfUcU79QP
	qzvQhEe6AWK3dbP+dMXjV6XRsE5TT+g/te78o2qPOzQ/2QH8m7N8EzMVkm0ZW65VNWEKNcdWMPIRj
	l501uhXWfbKONaY7wYk+jtllCjujmCvEzrfRdcFQLvvB4nD7CgI/tG4NBKTU0jDIs1h9AZ3WT29j3
	BJGeYRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMd-0000000G3n2-2HwB;
	Thu, 11 Dec 2025 01:21:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMW-0000000G3eV-1ofv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 271F644458;
	Thu, 11 Dec 2025 01:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65757C19422;
	Thu, 11 Dec 2025 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416056;
	bh=RPL2gSQ0HITBtieNdVNXNO558EclThGmelYePZPJ90M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FfUh8vucvxNnIFf/LTHchKtqKOdIIGXBkma40oZVP0OFlR6T7RfwOkonLGBxT3o15
	 gKCuKY0wp50ex7EkGdEGKKrNG301pIq+h9Eadd5GlGmV5WgJjxmEAkmdzarYQ8RUde
	 p+0hlY/kx87AWssVjB7wuDgRO+dVUcpM5zilhI1BOtcLmSIbAtA45BMyJsM6tuwxup
	 dHVP7xFp79e789OPQ/F0oQsFyNW8c6fwHa2G6z53K8TtrRIZ4Rd3oteVe9oPgozqtI
	 lweIf+z/gDrIk7SLogY0WxNbPeSg5xyw624e2xMhqGJ3FF0Q/ZnEmexWxo70L3BG2F
	 WTeKL3bN6Q8ZA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 08/12] crypto: adiantum - Use memcpy_{to,from}_sglist()
Date: Wed, 10 Dec 2025 17:18:40 -0800
Message-ID: <20251211011846.8179-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172057_622650_43B2C99F 
X-CRM114-Status: UNSURE (   9.48  )
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

Call the newer, easier-to-read functions memcpy_to_sglist() and
memcpy_from_sglist() directly instead of calling
scatterwalk_map_and_copy().  No change in behavior.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/adiantum.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/crypto/adiantum.c b/crypto/adiantum.c
index 519e95228ad8..6d882f926ab0 100644
--- a/crypto/adiantum.c
+++ b/crypto/adiantum.c
@@ -425,12 +425,12 @@ static int adiantum_finish(struct skcipher_request *req)
 		kunmap_local(virt);
 	} else {
 		/* Slow path that works for any destination scatterlist */
 		adiantum_hash_message(req, dst, &digest);
 		le128_sub(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &digest);
-		scatterwalk_map_and_copy(&rctx->rbuf.bignum, dst,
-					 bulk_len, sizeof(le128), 1);
+		memcpy_to_sglist(dst, bulk_len, &rctx->rbuf.bignum,
+				 sizeof(le128));
 	}
 	return 0;
 }
 
 static void adiantum_streamcipher_done(void *data, int err)
@@ -475,12 +475,12 @@ static int adiantum_crypt(struct skcipher_request *req, bool enc)
 		memcpy(&rctx->rbuf.bignum, virt + bulk_len, sizeof(le128));
 		kunmap_local(virt);
 	} else {
 		/* Slow path that works for any source scatterlist */
 		adiantum_hash_message(req, src, &digest);
-		scatterwalk_map_and_copy(&rctx->rbuf.bignum, src,
-					 bulk_len, sizeof(le128), 0);
+		memcpy_from_sglist(&rctx->rbuf.bignum, src, bulk_len,
+				   sizeof(le128));
 	}
 	le128_add(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &rctx->header_hash);
 	le128_add(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &digest);
 
 	/* If encrypting, encrypt P_M with the block cipher to get C_M */
-- 
2.52.0


