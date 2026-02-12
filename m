Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73B9EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvXGTOpDYZMhm8nWs0+pZhDTllw8aVVm9oItzH2rbeE=; b=vwacC4ZhzTNDJOYUavN8uI6pTQ
	Fv9ytlCcV/e39KM3Hc3Ue9TnQFSOaHBzYAwHsVLs+s6vqne5lfTTu2OvK/QPy3blazALjZ/cXvfCf
	yh56O/rUWmCb/CftUiDztWKGFHV3Rbkqa2fKvEdidr9uXI+ed6TCzAGqTg+u7ELT00UkZjvCYJwHS
	D4iB7CGd7JblTMO3IVyqY7rJawVGqzh0/ALwz3T0wq5v8zydZoRbHxQjUkkLBOiYy2b2UibGQgIVW
	e2pBkkEbYZDsRp5MUX2L9NmKvR1LNDwBHVkB06L0DaowEPu4FWyY8eNDu4smPO+3hJSN5MoUDH/vc
	BmZ9V+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN1v-00000001Ta1-1amq;
	Thu, 12 Feb 2026 03:06:11 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN1p-00000001TXO-2GrY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865565; x=1802401565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PvXGTOpDYZMhm8nWs0+pZhDTllw8aVVm9oItzH2rbeE=;
  b=YqVAG+DBIlYU58KLebRpr5E16r/a5tEbXejCncYbjMzlqnHUVGDTQ8sp
   sYcCBP9w4ZdXwHmcnNjXMi1T44SFjA99n9e/v7D3zL2Tq2d87kwC4aMGV
   E/Ak0UFRJbQeg1Wt1jznVVWcwhGCWJPFRVjJ2KCQwdyOqzHPf70IFOpMf
   uotC5T4S4JeXM25d1uWQAgvqeLipdBqtcQ6TrvoUZ41AKwOqZULtrObws
   9KD9TjFU8+SWIVPwW6q8sFBMXwI1AYPzBzJgYWUnBblt+UJK+RX5pYf01
   gJdmpL3VqamweqOrn2Z7utZRMcX3yzKf6XlmbSOieaBN8fCuXilefpUCj
   A==;
X-CSE-ConnectionGUID: DLVdO/vBQZyRJwr/cemZ4Q==
X-CSE-MsgGUID: 2PyzPwMXT7WLHR6SkQJJEg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913917"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:06:05 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:22596]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 4d1f3c1f-c8a0-4086-82ad-e19036193cd0; Thu, 12 Feb 2026 03:06:04 +0000 (UTC)
X-Farcaster-Flow-ID: 4d1f3c1f-c8a0-4086-82ad-e19036193cd0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:04 +0000
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
Subject: [PATCH 072/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TEA crypto
Date: Thu, 12 Feb 2026 02:46:48 +0000
Message-ID: <20260212024725.11264-73-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190608_666334_3013DC07 
X-CRM114-Status: GOOD (  10.29  )
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
CONFIG_CRYPTO_TEA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/tea.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index a7ad0f5dd1d9..1854a70babc0 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -142,7 +142,7 @@ crypto-objs-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
 crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
-obj-$(CONFIG_CRYPTO_TEA) += tea.o
+crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
diff --git a/crypto/tea.c b/crypto/tea.c
index cb05140e3470..9f42e296377f 100644
--- a/crypto/tea.c
+++ b/crypto/tea.c
@@ -255,8 +255,8 @@ MODULE_ALIAS_CRYPTO("tea");
 MODULE_ALIAS_CRYPTO("xtea");
 MODULE_ALIAS_CRYPTO("xeta");
 
-module_init(tea_mod_init);
-module_exit(tea_mod_fini);
+crypto_module_init(tea_mod_init);
+crypto_module_exit(tea_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TEA, XTEA & XETA Cryptographic Algorithms");
-- 
2.47.3


