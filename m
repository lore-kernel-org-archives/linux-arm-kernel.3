Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D1EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnQwo3Um018FPJIg9k+ov4Uh85owfHKUsr3QUGtoJN8=; b=hd14hnHlXTMlo38/fRY2wmGBVi
	lt/cpQALphjlHAGzAQh1qgiVUSCU5VMLzHojvFJ2G1Iv5B/aQjzjCQY8BdWGDd36DHZg4VWJedxi+
	DQSkB48W9FZ9FnvuyQDySmJuKw+ircCZX8pFadTxaE1Ei8kHtZIR51Q47UKSxoY+CY6i2uxSyDe04
	wYTBGh6Kb/l2xeOhfjO2AeVk/zQmdx6juz3gQidFqwsUEYqBxOF5Pl3mMK/Lw5wdD9Coh1FdD54tk
	oH+GV2pwacTacgPoSaomG+XiyHWaw0iDU3/000VjDywgItx+MNPhfeMFkPGXQZrVnBak32Ni/edlV
	c9iegngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIF-00000001aVh-1OKc;
	Thu, 12 Feb 2026 03:23:03 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNIB-00000001aTy-1Eht
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866579; x=1802402579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TnQwo3Um018FPJIg9k+ov4Uh85owfHKUsr3QUGtoJN8=;
  b=WgtXy9SF55kusQZifTiHe/G+ch9k278GfUvPd1Hud/LptzAL/pxke6q1
   Vg6VxHqYKoY4qi+HooY90h4kVS1FPZEHksZeF4qpHSBcjupqSg2OSnqJi
   7oGOYxOCt10OCvl2DnYgzqyWIWhKqZIQKCQa7oO0lXfZ4doK3qjVh3b5w
   JIq/T3YNR9bduGPlD1M2Zy+a/wJIu5hpfTVBiLlboJISMzkQX3nsXNd0S
   2qwzeztAVobn//3hyeU93njhEBN97/GhYUnnh2tXkxq+VGMYErmmG+SU4
   HlXZHyZxX+qt0RjwoYfw0TEUnws6+2/QcP8Ya5JEcd5n99wcQn6sC/uOx
   Q==;
X-CSE-ConnectionGUID: /sQR0vqHRKyHJJn1eWFpkg==
X-CSE-MsgGUID: iOrC9wgmQ1SzHeJbk+uedg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12722719"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:51 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:32165]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 08cd4dc4-bc1d-49a8-b475-0e28abbf9977; Thu, 12 Feb 2026 03:22:51 +0000 (UTC)
X-Farcaster-Flow-ID: 08cd4dc4-bc1d-49a8-b475-0e28abbf9977
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:50 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:50 +0000
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
Subject: [PATCH 06/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE_GCM crypto
Date: Thu, 12 Feb 2026 03:21:06 +0000
Message-ID: <20260212032117.9166-7-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWB002.ant.amazon.com (10.13.139.179) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192301_487336_D646F286 
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
CONFIG_CRYPTO_SM4_ARM64_CE_GCM-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile          | 2 +-
 arch/arm64/crypto/sm4-ce-gcm-glue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index f17d35591ab2..807994fa9a3f 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -20,7 +20,7 @@ sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
 sm4-ce-ccm-y := sm4-ce-ccm-glue.o sm4-ce-ccm-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
 sm4-ce-gcm-y := sm4-ce-gcm-glue.o sm4-ce-gcm-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
diff --git a/arch/arm64/crypto/sm4-ce-gcm-glue.c b/arch/arm64/crypto/sm4-ce-gcm-glue.c
index ef06f4f768a1..256a66905241 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-gcm-glue.c
@@ -253,8 +253,8 @@ static const struct cpu_feature __maybe_unused sm4_ce_gcm_cpu_feature[] = {
 };
 MODULE_DEVICE_TABLE(cpu, sm4_ce_gcm_cpu_feature);
 
-module_cpu_feature_match(SM4, sm4_ce_gcm_init);
-module_exit(sm4_ce_gcm_exit);
+crypto_module_cpu_feature_match(SM4, sm4_ce_gcm_init);
+crypto_module_exit(sm4_ce_gcm_exit);
 
 MODULE_DESCRIPTION("Synchronous SM4 in GCM mode using ARMv8 Crypto Extensions");
 MODULE_ALIAS_CRYPTO("gcm(sm4)");
-- 
2.47.3


