Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA5DF99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6ZJIXhd4zjFqjDlmwifqG5q2HSX1yh116B7+fCpOk4=; b=vJ5JLHe8r3amnIEsYWTnbu/Zxc
	3Q8+9FhyH/prq5QTYVBCZYDAi0dWdXDHYEUPQLEM2GD373ly6H2UKHEVNHNK+nVCYGWIPnGnEisp4
	FgJq5BRXIbjlR9U5rgE7gYM52IMNAatfYo5LcO9XAdNLuNZn1mveUaIQ4Y61V17kEFnKZjwhDg0nN
	aykpIlnCSwZFHW/7RgSvTaNZEbP91IZAAY5PsFYUzbfJS9PaPDU83AuO8XbY0cj+2gk1jAKzb2Eio
	q0rpnjWliv3G7ugaFbX9UqTiJe1O3kPuPChJItTCwUu5K7dEr8DfViN+PCxOutnJdJacEiYH5KYAC
	aIkQHGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtSP-00000004bD1-1bJw;
	Sat, 18 Apr 2026 00:22:45 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtSL-00000004bAv-0Hgg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471761; x=1808007761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q6ZJIXhd4zjFqjDlmwifqG5q2HSX1yh116B7+fCpOk4=;
  b=pX3LjERO0nMEae8mesgeyagDgWLZfaHOAiCl7H28aY6k8qgVsK+kU7dr
   8atXd3AtofzF6rvMvkejkmmMKEEXZXv83O3i3K8BhrNstHGx1YvBJbNU2
   Q0Ku7myc7qP2pyeBPpJ1A8V1BExjbDeC2UbvTwCZFcKb/+K9+JULTzmCT
   JBheQArrHK0gvf5oJsGAAST6ZvPUdRO86K8oExLgf2lI8l1yL7dtq7JVQ
   mG2dn/kJ3OiYobbdKsyZYwt+QF/GzdH4r8S3sWEkWsDTMGCep+er8Xh+T
   NBIxUy8HmbtEd2VDA9zn16H1OOHrdMWlRf94Dglc5B2GBdqIVdyKd6qWw
   g==;
X-CSE-ConnectionGUID: WRko0on/TIeVMPUV0k21Kg==
X-CSE-MsgGUID: u6Kwv34+Q4m+agVV8580mw==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17480678"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:22:38 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:21526]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.131:2525] with esmtp (Farcaster)
 id 79c28a71-ed6b-48e1-89db-70e9249363a1; Sat, 18 Apr 2026 00:22:38 +0000 (UTC)
X-Farcaster-Flow-ID: 79c28a71-ed6b-48e1-89db-70e9249363a1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:38 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:37 +0000
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
Subject: [PATCH v2 08/19] crypto: fips140: add crypto module loader
Date: Sat, 18 Apr 2026 00:20:16 +0000
Message-ID: <20260418002032.2877-9-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172241_179001_A110F516 
X-CRM114-Status: GOOD (  15.72  )
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

Add a crypto module loader mechanism that loads a precompiled crypto
kernel module that is embedded in vmlinux image directly from memory
(whose address stored in _binary_fips140_ko_start/end) during early boot.

This is built based on Vegard Nossum <vegard.nossum@oracle.com> and
Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>, the
fips_loader_init is picked up. But different from them, such loader is
not executed as arch_initcall_sync(), but rather as a thread along main
kernel init to ensure proper initialization sequencing (Details are in
later patch).

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-loader.c | 55 +++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 crypto/fips140/fips140-loader.c

diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
new file mode 100644
index 0000000000000..369ab3ceede9c
--- /dev/null
+++ b/crypto/fips140/fips140-loader.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * FIPS 140 Early Loader
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/vmalloc.h>
+#include <linux/string.h>
+#include <linux/elf.h>
+#include <linux/kthread.h>
+#include <linux/wait.h>
+
+extern const u8 _binary_fips140_ko_start[];
+extern const u8 _binary_fips140_ko_end[];
+const u8 *_binary_crypto_ko_start;
+EXPORT_SYMBOL_GPL(_binary_crypto_ko_start);
+const u8 *_binary_crypto_ko_end;
+EXPORT_SYMBOL_GPL(_binary_crypto_ko_end);
+
+/* Function to load crypto module from memory */
+extern int load_crypto_module_mem(const char *mem, size_t size);
+
+static void load_prepare(void)
+{
+	_binary_crypto_ko_start = _binary_fips140_ko_start;
+	_binary_crypto_ko_end = _binary_fips140_ko_end;
+}
+
+static int fips_loader_init(void)
+{
+	load_prepare();
+	
+	const void *ko_mem = _binary_crypto_ko_start;
+	size_t ko_size = _binary_crypto_ko_end - _binary_crypto_ko_start;
+	void *vmalloc_mem;
+	int ret;
+	
+	// Copy to vmalloc'd memory since load_module expects to free it
+	vmalloc_mem = vmalloc(ko_size);
+	if (!vmalloc_mem) {
+		pr_err("FIPS140 loader: failed to allocate memory\n");
+		return -ENOMEM;
+	}
+	
+	memcpy(vmalloc_mem, ko_mem, ko_size);
+	
+	ret = load_crypto_module_mem(vmalloc_mem, ko_size); // Skip signature check
+	if (ret)
+		panic("FIPS140 loader: module loading error\n");
+
+	vfree(vmalloc_mem); // Free after successful module loading
+	return ret;
+}
-- 
2.47.3


