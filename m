Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA640CF65F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOEBMquHVaIZ09UVZZ0kOEI5ZCxeb2xfXPgbFFLGy3Q=; b=AWa6WNfmV4SSSW6h/x8C5piMyf
	bMs53vMzDS/RDUGLJmrvOjVJRnnxoaeMgYwhhG/4H0sHKjHIs6/DVwZN8Ckocd0uJk0twzdDU8H0B
	TXRh2G7d2+Q6t2ZPjcUyftiPWesmTOaHq3ApNfQA4ChL6q8gkOihTEOPKL/39v8eYy/qrhHqUYHZo
	ouvV/ecau0uEIDVKQIMU4L11XNw8bCTOxJF8h8FYIODdZ5dQRLvIrO1C0GMI7dnKnX9zoY6HBpH7n
	hCGTBifcOTmlMTRPFnJ5IPuT7VVxQ1I9ribsZR0F5FzF4ElitF3E90LgX2Ae1H6Uxv4SYTiD7KNCs
	ZgFVluAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoh-0000000CYFh-1v3Z;
	Mon, 26 Jan 2026 12:35:39 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLoV-0000000CYAa-0hKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:35:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uOEBMquHVaIZ09UVZZ0kOEI5ZCxeb2xfXPgbFFLGy3Q=;
	b=gppoXNhsJWzDDHiRNU+ImJrG6rS2cXIqhymStqRqKOuTJAtMpUDow3nyspSyMSHXBnPZxGfCD
	rsCXbtTTA/FTTTigLuTjoyWz5za2kHwBTmTuLM1fW3Oj1anm8EF270nR49OiX6AVIyycAHakMaE
	jPbd9f5qMVRYpJZ0tccKsYs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4f07Fl2rKtz1K98G;
	Mon, 26 Jan 2026 20:31:55 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3763D4055B;
	Mon, 26 Jan 2026 20:35:20 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:35:20 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 26 Jan 2026 20:35:19 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <Jonathan.Cameron@huawei.com>,
	<shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RFT PATCH 5/7] perf-iostat: Support wilder wildcard-match for pmus
Date: Mon, 26 Jan 2026 20:35:12 +0800
Message-ID: <20260126123514.3238425-6-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260126123514.3238425-1-wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043527_594369_42765274 
X-CRM114-Status: GOOD (  13.04  )
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

Current wildcard matching of pmu names only support the form of
"<pmu_name>%d", which may not be sufficient for pmus with other forms of
name (e.g. HiSilicon PCIe PMU has the name of "hisi_pcie%d_pmu%d").

To address that, change the wildcard matching function into a callback,
and add a new version of wildcard-matching function using the callback
to support more flexible pmu names.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 tools/perf/util/pmus.c | 12 +++++++++---
 tools/perf/util/pmus.h |  3 +++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 98be2eb8f1f0..35184d477d07 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -402,7 +402,8 @@ struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *eve
 	return NULL;
 }
 
-struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
+struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const char *wildcard,
+					  perf_pmus_match_t match)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
 
@@ -436,19 +437,24 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const c
 	}
 	if (use_core_pmus) {
 		list_for_each_entry_continue(pmu, &core_pmus, list) {
-			if (perf_pmu__wildcard_match(pmu, wildcard))
+			if (match(pmu, wildcard))
 				return pmu;
 		}
 		pmu = NULL;
 		pmu = list_prepare_entry(pmu, &other_pmus, list);
 	}
 	list_for_each_entry_continue(pmu, &other_pmus, list) {
-		if (perf_pmu__wildcard_match(pmu, wildcard))
+		if (match(pmu, wildcard))
 			return pmu;
 	}
 	return NULL;
 }
 
+struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
+{
+	return perf_pmus__scan_matching(pmu, wildcard, perf_pmu__wildcard_match);
+}
+
 static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 7cb36863711a..9308afb5a7b8 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -9,6 +9,8 @@ struct perf_event_attr;
 struct perf_pmu;
 struct print_callbacks;
 
+typedef _Bool (*perf_pmus_match_t)(const struct perf_pmu *, const char *);
+
 size_t pmu_name_len_no_suffix(const char *str);
 /* Exposed for testing only. */
 int pmu_name_cmp(const char *lhs_pmu_name, const char *rhs_pmu_name);
@@ -22,6 +24,7 @@ struct perf_pmu *perf_pmus__find_by_attr(const struct perf_event_attr *attr);
 struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event);
+struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const char *wildcard, perf_pmus_match_t match);
 struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard);
 
 const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
-- 
2.33.0


