Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D74ECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mY3enrm8GFK36qU/nkkjB0lXkdJWeRdwxvRsf3AZR8=; b=XzMEDUQ+jVbLzhKHrK6TSD7GZk
	rdnOgQJjn4OXi+RY6hglVqg1OaiXrKc3uXBoh1gcY3og3KqeWp/a54j5iu0DsVNHIiyUoztKhmgeC
	CIRvYTEX5W0eTI/6+U93xAGhhgV2rEG9Qxnm7f3mwtBKZ2nipD8VKUKbyU3Hzid07ZD6yVxkfY8PG
	apu2c8h5Aujx1HRidtKykaTzeaN6Da9KrtHhhYgo/rkphMOrH8fbMl2X9ayH3JoUinazVWEbja1HZ
	AjHXUjHPvpwKTexM4bTbOJwmHfLrlQWicysN8hEENSrWUo9gpuDGao9XPejmWgLAgMIrX68q7jvKv
	+pqbKRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkb-00000009qi5-0bHZ;
	Sun, 31 May 2026 19:23:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTlkU-00000009qfl-4Bwn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 19:23:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3596F431FE;
	Sun, 31 May 2026 19:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAD41F0089A;
	Sun, 31 May 2026 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780255382;
	bh=/mY3enrm8GFK36qU/nkkjB0lXkdJWeRdwxvRsf3AZR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ltmEov7KkF/Do5u+UnehUfhpQB0vhC4ehOVE26KxpoRda66YHqhEZ/IFdLqcYvSYe
	 hYsIgbcO32GH0dYftrVPDh/cndTBRy+foG+1Tc9JyaYFUdF3c+hcE+hr+9rsn5fCg6
	 kWSv0HqoiMo+hLwJmvo9HenJkZJcqPbaOIVFZS/uz45ElS3PQxPJnR6Z7zGxeeE3su
	 gIR1X2ZEI6RceK6E3UDl+OYRy38hgo6cwnPEJNcwFiHnCTDUUKqAnwTmtLr9WHZkUp
	 r8R8eqm2KXURnTBGBfVOHT+yIhoYszGGGXK8AWpPxZlkNosieru1r0xdH0PGMyjtVk
	 OjvNgE08seixQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>,
	Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] crypto: xilinx-trng - Fix return value of xtrng_hwrng_trng_read()
Date: Sun, 31 May 2026 12:17:36 -0700
Message-ID: <20260531191738.55843-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531191738.55843-1-ebiggers@kernel.org>
References: <20260531191738.55843-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_122303_057810_308AE7E8 
X-CRM114-Status: GOOD (  13.56  )
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

Implementations of hwrng::read are expected to return the number of
bytes generated.  Update xtrng_hwrng_trng_read() to match that.

Fixes: 8979744aca80 ("crypto: xilinx - Add TRNG driver for Versal")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/xilinx/xilinx-trng.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/xilinx/xilinx-trng.c b/drivers/crypto/xilinx/xilinx-trng.c
index a35643baa489..a30b0b3b3685 100644
--- a/drivers/crypto/xilinx/xilinx-trng.c
+++ b/drivers/crypto/xilinx/xilinx-trng.c
@@ -237,22 +237,25 @@ static int xtrng_random_bytes_generate(struct xilinx_rng *rng, u8 *rand_buf_ptr,
 
 static int xtrng_hwrng_trng_read(struct hwrng *hwrng, void *data, size_t max, bool wait)
 {
 	u8 buf[TRNG_SEC_STRENGTH_BYTES];
 	struct xilinx_rng *rng;
-	int ret = -EINVAL, i = 0;
+	int ret = 0, i = 0;
 
 	rng = container_of(hwrng, struct xilinx_rng, trng);
 	while (i < max) {
 		ret = xtrng_random_bytes_generate(rng, buf, TRNG_SEC_STRENGTH_BYTES, wait);
-		if (ret < 0)
+		if (ret < 0) {
+			if (i == 0)
+				return ret;
 			break;
+		}
 
 		memcpy(data + i, buf, min_t(int, ret, (max - i)));
 		i += min_t(int, ret, (max - i));
 	}
-	return ret;
+	return i;
 }
 
 static int xtrng_hwrng_register(struct hwrng *trng)
 {
 	int ret;
-- 
2.54.0


