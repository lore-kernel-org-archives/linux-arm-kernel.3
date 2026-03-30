Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2A1061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49Td3ZPo2XN96yjkZUxp4Ogwv5AmQ/bHWiqlkl7K+b0=; b=yljn05Q/r1KrV2A3rYy+QSG5Q4
	f3keGlQBwZf4YgVz9dKc9KNNg0NA9/mfFabt3uhqdlJEkZhTejuHDEPFwdOW810xnPte+tqAcz3W0
	Zj+nYXudPfLTgFpVOpAYrEwhndxPE4EvVylxemF/187NMDc7ZYg+4WkIN5Zf5ZqHBfoSvCkTLy2Eg
	ZiGo3jGLhgrTK+ceKfMTFBUWAYaIvsuaWNpajQggSovWUH3yGw9b/5q08BaaP50Cvb7b1vM7kUVyt
	qYy3HGRtg67ciS9QpGosKNCLt3le9LB59HwgP3ljiaflBe6bgEJ42n4cCU+wfiVOA2xTr/UEnFCMA
	RNfM7icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvI-0000000BSph-3WN6;
	Mon, 30 Mar 2026 14:49:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DvG-0000000BSoT-18Rb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E888543F35;
	Mon, 30 Mar 2026 14:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D6CC19423;
	Mon, 30 Mar 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882137;
	bh=oRXTTRgczig8LPFqQrC03P5UVc2knZV/Mhzu7vhCAjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDBXnG1PUBCdKhvKgQX/Mf9I6ls8gCEkG+DBMBNpnM2HpXs0w7QtWMhsCnKRyQro5
	 wZSat0IyjPoKNVJB6k71+YkAS3yxqnXR7TEe7BaXIL8qZN0jN1jwOYwMS8Vv3jKTz4
	 SBNmGO+FAPcy6KpSCI7w0nXDmK0V0c9suw7PdbvP9/8iPWImNWBtPEK+6LtQjoxSdy
	 ZB3gqaQD0K472ZQlFYyQiOsG/FGM29neD4UzwMGN5uWZg2YXHXbLx6yx3hParOQSXd
	 10+jmU+sB9ext2NdYbx0JVY4dgnu7VhcqLNEcl0eZS4Zqx8iQwEAWlm7BTOXUvQuLj
	 moIec/rcVoylA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 02/38] KVM: arm64: Don't leak stage-2 page-table if VM fails to init under pKVM
Date: Mon, 30 Mar 2026 15:48:03 +0100
Message-ID: <20260330144841.26181-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074858_325024_7C067834 
X-CRM114-Status: UNSURE (   9.85  )
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

If pkvm_init_host_vm() fails, we should free the stage-2 page-table
previously allocated by kvm_init_stage2_mmu().

Cc: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Fixes: 07aeb70707b1 ("KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..3589fc08266c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -236,7 +236,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 */
 		ret = pkvm_init_host_vm(kvm);
 		if (ret)
-			goto err_free_cpumask;
+			goto err_uninit_mmu;
 	}
 
 	kvm_vgic_early_init(kvm);
@@ -252,6 +252,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	return 0;
 
+err_uninit_mmu:
+	kvm_uninit_stage2_mmu(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
-- 
2.53.0.1018.g2bb0e51243-goog


