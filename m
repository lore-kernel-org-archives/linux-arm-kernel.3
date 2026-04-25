Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E876CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=; b=lL51Cp3rEND4kVyODZ70jxe9LZ
	U/qiTZLLVzn1QOgPpdxwBw26tuLuNeUyWSGmIXuQuhqMl7pBM/XZyjkmvDBtsH/tkjeZIQGcY9oZM
	cRkdIGBf0/HLNYDTXAX6b+1pIu/ymYqMqOjirRgq74514MTxzYxrC2mO0YPBCYItASigFSsJ6qpl+
	67D4J04c+XiKXiVlw9eh57ibaK1ohxw3gJOgcdZAfJa8GMxij7rwww7D1xKpPKDMaedLyMg61SDQm
	Mc4QiuWUleXZ4OenU6EUAmWDNFquvJN/ucTlTRbItErUotl5IzWo6ZmpphL/OQ6QKmwUz6YtS2ptk
	EacGp2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlsk-0000000F1fh-3UK8;
	Sat, 25 Apr 2026 22:53:50 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrG-0000000EzzP-3ebX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:52:28 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12c726f4055so9219647c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157537; x=1777762337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=;
        b=oQFYzzxWWIeDE4b1+B2/HACbbdFquDg4Zc0aXp01hEKseQ9aQNkYGHetM5urCMn0jZ
         u0H9N1qFbyqJ5mky2rVeurFvEL05YmzzpZkZZVR2xG+2rmxX/rfuROwl+2mOdwoIidf2
         q4A3DxcOuVGq3KWGun55PXBOo5TBu6XmrxAPNyZF1rrrHOsetjsG1m8uv0rg3hDvPRHl
         IaePccgDUUMhktXOe8Dae/aaTRjBfzBdmd5fmaUWtASPtLgoo8m+qxrL1EEft0XrKuIe
         w/+5OTQSgfdh+7uPKVV7FXk8Nrm0nvykNsZEiUUfLYAPYAnbdKooln+nySDDB9EarybW
         2Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157537; x=1777762337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlWrNjVnLs3USTmPSqIGY0FmcUo+LUNpaODSh5R9ico=;
        b=hefefnlW8i1UoyxniZfO5Zu9eqngukL2QPFYm2Cs5plO/6iXCHrtv4DN7sQclX72Z6
         WkUCw6NRHQUJgPOLag6mfo6YdJ3bkXIfY65PSZnWwc45TImgTnXpiA0sqtotxuVhVJl/
         7z8SbsHOJcT8kMBxdeE7kwh0ZhD2912wRY9e5j56AkaUVqTy7xd9ct3bwgRYZs5aa7bC
         sZuIcW2eklyp2LaAWfI3PK1ItZS1sqzUxEwmwErBSvxtBVCG3+EzwiUBXD/HLZJYVaK0
         cId+WkiAhTI9+JGN7m2c9d8jicfDRNN0oHhPedEl4rBa/QfXr7YorjJkYacYyKW6fSXw
         NSLA==
X-Forwarded-Encrypted: i=1; AFNElJ8rYxpGzkZ5nmLcsGqz5PrirF9WhkW7/764I77s4yE1f7ttvW5meyPsshCfA8MGQE9iOzMBoaJKPDKItawpoF4d@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt20NEpMel3ME8Ue0cV7d3ygulT5UivDqkLI4AuH5wQl2/Unwi
	UOQ7PjX17yEW/4wnSBvaG1Hl90uuNB1tXhPGTXboxwVNMJZ572NUq3iBMG0zjO0OMTfKG1/AwoI
	A3l3VN6cE3A==
X-Received: from dlbrh4.prod.google.com ([2002:a05:7022:f304:b0:12b:eb91:8863])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:23a1:b0:12d:ce34:3fa0
 with SMTP id a92af1059eb24-12dce344079mr1783349c88.32.1777157536815; Sat, 25
 Apr 2026 15:52:16 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:51 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-60-irogers@google.com>
Subject: [PATCH v7 59/59] perf sched stats: Fix segmentation faults in diff mode
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_155219_030168_C332561A 
X-CRM114-Status: GOOD (  18.75  )
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


