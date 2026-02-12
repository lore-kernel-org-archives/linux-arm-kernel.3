Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03616EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ3l2M/fzjx1FqdTJssKdzndERlDZ427WzLpN7WpKfQ=; b=Eq8+KapGQt/cib8Jzp2YrbBMfj
	moNfox4oFHUCFJn9b7jEvflKGQXIq7enQxC7VuyN4S6hpijSCQ14Dau57zD437tjeXUXlKudE4ZgQ
	7oLUeJKxLxuCK/SXJKUvLuBUpZsBegiJdRwPZvf+cudPTWCl12cZYPvC6I7kx0tjYauVx9h5Q4HGb
	X/aJGceCfSdUbY46PwZT66QHjksbRKUut8VHU9HW0TT2nvtCwjzVy7vvZobyLERVaCknH9vgW62Cb
	pb7emDguenyrqbVxuwWtOwHlYv6t4Mx5OQjwXkfTP87JsU7SQbI+Z0dnOxalAMLOcgRKhx9OUUnHp
	zTs94qcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN28-00000001Tfa-3EyI;
	Thu, 12 Feb 2026 03:06:24 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN25-00000001TdL-14R6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865581; x=1802401581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TJ3l2M/fzjx1FqdTJssKdzndERlDZ427WzLpN7WpKfQ=;
  b=kav2orn2wEW6fQ58lJaVf0mrgsrSoKwxGZitU0LsH8bbnwcMWVsfUTfx
   IefTBoYUFwV84q5Qs3vTI85kq3NWqatzUfBWaUXFfimgb8CPTs6x0KdjQ
   3X5jxymw5cRMdMKLgv3373zOvC3v2KeFj32/VyPtOIMk4ADbjjLaj7TTA
   tuPEoSe0f88NBynHyYpeSdzN+ssj6GlIQR0d72SBIAOKtNtHh7vXUJEfy
   TnY6kX0W9csdWN09EbtN2JhMi8RkqLg45wT7EcCglFqo/aOudvyb6HPGf
   UPhIpxciij/l0HdltT5fUZFWeup52tHYwrXhrGVR+rb7lR2EGJ5rpQXka
   Q==;
X-CSE-ConnectionGUID: sQZzK9AYTwKU6apmLguoxg==
X-CSE-MsgGUID: 6HiXqQWASHeMpXyvBdQs6w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727405"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:06:20 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:20041]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 8bd414ab-a63f-483a-a1e1-6baba4a06927; Thu, 12 Feb 2026 03:06:20 +0000 (UTC)
X-Farcaster-Flow-ID: 8bd414ab-a63f-483a-a1e1-6baba4a06927
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:20 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:06:19 +0000
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
Subject: [PATCH 073/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KHAZAD crypto
Date: Thu, 12 Feb 2026 02:46:49 +0000
Message-ID: <20260212024725.11264-74-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA002.ant.amazon.com (10.13.139.39) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190622_297244_31A1439C 
X-CRM114-Status: GOOD (  10.74  )
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
CONFIG_CRYPTO_KHAZAD-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/khazad.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 1854a70babc0..87f1b0e315f2 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -143,7 +143,7 @@ crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
 crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
-obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
+crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
diff --git a/crypto/khazad.c b/crypto/khazad.c
index dee54ad5f0e4..d54214a9bc3f 100644
--- a/crypto/khazad.c
+++ b/crypto/khazad.c
@@ -868,8 +868,8 @@ static void __exit khazad_mod_fini(void)
 }
 
 
-module_init(khazad_mod_init);
-module_exit(khazad_mod_fini);
+crypto_module_init(khazad_mod_init);
+crypto_module_exit(khazad_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Khazad Cryptographic Algorithm");
-- 
2.47.3


