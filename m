Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76342C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyyFEki2WqLFGTJNxhVqg6BOlJH2bPcjpIbwwiG1+ts=; b=XVYi1D+i3Gidtx/c2vfjkbLU8x
	s19vMYWtv66fCCFJEKNxW4V2OI5Qf05pMZyLSsKa7c9s/k4YU19QfS1+5teFT2nlFiqPjfRd5769y
	DFngJZ5enFrlHVaPhTBR1ZShJYZmRPGrijhDDmmCgBYr/UJj5aDyCNLF8boFTfGuKgxpQhtYd4RPb
	ccZssmvYYWpKwvyMDJWbJJyPeTfL7g5DBW0/dYK0ieOITR1MB2xugEiBRe0/rDk3MhX4Z522jZnOb
	wF+5xfwygDC4xLF4Sh5dSRJ1S8jOhOYiMsp0Lwmxo3Wd0p93bfy+HsZjZfsTUGFLoznaSqp8FIsLi
	mMwq/t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflL-00000006Kmj-0k78;
	Tue, 01 Jul 2025 18:31:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcyl-00000005ttZ-15oI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:33:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453066fad06so39635715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383982; x=1751988782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyyFEki2WqLFGTJNxhVqg6BOlJH2bPcjpIbwwiG1+ts=;
        b=ZTqDqOGhO7JIqXEB/J1KG7056A4BG0kECfsrBo0WRrxYRd3tkGjaXHGDUwytt3Uq7p
         lgr2MU8cWYCOUDypsCb2yVMZz9GPxtwfNVxIjyywf94O3YC3rrI6gS5ATRvETDtaA/B6
         BC7xphvQ+IyoM72qrigH3Xrn4Ylv7yBXiBJ0UggB34iLIYRIcyt3tb/4opkAssE+rwZa
         VFBxT4Hv1ewcTQNAvVDVhSK/nD9wDM4sbruyyHNqklZ3c4t4r98p6HOd0G3Nqg7+hb7b
         YzydUt0zC8andzmlY0u5nxJk1w+1tzgz25ZrpP9JGTW95/cVSy/2nxe0ZlYIyy0AIX3a
         YL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383982; x=1751988782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyyFEki2WqLFGTJNxhVqg6BOlJH2bPcjpIbwwiG1+ts=;
        b=Aj6WMBPa6Bnn0SoVle6x8PxXj+YKrkPYz3ZrnObNmNs9Zb20LV29Y4VQxwlrtSwokp
         6UqBgYhGbfaRquJDt3ITVVVlHpl6nah0gvs6UYWWblqI0BPmpUi0VxxLjvIH6ylSuXvf
         fS1+JEPY6vB5e82wpJNBJBt19R3VWiHYkhzr6iWUrhI8OWMqzwb5+b+5NRQERbDupM8l
         dRhJX6jEkRnq0RL6LP7pPWRO8tArSGnpkePSwwsPOmcL2dlI9+QZsParFoIlDApQ79Au
         RjuW2O15ZLTeYSP4stq/UPVkZ+oTvhdyqaaYuvH9tjWu0BtsyK/j/z2yj9ny5OMTD9bL
         Tn+Q==
X-Gm-Message-State: AOJu0YzJnjEsUaPb+N1lXJ87XGkH+gGl8GJ1lYIW+jJS3fsTKTJoTfnS
	BxbQcFU4o7nDeKjMYajSe6UtHglEPLaCX+Pw4tEAdKHp4K7A5/S7nRY1RlWUGVH0SIc=
X-Gm-Gg: ASbGncuXCuavS98WxpHqpYKFK7vsHlIv2nZPVz5zNxQNI2IDakaCqfBUNW6li+Ey2QE
	FrujjNLUG24Fz4QdwmjDzBDuaOa3Nv2YJzfxMNjtHj3PRFcyrjg7cJGgpPuXZ3oZ5FKOj0bpLwt
	P9hNt1tC/zEE3MJp8f24jWVH3iQ20JJ1H/iANbwyuUgKn3zVPOOeXtxKkYLebpWxCOdiagdkgmm
	CBYrTL6bc88cLvfPG2CZT2eqpIqQSpy333XlEeOmXV/GLSqAGtzP1gdFX2co5q2avJuI18yoaU2
	l/3lD5uGtnvUhanI9mQn5jHaaG29Ga4Y8chKtVpxKt67Prc+t2yMAH3fctch7AofOQXTIHE=
X-Google-Smtp-Source: AGHT+IHRSBNBwwc+SffZeGA8Ju+5Y/kf7iR6/4sPiOrk5WPd20gCoDRBdDhmJvz8jb8uT7zF55j0eQ==
X-Received: by 2002:a05:600c:198d:b0:453:b44:eb71 with SMTP id 5b1f17b1804b1-4538f2148b1mr164983525e9.19.1751383981587;
        Tue, 01 Jul 2025 08:33:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:33:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 01 Jul 2025 16:31:59 +0100
Subject: [PATCH 3/3] perf: arm_spe: Add support for SPE VM interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-james-spe-vm-interface-v1-3-52a2cd223d00@linaro.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083303_305907_C5DE0F22 
X-CRM114-Status: GOOD (  20.18  )
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

DEN0154 describes the new SPE VM interface, which allows the hypervisor
to define a max buffer size hint and to raise a new buffer management
error for exceeding it.

Report the size as a capability to userspace, and prevent larger buffers
from being allocated in the driver. Although it's a only a hint and
smaller buffers may also be disallowed in some scenarios, a larger
buffer is never expected to work so we can fail early. Failures after
arm_spe_pmu_setup_aux() have to happen asynchronously through the buffer
management event.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h |  1 +
 arch/arm64/tools/sysreg         |  6 +++++-
 drivers/perf/arm_spe_pmu.c      | 26 ++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..9c48a7119aa7 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -367,6 +367,7 @@
 #define PMBSR_EL1_BUF_BSC_MASK		PMBSR_EL1_MSS_MASK
 
 #define PMBSR_EL1_BUF_BSC_FULL		0x1UL
+#define PMBSR_EL1_BUF_BSC_SIZE		0x4UL
 
 /*** End of Statistical Profiling Extension ***/
 
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..d6bb1736f554 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2976,7 +2976,11 @@ Field	7:0	Attr
 EndSysreg
 
 Sysreg	PMBIDR_EL1	3	0	9	10	7
-Res0	63:12
+Res0	63:48
+Field	47:46	MaxBuffSize_RES
+Field	45:41	MaxBuffSize_E
+Field	40:32	MaxBuffSize_M
+Res0	31:12
 Enum	11:8	EA
 	0b0000	NotDescribed
 	0b0001	Ignored
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 5829947c8871..23f18dc2890c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -92,6 +92,7 @@ struct arm_spe_pmu {
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
+	u64					max_buff_size;
 };
 
 #define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
@@ -115,6 +116,7 @@ enum arm_spe_pmu_capabilities {
 	SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_MIN_IVAL,
+	SPE_PMU_CAP_MAX_BUFF_SIZE,
 };
 
 static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
@@ -132,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 		return spe_pmu->counter_sz;
 	case SPE_PMU_CAP_MIN_IVAL:
 		return spe_pmu->min_period;
+	case SPE_PMU_CAP_MAX_BUFF_SIZE:
+		return spe_pmu->max_buff_size;
 	default:
 		WARN(1, "unknown cap %d\n", cap);
 	}
@@ -164,6 +168,7 @@ static struct attribute *arm_spe_pmu_cap_attr[] = {
 	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
 	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
 	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
+	SPE_CAP_EXT_ATTR_ENTRY(max_buff_size, SPE_PMU_CAP_MAX_BUFF_SIZE),
 	NULL,
 };
 
@@ -631,6 +636,9 @@ arm_spe_pmu_buf_get_fault_act(struct perf_output_handle *handle)
 	case PMBSR_EL1_BUF_BSC_FULL:
 		ret = SPE_PMU_BUF_FAULT_ACT_OK;
 		goto out_stop;
+	case PMBSR_EL1_BUF_BSC_SIZE:
+		err_str = "Buffer size too large";
+		goto out_err;
 	default:
 		err_str = "Unknown buffer status code";
 	}
@@ -896,6 +904,7 @@ static void *arm_spe_pmu_setup_aux(struct perf_event *event, void **pages,
 	int i, cpu = event->cpu;
 	struct page **pglist;
 	struct arm_spe_pmu_buf *buf;
+	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 
 	/* We need at least two pages for this to work. */
 	if (nr_pages < 2)
@@ -910,6 +919,10 @@ static void *arm_spe_pmu_setup_aux(struct perf_event *event, void **pages,
 	if (snapshot && (nr_pages & 1))
 		return NULL;
 
+	if (spe_pmu->max_buff_size &&
+	    nr_pages * PAGE_SIZE > spe_pmu->max_buff_size)
+		return NULL;
+
 	if (cpu == -1)
 		cpu = raw_smp_processor_id();
 
@@ -999,6 +1012,17 @@ static void arm_spe_pmu_perf_destroy(struct arm_spe_pmu *spe_pmu)
 	perf_pmu_unregister(&spe_pmu->pmu);
 }
 
+static u64 arm_spe_decode_buf_size(u64 pmbidr)
+{
+	u64 mantissa = FIELD_GET(PMBIDR_EL1_MaxBuffSize_M, pmbidr);
+	u8 exp = FIELD_GET(PMBIDR_EL1_MaxBuffSize_E, pmbidr);
+
+	if (exp == 0)
+		return mantissa << 12;
+
+	return (mantissa | 0b1000000000) << (exp + 11);
+}
+
 static void __arm_spe_pmu_dev_probe(void *info)
 {
 	int fld;
@@ -1033,6 +1057,8 @@ static void __arm_spe_pmu_dev_probe(void *info)
 		return;
 	}
 
+	spe_pmu->max_buff_size = arm_spe_decode_buf_size(reg);
+
 	/* It's now safe to read PMSIDR and figure out what we've got */
 	reg = read_sysreg_s(SYS_PMSIDR_EL1);
 	if (FIELD_GET(PMSIDR_EL1_FE, reg))

-- 
2.34.1


