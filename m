Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D66FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMrSmFzqkih8XAOQRY3DcYOYFr0kswNosCsHfdq5uis=; b=AM9C20hwIIbImRy0OI/XupIdDL
	fh1xp2A/fZTQRlUzQrLmkZfC+vjRGYXWiF7y+fKy+43QleBqGixk4sDKeB+AiZyZnBotdzWCJB96j
	M7IapCDFryHOE16OqYdTynr2yzCX+/AgeF07WU++CiSWiknw9yeKO4p+NdmhFTT+0nNK66zdXVXRH
	myKhk07+As64ZpspjIjU4tslyVncDYxKYysTPti59AlAVQoHYzaKUECcIaRDIP57NS/n8ybogbFSV
	eeTxmNIgO2p/NMQAJw0l5WUwE3YqBWXm44kNzb22s48n3+HUDJxI3Vps2A4RZ8ByvyjxX9MXzn5GX
	Rd6mUfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMuL-00000001QRZ-43gM;
	Thu, 12 Feb 2026 02:58:21 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMuJ-00000001QQT-2rrM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865099; x=1802401099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMrSmFzqkih8XAOQRY3DcYOYFr0kswNosCsHfdq5uis=;
  b=OD6fAWIMkyLlNrMDtPkI9s0km5JjTMEtj+Pj3F/ltIqM4tNNWFTgaIQK
   wUTATTgVefISy99Yv0m0Lgy7PnLWnlF+3/A03V8CGYhVe7x5uwetDJVDg
   8Ny+iAXY+vg+1mBzNlhttDz54gv9/M5kRUx2TkINfsZsXpdjUwj6M6jOA
   WfJD9+nnuNPZYRaOVt+In+5OkAyjP3UaptoR6FzaqlZPVth7ieXkJGhBl
   392DB7+TtpqxRO94Rpm6HN75ZP/7vJI9uZKLDJRujjPEuwCSYG2x/FSui
   m2zVwBn4AmIoZ0V/x5gSHLu/D+1lrLVTBEkL+tCbeSYRxshb9wjwQ5ce7
   Q==;
X-CSE-ConnectionGUID: WwInPJvcQLO1/NapbcYCpQ==
X-CSE-MsgGUID: M2PUsBEqRkO6HAvadnFuuA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721749"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:58:19 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:21076]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id d44ca3cd-180a-4131-8664-17ac9bbd4088; Thu, 12 Feb 2026 02:58:18 +0000 (UTC)
X-Farcaster-Flow-ID: d44ca3cd-180a-4131-8664-17ac9bbd4088
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:18 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:58:18 +0000
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
Subject: [PATCH 042/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_NULL crypto
Date: Thu, 12 Feb 2026 02:46:18 +0000
Message-ID: <20260212024725.11264-43-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWC004.ant.amazon.com (10.13.139.205) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185819_786222_80EAE28B 
X-CRM114-Status: GOOD (  10.84  )
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
CONFIG_CRYPTO_NULL-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile      | 2 +-
 crypto/crypto_null.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c98e6a397159..6d1077d11538 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -75,7 +75,7 @@ crypto-objs-$(CONFIG_CRYPTO_USER) += crypto_user.o
 crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
 crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
 crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
-obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
+crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 obj-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
diff --git a/crypto/crypto_null.c b/crypto/crypto_null.c
index 34588f39fdfc..e2245e691585 100644
--- a/crypto/crypto_null.c
+++ b/crypto/crypto_null.c
@@ -148,8 +148,8 @@ static void __exit crypto_null_mod_fini(void)
 	crypto_unregister_skcipher(&skcipher_null);
 }
 
-module_init(crypto_null_mod_init);
-module_exit(crypto_null_mod_fini);
+crypto_module_init(crypto_null_mod_init);
+crypto_module_exit(crypto_null_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Null Cryptographic Algorithms");
-- 
2.47.3


