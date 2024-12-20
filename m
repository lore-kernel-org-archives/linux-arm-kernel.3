Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F5FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFu6Fkzlh6ZZ82PVD4MAVzS9pk6Swn6r/Oqb30qF0rs=; b=J31H11AlaA2eI2cFqMtHLmglMP
	+6AcCCx+EIOcxhnzC5FZDnj6qa+MVqQt+U1km6+1Y1RzTZCIXYmakzuU8o8DdrvpIQW6sZKb/fRyE
	zEmLevxy6oWIHJaP+zsfXRXg8FRfomjRjeatysIPiy8cySFumvjpgOnljjRiCAQBWMv5+VEar35wO
	Ng2cpT+n3M7qfnEO75Axtgpp5RN4YJ9nARsr5m6mu8nBv4xuZBMr8qFJSRZCTZdCOI2YbJrlePLwl
	ZZMc2Ge/6cBqmsS0g2k/ucHrTJ6nQYtWSgACT7FOkpnfz+xca+oHklF3g3BXG2JmY1dHgqQIAa4+8
	y87U7XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgRs-00000005Z5y-2X3M;
	Fri, 20 Dec 2024 17:06:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgE0-00000005VyH-0fLI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEBA8A42016;
	Fri, 20 Dec 2024 16:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E640FC4CEDE;
	Fri, 20 Dec 2024 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713499;
	bh=7OCb0PhrPXhOe9yy7xz5wCwKFvJttcECxrueTTUU5Bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YaL3HkwitvdguEJtZx4peZ1nnd94NuDI3EO0yV7lLCtKtqCmnzmDyigmbwEf1rw7G
	 rSxF63rZe5Ln56L6AQlL9DdFf3pRla/QIQLVKv/0oDJWkDjUQWSPU+qMF/J/rCbxJ8
	 4/a0CUYdUmRnsacXDXcu0viadw+w6VSfMNLbai+pAUnNh7uqZdUFC2eac3rj5W+jn9
	 YiUQSWsoW1SNLgJUBgGsvpyYvFWgqpndmbFg2uecCOV7keCtK9M0yLcrwpda6cucQt
	 Glphl0JKT3v9Tz9XlRTGkvZ8gVAVMCFrwmxhYUj5kYH3d9rdM3UAoBASZIFJGPhYGb
	 X+ncROwd55qGQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:36 +0000
Subject: [PATCH RFC v3 11/27] KVM: arm64: Document the KVM ABI for SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-11-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=13316; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7OCb0PhrPXhOe9yy7xz5wCwKFvJttcECxrueTTUU5Bg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBdRNgLlQWYZwBMDz7K3tsDc9TPCzzl8Tlf9+1u
 S2tdtiqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgXQAKCRAk1otyXVSH0My0B/
 9OvwJoLIfGU3NdiiBhPEcW9W2PNUpf6MX7v6I+6kVucr/Rr4rLSan0l/BUU8rt5h3Wz7z73XgEV5Yn
 HrYIA6KpgALLDcuX6N8zMqfuUrq7Nqh0G66EAndhENfxcnIJkHVMRSBZCBDk5aWDKaG8ZEpHIsL2Z9
 SKgc2D0WWbbyXPxkZ+Fvecz44pJOss5Wv8MXIXTVLlSA6mxtDcAK0wjjpsp8JcRYbqCpgjdkTD2r5K
 UPaePDsXJ4SEF2jkgDzvxUj7AKakFotr1xskAwiWkn+qYBc7JuW0Hb97qwTiDiPJRP9okX8wLVe0bK
 DMe4nGrJE9wcIkkrqg8Eu9IJBboDMH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085140_333741_B3A3A24D 
X-CRM114-Status: GOOD (  33.26  )
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

SME, the Scalable Matrix Extension, is an arm64 extension which adds
support for matrix operations, with core concepts patterned after SVE.

SVE introduced some complication in the ABI since it adds new vector
floating point registers with runtime configurable size, the size being
controlled by a prameter called the vector length (VL). To provide control
of this to VMMs we offer two phase configuration of SVE, SVE must first be
enabled for the vCPU with KVM_ARM_VCPU_INIT(KVM_ARM_VCPU_SVE), after which
vector length may then be configured but the configurably sized floating
point registers are inaccessible until finalized with a call to
KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE) after which the configurably sized
registers can be accessed.

SME introduces an additional independent configurable vector length
which as well as controlling the size of the new ZA register also
provides an alternative view of the configurably sized SVE registers
(known as streaming mode) with the guest able to switch between the two
modes as it pleases.  There is also a fixed sized register ZT0
introduced in SME2. As well as streaming mode the guest may enable and
disable ZA and (where SME2 is available) ZT0 dynamically independently
of streaming mode. These modes are controlled via the system register
SVCR.

We handle the configuration of the vector length for SME in a similar
manner to SVE, requiring initialization and finalization of the feature
with a pseudo register controlling the available SME vector lengths as for
SVE. Further, if the guest has both SVE and SME then finalizing one
prevents further configuration of the vector length for the other.

Where both SVE and SME are configured for the guest we always present
the SVE registers to userspace as having the larger of the configured
maximum SVE and SME vector lengths, discarding extra data at load time
and zero padding on read as required if the active vector length is
lower. Note that this means that enabling or disabling streaming mode
while the guest is stopped will not zero Zn or Pn as it will when the
guest is running, but it does allow SVCR, Zn and Pn to be read and
written in any order.

Userspace access to ZA and (if configured) ZT0 is always available, they
will be zeroed when the guest runs if disabled in SVCR and the value
read will be zero if the guest stops with them disabled. This mirrors
the behaviour of the architecture, enabling access causes ZA and ZT0 to
be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
any order.

If SME is enabled for a guest without SVE then the FPSIMD Vn registers
must be accessed via the low 128 bits of the SVE Zn registers as is the
case when SVE is enabled. This is not ideal but allows access to SVCR and
the registers in any order without duplication or ambiguity about which
values should take effect. This may be an issue for VMMs that are
unaware of SME on systems that implement it without SVE if they let SME
be enabled, the lack of access to Vn may surprise them, but it seems
like an unusual implementation choice.

For SME unware VMMs on systems with both SVE and SME support the SVE
registers may be larger than expected, this should be less disruptive
than on a system without SVE as they will simply ignore the high bits of
the registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/virt/kvm/api.rst | 117 +++++++++++++++++++++++++++++------------
 1 file changed, 82 insertions(+), 35 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e5b994ee1f68502d8fdf55cf6700a..1d9270f8492392d9142cc38abe5a25cf5ab5f7d6 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -406,7 +406,7 @@ Errors:
              instructions from device memory (arm64)
   ENOSYS     data abort outside memslots with no syndrome info and
              KVM_CAP_ARM_NISV_TO_USER not enabled (arm64)
-  EPERM      SVE feature set but not finalized (arm64)
+  EPERM      SVE or SME feature set but not finalized (arm64)
   =======    ==============================================================
 
 This ioctl is used to run a guest virtual cpu.  While there are no
@@ -2580,12 +2580,12 @@ Specifically:
   0x6020 0000 0010 00d5 FPCR        32  fp_regs.fpcr
 ======================= ========= ===== =======================================
 
-.. [1] These encodings are not accepted for SVE-enabled vcpus.  See
-       :ref:`KVM_ARM_VCPU_INIT`.
+.. [1] These encodings are not accepted for SVE enabled vcpus.  See
+       :ref:`KVM_ARM_VCPU_INIT`.  They are also not accepted when SME is
+       enabled without SVE and the vcpu is in streaming mode.
 
        The equivalent register content can be accessed via bits [127:0] of
-       the corresponding SVE Zn registers instead for vcpus that have SVE
-       enabled (see below).
+       the corresponding SVE Zn registers in these cases (see below).
 
 arm64 CCSIDR registers are demultiplexed by CSSELR value::
 
@@ -2616,24 +2616,34 @@ arm64 SVE registers have the following bit patterns::
   0x6050 0000 0015 060 <slice:5>        FFR bits[256*slice + 255 : 256*slice]
   0x6060 0000 0015 ffff                 KVM_REG_ARM64_SVE_VLS pseudo-register
 
-Access to register IDs where 2048 * slice >= 128 * max_vq will fail with
-ENOENT.  max_vq is the vcpu's maximum supported vector length in 128-bit
-quadwords: see [2]_ below.
+arm64 SME registers have the following bit patterns:
+
+  0x6080 0000 0017 00 <n:5> <slice:5>   ZA.H[n] bits[2048*slice + 2047 : 2048*slice]
+  0x60XX 0000 0017 0100                 ZT0
+  0x6060 0000 0017 fffe                 KVM_REG_ARM64_SME_VLS pseudo-register
+
+Access to Z, P or ZA register IDs where 2048 * slice >= 128 * max_vq
+will fail with ENOENT.  max_vq is the vcpu's maximum supported vector
+length in 128-bit quadwords: see [2]_ below.
+
+Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
+to 1.
 
 These registers are only accessible on vcpus for which SVE is enabled.
 See KVM_ARM_VCPU_INIT for details.
 
-In addition, except for KVM_REG_ARM64_SVE_VLS, these registers are not
-accessible until the vcpu's SVE configuration has been finalized
-using KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE).  See KVM_ARM_VCPU_INIT
-and KVM_ARM_VCPU_FINALIZE for more information about this procedure.
+In addition, except for KVM_REG_ARM64_SVE_VLS and
+KVM_REG_ARM64_SME_VLS, these registers are not accessible until the
+vcpu's SVE and SME configuration has been finalized using
+KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC).  See KVM_ARM_VCPU_INIT and
+KVM_ARM_VCPU_FINALIZE for more information about this procedure.
 
-KVM_REG_ARM64_SVE_VLS is a pseudo-register that allows the set of vector
-lengths supported by the vcpu to be discovered and configured by
-userspace.  When transferred to or from user memory via KVM_GET_ONE_REG
-or KVM_SET_ONE_REG, the value of this register is of type
-__u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the set of vector lengths as
-follows::
+KVM_REG_ARM64_SVE_VLS and KVM_ARM64_VCPU_SME_VLS are pseudo-registers
+that allows the set of vector lengths supported by the vcpu to be
+discovered and configured by userspace.  When transferred to or from
+user memory via KVM_GET_ONE_REG or KVM_SET_ONE_REG, the value of this
+register is of type __u64[KVM_ARM64_SVE_VLS_WORDS], and encodes the
+set of vector lengths as follows::
 
   __u64 vector_lengths[KVM_ARM64_SVE_VLS_WORDS];
 
@@ -2645,19 +2655,25 @@ follows::
 	/* Vector length vq * 16 bytes not supported */
 
 .. [2] The maximum value vq for which the above condition is true is
-       max_vq.  This is the maximum vector length available to the guest on
-       this vcpu, and determines which register slices are visible through
-       this ioctl interface.
+       max_vq.  This is the maximum vector length currently available to
+       the guest on this vcpu, and determines which register slices are
+       visible through this ioctl interface.
+
+       If SME is supported then the max_vq used for the Z and P registers
+       then while SVCR.SM is 1 this vector length will be the maximum SME
+       vector length available for the guest, otherwise it will be the
+       maximum SVE vector length available.
 
 (See Documentation/arch/arm64/sve.rst for an explanation of the "vq"
 nomenclature.)
 
-KVM_REG_ARM64_SVE_VLS is only accessible after KVM_ARM_VCPU_INIT.
-KVM_ARM_VCPU_INIT initialises it to the best set of vector lengths that
-the host supports.
+KVM_REG_ARM64_SVE_VLS and KVM_REG_ARM_SME_VLS are only accessible
+after KVM_ARM_VCPU_INIT.  KVM_ARM_VCPU_INIT initialises them to the
+best set of vector lengths that the host supports.
 
-Userspace may subsequently modify it if desired until the vcpu's SVE
-configuration is finalized using KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE).
+Userspace may subsequently modify these registers if desired until the
+vcpu's SVE and SME configuration is finalized using
+KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC).
 
 Apart from simply removing all vector lengths from the host set that
 exceed some value, support for arbitrarily chosen sets of vector lengths
@@ -2665,8 +2681,8 @@ is hardware-dependent and may not be available.  Attempting to configure
 an invalid set of vector lengths via KVM_SET_ONE_REG will fail with
 EINVAL.
 
-After the vcpu's SVE configuration is finalized, further attempts to
-write this register will fail with EPERM.
+After the vcpu's SVE or SME configuration is finalized, further
+attempts to write these registers will fail with EPERM.
 
 arm64 bitmap feature firmware pseudo-registers have the following bit pattern::
 
@@ -3449,6 +3465,7 @@ The initial values are defined as:
 	- General Purpose registers, including PC and SP: set to 0
 	- FPSIMD/NEON registers: set to 0
 	- SVE registers: set to 0
+	- SME registers: set to 0
 	- System registers: Reset to their architecturally defined
 	  values as for a warm reset to EL1 (resp. SVC)
 
@@ -3491,7 +3508,7 @@ Possible features:
 
 	- KVM_ARM_VCPU_SVE: Enables SVE for the CPU (arm64 only).
 	  Depends on KVM_CAP_ARM_SVE.
-	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
+	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
 
 	   * After KVM_ARM_VCPU_INIT:
 
@@ -3499,7 +3516,7 @@ Possible features:
 	        initial value of this pseudo-register indicates the best set of
 	        vector lengths possible for a vcpu on this host.
 
-	   * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
+	   * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC}):
 
 	      - KVM_RUN and KVM_GET_REG_LIST are not available;
 
@@ -3512,11 +3529,40 @@ Possible features:
 	        KVM_SET_ONE_REG, to modify the set of vector lengths available
 	        for the vcpu.
 
-	   * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_SVE):
+	   * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
 
 	      - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
 	        no longer be written using KVM_SET_ONE_REG.
 
+	- KVM_ARM_VCPU_SME: Enables SME for the CPU (arm64 only).
+	  Depends on KVM_CAP_ARM_SME.
+	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
+
+	   * After KVM_ARM_VCPU_INIT:
+
+	      - KVM_REG_ARM64_SME_VLS may be read using KVM_GET_ONE_REG: the
+	        initial value of this pseudo-register indicates the best set of
+	        vector lengths possible for a vcpu on this host.
+
+	   * Before KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC}):
+
+	      - KVM_RUN and KVM_GET_REG_LIST are not available;
+
+	      - KVM_GET_ONE_REG and KVM_SET_ONE_REG cannot be used to access
+	        the scalable architectural SVE registers
+	        KVM_REG_ARM64_SVE_ZREG(), KVM_REG_ARM64_SVE_PREG() or
+	        KVM_REG_ARM64_SVE_FFR, the matrix register
+		KVM_REG_ARM64_SME_ZA() or the LUT register KVM_REG_ARM64_ZT();
+
+	      - KVM_REG_ARM64_SME_VLS may optionally be written using
+	        KVM_SET_ONE_REG, to modify the set of vector lengths available
+	        for the vcpu.
+
+	   * After KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_VEC):
+
+	      - the KVM_REG_ARM64_SME_VLS pseudo-register is immutable, and can
+	        no longer be written using KVM_SET_ONE_REG.
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
@@ -5086,11 +5132,12 @@ Errors:
 
 Recognised values for feature:
 
-  =====      ===========================================
-  arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
-  =====      ===========================================
+  =====      ==============================================================
+  arm64      KVM_ARM_VCPU_VEC (requires KVM_CAP_ARM_SVE or KVM_CAP_ARM_SME)
+  arm64      KVM_ARM_VCPU_SVE (alias for KVM_ARM_VCPU_VEC)
+  =====      ==============================================================
 
-Finalizes the configuration of the specified vcpu feature.
+Finalizes the configuration of the specified vcpu features.
 
 The vcpu must already have been initialised, enabling the affected feature, by
 means of a successful :ref:`KVM_ARM_VCPU_INIT <KVM_ARM_VCPU_INIT>` call with the

-- 
2.39.5


