Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04393CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGZcvUVCZS8QsvENr66yrxXLduHaz342cTv3n2jzGu0=; b=iZTXqQpMshynQw93207Ep2tkuq
	uFkVZ3agSRxSVPfxmwDFqqh8qMX3UwgS6iL14VwWo8ABKgK7Qs10BEYigN6oLM+zcPOzs+9vLQ85O
	6gGogOzpp14+bZN4S+2N0eYyj/17O3++VvZTbk+EzBb78ezRDc0R0TzwaetLUvmoLtwJS5np6Z036
	C24Sc3ofX3BPIp8W4bVHxAxSpTEtW3qbRIsrtrrUUYqTebjFrZzGoBBwrWR9d4RwZBaVFGJOXThX8
	HlBznH/fPSRwOcoJAQSAzwKy8xjfGhwjJPoo3bDbCkUpFQKYQf1g3wK72Y27UHlqdu6YGAzljbIe0
	UxELIqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV1N-0000000GYif-2XwE;
	Thu, 14 Aug 2025 10:17:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDo-0000000GOm0-16FL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso4905225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163567; x=1755768367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGZcvUVCZS8QsvENr66yrxXLduHaz342cTv3n2jzGu0=;
        b=gmq85Dqw2ZyraYiaRK4TwtHrwH5eV0yr8Utk8ZHN3A6yfC4b30ZtHeWokhjds59MVW
         p+ihnhg06LtCWegrBehdiWSDoLWOIdbrAO5wBYjqtHMw9SVeez65vAYHNCgf9EfSD8Bq
         Z6gRiUyixmFlLgCGkliQzvWJQHJvesk7t7ShoRPc6VKj/LMTPxo371/cGTE7zqRbpXKD
         Bh7fxasx9bXm5vMZP26IvQkYxpfhnAZGua1lEgmG32UAz7vay/1PjeQtYFZriaKoG1jF
         0eoWeiefti3mWGzBVkE/RpiKhaHPveVxvysBvuV2F3ODIQPCDyjMt6ruq7wL1vsmpOy9
         nUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163567; x=1755768367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGZcvUVCZS8QsvENr66yrxXLduHaz342cTv3n2jzGu0=;
        b=Jq4mpht9e9gNfY6JaqW5LGdycFNbrZQXnYlpvkFzu1F58iVnkvHFQEWT4yjQqMLewV
         SqsHZbs9uE1Ra+ncqEVRDmzcZRF+QYjNFVagu5VqkHLeLREG1/SMSayYxKa8b8EvK2z4
         IUk8Yw2rwhEkJVT5LRnoiA3LKhAQlqcWL7nl2QLygIaYFWNj0+q7qirgWM4pE3uGWjfg
         eOBOTqv5EMC7zgw8grXNJaWgLU5Lu8+RYbXn64qJumdJQLW29gdRDcnXGkyB1QhIWDS6
         jyHp7MAlNqmQ+g9bLOEvB5qcJTr1XIRJtiFQsNZxFhZkl8vqwxJ9QONpzm+/kZsifjYx
         LqOw==
X-Gm-Message-State: AOJu0YyYNsD3NU1cUjN+IGKF0F03uC+5+2HEpRoQ65wIoWXfVD48c4gD
	RhNGD/e2RPnmTHaHiKJrdr7+X6DqjcvAUGlvtR4y5HzBxAQBzr56k4ostVJ42wON94k=
X-Gm-Gg: ASbGnctuUm2Bhp/kI4GcWkd8H1mM7hLtr6ofd5t71YtTVH0Bx3SL71NaONlvVlCnNUV
	hcL6dr2m67uvOagU0AfuvZDGCw/pZC4CPHpkGDe1spUol6wVs0l5SHzcdNVfMRukADOk9nuu4I9
	AWpp6fcBPfaQ1UERj5SJ3O4o4dqTJL2ocpvFCwZ9TW9FSrihzz7D95p4s2kUGJXYtw7uijSphk5
	QbHEjAimDsFz87b6ZK2EMSbSKpQiYKX8yCCE+eDXUd0PSO0yQXfSImyemAHMoXy9yErTC5n4wla
	SMDWKvvR41nRBoa2GaOCT0vdVqXZk2z0jUjQSLvt/2LljVsBjWu46LloDt+Dq1MOuXSkIxRia6h
	bMQBNAuKZ0PRFQvaKl3COr025A7Yhvhs=
X-Google-Smtp-Source: AGHT+IEOkVLtv4LKb277h/Y6u80yjiTAO7bDjmFHcIn9yFqBWPJOT++6KQmTGEGyq1SqLmRRRDPzJA==
X-Received: by 2002:a05:600c:470d:b0:456:214f:f78d with SMTP id 5b1f17b1804b1-45a1b65f96cmr14249085e9.22.1755163566832;
        Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:29 +0100
Subject: [PATCH v7 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-7-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022608_310036_3C4AF694 
X-CRM114-Status: GOOD (  13.17  )
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
index f6ec500ad3fa..c2485a862e69 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -94,6 +94,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 90cb4b7ae0ff..aeaba7813275 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1185,6 +1185,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..d1a55cf589b7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3083,6 +3083,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1


