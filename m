Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7OGCC6Q1LctmHJFe8cX2dcUbKj1900sOqj9vVCpnIc=; b=1hVNg/EqYDwG6MBNjsvz873FXC
	VmSJ92n6ravsSYCAlQCsECIluxaro1YQL9TArUQrlLGJrLda/hoMiPIBq9u3vB85AWhTPM/8bxqkK
	x9hNucl40DS/nZ5ryuWmnRElMLnUY+SOd8A/akQzDeEAer+DKrZ5VX6kESHT7H+sTam7fArN40ISr
	RFma+SYUKDJd66+zsPIdORUZQYYVbFTvA7dm28V92WwsHmAga3MX09Yb2k/cPVCaKXWwHvf/9w0sA
	Rz5JRx5gLuRZ8h5HNqFyHDi2Kr9O+/BslzaZuTtKLfIRnQEM48h5r4w/WzwMuNSD2CPsbJErlLXs+
	fVlTM3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7NJ-0000000BRZn-2UB0;
	Fri, 26 Jun 2026 14:17:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7NG-0000000BRZI-2qzd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:17:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2210960137;
	Fri, 26 Jun 2026 14:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6A61F00A3E;
	Fri, 26 Jun 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483461;
	bh=S7OGCC6Q1LctmHJFe8cX2dcUbKj1900sOqj9vVCpnIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OTwv4cp19o0IbJ6sxOymAbLDjcG8g4T/wUVR/SlObZCgRnVEvQGJQ4UXhugb6TTx9
	 tCCAp5tt7fAGnprLtyxLJjRoLVnt+fUuLDAZaJPZfoJl5/lNzmEvgg0ODng2kpifFP
	 D+XhW8sUCKeybEzvozJ26E4xtDZXrDhPi49+uMHSYqXVZtDS+g0YvAo8xnlGW7HkoC
	 BF3c5UKkn1CGR09jbBtV/HlxE2u+gTv9dHpgcNC+t7CLcdtBbcdlKnDF5O/Uvl2eL+
	 P7nnYJZTmIKT9/Ep3kjqBEbczIqoy0b8Y46p20sheRq1DrKw+bXh7c+VLGXgvZqZym
	 x1sq8qott/r6w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 2/2] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
Date: Fri, 26 Jun 2026 15:17:29 +0100
Message-ID: <20260626141730.5976-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626141730.5976-1-will@kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The arm64 UAPI exposes '__uint128_t' types in the members of
'struct user_fpsimd_state', 'struct user_pac_address_keys' and in the
signal frame via 'struct fpsimd_context'. Since the alignment of such
a type appears to be non-portable (16 bytes on arm64, 8 bytes on s390),
prefer the '__u128' typedef from uapi/linux/types.h, which makes the
alignment explicit and allows the definitions to be reused by other
host architectures.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Martin <dave.martin@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h     | 12 ++++++------
 arch/arm64/include/uapi/asm/sigcontext.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 6fed93fb2536..15649a253a57 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -93,7 +93,7 @@ struct user_pt_regs {
 };
 
 struct user_fpsimd_state {
-	__uint128_t	vregs[32];
+	__u128		vregs[32];
 	__u32		fpsr;
 	__u32		fpcr;
 	__u32		__reserved[2];
@@ -258,14 +258,14 @@ struct user_pac_mask {
 /* pointer authentication keys (NT_ARM_PACA_KEYS, NT_ARM_PACG_KEYS) */
 
 struct user_pac_address_keys {
-	__uint128_t	apiakey;
-	__uint128_t	apibkey;
-	__uint128_t	apdakey;
-	__uint128_t	apdbkey;
+	__u128	apiakey;
+	__u128	apibkey;
+	__u128	apdakey;
+	__u128	apdbkey;
 };
 
 struct user_pac_generic_keys {
-	__uint128_t	apgakey;
+	__u128	apgakey;
 };
 
 /* ZA state (NT_ARM_ZA) */
diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/include/uapi/asm/sigcontext.h
index e29bf3e2d0cc..d250ca7a1d46 100644
--- a/arch/arm64/include/uapi/asm/sigcontext.h
+++ b/arch/arm64/include/uapi/asm/sigcontext.h
@@ -78,7 +78,7 @@ struct fpsimd_context {
 	struct _aarch64_ctx head;
 	__u32 fpsr;
 	__u32 fpcr;
-	__uint128_t vregs[32];
+	__u128 vregs[32];
 };
 
 /*
@@ -266,8 +266,8 @@ struct gcs_context {
  *	-	----				-----------
  *	REGS					the entire SVE context
  *
- *	ZREGS	__uint128_t[SVE_NUM_ZREGS][vq]	all Z-registers
- *	ZREG	__uint128_t[vq]			individual Z-register Zn
+ *	ZREGS	__u128[SVE_NUM_ZREGS][vq]	all Z-registers
+ *	ZREG	__u128[vq]			individual Z-register Zn
  *
  *	PREGS	uint16_t[SVE_NUM_PREGS][vq]	all P-registers
  *	PREG	uint16_t[vq]			individual P-register Pn
-- 
2.55.0.rc0.799.gd6f94ed593-goog


