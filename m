Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E9DFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=; b=sYpnbllfhBoJa0QKdYez5oc4GA
	l5NxJTp2RhFFUpDEfb8rTpivqtbpe6q+IoLMfsFoiYZ773B49cpqNx6D0KXkBDFqW/swND2wehuQP
	mtnCnwUoswRO+Jkf4ByNbLS733s5LYSmV9Lk4HB1Wy4DgBoQ2PRG/m6jCVruKICXarydRzFX0SPMM
	jzSApEXHjy5FZEhhEikQCA0qHlu+WazyYFKy2Sx2XlwiyqPyEn1W0q6WmZFoe2JxG88GqHkJLDyCX
	Vl0Q2X+JLrhKBagjI2mVqEk54MYRBr9oER1VUzp9qgKmYE2pNKtGd22d/dvvvxWsUMfIZeWJOQ/me
	Qyss6i3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBq-0000000EflW-32MX;
	Sat, 25 Apr 2026 17:53:15 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9h-0000000Ee8c-2in9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:51:17 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so13450046eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139460; x=1777744260; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=;
        b=nEKn4iNuun/cCmSvVXNSx+tluCEWedXaRXN97l/f0Mws8wUv0xJa7vJvMozzqfRnFs
         akaFf1zyc7+GVkzlCRSUF2cldtDKUfQvdWVWScew8u8PaQDCl9i7SgFg9bwxCeGlSPvN
         L4AAyiUZeROJIKt9eaTQ+8qm9Pxl+7OVIqhBnA1+aatFrR5uId5oPO0OW60HG+lalESx
         YtN/Na4MTkXn1QrwRjF0LlQM/svqTnWX1yj4nJS+rxHGmc6AJvcLarZJ/URoH+9Hmj1b
         ocKRskAaYsferQSaa53/Sdhp8NfY/glmVLQ9JVqkD8PcC7wWcunfpGAx6Te+uwi7p8RC
         fIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139460; x=1777744260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=;
        b=RlQIYryEvzRdceDoDN090qsU0uEarlQ0mBGOpdMGbopSDYH9IS8PtTPnj9xHhEim8Q
         HbtDKlafrnDtlz3frkkwVGEQiLovLDh28UuZIBeJggdDaBHCw/Vg4FtwdDiVqU6P/NFQ
         5N5CU24RdV3uqHSv2x8EYp3yzb6wttq1f4l+P4xZUPEVwrCR5YjDAu6VBymFBm3tjhAd
         q82jcEvRmGCrCqFO/lWVDb3MDbpY0naqqP9Ta8Gi/dtcLxmHwsIwFEr6ns8atC95UZ28
         0jOvkCoGZr6ClWKuyRITqSCkBxbqlP0ZoC5r+Im0lHxKbwA6dk/I6HYbh1BqxaHXio/s
         DJ0w==
X-Forwarded-Encrypted: i=1; AFNElJ/OF6Il8NJwpjTbvWVkyp5NXZqdqjYiNKt/YWXyQjprawURKGPJlUoO7H/Lfc/kMnV9DaKcsyiTBppJBicgwJMq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6KtM2r6sei258OPA6BljPIElqEkqjdyOFYtGPmFvfBOHLbMTn
	poqUBThAY3jy2FQCfNwk1Eh5bJLIM7uUgOmxW6oOrMAB6fRcLwv6S7IV06v63fDfjgX1bAKKTOa
	/X2IkIiwCvg==
X-Received: from dybvu5.prod.google.com ([2002:a05:7300:f805:b0:2cc:a1bf:2dd9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1693:b0:2d4:7656:4ec1
 with SMTP id 5a478bee46e88-2e47873a687mr20478389eec.17.1777139459410; Sat, 25
 Apr 2026 10:50:59 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:57 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-60-irogers@google.com>
Subject: [PATCH v6 59/59] perf sched stats: Fix segmentation faults in diff mode
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_105101_756451_51D91861 
X-CRM114-Status: GOOD (  18.76  )
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

Address several segmentation fault vectors in `perf sched stats diff`:

1. When processing invalid or empty data files, the CPU domain maps may
   be NULL. Added NULL checks for `cd_map1` and `cd_map2` in
   `show_schedstat_data()` to fail gracefully.

2. When files contain a different number of CPUs or domains, the parallel
   list iteration in `show_schedstat_data()` could wrap around the list
   heads and dereference invalid memory. Added `list_is_last` checks
   to safely terminate iteration at the end of each list.

3. When summarizing CPU statistics in `get_all_cpu_stats()`, parallel list
   iteration over domains could similarly wrap around if a CPU has more
   domains than the first CPU. Added `list_is_last` check to prevent this.

4. Added bounds checks for `cs1->cpu` and `cs2->cpu` against `nr1` and
   `nr2` (passed from `env->nr_cpus_avail`) to prevent out-of-bounds
   reads from `cd_map1` and `cd_map2` when processing data from machines
   with different CPU configurations.

5. Added NULL checks for `cd_info1` and `cd_info2` in `show_schedstat_data()`
   to prevent crashes when a CPU has samples in the data file but no
   corresponding domain info in the header (which leaves the map entry NULL).

6. Added NULL checks for `dinfo1` and `dinfo2` in `show_schedstat_data()`
   to prevent crashes when a domain is present in the list but has no
   corresponding info in the CPU domain map (which leaves the entry NULL).

7. Zero-initialized the `perf_data` array in `perf_sched__schedstat_diff()`
   to prevent stack garbage from causing `perf_data_file__fd()` to attempt
   to use a NULL `fptr` when `use_stdio` happened to be non-zero.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-sched.c | 85 +++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 16 deletions(-)

diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
index d3fa9c70790f..f6c7d100729a 100644
--- a/tools/perf/builtin-sched.c
+++ b/tools/perf/builtin-sched.c
@@ -4212,12 +4212,20 @@ static int get_all_cpu_stats(struct list_head *head)
 
 		cnt++;
 		summarize_schedstat_cpu(summary_head, cptr, cnt, is_last);
-		tdptr = list_first_entry(&summary_head->domain_head, struct schedstat_domain,
-					 domain_list);
+		if (!list_empty(&summary_head->domain_head))
+			tdptr = list_first_entry(&summary_head->domain_head, struct schedstat_domain,
+						 domain_list);
+		else
+			tdptr = NULL;
 
 		list_for_each_entry(dptr, &cptr->domain_head, domain_list) {
-			summarize_schedstat_domain(tdptr, dptr, cnt, is_last);
-			tdptr = list_next_entry(tdptr, domain_list);
+			if (tdptr) {
+				summarize_schedstat_domain(tdptr, dptr, cnt, is_last);
+				if (list_is_last(&tdptr->domain_list, &summary_head->domain_head))
+					tdptr = NULL;
+				else
+					tdptr = list_next_entry(tdptr, domain_list);
+			}
 		}
 	}
 
@@ -4225,8 +4233,8 @@ static int get_all_cpu_stats(struct list_head *head)
 	return ret;
 }
 
-static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **cd_map1,
-			       struct list_head *head2, struct cpu_domain_map **cd_map2,
+static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **cd_map1, int nr1,
+			       struct list_head *head2, struct cpu_domain_map **cd_map2, int nr2,
 			       bool summary_only)
 {
 	struct schedstat_cpu *cptr1 = list_first_entry(head1, struct schedstat_cpu, cpu_list);
@@ -4238,6 +4246,15 @@ static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **
 	bool is_summary = true;
 	int ret = 0;
 
+	if (!cd_map1) {
+		pr_err("Error: CPU domain map 1 is missing.\n");
+		return -1;
+	}
+	if (head2 && !cd_map2) {
+		pr_err("Error: CPU domain map 2 is missing.\n");
+		return -1;
+	}
+
 	printf("Description\n");
 	print_separator2(SEP_LEN, "", 0);
 	printf("%-30s-> %s\n", "DESC", "Description of the field");
@@ -4269,12 +4286,31 @@ static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **
 		struct cpu_domain_map *cd_info1 = NULL, *cd_info2 = NULL;
 
 		cs1 = cptr1->cpu_data;
+		if (cs1->cpu >= (u32)nr1) {
+			pr_err("Error: CPU %d exceeds domain map size %d\n", cs1->cpu, nr1);
+			return -1;
+		}
 		cd_info1 = cd_map1[cs1->cpu];
+		if (!cd_info1) {
+			pr_err("Error: CPU %d domain info is missing in map 1.\n", cs1->cpu);
+			return -1;
+		}
 		if (cptr2) {
 			cs2 = cptr2->cpu_data;
+			if (cs2->cpu >= (u32)nr2) {
+				pr_err("Error: CPU %d exceeds domain map size %d\n", cs2->cpu, nr2);
+				return -1;
+			}
 			cd_info2 = cd_map2[cs2->cpu];
-			dptr2 = list_first_entry(&cptr2->domain_head, struct schedstat_domain,
-						 domain_list);
+			if (!cd_info2) {
+				pr_err("Error: CPU %d domain info is missing in map 2.\n", cs2->cpu);
+				return -1;
+			}
+			if (!list_empty(&cptr2->domain_head))
+				dptr2 = list_first_entry(&cptr2->domain_head, struct schedstat_domain,
+							 domain_list);
+			else
+				dptr2 = NULL;
 		}
 
 		if (cs2 && cs1->cpu != cs2->cpu) {
@@ -4303,9 +4339,17 @@ static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **
 
 			ds1 = dptr1->domain_data;
 			dinfo1 = cd_info1->domains[ds1->domain];
+			if (!dinfo1) {
+				pr_err("Error: Domain %d info is missing for CPU %d in map 1.\n", ds1->domain, cs1->cpu);
+				return -1;
+			}
 			if (dptr2) {
 				ds2 = dptr2->domain_data;
 				dinfo2 = cd_info2->domains[ds2->domain];
+				if (!dinfo2) {
+					pr_err("Error: Domain %d info is missing for CPU %d in map 2.\n", ds2->domain, cs2->cpu);
+					return -1;
+				}
 			}
 
 			if (dinfo2 && dinfo1->domain != dinfo2->domain) {
@@ -4334,14 +4378,22 @@ static int show_schedstat_data(struct list_head *head1, struct cpu_domain_map **
 			print_domain_stats(ds1, ds2, jiffies1, jiffies2);
 			print_separator2(SEP_LEN, "", 0);
 
-			if (dptr2)
-				dptr2 = list_next_entry(dptr2, domain_list);
+			if (dptr2) {
+				if (list_is_last(&dptr2->domain_list, &cptr2->domain_head))
+					dptr2 = NULL;
+				else
+					dptr2 = list_next_entry(dptr2, domain_list);
+			}
 		}
 		if (summary_only)
 			break;
 
-		if (cptr2)
-			cptr2 = list_next_entry(cptr2, cpu_list);
+		if (cptr2) {
+			if (list_is_last(&cptr2->cpu_list, head2))
+				cptr2 = NULL;
+			else
+				cptr2 = list_next_entry(cptr2, cpu_list);
+		}
 
 		is_summary = false;
 	}
@@ -4523,7 +4575,7 @@ static int perf_sched__schedstat_report(struct perf_sched *sched)
 		}
 
 		cd_map = session->header.env.cpu_domain;
-		err = show_schedstat_data(&cpu_head, cd_map, NULL, NULL, false);
+		err = show_schedstat_data(&cpu_head, cd_map, session->header.env.nr_cpus_avail, NULL, NULL, 0, false);
 	}
 
 out:
@@ -4538,7 +4590,7 @@ static int perf_sched__schedstat_diff(struct perf_sched *sched,
 	struct cpu_domain_map **cd_map0 = NULL, **cd_map1 = NULL;
 	struct list_head cpu_head_ses0, cpu_head_ses1;
 	struct perf_session *session[2];
-	struct perf_data data[2];
+	struct perf_data data[2] = {0};
 	int ret = 0, err = 0;
 	static const char *defaults[] = {
 		"perf.data.old",
@@ -4610,7 +4662,8 @@ static int perf_sched__schedstat_diff(struct perf_sched *sched,
 		goto out_delete_ses0;
 	}
 
-	show_schedstat_data(&cpu_head_ses0, cd_map0, &cpu_head_ses1, cd_map1, true);
+	show_schedstat_data(&cpu_head_ses0, cd_map0, session[0]->header.env.nr_cpus_avail,
+			    &cpu_head_ses1, cd_map1, session[1]->header.env.nr_cpus_avail, true);
 
 out_delete_ses1:
 	free_schedstat(&cpu_head_ses1);
@@ -4720,7 +4773,7 @@ static int perf_sched__schedstat_live(struct perf_sched *sched,
 		goto out;
 	}
 
-	show_schedstat_data(&cpu_head, cd_map, NULL, NULL, false);
+	show_schedstat_data(&cpu_head, cd_map, nr, NULL, NULL, 0, false);
 	free_cpu_domain_info(cd_map, sv, nr);
 out:
 	free_schedstat(&cpu_head);
-- 
2.54.0.545.g6539524ca2-goog


