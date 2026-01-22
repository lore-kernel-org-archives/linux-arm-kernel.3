Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9BD3EE92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=; b=xkf02p5oCWGswWHd3rT7+Wprql
	QDk+5fz4P/Tu7VTQUKNYhkLiZtIrL0hw01lSp31e4utUbp7V4kKtbRa2vzhxNZ3vQ6myooTlMhT57
	b1W83SGEM0lMGnrX69jHT7B+0t5tHconhHBdOueXKoZ/hqvo42ytBfd8rvS/T6QkRises/+PBtDtH
	VtEMOsnvOtNLGYGgiqpZBRYBENWCSGQkck8/cN3r8Cw99s4ItZul3VyHQp/DZtfkPGnHv+3OUZprs
	IMTyjm7oi9THuSWBrAQmApidM1/2qKn4Glju37QKaOIYmVcYUHacDQ4N3X2SwYNoAAY0j4v20zemk
	wmedNTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixwy-00000007TkC-25CH;
	Thu, 22 Jan 2026 16:54:28 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixwr-00000007Tep-3D6a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:23 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so6299670eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100860; x=1769705660; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=3Ma5bSIby52OQBCAx8tqlfO5Jqu22E96JVJIrG3TsRMx2YJPpkPdEyM2g3h3v1eRzU
         AM6q4gEipurVk9iOZbdZxkKD4ULnC1VmwNVgtp8lS5wpzOuJftkv4ijSxAqV1PBQgq0R
         5SfS8cOMqXbttdGhWkVoWR0SOAqT03BIcmUhwb/fzBSVQdxOKHaVEU+KjgRQQDkmvgqj
         hBB8rcIWsnDKvdsT7cWuR1lgXbiU4c799XOd9cH+9bdMnIzGhZ3R+vfdXEqZZzmr3isf
         T04anTkrVPez5wEjGziBWp4QMJie1CVuoaU5WpXvJzxGZOBzz1SdKyEVgINcSHR5zvMm
         8odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100860; x=1769705660;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=mWT0eIEpl+q58LKessriYsXMAsnkwzJtMHLF5S+TK263NkBqXAW10X1/x/gpuAr9qW
         4MWkf6fsZl8XApEVtwX4ohTcEyQyrHR7PZAd+Pj8UsYTabxvsa92rtCnkjkyvvp1BS+2
         PvbiCqH1FvcVoF6rVq2n6pAM8crRSa7QmdmeA7ScDAhkycVUnz3N7DrHwpiprAUpg1CM
         jRCEPrq8cHzZOnFImDYKh6x+QU0JhekfqpheeUUudFoOjLyqMDc2zDvPLB08QgjCwXhN
         Yd3l7cuykGfIfgwh9KjK6PRVoYxkN47beDgZSdHKZ27OvmOHGBK3/rEQf4RDsFVYNyvs
         FHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWx+4/kQ4K5roakDAzg/7MWtP74qLzLA7XRwLoxjP8bnRsoiV9gcYTIiHW7Lz/60/b7bI6L9tkW2zLLiB2tHwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZyg2w0nr7VvPCRjYF2w/9JJePLfPJbvdCudjbaLp0Cc7rjRTP
	55vQK//SZ69sjz16QAQTOdeFcSeCvgMbpHDBl/4zpwqiR+6gdVrJR+wA6o66eHuFxrez/5Op5y4
	wY+G12hvNLw==
X-Received: from dycue4.prod.google.com ([2002:a05:7300:84:b0:2ae:5283:d72f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7c13:b0:2ae:824e:31ba
 with SMTP id 5a478bee46e88-2b6b3eed5d9mr19877803eec.7.1769100860046; Thu, 22
 Jan 2026 08:54:20 -0800 (PST)
Date: Thu, 22 Jan 2026 08:53:58 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-4-irogers@google.com>
Subject: [PATCH v2 03/12] perf maps: Fix reference count leak in maps__find_ams
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
X-CRM114-CacheID: sfid-20260122_085421_820108_C3F6E927 
X-CRM114-Status: GOOD (  11.08  )
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


