Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F78CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=; b=2LMfW7uN9P1zmUpi3kotda3rzo
	NIXzRXIcZvI69oNqgOrOokWLwSJGz8due3QeBTQYhw0Dyi2Zu/JfHijgR86zrPqikn9kP25E0hHeS
	7lWUW/qnxRMEuPl3o7HsF7sCaX7gxVrMH/q9wdwdgr7nLMTvmR7Tvf6v2E1FS5NNVxball8hRoUPT
	pbtAtn1BsDu00i8cGEVKPtx53v2aX4kJWm1QC4fTM4TBm0+2z9Y9b0qsGdZMCxQ+yXU+zLh5uq8gX
	9KE/IV/nXs5E6nq4jFQ6vytwCDaa4A6RsZWrQEK747fC3srUnWSauHA52cOlMirKOKMRD9W/jL3VW
	ze1OIaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VO-0000000DGvy-1zNj;
	Mon, 01 Sep 2025 16:35:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3r8-0000000CYwa-0Zcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:41:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so10584425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730513; x=1757335313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=;
        b=veq9AqaMJUrQP76nrJ1txO3VMnVGdrdaqmcBnfRKqMHVro64o8rigUZya7++pIEl0T
         MVJMAVGFEnvPCsL0PucIDOX89FFE4kfmPEkSi/HVxeCrXDEMRav/Dqe18YMBdID+CJFs
         FSr17SF89d9OQGqDYiaq9yiPX+J9tMX1wskkrOhOX4On4aoqJvfQhOeFlGxyv2ylmBSl
         PXJTpMM1Jz2dh0Yg9xpLfvyTKdm8yEk8wF/+LIfmDVVp8N1D2nZxynKboTO0XFsDNIWy
         DoCCl07cl1fvp09fXiAUxRWh82RwlaTO7Beiq9W+f24116ET2ueqY/HYT3OsGU7vhDIZ
         W/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730513; x=1757335313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rccDGxo7Zi/+ePrAmZStYRWWCBeSec1uJGq7oyHErE=;
        b=hjWG13qIAwQgktCkKtV0ED9kIYZZ/BF26NRF4NDYFmgm88qVrhtWb9lI+ssdDOM7Kv
         R4KSD1zMoSd2wp+NUoZ2rrzL07ng/5a0tE3LsEq1N0epSD+14AGcQgwxKjF6ZLcnjSTS
         bOSS2rd2wbqcMLqk1nSoFukNU0aDkDPYWRViobnqmBWL7N/MLZUt0whngYbX0gtT55Dw
         2fQTV6+ItW/7Y7hOXlyuz+nL9acVqvwcwi7jYHVb86sCcWVOov7T9N394mmEVPuwD5TP
         /oT3PweVIn0/J/As9QIZXDvMu5sZ/xvw4yqePnNVW25yGXN0wX/G0xMTXGKuwQM0EgTl
         VyPA==
X-Gm-Message-State: AOJu0YwzhjgYBoJDn5+tyDbDBlgT5kaSqOoXsgFNcygWTXdYyHJEBRFI
	53CuigcOdSs/ue4pc38xaiU1be64tJYsEvHJgP6pAF0+N455UjSDycJql/wWw5zEbg4=
X-Gm-Gg: ASbGncsIqI7VXeCTlaK1t6NtMhLucs5/iTuHKok4bQsuSSO6/7MuonF1A5KLeS+cpXQ
	3atkfIYVjZ7ECQAioEfKiq7R0A9+LRv46z/WfY2Fqx+4RDYjt+nXFl6n+IoPOAra73U2XLqL1Kp
	CmFIRD1mAvfQDgUHh2MagZgJLVapxiDuhqDiTKHhb0FBT8JDaJOaQZXMce/yH/NH/+NNugNBZyn
	05uPWbF7oi3zDXcTvn5Y9Iw6vcWxgoPr/09GjhZ2im3pzOWmfyyPOn/M93rxNcQzjS/9PudSioL
	1W7IiHooYPdWd6YasSBC20zndioiHo28oKdHEGoesVoC97cf15dJYWcDuB4McnBxrQp2KSTszOe
	8RgVyRklgq4oD5HBScqbj+4UzdJOGk4g=
X-Google-Smtp-Source: AGHT+IEiJacQeJIhAlVFIVb4gBUFN/ZD4+BtNn08VuvIydbSJk4ZmQ+RW5QdnGmgopAeFlemw8drNw==
X-Received: by 2002:a05:600c:4fcd:b0:459:db71:74d7 with SMTP id 5b1f17b1804b1-45b8557c8d1mr55430795e9.27.1756730512680;
        Mon, 01 Sep 2025 05:41:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:32 +0100
Subject: [PATCH v8 03/12] perf: arm_spe: Expose event filter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-3-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054154_194483_A81387C3 
X-CRM114-Status: GOOD (  16.03  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
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


