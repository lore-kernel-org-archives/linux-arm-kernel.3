Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5DAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHN6hEmKYf/vVKEYrUtFE+mgr5gUEvxeDu0SIFOEKqg=; b=bzL/Pk+irv99zEC7o8XH2N67bn
	NHyRb0cAlOYq52Akry6gAwp2/dPe5B8xxnzYt1aKjuT13Or2KgWddrcb4xtlNAxLD8gPzZMmNJ2dR
	Y8KICLyGlEE8K5qEKjvw1ByzWpVB9lIm2DED0+aKF5GGB8NqczFZxK/F8PzmE8AB49cYIBpLhPSbL
	jVcso8Vq/4wsjDTv2nKT5YRjlBbEWqZ9oshabfv5yAVt85PB7+jnZ6A6P/7SGhRV66uBuFHv2dYLk
	Kpp5Exw7qHvynvKxBDHuNVppnAZilQQvgly8WDNJb/rhfBb9pKBEF1ERnGN0Uog5n04zvIFbDs5Gm
	9RrXinJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNtZ-00000004YJB-2gEa;
	Tue, 18 Mar 2025 03:45:37 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgN-00000004W6X-29pl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:00 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e643f233fbeso1361711276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 20:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268718; x=1742873518; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHN6hEmKYf/vVKEYrUtFE+mgr5gUEvxeDu0SIFOEKqg=;
        b=JhTFhhcOLD+YCTqpeb4qHR9qfCyxuQHjA35anYP6OL2cBj0jYt6J+ZrNbKLfvqmwAo
         3+q2eFE3U7FB64Zx3Np4F65F1AR5QLSD3zS6+QHME4Wx+FOM57DkXvr0LVB3QqIiZhwn
         YFGRih0QaHUaiG2F4n0cvzJt8LHzoQj/kuZOStMqEnI3qWJm3TjfHDwkYK0JgJswsMb1
         E7TPJaz2fkBXFS02ArOaPSNSg57iSLan1qu8d0Vvm8fcYH4i8IxjmU0OrItvTMn6j9DP
         nriwIz0NU+allZ2ZyAH/fxNuiYMiAGDZac7JpcYhb19BPRGPAqosFpxzYfr5XRBVW943
         y3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268718; x=1742873518;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHN6hEmKYf/vVKEYrUtFE+mgr5gUEvxeDu0SIFOEKqg=;
        b=Yfwn7BJFjL9IUi7S0VDOj5VZOtJKdfyCrgy6eoF9/ivNc9o02Dq9NQ1PMGuOqX9c2j
         /QkM0LS5YU0f/UuPevqRHTBd8Jko2w8Go7l5vOtsOvvfEnLFq2Rls7YM+vnbx9POIGk/
         HyaQvonEos4WO1AlZKn7hDBTcjgXyMf/8/s14591JossQtSj0hBxClOovgiRnS2GHPdn
         OkWvpKD4pDvMcZ3M40+b9v1OTeJ0jTVUkdrcWOLBXHmFY7g9dVnzgEGUYlz2w1jZdZZ2
         /lIjJw9xUa2doVP1o07Z7O8Yz2/QbmT8KkueH/sGbFyNRrCVrkkVimzqtnl6T4Oe7vz+
         2ITA==
X-Forwarded-Encrypted: i=1; AJvYcCUAYr94cImQCC15BrosawnEl+6tSTtd+exmqvXdXwJHQ5bWCg2hgLwh2fvyFeK3vLtlazm7TFsdpA3CwcIlNM2I@lists.infradead.org
X-Gm-Message-State: AOJu0YyGzQUFV0YAR17V9IMmscOLk6FoXg18IVRu0R9IfeZSTI55PgeD
	KW5hsUve0fbE1v/Q7kTduehPxXF9l/bnuTMq57kPlaNueLnm6vRfRnimP+ZFMvIzD27yweRDTBF
	V92L6yA==
X-Google-Smtp-Source: AGHT+IEPuBvIcSfk3bbRhT/J8hpoCiqCQuC68IEKcGtvvMui3F+mkYkW6NsNtcusm463jvYm7WncQRBYK9L1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:9006:0:b0:e64:3d36:bec1 with SMTP id
 3f1490d57ef6-e65118d8296mr1167276.1.1742268717723; Mon, 17 Mar 2025 20:31:57
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:38 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-2-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 01/13] perf dso: Move libunwind dso_data variables into ifdef
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_203159_553204_48111B44 
X-CRM114-Status: GOOD (  11.56  )
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

The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
which is conditionally built on having libunwind support. Make the
variables conditional on libunwind support too.

Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 84d5aac666aa..14e4ac21a1d3 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -155,10 +155,12 @@ struct dso_data {
 	int		 status;
 	u32		 status_seen;
 	u64		 file_size;
+#ifdef HAVE_LIBUNWIND_SUPPORT
 	u64		 elf_base_addr;
 	u64		 debug_frame_offset;
 	u64		 eh_frame_hdr_addr;
 	u64		 eh_frame_hdr_offset;
+#endif
 };
 
 struct dso_bpf_prog {
-- 
2.49.0.rc1.451.g8f38331e32-goog


