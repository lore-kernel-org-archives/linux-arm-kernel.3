Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8990ED778B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Shu8WDHjhF9859vMN3SVh+oioaL3K//boAb8Dj4WGYo=; b=hXFB4CG2gi3JHCdgcSja1dWlxm
	nVHtQ7RLyJJOXXZMRmRqo/jlyKOp6mIsGAXyzsBeRMRhDgbTOlxIVAON6i+ZSz54ISPBoUYysnbVL
	qvysZHhu5XvLlV9Mw5ShKIb7tU0OMRxJwsHamwCUZv6NVWEHID2hbDNmXMNRe5JAirNFVpZwEMpgu
	gzfavX/J6yQ6qFrRT9RrDryCuuj6b/h47lPkCM0KzR6cjSyKKOuzpYLhF9JwjbSaQOgFmnM4rSAG7
	rD7UtV4L026kJaSAU3nTaCDoxJwlPWdH18ror/suemRYRa9ySZNOmTrXiGvdOkGric7U5mAkLQyQX
	NL0JIrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeI-00000009O3I-2u8f;
	Fri, 23 Jan 2026 19:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeC-00000009Nze-0QUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4112943FE3;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C9C19425;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195803;
	bh=n8p4GrhZYc/onaCNYcYnYrmgdPoNoakZKm18N6u1jVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dae/CMo9WVTAbR9xlmhMMsDeB10WJNVdTqCsN7nkMEPXqI2os8k60js0t7tQU13Oy
	 ckO/zn2h5kHz57V5IiUhBGAtT2BbUyJtKP8D1z/b1QEuTEYQ8Z3k8BTaPxggn5rp3w
	 vrh8TgIAOP4Yec5Gjpr/r5vO6FCJzZ1ylAk9PZDH85LqiVDJuW1ky7hDt6jqXgoInM
	 a15RZrn/FT4Su510kmJxqf3RlK7jPPbAi5Rt7/Gr+mbCRuYUrrQVgxZzy5F4GQEczq
	 /ZyoLcgoZU0OIDuSdIjTf40PSyvzkrYcuIwSjh/Kx/K/NgdMKjyKhvZKLpF0/GAcS1
	 n3BoEsxJ0tIrg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjMe9-00000005A2V-16kd;
	Fri, 23 Jan 2026 19:16:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v2 3/5] KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
Date: Fri, 23 Jan 2026 19:16:35 +0000
Message-ID: <20260123191637.715429-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123191637.715429-1-maz@kernel.org>
References: <20260123191637.715429-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_111644_156453_7B110121 
X-CRM114-Status: GOOD (  12.10  )
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

Since we have the basics to use the S1 memory attributes as the
final ones with FWB, flip the host over to that when FWB is present.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 49db32f3ddf71..38f66a56a7665 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -19,7 +19,7 @@
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
 
-#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_NOFWB | KVM_PGTABLE_S2_IDMAP)
+#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_AS_S1 | KVM_PGTABLE_S2_IDMAP)
 
 struct host_mmu host_mmu;
 
@@ -324,6 +324,8 @@ int __pkvm_prot_finalize(void)
 	params->vttbr = kvm_get_vttbr(mmu);
 	params->vtcr = mmu->vtcr;
 	params->hcr_el2 |= HCR_VM;
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
+		params->hcr_el2 |= HCR_FWB;
 
 	/*
 	 * The CMO below not only cleans the updated params to the
-- 
2.47.3


