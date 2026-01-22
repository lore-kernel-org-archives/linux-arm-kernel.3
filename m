Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7068D3EE92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=; b=tO2E8RNmcQLVa6t7i8EGOgADFX
	B4y0CE40qsB5Mg5UhMj9gCN0DkO5+W7eXuW1LdjVE8S5kMbTf3C0ldiCn6QskHjCIcplf2XHbnT+B
	4X6D99eZuh9xliSJv6WbGQWq3qBjm73gNvywxBiDUH2jHMjsUz0gH+7zRyujfgW4UGMFZ13rQSvG2
	0VDtYpOd1pVkMCPmtak6yXz4/3jQt1+jAJ/x8x8YcL4hVeNN3xibSZ7cdy09IxPtnCNkGdjfyK/+5
	c/XDVi0ZFTwl/nICsTUw8ztuIr13k01Zcv+Np33FVlumYqhz3OqotTKX0oKNZxK+ZqhlbqP6+kxuE
	QSJlXGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixwt-00000007Tgb-4AF0;
	Thu, 22 Jan 2026 16:54:24 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixwo-00000007Td5-3KxH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:20 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-121b1cb8377so2489708c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100856; x=1769705656; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=3gqe7CFUGvzeV1S0/tIW1RMh3X+0VhkHAa8AO7g73gRp1bUYYkjjQpwcH0o/1FmJmr
         fW1ykP7MkvAqXa9zRxi4MQ2VE36VPJJiIfDmUcpHz4BcWjs6ARk6WeDlBUyahcnL+f3B
         UNbPpRvGUkxg1P0x0vVeBK/grYT8gJwdAPgKKfb6gDZ11v9eNErz6T+73k1rwzgmO538
         sUBmbWbZf630bZ4EvRlSX2B01D/UHT4RYp4zHmDG4FXYVx3mQCKj1cGz/iinzBSxipBe
         evd4cLSLEKV0Xro1fL0pii2LlHCiYsb5OG8kIuLDevj11B4dXGfTe9lMOkRxXGtDcaak
         VHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100856; x=1769705656;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zalmwLrK8cPj7cYoTUj/KkGE6/xfnap/Tev3VqTduZw=;
        b=worc+gBP4pbPS4mhslKTMJFU6/DH8bFw3qUm9XfpqT0DP9W6LrrzwNp639oqY+KR99
         rMYgMYA8GDDM8NmgkyRuajgchnEwFE44exVYoT20akVVx01ojZ7a/pSdqEbe46NebjJc
         keGfOYEsN2kLdnKuy/5d4vXnoUiIp4HVK86NxTvAPO8mXdfua9f/64vWCfBPCobshhLD
         7YOSr8Xqo+ArS8c9U8mCC0rVMT42nM1QuOH4/sUsOtuApt+ctHJxPqhYgnpmCNqeI0lf
         TwganugfZlPagHqrfQhXewQ1kGNk6pBu7zOZPWhbahQNdIqIjgG1Xr+sa8D+Zpzu5sv1
         U8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVylk5T0xd1ojyYWhTusQhLwXHSa8gsicPa0c9pxm9kR0cv4v98qC6662usTSDZ56+335899OvLf7KcF+Ce5cOj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7KoW5XVx4c7xJV3rmNBOAqGvoK/DWpOtbYHPX4i6MkHc0oUxb
	IbrWWdWSGcoXU853JWFsdfW+0Q3LEz27Wtj4+9TwHR+hQnk4J6RQwbRWrxTeDjGgnUkanh2/it3
	OjUflgtMDBw==
X-Received: from dlbqj5.prod.google.com ([2002:a05:7022:ec05:b0:123:2b17:f461])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4582:b0:11b:95fe:bee3
 with SMTP id a92af1059eb24-1246aabf3f6mr7269627c88.37.1769100856331; Thu, 22
 Jan 2026 08:54:16 -0800 (PST)
Date: Thu, 22 Jan 2026 08:53:56 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-2-irogers@google.com>
Subject: [PATCH v2 01/12] perf header: Fix memory leaks in process_cpu_domain_info
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
X-CRM114-CacheID: sfid-20260122_085418_836841_1DFAAEEB 
X-CRM114-Status: GOOD (  12.11  )
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

do_read_string returns a string in allocated memory, for some reason
there was unused memory allocations and unnecessary strdups. Remove
these and make the "perf annotate basic tests" leak sanitizer clean.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: d40c68a49f69 ("perf header: Support CPU DOMAIN relation info")
---
 tools/perf/util/header.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 9a15dd4b7640..eefd1cd73b6a 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -3634,6 +3634,7 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 			if (!d_info)
 				return -1;
 
+			assert(cd_map[cpu]->domains[domain] == NULL);
 			cd_map[cpu]->domains[domain] = d_info;
 			d_info->domain = domain;
 
@@ -3642,30 +3643,20 @@ static int process_cpu_domain_info(struct feat_fd *ff, void *data __maybe_unused
 				if (!dname)
 					return -1;
 
-				d_info->dname = zalloc(strlen(dname) + 1);
-				if (!d_info->dname)
-					return -1;
-
-				d_info->dname = strdup(dname);
+				d_info->dname = dname;
 			}
 
 			cpumask = do_read_string(ff);
 			if (!cpumask)
 				return -1;
 
-			d_info->cpumask = zalloc(strlen(cpumask) + 1);
-			if (!d_info->cpumask)
-				return -1;
-			d_info->cpumask = strdup(cpumask);
+			d_info->cpumask = cpumask;
 
 			cpulist = do_read_string(ff);
 			if (!cpulist)
 				return -1;
 
-			d_info->cpulist = zalloc(strlen(cpulist) + 1);
-			if (!d_info->cpulist)
-				return -1;
-			d_info->cpulist = strdup(cpulist);
+			d_info->cpulist = cpulist;
 		}
 	}
 
-- 
2.52.0.457.g6b5491de43-goog


