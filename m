Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7883510F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hf1l9n0LOn8+a366efLDkGtdHUXe5GBDgdLdu0IfAK0=; b=Kakc7uiR6fxcpszkJWMovUUNdX
	raMAkzWx6f9eOpjARC5G3aQ6lflSkqkujpiTGNpZiIlVEV4bncHGuspxuYIPGMiYanh3eJ2vBIM8U
	QIMl+LydrSXZN6OpmG0w4UM3Ix9iuQYKEreubnmqZkSLZ8oeNKXB+FioTF040jabI84fWkek2u7m7
	AWc7QFQvTEKaqa/EqQrsXDQBNeDoHSaEqeGPtHODUx+6vP5NHYgGMFx+NUOhKe8xj7slwvaSwjFq1
	rS0eAKmmodUtLDINJRlQGIA9vtAsQsfGszEew2+iKNJWS+vpzECL3sRv4qj8hj+xznrAuXhLM4u1l
	EzbgGbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cqt-000000086PY-0kzH;
	Fri, 27 Mar 2026 19:28:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Cqs-000000086PK-12rJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5768C600AE;
	Fri, 27 Mar 2026 19:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581BAC19423;
	Fri, 27 Mar 2026 19:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774639693;
	bh=yq2ota2VO49Q0+/CyqaatJG112O6ZocHYaW5aOeSzjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFhHYHtjs+gJN5kCmxel6f7ptw4DSU6tJYESvFiTA16QurJt2PkxVYB6mj8JqNYj6
	 JywLPM6dr5kAIJaLLjhhgWgpv/rSTbl1tMs/dS95eyBeJPihVHsEP7VxIiE6z99LYv
	 91wVA5Im3L1slEOpDwEo6SbJaj/XRxwP73f7RqzGLwkRpaqnenEd6y3DRoteKnIMxG
	 ofe2wJj6dpdbTTYU88ZvPQaR8Zo/MxLlM69xW87X5pwBYGxKScqigbDnyskBypgJEM
	 ven7Dp1kUluaFUmrBxTV4jpa69Ma+g60tL2ou0xJopnloTbQUQul7AVqCUB0NCor3V
	 X1VT24VltJpvw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/2] KVM: arm64: Don't leave mmu->pgt dangling on kvm_init_stage2_mmu() error
Date: Fri, 27 Mar 2026 19:27:56 +0000
Message-ID: <20260327192758.21739-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327192758.21739-1-will@kernel.org>
References: <20260327192758.21739-1-will@kernel.org>
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

If kvm_init_stage2_mmu() fails to allocate 'mmu->last_vcpu_ran', it
destroys the newly allocated stage-2 page-table before returning ENOMEM.

Unfortunately, it also leaves a dangling pointer in 'mmu->pgt' which
points at the freed 'kvm_pgtable' structure. This is likely to confuse
the kvm_vcpu_init_nested() failure path which can double-free the
structure if it finds it via kvm_free_stage2_pgd().

Ensure that the dangling 'mmu->pgt' pointer is cleared when returning an
error from kvm_init_stage2_mmu().

Link: https://sashiko.dev/#/patchset/20260327140039.21228-1-will%40kernel.org?patch=12265
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5..34e9d897d08b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1013,6 +1013,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 out_destroy_pgtable:
 	kvm_stage2_destroy(pgt);
+	mmu->pgt = NULL;
 out_free_pgtable:
 	kfree(pgt);
 	return err;
-- 
2.53.0.1018.g2bb0e51243-goog


