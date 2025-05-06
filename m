Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF00C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=; b=FBn7OmrD12RC6VZ3aBB85PFodF
	MchuNwEGXeIs3kMXCEdO9Z0IpHWd/9+kcny1D9ZWQ85GWRxREcRrU8tFTcURSvRLGBCp5HsHqkqsH
	dj7vQP//nvUl+2aOm7+ql/D1iRHD1onz2fLnta2LCWlVbY5yAfJ7VzQ4H++70FgYGKO3gualFB+es
	Fa1gFUCPfytDLm9tLvLNAa4JxM5lRT8o41KmMc1jwaGekfcuNjiQ12bIzA7yX9YGcp8+bRkfFISlx
	9VKanVF7buWCIw3jdf1aTyygWjIn5F9UGkbW8Eh8rDHeZe7YLzR2R4RJmTqjdXwBujIQWoyt+jdk8
	uzax97JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJKH-0000000CKfR-3cpP;
	Tue, 06 May 2025 14:31:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGh6-0000000BmOl-1MIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3741312f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531759; x=1747136559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=Xo341fsMROb7KPsyHgwgNY8wCP5+KSTsrY29f1MlTGrtFQ/F6RvGBcOkynTON17Rwh
         M/3wG/yaW0pEwDeb09sCBH2EB/C7asPNTcbmk6Yb9B8pIkA0bDZq7Ia3uZD7t67+CBSs
         HHzv46Bxg6vx8rC4iIpKuqWWgeP/f4cXD3WTUaiT6r8xyOxviWK5BNWeV7XCku6zEX/U
         +YiyfCAn4F7iXcKVZMxpXgQ++0ZKsTzp7737/6kx/KAMugnwcNH4tE21+hwFp7tJqbTy
         E2PfoWcs8vdsEL7TRtcOhD/4UNC1LpD8EowEXH6l0GQ3XKm73GHqf+IZ//YiJhIDqAfJ
         lvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531759; x=1747136559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=rSJuMyiWZvtVtzJhdAmd8SqDSqRgfZr6jRoKU1jwPDxDDl98PpqMZ0fh6z0a1wcZfm
         QwncpSsr2rL27a+CYeYfEPjoN02tJV9HShWs81WW86Y1tDnMx0Wk15PJP1LxVk5wft5N
         aLAX9+ZUN5wnWWvZMGemlvY1Q//1xQYJuo6GXZxR18m0NXbNH6qQ/gT923W09C9IwLJZ
         1QNN6kYWpZfwHbHTLzuA5KARi7kTqfbmJ77JcXVFwEp9Vv4OvREUgVIpoVPS1biJB0ht
         ZjGy1ZecO3Qs8sx47iqZ7x++6f4LIZiwXop9L2Cl1ttORhI0Iwh0cxADO7R7a5K/sTeW
         tq5g==
X-Gm-Message-State: AOJu0YxhEpnxoOrt0JGSc/U6pca6PPY0NeiqklV4FGJbMS/twjMNptQa
	m6GUdn90BInfz7hxGkOHmX9BRe4kbDk5hQpYtkTGYHbbjKfAk5AnGMJrCnqwuTo=
X-Gm-Gg: ASbGncuzmqdAgTuqv/x4KOhVNdU3skl+YMj/0hbZ60kJDo+/La/o4/R6/nEHzslTDia
	DT1Gxp+ZRvgxIiA38sw+O+GEFXWzD9fbXdq6Am0pyDTLYopvxqI/B9643+iCwxQiVQwqlIendYK
	g2YrFCEIT3tMjKpMsQNGXi2lkqZn5vLSJDIJnTUfBhJqsKhbwiiTlD6AXxnOqyK0na+W6BPyY/a
	fdXKwl+6wFbnYql/hO//y87vktH33RZYId7hjBzvO1szSLzNPilJnMIAoATJINFFJM/xgNdLKl1
	hZIHypNr/gC0nyIVfTFxjhVfbEmHPUYX5PkJkejX6+RWWS0=
X-Google-Smtp-Source: AGHT+IEqsmZ/YIUi8UcU8BFnJER1OGJ/WDZQZct9hbwqvalINWwYx3zLaSDOzEHLPrVfQzLWtlkByQ==
X-Received: by 2002:a05:6000:1787:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-3a0ac0cb3afmr1864442f8f.12.1746531759068;
        Tue, 06 May 2025 04:42:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:37 +0100
Subject: [PATCH 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-5-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044240_366264_C1DB8ACC 
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
index 005ad28f7306..bda6195d7586 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2950,6 +2950,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


