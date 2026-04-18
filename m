Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9627FF99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5xia90OnNxpHDW4IhBqW8EDdaqm7on9SBX3cSQO+Gc=; b=dlGmtxRhOuh2CkgZGKDOTW7Lr9
	ZUet9BHbU9qT0r/XNBEhcq+162mAhBQJFn6ZKQPVckiFAjsXWu8yWK6cnwZwAcXsdls+4wBrYF4rf
	+CWwiU1pCpFpqFspL8NXWcT2PeUFV3796wGGxsTnkn7ZpY1XXqKXC/9YfeQ46heglHveT3pf77oeG
	recgSbM7OX+BeiUkScxRZjiquZrKQR+rZQ7eJ9zD67at8whZmHG3u3kCWrZt2CawXSmxXJ4k13WvI
	GhV5EjqwGByVS54YygCyhuiZdqB1DvVA4XEUFv2r+8yAY3FMyZwENxZORm3fQQtuy+rDtyxvNO07q
	r2pDr3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtRM-00000004aeg-48oo;
	Sat, 18 Apr 2026 00:21:41 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtRK-00000004adG-2UFX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471698; x=1808007698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j5xia90OnNxpHDW4IhBqW8EDdaqm7on9SBX3cSQO+Gc=;
  b=hkA/2Q1AbDL3JhZ7i74RL/EGMFK28jusEGI6mJMpww/chy0PhgbA4NKP
   AbeUKbsmWUWsh510Kfu59XCrvE+fj6HMFKnHwXH6BAlQoCyd4nfg0c+8b
   mSx7PiabhdSKmI7jeYi35Gna79fcN50XPDIu+Km5Vy+II67I64IZ4kFph
   Rz+aaqzA6r9/xTFoxmdG6WJOVtS0RccVlUNCfjt5t69l3cEc4jJhlzc45
   Fsuxpd+tD7dteF2V0QGgAfyD0HzRHvVxCpUMHdwlLvDk1ADPTHl/yFBmH
   FCAvM9GeJArINCYpHlcPZ4uLSsHIyhwatWgXi1jlCdYGFxoLCFk7+MiCl
   w==;
X-CSE-ConnectionGUID: 9crb3GnOQ2ysPv5a8ay7sQ==
X-CSE-MsgGUID: 0d4CBFUiQ/qOlDvOXHG0iA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17378043"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:36 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:18932]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.88:2525] with esmtp (Farcaster)
 id 1281606b-bc68-48e4-901c-b4170531407b; Sat, 18 Apr 2026 00:21:36 +0000 (UTC)
X-Farcaster-Flow-ID: 1281606b-bc68-48e4-901c-b4170531407b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:35 +0000
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
Subject: [PATCH v2 04/19] build: Add ELF marker for crypto-objs-m modules
Date: Sat, 18 Apr 2026 00:20:12 +0000
Message-ID: <20260418002032.2877-5-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172138_760275_9C0316DB 
X-CRM114-Status: GOOD (  16.39  )
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

Previously, crypto-objs-$(CONFIG_*) behavior depends on the config value.
When CONFIG_*=y, crypto is built into fips140.ko. When CONFIG_*=m, crypto
is already built as a separate module (e.g., aes.ko), so previous patches
do not affect such modules.

This patch adds an ELF marker to identify modules built with CONFIG_*=m
so they can be distinguished as part of the CONFIG_CRYPTO_FIPS140_EXTMOD
framework. This gives module loaders a way to tell the module is included
in crypto-objs-m.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-crypto-module-marker.h |  8 ++++++++
 scripts/Makefile.build                        | 15 +++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 crypto/fips140/fips140-crypto-module-marker.h

diff --git a/crypto/fips140/fips140-crypto-module-marker.h b/crypto/fips140/fips140-crypto-module-marker.h
new file mode 100644
index 0000000000000..eadca087cee20
--- /dev/null
+++ b/crypto/fips140/fips140-crypto-module-marker.h
@@ -0,0 +1,8 @@
+#ifndef _FIPS140_CRYPTO_MODULE_MARKER_H
+#define _FIPS140_CRYPTO_MODULE_MARKER_H
+
+/* Crypto module marker - automatically included for crypto-objs-m modules */
+static const char __fips140_crypto_marker[] 
+    __attribute__((section(".fips140_crypto_marker"), used)) = "FIPS140_CRYPTO_OBJS_M";
+
+#endif /* _FIPS140_CRYPTO_MODULE_MARKER_H */
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index cf021ad77e153..685d9b8fcbf4a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,6 +69,7 @@ obj-m += $(crypto-objs-m)
 ifndef CONFIG_CRYPTO_FIPS140_EXTMOD
 obj-y += $(crypto-objs-y)
 crypto-objs-y :=
+crypto-objs-m := $(filter-out $(crypto-objs-y),$(crypto-objs-m))
 endif
 
 # When an object is listed to be built compiled-in and modular,
@@ -131,6 +132,7 @@ multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 multi-crypto-objs-y := $(call multi-search, $(crypto-objs-y), .o, -objs -y)
+multi-crypto-objs-m := $(call multi-search, $(crypto-objs-m), .o, -objs -y -m)
 endif
 
 # Replace multi-part objects by their individual parts,
@@ -139,6 +141,7 @@ real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
 real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 real-crypto-objs-y := $(strip $(call real-search, $(crypto-objs-y), .o, -objs -y))
+real-crypto-objs-m := $(strip $(call real-search, $(crypto-objs-m), .o, -objs -y -m))
 endif
 
 always-y += $(always-m)
@@ -166,11 +169,13 @@ real-obj-y	:= $(addprefix $(obj)/, $(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/, $(real-obj-m))
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 real-crypto-objs-y := $(addprefix $(obj)/, $(real-crypto-objs-y))
+real-crypto-objs-m := $(addprefix $(obj)/, $(real-crypto-objs-m))
 endif
 multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 multi-crypto-objs-y := $(addprefix $(obj)/, $(multi-crypto-objs-y))
+multi-crypto-objs-m := $(addprefix $(obj)/, $(multi-crypto-objs-m))
 endif
 endif
 
@@ -578,6 +583,16 @@ $(multi-crypto-objs-y): %.o: %.mod FORCE
 $(call multi_depend, $(multi-crypto-objs-y), .o, -objs -y -m)
 endif
 endif
+
+# Individual object compilation with version-specific flags
+$(real-crypto-objs-m): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1 -include $(srctree)/crypto/fips140/fips140-crypto-module-marker.h
+
+# Also set flags for individual objects that make up composite crypto objects
+$(foreach obj,$(multi-crypto-objs-m),$($(obj:.o=-y))): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1
+$(foreach obj,$(multi-crypto-objs-m),$($(obj:.o=-objs))): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1
+
+# Multi-part crypto objects
+$(multi-crypto-objs-m): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1 -include $(srctree)/crypto/fips140/fips140-crypto-module-marker.h
 endif
 # This is a list of build artifacts from the current Makefile and its
 # sub-directories. The timestamp should be updated when any of the member files.
-- 
2.47.3


