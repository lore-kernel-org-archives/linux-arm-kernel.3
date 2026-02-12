Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EE0EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZP1fOo5T1MmkTb/Gf0mWMuVdFlCxywnYIxRUCBfLYY=; b=w0kgtDln8UDhlaPUnOFM55ramU
	i+XulqCAw7akas5E7gs5uApBOVTWCO8lvzS9/2QiGMt+A3MzWOtBXwAL8GQi88b6UGSzNhGLl37wn
	62ZKl0MDaFzPm+r43ROaUKE4fKQdgKT7L+HYp/+ZbA1GvanJFuVsMkJZFTBhhMGaop6ZU3KSr6SOQ
	ySOiLKEquOumylduwKzpoCWISL9+WD3Vzv2M8UULRlsH/EcvXLrwamGx4AfPoO8GV+89E1i9ow/Ar
	I7XDeeSisgNhCgL6KI3FSgLrncuomC/UJZmoAU9BVmm4ELpafh4HkfRFmuhf6pUkO04aXhHXmvg51
	b0pqzCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMw8-00000001RCZ-3ZHN;
	Thu, 12 Feb 2026 03:00:12 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMw5-00000001RAz-45ZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865209; x=1802401209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ZP1fOo5T1MmkTb/Gf0mWMuVdFlCxywnYIxRUCBfLYY=;
  b=hWnnYTJLS6h8hZvpTarl2h5O8EpuRoyX51shTJhFECqGXTI8QWrwFYTd
   hwS2k7bkdkZ4QYDpXtK2OLi+qh3RRXmAuhO3WH3QUE7CVG6SbSpfxU+I5
   2SFkqGQ8Pb+A+DcaVweWu0GMTRCfKgVmmFXhJUpV1f8MPzToDYNwyB94U
   jsEekvWyqC3iHu3Et2yuBrzJbU6F//UbNxgGekv9o1yw1H0rw2BFCV+/y
   X7gzGlwZH463CATIVdaeJ0lLTDp3DLFhEYzHbaKREeHpaCZIi06//YBbX
   IWS595R3xXjSZPpc9//tTXiBuXZ8c40TNeKnTDUDN6vZ716cDmQNWMCI3
   g==;
X-CSE-ConnectionGUID: DId0OMUWQie8O0c/2w42XQ==
X-CSE-MsgGUID: 8q5ylipxSou9Eg/YhSymWQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918292"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:00:09 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:3428]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 2a9ffcba-9336-4f57-a794-7c299457ab0f; Thu, 12 Feb 2026 03:00:09 +0000 (UTC)
X-Farcaster-Flow-ID: 2a9ffcba-9336-4f57-a794-7c299457ab0f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:07 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:00:07 +0000
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
Subject: [PATCH 049/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_BLAKE2B crypto
Date: Thu, 12 Feb 2026 02:46:25 +0000
Message-ID: <20260212024725.11264-50-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190010_072594_CBF5626A 
X-CRM114-Status: GOOD (  11.45  )
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
CONFIG_CRYPTO_BLAKE2B-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile  | 2 +-
 crypto/blake2b.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 0a0190292dd0..dfcfcd0601dd 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -87,7 +87,7 @@ crypto-objs-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 crypto-objs-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 crypto-objs-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
-obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
+crypto-objs-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
 crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
 crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
 obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
diff --git a/crypto/blake2b.c b/crypto/blake2b.c
index 67a6dae43a54..74a2706aa7be 100644
--- a/crypto/blake2b.c
+++ b/crypto/blake2b.c
@@ -90,13 +90,13 @@ static int __init crypto_blake2b_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_blake2b_mod_init);
+crypto_module_init(crypto_blake2b_mod_init);
 
 static void __exit crypto_blake2b_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_blake2b_mod_exit);
+crypto_module_exit(crypto_blake2b_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for BLAKE2b");
-- 
2.47.3


