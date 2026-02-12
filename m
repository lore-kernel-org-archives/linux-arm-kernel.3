Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8BAEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1ccqnXvznzNGogOKvANquFZ3Qvedb0hNet0hrKXo3Q=; b=GDCesFz0tLmojEBln9HhyoijmP
	R5/FSvziftmyF0mbyrTO5uo5f58oqrL4LHYo2MNKILYrnvNF9YUv+lcZKiBRCHvK08fLKweLX9gc1
	lwqte1DByegqUYxDtlm1Q0DxmfW2o1NvgbhR5ZNrGMWCErw8sYDwVjvUHabS6hnsARH/SulC2O+2O
	gN4JAS5vLFmfKQ7bPveIJVZi9asjbMueT3TmU/xNG4ysWrpEZpUtrpMG2gQ2SFvN8z3IIIChitkUk
	WdZ3y0QdEpVEabf1co8mpK32P0O2g8SGo9UZGNUuOczMwjsWSoYQ3kJDsbIrkF5uARE/M0TNwM0qt
	qCMjdJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMj2-00000001Lpd-0QRN;
	Thu, 12 Feb 2026 02:46:40 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMj0-00000001LoT-1B0g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864398; x=1802400398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1ccqnXvznzNGogOKvANquFZ3Qvedb0hNet0hrKXo3Q=;
  b=H3reRvFQl7ESxqH5xTb6kLv1Y3SyxxPVyMsR2EtTbCAlUS2AQ+A9gL1a
   j40QPGKQF2MYrfBdJJGMLNCZgAGrKcBzALviXF5HfrXhu1aOOrQxE0xYF
   I9TY/IeglPP1s3x6/zGDSpHKnru+ARSVX8ZJYOxxRuuaM3uV7MBbvDLsH
   Wr1rZ05Tw8d9t7/W+9QBotMb7y4NFFZc+F+318EywM9IfwVvtN8cuXw1A
   z7y6LqBef3QrJQIoaDAQNWBYLk+sLbtaI1aRuC7uMHtY+L8qyNM3R8UgE
   HZykerX3N/KMTtpR5EsKS4tm0FIc+Ktqv7HcQMbI2kcLUacFa1AqOQVaa
   w==;
X-CSE-ConnectionGUID: LLn5dxOQSLSwSisd4bhCkA==
X-CSE-MsgGUID: F2CPcaJ2QseDGee8gTHivQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914007"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:37 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:29551]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id caf039b4-492c-49c0-91ab-1e3376292296; Thu, 12 Feb 2026 02:46:37 +0000 (UTC)
X-Farcaster-Flow-ID: caf039b4-492c-49c0-91ab-1e3376292296
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:36 +0000
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
Subject: [PATCH 16/17] arm64: crypto: to convert exported crypto symbols into pluggable interface for arm64 cryptos
Date: Thu, 12 Feb 2026 02:42:20 +0000
Message-ID: <20260212024228.6267-17-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184638_371710_AA304D6B 
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

Prepare to convert exported crypto symbols in arm64 cryptos
into pluggable interface. This patch introduces architecture specific
crypto API definition file `fips140-api.c`.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile              |  3 +++
 arch/arm64/crypto/fips140/Makefile      | 14 ++++++++++++++
 arch/arm64/crypto/fips140/fips140-api.c |  0
 3 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/crypto/fips140/Makefile
 create mode 100644 arch/arm64/crypto/fips140/fips140-api.c

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 3574e917bc37..9f7106424d66 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -40,3 +40,6 @@ aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
\ No newline at end of file
diff --git a/arch/arm64/crypto/fips140/Makefile b/arch/arm64/crypto/fips140/Makefile
new file mode 100644
index 000000000000..0a150ab16027
--- /dev/null
+++ b/arch/arm64/crypto/fips140/Makefile
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
diff --git a/arch/arm64/crypto/fips140/fips140-api.c b/arch/arm64/crypto/fips140/fips140-api.c
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.47.3


