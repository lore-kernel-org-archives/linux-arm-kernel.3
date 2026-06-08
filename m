Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D44CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQGth3uiwb0BlK7HMd9jRw5PF8jfshBmNB52ngskoPg=; b=SH6Tnm8HoWTvAEXriEyxgnX0W0
	tJ027GgT/SIqtLXjVX9QnCm0ewDNJZI1oOcxlXR8ebz+LiTh3f0mPetBs2vzwtkKhH0YCGzqI7mjg
	QMyXNPzitkeTtvtE+2nOkYxHXB7IOsPRnBHGjIo5xD09X6pFprZ8nHzUnqFtPoUKTuLL0o8UMF5Vo
	IxNPux+02xjqxuM57tQAk+d+526QRHQvggfZW3EOr1hb5C8yHhJuKkNDpbGY6cH/LFwkW8rPLNIzg
	YxqDCYcJg7boV2VLWtIaP8gaRQiO2Dqr8sSTJoCOhcYMSk8A3oUSnpskEis1P+xzFeT5IxsSQ0V/x
	OKYV3amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV5b-0000000341V-3eej;
	Mon, 08 Jun 2026 08:12:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV5a-0000000341L-1KZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:12:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A906E601DC;
	Mon,  8 Jun 2026 08:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C93B1F00893;
	Mon,  8 Jun 2026 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906325;
	bh=jQGth3uiwb0BlK7HMd9jRw5PF8jfshBmNB52ngskoPg=;
	h=From:To:Cc:Subject:Date;
	b=bRcbnJgmyUxJ5vaZqOr1e5XO7O6zV/mSlBnkt3xu74BoclQRoqQR190+tEsKfx0SX
	 KjC9dlsaQHlmMw5OOYS+8hTb7+J7feQpiTdnHHzUyszpPyJxDGNPM5XEopAsjjmioe
	 28Ua5PCWQEHDASVhWUhGrfRPgifVh7FNpVvgZihz8t/wbVyXpcRCk99ZsEH4gMT1PV
	 ykPh06LyGIRZZym+CHASGtsRtovL1Mi/I+9xqbxO/qw1BtebhD7rIWsVUqPtG7EB+y
	 TNCbw010YL0NDrdk27dVpryUhYdBAKkoO/PnkIOaBeaPN/y72zmSQOZMdL89wHZ8zd
	 d82y9NgHx5gIg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wWV5X-0000000ANHQ-11V6;
	Mon, 08 Jun 2026 08:12:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Hold kvm->mmu_lock while initialising vcpu->arch.vncr_tlb
Date: Mon,  8 Jun 2026 09:11:08 +0100
Message-ID: <20260608081108.2244133-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Sashiko reports that there is a race between initialising vncr_tlb
and making use of it, as we don't hold the mmu_lock at this point.

Additionally, it identifies a memory leak, should userspace repeatedly
invokes the KVM_RUN ioctl after a failure of kvm_arch_vcpu_run_pid_change(),
as we assign vncr_tlb blindly on first run, irrespective of prior
allocations.

Slap the two bugs in one go by taking the kvm->mmu_lock on assigning
vncr_tlb, preventing the race for good, and by checking that vncr_tlb
is indeed NULL prior to allocation.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20260607180815.85FBC1F00893@smtp.kernel.org
---
 arch/arm64/kvm/nested.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 690b8e8564166..d11e36b3cfcc2 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1253,8 +1253,14 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
 		return 0;
 
-	vcpu->arch.vncr_tlb = kzalloc_obj(*vcpu->arch.vncr_tlb,
-					  GFP_KERNEL_ACCOUNT);
+	if (!vcpu->arch.vncr_tlb) {
+		struct vncr_tlb *vt = kzalloc_obj(*vcpu->arch.vncr_tlb,
+						  GFP_KERNEL_ACCOUNT);
+
+		scoped_guard(write_lock, &vcpu->kvm->mmu_lock)
+			vcpu->arch.vncr_tlb = vt;
+	}
+
 	if (!vcpu->arch.vncr_tlb)
 		return -ENOMEM;
 
-- 
2.47.3


