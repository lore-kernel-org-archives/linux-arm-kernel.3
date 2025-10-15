Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A15CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6iQ4bGAW3hVwhDhM1K9v9cO0n2X54ygS1xeHOOyf60=; b=tdKr7HfNxj2WUncx5jcdG/em4w
	HkMcnmbpVUS2xkIO1GYmDFuG+MOFBOqquZ9pT4TwKeFSpH35i2o4DHM5b+VBRXO8HMQ0dYjj7aKS/
	CSxF2ljm+NiR2m/PX0ISk2s18u6tOKRTY08/ReeVgIAl7DuFU+wrA/POW9xeL4gz8MOw7A2BGhmU8
	hKcSRBXFIHaRhUYznz81zMcYAQgbp80WA1ZVj3lBg0tgIN/DN2kKo/Mek/sWNe5BwVYNxpyThtdIz
	ywfaLSMc5jbR1vAJOm1+JhzQPUp4tAi2kbH2drNkFNredxMo8RvC6RRQzFtVwPlVWhFJi/sEBL6t2
	k9xkWWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96K7-00000002cXw-2CLQ;
	Wed, 15 Oct 2025 18:34:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96K4-00000002cVr-2Mto
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91BB44A3DD;
	Wed, 15 Oct 2025 18:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECE7C113D0;
	Wed, 15 Oct 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553243;
	bh=+Javi/lDPly3WQ7PYApd6wyA1S6AX6Lvw7kx1jlRpzI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OLCrSsBLhmEjVYhn7LiDSt/I3R80NdRN+j2tkSFgxdhT5P5Vy7cyXB5rA3zTZmI1n
	 s/BBh3PFfdw+Iovi8sQCjnzJl47GrqwK3qh2WIDTyRl4eX40gmwD5IzNqVh9kiRTk7
	 gIDxr7UsEH0njWZFfxA7i7K2EfRmsBtYgRqYAI780O0yti0ONIYLs28mvE4ENRLCpH
	 cRandzo1/U6JpmYPz6HzxBBvYP+4ECYD/c6AECYr3OPV6f9I1z9RA+1TptFqp1na2q
	 12qKYa8g7+8FOjrOBgXSDKi0m7jvYNPgpFbOXbsBGFQIYAgcTt0BGNkR2ESPgKEnVj
	 VGQd6Y9KesZmw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Oct 2025 18:56:36 +0100
Subject: [PATCH v2 1/3] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm64-sme-ptrace-sme-only-v2-1-33c7b2f27cbf@kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 David Spickett <david.spickett@arm.com>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Luis Machado <luis.machado.foss@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-2a268
X-Developer-Signature: v=1; a=openpgp-sha256; l=5057; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+Javi/lDPly3WQ7PYApd6wyA1S6AX6Lvw7kx1jlRpzI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBo7+kTNgWoU2oobNiqUbUdxjB07TnaJTjotU7lQ
 N0SOVhh5giJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaO/pEwAKCRAk1otyXVSH
 0K21B/9azbP3GezwJs599o1Jg6RV+tXCfIexZiEGLp7NyRvGtF+FvhYQQnd++R1JKGs2dLnWnE1
 GaJr/2/icMcBiVHubdm45Ao+wrpSYpV/ItmQMXTcyMLEoWAKbuPYI4UI4NKGYKW2s00wngKI+8F
 l9LlU7nOi+Syna5Q54wLpR01noq4g0yiSLgQlfq155icLUaxRTwd0pSBbOBDoknL4MbahuaS0xb
 ucZ6Kr/5CVPT1Y4RGzFfXJawByYClnOWS/oXY78pXUF7B80hXML/TlfcWfJZDhbzNoucqZMc2sU
 rCT6XvTpUzvKggMsyLo282uDA2Sc4NZl8uZgBHyRB2KNlMay
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_113404_667752_F5F2B9C5 
X-CRM114-Status: GOOD (  29.30  )
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

Currently it is not possible to disable streaming mode via ptrace on SME
only systems, the interface for doing this is to write via NT_ARM_SVE but
such writes will be rejected on a system without SVE support. Enable this
functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
writes currently error since we require that a vector length is specified
which should minimise the risk that existing software is relying on current
behaviour.

Reads are not supported since I am not aware of any use case for this and
there is some risk that an existing userspace application may be confused if
it reads NT_ARM_SVE on a system without SVE. Existing kernels will return
FPSIMD formatted register state from NT_ARM_SVE if full SVE state is not
stored, for example if the task has not used SVE. Returning a vector length
of 0 would create a risk that software would try to do things like allocate
space for register state with zero sizes, while returning a vector length of
128 bits would look like SVE is supported. It seems safer to just not make
the changes to add read support.

It remains possible for userspace to detect a SME only system via the ptrace
interface only since reads of NT_ARM_SSVE and NT_ARM_ZA will succeed while
reads of NT_ARM_SVE will fail. Read/write access to the FPSIMD registers in
non-streaming mode is available via REGSET_FPR.

sve_set_common() already avoids allocating SVE storage when doing a FPSIMD
formatted write and allocating SME storage when doing a NT_ARM_SVE write so
we change the function to validate the new case and skip setting a vector
length for it.

The aim is to make a minimally invasive change, no operation that would
previously have succeeded will be affected, and we use a previously
defined interface in new circumstances rather than define completely new
ABI.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/sve.rst |  5 +++++
 arch/arm64/kernel/ptrace.c       | 40 +++++++++++++++++++++++++++++++++-------
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/arm64/sve.rst b/Documentation/arch/arm64/sve.rst
index 28152492c29c..a61c9d0efe4d 100644
--- a/Documentation/arch/arm64/sve.rst
+++ b/Documentation/arch/arm64/sve.rst
@@ -402,6 +402,11 @@ The regset data starts with struct user_sve_header, containing:
   streaming mode and any SETREGSET of NT_ARM_SSVE will enter streaming mode
   if the target was not in streaming mode.
 
+* On systems that do not support SVE it is permitted to use SETREGSET to
+  write SVE_PT_REGS_FPSIMD formatted data via NT_ARM_SVE, in this case the
+  vector length should be specified as 0. This allows streaming mode to be
+  disabled on systems with SME but not SVE.
+
 * If any register data is provided along with SVE_PT_VL_ONEXEC then the
   registers data will be interpreted with the current vector length, not
   the vector length configured for use on exec.
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4b001121c72d..b9bdd83fbbca 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -912,13 +912,39 @@ static int sve_set_common(struct task_struct *target,
 		return -EINVAL;
 
 	/*
-	 * Apart from SVE_PT_REGS_MASK, all SVE_PT_* flags are consumed by
-	 * vec_set_vector_length(), which will also validate them for us:
+	 * On systems without SVE we accept FPSIMD format writes with
+	 * a VL of 0 to allow exiting streaming mode, otherwise a VL
+	 * is required.
 	 */
-	ret = vec_set_vector_length(target, type, header.vl,
-		((unsigned long)header.flags & ~SVE_PT_REGS_MASK) << 16);
-	if (ret)
-		return ret;
+	if (header.vl) {
+		/*
+		 * If the system does not support SVE we can't
+		 * configure a SVE VL.
+		 */
+		if (!system_supports_sve() && type == ARM64_VEC_SVE)
+			return -EINVAL;
+
+		/*
+		 * Apart from SVE_PT_REGS_MASK, all SVE_PT_* flags are
+		 * consumed by vec_set_vector_length(), which will
+		 * also validate them for us:
+		 */
+		ret = vec_set_vector_length(target, type, header.vl,
+					    ((unsigned long)header.flags & ~SVE_PT_REGS_MASK) << 16);
+		if (ret)
+			return ret;
+	} else {
+		/* If the system supports SVE we require a VL. */
+		if (system_supports_sve())
+			return -EINVAL;
+
+		/*
+		 * Only FPSIMD formatted data with no flags set is
+		 * supported.
+		 */
+		if (header.flags != SVE_PT_REGS_FPSIMD)
+			return -EINVAL;
+	}
 
 	/* Allocate SME storage if necessary, preserving any existing ZA/ZT state */
 	if (type == ARM64_VEC_SME) {
@@ -1016,7 +1042,7 @@ static int sve_set(struct task_struct *target,
 		   unsigned int pos, unsigned int count,
 		   const void *kbuf, const void __user *ubuf)
 {
-	if (!system_supports_sve())
+	if (!system_supports_sve() && !system_supports_sme())
 		return -EINVAL;
 
 	return sve_set_common(target, regset, pos, count, kbuf, ubuf,

-- 
2.47.2


