Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43749F99375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwuJIm7Dw5jp31ncEc1KOiDX7dt/dDt8uIoQj49sz9E=; b=oN7T5asWcESVpW8Lw6d5jOXyGP
	nJELGn6nnopdGwXFtKLNHs7++riEA9zi1/rYCe1w69z2RA89HKVHF5z1qM5eMHz0/Txl8IqqozUWO
	0+lbS8Yms5gIE2krytwBIUUuhq3uYDm4mqosI4a/qN2qC/3syZ7IKLkxVTMYvs/0zdtVt3lkiN/2H
	H76KwHHmoxIU3IkFq7PhTFHkcyQMfEhmeeC6iPGHFmOuOV10qa1E+JpwOLw605psliNxUOmEoLeu7
	a6e1ZfCYvaq3FXHD8nySLMY/Xr7Q/pUdU7iC3lwHqol3bqqHqIZ/L9jLEo45EklhYqVq9+2ye/4Ys
	xLA4F2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFs6d-0000000BWmB-2A48;
	Thu, 23 Apr 2026 11:20:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFs6b-0000000BWlp-1U7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 11:20:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35d90833cacso4193304a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943224; x=1777548024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwuJIm7Dw5jp31ncEc1KOiDX7dt/dDt8uIoQj49sz9E=;
        b=l729avwI/IC+S+WTXnHiTIv2EEB0j5wJOF5bEYTcp0snBsUQSVMEu9dTnjwJKXWOgw
         aF4sOy8Bvl2h91yB6FScwV0K3SHDkm+6yfvCf0c8yBxfSm18gq02lSEOJzoa1GtDDAXR
         4j6FKUysqnofwvMWtJ01vxbEyxwQrHWK+3w24Xi3EoNugWW26gtJRceMRO8S9aRaFaD7
         aN2O+3Z1E+yqQasjV/YDTXX1kwMcMd7CMIDozdtRPo/4huqzbmp8Nl6Z/3j/CJt7xoET
         mhNXTAEFhf9/G49JReezXQjPvQJDRB+vUR/WI8/Y3IN2XkXmHLzDqDg5fvdRdKomeFbP
         Qvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943224; x=1777548024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwuJIm7Dw5jp31ncEc1KOiDX7dt/dDt8uIoQj49sz9E=;
        b=r76Yx21WSftqKzWmrzC1I1oPWd/u7myhQr65KFyk6STS/Uw7M7OwVPDAkRYqEMSrOy
         MipOhmzugzPmCZzj01JH2iTwCdYntToii/fvpMGMjrwrZUkAjrHfcGIsvhYJJPcxM4BX
         TiWRI9h1n56xBc0Hn4GRvtOMI5usIWygTXEmEzF1KsJ34zS7HQ49lUMjiOZzWKNDdlgD
         eCWWqtGClKhnwES1N6ntpg/SjKvND496f4oru9R4vEC+oDc8yUuOeJbKmZQ80nvGWq4Y
         QKOUBlDvfWG+/ISytQ0X/YfAnLZRAZoMOawC0Ry7oyGCylWkdNT9RTPVor41eBT0KLjL
         CZ7A==
X-Forwarded-Encrypted: i=1; AFNElJ+WE9O5fQc9OocDzsHsjZ23iI189spmMvnPXt48sh7YKvOmR/Y+OL3i5ycNwaOpDG+Yh+eKcXxqorU/Gy+OWpNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtIRFDvQ+KUmfThYSYfXI0qAvLu5Zy5y2/WZWmEVzSgY4qh4EX
	4lr3qvuDYa/9fPqoAaWQyeXbR8FQJWsm00ISyYUv/cC4ktzhAvs1jcsS
X-Gm-Gg: AeBDieuS3gIEw1WFxxnJl6cyFkV2I6eYRk80/AdBoU33HPlZahmsEmiwAH23XlNdZ3s
	LtFcKNhkSvsWj+Z/VhOKYKdiOrt+PK+pzsDjWOVCZCSAHimWgR8BevixBCuPuZY2BXpoACUZN5f
	duh6AFx8xJ2lgckqBwfXGxQGXIpKifiZYzC/HVYMejNHWkg6kq2rAxBNA6mPOf4hRxuG2xFPPOI
	J21aZOtrlqeWWvBHyCEWlpHPFBQCG124bsplSAMeHCLt4Rw9cgrfYZ/vQUSt68CF69c6t9z/09s
	ud4RtrXQptGIhUd02tAdkzmF3ADznUozwVUIM1YXvbbCmLILkjaHMjj5FMIorTLQSokKyqSg3Sy
	uixjDdO28/Fso7e3AaX6RSXKgkhliMh5B8AP95s+rX922IG6jxwiHw6Qx0ti1MkoWVWAfGnHDuw
	c+AeuennePkSXoIGy1z+ef/zQ3FPeIetPJ+GK5bvaifyIP1IMUu353BOJa+5OeTKA=
X-Received: by 2002:a17:90b:2243:b0:35f:bf4b:c396 with SMTP id 98e67ed59e1d1-361403ca5femr25738150a91.1.1776943223737;
        Thu, 23 Apr 2026 04:20:23 -0700 (PDT)
Received: from LAPTOP-CUCB24GH.tail9a93e7.ts.net ([175.159.176.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141973c57sm19456388a91.14.2026.04.23.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:20:23 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] crypto: ixp4xx - fix buffer chain unwind on allocation failure
Date: Thu, 23 Apr 2026 19:19:56 +0800
Message-ID: <20260423111956.185761-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_042025_400995_D42CEED3 
X-CRM114-Status: GOOD (  17.06  )
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

chainup_buffers() builds a linked list of buffer descriptors for a
scatterlist. If dma_pool_alloc() fails while constructing the list, the
current code sets buf to NULL and later dereferences it unconditionally
at the end of the function:

  buf->next = NULL;
  buf->phys_next = 0;

This can lead to a null-pointer dereference on allocation failure.

If the failure happens after part of the descriptor chain has already
been allocated and DMA-mapped, the partially constructed chain also
needs to be released.

Fix this by terminating the partially constructed chain on allocation
failure and letting the callers unwind it via their existing cleanup
paths. Also fix ablk_perform() to preserve the hook pointers before
checking for failure, so partially built chains can be freed correctly.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
v2:
- Keep the unwind path in the callers, per Herbert Xu's feedback.
- Terminate the partial chain before returning NULL on allocation failure.
- Save the hook pointers in ablk_perform() before checking the return value.
- Thanks to Herbert Xu for the review.

 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 25 ++++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
index fcc0cf4df..5b90cf0fb 100644
--- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
+++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
@@ -884,8 +884,9 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
 		ptr = sg_virt(sg);
 		next_buf = dma_pool_alloc(buffer_pool, flags, &next_buf_phys);
 		if (!next_buf) {
-			buf = NULL;
-			break;
+			buf->next = NULL;
+			buf->phys_next = 0;
+			return NULL;
 		}
 		sg_dma_address(sg) = dma_map_single(dev, ptr, len, dir);
 		buf->next = next_buf;
@@ -983,7 +984,7 @@ static int ablk_perform(struct skcipher_request *req, int encrypt)
 	unsigned int nbytes = req->cryptlen;
 	enum dma_data_direction src_direction = DMA_BIDIRECTIONAL;
 	struct ablk_ctx *req_ctx = skcipher_request_ctx(req);
-	struct buffer_desc src_hook;
+	struct buffer_desc *buf, src_hook;
 	struct device *dev = &pdev->dev;
 	unsigned int offset;
 	gfp_t flags = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
@@ -1025,22 +1026,24 @@ static int ablk_perform(struct skcipher_request *req, int encrypt)
 		/* This was never tested by Intel
 		 * for more than one dst buffer, I think. */
 		req_ctx->dst = NULL;
-		if (!chainup_buffers(dev, req->dst, nbytes, &dst_hook,
-				     flags, DMA_FROM_DEVICE))
-			goto free_buf_dest;
-		src_direction = DMA_TO_DEVICE;
+		buf = chainup_buffers(dev, req->dst, nbytes, &dst_hook,
+				      flags, DMA_FROM_DEVICE);
 		req_ctx->dst = dst_hook.next;
 		crypt->dst_buf = dst_hook.phys_next;
+		if (!buf)
+			goto free_buf_dest;
+		src_direction = DMA_TO_DEVICE;
 	} else {
 		req_ctx->dst = NULL;
 	}
 	req_ctx->src = NULL;
-	if (!chainup_buffers(dev, req->src, nbytes, &src_hook, flags,
-			     src_direction))
-		goto free_buf_src;
-
+	buf = chainup_buffers(dev, req->src, nbytes, &src_hook, flags,
+			      src_direction);
 	req_ctx->src = src_hook.next;
 	crypt->src_buf = src_hook.phys_next;
+	if (!buf)
+		goto free_buf_src;
+
 	crypt->ctl_flags |= CTL_FLAG_PERFORM_ABLK;
 	qmgr_put_entry(send_qid, crypt_virt2phys(crypt));
 	BUG_ON(qmgr_stat_overflow(send_qid));
-- 
2.43.0

