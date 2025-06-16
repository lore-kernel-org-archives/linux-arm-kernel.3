Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD93FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I38ai5ionxBMkBimwgLTi73TMk2JcKNFvw44Vez0IHg=; b=wjpfxNZsqOVx9KctHaSbDLKk5+
	QOOoBboTa9Kdqw1qCiz3TlEkxp8SFNp5msQ1uIlc1N3LHrnmEgPJ+v7IYp2BWBTVBsD1eclqp9yil
	su+3IqyjawE2VtpMSsz7lQsE1ivjhRj0N2FxizN6JmyXY0/xmxiMiIEtw6xbfC482u9jPa5tffCWD
	MwzMHOhoW2kvw/kiRLtIpxK384IgGysehboRWWy+1LZofQU0zzgt5jiaa3dlFAjUxx7Qz3A3oeze4
	VDGZtqVSXRRKA5Th0L0O2sOf0hGHIiVzJRVArFy8Dwm4WI1ujJTH3Rt35ywX53J9tsk8acKW4MStW
	yRoa7wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1C6-00000003Jza-2IRe;
	Mon, 16 Jun 2025 04:11:38 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR19t-00000003JtI-0njE;
	Mon, 16 Jun 2025 04:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I38ai5ionxBMkBimwgLTi73TMk2JcKNFvw44Vez0IHg=; b=Dkr31hJxvLQnMX0CfUojD5ZoE7
	MusiFgiCS4vFeeOt6FIPojpyxxSZVMUfETa4aO4WEzxp0Mjc4uOXbiK6zlntrb0LOL3eEZ//QO29I
	1QPx96pD1ghlO3yPOzExTtEJ5KpKXOeEsJUbu9oED8EkTc2ABJC59nNNWQkr7t49qgLqu0Lo/4O/P
	N0MTEVx+OkOxgm2Y6507kpc/JUHsMWiIi16uANk6vdK8E/qCV5C7q+Vr8nWeOmcYUJU5QmOg1pypW
	TRIDx0faC1zS86z9Bm8sHbovNm2tMcfNbZQLNicr/kkjQ66KlAP2x2YVqG2HcJI6DnWoKnUoeXe+8
	BToQgXOw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uR0uf-000JCI-2h;
	Mon, 16 Jun 2025 12:09:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Jun 2025 12:09:17 +0800
Date: Mon, 16 Jun 2025 12:09:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: [PATCH] crypto: ahash - Fix infinite recursion in ahash_def_finup
Message-ID: <aE-Y7VzdJTDJHsy_@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615031807.GA81869@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_210921_285861_775C3D91 
X-CRM114-Status: GOOD (  12.57  )
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

On Sat, Jun 14, 2025 at 08:18:07PM -0700, Eric Biggers wrote:
>
> Even with your patch applied, it overflows the stack when running the crypto
> self-tests, apparently due to crypto/ahash.c calling into itself recursively:

Thanks for the report.  This driver doesn't provide a finup function
which triggered a bug in the default finup implementation:

---8<---
Invoke the final function directly in the default finup implementation
since crypto_ahash_final is now just a wrapper around finup.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Fixes: 9d7a0ab1c753 ("crypto: ahash - Handle partial blocks in API")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/ahash.c b/crypto/ahash.c
index bd9e49950201..3878b4da3cfd 100644
--- a/crypto/ahash.c
+++ b/crypto/ahash.c
@@ -603,12 +603,14 @@ static void ahash_def_finup_done2(void *data, int err)
 
 static int ahash_def_finup_finish1(struct ahash_request *req, int err)
 {
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+
 	if (err)
 		goto out;
 
 	req->base.complete = ahash_def_finup_done2;
 
-	err = crypto_ahash_final(req);
+	err = crypto_ahash_alg(tfm)->final(req);
 	if (err == -EINPROGRESS || err == -EBUSY)
 		return err;
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

