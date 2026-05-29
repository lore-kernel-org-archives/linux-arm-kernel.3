Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC91CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn8RGbbWhMK+fmOfLvNDrpH9fQ9BHow0UZabfx8bzzE=; b=mPDsXgdoP274cr01s5gnq4b9CX
	DDvsYEtM5fqdOLpflGFhjow8q5EkcNj98GdBazgSGqwSRT05uN+GzvDCyQLS+j5wTSvrD81zvbmBJ
	B/vTj3cH/u3LUNJSAU062NYNH58oRgFYS3x/3AXKpC6wlBp0RvbxH0jDxT+lfMh0pBa3SkeVeI/Jq
	JvJRdSU0F62rQGHvuIx68Wz/p6ZMWcSMmU1Q6lvo/DL1ywxZPZURbvY2ZZmRMgxsJJkwH0Jd480ja
	is45H4b8bTwW2oZXebt7sH9Tl5e15Y0SlpWRJbRwOKBPQdAS4745GdIQax/TdN9tqQrwNRaEOontN
	FnqFFk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsGL-00000006vsD-2Fbd;
	Fri, 29 May 2026 08:08:13 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsGI-00000006vrb-3gE8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:08:12 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780042087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cn8RGbbWhMK+fmOfLvNDrpH9fQ9BHow0UZabfx8bzzE=;
	b=IzCxCgfYrXXqAra8csjkLDYzBUaXEP1y+20GkUNHakvuHgvPcnDcVazIECq/qCx+KlXa51
	z9zMh+/V02p5KPJoKO5ii3Pkefr2lloZdWh0UE1xSxUpDsPzd/rR0+qFVIIf51SCtyi4Aw
	tnYQobxdi72BP9jrI96qSccPDLP3woI=
Date: Fri, 29 May 2026 08:08:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
TLS-Required: No
Subject: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent heap
 overflow
To: clabbe.montjoie@gmail.com, herbert@gondor.apana.org.au,
 davem@davemloft.net
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_010811_419200_D630AD5F 
X-CRM114-Status: UNSURE (   9.97  )
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

Clamp the copy length to the buffer size, matching the approach used by
loongson-rng for oversized seeds.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System cr=
ypto accelerator")
Cc: stable@vger.kernel.org
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
v2: Silently clamp oversized seeds with min_t instead of returning
    -EINVAL (Herbert Xu).

 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
index 491fcb7b8..7f6a51dd8 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
@@ -8,7 +8,7 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const u8 *=
seed,
 	struct rng_alg *alg =3D crypto_rng_alg(tfm);
=20
=20	algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
-	memcpy(algt->ss->seed, seed, slen);
+	memcpy(algt->ss->seed, seed, min_t(unsigned int, slen, sizeof(algt->ss-=
>seed)));
=20
=20	return 0;
 }
--=20
2.51.0

