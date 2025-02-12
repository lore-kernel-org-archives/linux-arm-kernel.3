Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6qL2JWDgatnjB1r5E9urS3Ls383eBmxKA2X/XCiraM=; b=CsguISx5J55QEyVM1sgKS5SMM7
	reN1NS+ChWj8J5pvlwjtyk9nyc672Q3D8KcMhLUE/9Kq/tI+a1s0wHNKxYiEeZevR2acWuROa4/4E
	hbZjVWLZtz8EyFNMF/0oZDUxtrWSK5CvFO6I5zCE8nCfEMKcsxE/AualWyDwV/ar5LuOHIAFwetn6
	7FMb1Dtubf3uvzTAf1Ztm2/Iv4ZqdBgIKEf447Fwhs/Tbg9s3kJoSLJ1n38GPG6YzpIzyF7BZkcMq
	anNQge2GuTqbz05rVBT8oqDlZodPXMRQGv1o7uDFA+ZHvXgcDF+eRf3QrlbnoW7LBKtMX76jP/S2P
	UP4Xj5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGqC-00000008NZI-2Boj;
	Wed, 12 Feb 2025 17:48:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGds-00000008LCr-2e9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DDE9A40C42;
	Wed, 12 Feb 2025 17:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49718C4CEDF;
	Wed, 12 Feb 2025 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739381719;
	bh=Yb5Rglb0R+uczXoNPpb0G/nXu7u+4umVbrJjc/A3mRQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GbbolCVvKzF/wLtwxiBZi1vOuyS5wkhAOo53LkJNo817Tsuc+MW62LGm33i/WzTeR
	 e+Ty9cL9d9+a/2qOV3YmVbgsZxIUgezSaD1e9MUEF7KSL3LIxiJE06tjjHiwJl4yV7
	 KOA7/DHdHShGrEiKsQ3jh6J9a2sE9ypeTFt8GEc0MFlCAo+m1qOZwX8dn3Cz1UWtRS
	 kXxrXkUOwwj3vaVadraIUA0hwno7zIo0uD8titPm5mQeUnlfm8DqDY+gDlZ1boMsjm
	 di9UyJY7TlOS+HIHWbwrMLxHu5/ELx9G1ibEqztsP8ifiqM+jdnrR3Rx2MbtN13hQ8
	 CdEe0cuVo7/YQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tiGdo-003QTv-Va;
	Wed, 12 Feb 2025 17:35:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] KVM: arm64: Convert timer offset VA when accessed in HYP code
Date: Wed, 12 Feb 2025 17:34:54 +0000
Message-Id: <20250212173454.2864462-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, lkft@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_093520_744558_F8C56FFB 
X-CRM114-Status: GOOD (  11.44  )
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

Now that EL2 has gained some early timer emulation, it accesses
the offsets pointed to by the timer structure, both of which
live in the KVM structure.

Of course, these are *kernel* pointers, so the dereferencing
of these pointers in non-kernel code must be itself be offset.

Given switch.h its own version of timer_get_offset() and use that
instead.

Fixes: b86fc215dc26d ("KVM: arm64: Handle counter access early in non-HYP context")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index f5e882a358e2d..23bbe28eaaf95 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -581,9 +581,22 @@ static inline bool handle_tx2_tvm(struct kvm_vcpu *vcpu)
 	return true;
 }
 
+/* Open-coded version of timer_get_offset() to allow for kern_hyp_va() */
+static inline u64 hyp_timer_get_offset(struct arch_timer_context *ctxt)
+{
+	u64 offset = 0;
+
+	if (ctxt->offset.vm_offset)
+		offset += *kern_hyp_va(ctxt->offset.vm_offset);
+	if (ctxt->offset.vcpu_offset)
+		offset += *kern_hyp_va(ctxt->offset.vcpu_offset);
+
+	return offset;
+}
+
 static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
 {
-	return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
+	return arch_timer_read_cntpct_el0() - hyp_timer_get_offset(ctxt);
 }
 
 static bool kvm_handle_cntxct(struct kvm_vcpu *vcpu)
-- 
2.39.2


