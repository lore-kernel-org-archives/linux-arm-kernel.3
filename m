Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF122CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fgv8cxeXcXUiefjT/Qhl5TKQBmdKKGYo7w9FHox+FA=; b=I7BdEfpkwdg8G1GQC02Gj7a4Fu
	EEhENZRt+Vkvin2F6FAgyynpRoi1KXx4pjBI4EuhyIHnACOfg2VNaPE6cpOvPCZ9f5Y9d54oDbfY4
	xykqB1vcplHoRX5OuT+M6VsD8zwILScmDpx6VAne4sPCG0yTiKcm7dr6n2vCT4QEJgEifzEKujZfE
	WKR3E3YPRFbimASja8TcgL339aeG3/8erP6gMMRz3lPLbQDrAR8hqM0/y40BpR2q0ylZftKN14rxL
	Ud+QxDhTk9ynHya0nHGJiyA6Mh0bp8Nwt4mZxVfFurdIiPOTOfZ/sjvih7Zxg+lDo+heVdpQphd/A
	NzpM7f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqc-0000000AKvQ-1gGK;
	Mon, 03 Nov 2025 16:56:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq8-0000000AJzI-20ty
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58C7D43C77;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD02C4CEE7;
	Mon,  3 Nov 2025 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188932;
	bh=Ksllf4QLmgdsUpwCGY9LSpYWYzEnFPQKXe3yy4PN5mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jj0mzUeNpCVIvienrf7new8E1injENLKMeUShmwFWj73Dz3uQwlQ2Fil62y8qWxjs
	 eDfmahHLzJGsHUrWab1xIeiihtKlKrOtWQEW9fBuImQNwyUO6T4UeYbj0b/Gp9T6eU
	 5MvPGbvs/7A7ssM6CJ7xgx8MvYN4Nam5m3dxy63q1QRAY7dGfKZvVRfQCVaH1hv0ml
	 kstpCFSewKYVeUYDuihhtmV/UQrcNtPwTjH3jO4lsdgx2/Lq1UNdhc9FSlGNuiBKb2
	 YaWns2EapYiMHHsPGzGBKNlJaJGn2gX7rvYqJZVgXvc2foETsy771L5LM+vW+rq/hW
	 lnBR1cwide1iA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq6-000000021VN-1cXg;
	Mon, 03 Nov 2025 16:55:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 24/33] KVM: arm64: Use MI to detect groups being enabled/disabled
Date: Mon,  3 Nov 2025 16:55:08 +0000
Message-ID: <20251103165517.2960148-25-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085532_560730_9F9A092B 
X-CRM114-Status: UNSURE (   8.04  )
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

Add the maintenance interrupt to force an exit when the guest
enables/disables individual groups, so that we can resort the
ap_list accordingly.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 5 +++++
 arch/arm64/kvm/vgic/vgic-v3.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index f53bc55288978..9d4702aec454b 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -39,6 +39,11 @@ void vgic_v2_configure_hcr(struct kvm_vcpu *vcpu,
 		cpuif->vgic_hcr |= GICH_HCR_LRENPIE;
 	if (irqs_outside_lrs(als))
 		cpuif->vgic_hcr |= GICH_HCR_UIE;
+
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & GICH_VMCR_ENABLE_GRP0_MASK) ?
+		GICH_HCR_VGrp0DIE : GICH_HCR_VGrp0EIE;
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & GICH_VMCR_ENABLE_GRP1_MASK) ?
+		GICH_HCR_VGrp1DIE : GICH_HCR_VGrp1EIE;
 }
 
 static bool lr_signals_eoi_mi(u32 lr_val)
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 79fa16c5344fb..e18b13b240492 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -36,6 +36,11 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 
 	if (!als->nr_sgi)
 		cpuif->vgic_hcr |= ICH_HCR_EL2_vSGIEOICount;
+
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG0_MASK) ?
+		ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
+		ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
 }
 
 static bool lr_signals_eoi_mi(u64 lr_val)
-- 
2.47.3


