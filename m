Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD37BEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXRc31HewtINDW/60Kk8Ctr2HOh9mqZlICBe5VcmIsI=; b=BO+ufpeLiuDG3x7zGpuZKySyNm
	TBRJzBlkK4h2k8SfCua7rzBPsqDTq0CQ64u+HhxaWmM6RROOWwo16EC0KFZKGrByi5xKjj/2qpNBT
	XZ9gz0bHR2i04HPWKM2GZnKjPYrkXAUpmnNXKWvNW+ax4AWt/t+KBZIyAKFwxD8TR6xNjQxtrAqXJ
	HeK4iAq0gp7BvnPF8Y+fc4DhPwej36GUeaH2t8cDIaQxX1NgkEru4Sw2kWk6dZoFw6EphHMQcAEjK
	gAVI8fV+H7Z5WjMDCMIV20wmN5qhuIVeg2HcorHt7/FZ1RPNVBugAINRZ+K7mt8cp32Gfaj/n1+d/
	3z3zXtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN2d-00000001Tsv-2TbV;
	Thu, 12 Feb 2026 03:06:55 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN2a-00000001TrE-0UAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865612; x=1802401612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OXRc31HewtINDW/60Kk8Ctr2HOh9mqZlICBe5VcmIsI=;
  b=nzMDZTfzQgIQBAxEbdst3dZmFteulPQ7iUNO/xO0wTPY/3ZugNeSmwz4
   3f5cvAaFevOB8I4Xks8RqUnrgzUS7/k+i0De99i9pkdx92gGFnRgYguUH
   eCoW/0qPU5pRgYGp5YNgjqu0IEkToimQnP09ytDUDJvdr2lgf1r7M90Jo
   sXAqb03hnYSFQcBNXVKbZTTZLBEWCeVxZiHyEjN2pzpM43+Yu9lniwlL+
   uexhFqZ1f7zP6v4D0TSqdwxWOmDEIcGCaORCCTpKYY5WP4V5w/YLLKgOh
   wKVmeXpltPRoeLWWI3S4opqaIRdMMP8++JW+iQR56BFvkx6zc3eQ98Q4g
   w==;
X-CSE-ConnectionGUID: fLfw8lEdT22wj34mlHZrCQ==
X-CSE-MsgGUID: tHr9xS47Rz29tVMiB1ZqRQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12925822"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:06:51 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:20371]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 21371ec5-7b2c-4c35-8d5b-c17f7dcfb95a; Thu, 12 Feb 2026 03:06:51 +0000 (UTC)
X-Farcaster-Flow-ID: 21371ec5-7b2c-4c35-8d5b-c17f7dcfb95a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:51 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:50 +0000
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
Subject: [PATCH 075/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SEED crypto
Date: Thu, 12 Feb 2026 02:46:51 +0000
Message-ID: <20260212024725.11264-76-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWC004.ant.amazon.com (10.13.139.206) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190652_206314_57DED21D 
X-CRM114-Status: GOOD (  10.65  )
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
CONFIG_CRYPTO_SEED-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/seed.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index fb863dcef44f..3e515caa72f5 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -145,7 +145,7 @@ crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
 crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
-obj-$(CONFIG_CRYPTO_SEED) += seed.o
+crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
diff --git a/crypto/seed.c b/crypto/seed.c
index 815391f213de..f98ea0d623bd 100644
--- a/crypto/seed.c
+++ b/crypto/seed.c
@@ -460,8 +460,8 @@ static void __exit seed_fini(void)
 	crypto_unregister_alg(&seed_alg);
 }
 
-module_init(seed_init);
-module_exit(seed_fini);
+crypto_module_init(seed_init);
+crypto_module_exit(seed_fini);
 
 MODULE_DESCRIPTION("SEED Cipher Algorithm");
 MODULE_LICENSE("GPL");
-- 
2.47.3


