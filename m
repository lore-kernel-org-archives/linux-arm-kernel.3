Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C5EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ3PtlOR0m4xvI+xrlOA19tnjKSe6qe5HMQ0ewIzj6Q=; b=LLwr4lcREpWXIj4wQwwCVOhJXn
	qj22hGzm8H73VfuKkGJx6Xrn6343EFPA2D8QqKq/Pze931tosVRaxLtN2EPjugXTXCAU25u3LHNc1
	tWPaDDEkBzH3efMOWp5LdkHaiCPPc07beAngenT4aY42zisdU2tIoo74I8g1fbLz3S4yAs5Rl24za
	qOtxHOaknbOJi+ktdVG9mVf7sGkpIYlKGjQ9mya2nBaXyyBtqnK59hyYeQyQAHcI/1eObHUBKcLkP
	X0S/A4sC8RpG5qnz2ZK7X5tXJdMUFGSq9LK9nZcuWb5Tn+Z19lgVFB6/0oXsDXYcU7qYy9fO4pDMb
	I5SA22fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrDl-0000000HTBU-3fhJ;
	Mon, 21 Jul 2025 14:10:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCm-0000000HKqz-2jmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so44641755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103119; x=1753707919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ3PtlOR0m4xvI+xrlOA19tnjKSe6qe5HMQ0ewIzj6Q=;
        b=P0NwKjxyz/sSEF03vsXe1OloqAnf1q78NvKVHc7moSVmRiMn4TraJlVxs/1gCu2lMP
         LNKnHGFeexNowMvzca+QpgclIuicG3UoQ3VPJY6ug2h/bInKJcoVp3woF7wsYnZD6F2R
         sZjv9jzQS9vmiz/27LpfMbIhDIqTVYRatcUgrNRJTaXv25EtvsX2aCeDizT3tdq9bDFQ
         +A0hCbKz4//8bwBYc+jNG2aGXtyGGqxKMEa4e6Uk20NnoBJ8uCSIzkLP4iQo2gN2MFM3
         2yiMOc0vEOrehdIUECXy13DRIoiNr4kqhZa5kdthFZG5h6sNvvjccj2CU5NuEWi99KIb
         Vwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103119; x=1753707919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ3PtlOR0m4xvI+xrlOA19tnjKSe6qe5HMQ0ewIzj6Q=;
        b=ati6bq5tadAihOnH6FIDtWCftXSrydYrqmK92hoY3jjnbq4aRN3axMMI0KN4beoho1
         g/eLTClaYkSaehHoIznxT8jDZZCaSYnHbZFVC41VVQBxZiWutpm6Z0vOKz4kv0H5VH8W
         lngc+pl7d4KBdrrfPSoKwTog2Wd/CEx1iA23gjLHqUv2THnYO1+OTuAtSdFR835bY7rL
         sj6X5e0/T6i5NCHTWyedO/wQYLnte1/lD24zNbBUUgK/HRbMlxWFuxWKGDk5CZiArl+s
         sLO2Zcv0dvPEhClROvNFtusaB0LYGgwY04If8qHqzdNLZkfMmFOtLactqSTUDxRlrB39
         LPEg==
X-Gm-Message-State: AOJu0YzOE5mxdXoygf0LqbjRJyAmAPRYXKO0h623l8TFmMQEb9Oy73jl
	zlPpwP3AFhKqe6rsPsgcXx1G521qzYQfzH3/rvBR4Zl8skU+wlutZPIV3XXzo2WGqjY=
X-Gm-Gg: ASbGncsQvvlfBHtH4Bz/3WKQw3dGSoVnO4fiS4q+jOf0wTPyfJQzRd3enRkhzDmYuCF
	Ibi6d5YEodGYkfpAHpBVt5NHj5O6/+0a2v1gW92TMJDp82Yn+BwMW5qbgrLmMLJXaAwECVD1/yR
	6Eh+pIcEIwodF6IpXPd+zD10v8tQwX6c9O6YVSla9rkqwIxg+Kxa6rVWP/eA4dArqU8EeGGL6A9
	MJsteX8AYX+maC3RKD0z/Qeo/qSnsbCPGqsvydW0OJfH1etLO3eRPHz4TxObVdVojcdClZKmTP7
	YGXrASD6vYO9RZCNabR9O0uRBlJ8O2q/IGwZNNvBcrrwsZ3O8gnghRErHhTV0FXlPkNS+39cdvV
	XNJc6A3S1NgCMArU49gIDiWVGoreADNg=
X-Google-Smtp-Source: AGHT+IH9bw7cU8ns9QQ3mV/+eJ2qDxTwHmxGZEX7vgJMgWIg3L3lpoWH95LxFXy5NofnFtzmG3M36A==
X-Received: by 2002:a05:600c:3589:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-456357faf96mr152094745e9.9.1753103118896;
        Mon, 21 Jul 2025 06:05:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:01 +0100
Subject: [PATCH v5 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-7-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060520_691973_79F9B76B 
X-CRM114-Status: GOOD (  13.30  )
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
index c20bd6f21e60..82bddd631b47 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3010,6 +3010,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


