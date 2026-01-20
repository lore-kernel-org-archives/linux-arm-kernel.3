Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98FD2ED17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xgu5CRqJIRYohVA9Nlr7ZZWWSXRFI0/OUNyDdS44Yzs=; b=YsZbkJwU7AGx2EiW+6y6n5z/M5
	WY8tkW9mTD7/B1TTaZp9KIyQElntfCq8eDgSefar37Yaq1Xat6bUgOuQrdv3wBwskXmBh3enOm+Nj
	9mi/SM3Ut8WULN0y+CXIOYCJXkDdDeEAXCxWwJ4cEJUzCnXgcsId309/V1fnLJkBFn88d+muqqDt9
	HSaFswTiLdbuQrfGKGfAUvZgtYLNuMwFz8kqrKs1dnfKqfpgWU/9ARw5zGeZ/Vg9yx73DEFBX81Lr
	FJYWwJ1xTMKundR0+zjICepGaBmIHtnhGEnunYu+8LpAWnA+70nzBhhF2YVpl+iBqmAVokyWsYG+j
	L+s1iL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDfF-000000045DY-0q3g;
	Tue, 20 Jan 2026 15:29:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDfC-000000045Cx-3J6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:29:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2BE1476;
	Tue, 20 Jan 2026 07:28:53 -0800 (PST)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AA1C3F632;
	Tue, 20 Jan 2026 07:28:59 -0800 (PST)
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com
Subject: [BOOTWRAPPER PATCH] aarch64: Account for kernel header image_size when placing FDT/XEN
Date: Tue, 20 Jan 2026 15:28:38 +0000
Message-Id: <20260120152838.95667-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_072902_946722_0EE6EA57 
X-CRM114-Status: GOOD (  14.97  )
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

We currently use fixed memory offsets for object loaded into
memory. In particular, FDT_OFFSET is hardcoded to 0x08000000 (128MiB).
This can fail when the kernel's loaded image fits just below FDT_OFFSET,
but its (non-loaded) .bss extends past it at runtime and overwrites the
FDT.

Let's compute FDT_OFFSET from the kernel header image_size (fallback to
0x08000000 when the header is missing). Also place XEN_OFFSET 2 MiB
after FDT_OFFSET.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 Makefile.am                |  6 +++---
 scripts/AA64Image.pm       |  7 +++++++
 scripts/aa64-fdt-offset.pl | 39 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 scripts/aa64-fdt-offset.pl

diff --git a/Makefile.am b/Makefile.am
index 0178e5d..4efca15 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -100,10 +100,12 @@ if KERNEL_32
 MBOX_OFFSET	:= 0x7ff8
 TEXT_LIMIT	:= 0x3000
 KERNEL_OFFSET	:= 0x8000
+FDT_OFFSET	:= 0x08000000
 else
 MBOX_OFFSET	:= 0xfff8
 TEXT_LIMIT	:= 0x80000
 KERNEL_OFFSET	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/aa64-load-offset.pl $(KERNEL_IMAGE) $(TEXT_LIMIT))
+FDT_OFFSET	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/aa64-fdt-offset.pl $(KERNEL_IMAGE) $(KERNEL_OFFSET) 0x08000000)
 endif
 
 LD_SCRIPT	:= model.lds.S
@@ -113,11 +115,9 @@ FILESYSTEM_START:= $(shell echo $$(($(PHYS_OFFSET) + $(FS_OFFSET))))
 FILESYSTEM_SIZE	:= $(shell stat -Lc %s $(FILESYSTEM) 2>/dev/null || echo 0)
 FILESYSTEM_END	:= $(shell echo $$(($(FILESYSTEM_START) + $(FILESYSTEM_SIZE))))
 
-FDT_OFFSET	:= 0x08000000
-
 if XEN
 XEN		:= -DXEN=$(XEN_IMAGE)
-XEN_OFFSET	:= 0x08200000
+XEN_OFFSET	:= $(shell echo $$(($(FDT_OFFSET) + 0x00200000)))
 KERNEL_SIZE	:= $(shell stat -Lc %s $(KERNEL_IMAGE) 2>/dev/null || echo 0)
 DOM0_OFFSET	:= $(shell echo $$(($(PHYS_OFFSET) + $(KERNEL_OFFSET))))
 XEN_CHOSEN	:= xen,xen-bootargs = \"$(XEN_CMDLINE)\";		\
diff --git a/scripts/AA64Image.pm b/scripts/AA64Image.pm
index 8c441ec..3b22be6 100755
--- a/scripts/AA64Image.pm
+++ b/scripts/AA64Image.pm
@@ -84,4 +84,11 @@ sub get_load_offset
 	return $min + $offset;
 }
 
+sub get_size
+{
+	my $self = shift;
+
+	return  $self->{image_size};
+}
+
 1;
diff --git a/scripts/aa64-fdt-offset.pl b/scripts/aa64-fdt-offset.pl
new file mode 100644
index 0000000..a10f2a4
--- /dev/null
+++ b/scripts/aa64-fdt-offset.pl
@@ -0,0 +1,39 @@
+#!/usr/bin/perl -w
+# Find the FDT offset of an AArch64 Linux Image
+#
+# Usage: ./$0 <Image> <kernel-offset> <fallback-offset>
+#
+# Copyright (C) 2025 ARM Limited. All rights reserved.
+#
+# Use of this source code is governed by a BSD-style license that can be
+# found in the LICENSE.txt file.
+
+use warnings;
+use strict;
+
+use AA64Image;
+
+sub align{
+    my ($offset, $alignment) = @_;
+
+    return ($offset + $alignment - 1) & ~($alignment - 1);
+}
+
+my $filename = shift;
+die("No filename provided") unless defined($filename);
+
+my $kernel_offset = shift;
+$kernel_offset = oct($kernel_offset) if $kernel_offset =~ /^0/;
+
+my $fallback = shift;
+$fallback = oct($fallback) if $fallback =~ /^0/;
+
+open (my $fh, "<:raw", $filename) or die("Unable to open file '$filename'");
+
+my $image = AA64Image->parse($fh) or die("Unable to parse Image");
+
+my $image_size = $image->get_size();
+
+my $fdt_offset = ($image_size == 0) ? $fallback : align($image_size + $kernel_offset, 0x200000);
+
+printf("0x%08x\n", $fdt_offset);
-- 
2.34.1


