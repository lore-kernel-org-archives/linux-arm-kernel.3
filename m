Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB9FC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UvqczFxSx/BpRPWAiq3VcVYwRhpE7hzNXJY21OJYYjA=; b=wnyLQ7PKapVXvNm+ZcJBzVUEPU
	q9RgrephGfAUHOXarsJgZMEzCNiyOtc7iJZRKIfLaWLCr1GGiuszwPGijxVjJlVd42+KkWDw9rSPV
	jNSE0/seH86XP2M2kyc7Q/xYjM9hL9BobYByKxrQNMcaQeEuK4ZjJUGzdmpXtY/h3FHs/zUGxrVSh
	sBZBTN7QMbK3fFN1qXAK5+gAAByMdvVm7N7+8Lv9JAM4ikcGiu85cKaPGNa+bRgEMlFb9aJd1xhdp
	3heams/yLx9WPxJyOv6bBOlZflpM9ncog3Ezza4h/wI58giDz5oP0YqAcI7Qhk/2Ja1CayfjQS+Rh
	t5SyWL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5In-0000000EJFb-40Jq;
	Fri, 14 Mar 2025 13:42:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5BB-0000000EI8z-3qEe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 13:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6064E5C065B;
	Fri, 14 Mar 2025 13:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D00EC4CEE3;
	Fri, 14 Mar 2025 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741959264;
	bh=Nh5wUl4x9u8EMy8wWXBvkYp2HpGM28PTwr1jqa491Ek=;
	h=From:To:Cc:Subject:Date:From;
	b=spcca3v5SutSp2uGX31Y9pVTWxuWKbNyywVCiV+txSk9catfchEKY1vB/6eYIh8m9
	 wnLJ3tjygr+CJfFMRyJKfdzttIG+XJw91bjPc+20WEDXngA59JbYB5K27p6WWh++Jp
	 //jEOhG991TB3niUsqCMaOW09XDdKYeSxSjyG+sYnGyCDk0LYr3rSUJ67GBmVmBSXE
	 OqCtSk4GnGeWOELqd1cs1Vo9xwJFxTFh1SbsEDlsKzVRj0zJHzfQakEPYnGFUoE2ZS
	 chi+fvuPP49C+5iDwHkt647fsHAPUEupNKzwpgZJSnv4Xa9vXMQAiqI9+Z0nKam76z
	 W3ewsm5PT7FoA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	stable@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH] KVM: arm64: Tear down vGIC on failed vCPU creation
Date: Fri, 14 Mar 2025 13:34:09 +0000
Message-Id: <20250314133409.9123-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_063426_006926_7BABF3A8 
X-CRM114-Status: GOOD (  12.76  )
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

If kvm_arch_vcpu_create() fails to share the vCPU page with the
hypervisor, we propagate the error back to the ioctl but leave the
vGIC vCPU data initialised. Note only does this leak the corresponding
memory when the vCPU is destroyed but it can also lead to use-after-free
if the redistributor device handling tries to walk into the vCPU.

Add the missing cleanup to kvm_arch_vcpu_create(), ensuring that the
vGIC vCPU structures are destroyed on error.

Cc: <stable@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Quentin Perret <qperret@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---

It's hard to come up with a "Fixes:" tag for this. Prior to 3f868e142c0b
("KVM: arm64: Introduce kvm_share_hyp()"), create_hyp_mappings() could
still have failed, although if you go back before 66c57edd3bc7 ("KVM:
arm64: Restrict EL2 stage-1 changes in protected mode") then it's
vanishingly unlikely.

 arch/arm64/kvm/arm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b8e55a441282..fa71cee02faa 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -466,7 +466,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		return err;
 
-	return kvm_share_hyp(vcpu, vcpu + 1);
+	err = kvm_share_hyp(vcpu, vcpu + 1);
+	if (err)
+		kvm_vgic_vcpu_destroy(vcpu);
+
+	return err;
 }
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
-- 
2.49.0.rc1.451.g8f38331e32-goog


