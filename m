Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25780C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=; b=suAKeG3fTUzZzOXiySEHhyWhd0
	sj94Y9NKWaCEY0P6F+jApIzPUyp2C+Ty1UBg37mttLmg+IYQHMVXEQQ8SDasxcFAVRrNQqI9RdRQd
	FeC9XV8OlMScx6iOM4oPGE8wXkCxuz1ixgCr18SyBrAb/nOyqQGJ3tYHlFFRKYmaAhb/kdzwQWZu9
	5+luy00Wawvc3M3RbyQ1hfB0giRHWyH+aZSz/D9aAjwdd4VIRnfMrBoSMzAFpuzMpdI1ZUy2w6h18
	QUokcbicyO7cHbOxZyR79GIdO2A6HJ0f9ZKD3BmAmK8bDSjGOyPw4lH88vMjS0gARzq8bLgxzEXEV
	WYt4i1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAF-00000006Y2e-3CnM;
	Thu, 22 Jan 2026 07:31:35 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAD-00000006Xzu-2zId
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:34 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b7174ab5faso3105795eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067092; x=1769671892; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=xOFHy7W7240//Iiec/oUlSnxF2gOySuTGj7Tcj4+fjjVPznlZCttC1aPBSP4xEONgB
         WrjFbODWME2GfXMu+z3dnoYA49r23JBrI8HAZPTdZTK9zu2KhKW0f//tuEhtmybUBZbV
         2ZRUiiW4JLM9hA8TPCu5JMGK+VkLTrBn7mo7oN2/SqOG8SfsNK1NRJ4th7wDD5XmC+36
         9v01g8S3eiujP2z/U1vR8Q/MNJqeCs+dxlU0pS1NMFyzT5+XiSrMUGWsF63vh+iYVpnZ
         eOy/feSl9GjSKfa8Tt0hNVXwiwnZHCydd0LJYp8HIj069LzixdxyLn+C9flmQgdDZzD4
         no7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067092; x=1769671892;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=rLk7b277TIO+LPkhnL/gRa67+VwwwnI5ePir8FdiOVdqklJxyNOdmijkGnKp1Dv1oG
         LnpcqMHJ2ZU9szlwjxMx4OEOz8WqT/M9Cvnsv2Lf6J1DI/rBnmG95tfxj0bHX7mtNr0/
         wdEkatF+Ibc8KKFMzKXocA9BXduZ9mNjK5UXT2gfk+U3csHTUDc7orHuDypLxopjAHWK
         zCqsnAsUATLqoZfDQKG+tDAkSs38VVorz0zUENWrZUwsBJ3ZUFlRZi0xpGKoGaoxl9PZ
         VGRLEoY84T0s7nzVCf0YXJFoRal9U8a9bNVAjM8jW8Q+rjP58KU4lSzsHAYnKmjPFCxe
         xKGA==
X-Forwarded-Encrypted: i=1; AJvYcCVK704htYRidnnsjsG5ACqgDO8lq1ixQRgTwqErdZ6FAyc1+oLEzzaLPVOdkZBRjSKlUMa0ibfO6WhZY1KiZv8S@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ/66Dz+Zgu+dDzYUNFP7b6Ga4aHBTXbvMxhx3EuNR8/ss466w
	3WUn8PQjSFoK6VSZkCyg0Gt/AJfd/BwWeMCt2/zldyc8MLawbvXzzH1JOqPfgu0Bl4HnHcsgNGU
	DZQBA0HZ85w==
X-Received: from dlg15.prod.google.com ([2002:a05:7022:78f:b0:11f:330d:ed15])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:225:b0:11b:f056:a1b3
 with SMTP id a92af1059eb24-1244a728dc0mr16430933c88.11.1769067091900; Wed, 21
 Jan 2026 23:31:31 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:17 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-2-irogers@google.com>
Subject: [PATCH v1 01/11] perf maps: Fix reference count leak in maps__find_ams
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233133_761295_7AC5DB76 
X-CRM114-Status: GOOD (  11.32  )
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

ams and so ams->ms.map is an in argument, however, it is also
overwritten. As a map is reference counted, ensure a map__put is done
before overwriting it.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
---
 tools/perf/util/maps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 8ccc46d515b6..4092211cff62 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -708,6 +708,7 @@ int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
 	if (ams->addr < map__start(ams->ms.map) || ams->addr >= map__end(ams->ms.map)) {
 		if (maps == NULL)
 			return -1;
+		map__put(ams->ms.map);
 		ams->ms.map = maps__find(maps, ams->addr);
 		if (ams->ms.map == NULL)
 			return -1;
-- 
2.52.0.457.g6b5491de43-goog


