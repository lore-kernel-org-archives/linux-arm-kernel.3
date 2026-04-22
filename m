Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B610F9EDC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p44cSbI9ojfU2tdH6qP4ry3HyO5ReEpQUeVPNbJdJzY=; b=46YPgo7a2LH5QNUyCduIeTI16j
	z7esf9qP0x/HtJ0E0osbMxDRjpRNHsGrKwBQdAuuGmV4sdsJey/uJTNWIVITIxuMnKwx42VQE4GmI
	GjSEutpf7j9SI5omGJ67FKlxtGoNC+1Q6JjVtPNPr3PZFpPmLJ5rHFrmBEsS5uWm60yB62xVonl8Z
	vGxs0pRvHPAoElKiM4Qj+rK1QtkhO5ng9eQsJtqUuU9mpSB0OpJ8PDRvW1Qld+/PJWymIEpF8QX4q
	ooP4OsMYGn3b9GKO7ezI9fhpvT0CSxfx6JSxAn0dBpCLwy0CiQouFmXEx9ZgLkwV+zoYU5zfJJTY+
	M3aZcSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX1O-0000000AF7d-1pS5;
	Wed, 22 Apr 2026 12:49:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX1M-0000000AF7J-19q0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 12:49:37 +0000
Received: from [127.0.1.1] (unknown [52.179.129.152])
	by linux.microsoft.com (Postfix) with ESMTPSA id DF16820B6F01;
	Wed, 22 Apr 2026 05:49:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DF16820B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776862175;
	bh=p44cSbI9ojfU2tdH6qP4ry3HyO5ReEpQUeVPNbJdJzY=;
	h=From:Date:Subject:To:Cc:From;
	b=O3RM0N6EpJIHq08SQ89lMIFxMPMjNDBI+f5c6Upxdy5vjkd0JUY8+gHshTG9sw3GV
	 nTCQROVqANQjZjmOjXZCGycVTFWArh78AM+/b39x8fhF8Ig8wv3QmT2WiLZLsbnaos
	 Iuhfiairepl9YVg5XV7Zn3ojwiaWblA/XIhezySA=
From: jeffbarnes@linux.microsoft.com
Date: Wed, 22 Apr 2026 08:49:30 -0400
Subject: [PATCH] crypto: testmgr - disallow RSA PKCS#1 SHA-1 sig algs in
 FIPS mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-disallow_rsa_sha1_signing_in_fips_mode-v1-1-1359bc7d41be@microsoft.com>
X-B4-Tracking: v=1; b=H4sIANnD6GkC/x3N0QrCMAxA0V8ZebawhTnUXxEJmU27wExHAyqM/
 bvFx/Ny7w4uVcXh1u1Q5a2uxRqGUwfPhS1L0NgM2OPUj4ghqvO6lg9VZ/KFB3LNppZJjZJuTq8
 SJVzSPE+IV47nEVpsq5L0+x/dH8fxA5f263x4AAAA
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Barnes <jeffbarnes@microsoft.com>, 
 Jeff Barnes <jeffbarnes@linux.microsoft.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_054936_341826_B3523429 
X-CRM114-Status: GOOD (  13.13  )
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

From: Jeff Barnes <jeffbarnes@microsoft.com>

When booted with fips=1, RSA signature generation using SHA-1 must not be
available.  However, pkcs1pad(rsa,sha1) can currently be instantiated
because it is not present in alg_test_descs; alg_test() falls through the
no_test path and succeeds, after which the algorithm appears in /proc/crypto
as fips-capable. 【1-ebd9df】

Add explicit alg_test_descs entries for pkcs1pad(rsa,sha1) and pkcs1(rsa,sha1)
without marking them fips_allowed, so they are treated as not FIPS-allowed
when fips=1 is enabled.

Include both names to cover kernels where RSA sign/verify is provided via
the pkcs1(...) signature template, while pkcs1pad(...) remains for the
traditional wrapper naming and/or RSAES operations. 【2-17cc14】

Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
---
This series fixes an issue where SHA-1 RSA signature generation remains
available when booted with fips=1.

On a FIPS-enabled system, pkcs1pad(rsa,sha1) can be instantiated even
though SHA-1 must not be available for signature generation. The reason
is that the algorithm is not listed in crypto/testmgr.c's alg_test_descs,
so alg_test() falls through the no_test path and succeeds. Once
instantiated, /proc/crypto reports the algorithm as "fips: yes".

This patch adds explicit alg_test_descs entries for:

  - pkcs1pad(rsa,sha1)
  - pkcs1(rsa,sha1)

without setting fips=1, so they are treated as not FIPS-allowed in
FIPS mode.

Both names are covered to handle kernels where RSA signature operations
are provided via the pkcs1(...) signature template, while pkcs1pad(...)
remains for the historical wrapper naming and/or RSAES operations.

Reproducer / evidence (current behavior):
  1) Boot with fips=1 (confirm /proc/sys/crypto/fips_enabled == 1)
  2) Allocate the transform:
       crypto_alloc_akcipher("pkcs1pad(rsa,sha1)", 0, 0)
  3) Observe that /proc/crypto now contains:
       name   : pkcs1pad(rsa,sha1)
       fips   : yes
       selftest: passed
  4) A simple in-kernel demo module can instantiate the transform and reach
     the signing path in FIPS mode.

With this change, attempts to instantiate these SHA-1 RSA signing
templates in FIPS mode are rejected, preventing SHA-1 signature
generation in approved mode.

Thanks for taking a look.

Signed-off-by: Jeff Barnes <jeffbarnes@microsoft.com>
---
 crypto/testmgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 30671e7bc349..e54d298a26c1 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5306,6 +5306,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.sig = __VECS(pkcs1_rsa_none_tv_template)
 		}
+	}, {
+		.alg = "pkcs1(rsa,sha1)",
+		.test = alg_test_null,
 	}, {
 		.alg = "pkcs1(rsa,sha224)",
 		.test = alg_test_null,
@@ -5341,6 +5344,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "pkcs1pad(rsa)",
 		.test = alg_test_null,
 		.fips_allowed = 1,
+	}, {
+		.alg = "pkcs1pad(rsa,sha1)",
+		.test = alg_test_null,
 	}, {
 		.alg = "rfc3686(ctr(aes))",
 		.generic_driver = "rfc3686(ctr(aes-lib))",

---
base-commit: 8879a3c110cb8ca5a69c937643f226697aa551d9
change-id: 20260422-disallow_rsa_sha1_signing_in_fips_mode-8fbb6229ad54

Best regards,
-- 
Jeff Barnes <jeffbarnes@microsoft.com>


