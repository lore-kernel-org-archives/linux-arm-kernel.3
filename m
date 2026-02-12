Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F38EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SigH3qhT1W02fti+ozYpcWAH5G7ujZMQz/JJay17EIY=; b=PEYIRo9eO+zpI8mahgul8JMjMa
	V1HbDvfNIFiq/IbD23PIlVomn8VGDSHqMt0YZmlq+OgB8xCKbRZUNmwYQatoiiyo/BODgePb80NMU
	R7Vp3knQ+o+Juifvw46i+EAaOj74z604L89r5NE32nA9RJXIhencu0LvQk2XV21TPrY1GBBSBqvzM
	R9FKXoer8vGwEGV17WTO4LuvBYDILDQN0ig/QlkK38H7ngG6sjP6dNKo1yZwhDMlLM7IIioFk3h4f
	ntTg4YHjjOQ0Nk5Y5ZXUTGpwaak4G4zYTtfJG6Q1A9zmcR8pi2NpAelJoiLe4+k7EhtcKwb2cehnz
	WcDprA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN47-00000001UWo-3AAC;
	Thu, 12 Feb 2026 03:08:27 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN45-00000001UVL-2tl1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865705; x=1802401705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SigH3qhT1W02fti+ozYpcWAH5G7ujZMQz/JJay17EIY=;
  b=tHvqE7zoIq31JJfDaL29A4WW6FVuHMWpbo1WbCY2k9Sd98JXLy7zvrCQ
   SFHXKpDT/KyL89zrE9l4rebvu2BXDTV/RgkMEESEu2z7vDJs0iPQZqngk
   WpVCcUp6urwm4iIHOJAzumdeTgtuEqPuAf4WutNFi4JSTYbaOPeFIlB8R
   3vnbTG5qWfr+X47J1FfOFRoJotSpDStJLMLKM8OZ/jP4fYcA1PsWuRq69
   QZLoWwHx6AjYC6Sgk07H0JTxm5IMMwkVRfepBdlVsd0bm6etL8OHjqwHR
   HWEEE8HLPRv6wQY+g0QSf4+Zc5xPw/+/fu18HRonqLLfPMnTSczyl5tpK
   g==;
X-CSE-ConnectionGUID: 2OidXK/+TVq3rTmdDfU9ag==
X-CSE-MsgGUID: v/sxFuY8Riu4Q9629OZE9w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803833"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:24 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:22822]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 25d80b04-d4d0-460b-89b9-632ebe728b0c; Thu, 12 Feb 2026 03:08:24 +0000 (UTC)
X-Farcaster-Flow-ID: 25d80b04-d4d0-460b-89b9-632ebe728b0c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:24 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:24 +0000
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
Subject: [PATCH 081/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_LZ4 and CONFIG_CRYPTO_LZ4HC crypto
Date: Thu, 12 Feb 2026 02:46:57 +0000
Message-ID: <20260212024725.11264-82-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190825_781842_1A740374 
X-CRM114-Status: GOOD (  10.58  )
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
CONFIG_CRYPTO_LZ4- and CONFIG_CRYPTO_LZ4HC-related crypto to convert
them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 4 ++--
 crypto/lz4.c    | 4 ++--
 crypto/lz4hc.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 61fdf39dc1ec..665299fd5a5a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -158,8 +158,8 @@ crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
-obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
-obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
 crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
diff --git a/crypto/lz4.c b/crypto/lz4.c
index 57b713516aef..e0aa6f465627 100644
--- a/crypto/lz4.c
+++ b/crypto/lz4.c
@@ -91,8 +91,8 @@ static void __exit lz4_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lz4_mod_init);
-module_exit(lz4_mod_fini);
+crypto_module_init(lz4_mod_init);
+crypto_module_exit(lz4_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZ4 Compression Algorithm");
diff --git a/crypto/lz4hc.c b/crypto/lz4hc.c
index bb84f8a68cb5..5365a0a8477d 100644
--- a/crypto/lz4hc.c
+++ b/crypto/lz4hc.c
@@ -89,8 +89,8 @@ static void __exit lz4hc_mod_fini(void)
 	crypto_unregister_scomp(&scomp);
 }
 
-module_init(lz4hc_mod_init);
-module_exit(lz4hc_mod_fini);
+crypto_module_init(lz4hc_mod_init);
+crypto_module_exit(lz4hc_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LZ4HC Compression Algorithm");
-- 
2.47.3


