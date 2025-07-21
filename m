Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73572C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBEcxDyhRjewO1Y6U9fnxashwhAKoNPmyA1X1nUDdJU=; b=abUrwjWTN835wzDMHe+0MMB5QL
	enRBAFSJ9sI+a75OkjzB0S8qhY1E+Y3L9VhiqkAzGil0HSgQRSbMRqKNxNB6Ty9aOhjsKSzPglnm5
	hP105mePLi8meE2l1lK+Uh85S6Vt+cjVk8drsj2rcAheBk0OlAODGeiKpRuzp0bBywIzeI3Ymr3lx
	Y4sFaN34M/LenqGMJnZ8p+l+9G7d3dDo/30Pl4QzilCDjJHs2XnlaRMFmv6tAyUUd0C0IGFGBS9RO
	28ja6/YE3Wb0BetFS6Iq7jR3kHXgJ7AYOxHMwBXrxF5cvzyQ+57ic4LpcPICeF0kgBCEFDj0xCZNc
	ImVNg/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsAF-000000002qI-32gT;
	Mon, 21 Jul 2025 15:10:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq28-0000000HIg1-2U0B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so31938915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102459; x=1753707259; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBEcxDyhRjewO1Y6U9fnxashwhAKoNPmyA1X1nUDdJU=;
        b=FtJg5zfthzV10uJuDG0v0Maht2V5cGzfqDNxh3uKeFxBhLv6n5cwZsrask5/L3vzZw
         if9/ZFCQfPnHuXN4QmZPD4liDLUPKiLsk9e+ZaCLZXt7BssTlSKP29KCG7Hpg5zwFt8e
         7CbpczzDnSrfkFNy+EEiRJQ+OqttHFqJYBUPm/Fqikr5q2ZAOlGBCV46udh9HPH0ViEs
         Uqiv5ElNkpXqzWVgrnvKJ0QJdvtYwM/ascPfhYHWYnnqm4ZKjiPUG2+yJdEy+k31Ln4F
         1PCv39zR6tNuV668hRxH3JrnB6oCzlDSpSbIP+iRXtfOz8zbq4zsxI/mV3zsKw7zQYF+
         M7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102459; x=1753707259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBEcxDyhRjewO1Y6U9fnxashwhAKoNPmyA1X1nUDdJU=;
        b=Tx80Fb40c87cEWi3/8vznzT6Q6stF7rQv1XjNDxNvFqtk5bALSC+6wekKkAPsHscVz
         5bTrkmyD5wKxaxnGJ2YEw7ybx7LvhlZsqrhP5ha0gI3rlc+WSOoYE5ffXfCn0y8obm8P
         mZlcEljdKt1cjV6NRGEbdFXRm5fYj2mE2SrV32c8/Cql6znPDEOB9tDYfqUhRemMZgLW
         d97A2RwR/knyt8aXTU3y6fIvt71BsK/DHknaZk8/O/YFgO6Fdrn0BvU565zwI5h1JXos
         e+LNys1BeToF6yCYxpaUyCdQ2GLZGmpO/yKUTjm+jm002sSK78FKDjyo9HiqEP+B8N9A
         Bs+w==
X-Gm-Message-State: AOJu0YxKUcP0h41WBuBN2tYesn8L41r+/TAKUDr58IGCNwAkC7cYgSXw
	1MAKUHrfxyLYWBhigqwphbq4gscuigQZPiuvSahw7HLm+XlZ2WUdSGX75+6y8uPqrJM=
X-Gm-Gg: ASbGnct/W7he4OT9GbEInDpd9ZUXnduxzpmlME8HDA/ncjZdB0xNGYRkYPfbkm5i8dI
	swSe3mRbdJklCTe4Js812FFKAabxZq+4yrx6Ush0l7UfIYx8jmRDow1iI9rkKxkz5Wz14F5LgaO
	DzEi4fpgzPArf/K91XiKj6bQHM/vLaA1COeSDgtNt/NSUuCW3DeQX90fnfTm5b+9wMGfG5wGboK
	1gITUsriW04lD8NDzHH/YC7su85y5pi2hXQv1jrcSB6Kdo9T9jLfVShNnV68rkjhiOIXdz8hD0w
	OlcRATtHm2JoBMr0l4MuEsi/qIhgTOiX8TEBI+8RFqHkqWsxebEDbGhlrumH0/6j++pPbS9wjWo
	kWN+7O6jEgacEarxQytjV2I4elhqstb0=
X-Google-Smtp-Source: AGHT+IFQ1W9RXFUvbYcVwuXuyPJydskAvKt1bW7ZkyNo1Omk2ZtSQ1JxYK5EzOAeDKe7/8CRt880JQ==
X-Received: by 2002:a05:600c:348c:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-4564ab4fe8cmr29396345e9.28.1753102458979;
        Mon, 21 Jul 2025 05:54:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:38 +0100
Subject: [PATCH v4 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-7-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055420_639834_BE9E9547 
X-CRM114-Status: GOOD (  13.29  )
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


