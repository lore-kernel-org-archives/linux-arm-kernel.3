Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B753F99368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MivdOIkmxvQjBHx2aFyPQuZoyPRSFrsVHDXpJ+ckBGU=; b=lnGfsP6kA/VZk09Ca/helYLUAh
	DDjFROPzovPmR3FD3tOJBXy+dLMFaHNPNdTzH41bb3z8N1RMuZ5MX9lgih15vNnw4eL4DWn3YEI6o
	neHB2koM9NYeLL6XPLtC7jWcy+rfZaQmM119m0oAUaw2XDnoOs/E5Ykmxy4ypE8JxG0wMuXSLwvfY
	mne2ZzvydErW5BTDz5MPXe1Ir98DoOq7b1xdl5F8de48oFIE6e3y9jGVI11ivI1K2SdqEnVpHovgb
	xCCOoItz0+Bx5SR4TVzzDT9gQ7Qs2NxE8O/uwDz8vKmyvqZATK/ecwm9GSASgnfE3ajFkxIb4vxyG
	hOIIZ1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrGk-0000000BTvD-1nMa;
	Thu, 23 Apr 2026 10:26:50 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrGg-0000000BTup-49OJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:26:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A64137A00EB;
	Thu, 23 Apr 2026 06:26:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 23 Apr 2026 06:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776940004;
	 x=1777026404; bh=MivdOIkmxvQjBHx2aFyPQuZoyPRSFrsVHDXpJ+ckBGU=; b=
	FgpSEX/plv/W4Mb0DlxhouzBUJjGIXd8wnf3bCmoDOR69UIq9nm1H+6m73vxPAPw
	PRJQtSub9nB3h2JyjDEDyApKNKm9T5bYIRn6WLdOQrG0XdP5FPI/cFihqdqpBlGd
	miYvmFRDicVmOa2TGLPgA+fMGbIUzlMkndLQDd5M0dxHSFRoo2xHUhbQBB19Wirv
	mpmsPWpp/fOtKNGw9K7fwfsPPTNN2rxdRI+HGZUv//90HQxBzKTg8dOthcESGaZX
	YsEcuOVtoZ0KNhLZr2Dg5rayjL/kIfbgLzob6atqG4hsTQUDC9BnTBRmacxuFriU
	mLiHvGjq9pjX7n2SP7a6ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776940004; x=
	1777026404; bh=MivdOIkmxvQjBHx2aFyPQuZoyPRSFrsVHDXpJ+ckBGU=; b=P
	bMCF4wuCiT4jMUwYhEX2zK71n2txzv2ifcFMhigJcR552Qqs76qT0GqqHI5L57Ij
	EzgDz5hHsj+bac3/+AtmmiRd7Cgcz8l0+/BAA6HnsoHlqV0wc8/0PTYpnXrpCVuk
	huYixvY+6n8+OowHVAAYIes33HnCYePyxKSU+6z1mX3gyvTyjQxUBMwh50oglQFQ
	NIJV/UvUgXn3396JSJs15KK+9Sd0sgvZxr33fY25BcFgryBJK+IsoS2O1DahOeNa
	Rw6B8yw1+mwRvE/zAuAo+9Ijjpgmx1TNi7nTNQBtxBse6JGjGp8NdyCESwui4udK
	lk2ZRUZCxXOHJgKEVosFA==
X-ME-Sender: <xms:4_PpaT5PMIUYfn7mOkY1ayW8g2D_3V47jqVek4rncrGOoOZoGxZQtA>
    <xme:4_PpaTtFeskCP0-ATEskM-26uX-6MzZa3h9ApyfamW6uideXEFoZjl8B1wjSGEmka
    OboiOPiF7373HvC1EmHW3dZIzKb1FoC0Fwxm7mw0EagyH3Fjdm2pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhope
    gtlhgrsggsvgdrmhhonhhtjhhoihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgv
    rhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhvihguih
    hurdhprghnrghithdrohhsshesghhmrghilhdrtghomhdprhgtphhtthhopehhvghrsggv
    rhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtoheprghrnhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfigvnhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:4_PpacKrPTDbBfVgWw4h7Db_rVitnkes77zmZMdHp0-Xe-DzTvoz5w>
    <xmx:4_PpaYjtSsYvCOqvRIzroMTAxteUcChYAA7erAMKc_rao7-8ijTA-w>
    <xmx:4_PpaRLkauvjs1BhfTJptKQqVyZBB8_1wm1f4woP9y1piO7zK-_OXQ>
    <xmx:4_PpaXhcOKmuy8xwE4Twmt9YXXBSKDzx5rIRLPJgCr9rKsrMmyrW9A>
    <xmx:5PPpaV6E71ficY6P-Gdilt8vVm8y7wj56FENryeW1JuGLTETGS1H4Ins>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD3C3700065; Thu, 23 Apr 2026 06:26:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AavW3N6gTEK7
Date: Thu, 23 Apr 2026 12:26:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Corentin Labbe" <clabbe.montjoie@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Eric Biggers" <ebiggers@kernel.org>,
 "Ovidiu Panait" <ovidiu.panait.oss@gmail.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <3948e39f-dd20-44e2-b264-dc2a0a88f5b5@app.fastmail.com>
In-Reply-To: <aenmEQNhhw9bnxEa@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
 <aenfmxOvtHaAODqH@gondor.apana.org.au>
 <1cd6ddc3-479c-4cbf-8315-78bc53ac3a54@app.fastmail.com>
 <aenmEQNhhw9bnxEa@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_032647_547483_55480095 
X-CRM114-Status: GOOD (  25.09  )
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

On Thu, Apr 23, 2026, at 11:27, Herbert Xu wrote:
> On Thu, Apr 23, 2026 at 11:25:19AM +0200, Arnd Bergmann wrote:
>>
>> Yes, I can rework the patch that way. I had considered this originally
>> but decided this would end up less readable in this case because
>> of the extra indentation level. The drivers already has a lot of
>> #ifdef checks, so adding more of those felt more in line with the
>> style used here.
>
> If we're adding new code I prefer doing it inline instead of as
> an ifdef so that we maximise compiler coverage.

Sure, but I'm not adding new code here, I only reported a regression
from Eric's (otherwise very nice) cleanup and tried to come up
with a better workaround than adding another 'select'.

I've tried to rework one driver to use IS_ENABLED() checks now
instead of the #ifdef, and also replace the for()/switch()
loop with three separate loops for simplicity. See below for
what I ended up with compared with my first patch.

I'm still not entirely happy with that version either, especially
since this is getting beyond a purely mechanical cleanup.
If you think this is better, I can do it for all three drivers,
otherwise I'd just send the oneline change to work around the
third driver link failure the same way that Eric did for the
other two, and let the sunxi maintainters worry about cleaning
it up.

      Arnd

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 813c4bc6312a..330a1ed7eb03 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -31,7 +31,7 @@ static const struct ss_variant ss_a33_variant = {
 	.sha1_in_be = true,
 };
 
-static struct sun4i_ss_alg_template ss_algs[] = {
+static struct sun4i_ss_alg_template ss_ahash_algs[] = {
 {       .type = CRYPTO_ALG_TYPE_AHASH,
 	.mode = SS_OP_MD5,
 	.alg.hash = {
@@ -84,6 +84,9 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 		}
 	}
 },
+};
+
+static struct sun4i_ss_alg_template ss_skcipher_algs[] = {
 {       .type = CRYPTO_ALG_TYPE_SKCIPHER,
 	.alg.crypto = {
 		.setkey         = sun4i_ss_aes_setkey,
@@ -213,7 +216,9 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 		}
 	}
 },
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
+};
+
+static struct sun4i_ss_alg_template ss_rng_algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_RNG,
 	.alg.rng = {
@@ -229,40 +234,46 @@ static struct sun4i_ss_alg_template ss_algs[] = {
 		.seedsize               = SS_SEED_LEN / BITS_PER_BYTE,
 	}
 },
-#endif
 };
 
 static int sun4i_ss_debugfs_show(struct seq_file *seq, void *v)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ss_algs); i++) {
-		if (!ss_algs[i].ss)
+	for (i = 0; i < ARRAY_SIZE(ss_skcipher_algs); i++) {
+		if (!ss_skcipher_algs[i].ss)
 			continue;
-		switch (ss_algs[i].type) {
-		case CRYPTO_ALG_TYPE_SKCIPHER:
-			seq_printf(seq, "%s %s reqs=%lu opti=%lu fallback=%lu tsize=%lu\n",
-				   ss_algs[i].alg.crypto.base.cra_driver_name,
-				   ss_algs[i].alg.crypto.base.cra_name,
-				   ss_algs[i].stat_req, ss_algs[i].stat_opti, ss_algs[i].stat_fb,
-				   ss_algs[i].stat_bytes);
-			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
-				   ss_algs[i].alg.rng.base.cra_driver_name,
-				   ss_algs[i].alg.rng.base.cra_name,
-				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
-			break;
-#endif
-		case CRYPTO_ALG_TYPE_AHASH:
-			seq_printf(seq, "%s %s reqs=%lu\n",
-				   ss_algs[i].alg.hash.halg.base.cra_driver_name,
-				   ss_algs[i].alg.hash.halg.base.cra_name,
-				   ss_algs[i].stat_req);
-			break;
-		}
+		seq_printf(seq, "%s %s reqs=%lu opti=%lu fallback=%lu tsize=%lu\n",
+			   ss_skcipher_algs[i].alg.crypto.base.cra_driver_name,
+			   ss_skcipher_algs[i].alg.crypto.base.cra_name,
+			   ss_skcipher_algs[i].stat_req,
+			   ss_skcipher_algs[i].stat_opti,
+			   ss_skcipher_algs[i].stat_fb,
+			   ss_skcipher_algs[i].stat_bytes);
 	}
+
+	for (i = 0; i < ARRAY_SIZE(ss_ahash_algs); i++) {
+		if (!ss_ahash_algs[i].ss)
+			continue;
+
+		seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
+			   ss_ahash_algs[i].alg.rng.base.cra_driver_name,
+			   ss_ahash_algs[i].alg.rng.base.cra_name,
+			   ss_ahash_algs[i].stat_req,
+			   ss_ahash_algs[i].stat_bytes);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ss_rng_algs); i++) {
+		if (!IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG) ||
+		    !ss_rng_algs[i].ss)
+			continue;
+
+		seq_printf(seq, "%s %s reqs=%lu\n",
+			   ss_rng_algs[i].alg.hash.halg.base.cra_driver_name,
+			   ss_rng_algs[i].alg.hash.halg.base.cra_name,
+			   ss_rng_algs[i].stat_req);
+	}
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(sun4i_ss_debugfs);
@@ -454,34 +465,36 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(ss->dev);
 
-	for (i = 0; i < ARRAY_SIZE(ss_algs); i++) {
-		ss_algs[i].ss = ss;
-		switch (ss_algs[i].type) {
-		case CRYPTO_ALG_TYPE_SKCIPHER:
-			err = crypto_register_skcipher(&ss_algs[i].alg.crypto);
-			if (err) {
-				dev_err(ss->dev, "Fail to register %s\n",
-					ss_algs[i].alg.crypto.base.cra_name);
-				goto error_alg;
-			}
-			break;
-		case CRYPTO_ALG_TYPE_AHASH:
-			err = crypto_register_ahash(&ss_algs[i].alg.hash);
-			if (err) {
-				dev_err(ss->dev, "Fail to register %s\n",
-					ss_algs[i].alg.hash.halg.base.cra_name);
-				goto error_alg;
-			}
-			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			err = crypto_register_rng(&ss_algs[i].alg.rng);
-			if (err) {
-				dev_err(ss->dev, "Fail to register %s\n",
-					ss_algs[i].alg.rng.base.cra_name);
-			}
+	for (i = 0; i < ARRAY_SIZE(ss_skcipher_algs); i++) {
+		ss_skcipher_algs[i].ss = ss;
+		err = crypto_register_skcipher(&ss_skcipher_algs[i].alg.crypto);
+		if (err) {
+			dev_err(ss->dev, "Fail to register %s\n",
+				ss_skcipher_algs[i].alg.crypto.base.cra_name);
+			goto error_skcipher_alg;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ss_ahash_algs); i++) {
+		ss_ahash_algs[i].ss = ss;
+		err = crypto_register_ahash(&ss_ahash_algs[i].alg.hash);
+		if (err) {
+			dev_err(ss->dev, "Fail to register %s\n",
+				ss_ahash_algs[i].alg.hash.halg.base.cra_name);
+			goto error_ahash_alg;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ss_rng_algs); i++) {
+		if (!IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG))
 			break;
-#endif
+
+		ss_rng_algs[i].ss = ss;
+		err = crypto_register_rng(&ss_rng_algs[i].alg.rng);
+		if (err) {
+			dev_err(ss->dev, "Fail to register %s\n",
+				ss_rng_algs[i].alg.rng.base.cra_name);
+			goto error_rng_alg;
 		}
 	}
 
@@ -491,23 +504,20 @@ static int sun4i_ss_probe(struct platform_device *pdev)
 					      &sun4i_ss_debugfs_fops);
 
 	return 0;
-error_alg:
-	i--;
-	for (; i >= 0; i--) {
-		switch (ss_algs[i].type) {
-		case CRYPTO_ALG_TYPE_SKCIPHER:
-			crypto_unregister_skcipher(&ss_algs[i].alg.crypto);
-			break;
-		case CRYPTO_ALG_TYPE_AHASH:
-			crypto_unregister_ahash(&ss_algs[i].alg.hash);
-			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			crypto_unregister_rng(&ss_algs[i].alg.rng);
-			break;
-#endif
-		}
+
+error_rng_alg:
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG)) {
+		for (i--; i >= 0; i--)
+			crypto_unregister_rng(&ss_rng_algs[i].alg.rng);
 	}
+	i = ARRAY_SIZE(ss_ahash_algs);
+error_ahash_alg:
+	for (i--; i >= 0; i--)
+		crypto_unregister_ahash(&ss_ahash_algs[i].alg.hash);
+	i = ARRAY_SIZE(ss_skcipher_algs);
+error_skcipher_alg:
+	for (i--; i >= 0; i--)
+		crypto_unregister_skcipher(&ss_skcipher_algs[i].alg.crypto);
 error_pm:
 	sun4i_ss_pm_exit(ss);
 	return err;
@@ -518,21 +528,14 @@ static void sun4i_ss_remove(struct platform_device *pdev)
 	int i;
 	struct sun4i_ss_ctx *ss = platform_get_drvdata(pdev);
 
-	for (i = 0; i < ARRAY_SIZE(ss_algs); i++) {
-		switch (ss_algs[i].type) {
-		case CRYPTO_ALG_TYPE_SKCIPHER:
-			crypto_unregister_skcipher(&ss_algs[i].alg.crypto);
-			break;
-		case CRYPTO_ALG_TYPE_AHASH:
-			crypto_unregister_ahash(&ss_algs[i].alg.hash);
-			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			crypto_unregister_rng(&ss_algs[i].alg.rng);
-			break;
-#endif
-		}
+	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG)) {
+		for (i = ARRAY_SIZE(ss_rng_algs); i >= 0; i--)
+			crypto_unregister_rng(&ss_rng_algs[i].alg.rng);
 	}
+	for (i = ARRAY_SIZE(ss_ahash_algs); i >= 0; i--)
+		crypto_unregister_ahash(&ss_ahash_algs[i].alg.hash);
+	for (i = ARRAY_SIZE(ss_skcipher_algs) - 1; i >= 0; i--)
+		crypto_unregister_skcipher(&ss_skcipher_algs[i].alg.crypto);
 
 	sun4i_ss_pm_exit(ss);
 }


