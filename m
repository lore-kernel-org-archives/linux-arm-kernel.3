Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPMMkJbFYL7Nl+ga6Yh2yJ94I1TgNPhxJyXbOvwvw8Y=; b=vubsPYiArO3zv4WccbKf9YMX+O
	ufi4T5Ijo2Zph2yrvdAyBFjFdnStySiBCRWydtgX85O/CjXClp6sW9vtb8eMGpnJMOTLLNoLRtO9r
	YHOyIdTDCRwtrdYCBjGwBpNmPUTZMdqKhYS6P63pnmBs+eVwIvorpWl6AJtsYynj/CGQuMSGXFsFX
	l/k+xGP/5wTyi1rJUXMCEJOf/qqVFtWzBWwpEkqwKBMgeH8MLhPai1uQL/N5NiQdRuSfrK5Fc5HpM
	RLLc2X0e/ApIGGYfyXnhiuiNmsigjjlQASFQ3CSOyznZjxOZy1VeQONwN0esJ5Mw6tpp6mfCBa+vP
	l9P/pUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN99-00000001Wao-3SHc;
	Thu, 12 Feb 2026 03:13:39 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN96-00000001WZ3-1N6W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866016; x=1802402016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZPMMkJbFYL7Nl+ga6Yh2yJ94I1TgNPhxJyXbOvwvw8Y=;
  b=T1RWqRI1zMpAcGkGM8i9ECtLKa+V/bumoir0AWM9Fy0ft4WBr0TQS1FW
   ZifOYf7D/5DcLXsmnAlg5OQRjnZbSh3/HKjJ84izxILpVFNDHf8c3HEpJ
   TD29xkZj0mytpfJXog78BsbYlxwNbrKn9VQ/EidHSF2IcuhhObI15a0qC
   t4GWjwGPuXeTjX7B5Y2HlhwFKzYxbIdwlFVBRQPjiAWSQmdctmZhmfz0M
   wU+Z6PoXFIQMOjOFGPUz9WVrsLkVNpVeRIQidUJ2a+FaerGFrxU8YMjpM
   cOGF7I/Q4XPxJS1RbMgRzRb0gM4sqZZfbh8lVhrjSNuqQxCA4eq+Qnd93
   Q==;
X-CSE-ConnectionGUID: TSRoevCjSLG0qk8FLc2zYA==
X-CSE-MsgGUID: ci0X8US2R/KddNhK7NQt7A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914234"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:13:35 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:27604]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 58b0f14f-05da-4c36-915c-fdd01a4d24b4; Thu, 12 Feb 2026 03:13:35 +0000 (UTC)
X-Farcaster-Flow-ID: 58b0f14f-05da-4c36-915c-fdd01a4d24b4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:34 +0000
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
Subject: [PATCH 101/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_FIPS_SIGNATURE_SELFTEST crypto
Date: Thu, 12 Feb 2026 02:47:17 +0000
Message-ID: <20260212024725.11264-102-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWB003.ant.amazon.com (10.13.139.165) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191336_415520_A0E3CA9E 
X-CRM114-Status: GOOD (  11.58  )
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
CONFIG_FIPS_SIGNATURE_SELFTEST-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile   | 2 +-
 crypto/asymmetric_keys/selftest.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index c68fdcd2c5cf..bffa2e199a5d 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -22,7 +22,7 @@ x509_key_parser-y := \
 	x509_cert_parser.o \
 	x509_loader.o \
 	x509_public_key.o
-obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
+crypto-objs-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
 x509_selftest-y += selftest.o
 x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_RSA) += selftest_rsa.o
 x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA) += selftest_ecdsa.o
diff --git a/crypto/asymmetric_keys/selftest.c b/crypto/asymmetric_keys/selftest.c
index 98dc5cdfdebe..4f3b6ef85d1b 100644
--- a/crypto/asymmetric_keys/selftest.c
+++ b/crypto/asymmetric_keys/selftest.c
@@ -65,7 +65,7 @@ static int __init fips_signature_selftest_init(void)
 	return 0;
 }
 
-late_initcall(fips_signature_selftest_init);
+crypto_late_initcall(fips_signature_selftest_init);
 
 MODULE_DESCRIPTION("X.509 self tests");
 MODULE_AUTHOR("Red Hat, Inc.");
-- 
2.47.3


