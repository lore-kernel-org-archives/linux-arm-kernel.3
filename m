Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F9C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4woeKBq94StRBWQOlx29oSEhrI6HXyHnkC3tl4QTEwA=; b=ULvkAxFf1ehMx3NI0qcA8AA03L
	pdOGkEZGrvIcQLPBdd9t9eUnQ3o357rmiriQSbOZ64U+GuS2vhSjoMzxKibfud2zYiX96BnXHV9ha
	B0yDYYvGJ06ZRze+xVKqAYSUH6InGXHAxZ5s56vZwNapQRKVkwr/KylLhOk5/AlZgqWL8XPVoEuiU
	ydgvJWHMjuT31ha2uhGk1fhZTf/URNubgJ42vqw+IZXHcbbHEM7yfY/p2vDrMeItfTFZRbF0Mm7EI
	wxTjdTNfZnLfe/RF5GZ4unZH9zjh2VBOGq3tQSgKJMSost1gcwMbY9oOkgr6cxzSB1iWuHVkXiIri
	56JyTImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lox-0000000Cxcw-3QIs;
	Thu, 17 Sep 2026 23:47:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LoV-0000000CxLr-1jM8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 23:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4woeKBq94StRBWQOlx29oSEhrI6HXyHnkC3tl4QTEwA=; b=d7vaztYSPt4t49mMUQLa3rzelc
	/Z4TGBQik4RbyHX6LoZrbjf8JYkahKlxWH/jQ/1PMwEu3jHbR2pN6NY9C5lBA29PzLOtExmX6Pj5W
	wLmnrTVTHdte6Fvn3RjOdaGXuPaFAlX6AwAvHQNr7AzPpcq5LGMzS3Yh5FIQnWd7CvTI9aiXSAyNZ
	6qDIQgqqBbEft14rs9MBpiTeia9zD/tzQie2zcw+azCufd4RcAR3sfO2/ZgQIMjw06OxmgQyRffFR
	+XGFMHKjwK46MeYoW3BE6EQOCj+nY9oU8V5lmRjnNgesq04UWct3lXHDR2SoiOvqF8mBXChVKoG2m
	DHOmIKkg==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7LoS-00000009ObV-3QQF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=4woeKBq94StRBWQOlx29oSEhrI6HXyHnkC3tl4QTEwA=; b=lPNUJ+smduwTEkTJXPhlyWa/bu
	qT3kycq/AYCLQ+UGQLalP3kMkiTD7mnoeF49/iVDlcmcqvRgz0E4GzpftXM5EySOFLvb7ZZrpJ0Tm
	peCacoE3hjdarKSgsHgpbSQE79Y0m+OtTEHMb3heizy828xBBcIUPveCWcR29GK4QYexmBLIyxnfN
	s+J5kvx54BaUQT3JUQotI9fVHZ0MMTGOPqIFsA7bUSdJ+FKIit6t5nlagNnSwYtV8JavBujMEsW2n
	evDRy81OR41861FmBpJyyuOYEQsk23gCpP7Hcdgbj7nm2Jm5HuLQ46LawWwmGhqa6vFb2/q0/WlxS
	n7YBxcow==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7LoO-003hU7-5A; Fri, 18 Sep 2026 01:46:40 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Thu, 17 Sep 2026 20:46:10 -0300
Subject: [PATCH v7 07/13] mips: Remove duplicated syscallnr.sh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-tonyk-syscall_table-v7-7-f4cd8f8e3265@igalia.com>
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_004644_903631_650ED226 
X-CRM114-Status: UNSURE (   8.87  )
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
 arch/mips/kernel/syscalls/Makefile     |  7 +++----
 arch/mips/kernel/syscalls/syscallnr.sh | 26 --------------------------
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 56f6f093bb88..1bfc2346d100 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,16 +5,15 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
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
+		  --prefix $(sysnr_pfx_$(basetarget))_Linux_ $< $@
 
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


