Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD5CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faQACawi8ZyxkQpSee/aQP+EiOFWCp1/ZOduWnEXuQs=; b=I5wG0l7hTzAivW054qf/YnvAJY
	1k5FABK9JMc/IgnVixnsqqyPknUNMZrf1c2ohkykRRn5ENqDDolNw0jljv/XZKLPquYsfkLQx3cdv
	DcyVSiRyXHcNVo1+/FR1GwuXx4lqMg+WuIx26I556a593PQfgGz7liMsYHLVWxycZxHilUZrcfi8f
	03ncSFQp/+S2171NJtOBOaBa2tizvWL2tqw3Me9/9BY9EzagOPdpZjbbcKBMvZqycdHfr5QEPAmre
	XOj060f17IQOZOiXyjCKeT/+kN8C91iBXu0pFAmLKeG5cENIbC1YcidwrlOkdzP7wlIcKV/Hy1X2B
	He7RxDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAx-0000000HEXr-0pOU;
	Thu, 04 Jun 2026 19:56:23 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAr-0000000HEVX-2CoH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:56:18 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-137dbe27199so80161c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780602976; x=1781207776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faQACawi8ZyxkQpSee/aQP+EiOFWCp1/ZOduWnEXuQs=;
        b=bceKvAnUSYwl9cEm9bg1L3uFzb2KE4BpntRIiKc51veK8E4Hkr8l6IAIecmXOh4tDY
         fgJc86sXHwYhG6zNixIWmtbIA8bjT4vj18/diPyBtA5WkRUwyLqeVfao/CBNo5YgKb8y
         Cv176T8Tk+yGh0BHk94PSFElu0XVODeiKZBjL3AFOcFYqaF7w6D+B3bR0Q1lLfM26kjH
         JACz+MedQyLypMQ4uW2VTv/X8Ey8wfbBB7W7vQy/0KP3PxaqAMkVFjLV+taC+NUH2cEx
         4wVto4V0si6tjRvp2tsLA2Vgai/ury8Isq2CBEmyn1pZQw0bDAqC4Zqs8RsGFm35WWkJ
         7Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780602976; x=1781207776;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=faQACawi8ZyxkQpSee/aQP+EiOFWCp1/ZOduWnEXuQs=;
        b=Fqn1Otl7oT54cRvErfCdDgdRj8zTZ5CV2w1XPIis0+aVLF6+12D3uSK5stiqgjspTQ
         tXnuw+vAUZluSutMGstFnDR0wybuJMfkk+42o+wagV1BCOhTJSDlKGYItCMurpzApCm6
         c0P5af+7kQT5bNIx6ORR0Vc+8HROxIzq3LkrdhjR8O0/qaIcH/gjj3QKiMZsofu0/Ma0
         z2EyB5/Z8ViQ653fSGp6vu0IlDyD1Ruwd7CAn8hEqSH2jZz5MPl2sg7OhFbPQ1W60s8B
         gRPKrlRF4+NSUBC24rV65ZL+PpaAWRFnoPqRwGtnpwNYvPgHGCZh7H8IgUG0K640cQJk
         iaFA==
X-Forwarded-Encrypted: i=1; AFNElJ+FmZxL823bCDKbOFWSm2hlcHlqNxERTf4wxKfeEiSNWms0M0uED0ByRulR6Ki2xX/Ge/TyCr+YCJrWgUikvjMI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EcVv+4Kh/0Ot9v014dUprPYbONzFfGYA/CYS9G/P1ZsLLy0d
	vc44AjqGGSuFAM8D97L66Ezej3doQgw6PU5tAjwLsHCPfOjDLddEOb0VfE+W49o6HBumJw==
X-Received: from dlbdm20.prod.google.com ([2002:a05:7022:6b94:b0:137:f72e:e889])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f9c:b0:138:576:fe
 with SMTP id a92af1059eb24-13806686d92mr251095c88.6.1780602975988; Thu, 04
 Jun 2026 12:56:15 -0700 (PDT)
Date: Thu,  4 Jun 2026 12:56:08 -0700
In-Reply-To: <20260604195612.3757860-1-xur@google.com>
Mime-Version: 1.0
References: <20260604195612.3757860-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604195612.3757860-3-xur@google.com>
Subject: [PATCH v4 2/2] kconfig: Remove the architecture specific config for Propeller
From: xur@google.com
To: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Rong Xu <xur@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_125617_578984_41C6863B 
X-CRM114-Status: GOOD (  18.97  )
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

From: Rong Xu <xur@google.com>

The CONFIG_PROPELLER_CLANG option currently depends on
ARCH_SUPPORTS_PROPELLER_CLANG, but this dependency seems unnecessary.

Remove ARCH_SUPPORTS_PROPELLER_CLANG and allow users to control
Propeller builds solely through CONFIG_PROPELLER_CLANG. This simplifies
the kconfig and avoids potential confusion.

Move the .llvm_bb_addr_map sections grouping to
include/asm-generic/vmlinux.lds.h.

The Propeller documentation has been updated to reflect the most
recent tool location and now includes instructions for arm64.

Contributor Acknowledgments:
  * SPE instructions: Daniel Hoekwater <hoekwater@google.com>

Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Will Deacon <will@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Yabin Cui <yabinc@google.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 Documentation/dev-tools/propeller.rst | 49 ++++++++++++++++++++-------
 arch/Kconfig                          |  5 +--
 arch/arm64/kernel/vmlinux.lds.S       |  1 +
 arch/x86/Kconfig                      |  1 -
 arch/x86/kernel/vmlinux.lds.S         |  5 +--
 include/asm-generic/vmlinux.lds.h     |  6 ++++
 6 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/Documentation/dev-tools/propeller.rst b/Documentation/dev-tool=
s/propeller.rst
index 92195958e3db..e927319941c9 100644
--- a/Documentation/dev-tools/propeller.rst
+++ b/Documentation/dev-tools/propeller.rst
@@ -28,8 +28,10 @@ A few important notes about adopting Propeller optimizat=
ion:
    and the linker(ld.lld).
=20
 #. In addition to LLVM toolchain, Propeller requires a profiling
-   conversion tool: https://github.com/google/autofdo with a release
-   after v0.30.1: https://github.com/google/autofdo/releases/tag/v0.30.1.
+   conversion tool: https://github.com/google/llvm-propeller.
+
+Current supported architectures include x86/X86_64 (via LBR),
+and arm64 (via SPE).
=20
 The Propeller optimization process involves the following steps:
=20
@@ -124,17 +126,30 @@ Here is an example workflow for building an AutoFDO+P=
ropeller kernel:
=20
       $ perf record --pfm-event RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N =
-b -c <count> -o <perf_file> -- <loadtest>
=20
-   Note you can repeat the above steps to collect multiple <perf_file>s.
+   - For arm64 with SPE::
+     There are a few kernel features that must be enabled to collect SPE p=
rofiles on Arm.
+     Below is a list of the required features:
+
+      - CONFIG_ARM_SPE_PMU=3Dy
+      - CONFIG_PID_IN_CONTEXTIDR=3Dy
+      - kpti=3Doff
+
+     Use the following command to generate SPE perf data file::
+
+      $ perf record -e 'arm_spe_0/branch_filter=3D1,load_filter=3D0,store_=
filter=3D0/' -a -N -c <count> --no-switch-events -o <perf_file> -- <loadtes=
t>
+
+     Note you can repeat the above steps to collect multiple <perf_file>s.
=20
 4) (Optional) Download the raw perf file(s) to the host machine.
=20
-5) Use the create_llvm_prof tool (https://github.com/google/autofdo) to
+5) Use the generate_propeller_profiles tool (https://github.com/google/llv=
m-propeller) to
    generate Propeller profile. ::
=20
-      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file>
-                         --format=3Dpropeller --propeller_output_module_na=
me
-                         --out=3D<propeller_profile_prefix>_cc_profile.txt
-                         --propeller_symorder=3D<propeller_profile_prefix>=
_ld_profile.txt
+      $ generate_propeller_profiles \
+             --binary=3D<vmlinux> --profile=3D<perf_file> \
+             --format=3Dpropeller --propeller_output_module_name \
+             --out=3D<propeller_profile_prefix>_cc_profile.txt \
+             --propeller_symorder=3D<propeller_profile_prefix>_ld_profile.=
txt
=20
    "<propeller_profile_prefix>" can be something like "/home/user/dir/any_=
string".
=20
@@ -146,10 +161,20 @@ Here is an example workflow for building an AutoFDO+P=
ropeller kernel:
    you can create a temp list file "<perf_file_list>" with each line
    containing one perf file name and run::
=20
-      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D@<perf_file_list=
>
-                         --format=3Dpropeller --propeller_output_module_na=
me
-                         --out=3D<propeller_profile_prefix>_cc_profile.txt
-                         --propeller_symorder=3D<propeller_profile_prefix>=
_ld_profile.txt
+      $ generate_propeller_profiles \
+             --binary=3D<vmlinux> --profile=3D@<perf_file_list> \
+             --format=3Dpropeller --propeller_output_module_name \
+             --out=3D<propeller_profile_prefix>_cc_profile.txt \
+             --propeller_symorder=3D<propeller_profile_prefix>_ld_profile.=
txt
+
+   For arm64 SPE, add the option '--profiler=3Dperf_spe', like::
+
+      $ generate_propeller_profiles  \
+             --binary=3D<vmlinux> --profile=3D<perf_file> \
+             --profiler=3Dperf_spe \
+             --format=3Dpropeller --propeller_output_module_name \
+             --out=3D<propeller_profile_prefix>_cc_profile.txt \
+             --propeller_symorder=3D<propeller_profile_prefix>_ld_profile.=
txt
=20
 6) Rebuild the kernel using the AutoFDO and Propeller
    profiles. ::
diff --git a/arch/Kconfig b/arch/Kconfig
index 5e878924939a..99c2017eb515 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -895,13 +895,10 @@ config AUTOFDO_CLANG
=20
 	  If unsure, say N.
=20
-config ARCH_SUPPORTS_PROPELLER_CLANG
-	bool
-
 config PROPELLER_CLANG
 	bool "Enable Clang's Propeller build"
-	depends on ARCH_SUPPORTS_PROPELLER_CLANG
 	depends on CC_IS_CLANG && CLANG_VERSION >=3D 190000
+	depends on $(cc-option,-fbasic-block-sections=3Dlist=3D/dev/null)
 	help
 	  This option enables Clang=E2=80=99s Propeller build. When the Propeller
 	  profiles is specified in variable CLANG_PROPELLER_PROFILE_PREFIX
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.ld=
s.S
index e1ac876200a3..8aaf404980a7 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -368,6 +368,7 @@ SECTIONS
=20
 	STABS_DEBUG
 	DWARF_DEBUG
+	PROPELLER_DATA
 	MODINFO
 	ELF_DETAILS
=20
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 10bf3984102e..b875d2f27e48 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -130,7 +130,6 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
-	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
 	select ARCH_USE_MEMTEST
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 4711a35e706c..74e336d7f9dd 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -423,10 +423,7 @@ SECTIONS
=20
 	STABS_DEBUG
 	DWARF_DEBUG
-#ifdef CONFIG_PROPELLER_CLANG
-	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
-#endif
-
+	PROPELLER_DATA
 	MODINFO
 	ELF_DETAILS
=20
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index 60c8c22fd3e4..5659f4b5a125 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1011,6 +1011,12 @@
 #define PERCPU_DECRYPTED_SECTION
 #endif
=20
+#ifdef CONFIG_PROPELLER_CLANG
+#define PROPELLER_DATA                                                    =
 \
+	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
+#else
+#define PROPELLER_DATA
+#endif
=20
 /*
  * Default discarded sections.
--=20
2.54.0.1032.g2f8565e1d1-goog


