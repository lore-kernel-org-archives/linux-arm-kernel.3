Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EFEC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DK6uM4OCMEufJaM16uRm6cXGr0jOYtB1myNeR7Sl5w=; b=PEftkwY2Qh4LoGKxIrMgsfNiz7
	L/eySHOIIA+cZ7J/Vvvd4eziT4TEJ4CL2fYV+wF90jMLDBPA0VyuQsUhyXad6uC7BrboNRAtkuK3L
	vSUduonltwpPlG2+fZlypoqzYsvanqeEECzZ1NYGamOUxMxYu7NI7TfswhKSDHIdg7QMJ1CO2na28
	mLVVy0tbY1c88S9oZy70ReyUCi+85ckzzkUihCv5ltayGXO3mpwmTe0PgMeT3NF7hxt6Hqf8Peyby
	y0VNuPznUk2P/LTdsCHynQrj7l8QqAbkHJdSsJ8Vpp3ivIdqMDLTxhvlcnThkEXyN45AZHm8qzd6O
	Xt2fELUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8O7-0000000FKNx-092C;
	Thu, 05 Jun 2025 11:03:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Al-0000000FIGo-0Ro2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so5183155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120609; x=1749725409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DK6uM4OCMEufJaM16uRm6cXGr0jOYtB1myNeR7Sl5w=;
        b=q8xwB7ZaJmmCTd6izHM/CYYtD1GwVMEDTVswrctl59bs0/+elCgp8Ii3qCB9Sp4bAi
         d73tMBmF/c/iUTsun5GlWoZf3wiavzzhpRl5G88eIa3MmbHAW2UQwElwSJrEMmrMN4Ox
         cKSG7F6OmUAcvmXLQMa7CBYoJ/U+vUsJzsemQy7O+Z1GldSKFeXnEpaLUvxHoXpKtL4b
         RYNuvKdPkReZ67Fz5fVPK06XaT/vt2aewlFoE4Ab+7UR3sCY2f4kbPw8F99pCos99o/w
         8duRlRsM1C04ULJbfx9j0i376UjFnhAK1ezWdhuHdTIJvc1xehhSJ3LlHlIUlQriRQ6p
         BqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120609; x=1749725409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DK6uM4OCMEufJaM16uRm6cXGr0jOYtB1myNeR7Sl5w=;
        b=A+3cmddBs2E1Za+LHuAGUIOAE25QUqKWeWjZbSvs+5WdnDjRqvKSDebiOLZgiACc98
         onIgNPQ1uOs0ZhEUCa4k/PblC0ODDus/+p1U5fuuRt6WvZ0Z8X8oW7fYLpfSDwPKtn4+
         Z1vfWZPHa8TnVuAidbl+kfTHt1+SyZ2zSCpy6wQUVnxvwbhIPKXZQF2ZpcP25a+TF6tA
         xXWMxzu6Bwp5gKgD7IHwZgVGybcSoxM42FLoT4Nkd13Si9viQHV1WKuvXdcSVGYVbZ7v
         FyHq/u2AzYqpi+pb1sc7rkgIpxEm3lW3XdFhHaOR8sujanHRHoEEiDZq/hNdtXuFpA3a
         SghQ==
X-Gm-Message-State: AOJu0YwQ7x7NyGCXS29/9RizXbguIdYlAOg5tlslphmYeT1szIksengm
	SeaS9AYm/HYUZraYzf7teSuNsm/tEf8LnB11ROKALe4iZulsbPfv/9nr7Tz9VpGepoA=
X-Gm-Gg: ASbGncu3oZwd6RhdD1rRW0AbjiY+ilrc5HTKW6SR4ME46J524Nlr7FNM7hIMLTRXz6s
	OYndQax/2bFvTP/f+jt0Ap3uyR1SgA6tApb1HhsuSgF55HuSLJl8XJvQCRZwIhZz2f5D5XD+I3a
	wukf8q8zDYzXiU1ZVpQ0aVvR9swQcn92ji4p1vIUUa/P54TP4aX1a2DLYhSuD5xG0uECQg9YY9s
	vz2lK5TmrVRrL0O3szs8YU0RbeK9pRGKwbq0sthpfYLHovsOqqarTl3BYjvPiq/Y2PC7kIs+Hk1
	N4MUvSNSTkaOhX7OSPCf77Rve9OJS/yZjWELTruoNy5fxZyJdtQakV25qixePdH6LGUuAEw=
X-Google-Smtp-Source: AGHT+IHW1X+WENRurUa43xQ9bej2IvG2qfN9i4ZVKvWxfljVS3ufqAHPvcXy1cLSRDDK8lgBUz9YNg==
X-Received: by 2002:a05:600c:a089:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-451f0b0c598mr53918705e9.22.1749120609367;
        Thu, 05 Jun 2025 03:50:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:03 +0100
Subject: [PATCH v3 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-5-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035011_154163_A2249CD2 
X-CRM114-Status: GOOD (  13.20  )
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

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
its VNCR offset so add it along with PMSDSFR_EL1.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/vncr_mapping.h | 2 ++
 arch/arm64/kvm/emulate-nested.c       | 1 +
 arch/arm64/kvm/sys_regs.c             | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 6f556e993644..dba0e58a5fac 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -92,6 +92,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3a384e9660b8..60bd8b7f0e5b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1174,6 +1174,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a6cf2888d150..4a88ba15c7df 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3008,6 +3008,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


