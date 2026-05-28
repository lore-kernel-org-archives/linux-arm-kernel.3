Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C4DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:
	From:Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMaA7h5kGMRU9hf/QRuYJW/W07yAJ1I7bh7FabXITYU=; b=OfoMlUcMszJB4+nFdrXoJEkPd3
	6X8afHCBOPQtis7r6EM/OrNcWmKixGvy4ix8IDkrhs6/l/KgGC4WacB1RtOq73K9Go/UpZhk/bHBn
	MOwQ54uISl0jLEYRUS8hjkSxiINqfDpQNh4mD4YoKoYXFoHehGibR4ZjDZwLTtdam+VeTNpJtMttb
	OZrWifr6siZpGba0t5Nip6C1XAEZDO76KI8z35Uz99zIL6Dkr4uw/bk68T/4ry+RhZs1TEcUe4c0A
	+mGMdWZPuHMrhJdb30+fTMkGCB7XCqN9wYm4pMpXDEm72Wm+q7UnypNNUWrWDjEN6lgqJG3zlU80j
	1oDqrVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSc97-00000005sxo-0d9k;
	Thu, 28 May 2026 14:55:41 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSc93-00000005sud-2fjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:55:39 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779980000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BMaA7h5kGMRU9hf/QRuYJW/W07yAJ1I7bh7FabXITYU=;
	b=njfeg0aU996w3zpMP+2q1ucUGMIvYDZSs21CeNIOfUiL1ZrI0VSfYke6OkZz2zMRnjkD9j
	OzS4sgXyyDAn5IBflYCdRtLbZwtsqaBKdQVzjCLPth+ha49m+0zG+Sdj6psnpFjZ5esy00
	yLfOy1+rIG/JFMKekOtTFrmiKmtpp1U=
Date: Thu, 28 May 2026 14:53:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
TLS-Required: No
Subject: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent heap
 overflow
To: clabbe.montjoie@gmail.com, herbert@gondor.apana.org.au,
 davem@davemloft.net
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_075537_913701_EC75570A 
X-CRM114-Status: UNSURE (   7.79  )
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

From: Tianchu Chen <flynnnchen@tencent.com>

sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
using the user-provided length with no bounds check. The crypto core
does not enforce slen <=3D seedsize before calling into the driver, so a
userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
sysctl_optmem_max bytes, overflowing the fixed-size buffer and
corrupting adjacent heap memory.

Add a length check rejecting seeds larger than the buffer.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System cr=
ypto accelerator")
Cc: stable@vger.kernel.org
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
index 491fcb7b8..010fa891c 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
@@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *=
seed,
 	struct rng_alg *alg =3D crypto_rng_alg(tfm);
=20
=20	algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
+	if (slen > sizeof(algt->ss->seed))
+		return -EINVAL;
 	memcpy(algt->ss->seed, seed, slen);
=20
=20	return 0;
--=20
2.51.0

