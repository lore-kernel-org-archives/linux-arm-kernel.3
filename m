Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C78C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YCUU7sU0LaTPMQmzYqMXMA0ay7SOjDSgfU7Iry5P/WU=; b=w/TtJRANrzXj2qqxtLFWryNsiQ
	3lo1XR+mZcbR7eDsfrxeNx7OCJfgP7DEJnxOzmFQnLlj536YBRFLrYSRRS6LxyWBybWWZgr56c2WF
	4XmpaLeySKgEh1UVEEG/GmjFYlLo1BqKOwt3Go+aTuqC2ICrAngxSq0bkyMG1wa+BYAeLsfx9pLTF
	V9ST3YMLRyU6GyATAyOVc8UeLa+WTVpYMgj39kUvsernb+SwINaLUC+oObOS9VG8zL7v0PmGV9Hfj
	L6dZ+lJKSKnCo6X0Ehj5rAktgBF/3ZSY4a2pIB7sBi3i6mzmITlmsfNHEo6MQHroCGgSAMoukhu/Y
	NxFhLQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZJm-0000000A0Lk-2c6R;
	Thu, 13 Mar 2025 03:33:10 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZI6-0000000A0CT-3VLl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 03:31:28 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e634d544bb4so829248276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 20:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741836685; x=1742441485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCUU7sU0LaTPMQmzYqMXMA0ay7SOjDSgfU7Iry5P/WU=;
        b=DgEQFh3MlxCxWWolAS6k+eiHGJDIx4GIMZyMirSJGFbqZBHrS0iR2JUr2Kt1ZZ9iul
         PIjqViabQAmf/JTd49I32G9arDK8guvQcNRnjOUww/F4+nv5x74p6fEeFXTzHYK4ExIk
         5/qRhQse/eXo2EjL2rkutnRi6mbSIzHwR8/9ZxDwNNXtmqBsuV5nvpL7jZYV9AfpXZ0Q
         DYdjwBSN9COvWLMEJjmC6G/DjDZ+BJBgAqj270cYbkDZqqMSSgkcqkPQjqB/jCmvKj0y
         fRLqyrYh7woJ7VMHX3zzQGb5oZF/EuM7WtwNUDpbzvpi5YzLSv0/wRhJeGOycIAsLvto
         scZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741836685; x=1742441485;
        h=content-transfer-encoding:cc:to:from:subject:mime-version
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCUU7sU0LaTPMQmzYqMXMA0ay7SOjDSgfU7Iry5P/WU=;
        b=oHbRj0CR4kPtNOqAOj4HWNiDhAJ00dp6epU+WwjisG/vNK1uppbCT6CtCekYjQzgIB
         nXeBc3s1BZlENuDjKiAFQS/w3XSw+COM7pzAlH3poecSoXXZ42NO0EAC6Y0Cp+rah9LD
         DWe5aJIILs/1zWlhPBGIGi/hjqMnAOXTE/8mbqcO7YWfR+p2R4jYeHFKb8CwrG/hF0Qf
         qCp/N76/QOSZFGv1Lzrp2Gat926a2I8qgghrLzdk7lZ+bvn+FDFsMEkAGJlG3UUbuR+c
         G/EezjN2OiHGX6LbSEPsNgQ3qyMXIrksZ27/mgL+yMc5zE/9LKmbSXkKYnjBLuPpK0uN
         ug7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI47au5LmNA1fMl2pCSaaS1NfJafV3rTp4auY0BhMU/nGHK9mdP92bEvpTb5KVCec+xf/05Uxpjjc0ndKiRX3B@lists.infradead.org
X-Gm-Message-State: AOJu0Yxas0X8nXZq4vSbkucsTDfS0NLSFMxkkWCwFaCDncF5JuvltvJG
	cRhnfc+ly0D6+fMQlP+F82CjGI/SEzJCYa3ZMPFZ+pehJ2OFEzcdmJzzLxqhopeWdx7Ig5fW9aV
	TJdgxjg==
X-Google-Smtp-Source: AGHT+IFyG3cDgq05Ln+M3gq3U94u6JEVep+JU8nfl9R1gQIGOfiNyyHzSnSFL8c1J3fOTbNeyQzacqQDbpaV
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:de85:e25e:4e36:1ea5])
 (user=irogers job=sendgmr) by 2002:a25:5142:0:b0:e60:a52a:377a with SMTP id
 3f1490d57ef6-e635c0e7a15mr209589276.2.1741836684471; Wed, 12 Mar 2025
 20:31:24 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:31:21 -0700
Message-Id: <20250313033121.758978-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v2] perf libunwind: Fixup conversion perf_sample->user_regs to
 a pointer
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yunseong Kim <yskelg@gmail.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Andi Kleen <ak@linux.intel.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, John Garry <john.g.garry@oracle.com>, 
	Leo Yan <leo.yan@linux.dev>, Michael Petlan <mpetlan@redhat.com>, 
	Tavian Barnes <tavianator@tavianator.com>, Veronika Molnarova <vmolnaro@redhat.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_203126_907953_CBD8E8D2 
X-CRM114-Status: GOOD (  17.12  )
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

From: Arnaldo Carvalho de Melo <acme@redhat.com>

The dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optional")=
 misses
the changes to a file, resulting in this problem:

  $ make LIBUNWIND=3D1 -C tools/perf O=3D/tmp/build/perf-tools-next install=
-bin
  <SNIP>
    CC      /tmp/build/perf-tools-next/util/unwind-libunwind-local.o
    CC      /tmp/build/perf-tools-next/util/unwind-libunwind.o
  <SNIP>
  util/unwind-libunwind-local.c: In function =E2=80=98access_mem=E2=80=99:
  util/unwind-libunwind-local.c:582:56: error: =E2=80=98ui->sample->user_re=
gs=E2=80=99 is a pointer; did you mean to use =E2=80=98->=E2=80=99?
    582 |         if (__write || !stack || !ui->sample->user_regs.regs) {
        |                                                        ^
        |                                                        ->
  util/unwind-libunwind-local.c:587:38: error: passing argument 2 of =E2=80=
=98perf_reg_value=E2=80=99 from incompatible pointer type [-Wincompatible-p=
ointer-types]
    587 |         ret =3D perf_reg_value(&start, &ui->sample->user_regs,
        |                                      ^~~~~~~~~~~~~~~~~~~~~~
        |                                      |
        |                                      struct regs_dump **
<SNIP>
  =E2=AC=A2 [acme@toolbox perf-tools-next]$ git bisect bad
  dc6d2bc2d893a878e7b58578ff01b4738708deb4 is the first bad commit
  commit dc6d2bc2d893a878e7b58578ff01b4738708deb4 (HEAD)
  Author: Ian Rogers <irogers@google.com>
  Date:   Mon Jan 13 11:43:45 2025 -0800

      perf sample: Make user_regs and intr_regs optional

Detected using:

  make -C tools/perf build-test

Fixes: dc6d2bc2d893a878 ("perf sample: Make user_regs and intr_regs optiona=
l")
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Leo Yan <leo.yan@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Petlan <mpetlan@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tavian Barnes <tavianator@tavianator.com>
Cc: Veronika Molnarova <vmolnaro@redhat.com>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Reviewed-by: Ian Rogers <irogers@google.com>
---
v2: Ensure user_regs isn't NULL when read, spotted by Namhyung.
---
 tools/perf/util/unwind-libunwind-local.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unw=
ind-libunwind-local.c
index 16c2b03831f3..5f4387e2423a 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -579,12 +579,12 @@ static int access_mem(unw_addr_space_t __maybe_unused=
 as,
 	int ret;
=20
 	/* Don't support write, probably not needed. */
-	if (__write || !stack || !ui->sample->user_regs.regs) {
+	if (__write || !stack || !ui->sample->user_regs || !ui->sample->user_regs=
->regs) {
 		*valp =3D 0;
 		return 0;
 	}
=20
-	ret =3D perf_reg_value(&start, &ui->sample->user_regs,
+	ret =3D perf_reg_value(&start, perf_sample__user_regs(ui->sample),
 			     perf_arch_reg_sp(arch));
 	if (ret)
 		return ret;
@@ -628,7 +628,7 @@ static int access_reg(unw_addr_space_t __maybe_unused a=
s,
 		return 0;
 	}
=20
-	if (!ui->sample->user_regs.regs) {
+	if (!ui->sample->user_regs || !ui->sample->user_regs->regs) {
 		*valp =3D 0;
 		return 0;
 	}
@@ -637,7 +637,7 @@ static int access_reg(unw_addr_space_t __maybe_unused a=
s,
 	if (id < 0)
 		return -EINVAL;
=20
-	ret =3D perf_reg_value(&val, &ui->sample->user_regs, id);
+	ret =3D perf_reg_value(&val, perf_sample__user_regs(ui->sample), id);
 	if (ret) {
 		if (!ui->best_effort)
 			pr_err("unwind: can't read reg %d\n", regnum);
@@ -741,7 +741,7 @@ static int get_entries(struct unwind_info *ui, unwind_e=
ntry_cb_t cb,
 	unw_cursor_t c;
 	int ret, i =3D 0;
=20
-	ret =3D perf_reg_value(&val, &ui->sample->user_regs,
+	ret =3D perf_reg_value(&val, perf_sample__user_regs(ui->sample),
 			     perf_arch_reg_ip(arch));
 	if (ret)
 		return ret;
@@ -808,7 +808,7 @@ static int _unwind__get_entries(unwind_entry_cb_t cb, v=
oid *arg,
 		.best_effort  =3D best_effort
 	};
=20
-	if (!data->user_regs.regs)
+	if (!data->user_regs || !data->user_regs->regs)
 		return -EINVAL;
=20
 	if (max_stack <=3D 0)
--=20
2.49.0.rc0.332.g42c0ae87b1-goog


