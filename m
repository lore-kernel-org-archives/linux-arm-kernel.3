Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48686C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 00:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBag0ZTpgw2jBnuqcdEe2ctv9zQnS+6XrNEn3QpM0IU=; b=Dv+KcHc0ZNEM9rTiYkn5E/1BKN
	BTDHUnaWcb0n5/M1vIEdxF6BMMTs5dfDByZAVTbs44MWW2ZN8V1BoFYN4xl7l9y1b+xEEa+fzEZG8
	LzWmepJf6I5QMeWEnAJR44IvGAFCQ09jMMq77bEMF5K+vp/t6MOi6ewlM5nboZhow/Movylm5nGd8
	fx+xG9+OhUDSvfZAkVBUL2tJdlmlLZb8cPw/1RtpxEhkLzze7ph6QcFo4vvTgrjxKx4QsyO8w1kYv
	+f4Sy9lnjXj+pf5ebQjHQzo9gn25YPGBd2lIAb+pvhFh/srYr6GByNt0gjLbYJwVK2NYdLw8NMSHn
	NowiZT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiQ8-0000000Fx6i-4Abq;
	Sat, 08 Mar 2025 00:52:04 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi7L-0000000FuPG-0jPB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 00:32:40 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6f4348c854eso33792997b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 16:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741393957; x=1741998757; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBag0ZTpgw2jBnuqcdEe2ctv9zQnS+6XrNEn3QpM0IU=;
        b=ijkkhllG/PvPrXfSpuATvtfCvW0mYxXm/46nWFvVffXBsdlsRMEpWkRyv636VVWlNf
         CRHJjilUiuBlrBRqWTXJHJJucZZ7XEAowjv0baozToFEmcvdFu0pU9rBwtSYmErouVcf
         H0g0C6gF/9xE1V3gYJ0sVVny58+iphp4YAUfYmEF7WVdhLY6rZastMWf0GSy6Cq0MOch
         ooCfG5hhCgE5ARkU0rq7hgDW9XxdtvIp/LrcK0IJaLefVcM7MrDtlNs84r+bi0wBbQDe
         jnQlCTbnZdYll/IrLeFAhB37ZAsSux+eIrjQovL3+5Zc3Ra7pbBOOMxdxC+HuZKfC1m6
         +HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393957; x=1741998757;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBag0ZTpgw2jBnuqcdEe2ctv9zQnS+6XrNEn3QpM0IU=;
        b=Z6SUin+Rxy1eoakaIVSjyBAdK3IjHh7GG4UpZJ+Vjpl5DK+MegSXDjaALAS/wsXHQD
         EAymLJEh3elYKEbLRGuCeS2DpxZdZHB34j5ZfG6YBtM+9MSDRt4rfjP8kLpNjO4GX+ju
         6KJP0Y+DPRy5dgqoy/4jRyXxJwqO0tLiM4DN93HGK9UeLg8Kj9XMdeXexBoaBmshp16r
         sQx22rQzucJa4GFxEecViO26yCVU1qwnoU3lHUu8S/vgTACv+PfmzFTf90nqfJgl6NaA
         d2qHAEgz21OcFgESyqMb9qjJFUkIMyCIs9qrWUiuYJyD0WDayQRDEF5Rm/ct6vPuufj4
         B4kA==
X-Forwarded-Encrypted: i=1; AJvYcCUAVthHiDMWb4q7DWMmK5Gk4YKjFAxgTLPClZJrjCmE9FrGjk9msz7WYn8BpqvhKi/CIXneIUHwhZ7lHPKDbTZX@lists.infradead.org
X-Gm-Message-State: AOJu0YwD6003FThaJ3HiF0ltFQ67CtiHETncqqEVb+Z9ShJjId2oq7Ko
	UZSTMF899Pwt5+EuBxLALYfcXxhwTPXx0vIgPz3wcTUMT/hUdgOilVbKj4NRMEwCzlS0rKSEClr
	F3ThdXw==
X-Google-Smtp-Source: AGHT+IGhJSVrXcuIauCCTdcdrck6v986JR4xLPN3EKMbWJDNglYuGen8NURA01YPhhzdv9BlJdEWKZRc9pFA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:1541:e490:aa80:5766])
 (user=irogers job=sendgmr) by 2002:a05:690c:2901:b0:6eb:ac7:b4bc with SMTP id
 00721157ae682-6febf2a661cmr5088337b3.2.1741393957696; Fri, 07 Mar 2025
 16:32:37 -0800 (PST)
Date: Fri,  7 Mar 2025 16:32:09 -0800
In-Reply-To: <20250308003209.234114-1-irogers@google.com>
Message-Id: <20250308003209.234114-12-irogers@google.com>
Mime-Version: 1.0
References: <20250308003209.234114-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v5 11/11] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250307_163239_207454_70347FEB 
X-CRM114-Status: GOOD (  12.31  )
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
2.49.0.rc0.332.g42c0ae87b1-goog


