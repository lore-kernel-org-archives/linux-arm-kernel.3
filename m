Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE771C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzAqyNBDcatrD/dNYr5THRvvcwinanMOXL+SW4MgEks=; b=vOvIOs4zw71hNjuw3CdatkDRV3
	ulipU4JKZzmkE2/VGxbimtIY5o24LszVAhsN7THcKn5lSGbX196p3xOsJ1SXmDXm/obNU/3cX8uYt
	iu0C+6xBPiiy7dnWvzJCLAw4shkZtUbbnZPbH9SZgcjLf3QRiXluT5/yzDYpok4BeLy0luMdLWWJS
	8c50zixWNd+TqAiU9hj9pm2dNQi8GVaxWAQWpqiQnc3K4EWW6iP9aY2yZCTAn7C+kLl1lFGPJEGFn
	os3UkKm+eKBYPoMBDqg6D6MkBCVqDlg9imPZDdqEz/vEQ+CrFQtUsqoXEFp5ehVt7My6oQgB5iDM8
	iJFOJv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKkj-000000037wO-0r6d;
	Tue, 04 Mar 2025 05:23:37 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKSX-000000034ki-1LGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6fd47cf3cb9so38840227b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064688; x=1741669488; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzAqyNBDcatrD/dNYr5THRvvcwinanMOXL+SW4MgEks=;
        b=VE20NS5isoJCOdkx5yc6Dl5LXiICah/V8pbWqcNkZRbUBlzgJA5bKXnS5OtnUXql2S
         WB7P65ThnpT2fNPJV/TF5n4ZtzTbXzN3zZOr/Y6FBFKVddIFVUw0Z3iLu+RF9EtvppM3
         Y6m78D2a+oYY2SXvGUwsBbeMAsktjbzxQqW99/MCzoa+r/PQYiNYU6X7b8xQoeX9udXm
         OTST+7XwNAvN+BEOBGMkTQ7EAFGEtkfD2tZLhZ6SYFHTflzuU3NBZsH6msLsEMgfJl8Y
         FtAoGsXFZ2nMTH3qrMJcHMgzxOlJ4yJJKUCI53JZqppG2yoYRHqm/0QZfpl7FStTZyDj
         RRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064688; x=1741669488;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzAqyNBDcatrD/dNYr5THRvvcwinanMOXL+SW4MgEks=;
        b=JGneaBsfJ0rVYF4QaaCnb4d97T6zuRCu4Ocz1EEcDOQR7I9zSnlZkQKqZOdyPvxsRK
         cbao4emNJOjPr/M4hyQ1yy0h4lHBGnQTw04tOjxdM0d1ko8Jp59z8kqv7aOmWgP100rZ
         a5jkElj8WFN0H28z5Er7wGnLCMTacUwthLiYebU7MVwLeScnGWj9X69P7yV5L7FEraAY
         02LwaL0VLterODwMR1VsbVUrqFbfXVoHKolpm3d6lfyzT65KhC72VOdh9Y5jRpyU2FY5
         oPWMmFoX4hpCytBhIrEcyQod9yY8ywlGr9wpyHBDJq44I4Le7KzkDy/kYSHEYINKzKFL
         r1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG15HI2piAkUdFNr9gXljjWjaRORNB8BB0hlCDhkXmrW+9ssx5w92hd7B9On+FoLidgmgUH4+KW7S2/KXAyh0f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0YVb3vivx5cqmCH57pxHF6jdOHS8Kyx758ZjYpeSBENDXqTgo
	BCKZUiWReEqBBFnI6PdZw6rp7hiHzOiikmoEKE2pYsysoVc19RT9JAyjCUOWUAbqNiWXVdUYFHs
	5tY6OtQ==
X-Google-Smtp-Source: AGHT+IGcXI4xtcRg7TZCt539wnaKT0i5MXbKrcmjSAdt+8/cOoexhcuHk6pVgzO15AtSpOO1xbrgGJNcQRci
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a05:690c:2a81:b0:6f9:ad6e:5945 with SMTP
 id 00721157ae682-6fd49e2336dmr19606227b3.0.1741064687649; Mon, 03 Mar 2025
 21:04:47 -0800 (PST)
Date: Mon,  3 Mar 2025 21:03:05 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-12-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 11/11] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250303_210449_349773_3D259101 
X-CRM114-Status: GOOD (  12.43  )
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

Arnd Bergmann described that MIPS system calls don't necessarily start
from 0 as an ABI prefix is applied:
https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
When decoding the "id" (aka system call number) for MIPS ignore values
greater-than 1000.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/syscalltbl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index db0d2b81aed1..ace66e69c1bc 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -46,6 +46,14 @@ const char *syscalltbl__name(int e_machine, int id)
 {
 	const struct syscalltbl *table = find_table(e_machine);
 
+	if (e_machine == EM_MIPS && id > 1000) {
+		/*
+		 * MIPS may encode the N32/64/O32 type in the high part of
+		 * syscall number. Mask this off if present. See the values of
+		 * __NR_N32_Linux, __NR_64_Linux, __NR_O32_Linux and __NR_Linux.
+		 */
+		id = id % 1000;
+	}
 	if (table && id >= 0 && id < table->num_to_name_len)
 		return table->num_to_name[id];
 	return NULL;
-- 
2.48.1.711.g2feabab25a-goog


