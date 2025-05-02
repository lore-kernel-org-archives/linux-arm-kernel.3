Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDBAC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 19:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX5wR39LjacC93Bmc78Vfzcvbkj+SUvbwoit1IycWNU=; b=qgLxMO0wB2r5GTCTEae/+84BJA
	kFTe1vKFnN1CQ+jhnZZUL7TW79ys/1kvuSsiZeY73WB58vJoYDhem5ZrbqEaqMpml8pXGLDPtAZO9
	Z26FreiwjXMAAgcMYDftC/N5ooNGAE1TXrHpY29f4muswClqUlj2ZXxPQRvcd2lin9kHVXP4QM1Qs
	Mt9KWffmneYLJe30yYRRmS+desEQUa8OcPnxx5xguqDAPGl3lCmgt1SPTwPWhr1AtwW8H/vtG/5pT
	FKtIHOzf05bzvHTfNn7nQOhDU/vvGuWhiKWhk3W9n4yqqoxqeP67TxpZGRGB0lX8OhoZNwgQB0wDS
	4hAHomjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvoR-00000002quK-1MAE;
	Fri, 02 May 2025 19:12:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvdn-00000002p9J-3Wib;
	Fri, 02 May 2025 19:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hX5wR39LjacC93Bmc78Vfzcvbkj+SUvbwoit1IycWNU=; b=oCgUWw33LTC1K2bzoSSOMdy6HG
	bX7IbsrtTxdu3KpQwKuLgwAsRankRJQogiqqoLBV179kpcPKk58DzJ1nN6kckwBhym05FzA/t4yFb
	9HJUuLO+JBYYyqWxwj3nX+bV8I9Z5GB/ooy/az+uN2QxZ7lrxKr1beU4mzs5ZYJZi9bHNVz73SUvI
	di/ny/zvap6wtgheVs78qVX5t+oziYrsT+PaKZ3IbeUi2x7C40TG/Nx9evWkdpRQMPq13hhRIIncq
	dgXrx16UuqQNF4onlSZR1F/cXwfoaIsc4jYWAaRA/Rtt3IrNy7Gm1ec8hD32ReGk2gT46tfMRLz8a
	SUEXI28g==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAvdj-0000000F5XI-0Ucc;
	Fri, 02 May 2025 19:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBBD55C5CAB;
	Fri,  2 May 2025 18:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96854C4CEE4;
	Fri,  2 May 2025 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746212492;
	bh=T23nG4j/t8R/0j3qoaqTnBegm1hE55sMCs8bEgkfkMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XskH4lLHR/gzKOVgrwkXVdJ9tcwrV/12iQf3HIL+1SIOVwWhpSoK5IkDlScihb5jg
	 +5TYEkc/LXtc6o+3IqzIB4hXJZlcbRVIYJeDPjIFtoxrUhdNwjAdTPlTIOzNu3Q90n
	 l1ZpBp38NH+0tr3XdUjWJARD7b7WBYOyjH4B+ByrXq1dCgv5aijBlm5ig0TAoaMikM
	 19heALSMqLj29uAXit4LuKu1ACUlAEl4QPhsmRMPACGn1EsviLZaxkh6IDiwW/DqKE
	 rOyrVedQsjjVb1i34MHK3dU5epc8q81JphAbNXdHTmQtZmotjRTJiKw6ABNUJJouxf
	 S3OH7kFWVKVCg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: [PATCH RFC 3/4] stackleak: Split STACKLEAK_CFLAGS from GCC_PLUGINS_CFLAGS
Date: Fri,  2 May 2025 12:01:26 -0700
Message-Id: <20250502190129.246328-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502185834.work.560-kees@kernel.org>
References: <20250502185834.work.560-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5846; i=kees@kernel.org; h=from:subject; bh=T23nG4j/t8R/0j3qoaqTnBegm1hE55sMCs8bEgkfkMg=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmiYm0985ZPL8tL9j7QeF5dfLXQKaEXKszinZxbNO7FG HvMXX2go5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJlfxkZ7p7ujPW8PMHYrmTJ QnPBjkyu7pIXX6edPv1JZqlzjQPTHYY/HIvF3iRMfnLp6ZKpIo5GKTorNCf0GBx9eGzjYm2T6Ua OnAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_200139_546049_20C512E1 
X-CRM114-Status: GOOD (  11.52  )
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

In preparation for Clang stack depth tracking for stackleak, split the
stackleak-specific cflags out of GCC_PLUGINS_CFLAGS into
STACKLEAK_CFLAGS.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: <x86@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <sparclinux@vger.kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <linux-hardening@vger.kernel.org>
---
 arch/arm/vdso/Makefile          |  2 +-
 arch/arm64/kernel/vdso/Makefile |  1 +
 arch/sparc/vdso/Makefile        |  3 ++-
 arch/x86/entry/vdso/Makefile    |  3 ++-
 scripts/Makefile.gcc-plugins    | 11 ++++++-----
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index cb044bfd145d..92748e341b7d 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -26,7 +26,7 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 CFLAGS_REMOVE_vdso.o = -pg
 
 # Force -O2 to avoid libgcc dependencies
-CFLAGS_REMOVE_vgettimeofday.o = -pg -Os $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS)
+CFLAGS_REMOVE_vgettimeofday.o = -pg -Os $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(STACKLEAK_CFLAGS)
 ifeq ($(c-gettimeofday-y),)
 CFLAGS_vgettimeofday.o = -O2
 else
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 5e27e46aa496..fb17749b93cf 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -37,6 +37,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 # the CFLAGS to make possible to build the kernel with CONFIG_WERROR enabled.
 CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) \
+			$(STACKLEAK_CFLAGS) \
 			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
 			-Wmissing-prototypes -Wmissing-declarations
 
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index fdc4a8f5a49c..162a0235f41f 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -48,7 +48,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
 
 SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)
 
-$(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
+$(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(STACKLEAK_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
@@ -80,6 +80,7 @@ KBUILD_CFLAGS_32 := $(filter-out -mcmodel=medlow,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out -fno-pic,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(RANDSTRUCT_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS_32))
+KBUILD_CFLAGS_32 := $(filter-out $(STACKLEAK_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 += -m32 -msoft-float -fpic
 KBUILD_CFLAGS_32 += -fno-stack-protector
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 54d3e9774d62..cd5249b6ef84 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -62,7 +62,7 @@ ifneq ($(RETPOLINE_VDSO_CFLAGS),)
 endif
 endif
 
-$(vobjs): KBUILD_CFLAGS := $(filter-out $(PADDING_CFLAGS) $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
+$(vobjs): KBUILD_CFLAGS := $(filter-out $(PADDING_CFLAGS) $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(STACKLEAK_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 $(vobjs): KBUILD_AFLAGS += -DBUILD_VDSO
 
 #
@@ -124,6 +124,7 @@ KBUILD_CFLAGS_32 := $(filter-out -fno-pic,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out -mfentry,$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(RANDSTRUCT_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS_32))
+KBUILD_CFLAGS_32 := $(filter-out $(STACKLEAK_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS_32))
 KBUILD_CFLAGS_32 := $(filter-out $(CC_FLAGS_CFI),$(KBUILD_CFLAGS_32))
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index e3ed92e20d16..398b70e2d270 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -23,18 +23,19 @@ gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STRUCTLEAK)		\
 		+= -DSTRUCTLEAK_PLUGIN
 
 gcc-plugin-$(CONFIG_GCC_PLUGIN_STACKLEAK)	+= stackleak_plugin.so
-gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
+gcc-plugin-stackleak-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
 		+= -DSTACKLEAK_PLUGIN
-gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
+gcc-plugin-stackleak-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
 		+= -fplugin-arg-stackleak_plugin-track-min-size=$(CONFIG_STACKLEAK_TRACK_MIN_SIZE)
-gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
+gcc-plugin-stackleak-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
 		+= -fplugin-arg-stackleak_plugin-arch=$(SRCARCH)
-gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE)	\
+gcc-plugin-stackleak-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK_VERBOSE)	\
 		+= -fplugin-arg-stackleak_plugin-verbose
 ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+    STACKLEAK_CFLAGS = $(gcc-plugin-stackleak-cflags-y)
     DISABLE_STACKLEAK += -fplugin-arg-stackleak_plugin-disable
 endif
-export DISABLE_STACKLEAK
+export STACKLEAK_CFLAGS DISABLE_STACKLEAK
 
 gcc-plugin-$(CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK) += arm_ssp_per_task_plugin.so
 ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
-- 
2.34.1


