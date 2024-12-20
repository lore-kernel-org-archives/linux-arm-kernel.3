Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB78E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B9moUuFzLShRBZlhMTgis6i8nI3DAb4cnTPoWkxGWk=; b=YQWA/14uXMgFqHw4rNzwiTx4vH
	W8ZL1iSSFjKhhVG46hXrwh9HFBR0vnlIGQHFF0mNqB34QIog7/nELtj0ozo0kZabJBwv9WXEffigR
	xTm1nlf2o95MLx8rY+gtE1YbgrdQQOvilkHsNMXpzdWmkailWH5OGSJkyRQxAslZBwiarN+V75IWA
	u/EE+qLViVWr9ZYFZlpMS3vY/NU8CwKocW6bDtvbR69CFGGETzJ793otkqJGxTi6xqdkxqNdtVsKH
	bnusNZG85OQARjcFm1yqSEjIQ7lNZMtxgEQOsPRlYvQhk2Qfq4GgLdGpb2bU7tEqkso4y9P40kj0O
	XgKsVUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgMH-00000005Xrp-1R9p;
	Fri, 20 Dec 2024 17:00:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDk-00000005Vvw-0JAy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/B9moUuFzLShRBZlhMTgis6i8nI3DAb4cnTPoWkxGWk=; b=hIXyu2fsmVNFsDvgfdX51g7Rl0
	KRe9V/9MGhfeg+TuudW9DSXscgQr8ZQVO2gBu3JtAGpXMa/Wv3j7XZrt3F/qUNoXSEwR2zVix2li1
	THbQzAbUjWHtG8CT4FZH/aC14B8JMLiRU/YgWj8XR00NoiX4+FpKrVKxvnmAhVk2WbUcUjR37v8LZ
	I+d2lp6vfauNnax/t/emiMqUTiCS8O7kd/RVRslYBxq0n6ixKtc/uTfVv/VQmPdwDhMl4K9EamPim
	SxKfzKE6N8IHlyu4pvIpLoIQiafts0LjTzx48v0E1IEusw1BLEMoxEw3t2D0E8ou+Sjg44c9YPxcG
	Gvsu0UQg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDh-00000005jUJ-0vAh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B215A42017;
	Fri, 20 Dec 2024 16:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FB2C4CEDC;
	Fri, 20 Dec 2024 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713479;
	bh=FQHYwXdmL3GR1X0fB9NNfgXhfHPcJEGCJwnB7whsybM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sPgjhNy0pQKxJmsHGssak/MuCZK0aWt8tI8thh7Ae1mYzo8bd/TG5eVWNdGdoCbat
	 uhsduMcY4oz+ozc2revjhXx5Ldwd1tUs1mbdHzzqvAy//oLujy57t/PM1i9A3p0Nub
	 mdeL6ThJaawK+c185FioTm68KJk0O1YgsDofyKeKjeHv1yFjsK5vsdDBVK/1OJCiZM
	 ldjMcZeZNFIo7QxH02lr5TZehIbMzW4naWTGh4+nUmdwOv9LbldTXEl5+lhS3pke75
	 AlZHD8K0aqKZ45t2sii65DiV0vD8fj+BJuKdfndpTf5Cf+1tp8appwhRUbYMix1aeT
	 qMpcvUEnLKZQg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:31 +0000
Subject: [PATCH RFC v3 06/27] KVM: arm64: Pull ctxt_has_ helpers to start
 of sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-6-05b018c1ffeb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FQHYwXdmL3GR1X0fB9NNfgXhfHPcJEGCJwnB7whsybM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBZgmK/htQnfZrdQRb9ftVqYA9k0EzKH9YaTlHT
 OJFL6e+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgWQAKCRAk1otyXVSH0CzFB/
 9j6wPn0JHK8/QjGznInjFWbpmWtsO145mBHDy9gv2tvca9YZMjsAUZtnDXUvpcSrkpBx/jXpG6ytgq
 7XDa+pa2H5NQ1gj/Rq39700Ks+VG2FD4l8mxJW+k67UAJrVWHrcFPmbruxwgKOFEDZEOmns7L+v6u3
 qhfFaSKWmiAwdmNqo8rrfoUvLUsBj88wdGyI/UzD0SiEVx/HvDtIpqX9wyORNCGkOhumngUqYW3Sgw
 wANy0gt4totBOrUpWdnf8xnhpP2NjDOaMMU/HPlMODt07U/NElcodWuT/SQ5lL1MwpMxjcUuATF8wK
 +JaOWIYQjAWxxaIDZFs42qEFNYffZT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165121_551128_A3C61F9A 
X-CRM114-Status: UNSURE (   9.52  )
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

Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
pull all their definitions to the top of sysreg-sr.h so they're all
available to all the individual save/restore functions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 32 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a651c43ad679fcc5a13ab7a619e252d96fd46281..8c234d53acb2753c59aa37d7a66f856f2eb87882 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,23 +16,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
-
-static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
-{
-	ctxt_sys_reg(ctxt, MDSCR_EL1)	= read_sysreg(mdscr_el1);
-
-	// POR_EL0 can affect uaccess, so must be saved/restored early.
-	if (ctxt_has_s1poe(ctxt))
-		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
-}
-
-static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
-{
-	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
-	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
-}
-
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
@@ -83,6 +66,21 @@ static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
 	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
 }
 
+static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
+{
+	ctxt_sys_reg(ctxt, MDSCR_EL1)	= read_sysreg(mdscr_el1);
+
+	// POR_EL0 can affect uaccess, so must be saved/restored early.
+	if (ctxt_has_s1poe(ctxt))
+		ctxt_sys_reg(ctxt, POR_EL0)	= read_sysreg_s(SYS_POR_EL0);
+}
+
+static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
+{
+	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
+	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
+}
+
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);

-- 
2.39.5


