Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFAEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdAdR4u8HO5EJ5Fvkfre3lB9l0OnXJsQBK972oTsO+4=; b=lBQSw3BL3dqITziThjiOfoQlAn
	KD9B85BsV/q6VNjlYSuKuWoQdDYL+jKyGli1Ld+rUktrNMkWMTvX+11rc7grCsC+j/yaFhBf+miSy
	Scgy3l1cn4cTHxcykjdG5r8LYtT8WwkBwF17wO2NB4SWBna6xRVKgR7tWb8uOuTtWdrLY02WIwfjf
	C3pqR3HJdYgYOCPLIaH48iJjL1wJ3f+pGeExRMmVMlxvrY9iqLGq1wluuMMbd9ighWHhNvMv2UEsh
	XYyH9fkn++78khplUqJkaGM5tDxbVZEhpgdletI6CM1RAWrIOfS3MAdH5pATx523eT1Icp6EKF2xD
	WXK2nEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIc-00000001aiq-0PbD;
	Thu, 12 Feb 2026 03:23:26 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIY-00000001agT-40yC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866602; x=1802402602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XdAdR4u8HO5EJ5Fvkfre3lB9l0OnXJsQBK972oTsO+4=;
  b=XtBPZkHnRrbVO9+mkXfeDea2f9mzy9VCaD5zAbibq7HOmtSzbbW0LmFu
   TsQgo1k5vYlUX7t7Q/vENiSTQcRSqYcq67G5qp3nsh71WZ9C30QW1ov1S
   xZUzOmswW6fnGzv6AMADWd7ICxWeFf/qaaFiHB0VJkJ8xRgq+n8DeHDGo
   gAImexNTG7Stm6cFHulJedqXiBEPBK5Q2kzlUs6wfvPooHh3eubEo5358
   e/eMtXfnp3Fq8azg9VupIK7RqM8b1MYpfIL3UTirdkyjPTdv2r4bGvwZG
   47eKSJ9lFuHx98U0ihykrKBGvZb0t9w4ACLeaToQM6rlM+mjNJAnPmaTD
   g==;
X-CSE-ConnectionGUID: lpjh7efoQ5e1SloOlKunNw==
X-CSE-MsgGUID: HpBhWRcFS/qnBY7KHf3s4A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920874"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:23:22 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:8263]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 5d00f0a5-390c-4633-b989-41705e860cda; Thu, 12 Feb 2026 03:23:22 +0000 (UTC)
X-Farcaster-Flow-ID: 5d00f0a5-390c-4633-b989-41705e860cda
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:21 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:23:21 +0000
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
Subject: [PATCH 08/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_GHASH_ARM64_CE crypto
Date: Thu, 12 Feb 2026 03:21:08 +0000
Message-ID: <20260212032117.9166-9-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWA001.ant.amazon.com (10.13.139.101) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192323_057460_9C1936E5 
X-CRM114-Status: GOOD (  11.06  )
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
CONFIG_CRYPTO_GHASH_ARM64_CE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile        | 2 +-
 arch/arm64/crypto/ghash-ce-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 48042cf5bb13..55692fc8771d 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -26,7 +26,7 @@ sm4-ce-gcm-y := sm4-ce-gcm-glue.o sm4-ce-gcm-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
 sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 
-obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
+crypto-objs-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
 ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index 63bb9e062251..ad17a1621df7 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -528,5 +528,5 @@ static const struct cpu_feature __maybe_unused ghash_cpu_feature[] = {
 };
 MODULE_DEVICE_TABLE(cpu, ghash_cpu_feature);
 
-module_init(ghash_ce_mod_init);
-module_exit(ghash_ce_mod_exit);
+crypto_module_init(ghash_ce_mod_init);
+crypto_module_exit(ghash_ce_mod_exit);
-- 
2.47.3


