Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D258CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=; b=kXyF1Vsjpw/vSk4K8gPA5xgO+f
	k/mpCLTWLABROGr/mivec/70pQlnFWLYgnRKvy84hvDuPwzgpk6+RzMchlRlmNjDaZbLSAg8/LVID
	zTn0lsuwc5CtviZ07u2/e3Y+71FAhoXLs2vVb66eywuSAU9yb+NvyqBDB9USLQN2lbGoM884ZKIwr
	AExx9Z8M6ptkDBSNw8Fh57mnLPclvkO7SW5k8NKkaG84SwrEUtYFad3pq/KHWHFb+qRbd1DjLnDa7
	MnwZHYWGOJbySm6lw4KZeTAmwSAn79M+LR/O/Lke3aIYCFGEiPg9RtDd0OLzx1ODXLus4Ch68ZsZ/
	Q8Z3e9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QU-0000000A8oN-31ed;
	Fri, 12 Sep 2025 15:11:02 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QR-0000000A8km-387a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:11:01 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ea3c51e4cffso1466051276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689858; x=1758294658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=zm8g0Kxa6aCjgvk17G0cSQaLVNpnQpks1f59nFv0iLT69MFvU1yhjNa4cC96H/WTGQ
         TiNqULZj8E1JGbdASUbl/mmpUZWIzZyHimHWoZ1rfeYhKwe9oqDBFEAdcIPly0V17E0m
         dUyGC8BoEw8SiqpwbkHn24rz7DhBhvuqdZXRvsp3pPbkl8bb6UT/Bbjh3pKmwbFhMn+c
         oQnf6IY+x4t/1CnBSMxqGYOF5Ru3KeRxbO7vl0UbAOexoIw1e6pmOIG5xg5qKN38QtXA
         IUIgm27rTqevuGtyboIScdvv+FLJ6QOHy65LrKL7xxO7ZyZWp+uPg94vEE2BpU9CJJN5
         wBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689858; x=1758294658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=FYJwYBn/L9VcVhJaGLHRs2uFap/u9rQGpj8MsQBPvny6+BHJzOb5sZDfQrV6GZD/N6
         MZRWZMAoeKwqDr8rbzP3NQ9tpetTSsSB/Ib7kSEXdIaA4FWtW2O3Gcy80ZymDZjCve4m
         9PUFs60Xg/jb8rdE0tOsuvYxt8YwrEhxRd5S4yKDY0PyRNax4YaQvtOKBGslkh0aGiXW
         lo5EyVUwM1MH9Zaf3j1XMXjmgCfC1YPQQR61D8fkeIAxjHLwGhqbn2X6gWCpQb0G60yl
         XGFHwubHFyodjJDNl6yBJi+n9GJc/6E4whVoPDbWlLF4z37PDh8BjnP57ukvKrxRgzgU
         xSaw==
X-Forwarded-Encrypted: i=1; AJvYcCV7CjglgOg5UpBsHI/7qjUpEU+/5CRtlKv9ydUtr9x16Al39gLtkmccK7m0Q+H6+fbc/8ojBeDP+AfPFoazkPRV@lists.infradead.org
X-Gm-Message-State: AOJu0YyTcp6H2SrF9a6rBKASOfncFVbWT011Mm93WQOWbXzUz6VZ9oFN
	t+voa+tNXVuOmi5DW2hxQVQOKO4TmzASgS2swk5NoquDSKetSQlF6fnh5aK+XEJuQoM=
X-Gm-Gg: ASbGnctG2xcPTLU+ZClG7FChlRy63uHXEu0uGe42pArE1PE0M6sAV7CLxf+LpD/6KMC
	2PT7BdDO/yN5oUIhPbqP8DRR8KH2ZFwRyvZBL4NxD+hgY0CNXxvlRQ3XS+PU27FGHOpljZvcx2S
	EcQOcomNIBtWAzYlqGarTKyOUUg+kxbBv25C+VEoMSPDHRLOPYDUvTiyjlAPdTG+UNJOFuQmL7A
	i0DS+45zk3xS9LIp7Yex6MHYSkxfEtywh6xpYDxFdj8rJbHgUDgAGow/cjWcmUyl2PlOmSsW4mr
	MLYmbrds1X+X38437waCX7j8mROz55eAxA8KRblPgI50HDklefWv0Z1BBPHVFkfD6jWmyKgnQ48
	OgN3YEVbkY8ANlfYLB1qzn5+ItdmHhbKo4A==
X-Google-Smtp-Source: AGHT+IHiWq2tZ0Zh+6RCMZ5n4YEMDF8GDIlS1UolWn0dcdm4mJQCk7ANF/Eeoayp4tEVnT1oJJ4YdQ==
X-Received: by 2002:a05:690c:6089:b0:723:9ba7:7f9e with SMTP id 00721157ae682-73064cfc375mr30364727b3.25.1757689858316;
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 13/16] sched: Add sched_get_runqueues_area
Date: Fri, 12 Sep 2025 18:08:52 +0300
Message-ID: <20250912150855.2901211-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081059_843407_AD32D8E9 
X-CRM114-Status: GOOD (  11.55  )
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

Add simple function to get the runqueues area and size for dumping
purpose.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c  | 15 +++++++++++++++
 kernel/sched/sched.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9af28286e61a..a054dd1fda68 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -120,6 +120,21 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
+/**
+ * sched_get_runqueues_area() - obtain runqueues area for dumping
+ * @start: pointer to the start of the area, to be filled in
+ * @size: size of the area, to be filled in
+ *
+ * The obtained area is only to be used for dumping purpose
+ *
+ * Return: none
+ */
+void sched_get_runqueues_area(void **start, size_t *size)
+{
+	*start = &runqueues;
+	*size = sizeof(runqueues);
+}
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
 static int __init setup_proxy_exec(char *str)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b5367c514c14..3b9cedb1fbeb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1330,6 +1330,8 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
 #define raw_rq()		raw_cpu_ptr(&runqueues)
 
+void sched_get_runqueues_area(void **start, size_t *size);
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
 {
-- 
2.43.0


