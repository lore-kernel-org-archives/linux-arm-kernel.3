Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1159FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=; b=QUwg3JUwpXc9RLuB6torT4oh7e
	oGLz/6bGUpsXOzYVNcjUS8V+T2Wbn4m+Urf9W+KxqD3Uq8jZC47+WDsfGCU0BUB+3TYlFWf6bnqdw
	DcTLNjlUSKTAd2a+Ky6Usqw4fNu326JHFE6SwRQ8j3MC/oQzkFoY/UAlDOrgdZ8z4IaGufgpYJxKG
	/CNiERdhJTcJ2YjHE3QNUGyu50B3c8MOij4QFUEtzLrx5L2V9WBGOHC557qxU1PdzzMSttS6BYGpE
	hh/ePQ3Zr5vPvwT8XktT7g7u837kRlhvHMF1r02nb9btMdtHWS/AoR0USGr5c3RRHJqEurI8FsF6O
	VyO095cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh8D-0000000EcMR-1MHO;
	Sat, 25 Apr 2026 17:49:29 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh84-0000000EcFG-0ShJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:49:21 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c16233ee11so12313714eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139359; x=1777744159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=VDV88TcJ492hUo/HhAFiFIQ7e34FEkwjGSsDHgTFhhav4e6LZMtLtvT3Te2nbtRunp
         fCW+IsD+n4LjK42leIZCykIFhgOFazoNqwxIxVsEwLxlztJDdz9L48VwJK9noygYNMUe
         s5PFIa+NzoMCAcagcv2znzLFYRum1pNv/8BJf+QYZe+XvXlyGihXhLNm9Ccp2QK/l7hg
         P/MvpfQHIYZMfhR1EnU2HxNz/K+BVTEtLuBz+Ganbj1k7YEfgHMjoFN1sIIfjunFgIIA
         cVADaqVIIIjJPCpv375UortdqNXhrOGN/lg+0p7gFVfxx8TJn67Ewkyu5E5klZs+g2cd
         RvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139359; x=1777744159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=CatqRvMYa5LSvlJd/D8H6qi8C7cccPCVTNqHCo3fm77jd/5+wuS5UjwfCKLUEVl5RT
         E9lav7nmQJkp1R8MjfQZ/vxhgSBa/FFj7/BbrG+VAKXt2c3wr2I+XXHSv0m9h1Di7IW0
         3rIRKV/lN5lcmXMBQC+54r1Y9uwqv2Q/jBIXA+TQ0yZe4Y0k1qgcJhc4FrD85dQr5XJs
         86L+JgTVOvyZ9ruE/mhZb1E+9FxeI7DkJXh02Cb60eZm+tBDx300Wo5kns9J0NamUvbz
         ycgG3uPgU2zv17mlTKwZClDtcgHMjyI7EOFX5ZfEjfAgB6K2SzDjjkwSdNYYHIL1h/q3
         /zQw==
X-Forwarded-Encrypted: i=1; AFNElJ+dXO4HoFZTE258aSwXt0skQjaMPyDedrf3RndSYeyNn7B8RHPf2U9MeBvBziTZBZQTpc+qQJKLXLqa/pO5G2PI@lists.infradead.org
X-Gm-Message-State: AOJu0YwE20FklFP+NvBEFYK08gyZ5J5opu5/J2agW0HrffNe19yWlBx6
	bqQmZU0ljGfSIWuAdzJAJZRuzi31sUWiliUuTTbnn1tsj4RG3eX3BD1icxq80t3jjiicDMmyT4Q
	sg/0qI5uJqA==
X-Received: from dyz11.prod.google.com ([2002:a05:693c:408b:b0:2d9:912f:7ec1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fe03:b0:2ea:ed29:ab1f
 with SMTP id 5a478bee46e88-2eaed29b8a6mr1930484eec.0.1777139358979; Sat, 25
 Apr 2026 10:49:18 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:07 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-10-irogers@google.com>
Subject: [PATCH v6 09/59] perf data: Add open flag
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_104920_145250_34FE9142 
X-CRM114-Status: GOOD (  18.61  )
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

Avoid double opens and ensure only open files are closed. This
addresses some issues with python integration where the data file
wants to be opened before being given to a session.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
Changes in v2:

1. Fixed File Rotation: In perf_data__switch() , I added data->open =
   false; after the file is closed. This ensures that the subsequent
   perf_data__open() call will not exit early and will successfully
   open the new file.

2. Fixed Memory Leak: In open_dir() , I added a call to
   zfree(&data->file.path) if mkdir() fails, preventing the leak of
   the path string.
---
 tools/perf/util/data.c | 26 ++++++++++++++++++++++----
 tools/perf/util/data.h |  4 +++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
index 94dc534a7386..17baf71897d1 100644
--- a/tools/perf/util/data.c
+++ b/tools/perf/util/data.c
@@ -346,8 +346,10 @@ static int open_dir(struct perf_data *data)
 		return -1;
 
 	if (perf_data__is_write(data) &&
-	    mkdir(data->path, S_IRWXU) < 0)
+	    mkdir(data->path, S_IRWXU) < 0) {
+		zfree(&data->file.path);
 		return -1;
+	}
 
 	ret = open_file(data);
 
@@ -360,9 +362,16 @@ static int open_dir(struct perf_data *data)
 
 int perf_data__open(struct perf_data *data)
 {
-	if (check_pipe(data))
+	int ret;
+
+	if (data->open)
 		return 0;
 
+	if (check_pipe(data)) {
+		data->open = true;
+		return 0;
+	}
+
 	/* currently it allows stdio for pipe only */
 	data->file.use_stdio = false;
 
@@ -375,16 +384,24 @@ int perf_data__open(struct perf_data *data)
 	if (perf_data__is_read(data))
 		data->is_dir = is_dir(data);
 
-	return perf_data__is_dir(data) ?
-	       open_dir(data) : open_file_dup(data);
+	ret = perf_data__is_dir(data) ? open_dir(data) : open_file_dup(data);
+
+	if (!ret)
+		data->open = true;
+
+	return ret;
 }
 
 void perf_data__close(struct perf_data *data)
 {
+	if (!data->open)
+		return;
+
 	if (perf_data__is_dir(data))
 		perf_data__close_dir(data);
 
 	perf_data_file__close(&data->file);
+	data->open = false;
 }
 
 static ssize_t perf_data_file__read(struct perf_data_file *file, void *buf, size_t size)
@@ -457,6 +474,7 @@ int perf_data__switch(struct perf_data *data,
 
 	if (!at_exit) {
 		perf_data_file__close(&data->file);
+		data->open = false;
 		ret = perf_data__open(data);
 		if (ret < 0)
 			goto out;
diff --git a/tools/perf/util/data.h b/tools/perf/util/data.h
index 8299fb5fa7da..76f57f60361f 100644
--- a/tools/perf/util/data.h
+++ b/tools/perf/util/data.h
@@ -50,6 +50,8 @@ struct perf_data {
 	const char		*path;
 	/** @file: Underlying file to be used. */
 	struct perf_data_file	 file;
+	/** @open: Has the file or directory been opened. */
+	bool			 open;
 	/** @is_pipe: Underlying file is a pipe. */
 	bool			 is_pipe;
 	/** @is_dir: Underlying file is a directory. */
@@ -59,7 +61,7 @@ struct perf_data {
 	/** @in_place_update: A file opened for reading but will be written to. */
 	bool			 in_place_update;
 	/** @mode: Read or write mode. */
-	enum perf_data_mode	 mode;
+	enum perf_data_mode	 mode:8;
 
 	struct {
 		/** @version: perf_dir_version. */
-- 
2.54.0.545.g6539524ca2-goog


