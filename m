Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ACBCF885D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4vqF/Ty30cdd4Qflh5OL5QrwTCNYPWgE6mWnlGC9+4=; b=YHRNLbyFlhcevQzFvUbAjA9jq0
	/Q1Wa/xsEBswRAyTYeWEGLVSa/3fMcg3L07o9zOtJf4P/wPKBqruA5bXQjn1L/4emzMJQxVl15q+3
	GVHeNPes8dBopLBMph53vunXOGGRgC5kBZ/JIi+OlcDMa3VcZBGG6VuyCOsB1sWYScEvqg3cEp/W2
	dnpizIm0OMEy849eojnR3VlJhsYQg72QwNjslMz6ieTOAIBlG3V5Jg7Cx84CA+oHpYtaU1Wm54Urn
	LBI7U7CqdecEQVN+KynyJ7RMLCGVSyEBiRq1FEzAiLWkuP3TeLq+MGDXhUCZPP6jBffMfvRUnA7bz
	5/QzLKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBdM-00000007Mbb-19fE;
	Thu, 20 Nov 2025 20:52:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBdK-00000007Mb5-2SRL;
	Thu, 20 Nov 2025 20:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE71E440AA;
	Thu, 20 Nov 2025 20:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F48C4CEF1;
	Thu, 20 Nov 2025 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763671920;
	bh=/2MLYZFt2UK8yikPPD+7q2Ovh6jii1HpUvg+KerpW/s=;
	h=From:To:Cc:Subject:Date:From;
	b=pjPQ0z9Hs2ySC+uoLN3NFLrILTqXtCvDqFyqSfOAVl1MCOVCrsXUyNPLUAiYb0o8h
	 /3+kVk6iB1rfxBaDld9qmw++i5ZYtDrfDBusVWL5p7Y5k0BirMalh5YAhG7Zy+qH9+
	 EZeblU6urmxotwaEh75Nok9ViV7jYaQ0i7qUkh9UROx7+ZHo0nesFJTXEp/GpbIJ7u
	 /JIfoZ5fOl82GQZceIS2NGmBC0+rOKGg45m9ojUIptCuA6mTpC4NuT6JzwQ22gBFRS
	 hxqD7xPITEGMixxETVFLyCNWmTFUGwVofHg5WI5KqZdOfV2k4DHK7b0JR27Z+HMzGo
	 iv97OrLZWR4Fg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] kbuild: Support directory targets for building DTBs
Date: Thu, 20 Nov 2025 14:48:13 -0600
Message-ID: <20251120204812.1983452-4-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_125202_693230_05FB49CA 
X-CRM114-Status: GOOD (  13.24  )
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

It is useful to be able to build all the DTBs for a vendor. One can list
all the .dts files in a directory and convert those to %.dtb targets,
but that doesn't work for base+overlay DTB targets.

Adding the dts subdirectory is straight-forward, but building the
DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
%.dtbo, and the directory target(s)).

The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
but the directory target only depends on 'scripts' which depends on
'scripts_dtc'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Please ack and I'll take this in the DT tree.

I don't really like looking at MAKECMDGOALS, but that's the only way I
could come up with that works. Maybe someone knows a better way.

v2:
 - Convert arm, mips and riscv. The other DT enabled arches don't have 
   vendor directories.
 - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/ 

---
 Makefile              | 2 +-
 arch/arm/Kbuild       | 2 ++
 arch/arm64/Kbuild     | 2 ++
 arch/mips/Kbuild      | 2 ++
 arch/riscv/Kbuild     | 2 ++
 scripts/Makefile.dtbs | 3 +++
 6 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca716..85018d461575 100644
--- a/Makefile
+++ b/Makefile
@@ -1494,7 +1494,7 @@ export CHECK_DTBS=y
 endif
 
 ifneq ($(CHECK_DTBS),)
-dtbs_prepare: dt_binding_schemas
+scripts_dtc: dt_binding_schemas
 endif
 
 dtbs_check: dtbs
diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
index 69de6b6243c7..af7dd53585c3 100644
--- a/arch/arm/Kbuild
+++ b/arch/arm/Kbuild
@@ -10,5 +10,7 @@ obj-y				+= probes/
 obj-y				+= net/
 obj-y				+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..9e9820af48c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index e901bf554483..6125d00cdcef 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -21,5 +21,7 @@ ifdef CONFIG_KVM
 obj-y += kvm/
 endif
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index 126fb738fc44..3cf7f84eb287 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -7,5 +7,7 @@ obj-$(CONFIG_KVM) += kvm/
 
 obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 2d321b813600..4d0d164df275 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -14,7 +14,10 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
+ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGOALS)),)
 always-y        += $(dtb-y)
+endif
+
 targets         += $(real-dtb-y)
 
 # dtbs-list
-- 
2.51.0


