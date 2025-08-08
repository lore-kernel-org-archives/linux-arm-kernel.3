Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E7C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMesWcHoEa33KjF/J2eeIl0BbZ+P5s/S1CfPVNJYZ2s=; b=3CO7ZSCscqlqhZW1ckHXk5GO3N
	o2cebsX34h13U4aa047SbP53TED7dRhI9cwyEc0pcCc32KjONgWP2XoKk6e/IfsDRl8zq981wAtfW
	L/rcDdZDXglcrVATSlhqo373k6zH9p4xhfSUOv3opueHKEOy0Cdt/zuFv4vZlPUhno2aL+UV3oaWw
	0PGnz5tlsdldcNuaZzw55AqgBsjnssr2bqwN2AMAzQ84qwtYiRH06jjchKjZ0rXiwsqzHxOvyhiXi
	gW0Ix30syp/yWlsOA9ovXX6TGiJv7NraNbMytJbZ0VWpy+MNEktiYU2wgc3SEnWp2vwksBAAEsenR
	e9+Ex8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLMC-00000002gcD-40Uu;
	Fri, 08 Aug 2025 11:33:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCP-00000002eo0-3zPI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b7910123a0so1778501f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652228; x=1755257028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMesWcHoEa33KjF/J2eeIl0BbZ+P5s/S1CfPVNJYZ2s=;
        b=nW8q3n5dkKWzZiLxjh2xBsQr43ED9ntu/8XTna9CFGJIlkWr/4EKbM5M65/eXRJZ3I
         rY83W/T/dARaMyHAAwP1JyDCatx8DTnYz43i/ADha0hJnI6H/za6Oal24V3v0VDMPDvA
         VlzfUrAY+AY2GM83GvteDGAIFbKwp6xi7pDCMgzPXeS+7zQqLiSsNl11UoYwnoOyrF4F
         /EdHyw9MXr7paKKAd8L6turaR/ix+MGkELy4wSVweQoRAaZzyLUrDRC/7m/cgOTnnRnD
         18tgV52faDfqABqFLp1jLziFXTnIVJ+MpZzFpQz7q59DdWg2EwJU2hnouv6z2ecJmSf0
         UvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652228; x=1755257028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMesWcHoEa33KjF/J2eeIl0BbZ+P5s/S1CfPVNJYZ2s=;
        b=RC6ZgkYD/vZMv47UZ/EJk40HWRkPz/vRaPMpLiY0JSe7eHp/soCyscI3UhaE/mWrrE
         D5t0TuuGjHF004TOWuEkV1VJULWpTHbk3G/4rWUCcsFX1IlNde6t+BIiWwZY/WfvTKqi
         URkfPNjge1xDcnCIed1CimaU9mQMqEemGMPExHmqQA9R0t6AGxp9YjRkC0d4aPGc0jMH
         xX5zwsIwz1t9TiJfAg0FJ8Nfgq79ILxoVrAfuYkcc1mrAviTj/o08rDX1wYWm0EYevds
         KgcpsPXCEePFXsVbFY6tkY3BxXNugA55RxT662R52/IU5qqxzNnwDXBbz9OFfKoOfjaB
         qpig==
X-Gm-Message-State: AOJu0YzvnJInzgCEuh1G1aqyqnrVoFe1V6L0cdZ11lBTRfrKzjnMsM0X
	1WNZQnoc6AKEEjWcCun0O9d4h4svOs70tn7N0xg7OU0ez0KZfp1KOJAyqbKg77lIBJ8=
X-Gm-Gg: ASbGncuU0anMi5Bxesg5Yi6J1fegA9ijn4pL0XsvjyiLonrbYZt0kr504X2yYLSAxVa
	MaPGt9VVxFGrRF9eAfZq8Wav+w0x0M42741Xc0ugELC5OKHgm/ci42oOE/X5hwjsZza1d+PSzee
	DlAdpS7OJ5ZmF4lfFRgLgFK63Wkjy+BgTaxIAiBG3v7G7U322ey4xFS04PQ2EdmzBkfJEz0bWEj
	LzmtBhEnnk3o53z/2I6SFk2mOm7q5IdGuyw2BpoWrEIMzSZo9BzTwjxulidrq8xeBWqYEg4zjwu
	SSA0LZ9ONqD3Jz5k0494vIMkOZ2M7NA0N/bsnxzkLLecWogmAoc1CxbWLrkrmTT3A8zO3uFHBCD
	+9UfGk/E99uTao9oBa3wV6nliI7GlC8I=
X-Google-Smtp-Source: AGHT+IG3KhpqmqY9mPCdYHy2kQ4dmK3mleBKR4K9YT1Bk9x07Zhf4VDQvqcJSmZgyy16+lcV/chGew==
X-Received: by 2002:a05:6000:2483:b0:3b7:8146:463c with SMTP id ffacd0b85a97d-3b900b8bde2mr2125187f8f.59.1754652228218;
        Fri, 08 Aug 2025 04:23:48 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:47 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:00 +0100
Subject: [PATCH v6 03/12] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-3-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042349_995925_7EF8A0B0 
X-CRM114-Status: GOOD (  15.46  )
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

From: Leo Yan <leo.yan@arm.com>

Expose an "event_filter" entry in the caps folder to inform user space
about which events can be filtered.

Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
accommodate the added event filter entry.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 86c9948ab5a0..ba55bc3db708 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -116,6 +116,7 @@ enum arm_spe_pmu_capabilities {
 	SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
 	SPE_PMU_CAP_MIN_IVAL,
+	SPE_PMU_CAP_EVENT_FILTER,
 };
 
 static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
@@ -123,7 +124,7 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
 	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
 };
 
-static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
+static u64 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 {
 	if (cap < SPE_PMU_CAP_FEAT_MAX)
 		return !!(spe_pmu->features & arm_spe_pmu_feat_caps[cap]);
@@ -133,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
 		return spe_pmu->counter_sz;
 	case SPE_PMU_CAP_MIN_IVAL:
 		return spe_pmu->min_period;
+	case SPE_PMU_CAP_EVENT_FILTER:
+		return ~spe_pmu->pmsevfr_res0;
 	default:
 		WARN(1, "unknown cap %d\n", cap);
 	}
@@ -149,7 +152,19 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 		container_of(attr, struct dev_ext_attribute, attr);
 	int cap = (long)ea->var;
 
-	return sysfs_emit(buf, "%u\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+	return sysfs_emit(buf, "%llu\n", arm_spe_pmu_cap_get(spe_pmu, cap));
+}
+
+static ssize_t arm_spe_pmu_cap_show_hex(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct arm_spe_pmu *spe_pmu = dev_get_drvdata(dev);
+	struct dev_ext_attribute *ea =
+		container_of(attr, struct dev_ext_attribute, attr);
+	int cap = (long)ea->var;
+
+	return sysfs_emit(buf, "0x%llx\n", arm_spe_pmu_cap_get(spe_pmu, cap));
 }
 
 #define SPE_EXT_ATTR_ENTRY(_name, _func, _var)				\
@@ -159,12 +174,15 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
 
 #define SPE_CAP_EXT_ATTR_ENTRY(_name, _var)				\
 	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show, _var)
+#define SPE_CAP_EXT_ATTR_ENTRY_HEX(_name, _var)				\
+	SPE_EXT_ATTR_ENTRY(_name, arm_spe_pmu_cap_show_hex, _var)
 
 static struct attribute *arm_spe_pmu_cap_attr[] = {
 	SPE_CAP_EXT_ATTR_ENTRY(arch_inst, SPE_PMU_CAP_ARCH_INST),
 	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
 	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
 	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
+	SPE_CAP_EXT_ATTR_ENTRY_HEX(event_filter, SPE_PMU_CAP_EVENT_FILTER),
 	NULL,
 };
 

-- 
2.34.1


