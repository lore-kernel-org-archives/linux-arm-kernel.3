Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AB9EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUzJ8aK1Uq53ZYDUBh4IkKALfInFWeWEiHBeEV75MNs=; b=djjIXryb/lBVWIJNQdyAyXgOIf
	/oB2AlQeblWyjJZMs+Ad1i6IlhaiXo25+Ei8/iCE6H4UbCaewakIBDn/06T8zmDsD1J09EVngl1HE
	7ZZG/IeRDpYbMZY/0nUnxoHLSuRwHAXpkdhJVYFwBmAn8kQWwBE2IKGUpo70+x+fb0VS3T7BhI2yj
	aUnjB2sdf9PuOjFVOiHYJCb1hw5qJP8A01Awwx2Y//2EFXerMFawc9MwjnZ7l3rA843Orc/b6pYRZ
	h0TgBVeU2d0In9D7gce8fiOIDZQsPBRRr8+JWjsGV0yxy9MbH8IdNJaStdDhb7MGy6nyv70Q0EqFq
	5Qnm5vvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5R-00000001V3f-0n4l;
	Thu, 12 Feb 2026 03:09:49 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN5N-00000001V26-3WWB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865785; x=1802401785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tUzJ8aK1Uq53ZYDUBh4IkKALfInFWeWEiHBeEV75MNs=;
  b=JOYYT8U97YQ7dyZOZZVxzkBJyIZIeDqrRAe3x8ROzK7SRmaPLWTQjsR+
   PrqGLylbMPBJh/EBDcXP2nQ06ZvX67QnI3hL5dyfItRLccMZ2/Uh3GuPP
   lFizk8CL3LUI05U6A7Z/Jd4v8njMfMnqlQrJERntUksRCsU517lAOb5v6
   sSl0O2GRIHJRMJm+6Q1mFA58UWE6s1TUPNkXglzFHSkmzBXT+70ROK8Qk
   qB4sMEW8oGYl2aEL3hzI9GRWm9irQJsALJ5vbjHzAKOvf/uZ9347i99Dt
   D71rRDSVTh33NzukWiSt3gPNwz7t3dEXnLknt8Us+VsL9o4V6PaOGgREL
   w==;
X-CSE-ConnectionGUID: NP6Ha8QjQKmpY66UOBtDGA==
X-CSE-MsgGUID: mMaRphw+S3SBNcb6MoaMpw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722247"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:09:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:12565]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b8126939-da4a-48c1-a430-d0997f1c5823; Thu, 12 Feb 2026 03:09:45 +0000 (UTC)
X-Farcaster-Flow-ID: b8126939-da4a-48c1-a430-d0997f1c5823
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:42 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:09:41 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 086/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_USER_API_HASH crypto
Date: Thu, 12 Feb 2026 02:47:02 +0000
Message-ID: <20260212024725.11264-87-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWA003.ant.amazon.com (10.13.139.49) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190945_937523_F5BE5B85 
X-CRM114-Status: GOOD (  11.27  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_USER_API_HASH-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile     | 2 +-
 crypto/algif_hash.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 39b42843d321..13d0ee856885 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -173,7 +173,7 @@ crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testin
 crypto-objs-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
-obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
diff --git a/crypto/algif_hash.c b/crypto/algif_hash.c
index 4d3dfc60a16a..b5ec5cfb2ae8 100644
--- a/crypto/algif_hash.c
+++ b/crypto/algif_hash.c
@@ -464,7 +464,7 @@ static void __exit algif_hash_exit(void)
 	BUG_ON(err);
 }
 
-module_init(algif_hash_init);
-module_exit(algif_hash_exit);
+crypto_module_init(algif_hash_init);
+crypto_module_exit(algif_hash_exit);
 MODULE_DESCRIPTION("Userspace interface for hash algorithms");
 MODULE_LICENSE("GPL");
-- 
2.47.3


