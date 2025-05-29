Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C12C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=; b=S0O7ffMjodvLi7GAhd1dDk6vp4
	oRlwDufwaHcMd8eXLtdLElX2691LGThLgXByXtPao2/aKbF/TGyoajhbuy/Q6A4jv/6pKeRN4HIco
	AsJZRMo7jY3lWu5cFWfT31zwy2U26iK0sae+tgkTGP0UDaik2HG1tlcBcdQCqQU88OMLH8HN8qtti
	COzZdpUMbA/w7ipvcvIlbYyA9SPbAnEagwXDhgyU5WOgegay6TLPQHZXHclcD3QMbYt0tBceLByN8
	syKWztimc4TQCA/s0sFx3iaUo+aHvt3LBmEGHEAFZ6V+iRScW721IzWMsaIBcrgq9VyT7wUZM7owL
	v0EAb/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcMG-0000000FjPf-41h0;
	Thu, 29 May 2025 12:27:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVe-0000000FdCE-19da
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442f9043f56so5501595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518397; x=1749123197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=GfRLyteR+jRPgcrJyvwtXLpV8qvqqK8RXJ6pFF95l4/pGwB0jgyHCpXpg065HUUpvy
         nOAGSAEdKiRAQmRRMpGalRqihOeHpqngx6V1eF6VaE/R0e+8F4gEwVZKQizH5w5qtFfQ
         MAfU9tJS+QIYT4+vUJP+0QwvAhueOkBbSZlrzXuo1pQF4wj8gGWqvMacWbJLgfh89jRI
         ObfX3gDT01CqnYVsMmh53LEFBPqFutft7jzicQPE2cQlK+sdptb1hK3VcqKHB51GAfKD
         0YY2peQT+3h6HQbDI7GTwR4uWTojGSVNIRsMZJ2TpN4RGcUZlHONQFYy7nZlj62JHzUD
         4WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518397; x=1749123197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=KcoYCMjht3w8HicJRDXcAqTyfT9ktyTMTeIkv3HAepQ7aL7cg/1OE5kbJXm/AzYTus
         HGxlk/LVY3Uz7e4dEJ4qkGgJIjrEuPzRYEUnDhi8ZUPBYDrAWLCURDRLi+BKqZzGsZvK
         xelLg7jHc/q9pXo1g4JpyoNRFhsE7Ylf10i2SNlq+DLjsPWRz2NxLdtJbvsfxqAroKS1
         E8cuVu8/z/393+uAvZCLuR/Fanl4Mp1y+Is6/g2cA0zU3KwXwwQjE8gOuWnqnRowjszk
         cUivB0w0atOfjB+GnDugNEfNb7/S2F8bXxyPyed2pgbZinYgyMJBmaV4S/f+bLMJo0Do
         WVFw==
X-Gm-Message-State: AOJu0Yy5HYrxCdsKvLmL864Oj6kuAAVjse6G6qMBCpytkek429yN9dq5
	VUs0DlMFlEni/v06fMbnu9kZ5ueXnS95aW7AdtVgryK+gAmapeR5uarrIZvPyJ4N5LY=
X-Gm-Gg: ASbGncvR8CmSLC3g/uUZ328fwjDwlDlj7l1oTL6OJYms5bwUS4kzBn0iNJ1MhvehApL
	3TynjBj9+6toPy6HBQh3vpshM2bMWkWgLiingsDsf+q1NIkuPrphPAwMxRTKza9lFPZczreLc4b
	+XHAIYvk1N9N2lUazXFbZ8DTvdYmhnbXBSYG+dJK3J2gQ4KalOhr+t+VHa2MOlK/j8AeZYuyc/F
	F//6OV9xW/PAez0Bx8k2KXUMPWKf53tBusnXHWxJ/oulJVp/9T7UNMIYrnabzZKO5gA0m4Y7kNy
	aobvt4lmOq24xTHOo6vbUGtLnMkq9B+xA7ob5nDrPvC2fxzS3k8GnEgBb4nv
X-Google-Smtp-Source: AGHT+IEKUlq+VjysuU7OFlzmN9WWwVOAQRlwZk1C8MZ05ufCqPWjkB/S4hXmEcNWVtw0X6JufGjbcw==
X-Received: by 2002:a05:600c:621b:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-44fafbf883dmr95464645e9.19.1748518396915;
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:27 +0100
Subject: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
X-CRM114-CacheID: sfid-20250529_043318_336719_BF410ED9 
X-CRM114-Status: GOOD (  12.98  )
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
PMSDSFR_EL1, add the trap configs for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f9..05d3e6b93ae9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5dde9285afc8..9f544ac7b5a6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


