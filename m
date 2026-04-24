Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AFEFE51E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75xbgkgj9TP8McSEuAQtz161daMjjx48XqQqIGgEMWU=; b=Ys5fVPfFQwYJi5ApwtBngggFyb
	Y9TihYz7E5HZSMNLbBEphF3aBzFokdcGuwGEI6j0f6kBC6TfMtlBI3rmQjMNdguHOEQiR6O/krtUc
	s/8301hm6Ie7xkMuStVmTlHgeL2PI471/1Rg8kEHD2ilDX/mgWixin/ERbkXsJcXPKPbvFFaTq+gh
	sIXi+nEzDi5/bpRPfkFRuI7I62lYIQiiGlLSOErwCJ4gwWjwvk33tO+Xlj9eDeP5Rx/+FgM9KymMb
	3gYw0Ai2WqKADI5dWKU14PkdomyURgeQIhCStTUZ1p28/5RJHwW8xk//nCPctqkK7PfYf4cEPsoP9
	trsc9vMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDu-0000000Ct26-21QC;
	Fri, 24 Apr 2026 08:49:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDr-0000000Cszc-0p3s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:16 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4411a69f565so4297016f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020553; x=1777625353; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=75xbgkgj9TP8McSEuAQtz161daMjjx48XqQqIGgEMWU=;
        b=RKN4NZVxX6dAizHOjLBnBrE0ywv1nieCAspr5m2eXuAO6r1RsVlxTyYtGQi+8CLRMm
         bNM6Bjk7e9HvCKkh33Rmi2Ujee2XOw5t82OdxFMFgSljlu3XEii5ZognxhVBahOj4LOX
         tcG08j5YZ6kQ/4OJeyn/s2eSWrS0UBBI63a7Edo8WLYQ1XtfVdY4SXyJcdPv1fD6DMOa
         UPbZcF3dqtJs2wlA86MHzAL2M4TeoMqzMKddVth4Q9UQ+NflIIZ3Mmft+7lrOkki800N
         yHpsZdRBU9Zendjs/DOn3xsCRVua4Rzc5xud+skkCIOurQPnb1lX8zIdcy64njr4H4YY
         vxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020553; x=1777625353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75xbgkgj9TP8McSEuAQtz161daMjjx48XqQqIGgEMWU=;
        b=eEf+6WUYeDRLREL8ej99cHLDS0DBfy8DhicnaEYbRr3+CKCEBJfp4dIHlqwvh4Wl3c
         wTNVXCXD1C6tWHnJHK+++JK6OmNLBkpw8gaBMf9wdVH//F/GUPLTR9fyo+WOJtwAGSv2
         OhE+vA+nESmKbq+noAsiLJ41hPcRNkheo/AfV+eYmULeIR7z3xII5tdiV/u6xXCn8X2j
         X+zNf/8hSReYWhiavty97tBrJBXhMgzu2SKqorP6PS7di8VQ4OVFrQqzoTJQb7BsBn4C
         lM4S7xmVH+V/PwEOS8KCOym16hVZxHjDKmLdugfM/MVuQcB7pJ8ubuOKDfaIy66ZdPCX
         joTA==
X-Forwarded-Encrypted: i=1; AFNElJ/kVTzWDfS4fmcm+GCO0eGrSe7puawv/efQQLpNucKriWIrSRUrNfik63INom+32GKFeZO5NxbqGvNvTPaz1KbT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+varntTD+p+TGW2AnO2RrkQxCNyU4b/V/NxBJwfDzZ1mouHAW
	YgvPyhF3469LrNFLD1lxpPoUaeKlTpqlmfHf8BxcSAngestELLxTryXVEqT86UC4BYC+2z9jHCc
	MEQ==
X-Received: from wrpx14.prod.google.com ([2002:adf:f64e:0:b0:43d:7088:5f55])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2f83:b0:43d:7d6f:f529
 with SMTP id ffacd0b85a97d-43fe3e0dc49mr47722399f8f.31.1777020552885; Fri, 24
 Apr 2026 01:49:12 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:05 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-4-tabba@google.com>
Subject: [PATCH 3/6] KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014915_252033_1FC7F266 
X-CRM114-Status: GOOD (  12.63  )
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

FEAT_SPE_FnE is architecturally detected via PMSIDR_EL1.FnE [6], not
ID_AA64DFR0_EL1.PMSVer. The FEAT_X macro form (register, field, value)
cannot encode a PMSIDR_EL1-based feature, so FEAT_SPE_FnE was defined
identically to FEAT_SPEv1p2 (ID_AA64DFR0_EL1, PMSVer, V1P2), producing
a duplicate that used PMSVer >= V1P2 as a proxy.

Replace the macro with feat_spe_fne(), following the same pattern as
the sibling feat_spe_fds(): guard on FEAT_SPEv1p2 and read
PMSIDR_EL1.FnE [6] directly. Wire the two NEEDS_FEAT consumers to use
the new function.

Remove the now-unused FEAT_SPE_FnE macro.

Fixes: 63d423a7635b ("KVM: arm64: Switch to table-driven FGU configuration")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/config.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index a722ea178f68..0622162b089e 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -131,7 +131,6 @@ struct reg_feat_map_desc {
 	}
 
 #define FEAT_SPE		ID_AA64DFR0_EL1, PMSVer, IMP
-#define FEAT_SPE_FnE		ID_AA64DFR0_EL1, PMSVer, V1P2
 #define FEAT_BRBE		ID_AA64DFR0_EL1, BRBE, IMP
 #define FEAT_TRC_SR		ID_AA64DFR0_EL1, TraceVer, IMP
 #define FEAT_PMUv3		ID_AA64DFR0_EL1, PMUVer, IMP
@@ -302,6 +301,16 @@ static bool feat_spe_fds(struct kvm *kvm)
 		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FDS));
 }
 
+static bool feat_spe_fne(struct kvm *kvm)
+{
+	/*
+	 * Revisit this if KVM ever supports SPE -- this really should
+	 * look at the guest's view of PMSIDR_EL1.
+	 */
+	return (kvm_has_feat(kvm, FEAT_SPEv1p2) &&
+		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FnE));
+}
+
 static bool feat_trbe_mpam(struct kvm *kvm)
 {
 	/*
@@ -537,7 +546,7 @@ static const struct reg_bits_to_feat_map hdfgrtr_feat_map[] = {
 		   HDFGRTR_EL2_PMBPTR_EL1	|
 		   HDFGRTR_EL2_PMBLIMITR_EL1,
 		   FEAT_SPE),
-	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, FEAT_SPE_FnE),
+	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
 	NEEDS_FEAT(HDFGRTR_EL2_nBRBDATA		|
 		   HDFGRTR_EL2_nBRBCTL		|
 		   HDFGRTR_EL2_nBRBIDR,
@@ -605,7 +614,7 @@ static const struct reg_bits_to_feat_map hdfgwtr_feat_map[] = {
 		   HDFGWTR_EL2_PMBPTR_EL1	|
 		   HDFGWTR_EL2_PMBLIMITR_EL1,
 		   FEAT_SPE),
-	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, FEAT_SPE_FnE),
+	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
 	NEEDS_FEAT(HDFGWTR_EL2_nBRBDATA		|
 		   HDFGWTR_EL2_nBRBCTL,
 		   FEAT_BRBE),
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


