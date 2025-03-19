Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D75C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abYRMOxViqYMp92GMDii3ruSxpFYmB3QwrQR3Z5L6HY=; b=oZh2WmnhvEsSMiB/iDmOr7xEtd
	5QPvOJVmKhctBAbHN1Woow18rgVGtyjg39s4V9onZtO4FAxkuDFpxfnpnibUcMtK4voCAZR/w5MQb
	9hgBgDcmJSqBgVr1H8wzY4LUYZpG+fOg/0Qwc22HAPg4Hby5vJ0lEAriiyOUvcK3naxp2pbYTJgQ0
	MJ85HOeBEWuw9w/H99zgeRnIufsYsVdfmFO6PWHDV3tB22yyoHTGjgYA8Y9lD8rRBna6sdtAknrfO
	ZTEQTzynpNCjNY0Ioeicy09BdrP0zCggzHUtLsOd+hBzT8acQIwQxCLDWimmwW7cAZyt03568Ggvy
	G/13N6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulhz-000000081Uc-2ROe;
	Wed, 19 Mar 2025 05:11:15 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulef-000000080gE-0Gzc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:07:50 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e6432a0dad8so4642633276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360867; x=1742965667; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=abYRMOxViqYMp92GMDii3ruSxpFYmB3QwrQR3Z5L6HY=;
        b=yJNhReJzkxm2e8LGhYEiqjWled5/44YViF/cY6eFVtPrRmoNX1Fl5PdOMsgh00ne+p
         LybWA3kfuqMCUv9jJs3Xz9BIwMmi1g3hK9x2R9EQ6E+DFEWPdiw7T/RmYUyf+8TDBEQU
         Wx8eGO3ANgLrJog3lub0oSAsMr+30/luv7MIh4S4muWRDE5FP7LMljVRUv8xdD7n6wTh
         eV2Jvr7KEf7ha1bfo6Yf+7xy+0SGx+OG64ZEc2qz16Fbo2nKDvTHDT+Ne5B8vAZZhUzp
         f3PaSrb3sh01n+7uwwJBcHgvp5kuLtSBqsWbkLsN7DbJTXFRtnUdph6dBCPgOkfoIomy
         ZzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360867; x=1742965667;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abYRMOxViqYMp92GMDii3ruSxpFYmB3QwrQR3Z5L6HY=;
        b=H4g5sP1SrlDOb57ESuPKKSzfszAdjBvQvmy+wpZdVJPPRT8PnfAlamuIkGuZBb31r1
         8iI3Gf81E9Xqu/2prJkIGvezep0Ib2FOnMqHgGnQHVVeanGpmvZAU+eElliFEuoYFErK
         2CJxxZbjE0w2iyHBKcGL++1JFM6SzQfE85YwqSBU+QpWe2N1+Cc0JRV+5yyRS3OpJaAo
         LA7CsnJXsnDSH+wBoI9VRMKvgY2Aspe0sQIXfAaFQgxyYdBSaS/1Nr62kuz9KRDBTD93
         8ZLyiOhWHQ7GyHORZyZPfbqGx+FpUO2AEV4eGju1BsaocvLShSJa/oP5SrK4taxd4Pb0
         3zwg==
X-Forwarded-Encrypted: i=1; AJvYcCUdfZxqJHgqM5aLfYvF0Acd+kHMK4esReFjPxt2WI0bCJKLSjhGkhnjPn++Zsy3L/uOG/TLchEBjnGV9/L3AkhA@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVHytIK8ePnipXO64agXLw78HLQ5E9M0nN6bJr2Eyw2iP3YD+
	Leg6CyalNV6G9ppVb5Aaux1wgByzsFJWQXZVoE8ZwVjOAh6DV93aMNmL1fmRjjzoIaJvlbQ1UDA
	BRrxyxQ==
X-Google-Smtp-Source: AGHT+IGRmoWaZCuVB5ee3Iv2LzVEuNeEJLA9zgD9tzBFtuvqHm9F4Ignee+o0RWj2MTQlY6HLf9109e/Wj7N
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a25:b323:0:b0:e5b:f74:f5a with SMTP id
 3f1490d57ef6-e667b456dc4mr504276.8.1742360867177; Tue, 18 Mar 2025 22:07:47
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:28 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-2-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 01/14] perf dso: Move libunwind dso_data variables into ifdef
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
X-CRM114-CacheID: sfid-20250318_220749_103080_147D43FD 
X-CRM114-Status: GOOD (  12.41  )
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
index 846b74510038..2cc1f6593f9e 100644
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


