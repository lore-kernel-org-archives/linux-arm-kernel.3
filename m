Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF05C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOKOGGIJP28LyTclgUQNG0KcJaMLcrn1sNf6mJ708h0=; b=SMMDem4uQqcrVGxn7zfVSQTC8I
	m8Ext+Gh8e2Utz9Wnho/yoAYWaxn7wW49o0VDN4eYv8BkP2SfAfs33ohYC7oM+EstizHOeOoXEW+K
	ENWf/uRRsb8LYR0jTKM/L6dkgGJMGohn24nIzUrPp/08zDnHgJYAv2owXIQZbwctJIR7KpAz4zzly
	zxrcAVPo6KNW/LB9iQ22WEXleskmWMOlJhoOHH24CVgiqg93kd/bOaGLlsPjZ7HCpcB3Rxb1VcN6p
	9sw3Kt8waXuXieJiPlzzvEkAGMQKuCAuXAQlgfxKEFXIXf5JIg/YSEfDhgAxGsZQ0YKSXp9sY7sHi
	xdOppuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMHT-00000000Wc7-1Mnt;
	Sat, 15 Feb 2025 17:48:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7U-00000000Upb-2Fnq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 715F6A40692;
	Sat, 15 Feb 2025 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CC4C4CEE2;
	Sat, 15 Feb 2025 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641103;
	bh=LEtVaxB4lu5XK8RmKO0qA5NQ+6d1p7e+by5R5CODK9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XVSI0zHLC6pVpMWWixZWs/IeXYmpkEGpueetvHUOEBajEl6mIhJBCQYOoXdYM8HJZ
	 54SXNktOK6WmF5moD+rkMCIAesUCq4pFOuJMAfIn00Gt0zMGebzSPVdXm6oxRzCt8S
	 qmArK2Uc+hhDOMrvhtAJZyh7MF8zWm7XtatrJu/NZdELFfpWVErC/iX97ia6EHJf8O
	 JW5dGRdrsheYAcwUn5Ux7nyZOIToqI6VDaJTRSRoPz/I7fLVDHHMRu14jyqiaPC5O6
	 cd/tXI4Vm1B+tHYmoxTxNWkUTAdqvIESZUorTvfn6Hx6SrnVJngUalnq//4Mfrnrbt
	 7S53d6vr16K/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7R-004Pqp-Kd;
	Sat, 15 Feb 2025 17:38:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 07/14] KVM: arm64: Make ID_REG_LIMIT_FIELD_ENUM() more widely available
Date: Sat, 15 Feb 2025 17:38:09 +0000
Message-Id: <20250215173816.3767330-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093824_724777_61BF9276 
X-CRM114-Status: GOOD (  10.17  )
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

ID_REG_LIMIT_FIELD_ENUM() is a useful macro to limit the idreg
features exposed to guest and userspace, and the NV code can
make use of it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 10 ----------
 arch/arm64/kvm/sys_regs.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index b1bd1a47e7caa..885cdef77d01e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1803,16 +1803,6 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 	return val;
 }
 
-#define ID_REG_LIMIT_FIELD_ENUM(val, reg, field, limit)			       \
-({									       \
-	u64 __f_val = FIELD_GET(reg##_##field##_MASK, val);		       \
-	(val) &= ~reg##_##field##_MASK;					       \
-	(val) |= FIELD_PREP(reg##_##field##_MASK,			       \
-			    min(__f_val,				       \
-				(u64)SYS_FIELD_VALUE(reg, field, limit)));     \
-	(val);								       \
-})
-
 static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
 	val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64DFR0_EL1, DebugVer, V8P8);
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index 1d94ed6efad2c..cc6338d387663 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -247,4 +247,14 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu);
 	CRn(sys_reg_CRn(reg)), CRm(sys_reg_CRm(reg)),	\
 	Op2(sys_reg_Op2(reg))
 
+#define ID_REG_LIMIT_FIELD_ENUM(val, reg, field, limit)			       \
+({									       \
+	u64 __f_val = FIELD_GET(reg##_##field##_MASK, val);		       \
+	(val) &= ~reg##_##field##_MASK;					       \
+	(val) |= FIELD_PREP(reg##_##field##_MASK,			       \
+			    min(__f_val,				       \
+				(u64)SYS_FIELD_VALUE(reg, field, limit)));     \
+	(val);								       \
+})
+
 #endif /* __ARM64_KVM_SYS_REGS_LOCAL_H__ */
-- 
2.39.2


