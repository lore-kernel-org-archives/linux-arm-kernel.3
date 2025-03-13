Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov1QC08xmBeOUCrm+sZTVT7zWaIK1Z9CIL8k0jXnjDA=; b=WSsjAg8eooHme/OzNAXuL3oT49
	tl4W9Lvfc2j/yHOalXES55RN4Mez/ardP77OzVYYvVjYW06O3re4Gmi2ZTaOF02Qq2taIwuYQtrL4
	yCcpjD9roQ8SbTTdXH8zjjqUrARp2mqT70XthnIgOU6axJ0XG1h2XPpBM2Qd/cwGGmvA2eC4U0WuT
	1yyg6ifccQF1aMlRKBcjjBBaj5e2/kRivQ2y/5/2tEkGnHlvXjKG2k1JSNFmQrI3G3ZPYtUP/mIDe
	fF+iTt0m+3bAQKEw4yKcQOkY+C7U9G3JIpRhMhSVrnNa6wvXXg6tywZHLXAwcuPPcmRS//IdG/mlZ
	vaK9qc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsceA-0000000AIw0-0jyA;
	Thu, 13 Mar 2025 07:06:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tscWF-0000000AH1e-0zSX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:58:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2241053582dso15436615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849094; x=1742453894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov1QC08xmBeOUCrm+sZTVT7zWaIK1Z9CIL8k0jXnjDA=;
        b=2eboIbxjjn2r4D/fixNJ3LnmnhfZk8v5pRTaU78P4/zOd0peBcj+724s8rhrwwx/Uf
         j9YQIkqJEPZ/xKG++WEr0KTX30MEfmpKR8nZ4aipgN8l9E5oxzj4dVab4LIQ68PkQSg2
         rUK1/613nqWwzvkwW10G7o56YnNUo40E2Gw9A/w4068SL+kD42bDy8xj2qin609/+GKl
         wo82iPZC4rwLs8akH3Io5c//MG4fUYKN+cBG/27WYYydtbhHqZrL8kg9jzHRuLUsPzCB
         dF7az9GYtJf3YyH0pYPLK1/To+Ha16EhlyCNLv1RHSEt1IkOeG1TTj6VfIE4Lc5vDo3R
         e1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849094; x=1742453894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov1QC08xmBeOUCrm+sZTVT7zWaIK1Z9CIL8k0jXnjDA=;
        b=YQlhk91x78CdMVYz+UKrw8nMkPfyiUSDn8+H5HHDwVTKeTHiXtS+KCPQHoretIEIgb
         VUPQvRkNNvaIItJjlMx2+AWAwFQVAzu6HK45kl46jQfzWG96VfOkZ1tWUOintBJchvwn
         N118Hen65OALABItltPGIDMuHXoKWVMMjddpBm0EIFhnyAbctvKC32OiYAXeQOOKemMl
         jXLZtDJH7b9s7ie+TJ2Z3Lw35NaQ5Dc8hiKp7j9l5+8zNhir8miixD8MZwmn1I5rVjsD
         y3ho+e6PcQVyu/uj4S6JwmD6OwwiBckqHX8/PLxSuUFIzCgJayuy6vRopNLNxvtmNlKo
         DpXw==
X-Gm-Message-State: AOJu0YzTlIXDb0Pq0l/YEnmKUjHb4s8B44nRTlyRFVTSryBLbNfOzumT
	n6JJdWh0dAVgXL8D5VrybfIsco2EdoYc14p5CfHdT5glB1Pw6beKFU2bzwY0IZo=
X-Gm-Gg: ASbGncuC6Ys26Y8onKgbUhs0S2caSEhu7qUtozoxf8aD+15Y9BzsyWV3asnkemCerlm
	DofuDVGKdejJwPbCGyNeNwBmuVcdUPCpW7uMvFWxLSvNwrxLKt+8S2o1Gow38NkWp1RAwYv2i08
	Ym+WDoD6ypmo0SGkOBgRkB0Z1Ck2LifMhum5YtJotLUG06VfpxjZhuRezvEWtG2v1/zdCyUzPkU
	tROT+W0n5X749QQfNb89Whm/YwLpRW8p3+uwEpYvnfSshbiy9FY4dY6JSBJSYIlrS55RRz7HibV
	pp65aBXRNfvocYpAP4TQ9L1yq5XyUT6g1IR26njTpwTlw7aE
X-Google-Smtp-Source: AGHT+IFPWy7B2BUY2WAUGm0CDCmAcyU/PA9aOMoalJWaDBeBLNlBGUj9py5eigGDQ0JyyV1QjpJmAw==
X-Received: by 2002:aa7:88c6:0:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-736aaadf9c1mr39387147b3a.24.1741849094416;
        Wed, 12 Mar 2025 23:58:14 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7371167df97sm627290b3a.114.2025.03.12.23.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 23:58:14 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 15:57:45 +0900
Subject: [PATCH v4 4/7] KVM: arm64: PMU: Reload when user modifies
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pmc-v4-4-2c976827118c@daynix.com>
References: <20250313-pmc-v4-0-2c976827118c@daynix.com>
In-Reply-To: <20250313-pmc-v4-0-2c976827118c@daynix.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_235815_278062_C703BA32 
X-CRM114-Status: GOOD (  15.04  )
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

Commit d0c94c49792c ("KVM: arm64: Restore PMU configuration on first
run") added the code to reload the PMU configuration on first run.

It is also important to keep the correct state even if system registers
are modified after first run, specifically when debugging Windows on
QEMU with GDB; QEMU tries to write back all visible registers when
resuming the VM execution with GDB, corrupting the PMU state. Windows
always uses the PMU so this can cause adverse effects on that particular
OS.

The usual register writes and reset are already handled independently,
but register writes from userspace are not covered.
Trigger the code to reload the PMU configuration for them instead so
that PMU configuration changes made by users will be applied also after
the first run.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/kvm/pmu-emul.c | 3 ---
 arch/arm64/kvm/sys_regs.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1b91e5188d52..3ed8b74d9925 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -862,9 +862,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 		   return -EINVAL;
 	}
 
-	/* One-off reload of the PMU on first run */
-	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
-
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 26182cae4ac7..11718c635e2f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1143,6 +1143,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 val)
 {
 	__vcpu_sys_reg(vcpu, r->reg) = val & kvm_pmu_valid_counter_mask(vcpu);
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
 	return 0;
 }
 
@@ -1303,6 +1304,8 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		val |= ARMV8_PMU_PMCR_LC;
 
 	__vcpu_sys_reg(vcpu, r->reg) = val;
+	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+
 	return 0;
 }
 

-- 
2.48.1


