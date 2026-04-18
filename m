Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353B5F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNvYe6iUcby5vTTkfjJF4gPqPCQmHMNsypoSY/zqQq0=; b=SndJVaMfsdZz7uvXWeGH/RrlB5
	42Xn+zNlKXm4L+ENtyWJ/eS2Icqlaj28SIkoK47tNJCCpR0usCi3vMH55X7Fo9f+CLQi4SjopPx8v
	xZnAi/9HwwPY19z1GXDKcOWTc18CkMBKMFhov7b+2rMUo1O9viwD1y7bwHL15LjxvzhT2C5deQWX+
	6L2zQfglBFLKgDIUGR4QZRQtAiRuAnPKSoUXPtairwfa9GtVbdC4QpavvARZIAjjxxcuOilwZPBNB
	nNEoMOFst+pEtPK1li5z8cI9NvlKi2oelyX9fdcbn4sYLwFubucm5/dvyvcKfXZi6T7Yg5s/wj1yi
	yAeTMP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtUu-00000004cIV-2m0R;
	Sat, 18 Apr 2026 00:25:20 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtUs-00000004cHT-1BsJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471918; x=1808007918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TNvYe6iUcby5vTTkfjJF4gPqPCQmHMNsypoSY/zqQq0=;
  b=dNCSMfebWR854ARFywnurVUwY9Fh2soQNuI9QuHNO1jrHm08DTJZpv8q
   O0jFYvb6/Rtb+BI1hWLhqZT037R6MiUfEmWgGR2MRkwkI5Xd7f0Ge/GvI
   kg2dcuMV0Faby9C5RlTYwDDjChbYVu0NABMz8yiEYt2U1TrSmrn+aSMqG
   unaSGLHxiLD30nwkq1r9ExUrj+BDpk4VjMpo5938P6wOqGOtd9BYYUEEp
   p6Cs107zfNDGCEqxpfPzfRIFt2mPsPqPXbSabxjwRp3IoID/eb1Jd8V/y
   Z2H3+CBCEzzX92neA5SBi6wWV/PJP+o8p3+HwalSAF+XFngPMaGF84RgB
   A==;
X-CSE-ConnectionGUID: QoIqPz+iTLqZX5kDlbrwWQ==
X-CSE-MsgGUID: rtnITjt0SlqzEtzTYEd0aA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17480723"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:25:17 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:31023]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.2:2525] with esmtp (Farcaster)
 id fb4228d6-2b4d-451a-9d7d-58743ec3c5c5; Sat, 18 Apr 2026 00:25:17 +0000 (UTC)
X-Farcaster-Flow-ID: fb4228d6-2b4d-451a-9d7d-58743ec3c5c5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:25:14 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:25:13 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 18/19] arm64/crypto: convert exported symbols in arm64 crypto to pluggable symbols
Date: Sat, 18 Apr 2026 00:20:26 +0000
Message-ID: <20260418002032.2877-19-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172518_633454_85EA30B9 
X-CRM114-Status: GOOD (  15.25  )
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

Include arm64 architecture-specific crypto source files in
fips140.ko by converting their Makefile rules from obj-y to
crypto-objs-y, and apply the pluggable interface introduced
in the earlier patch so that symbols defined in fips140.ko
can still be referenced by vmlinux.

For exported function symbols, the --wrap linker mechanism
automatically redirects all references in vmlinux to
trampolines, so no source tree modifications are needed
beyond ensuring each function has an EXPORT_SYMBOL.

For exported variable symbols, an architecture-specific
fips140-var-redirect.c is introduced under
arch/arm64/crypto/fips140/ to hold DEFINE_CRYPTO_VAR_STUB()
definitions. This file is compiled twice: once for vmlinux
(as the "outlet" providing the placeholder pointers) and
once for fips140.ko (as the "plug" populating them with
real addresses via the __crypto_var_keys section).

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile                    | 23 +++++++++++--------
 arch/arm64/crypto/fips140/Makefile            | 14 +++++++++++
 .../crypto/fips140/fips140-var-redirect.c     |  0
 3 files changed, 27 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/crypto/fips140/Makefile
 create mode 100644 arch/arm64/crypto/fips140/fips140-var-redirect.c

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index a169f9033401c..0ade4ae586e54 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -5,32 +5,35 @@
 # Copyright (C) 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
 #
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
 sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
 sm4-ce-ccm-y := sm4-ce-ccm-glue.o sm4-ce-ccm-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_GCM) += sm4-ce-gcm.o
 sm4-ce-gcm-y := sm4-ce-gcm-glue.o sm4-ce-gcm-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_NEON_BLK) += sm4-neon.o
 sm4-neon-y := sm4-neon-glue.o sm4-neon-core.o
 
-obj-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
+crypto-objs-$(CONFIG_CRYPTO_GHASH_ARM64_CE) += ghash-ce.o
 ghash-ce-y := ghash-ce-glue.o ghash-ce-core.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
 aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o
 
-obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
+crypto-objs-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
\ No newline at end of file
diff --git a/arch/arm64/crypto/fips140/Makefile b/arch/arm64/crypto/fips140/Makefile
new file mode 100644
index 0000000000000..a7a5259a43ab6
--- /dev/null
+++ b/arch/arm64/crypto/fips140/Makefile
@@ -0,0 +1,14 @@
+
+crypto-objs-y += fips140-var-redirect-fips.o
+
+obj-y += fips140-var-redirect-main.o
+
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-var-redirect-main.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-var-redirect-fips.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-var-redirect-main.o += -I$(srctree)
+CFLAGS_fips140-var-redirect-fips.o += -I$(srctree)
diff --git a/arch/arm64/crypto/fips140/fips140-var-redirect.c b/arch/arm64/crypto/fips140/fips140-var-redirect.c
new file mode 100644
index 0000000000000..e69de29bb2d1d
-- 
2.47.3


