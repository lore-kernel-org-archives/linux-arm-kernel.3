Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AA3EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3ax/X/49Dg9TEyLwGn/WYGlrl6qM+8hPv1iZHItGgA=; b=GzZRy05lK5jC6uqL2cWFrWIXwb
	m4kLZ41+qHwfXhY45mvQjoobKgjAaug09xz+cl+Pq2I5LzsRia6iuX7CvTPaThES/+9VvkYOKSYF3
	Ii0B96ClmUaVYnMamhcf7+NscwLSRiWrN9hina/36FswJX2iJSJycw4uADQXsnKev6ffZNCctukNl
	8aEKVxTWf1rCrNJUhjwv3Kd46n3yhMwbPpkGQxac3P+kXjWnP8sSMqNb1cWSG2WbDAkKzeVl9Lp5L
	AY+QOdjK1oR4ZjPwFgqmdbjkhTBMXbO7UhXKGgTk8r8omvaXd6w6u1MV/+016Y2a96ptq2WQLBfUE
	uau11G6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN9O-00000001WiL-3t5k;
	Thu, 12 Feb 2026 03:13:54 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN9L-00000001Wgn-3uHo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866031; x=1802402031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3ax/X/49Dg9TEyLwGn/WYGlrl6qM+8hPv1iZHItGgA=;
  b=ZNjccJUnaCQHcUb4FB0dcIz+VS0BaXWhjiEUonLZO89mTYQ/SwwVTSMa
   9+eM5+LvnB/Iaeq855FWs7wgW3YLB0UuqwXbn93eKF+9Gq1NkVGcPBRBu
   UCz+zNYqESj5FlBWAt9bskCTIzgYoqW8rWusAynqoVj98doHGhifDpjjB
   O3RMyopiNZ+Y2ERDnA4dScGQ240BL2zHaILSDAG8jES5jAi1BwdnHy9lQ
   QXoc4hk8oKKz+uvaog9NBUPxElsrDKRz8OvgFhve/EXh5/Z2PmouI66hT
   6dJRt8inn9GnjM6z5qewHqSZfnx5aTNdNBhQ8rCA5wPAHz8O6Rsfj0MS2
   w==;
X-CSE-ConnectionGUID: AdtzSqdyTBCPjk0FAYl5Ng==
X-CSE-MsgGUID: K+JcY/BRQ+C9nDZslzy32g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744780"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:13:51 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:1292]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 17a50927-7e06-4070-9fd7-8f04630daaeb; Thu, 12 Feb 2026 03:13:51 +0000 (UTC)
X-Farcaster-Flow-ID: 17a50927-7e06-4070-9fd7-8f04630daaeb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:50 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:50 +0000
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
Subject: [PATCH 102/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_PKCS8_PRIVATE_KEY_PARSER crypto
Date: Thu, 12 Feb 2026 02:47:18 +0000
Message-ID: <20260212024725.11264-103-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191352_017087_02558040 
X-CRM114-Status: GOOD (  10.97  )
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
CONFIG_PKCS8_PRIVATE_KEY_PARSER-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile       | 2 +-
 crypto/asymmetric_keys/pkcs8_parser.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index bffa2e199a5d..3fdd11ea399a 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -37,7 +37,7 @@ $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
 #
 # PKCS#8 private key handling
 #
-obj-$(CONFIG_PKCS8_PRIVATE_KEY_PARSER) += pkcs8_key_parser.o
+crypto-objs-$(CONFIG_PKCS8_PRIVATE_KEY_PARSER) += pkcs8_key_parser.o
 pkcs8_key_parser-y := \
 	pkcs8.asn1.o \
 	pkcs8_parser.o
diff --git a/crypto/asymmetric_keys/pkcs8_parser.c b/crypto/asymmetric_keys/pkcs8_parser.c
index 105dcce27f71..f26464639232 100644
--- a/crypto/asymmetric_keys/pkcs8_parser.c
+++ b/crypto/asymmetric_keys/pkcs8_parser.c
@@ -173,8 +173,8 @@ static void __exit pkcs8_key_exit(void)
 	unregister_asymmetric_key_parser(&pkcs8_key_parser);
 }
 
-module_init(pkcs8_key_init);
-module_exit(pkcs8_key_exit);
+crypto_module_init(pkcs8_key_init);
+crypto_module_exit(pkcs8_key_exit);
 
 MODULE_DESCRIPTION("PKCS#8 certificate parser");
 MODULE_LICENSE("GPL");
-- 
2.47.3


