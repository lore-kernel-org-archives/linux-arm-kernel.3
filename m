Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51754E69184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJeINAZHCBu2Qf4xyRN0jajeOXOn86gSYL/Mvl+4mzU=; b=DbtIXN/5UWzK5avbyG4BNsC9SP
	N8qi6BrRQQOGbU5tm5aPTgvZkG1ZX4xpry+KLMy67Ljxw1S7oyZBxEtI1IQVvHhfS958X7QobpPc3
	CSCdjLImgyDKbp4Z8COCis7owVVftiazQbwpA3y2oe8Ti8+RUolrSPus/+fjJnCgwWNJUhsxMtxmt
	EtVPZnSMNmKfdduHyRUJJH2+9qoNx+i+9YpKvIIAO7EWD9b9EWG8qSzXZF9iFV5+PxrjK6Wpi41T7
	fbjXmWUr1FKj/e5RBLQT8ieKRMJt2QHVnS22TFG4HIiEDhTJMS2iGav7/xWX1aYMGIqMLumnJJ3iz
	ixc1q7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWpJ-00000002tFy-1l4m;
	Fri, 22 Nov 2024 16:48:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWoL-00000002t4y-3pif
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:47:15 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3823f1ed492so1919387f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 08:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732294032; x=1732898832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJeINAZHCBu2Qf4xyRN0jajeOXOn86gSYL/Mvl+4mzU=;
        b=xqdFPtbZzRBtHadUZXDIYPu8BQwR3AzgX1aQaBilqGGxJFVVkyWaL/aF7E9aKW3nFn
         ZsRR261STCxRUgLfYux7AxIx0yWi04yLVJoH5N6ua5pVsITzYBafLT4IBeDrfeb4nQcJ
         s3NPMGtvM6qX5Ge1XffFXV63waPVfNiO0VOr1PQXGSb+EspNZvjRYjVWpOVA9ba5R95q
         hXmwgb/ArEdVMXi7STawH6dhwG/VntOral15MTxu6hv8y+/sp8RhvqMN1PYuYx7alfwj
         bx75b025FfFKIhtgD+CMvhkYlOo8acrbUlV4Bl3oy1lujBsu2O0jWl1Y82Z8Y1bQvffT
         L67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294032; x=1732898832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJeINAZHCBu2Qf4xyRN0jajeOXOn86gSYL/Mvl+4mzU=;
        b=jN9iImoXRlwU3o/F4YrT9MtVtc7JbaCPoW6iBsFaV5hy0NqiPqC3A2imboT/ZnKjuG
         i31SAeCfVO/Hn9JJhGvA6fR/9fHfUkP99BBdL2vB+2ownzvsNQqqs+IQkm39Eq5mrlie
         EF7C9tSMv3YDV3RAbmzA2mbMNPPSHUW1GjvNFdqnBUaY5oOhnBoYuBU+dWT/72Fh/zmI
         RCriuQFLplx/4i8jIprzoJyGEkbY6+Q9BAjwsKC4s77BuuKSUEFcCD1VtieVOv+OaU/f
         dMY3w95wEiDoZqfewOo1b9/4BGVLDAJBhxZtlr+ptU4LSO+P2Z2p3+f1LCd6BtGM9JgG
         b6yg==
X-Forwarded-Encrypted: i=1; AJvYcCURP5H0V9p5DcirykKf0qG2jRbRU8jJtDagCrrKxjTGU82x/OgyIvS3GYTexyFVZ6QoqWhROb0PjiMiWkTr3tGt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9LxRY5uH6bl/puxTwYQD5wkCtpSh/2185bjBrJRBrUGEBmOy9
	fFDbUx0lzJV+Ngj1jIuBPY4SVfLHJFV6/0KDLKgx5i2SVMYPiN8hdBmMAuxIEhE=
X-Gm-Gg: ASbGnctNeonaWHsU5fzezeKOtEoAsytpj6ZQ3yY0el+FKsWkxK7i62+YmRVZja5/B5F
	gwPUvdQdDsHglTf5KOjvk0gwO9461jpbOwSuIHOSgsMTB8p0gN26Wn/Mu3a1tSHIth+p7lnjalA
	0gH+xIM/zn3lUBihALgjQQCt6c7e+FTlrL9XL+mc6kS5DFSx8R2KrXpD37swPjUMSeankf7AKCA
	ACEkAQc3nh2ALuVEpAYCtWMJXggNL/J3fad2X6SBW1n7ig4Ex4=
X-Google-Smtp-Source: AGHT+IHcQ74w3L8E5gBsmMqb9rkz/2NNvWSY9aaHifqJFdgHc67xg00mFf+1ZhdtlpPb45JX0tyD6g==
X-Received: by 2002:a05:6000:1acc:b0:382:42d7:eec4 with SMTP id ffacd0b85a97d-382601132ccmr2984325f8f.4.1732294032116;
        Fri, 22 Nov 2024 08:47:12 -0800 (PST)
Received: from pop-os.. ([209.198.129.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe91a6sm2897458f8f.86.2024.11.22.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:47:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: will@kernel.org,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: Fix usage of new shifted MDCR_EL2 values
Date: Fri, 22 Nov 2024 16:46:35 +0000
Message-Id: <20241122164636.2944180-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_084713_950742_11EF2B6C 
X-CRM114-Status: GOOD (  12.93  )
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

Since the linked fixes commit, these masks are already shifted so remove
the shifts. One issue that this fixes is SPE and TRBE not being
available anymore:

 arm_spe_pmu arm,spe-v1: profiling buffer owned by higher exception level

Fixes: 641630313e9c ("arm64: sysreg: Migrate MDCR_EL2 definition to table")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 4 ++--
 arch/arm64/kernel/hyp-stub.S       | 4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 4cd41464be3f..f134907d3c08 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -79,7 +79,7 @@
 		      1 << PMSCR_EL2_PA_SHIFT)
 	msr_s	SYS_PMSCR_EL2, x0		// addresses and physical counter
 .Lskip_spe_el2_\@:
-	mov	x0, #(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT)
+	mov	x0, #MDCR_EL2_E2PB_MASK
 	orr	x2, x2, x0			// If we don't have VHE, then
 						// use EL1&0 translation.
 
@@ -92,7 +92,7 @@
 	and	x0, x0, TRBIDR_EL1_P
 	cbnz	x0, .Lskip_trace_\@		// If TRBE is available at EL2
 
-	mov	x0, #(MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT)
+	mov	x0, #MDCR_EL2_E2TB_MASK
 	orr	x2, x2, x0			// allow the EL1&0 translation
 						// to own it.
 
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 65f76064c86b..ae990da1eae5 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -114,8 +114,8 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 
 	// Use EL2 translations for SPE & TRBE and disable access from EL1
 	mrs	x0, mdcr_el2
-	bic	x0, x0, #(MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT)
-	bic	x0, x0, #(MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT)
+	bic	x0, x0, #MDCR_EL2_E2PB_MASK
+	bic	x0, x0, #MDCR_EL2_E2TB_MASK
 	msr	mdcr_el2, x0
 
 	// Transfer the MM state from EL1 to EL2
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 01616c39a810..071993c16de8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -126,7 +126,7 @@ static void pvm_init_traps_aa64dfr0(struct kvm_vcpu *vcpu)
 	/* Trap SPE */
 	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMSVer), feature_ids)) {
 		mdcr_set |= MDCR_EL2_TPMS;
-		mdcr_clear |= MDCR_EL2_E2PB_MASK << MDCR_EL2_E2PB_SHIFT;
+		mdcr_clear |= MDCR_EL2_E2PB_MASK;
 	}
 
 	/* Trap Trace Filter */
@@ -143,7 +143,7 @@ static void pvm_init_traps_aa64dfr0(struct kvm_vcpu *vcpu)
 
 	/* Trap External Trace */
 	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_ExtTrcBuff), feature_ids))
-		mdcr_clear |= MDCR_EL2_E2TB_MASK << MDCR_EL2_E2TB_SHIFT;
+		mdcr_clear |= MDCR_EL2_E2TB_MASK;
 
 	vcpu->arch.mdcr_el2 |= mdcr_set;
 	vcpu->arch.mdcr_el2 &= ~mdcr_clear;
-- 
2.34.1


