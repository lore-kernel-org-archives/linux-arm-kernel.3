Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E39BEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p64SvMN5bUzwos8G1dSdVdIQ1VadFMYC728JQlnFmeU=; b=Z5Qeca4fjWIwQd+YD43o7diQ3F
	SNzOS4VjeZn6gOrIzGfVw9Me76CYS5B7sKytJZF+Ttn/q+s1aTGNzqcWKxIynSjrkAPMzMQ2LzME5
	7d7LEsamj+93r+MFrijiWLuh402e4xmRRo6N4GQtA+XFbXCSV9PkciLmMcy4R9LWVHaJqWYr0t2CB
	j+3t9mfnzD5EPqkt2f92FX8FxNZX0bF4QFS26k3o8/FrBDicWcg04ho75ZcT/Y2fw7h8394DgWvYu
	G5E2S55IDq+ITE6UHzcdC9F94nfi/pMU1+mIWG93tE28KHFuGyJjdI3kQCwbWotRgqofruwA5/EoE
	Z3mZjsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMq6-00000001Oe7-1Uo2;
	Thu, 12 Feb 2026 02:53:58 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMq3-00000001Od2-2vHb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864835; x=1802400835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p64SvMN5bUzwos8G1dSdVdIQ1VadFMYC728JQlnFmeU=;
  b=tY8Ic2iJamKF+LLUTyYo3DGrmutMuRlSWZCPpAc1nAXEv0vTD7aQT3rP
   nr5W24+AU1P7akJFzVJtHVrv6zHwfYXDpwsuC8lFzJ/yQQftQxUYvrDss
   mjJ+JWbrR8bG0r3ilPVHzj1TJoOqWPVSt79n3nFsIR8uD/GgXK0am29UW
   KdOQs8fHzEJ6EJ9cpTwiKRe3jt42x+Rlq02LVfsVqX0qqNNTDBpE1JKVO
   9d0heFm73xq/UyW64fzVOEiq6sADXHJZRI2CcvxB8GIcxc9qGD5FamVNZ
   rZJuFeaG8YoTdYTGrNPInW6KJjTl8yFlIN6ILyhQQljs3hnDAkMwR8zEI
   w==;
X-CSE-ConnectionGUID: fHF3OQVTTTawXjt+tBHSGA==
X-CSE-MsgGUID: R8otepABREaAgRXUiHVCog==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918799"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:53:55 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:3633]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 9baa1dba-aafe-41f4-a3d6-8dd0a6da67bf; Thu, 12 Feb 2026 02:53:55 +0000 (UTC)
X-Farcaster-Flow-ID: 9baa1dba-aafe-41f4-a3d6-8dd0a6da67bf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:54 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:53:54 +0000
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
Subject: [PATCH 025/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CCM crypto
Date: Thu, 12 Feb 2026 02:46:01 +0000
Message-ID: <20260212024725.11264-26-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185355_788592_A2E3E06A 
X-CRM114-Status: GOOD (  11.04  )
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
CONFIG_CRYPTO_CCM-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add ccm.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/ccm.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 11bb65cf0094..9dc0d5d55eaa 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -99,7 +99,7 @@ obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
 obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
 obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
 crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
-obj-$(CONFIG_CRYPTO_CCM) += ccm.o
+crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
 obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
 obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
 aegis128-y := aegis128-core.o
diff --git a/crypto/ccm.c b/crypto/ccm.c
index 2ae929ffdef8..e76946e05b5e 100644
--- a/crypto/ccm.c
+++ b/crypto/ccm.c
@@ -929,8 +929,8 @@ static void __exit crypto_ccm_module_exit(void)
 				    ARRAY_SIZE(crypto_ccm_tmpls));
 }
 
-module_init(crypto_ccm_module_init);
-module_exit(crypto_ccm_module_exit);
+crypto_module_init(crypto_ccm_module_init);
+crypto_module_exit(crypto_ccm_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Counter with CBC MAC");
-- 
2.47.3


