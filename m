Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E855AC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct0cxlkw1DYHJmB3PFJvJesftzOmvKvgybAJyvv8kJY=; b=s57WUA29WlFsLwc80Tdlc5hyY6
	rw1LduvFbfTOEEgDGP+9lJ1qnMQGJs35AMTILDp6ETR2RubiH954CP7nacZb5TkxBKmqQFHQ8qIO3
	SSW7jBH8IauzD+psXmh96jBiY/GEjrEzjqwPK9r7CEXnQKyj0lNQO8CNVmyr/2XAf8gKd58gbUadl
	Lc7+uWDUF5JxH7O0gV/6WCDur7YSh8che/UGCN5DRk0wX4E5/Op9O51tUlPwX16YzqfBkQvtHUkTr
	RMp2iMZaTrjLNTAcADc5Q+33/uGl39oJfWnVRkcIqLVKkOornt4AMangpXRqKCqm9eAwY7WuUPYkh
	2JpSdC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQh2-0000000DWsN-07Qm;
	Tue, 06 May 2025 22:23:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOy-0000000CiQR-0do2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCBDA49F9B;
	Tue,  6 May 2025 16:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED4AC4CEEF;
	Tue,  6 May 2025 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549855;
	bh=xZoAbmM+hMY8JchzItb56G4GAlsrEEMidF7bm78opo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KlSsfvFTXq42EEd+m0NWMOYZmDywr8KGLaPWxg/nShXiXAxi07f3+vZ1K4lc+Hn6A
	 yh+//Ey6iE6RAKFkXEiA59lUJEOL93x6kjJC6pB9dUeUwTEMsIwD/4k5sCpDL/MBSF
	 3Xif6wp1MwTr2Tuenk/tMC+5VNOPNP4v1+uYRehQjx78u1GJIAzmsD6hexrxbaW9rp
	 uabHmoRFSph+FFKY6/uVLIVdn4qh6sgvF4un/0c7O0YJSlNh/8DQaAQMiju66hQ90O
	 vbQHDpVRtbpI5j7WlIMyV9eGb0RHjbJNyq0gvmYe29vt7CbLrb1BR7tqGE/hhdvc6u
	 mQQ8xiKjdZX4w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOw-00CJkN-2b;
	Tue, 06 May 2025 17:44:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 34/43] KVM: arm64: Allow kvm_has_feat() to take variable arguments
Date: Tue,  6 May 2025 17:43:39 +0100
Message-Id: <20250506164348.346001-35-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094416_216986_7C52AF55 
X-CRM114-Status: GOOD (  10.76  )
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

In order to be able to write more compact (and easier to read) code,
let kvm_has_feat() and co take variable arguments. This enables
constructs such as:

	#define FEAT_SME	ID_AA64PFR1_EL1, SME, IMP

	if (kvm_has_feat(kvm, FEAT_SME))
		[...]

which is admitedly more readable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0eff513167868..3b5fc64c4085c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1572,12 +1572,16 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	 kvm_cmp_feat_signed(kvm, id, fld, op, limit) :			\
 	 kvm_cmp_feat_unsigned(kvm, id, fld, op, limit))
 
-#define kvm_has_feat(kvm, id, fld, limit)				\
+#define __kvm_has_feat(kvm, id, fld, limit)				\
 	kvm_cmp_feat(kvm, id, fld, >=, limit)
 
-#define kvm_has_feat_enum(kvm, id, fld, val)				\
+#define kvm_has_feat(kvm, ...) __kvm_has_feat(kvm, __VA_ARGS__)
+
+#define __kvm_has_feat_enum(kvm, id, fld, val)				\
 	kvm_cmp_feat_unsigned(kvm, id, fld, ==, val)
 
+#define kvm_has_feat_enum(kvm, ...) __kvm_has_feat_enum(kvm, __VA_ARGS__)
+
 #define kvm_has_feat_range(kvm, id, fld, min, max)			\
 	(kvm_cmp_feat(kvm, id, fld, >=, min) &&				\
 	kvm_cmp_feat(kvm, id, fld, <=, max))
-- 
2.39.2


