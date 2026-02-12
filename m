Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D6EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KR3r4K5PUNrnbKnoUvwryN0sYv5huYD3igOufpVaemA=; b=gihShByrQVb9YAeGjul0x2+MqI
	xVDIrQIy0mElIUITp7kIcxDRNjCRR/OMSMiiUxWQYgW3ZNPZp3WXe82I9ini+cSY6xRF1sEnPOyto
	iBKR96I/1080TLxLL9es67p0au1r3yeE8P4xNtNvx2NKnLGI1QQC60au1YXfqIxBwyVB036DSKzkW
	vP870scmHVgq56tngNJfkNV7f5SeBVkVCjY1fleZ+dp7MOv9i/Y4kgyx7oB4beh04FDxb+WUb5j+/
	Pj3kOs9wEgYGMX/IcDj3ZBwdzYjywxXc8/5WDWRt55ZT1f4ALwo5VpneSkEJmFfcofmjWqmRpyzup
	ARBBWi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMlL-00000001MhG-24aK;
	Thu, 12 Feb 2026 02:49:03 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMlJ-00000001Mfl-0pk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864541; x=1802400541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KR3r4K5PUNrnbKnoUvwryN0sYv5huYD3igOufpVaemA=;
  b=Ms4ah3Zo6NZQn198bSmG4Pthr5MLsqF2rNV2d7kXip7M4i/49T/+dUaT
   t04bX2+vBmUbin5PPdAop3thgdPml1sXWNXIGxztel0sILkTtMoXT8fhq
   HU03OQ0BCyQXc3ZrqIxloi4s3zG8nxT5x8KgzTJyUG/naxh+XoJe3rInW
   95LhjOFEWCv0fw6XxOOcafxlOCQ/Mah3gdsDiWCTAuPcTT5J97Kd57skV
   LaiIUDf3FarCME9pnkBI3rLqb+RtBHWcavi5dlUlpU2L8hZTsAdflbSSw
   IdWBVArYh6hLC0m3FU7gpb+tp8P4vDbByT32lqpZ+jUURTg3LtSckPKfh
   A==;
X-CSE-ConnectionGUID: HjuNlv4iTjexTbtdrnpFpw==
X-CSE-MsgGUID: donMMe4rQV+Msr4e1BQznA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696275"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:49:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21734]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 9aac2d17-43d4-4400-8417-2c7e4bdc923b; Thu, 12 Feb 2026 02:49:00 +0000 (UTC)
X-Farcaster-Flow-ID: 9aac2d17-43d4-4400-8417-2c7e4bdc923b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:59 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:59 +0000
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
Subject: [PATCH 006/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SEQIV crypto
Date: Thu, 12 Feb 2026 02:45:42 +0000
Message-ID: <20260212024725.11264-7-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA002.ant.amazon.com (10.13.139.39) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184901_288856_BE1BA3FA 
X-CRM114-Status: GOOD (  10.92  )
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
CONFIG_CRYPTO_SEQIV-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add seqiv.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/seqiv.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 546f80e014e1..4d6f1c927db4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -26,7 +26,7 @@ ifeq ($(CONFIG_BPF_SYSCALL),y)
 crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
 endif
 
-obj-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
+crypto-objs-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
 obj-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
 
 crypto_hash-y += ahash.o
diff --git a/crypto/seqiv.c b/crypto/seqiv.c
index 678bb4145d78..5db32c596c40 100644
--- a/crypto/seqiv.c
+++ b/crypto/seqiv.c
@@ -170,8 +170,8 @@ static void __exit seqiv_module_exit(void)
 	crypto_unregister_template(&seqiv_tmpl);
 }
 
-module_init(seqiv_module_init);
-module_exit(seqiv_module_exit);
+crypto_module_init(seqiv_module_init);
+crypto_module_exit(seqiv_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Sequence Number IV Generator");
-- 
2.47.3


