Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B898C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quF/rmJR+ZZUaD4FKwu0PINJg03Gp63DAJI73RocdGk=; b=ez+gI3ya4QSibm4trpxQtjj7lp
	Sfr/bjbo5iJWHOg8tyXECipXgE8EDRTk5kNCu/iA9NvKQWJnsemr13rYjcSMro2Hz/4+MbpRIbPEy
	XUsFicUD96pa/c6KOgHewUrWjJKrAHh92IyTTlXLj+dK0DUJ1C8mnFuYHDKYfTYq11HlHG4Jo5mbV
	vkZJQr5FuAaGotGLDsM1qe4PdE5eWutZxD1K8AHONXR1auneyAo05IZnd4arxYsqnQKoZBWBIJf45
	5pSvd1GtAf7MVvcIL3o8MlnVaROmFVrgDyEZ6KF52llWXy9H3aiQUnnVx1YgQ7pBZRCMs7zzNqQYy
	hVuFCi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvG-0000000Ggmo-3Y5e;
	Wed, 12 Aug 2026 17:39:26 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCvB-0000000GggY-1NKV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=quF/rmJR+ZZUaD4FKwu0PINJg03Gp63DAJI73RocdGk=; b=kzXktsQXvSTUwx5xZ6JdArjihL
	t1FlwChPmtgZtcUHmwFxn5mDxX2QJ9Pn8Brl1fJK1Sn74+HIK43vjsmNFLtSYNc6LftuaidqM857d
	QGDmy2SRe/4zhxibxnTcmfkpLiihLL9xNJjZQagBh5FgNPEPUTJAQGY9D4GeicM0toL03TiGlNRbO
	O788L7I3R3GvC67IgsWcDL468MVEQW8cD4SpmgPujPgJYMSoA5z0OxU/PZOAY79/KKj1coQ9ky/Eq
	2y35nfukq7ylxSuF/5Symnx8fkf/KbFqqNNY33pxVCqG6OzHbMKJG7Po2EvN8Y4cDAq8x1znOlbvq
	EG/ozGRw==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wuCv4-000FR2-I3; Wed, 12 Aug 2026 19:39:14 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 12 Aug 2026 14:38:38 -0300
Subject: [PATCH v5 07/13] mips: Remove duplicated syscallnr.sh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260812-tonyk-syscall_table-v5-7-3d383927c609@igalia.com>
References: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
In-Reply-To: <20260812-tonyk-syscall_table-v5-0-3d383927c609@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, parclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_103921_370920_C0AC4C09 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

The common scripts/ already have a script for generating the numbers of
syscalls file. Use it and drop the custom script.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 arch/mips/kernel/syscalls/Makefile     |  9 +++++----
 arch/mips/kernel/syscalls/syscallnr.sh | 26 --------------------------
 2 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 56f6f093bb88..69adc21483ed 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,16 +5,17 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syshdr := $(srctree)/scripts/syscallhdr.sh
-sysnr := $(src)/syscallnr.sh
+sysnr := $(srctree)/scripts/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
 
 quiet_cmd_sysnr = SYSNR   $@
-      cmd_sysnr = $(CONFIG_SHELL) '$(sysnr)' '$<' '$@'		\
-		  '$(sysnr_abis_$(basetarget))'			\
-		  '$(sysnr_pfx_$(basetarget))'
+      cmd_sysnr = $(CONFIG_SHELL) $(sysnr) \
+		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ \
+		  --abis $(sysnr_abis_$(basetarget)) \
+		  $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
diff --git a/arch/mips/kernel/syscalls/syscallnr.sh b/arch/mips/kernel/syscalls/syscallnr.sh
deleted file mode 100644
index c190bbefbfc2..000000000000
--- a/arch/mips/kernel/syscalls/syscallnr.sh
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-
-fileguard=_UAPI_ASM_MIPS_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry compat ; do
-		nxt=$((nr+1))
-	done
-
-	printf "#define __NR_%s_Linux_syscalls\t%s\n" "${prefix}" "${nxt}"
-	printf "\n"
-	printf "#endif /* %s */" "${fileguard}"
-	printf "\n"
-) > "$out"

-- 
2.55.0


