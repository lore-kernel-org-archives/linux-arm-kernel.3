Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA58EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbneh8UfA8Seb0DzTuFA1ZZfq/ud9cCo2i7ye2KFd40=; b=gQXb3tUOyLcl+iw7+MXBE8EcB+
	xNjZZ/gNWmno86ClgXGJLxNHAYJq4lpTa1Jf8hsRXsk5zR0k6h2HMV9T+LrU4ezaIzq01fM454ax/
	kbB1mZiQM3A27O/w0uMPTYf3XAWEG3/zAhVGWnpNUUOm5hdVu5GmyLzWdsZTrQILh2LKwnCGHpdS6
	9thJUn4wg398l4RmjT9NNLPn5U5JErOOArJUHKHH7kOhnomLHLL7/VyItb4GFoqpqrSP3IvuCKYuc
	0krLzp0vz002ck3pmK3U9jiK2cx0pNIkkzunjZ/b0gdLPKjOgXPhhhnaC+/BD9H68DkjsB1M/Qn9d
	b0HBh8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMio-00000001Ljs-344T;
	Thu, 12 Feb 2026 02:46:26 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMim-00000001LiC-2vPR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864384; x=1802400384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wbneh8UfA8Seb0DzTuFA1ZZfq/ud9cCo2i7ye2KFd40=;
  b=p2zR0jk/U/KTT5jgjA6LNB/BngL7T9ifzVFdIdoIYHRqEANJHDaiVh6f
   kKuteUq70V9AUrC+3xGxqmBPEgZcNGSk7C+JjO1FyY90C9HX4IW3istmr
   8VWK3oc91FNdM5RVNEBi+oBnqAczSE/v9F1vtH9NYSsEVaP8PHTeqhQ79
   QoOgYkp+5cQSrLkwvHdxd8Vj+mmVqtGY+RnSMyPe41rFTfQsDB8Vm/2C3
   ZEYD14tJ7NW6EbagZEWjd9AN2sKK72ApuVIgkN4921hbIlkh9xNoWLCOa
   uaD4iWgVcYi4JyrM1pepH59ffeyDoizCKPUCEm9WmIPpxXy/qUdUmaDLX
   w==;
X-CSE-ConnectionGUID: DGUzZrLSTUyylITJehVvHQ==
X-CSE-MsgGUID: JP56y5aWSUe/LyCifnxanA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803013"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:4438]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 5bd3107b-1ba7-4129-9707-344bc0b38f08; Thu, 12 Feb 2026 02:46:22 +0000 (UTC)
X-Farcaster-Flow-ID: 5bd3107b-1ba7-4129-9707-344bc0b38f08
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:21 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:21 +0000
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
Subject: [PATCH 15/17] x86: crypto: to convert exported crypto symbols into pluggable interface for x86 cryptos
Date: Thu, 12 Feb 2026 02:42:19 +0000
Message-ID: <20260212024228.6267-16-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWA004.ant.amazon.com (10.13.139.76) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184624_788845_4F9DEC31 
X-CRM114-Status: GOOD (  13.33  )
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

Prepare to convert exported crypto symbols in x86 cryptos
into pluggable interface. This patch introduces architecture specific
crypto API definition file `fips140-api.c`.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  3 +++
 arch/x86/crypto/fips140/Makefile      | 14 ++++++++++++++
 arch/x86/crypto/fips140/fips140-api.c |  0
 3 files changed, 17 insertions(+)
 create mode 100644 arch/x86/crypto/fips140/Makefile
 create mode 100644 arch/x86/crypto/fips140/fips140-api.c

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index b21ad0978c52..ab248a1beb00 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -70,3 +70,6 @@ aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
diff --git a/arch/x86/crypto/fips140/Makefile b/arch/x86/crypto/fips140/Makefile
new file mode 100644
index 000000000000..0a150ab16027
--- /dev/null
+++ b/arch/x86/crypto/fips140/Makefile
@@ -0,0 +1,14 @@
+
+crypto-objs-y += fips140-api-fips.o
+
+obj-y += fips140-api-main.o
+
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-api-main.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-api-fips.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-api-main.o += -I$(srctree)
+CFLAGS_fips140-api-fips.o += -I$(srctree)
\ No newline at end of file
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.47.3


