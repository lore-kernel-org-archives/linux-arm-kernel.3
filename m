Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B04EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW1K1m1noTEFnR6AigfvRmRESeJHEYVi1ganWY7Eff0=; b=gcVUZUvwZXwi7zQq8rlNyZ2B4W
	90AV7s9dhEz+0Q3P5C6mUmRprbPRh9LH+WvJUjJfdpz/UJZ+hII+ervtSwr/pU+c0dsIS0JmvjIDR
	QVatqMRrg60uHA0aKY8XdX/Upap8R8xMW3mHngW93Sf5T1Sl2P+AdcWhzFlU3zAOYegjoPMEtR9ba
	Isd7HmGCK0yQSK1KYoBiLI9P8DTbLG8IJAGRJdCtgFjDE/jPeur7SJ2nUtAMwx8XkTEmyQri4C+zZ
	b5WYCczQXZXMOS80d5FOFE0DPFsdjvS5O8BMNRxClPiYNbTbK4wfh5t5/ZLsEATvVmGmA1LZa+bV5
	oURDZHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpb-00000001OSF-2rYD;
	Thu, 12 Feb 2026 02:53:27 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMpZ-00000001OQg-0bTM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864805; x=1802400805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YW1K1m1noTEFnR6AigfvRmRESeJHEYVi1ganWY7Eff0=;
  b=WTquTlYawzoyGxv75LmK/0kn5XqsDCnL2Rbn8cPOP8PicbJ60uv7rhoS
   /MCbf4GymQGUyjHw/kKVpqNNUOAuLdC9o/u80H8L4HhPj8gqaUvu/vDLp
   kbWJKiYVzPQreaSmV4HlVIH3eFqkp7igQdBIWSpN+STbsinZFW3frOFX+
   qeNiOLbVU+mG/GvFP1Ypm50PiUWcFARjrpp6UjfdBNVbFXvThC9poEAe7
   4kkTJc/yZUD/rurH5mKuElGr5QYgkGIFjodEJJu067OCIGHvZ236Okvs9
   g0ec2W/GO/UuKbGylVgBBgh6wqMgy0v7BYgJ3VhEpUu/t3z5S/kPAV6JA
   A==;
X-CSE-ConnectionGUID: 3jHzTPGeSg6F/+oxPKuHDg==
X-CSE-MsgGUID: E/Yd3v5NTrCqfxU7gDd91Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698219"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:53:24 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:24592]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 0e0e4bcd-0240-4239-bf18-441f07d70fc5; Thu, 12 Feb 2026 02:53:24 +0000 (UTC)
X-Farcaster-Flow-ID: 0e0e4bcd-0240-4239-bf18-441f07d70fc5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:23 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:23 +0000
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
Subject: [PATCH 023/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CTR crypto
Date: Thu, 12 Feb 2026 02:45:59 +0000
Message-ID: <20260212024725.11264-24-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185325_233838_8158B0A0 
X-CRM114-Status: GOOD (  10.94  )
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

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CTR-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add ctr.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/ctr.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 354ce7a46a0a..d5b5ca797dc6 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -94,7 +94,7 @@ obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
 obj-$(CONFIG_CRYPTO_CTS) += cts.o
 obj-$(CONFIG_CRYPTO_LRW) += lrw.o
 obj-$(CONFIG_CRYPTO_XTS) += xts.o
-obj-$(CONFIG_CRYPTO_CTR) += ctr.o
+crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
 obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
diff --git a/crypto/ctr.c b/crypto/ctr.c
index a388f0ceb3a0..fa67cf6de4b1 100644
--- a/crypto/ctr.c
+++ b/crypto/ctr.c
@@ -350,8 +350,8 @@ static void __exit crypto_ctr_module_exit(void)
 				    ARRAY_SIZE(crypto_ctr_tmpls));
 }
 
-module_init(crypto_ctr_module_init);
-module_exit(crypto_ctr_module_exit);
+crypto_module_init(crypto_ctr_module_init);
+crypto_module_exit(crypto_ctr_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("CTR block cipher mode of operation");
-- 
2.47.3


