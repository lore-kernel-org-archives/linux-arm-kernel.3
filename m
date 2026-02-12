Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF8EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yfrK9ai1v7aCuOqEPDeHtTlKFbC6nmp0dDE5Sduaak=; b=TofBqBDB5VotbZLDFoGptlSbG0
	OY6Fh9jOvn+w2U5MoxG+WluWueq4LM0tpNOMyLU0uVi8cuKH08rn856LMsmMqiTo0kem8KTSqbHRf
	BxBLys+tw+DAK/0if/q9fwvS0b9B+cpg94hod7rr7lIbKQ1Hg4U3ff5MpTETtFCE4x+e4OKPs+H6u
	VAjc1laV3iHE0q/EWF4egyeK3ieO6P2SMl9qNi7agRhvRVxuAVIn7YuFaOMCp33iM5OSsQL/s2nHU
	IQw/1oIBYbGztw7wVPQPKZ+HyFDUeJESKIO7gY6FoMC6KRnFwAAXCSRjZYaIU3o1imgeYkPkiJTf+
	5cb1ET7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMwu-00000001RUZ-2ArQ;
	Thu, 12 Feb 2026 03:01:00 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMwo-00000001RSg-3hD1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865254; x=1802401254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5yfrK9ai1v7aCuOqEPDeHtTlKFbC6nmp0dDE5Sduaak=;
  b=FAOdz/mksqWzukjvtWrtZDt7Ef0H3flaTUfvCNYqVOOb3z23FwRWhC0R
   1zUkY1X1GIfq3zr1mFNFbxvAh+FB6YsYxcTImHfLxcZAZzxE9syKFjl2E
   pUUZcN4vBvXFRhR6udBoUcE1vcfXWM2+P3x6GFVYdJpm02N2uHGyNJ6Xs
   8y8NE3oritq7gEYgUci648qZMPaMDGOmGlTzKVN+w5yi2hb4pBfVv0oCJ
   DaHLwBfwUgyWUjju/sxTKC22sjyA8vQFWATs/+0Bnw4QrndzzUuwc+MrX
   8H31gZ3l+g9fFuplqlwjae1Bjq28S8sAsD0rMzE+ADs7tS9iwwWqNUta8
   Q==;
X-CSE-ConnectionGUID: gWH/hDnUQ46EhpeTmQfOEg==
X-CSE-MsgGUID: LMNwMjduQsOL7tS6fVWuMA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12917995"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:00:54 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:9392]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 5d98b2c6-763a-4a64-b0fb-277743aa4f95; Thu, 12 Feb 2026 03:00:54 +0000 (UTC)
X-Farcaster-Flow-ID: 5d98b2c6-763a-4a64-b0fb-277743aa4f95
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:53 +0000
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
Subject: [PATCH 052/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_LRW crypto
Date: Thu, 12 Feb 2026 02:46:28 +0000
Message-ID: <20260212024725.11264-53-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190054_973377_08305F9E 
X-CRM114-Status: GOOD (  10.74  )
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
CONFIG_CRYPTO_LRW-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/lrw.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 9ee71f7c0af7..73c700538792 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -92,7 +92,7 @@ crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
-obj-$(CONFIG_CRYPTO_LRW) += lrw.o
+crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
 crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
diff --git a/crypto/lrw.c b/crypto/lrw.c
index dd403b800513..776f052fa56d 100644
--- a/crypto/lrw.c
+++ b/crypto/lrw.c
@@ -420,8 +420,8 @@ static void __exit lrw_module_exit(void)
 	crypto_unregister_template(&lrw_tmpl);
 }
 
-module_init(lrw_module_init);
-module_exit(lrw_module_exit);
+crypto_module_init(lrw_module_init);
+crypto_module_exit(lrw_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("LRW block cipher mode");
-- 
2.47.3


