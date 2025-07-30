Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C8C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++3Xso8T8I8/b3zgR+Rww7WWnH4DlXvu+9ipTgLwJEI=; b=YBRkAf6zXBGbzG+gO/8dzuCQHn
	hPz/GngYC93VKiehNK0KgtnWnrQVq9x6J210X4RFzTaemfYCdlfW99rohOjKCBCoJXkw8K3XqRqqz
	cZKfYHtSGHxS7JshaAbC4b/0PqDLF4bR0HdQInlchtnJD+WVO3acO27VYadQLwNKBl/uz2BdW2mEW
	v9vpjOji1DJ+XCNfAZ1/e5OcvgwUrChO3y47dS7eT9p6Z76BEYPEyGM7uEJZQcsSzRb/DDNIYKDLq
	70rqjBckyrFagmnSZ533ScUtAXefJVUp9heRIbWI/t6ULyQ9sjNbwfmhGC4zojOg4E9FCBEhaR3mt
	j6nX0LIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3vq-00000001DgX-2g4h;
	Wed, 30 Jul 2025 10:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3tL-00000001DPU-1hWE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 10:18:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D056F43AE9;
	Wed, 30 Jul 2025 10:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EFC4CEF5;
	Wed, 30 Jul 2025 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753870713;
	bh=h+BCO8YJEkpsRKWc/4ALILpB64xdaLoyxakMSh2vtGI=;
	h=From:To:Cc:Subject:Date:From;
	b=ijKPT/FjvCPMwW2xvWRvp3ml4Xudq1JnOITdsuv4UGHZGWUZh6+WXhPFbZ6eqOGlH
	 aozcZd5fn6+SbDtO8vaRQI7LGuWWLnrVAVNLye9x6RbsvJQkREQSDVsurLFYweZR+Z
	 9eWU0wJhe4YTF5G/vlu9RuDhtHZPr06YTVpncL+BWQ5Yq1xFglzXVMKl3DpDFMwIxy
	 Hd0uoto8dArixjDNdLCv4jOh+gk2toHnyqW0DYdSzUff3Hr7E01hFe+61qYBBXZAUa
	 DCvFhhL70AFI0ohbVEn+Y4adzWZFn28aIqdglM37p/BcnSoesnn1qJutQD/wrYb1z5
	 2SCgZAzls3jWw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uh3tH-002aJD-IH;
	Wed, 30 Jul 2025 11:18:31 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: nv: Properly check ESR_EL2.VNCR on taking a VNCR_EL2 related fault
Date: Wed, 30 Jul 2025 11:18:28 +0100
Message-Id: <20250730101828.1168707-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_031835_465764_04AC3639 
X-CRM114-Status: GOOD (  12.15  )
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

Instead of checking for the ESR_EL2.VNCR bit being set (the only case
we should be here), we are actually testing random bits in ESR_EL2.DFSC.

13 obviously being a lucky number, it matches both permission and
translation fault status codes, which explains why we never saw it
failing. This was found by inspection, while reviewing a vaguely
related patch.

Whilst we're at it, turn the BUG_ON() into a WARN_ON_ONCE(), as
exploding here is just silly.

Fixes: 069a05e535496 ("KVM: arm64: nv: Handle VNCR_EL2-triggered faults")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c6a4e8f384ac6..046dcfc8bf76b 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1287,7 +1287,7 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
 	u64 esr = kvm_vcpu_get_esr(vcpu);
 
-	BUG_ON(!(esr & ESR_ELx_VNCR_SHIFT));
+	WARN_ON_ONCE(!(esr & ESR_ELx_VNCR));
 
 	if (esr_fsc_is_permission_fault(esr)) {
 		inject_vncr_perm(vcpu);
-- 
2.39.2


