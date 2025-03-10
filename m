Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CB5C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ1Slsujs/nNgJ5lHZOXJ8bVrPozC30DSsWXmJjVZFs=; b=mCJbQKzegUmr+cP1vLCMW9R+Mg
	+GlUiEFokEgsG4tu2b6d/jCSy/V2YPqZI79FOPdzPUBKjvOKNv2MwPx6Td9oARREuZtMqs4opKerX
	52RtD+j95JoCxZkd+T+CxMZqA8BDVWaBukGLjBv7VmjGTO73LGc0ehfVT8p3MCk+HcIDRO/tOjVox
	AMw8xyNcWi8w45AfXR5zkLMjrpDEHcVH57O1O0p/dXsaskS17MUKWI85cig3lKOFzYZaaQpWJ5vR6
	bzZWAF9eP0M1wfyKIGL9wmTWYzxML3BdCXL0tiJEJK2vG4vpM7m0IQo0YI0hFg/GWDaysY3IHYOM3
	9IDVZ14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trd6K-00000002mZm-352B;
	Mon, 10 Mar 2025 13:23:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC6-00000002bXX-3LDt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C157FA45B42;
	Mon, 10 Mar 2025 12:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2ADC4CEF0;
	Mon, 10 Mar 2025 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609517;
	bh=c4i86duoXEmDwXPSOJ2OB2+MENRRYS3JIWDrzcjnE64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xse3VCZDp/4QeTj9roEwXnXyvPxMGR4YqQZtjRKZUb/hZX8dR111DFEYzsgjsvtvI
	 QgE05en97Soy+vjp1WWLadzMT93kgPzabZmOLL8S9IlbjazGjyMJDmBv8WXj2T1slp
	 N2QdFQjusozhnL5U+dCmTt15Yj/HCLw5A5JNioVIk9PznLNAdW3wC6aT4EN5u5HKzY
	 afnj1ndq58gGwviv0tRJnna7ImmUQjQzfo3YzIgAgbwJCCgoTFqsyHTNZLK6yoYoxL
	 k20VynlBZDFZuni/wYvicUeWJ8oaRkggzhOTDnM1s+1mMJLpUJide2ManQAPwlet5+
	 lOq+pfr3yG4lQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC3-00CAea-Lm;
	Mon, 10 Mar 2025 12:25:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 21/23] KVM: arm64: Allow kvm_has_feat() to take variable arguments
Date: Mon, 10 Mar 2025 12:25:03 +0000
Message-Id: <20250310122505.2857610-22-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052518_934163_86A232E4 
X-CRM114-Status: GOOD (  10.50  )
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
index 9bac3c6800294..89f8415fea063 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1526,12 +1526,16 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
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


