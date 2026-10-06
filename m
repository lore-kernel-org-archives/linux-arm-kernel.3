Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79E3CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQD20lCgZQIc7HIXy2+Q5Tq/Yl/QbJRHei1woFJs40w=; b=GVbkJs9+jaQ951dfVfmeKLb8xB
	1OVPRrlOwDcqSl2LfZSqCCVELqUo034LcpEZJeUwuwyfSlBKTUbzXbypIdUkpPF1HV/ScxkEcHcoW
	bfeGfeVqvHpsxngDBGelWsoRhIB+dscGAJWifyIL89fmaAa7UDG/oRN54dF5Z8HbJYAsnjc68CJIx
	VyVlIJQhYh7k4cxICcC7dguVE4Vwgo7GMQfTtPdpgxb+7ZOMQcaBr/xPgTib20n54P2M9nSdrYgjQ
	eNk6MO8OV/AexMD9WWn41nzN/BBtUqeEeKEtHKoiwrtLdrogz8WK20yMUcnSa+gI9zAv7hkwQgjpP
	A0OgUYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUh-00000001RP9-3rwL;
	Tue, 06 Oct 2026 22:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDUW-00000001RLn-43ue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:18:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D059C15A1;
	Tue,  6 Oct 2026 15:18:26 -0700 (PDT)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB9453F66F;
	Tue,  6 Oct 2026 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791325110; bh=fYd+ZgGcjjbOpEQfH2CwcKiMTrSZUa4AV4L2gsdp5PA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRraBkPsnTOuIN8dTICkVAToowKbzgFM5SndvHM5LGFaa5F76muC/rmV04iUz+V5/
	 O5wwD9njsMO6ZhisOZeOBibFeUooWAwovDpdewRDfbstNKumfIBBP/1qviiAbkXMsU
	 DAYo8yb54Cg/2VuDFlGOwkGa7daDIBwMmV/EZM+w=
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	broonie@kernel.org,
	jpoimboe@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	atomlin@atomlin.com,
	ndesaulniers@google.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	ardb@kernel.org,
	Emanuele.Rocca@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 2/3] kbuild: modules: Build and trigger BTI scanner for arm64
Date: Tue,  6 Oct 2026 17:18:14 -0500
Message-ID: <20261006221815.2823252-3-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20261006221815.2823252-1-jeremy.linton@arm.com>
References: <20261006221815.2823252-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_151833_124054_44670005 
X-CRM114-Status: UNSURE (   9.87  )
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

Now that we have a utility which can detect and correct missing
landing pads, build it and hook it up to scan during module
finalization.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 scripts/Makefile          |  3 +++
 scripts/Makefile.modfinal | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 3434a82a119f..10042d5d1251 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -8,6 +8,7 @@ hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
+hostprogs-always-$(CONFIG_ARM64_BTI_KERNEL)		+= module-bti-check
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
@@ -32,6 +33,8 @@ rustdoc_test_gen-rust := y
 HOSTCFLAGS_tracepoint-update.o = -I$(srctree)/tools/include
 HOSTCFLAGS_elf-parse.o = -I$(srctree)/tools/include
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
+HOSTCFLAGS_module-bti-check.o = -I$(srctree)/tools/include
+HOSTLDLIBS_module-bti-check = -lelf
 HOSTLDLIBS_sorttable = -lpthread
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b9..973adfa72a7d 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -32,6 +32,12 @@ ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
 endif
 
+ifdef CONFIG_ARM64_BTI_KERNEL
+quiet_cmd_bti_check = BTICHECK [M] $@
+      cmd_bti_check = $(objtree)/scripts/module-bti-check --fix $(KBUILD_MODULE_BTI_CHECK_FLAGS) $@
+bti_check_dep = $(objtree)/scripts/module-bti-check
+endif
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
@@ -47,8 +53,12 @@ quiet_cmd_btf_ko = BTF [M] $@
 	fi;
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(bti_check_dep) $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed,ld_ko_o)
+ifdef CONFIG_ARM64_BTI_KERNEL
+	+$(call cmd,bti_check)
+endif
+
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
-- 
2.55.0


