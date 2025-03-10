Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E745C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfzQ5j3Az1khfj3FbkX1MzKZtunVnwwxcMzt3ZFG9Lo=; b=qZzM+YfDQOMQa71NWRvvrDXXyw
	bnOEwuWY5cq8ul4GYsKeZbmj8ZKFLN4eDlD2GD3RdMqym/xZYBAX//lnIQbwX55wxyJhkwQTd1IKe
	4gPmOW/IPopp9TTM46cfEg9DuqU+bn+7+VjimFumntm8YIRsXoIc6bPoEZYD9MSkrYDHOAwZdZCnM
	NwpTn3OXISfNwbu4P7BpP3qySDY6CjXOouCMGCby9Jr0CsB6a84/GCroVUB/HXBYmqufpdQzYnrbF
	33krpcS6cNMLatVJJwNtc1RyGaFQs+scV+8cUpfKdWfNn+JJTHRUpuIsm2tBepe8ffXFR+XSfbhyI
	rqpeu0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcf3-00000002hRK-3e3d;
	Mon, 10 Mar 2025 12:55:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC2-00000002bSR-1me6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1BD65C62FD;
	Mon, 10 Mar 2025 12:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F37DC4CEEA;
	Mon, 10 Mar 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609513;
	bh=z2VwTfiENkktUVTXFlhIZAHJiX/ofVLHsrUMaO3gVxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYPxSo/FSoBsY6bl4L7BLPyoRrhtYaUEdX3tpSAfGaQ4oqVoeghrSdBxkC0L1TzON
	 OuKJwuS/7Fmsk4I5cxV9IRN+OimblzyYBVfHLG+mn33eejfKOKKvQxmKr8/G2tH3Dc
	 lS8xwimBsIL9ieejMfZUTGQM1yG8s83f1qyBUkgpjuSC78CMtR1zateWv/S3q/e3sH
	 AAqSKhX9a8Us+sm3kFOekgTHWcEezgcIQ8jvlxJlyVRC677GUIZ7grrBFyWwcbDXD4
	 F5kg0dZyi1qHEjA/fv8WDUEJZYbwddNvlyOhIcYafS3Y1f5hKaBVCI5aW3lYYQaZe2
	 zSL3oKcPlhPEw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcBz-00CAea-C7;
	Mon, 10 Mar 2025 12:25:11 +0000
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
Subject: [PATCH v2 06/23] KVM: arm64: Restrict ACCDATA_EL1 undef to FEAT_ST64_ACCDATA being disabled
Date: Mon, 10 Mar 2025 12:24:48 +0000
Message-Id: <20250310122505.2857610-7-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250310_052514_517315_FB9CE113 
X-CRM114-Status: GOOD (  11.51  )
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

We currently unconditionally make ACCDATA_EL1 accesses UNDEF.

As we are about to support it, restrict the UNDEF behaviour to cases
where FEAT_ST64_ACCDATA is not exposed to the guest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd02..18721c773475d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4997,10 +4997,12 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	kvm->arch.fgu[HFGxTR_GROUP] = (HFGxTR_EL2_nAMAIR2_EL1		|
 				       HFGxTR_EL2_nMAIR2_EL1		|
 				       HFGxTR_EL2_nS2POR_EL1		|
-				       HFGxTR_EL2_nACCDATA_EL1		|
 				       HFGxTR_EL2_nSMPRI_EL1_MASK	|
 				       HFGxTR_EL2_nTPIDR2_EL0_MASK);
 
+	if (!kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		kvm->arch.fgu[HFGxTR_GROUP] |= HFGxTR_EL2_nACCDATA_EL1;
+
 	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TLB, OS))
 		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_TLBIRVAALE1OS|
 						HFGITR_EL2_TLBIRVALE1OS	|
-- 
2.39.2


