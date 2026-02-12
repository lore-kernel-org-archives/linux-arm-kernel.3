Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D519EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkGQfRjyV9lo9tVx9lTNhKFQa2rP7zzwxq7FWhvpL9o=; b=o70vXPx4uu8eQLaxD9Srk0snFr
	I090qCf0XG/r9QS5c5nXQZQJp/jiGFK/upAf5p5BagMiWn+pVEjadr3CRFiYWoUV8+p+SQyXDvI3T
	j3AD5XXDBgXFPdt5dKG6C/mySm7mB2fBTHIIQ34yz8U/M5iQgWVdK+GXQgEFakgzycExcWF2ZAj+4
	9vLy5cTbB3RmaedbBLRz79PPIXyYU5mkHTp7piAuO0nKmuae3ri/uAtPFVnuHqDQtAUpHSJVxYGIn
	cUwoc1z9uKyHE09paNoPixtaJR4NBvUJ4et5cVgH+9bC5w4tL6yrY8rGRp2NFZAuD4npxUDI6iyJO
	SWAN1cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMfJ-00000001KJU-2yLD;
	Thu, 12 Feb 2026 02:42:49 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMfH-00000001KIr-22Vv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864167; x=1802400167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JkGQfRjyV9lo9tVx9lTNhKFQa2rP7zzwxq7FWhvpL9o=;
  b=SGBQtvsjf3RCTl/K0KMj56gO3HxXftjZ2KonczmxT+BqffWpSktA97Gx
   cRPTFRmehGi90n8jxY3CZFzfuXEbaNARwxYXDc9OW3s5oPK+smmlHzKUM
   gR52EtnbBEkkDtZbZM2VrvOaw9GDRiabBVimTMACg7VaDqbn1oDQHQoDI
   Xpm+syDWKabmZLEstsr2pbk3aLyLCcVfW/VWkja91NlP/E+ncSCgsx0lY
   lXq/yCNCkDcBmH2Bfq/KGUp4n4aTXUbukshoqKv139+JdyDxgSoMKYYAv
   +rWmv8qLlwDBojLOESeS1C8ztfmt8d3SsYGP08PxwnKGN6sNrQujOAk6t
   A==;
X-CSE-ConnectionGUID: 9XrHk633Q3aLo1kmLbsNHg==
X-CSE-MsgGUID: NQa9TpyWTXOdC9/d2aixUQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12695987"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:42:44 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12575]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id bddb51ec-5ba6-416f-bc4f-728add5d0a8d; Thu, 12 Feb 2026 02:42:44 +0000 (UTC)
X-Farcaster-Flow-ID: bddb51ec-5ba6-416f-bc4f-728add5d0a8d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:42:43 +0000
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
Subject: [PATCH 01/17] crypto: add Kconfig options for standalone crypto module
Date: Thu, 12 Feb 2026 02:42:05 +0000
Message-ID: <20260212024228.6267-2-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA004.ant.amazon.com (10.13.139.9) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184247_580308_EAE2FB5B 
X-CRM114-Status: GOOD (  14.53  )
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

Add Kconfig option `CRYPTO_FIPS140_EXTMOD` to enable standalone crypto
module support that can override built-in cryptographic implementations.

Currently supports X86_64 and ARM64 architectures and requires CRYPTO
and MODULES to be enabled.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Kconfig         |  1 +
 crypto/fips140/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 crypto/fips140/Kconfig

diff --git a/crypto/Kconfig b/crypto/Kconfig
index e2b4106ac961..b4ce3c1cfa1b 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1415,6 +1415,7 @@ endif
 endif
 
 source "drivers/crypto/Kconfig"
+source "crypto/fips140/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 source "crypto/krb5/Kconfig"
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
new file mode 100644
index 000000000000..0665e94b9fe0
--- /dev/null
+++ b/crypto/fips140/Kconfig
@@ -0,0 +1,15 @@
+config CRYPTO_FIPS140_EXTMOD
+	bool "FIPS 140 compliant algorithms as a kernel module"
+	depends on CRYPTO && (X86_64 || ARM64) && MODULES
+	select CRYPTO_FIPS
+	help
+	  This option enables building a kernel module that contains
+	  copies of crypto algorithms that are built in a way that
+	  complies with the FIPS 140 standard.
+
+	  The module registers the algorithms it contains with the
+	  kernel crypto API, and the kernel crypto API's FIPS 140 mode
+	  can be enabled to restrict crypto algorithm usage to only
+	  those provided by this module.
+
+	  If unsure, say N.
-- 
2.47.3


