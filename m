Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99531C98312
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz2w6bSYQtg03VDKQBBKJWoE2q+Ly0vxb+x/N3KKFNE=; b=ltQYvIsgZMdvtdIVUbs9bQsS6F
	hVgRViu4LtcgiGFUxgn+N+YaKTPREGvmgNXQnouh+JHAO8O/h6Dgbw9P/bAKveVvFPLEh0Ivq8h04
	d9yZGbIdRMq/Va91KJSLrESr7wsdPG1Yhy5VBKuUKZquywTBz5m8Myh7qy5CZbhSuMzR9W/jkJOMA
	KEenUkDdDArXXJTGVkLec4IkoswgLZ+bKWHGLMHTk8BmIlpG+nW6t/pp6Y3vBunt6Znbfnl1OUR0o
	7eKkf0UsjCdARpVZ1i8UDFlNuB31rc3OvnqrPpA7Z7KkNEkTZOVaVKeUBNvCcE5Dymjysj1K2zzea
	9244V/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysM-0000000FEPV-3tkY;
	Sat, 17 Jan 2026 05:29:30 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysH-0000000FEKp-3kqJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:27 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ae26a77b76so4880921eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627764; x=1769232564; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz2w6bSYQtg03VDKQBBKJWoE2q+Ly0vxb+x/N3KKFNE=;
        b=3+t0Lx+YybBFlgdZA/NfOu7TJFHdQLBXD3KB1Y66B4w/DDjeDPhs8oHdgdXY2J4vnm
         EVqzwVcu9FsHzU8uHmHXTtDAjLYMTHfGouA1GVc7OoJABtAfbFbdpi3M0hUSJ63xHIyk
         IElFyp4kMu6HPxnlYCHLTWTH4D/VRp7tUOwWgHmGJygHJvHpwxk9ApoZgnE4GWOhDxDB
         5y86auqzoCmi0vWPvf1TQ2VltTjB/XkW1kSXcmcDKsoguIGF4cbAkx3DnPjA4EOxx9Wz
         yNp67TOJHARuNEf09bStG2ICBa9Pni8OES+go937UCm9drKP1pzhWxgtX/K2qOyOwVq/
         FMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627764; x=1769232564;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz2w6bSYQtg03VDKQBBKJWoE2q+Ly0vxb+x/N3KKFNE=;
        b=oXNpmbRTjNz1rnDQ/xmLq9yDCjN9VKLJVVu9OY4081GolVQKH5PkbeZ1rbnebMcz4R
         td7EzctsWATjoNYKhH9Ds9deQXXcYye3c0efXF3gAdbS2Khs9ZAznGyGiZGKIivkCPBu
         A3XQB2sLMJi80Q9gsfjaXSdgSxVLx+avKs7auLRXLi5166U0Ha/SJtwS5XlkPGAgx8FL
         Ch2wU6rIKJfTQI/AnV1pKrj/7VW7vtILVDOU9VPM15BI8Kn84El2mprMu/omoaVbVPvV
         x8fcBZkyXudA5l9oKJS2zlauAsDbacY4B4n8hFzpGCCvRe2JmG9Y17OH+YVrG/MZ0WOv
         DR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6i9xlguvA5g9jKFnKgcuF7EIrWa8+9UbFw2dVhMpFPzazAn8raUuB23haqNI8fQi5uzkYqzFK9fmz/d7nQurt@lists.infradead.org
X-Gm-Message-State: AOJu0YwJKrX3uWxy1hV/EqbXSrePYyWnk2AsWHuW6gEMuqxbnX+jh9Kw
	Y3lt3dpQv/yvau6aF8O/QOCSkZX89sPGgWtcEMRX20sqHz2o4I3qTK45o08D2IIc4IbgepxI1NZ
	m5HxQCqrmhA==
X-Received: from dlad13.prod.google.com ([2002:a05:701b:220d:b0:11f:330d:ed15])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1e01:b0:123:2d38:928e
 with SMTP id a92af1059eb24-1244b36d491mr3478584c88.35.1768627764374; Fri, 16
 Jan 2026 21:29:24 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:29 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-4-irogers@google.com>
Subject: [PATCH v1 03/23] perf record: Disable inline frames when marking
 build IDs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212925_958761_E0CC753D 
X-CRM114-Status: GOOD (  14.48  )
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

Marking DSOs doesn't need inline frames traversing as the inline
frames are all part of the same DSO. Disable to improve performance
and also to avoid potential issues with dwarf information.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 003e47a4fc1d..663ca3a03396 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -1509,6 +1509,8 @@ static int process_buildids(struct record *rec)
 	if (perf_data__size(&rec->data) == 0)
 		return 0;
 
+	/* A single DSO is needed and not all inline frames. */
+	symbol_conf.inline_name = false;
 	/*
 	 * During this process, it'll load kernel map and replace the
 	 * dso->long_name to a real pathname it found.  In this case
@@ -1519,7 +1521,6 @@ static int process_buildids(struct record *rec)
 	 *   $HOME/.debug/.build-id/f0/6e17aa50adf4d00b88925e03775de107611551
 	 */
 	symbol_conf.ignore_vmlinux_buildid = true;
-
 	/*
 	 * If --buildid-all is given, it marks all DSO regardless of hits,
 	 * so no need to process samples. But if timestamp_boundary is enabled,
-- 
2.52.0.457.g6b5491de43-goog


