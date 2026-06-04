Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D155FCD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+SbulTiJWlvIk3jVLfJBqtlKmu5w1xAGHRbaSG4jXs=; b=hhh0O9qYcYQsgeN+oIYhG+mQbQ
	DhBWUlSfGtAFXpTJgXkYdVIV3uD4pVv15oTlavDxBiE9obqHWdApq3IRRl0papL3dIdLN79E1WuD6
	L8RytO86jF36JLtwHEYI8eCI3JHG2/tmaroErtFEDofKv4+bsv4o9CXZJXEjzD+Is/HIGEsfOx1tl
	DJHwJhSMs1LvnPkKSIQvZIqILcqaZwfym/gR7KcbDfYYVt0mEWWm+NR5rqMtJi7DDA5O5/6YE4bv5
	sCi4QKGazJjX31+0HeAhhzFSX/FvNSZgOd4Lom6BZY0jyJiXcapgtFqtPEkR1fPgNsMLcd7Hw2LNq
	WqJT46xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAs-0000000HEWJ-42wo;
	Thu, 04 Jun 2026 19:56:18 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAq-0000000HEVH-4APs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:56:18 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-137dbe27199so80112c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780602975; x=1781207775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+SbulTiJWlvIk3jVLfJBqtlKmu5w1xAGHRbaSG4jXs=;
        b=XJlNi5eV3awwJVtyA3R8eH30Zvl1ooVL+BIcdmfINm4C2AvwVXiEM67ogFJ2jkjb9N
         velZmi+bAt0mJnYTyIxOXqHbY0LTmL8jXJJRXDD/MTvkfk/O6ejGPSHy8s3MKA8HCjpz
         nIOFdsgKOxgMBQQ4HmDsCkMBVL7Nw/OM4vxz0r/TyCmhfnM+1vMnSqLmvP5M6c11yanx
         RnIFIOrOJpWIj2A6T0X/nl8DepBFXLXQ0klxA2hvRoka61WeSE13QMMpm/YxMM1pGuEF
         Uf9Z7ulPwiWNepYjYpS4XmKjXvxNucNoAGWL+enEUhMP8xsOagut1Jse+y643Gj01qu0
         e2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780602975; x=1781207775;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8+SbulTiJWlvIk3jVLfJBqtlKmu5w1xAGHRbaSG4jXs=;
        b=oEFFsK7Su0+IBMAn4qro/GDvqm5OJ9kiu4WCal5pNhzGt0A4OeWJglUYtGi3h2PHZ/
         8sLUuWF1ynKQplTXa4y0Vx6xkAnD3yPCfeJipXxvWaG6EFvDX866/HBOy+52H565x8KP
         E7qW28DE8Q2J8PGu/zssA3KFxJiEe64V4XXVQOYyanMVjWp9Ek/aeTRG6X8R8MpiB/6Y
         pvzM/nQaJcrGcO/wqYYTnDMQ6fp7EBCOq7SWPqNgvjzGEhiR4ilDHPlSj534wQh/pSHW
         6TdaB8RVrstTNO8Hv0KqtyDxHuD/jvmH++MsRfgPYGEX04vr2lbYBUUoCw9OVcc+9SgP
         Am2g==
X-Forwarded-Encrypted: i=1; AFNElJ8fMa7L2BphnSSd6x9WwUpNEaLggBDyiWOnigYDbgfg9ZKErtgXv13I8OL63tcXO+4Hk/T1D4aQ3ydJYJZNk5zG@lists.infradead.org
X-Gm-Message-State: AOJu0YwKfoKVx7a8YIZHUls1sJtv1d7HKZxskkOIMbfGTaoAm4+4wB2a
	YCgiJH1hvxrzjJFovAF67cl+suaMFVpS2hyQmarvwV6rxHGDJqZSO+vWliUO4N9RE2k2BQ==
X-Received: from dlbrp10.prod.google.com ([2002:a05:7022:160a:b0:137:e7d3:1490])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b99:b0:137:e532:f53f
 with SMTP id a92af1059eb24-1380672bf32mr266541c88.34.1780602975084; Thu, 04
 Jun 2026 12:56:15 -0700 (PDT)
Date: Thu,  4 Jun 2026 12:56:07 -0700
In-Reply-To: <20260604195612.3757860-1-xur@google.com>
Mime-Version: 1.0
References: <20260604195612.3757860-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604195612.3757860-2-xur@google.com>
Subject: [PATCH v4 1/2] kconfig: Remove the architecture specific config for AutoFDO
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
X-CRM114-CacheID: sfid-20260604_125617_039548_E8DD2B46 
X-CRM114-Status: GOOD (  18.32  )
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

The CONFIG_AUTOFDO_CLANG option currently depends on
ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.

Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
and avoids potential confusion.

Expand the AutoFDO documentation to include instructions for arm64.

Contributor acknowledgments:
  * SPE instructions: Daniel Hoekwater <hoekwater@google.com>
  * ETM instructions: Yabin Cui <yabinc@google.com>

Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Will Deacon <will@kernel.org>
Tested-by: Yabin Cui <yabinc@google.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 Documentation/dev-tools/autofdo.rst | 41 +++++++++++++++++++++++++++++
 arch/Kconfig                        |  4 ---
 arch/x86/Kconfig                    |  1 -
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/=
autofdo.rst
index bcf06e7d6ffa..ae03c4dfedc1 100644
--- a/Documentation/dev-tools/autofdo.rst
+++ b/Documentation/dev-tools/autofdo.rst
@@ -61,6 +61,9 @@ process consists of the following steps:
    the AutoFDO profile via offline tools.
=20
 The support requires a Clang compiler LLVM 17 or later.
+Current supported architectures include x86/x86_64 (via LBR) and
+arm64 (via SPE or ETM).
+
=20
 Preparation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -141,6 +144,35 @@ Here is an example workflow for AutoFDO kernel:
=20
       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N=
 -b -c <count> -o <perf_file> -- <loadtest>
=20
+   - For arm64 with SPE:
+
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
+      $ perf record -e ' arm_spe_0/branch_filter=3D1,load_filter=3D0,store=
_filter=3D0/'  -a -c <count> -N --no-switch-events -o <perf_file> -- <loadt=
est>
+
+   - For arm64 with ETM trace:
+
+     Follow the instructions in `Linaro OpenCSD document
+     <https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo=
/autofdo.md>`_
+     to record ETM traces for AutoFDO::
+
+      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadte=
st>
+      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di500009il
+
+     For ARM platforms running Android, follow the instructions in `Androi=
d simpleperf
+     document <https://android.googlesource.com/kernel/common/+/refs/heads=
/android-mainline/gki/aarch64/afdo>`_
+     to record ETM traces for AutoFDO::
+
+      $ simpleperf record -e cs-etm:k -a -o <etm_perf_file> -- <loadtest>
+      $ simpleperf inject -i <etm_perf_file> -o <text_perf_file> --symdir =
<vmlinux_dir>
+
 4) (Optional) Download the raw perf file to the host machine.
=20
 5) To generate an AutoFDO profile, two offline tools are available:
@@ -162,6 +194,15 @@ Here is an example workflow for AutoFDO kernel:
=20
       $ llvm-profdata merge -o <profile_file> <profile_1> <profile_2> ... =
<profile_n>
=20
+   For arm64 SPE, use the following command::
+
+      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file> --pr=
ofiler=3Dperf_spe --format=3Dextbinary --out=3D<profile_file>
+
+   For arm64 ETM, use the following command::
+
+      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<text_perf_file>=
 --profiler=3Dtext -format=3Dextbinary -out=3D<profile_file>
+
+
 6) Rebuild the kernel using the AutoFDO profile file with the same config =
as step 1,
    (Note CONFIG_AUTOFDO_CLANG needs to be enabled)::
=20
diff --git a/arch/Kconfig b/arch/Kconfig
index 0848932d1c8e..5e878924939a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -879,12 +879,8 @@ config LTO_CLANG_THIN_DIST
 	  module-specific compiler options, and simplifies debugging.
 endchoice
=20
-config ARCH_SUPPORTS_AUTOFDO_CLANG
-	bool
-
 config AUTOFDO_CLANG
 	bool "Enable Clang's AutoFDO build (EXPERIMENTAL)"
-	depends on ARCH_SUPPORTS_AUTOFDO_CLANG
 	depends on CC_IS_CLANG
 	help
 	  This option enables Clang=E2=80=99s AutoFDO build. When
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..10bf3984102e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -130,7 +130,6 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_RT
-	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
--=20
2.54.0.1032.g2f8565e1d1-goog


