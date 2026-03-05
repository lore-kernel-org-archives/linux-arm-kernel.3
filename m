Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955CAF3D32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/8Q0uO9fn7N2aNObdrJAfX+BnNEdYRQNZ6cnN9zLhE=; b=hVX7cPeXUBMskHNk+YaXkuGFZX
	lDt/4VlWsHX2yVzhnM4an//eYS11pkjaP6VmW918FNQgyJXwcLoDmmfwmn5Vlt9pLvAUwLbkAQo0T
	j+OSzStLS+PTs2SWjA+0OULUOAB1G3psvldwUSlrZKZcjL2r9xSEMCB68DNApLBXzVLd4u+D39wSb
	rZ9qeRb3poo9xITQCJ5uzTTHlD6YBMGKKCLCWuonSflESeKhpVhWcpfTcIIff7XlVQO5HUXW/EOGz
	4eS+FhYDxhKTgVzPMDv/dc8r2npCToPvG6zNL5T69wAz9yqXNfaO0VHBZAyvafZmyjnZKnQ922F20
	dd+D/SYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZG-00000002Cwn-1mQZ;
	Thu, 05 Mar 2026 16:28:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBZB-00000002CuK-3XK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:28:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b790af67so2854246f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772728128; x=1773332928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/8Q0uO9fn7N2aNObdrJAfX+BnNEdYRQNZ6cnN9zLhE=;
        b=vMJe28yJtNPEO41iuX+ygyWLDuftsDoW87pqGNlxSzqoYQ5A77WvX1v+fIIlQO/D5K
         +jOB96AC7bqHgD9etVDSlQuElOG0nyUG0vnPbzbG1Bsib3uc/6ZkvaWVX4ELSa9WOAB6
         k3d8KU2R83EeLeh9WvK85g9OxVZkKQGs6Wvmj35n9L3FKc0Xa253gwDZ9fUd8O88VEGc
         ugPJt+i1jMQpS1AZbSnur14SWq6qcSTIJ9rfSVzIPgIFg/vSdJejpFskivh+r1JUnY1j
         VzoVoJ2BFrETWRTGTiD5QJagDWa+C2i5Lve+XvwvgyomNgwt24pK/NLne7JfBamQh0B9
         q8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728128; x=1773332928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/8Q0uO9fn7N2aNObdrJAfX+BnNEdYRQNZ6cnN9zLhE=;
        b=OnqmFFBPOhfkH32WONhuhfwNJEGunQQJLb40RUWVQywzi+k+Ab1NHiyIvS5WEsSv3A
         rwbxgCsKRSxbMklp2Eq8omjTWZtxx6Zilk+DuvxzleFm1+NY3Zfie2fFtUz9/EEa815h
         qDXRRUNQFWastc5pKZSAVyT+JYScITZ3Ebg5ksgNnr//2w4uva4DgOBoJkNtDkHlOWK2
         oiS4+0z2g0Z1YBsBFTicD3VGzHLQMCheA2ishzbdUFLB90jMxnjE0Buk06+CR99gCco6
         524XFrQC9vHY4nYsmD9od0Giwj+rkDUEUEpWLjNjUW+2BGJ9v/UhVzWPXzyV8UiZKZIN
         mXMA==
X-Gm-Message-State: AOJu0YyS5YL3hPdpNc0q+zGnDLSu/2/HaqGdVV6wxm/qUEzK1C6WrIoY
	GW8vZjUC5hE/kk4dwKSm/khgNMVqEeyZszjO/zSHhPSRIu6LRb1kKtdJlF92XSWuKnA=
X-Gm-Gg: ATEYQzybAjeEXKopClEpVJH9jmvviVsfXZMulVO8XV5CA76b/15D1DpkJsd8lCnL45O
	wWJwzYg7LhcOHKg4g+dlS8SB4Uey3JyWPtnxLBcWkl4nYCH9NjIi0chcK8h7XcPHebzDLzFqC3Q
	+p6t0NuZr7+rDKbRGZ717nr2XlrZgQLEqoM2Dc3C9eEPX+8mch3wYgrgDC7g++RIbzttmV4GuY+
	Z1Au9SRVZPr+NrMJmzrPlcTICodG2z+gHDlif22nHIiU5RwFYBs5o3t1eEuolsKEhmpsOVlPw2/
	6PWIPVAzxrnY8ho6KZGGmfBgpqRkQ+H80t2bIACNWgnr0OMfxCoBIWr8C7nkPfAEOlFsRLgrRts
	L594n+cYsiWWQIYCeRigDoHTc3N4uI1FyvM6I1utMxx8EYsE2T6ssrgBu7RX+8zRcKnXvUiWGtV
	whhn8H30mM0h63SCZDO4CnXpaOLGhCkoqv
X-Received: by 2002:a05:6000:1849:b0:439:ccd7:cdcc with SMTP id ffacd0b85a97d-439cfd65a3amr5335384f8f.18.1772728127425;
        Thu, 05 Mar 2026 08:28:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c2f8c0e7sm19596034f8f.29.2026.03.05.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Mar 2026 16:28:17 +0000
Subject: [PATCH v2 1/3] KVM: arm64: Read PMUVer as unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-james-kvm-pmuver-sign-v2-1-ee80a125af9b@linaro.org>
References: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
In-Reply-To: <20260305-james-kvm-pmuver-sign-v2-0-ee80a125af9b@linaro.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_082850_049797_CACFD556 
X-CRM114-Status: GOOD (  14.17  )
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

ID_AA64DFR0_EL1.PMUVer is an unsigned field, so this skips
initialization of host_data_ptr(nr_event_counters) for PMUv3 for Armv8.8
onwards as they appear as negative values.

Fix it by reading it as unsigned. Now ID_AA64DFR0_EL1_PMUVer_IMP_DEF
needs to be special cased, so use pmuv3_implemented() which already does
it.

Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3ad6b7c6e4ba..f4d7b12045e8 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -10,6 +10,7 @@
 #include <linux/kvm_host.h>
 #include <linux/hw_breakpoint.h>
 
+#include <asm/arm_pmuv3.h>
 #include <asm/debug-monitors.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_arm.h>
@@ -75,8 +76,10 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 void kvm_init_host_debug_data(void)
 {
 	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+	unsigned int pmuver = cpuid_feature_extract_unsigned_field(dfr0,
+								   ID_AA64DFR0_EL1_PMUVer_SHIFT);
 
-	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
+	if (pmuv3_implemented(pmuver))
 		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
 							      read_sysreg(pmcr_el0));
 

-- 
2.34.1


