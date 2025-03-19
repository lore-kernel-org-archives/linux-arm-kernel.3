Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF53C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y38GESo485gGDIFJ1xMbGn6kWCzBk3/syJLY+zfYrVg=; b=cCcn5UnI1hvuKSiWP/KoaQUEMM
	pUCq26nVgVcbFwH7RMYVBX3qS9IzJbxcC/pr6ZIKKkhJfk8OJ6/fCBi+HkkYuMYKrkx61glzpcfDO
	mTa65rTqcFOLacNfB8SsfHAPJM7NWAJG6tk0X7lFnGfWqjwVf34XPA56Wr38NdfmaHlGjsnF0ZNA9
	qUCwDWOTUg33oo2tLD0+35IjN+b5M9dvoPGTcGoOvmK2yMfa8X4CDjggYa+oaAI9J78RJMssbJOLS
	ja7NC0jGjWLekpO0mrbzP7ldRX65+9X1pjzJkmyUzIQ+JFMhvVt+pbiWpGVmG5KwrcaVU/t3yjs3T
	eupyNwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulys-000000083du-3Rhj;
	Wed, 19 Mar 2025 05:28:42 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf7-000000080wb-1BOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6f27dd44f86so86920387b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360896; x=1742965696; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y38GESo485gGDIFJ1xMbGn6kWCzBk3/syJLY+zfYrVg=;
        b=gdBZlwNclm8VAz4e7emfYXJP0//w/3ljjjxO6fMcJKHMuULjq6/FMBs7fGzWJh074G
         KN9cadDtet4QHXW4xbY0WiUmbn0uEQMIZbJjz3SVpfx6+T0uY5JE8LE12+Hk38Ja1ULc
         shjg4K32SZWuPvRpi1MO5b9GbOUzKZU8zr2uTlKbm7KQuC4ZGr7BYrTmoIqsRQ+6Jw6h
         omIjHHayUqGfuyKD8RSRcwgzjA4JbkCI/dUhv864ate8jJJHTfWq1BoHznWhNTsVgFHE
         2hDAMtGHr8zhzs2oPbTEO6ACAF30qn6dKznUt/pGeSSDl2tdoYpX3A7XdI3icfDCPDYU
         s4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360896; x=1742965696;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y38GESo485gGDIFJ1xMbGn6kWCzBk3/syJLY+zfYrVg=;
        b=OUCW5U59kIPPdUGLdvfqPE1T3leKAHnqdnpHXe6tkNgL/Rz1S5GN9f+T4F2YyXE7Pe
         JaGhDWmXzzPdVeLJKQPOvlXCKhzJO9VgEB4WcUUtXg6NRBvGDiQ6WBHnqHwfENb5A+mB
         qDRTi92MxaxygG9hC050BHtlxNqu01Z+yP81cGGYGoW5DReI8QcFO/Pbs5sE9W8twSgQ
         yvMQvqViUy5oJzZtoMS/bZHeJxzBRKa2xcqtqbCcx79/Wc2HMFisvGBGzZwT38METG62
         FX7amJyDFWRh8qIReHnw7AtQf6lhC/pYqTOa1jdVZ999V5UrJhzcwvObmQdwkBuXhdq4
         d5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVoDX+5x/GOEmPpG4y8HlGCXZtsbI+2Nyz6iolM+q32VyknOcoo1spemhnq/Z3FcTTda/cPdoZq4aB+7k4gymS0@lists.infradead.org
X-Gm-Message-State: AOJu0YwsObzlyavGxcwOGq4bKFYymqR+vs8OoIbMEej7uIecVI/WBR6s
	0astTVfcnwybLEaT7y8WyYV+e2/NVkEZPVJAwp8LUlku0LgHFNKgfFpr8gZpJmczUC1RxElMwKk
	AwhMo8A==
X-Google-Smtp-Source: AGHT+IFPFakwCyr0uM1/sz8X8s9dtQflbQjZm9fJ42RkwL6er5xIYEKy4XS6bbEhodJ8Ew/JRCn4+wa1XjLm
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:690c:d8e:b0:6fe:e77c:7741 with SMTP id
 00721157ae682-7009c211810mr6127b3.8.1742360896116; Tue, 18 Mar 2025 22:08:16
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:40 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-14-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 13/14] perf trace: Fix BTF memory leak
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
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_220817_321569_62C2C64B 
X-CRM114-Status: GOOD (  11.59  )
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

Add missing btf__free in trace__exit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index a5f31472980b..1d4ad5d19b10 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5339,6 +5339,10 @@ static void trace__exit(struct trace *trace)
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
+#ifdef HAVE_LIBBPF_SUPPORT
+	btf__free(trace->btf);
+	trace->btf = NULL;
+#endif
 }
 
 #ifdef HAVE_BPF_SKEL
-- 
2.49.0.rc1.451.g8f38331e32-goog


