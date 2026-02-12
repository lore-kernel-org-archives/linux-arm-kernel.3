Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7216EEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA7ZPzHLYm0rYE2qYW8Wbs+tdd3eQDOIxCzm+IyXKy8=; b=AUSICkJ9CuCwe6sKDKysI/Lg6q
	xJViOwXGxUi8OfamNUmSulUy9ct3ixMvcKZAVC/CivorZwSrfKyn3c+9pwqBqWcee4y/mfJRxZaRi
	HV1yQCIun+v/SWOukLvGZzQvjINan5SA2v0KyS3gxiiB3MzKRDnVZqKrksR+1iiQeAQTJHOrtF08A
	8yEY9HzuRBBt+vsi4JNHZEeGGB5zxC0EdI25U1DHIHaBl333MFg+b01fEsn6Peyrp6VTF5U7w1gVM
	qGt+D04R3Wes5vlQiagIt9bFvFlRArn1Yf+tbKawnSa2It2CgdoUceLOjviPb3jTdx19VtnsE7ZRB
	9aMj4fqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIq-00000001apu-1uWN;
	Thu, 12 Feb 2026 03:23:40 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIo-00000001ap5-1jhO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866618; x=1802402618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QA7ZPzHLYm0rYE2qYW8Wbs+tdd3eQDOIxCzm+IyXKy8=;
  b=UT5EZxSZH/hfNIS927fSd4xWmkb+V/2pubVB0x+MKtWZ95oNqJk7cQdR
   SxorjO+X6rsQxLUUkCECK/n4Mw2iJZEJYWytuXLTu/bDFw2lWFAAiNGcs
   OrI606uMLkEJ8BqKv55xBRIY1ffsDiB0tnuhpI1xLubLJ0J4m9+fiCJi5
   Q/aw5WuK6QYfrIMCdS7PmFcIvC2xqmzX/jgF19F8hmSMfWZa7QNww4s7O
   03LIQBYYjiTd4BAgYRjTOaKv0eyJdZuKUUV7TGCkP0w8gFRVrFIkhk++O
   XohiAJHeFDqLLYYe7Ltp6M1GVkSqyFW/cvnge23YgNBKu+YF0KNK6fxQq
   A==;
X-CSE-ConnectionGUID: 1f6ycyInS4iAw4HGi871kg==
X-CSE-MsgGUID: kl0xL8bQRMquw9OElJygng==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12728036"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:23:38 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:15880]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id ce8acba7-75a7-431b-8687-58cd2fd9b065; Thu, 12 Feb 2026 03:23:37 +0000 (UTC)
X-Farcaster-Flow-ID: ce8acba7-75a7-431b-8687-58cd2fd9b065
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:37 +0000
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
Subject: [PATCH 09/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AES_ARM64_CE_CCM crypto
Date: Thu, 12 Feb 2026 03:21:09 +0000
Message-ID: <20260212032117.9166-10-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192338_511536_AF3F197D 
X-CRM114-Status: GOOD (  10.83  )
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
CONFIG_CRYPTO_AES_ARM64_CE_CCM-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile          | 2 +-
 arch/arm64/crypto/aes-ce-ccm-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 55692fc8771d..710887575f2d 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -29,7 +29,7 @@ sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 crypto-objs-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
 ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index db371ac051fc..650b3374ab0d 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -324,8 +324,8 @@ static void __exit aes_mod_exit(void)
 	crypto_unregister_aead(&ccm_aes_alg);
 }
 
-module_init(aes_mod_init);
-module_exit(aes_mod_exit);
+crypto_module_init(aes_mod_init);
+crypto_module_exit(aes_mod_exit);
 
 MODULE_DESCRIPTION("Synchronous AES in CCM mode using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ardb@kernel.org>");
-- 
2.47.3


