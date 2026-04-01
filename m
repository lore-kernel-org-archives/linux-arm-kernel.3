Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79926D35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b83TMPIGbewn5MMBylg3tsf9PKZdJXdFCxeUTPW1vRU=; b=Ku0BCOiXSHtOFyC1NxjElRMJ2D
	sAvSf3lNevEDtE4jdbdNYf9M5VvQzsnc4wTmb7x+m63rVkdeyGYNQIYPqP8NtYyh89a6PhVg+a6rg
	N0mBw/KL978qYaxYKfyq1CuKB+Mrc6e4Fu2MHDnnZO0Sa/MKzAjEuulkug9n0prwjy7wiYaKcbcwQ
	9VoxXQidNtUie7gQMJ9g6Ae+ZldjGzi9OPTJfDY6aOXpTvM+UqiG8X4DjuMxAvGaGrGRPl8QGVQSH
	nnjO3isHEpl2JPN4spyyEV0MlmUPIDhVu3S//Dh1L9Y0Zo7N0NkjqTz77sLhvpx8Aa+M2N04+XeOf
	MKjUEwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWDM-0xbw;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw4-0000000EWBT-3POV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2DB46012B;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A202CC2BCB2;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039791;
	bh=9SSNf2eTb88mADUo0OsqGQAQIhImdgzxoY2EMuClaX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYJitCajkUzG0xP5mvm+XDaqcV639Mxf5q85t9u5hKr8uC72VEtDCN/TNm1FqkmXp
	 Iq2PmMb7Yf6zRhiLD7s72nzFO6iO0imBr5quTOv2ggl51DrR34JgdJ20Z+34kigRkH
	 ILXZ2ZkrxoUv5lvOGuNIIQjix6datJaJmzEZQLF5P4856F+kL0thCtljj2ij5M2cpq
	 l5jFLfXtaMF2EfyO8fPLEuBiiMbCmOZJTkbhjmghH4S6WMfSBq1yybu7vOqTMWnVZu
	 JrarA1KjmB0L6jBqmlJDrUKdcDnyq9EVGY6EaqlFBmiR+J31vN8F+YLduWYP00PJ6m
	 pKaXi8oZP215Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw1-00000007oRQ-2jBx;
	Wed, 01 Apr 2026 10:36:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 02/16] KVM: arm64: Don't skip per-vcpu NV initialisation
Date: Wed,  1 Apr 2026 11:35:57 +0100
Message-ID: <20260401103611.357092-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
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

Some GICv5-related rework have resulted in the NV sanitisation of
registers being skipped for secondary vcpus, which is a pretty bad
idea.

Hoist the NV init early so that it is always executed.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: cbd8c958be54a ("KVM: arm64: Return early from kvm_finalize_sys_regs() if guest has run")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e1001544d4f40..18e2d2fccedb8 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5772,6 +5772,12 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 	guard(mutex)(&kvm->arch.config_lock);
 
+	if (vcpu_has_nv(vcpu)) {
+		int ret = kvm_init_nv_sysregs(vcpu);
+		if (ret)
+			return ret;
+	}
+
 	if (kvm_vm_has_ran_once(kvm))
 		return 0;
 
@@ -5820,12 +5826,6 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 		kvm_vgic_finalize_idregs(kvm);
 	}
 
-	if (vcpu_has_nv(vcpu)) {
-		int ret = kvm_init_nv_sysregs(vcpu);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
-- 
2.47.3


