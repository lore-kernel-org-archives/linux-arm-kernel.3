Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78408CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO7C/hTiHHfCm4grTq/qAY8QsQX0UIGS/6vxTmf0q60=; b=zkPxZLRCGf/n4VhnomkKGWxcEt
	Bs5RZZKvk6VjstNpWZ3+qNMNQUZ5+F8D2IbdhsHr3z8I0y4Wdx1BiH4B/wFMTcX0YnQj03D7+C6Ee
	X2Dlf8MSnvX6V3V4eeu1bfHY8AqmTKH/Xz2PCdT8O/Eh7+61WPcYA2KqcynJHrMfRqU9YPa44cno/
	YF3GdOV8xXV8iHenRkswwtaU9rXLWYaG8FBJ0Q/ZwddvGfc6gKynEInfofciVeN7GYaOCxvKhUZMV
	OOm2I5gZ5JwgMfdjKcextnV4W4TgxHHxRMg/mB+HEcmH6ZSPYlaj6YDI0yYwgpRT2lsGCve6hTwzk
	+EPSNpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStrq-000000076IY-250i;
	Fri, 29 May 2026 09:51:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStrl-000000076H0-0SSu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:50:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F95D32E5;
	Fri, 29 May 2026 02:50:51 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DECCD3F905;
	Fri, 29 May 2026 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048256; bh=B2nQxup56rwo3ZyohDa4Z5GbMDSKBG12Z0RzJWNZEiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUtt28wN+majEzQAizEyr6D0zPyHbiA+kXjMCmTgD84BcI9k9bXHPFSc+qeKhGNqV
	 eDMlEPOp6t1470whm0EH9FzfxXjEhVGjZ4UsAGLC7yu1+LAilXlsiZnLb9tge+wOj5
	 AI+7xNqafREtHjM3jGb2ApoGTtoSoq+o5ohqktf4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	Sascha.Bischoff@arm.com
Subject: [BOOTWRAPPER PATCH v3 1/2] Introduce --with-gic option
Date: Fri, 29 May 2026 10:50:31 +0100
Message-Id: <20260529095032.48951-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260529095032.48951-1-vladimir.murzin@arm.com>
References: <20260529095032.48951-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_025057_222940_5853BD84 
X-CRM114-Status: UNSURE (   9.28  )
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

We are about to add support for another GIC version, so introduce a
new --with-gic option to select the desired GIC version at configure
time. The default remains v2, preserving existing behavior.  However,
for GICv3, we replace the previous --enable-gicv3 option with
--with-gic=v3 which is backward-incompatible change (yet I hope we can
live with that).

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 Makefile.am                |  8 +++++---
 common/{gic.c => gic-v2.c} |  0
 configure.ac               | 23 ++++++++++++++++-------
 3 files changed, 21 insertions(+), 10 deletions(-)
 rename common/{gic.c => gic-v2.c} (100%)

diff --git a/Makefile.am b/Makefile.am
index 0178e5d..2710494 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -87,15 +87,17 @@ GIC_DIST_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNE
 GIC_RDIST_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 1 'arm,gic-v3')
 DEFINES		+= -DGIC_DIST_BASE=$(GIC_DIST_BASE)
 DEFINES		+= -DGIC_RDIST_BASE=$(GIC_RDIST_BASE)
-COMMON_OBJ	+= gic-v3.o
-else
+endif
+
+if GICV2
 GIC_DIST_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 0 'arm,cortex-a15-gic')
 GIC_CPU_BASE	:= $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl $(KERNEL_DTB) 1 'arm,cortex-a15-gic')
 DEFINES		+= -DGIC_CPU_BASE=$(GIC_CPU_BASE)
 DEFINES		+= -DGIC_DIST_BASE=$(GIC_DIST_BASE)
-COMMON_OBJ	+= gic.o
 endif
 
+COMMON_OBJ	+= gic-$(GIC_VERSION).o
+
 if KERNEL_32
 MBOX_OFFSET	:= 0x7ff8
 TEXT_LIMIT	:= 0x3000
diff --git a/common/gic.c b/common/gic-v2.c
similarity index 100%
rename from common/gic.c
rename to common/gic-v2.c
diff --git a/configure.ac b/configure.ac
index 42858df..6f486c4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -139,12 +139,21 @@ AC_ARG_WITH([xen-cmdline],
 	[X_CMDLINE=$withval])
 AC_SUBST([XEN_CMDLINE], [$X_CMDLINE])
 
-# Allow a user to pass --enable-gicv3
-AC_ARG_ENABLE([gicv3],
-	AS_HELP_STRING([--enable-gicv3], [enable GICv3 instead of GICv2]),
-	[USE_GICV3=$enableval])
-AM_CONDITIONAL([GICV3], [test "x$USE_GICV3" = "xyes"])
-AS_IF([test "x$USE_GICV3" = "xyes"], [], [USE_GICV3=no])
+
+AC_ARG_WITH([gic],
+  AS_HELP_STRING([--with-gic={v2|v3}], [select GIC version]),
+  [GIC_VERSION=$withval],
+  [GIC_VERSION=v2])
+
+AS_CASE([$GIC_VERSION],
+  [v2|v3], [],
+  [AC_MSG_ERROR([Invalid GIC version: $GIC_VERSION (use v2 or v3)])])
+
+AC_SUBST([GIC_VERSION], [$GIC_VERSION])
+
+AM_CONDITIONAL([GICV2], [test "x$GIC_VERSION" = "xv2"])
+AM_CONDITIONAL([GICV3], [test "x$GIC_VERSION" = "xv3"])
+
 
 # Ensure that we have all the needed programs
 AC_PROG_CC
@@ -174,7 +183,7 @@ echo "  Device tree compiler:              ${DTC}"
 echo "  Linux kernel command line:         ${CMDLINE}"
 echo "  Embedded initrd:                   ${FILESYSTEM:-NONE}"
 echo "  Use PSCI?                          ${USE_PSCI}"
-echo "  Use GICv3?                         ${USE_GICV3}"
+echo "  GIC version:                       ${GIC_VERSION}"
 echo "  Boot-wrapper execution state:      AArch${BOOTWRAPPER_ES}"
 echo "  Kernel execution state:            AArch${KERNEL_ES}"
 echo "  Xen image                          ${XEN_IMAGE:-NONE}"
-- 
2.34.1


