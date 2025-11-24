Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A54CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=acoEopoe4qbs9MeA8Hy6TAM85m4NiBqg+jsNhIpzPr4=; b=cYSm2xytqP2/PIDjF7SDkauo9X
	TDuc1x2AVU6SN/RlBNX7KtdzJI+pscb42pG2A8ADg7jaUzga3xP48oR6CHVQZLHo8meAqplH79l5O
	D4Z/TpnhvGDF9zsivF7gBDX19xs0W6fsiN8x3BZTGAGpDCsVTnkrcJqR3QA4OhsDsr5/YBpYummEW
	4zOSg92Nm+q6xHJ2nPD8IijT2OA5hfUE9Hmv5CuDV5ENeJSTndX/rSYRoBHGPq+SXlYaSGxYHlWdS
	gBfyFAJwNnnZiFYNszaaOZtdmilEOU3XhZ/oYZEQ/puqof6eDiRJIWnzXOF2Pk9pSoiDbCNtDfBsR
	7xUzehSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSbg-0000000BJkY-3ayC;
	Mon, 24 Nov 2025 09:11:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSbg-0000000BJkQ-0ovk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5296A60127;
	Mon, 24 Nov 2025 09:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218ABC4CEF1;
	Mon, 24 Nov 2025 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763975495;
	bh=kxGpo/egBIFq7+bW7hMJPBwGl+t/HkgquWHWxMcBps0=;
	h=Date:From:To:Cc:Subject:From;
	b=ebjjOIGGtmKWVy+EtYu4XZgPXZkbHhaEuF+1cCF7OYJPT3McEyBJRISrruMP4sO+r
	 9YFgH4eIaDou+bCg2gfG+vBYtPu6GRSvYL/OfIT0+rGM5PZLsqPr8EwIBxzTt7wQLB
	 PcFE+GkTDeyd4l/X5g968l00EL8JnJZfohYR+fguqP25XxZVa+5MhdeLzw+Hex8xJo
	 y3U0TrC1lAyGNQB56PHSOfRcmT9qg8PMiRTu5k/nELgEiL+6ofbzJ53DKQWXEKUbP0
	 LB7ziiPu2Eve/3UydhUfsC6vIGpfFB7AGhviGHSGN9m+CewCec0iNwtCclwr45V2/J
	 Qm+HhPs6H5yOQ==
Date: Mon, 24 Nov 2025 18:11:30 +0900
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] crypto: sun8i-ss - Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <aSQhQh1xyp-zauPM@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declaration to the end of the corresponding
structure. Notice that `struct ahash_request` is a flexible structure,
this is a structure that contains a flexible-array member.

With these changes fix the following warning:

drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h:251:30: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index ae66eb45fb24..3fc86225edaf 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -248,9 +248,11 @@ struct sun8i_ss_hash_tfm_ctx {
 struct sun8i_ss_hash_reqctx {
 	struct sginfo t_src[MAX_SG];
 	struct sginfo t_dst[MAX_SG];
-	struct ahash_request fallback_req;
 	u32 method;
 	int flow;
+
+	/* Must be last as it ends in a flexible-array member. */
+	struct ahash_request fallback_req;
 };
 
 /*
-- 
2.43.0


