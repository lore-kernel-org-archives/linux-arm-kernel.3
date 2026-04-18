Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE083F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji+fZcApZbwV30sxJjgqiMMSZkP+FHnBrLUTS/vdrl8=; b=sc6Y1W4RWEC1stGY7rh57cwK84
	2xRpfGdvOOhHHdnBj5XppPh83ZLNaU2hjoBT8jZ0whvohDFOv9jb8ytzHAP5MTA3jAuUoyEasQQbN
	+U9gbT3+LiffpSjgPcJv7cItjYldW17uYoQrqehEMS7CBdLMjeCXGVDWuwJNV5G0UNV0E8Upfk6S+
	GBicsUe/VcBesUKOKpKwB6ZRHPamh5E258gjjMZ2f1+xtAeu0vNTdCL/lOplsiW/AjU3QpzlBJ03M
	st3kIA0IUqPE4Juk/pnZIw61GKrXlXwfO1bNjtgVk+YxLw7Z/JM4kOLa7TyfnJO1UWHCxhRHWapAm
	H7T3md0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtSt-00000004bPZ-0QOP;
	Sat, 18 Apr 2026 00:23:15 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtSp-00000004bNY-0OGE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471791; x=1808007791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ji+fZcApZbwV30sxJjgqiMMSZkP+FHnBrLUTS/vdrl8=;
  b=V3oqjWQOENOCCcyJzYLSaTkwkleDgghWwuKF/OWPSV3EmDJ2qp27FC+r
   S9g2XyF5epiJwcXqIK47rhMVuIWhIdcbDHH0n320y2tbCMROicIcqRclS
   43PA7X2Oee6DW9r5Kx5bhXIKby8enXb5Lzsg1/X8ivk20pg1IZ1nW+8cY
   NeOHZ9l2FCq2H28FdyxW+9EqdW3ZnYbak/9bJYCt5RYKCmb9n7BNmzkMa
   rxmjq1Hlio2pf+5mIr6SJTn25VDnlAnerWiZ73uNVK24k/Mz7VVeLpawi
   lwDElCcbnviGSUBIpPV1m5oYMxGoac1MaqOc2UkLJcT+AoG3yI3a6W9G4
   A==;
X-CSE-ConnectionGUID: VNOMiFDbRem8NFxOqKt1zA==
X-CSE-MsgGUID: pwiLiAizSteMZHEAhgMsXA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17609398"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:23:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:25735]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.88:2525] with esmtp (Farcaster)
 id 3cca9a26-2992-45ba-a8b0-7ecdaa6684cc; Sat, 18 Apr 2026 00:23:10 +0000 (UTC)
X-Farcaster-Flow-ID: 3cca9a26-2992-45ba-a8b0-7ecdaa6684cc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:09 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:08 +0000
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
Subject: [PATCH v2 10/19] module: skip modversion checks for crypto modules
Date: Sat, 18 Apr 2026 00:20:18 +0000
Message-ID: <20260418002032.2877-11-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172311_180588_B05383C5 
X-CRM114-Status: GOOD (  19.70  )
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

The standalone crypto module feature allows loading pre-built crypto
modules from an external build to preserve FIPS certification across
kernel updates. Since these externally built modules have different
modversion CRCs than the running kernel, the module_layout and per-symbol
version checks will fail.

Add a flags field to struct load_info and bypass check_version() and
check_modstruct_version() for crypto modules. For fips140.ko loaded
from embedded kernel memory, the MODULE_INIT_CRYPTO_FROM_MEM flag is set
by the loader. For individual crypto algorithm modules (e.g., authenc.ko,
ccm.ko) built with the crypto-objs-m rule, a .fips140_crypto_marker ELF
section is detected during early_mod_check() and the
MODULE_INIT_CRYPTO_OBJS_M flag is set accordingly.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 include/uapi/linux/module.h |  1 +
 kernel/module/internal.h    |  1 +
 kernel/module/main.c        | 17 +++++++++++++++++
 kernel/module/version.c     |  9 +++++++++
 4 files changed, 28 insertions(+)

diff --git a/include/uapi/linux/module.h b/include/uapi/linux/module.h
index 6941497350893..7c6b3ae55c8d7 100644
--- a/include/uapi/linux/module.h
+++ b/include/uapi/linux/module.h
@@ -10,6 +10,7 @@
 #ifdef __KERNEL__
 /* Internal flags */
 #define MODULE_INIT_CRYPTO_FROM_MEM		(1 << 8)
+#define MODULE_INIT_CRYPTO_OBJS_M		(1 << 9)
 #endif
 
 #endif /* _UAPI_LINUX_MODULE_H */
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 061161cc79d90..b75b19e0b5dcf 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -69,6 +69,7 @@ struct load_info {
 	char *secstrings, *strtab;
 	unsigned long symoffs, stroffs, init_typeoffs, core_typeoffs;
 	bool sig_ok;
+	int flags;
 #ifdef CONFIG_KALLSYMS
 	unsigned long mod_kallsyms_init_off;
 #endif
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6152b9b39e6b1..69949069dc5f5 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3446,6 +3446,22 @@ static int early_mod_check(struct load_info *info, int flags)
 	if (err)
 		return err;
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	/* Detect crypto-objs-m modules by .fips140_crypto_marker section */
+	if (!(info->flags & MODULE_INIT_CRYPTO_FROM_MEM)) {
+		unsigned int i;
+
+		for (i = 1; i < info->hdr->e_shnum; i++) {
+			const char *sname = info->secstrings + info->sechdrs[i].sh_name;
+
+			if (strcmp(sname, ".fips140_crypto_marker") == 0) {
+				info->flags |= MODULE_INIT_CRYPTO_OBJS_M;
+				break;
+			}
+		}
+	}
+#endif
+
 	/* Check module struct version now, before we try to use module. */
 	if (!check_modstruct_version(info, info->mod))
 		return -ENOEXEC;
@@ -3678,6 +3694,7 @@ int load_crypto_module_mem(const char *mem, size_t size)
 	}
 
 	info.sig_ok = true;
+	info.flags = MODULE_INIT_CRYPTO_FROM_MEM;
 	info.hdr = (Elf_Ehdr *) mem;
 	info.len = size;
 
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 2beefeba82d94..3c5b5fceb73a9 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/printk.h>
+#include <uapi/linux/module.h>
 #include "internal.h"
 
 int check_version(const struct load_info *info,
@@ -21,6 +22,10 @@ int check_version(const struct load_info *info,
 	struct modversion_info *versions;
 	struct modversion_info_ext version_ext;
 
+	/* Skip version checks for FIPS crypto modules */
+	if (info->flags & (MODULE_INIT_CRYPTO_FROM_MEM | MODULE_INIT_CRYPTO_OBJS_M))
+		return 1;
+
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
 		return 1;
@@ -81,6 +86,10 @@ int check_modstruct_version(const struct load_info *info,
 	};
 	bool have_symbol;
 
+	/* Skip module_layout version check for FIPS crypto modules */
+	if (info->flags & (MODULE_INIT_CRYPTO_FROM_MEM | MODULE_INIT_CRYPTO_OBJS_M))
+		return 1;
+
 	/*
 	 * Since this should be found in kernel (which can't be removed), no
 	 * locking is necessary. Regardless use a RCU read section to keep
-- 
2.47.3


