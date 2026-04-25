Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B29AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=; b=Dosxw4jqAnRiQaT+XSr97e3iZI
	cc6bu1Z0jAQZk1RlhnlXvQbJWhBmK2FKySG1dABtzYzE6EkRHHA3UkanpcgvQ5E0/Tx871gJ527HZ
	VmI9pz8m84HBjLxq2mvy2fzRcU1JX2UFO7fka/xCuJ9UkrtZCDq/6ajCadaEZVqlJwCK0gZjaIt9a
	oS9mGi+G1xDDYdU9qkYGGU4Rdv/wivdkwFIJnwJu+fWf57iUYTPTDBHr8dmU9k9DvkvC7ex/0sclP
	dhNP2/qy1BIRh7jKvUcjLhq7xRhwqF2TFC6Vv17FVIcDlE0715BME2o7V5cv+kBjTL1GoMq4Y5eQ9
	wq4H4k1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlhD-0000000EswG-36G0;
	Sat, 25 Apr 2026 22:41:55 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlh8-0000000Esqw-1ehZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:41:51 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-126e8ee6227so9126554c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777156909; x=1777761709; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=KgN9hlX9wXKjuG/83suWOcfzEH1ibsX3u2bEc3oJkKcyTtJ7uqSSSlTomSmPJr8FxO
         +0bXBd2bw/sQlRNGixsrJ1NxfU0Nrz1JiQPnW02QsFBMejErafQq1di5Z8o0fkRLcB9Q
         DAfiM3OLtoliNO0FIUk665XYy53VmZp/1VBrK4S2larBptAoEonOuKpivZZlEMvUOd78
         R6oZykyDA8Zw+D2CI69+U8lJiZw4G8lTyWVbeo9+r4qtPnXRci+OqT8h2fjVDB5r2tTG
         DetUs8EFTTeWcQhmqPTEVtJ92k/GIEYpXuc5PaafsRZiIFmv70HaZNlYpBN3p4cEJIKf
         LwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156909; x=1777761709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=BSXYtm+jAH+LPxUxqEL1uhjdOZcJdCWkb4Jkt0DCEYWVeG32hN+9ECuszGwY1/LNY5
         TMHxa0WZ3uwqeIFEwN0utlDtmDjUEAx8sCpZnBQtZvOdx+qj/F4u+vCKNzotVaVJ7ZYN
         ii7PwnkVAN1iiiCGZ5iaNvha3Q3B2NC59oSifinZPev6757HVQsnO1dMIwogq6jDwnyt
         74fihT3SUmRCxguDsVCH5OHUDEA4uBg8RkeT8YvkVB6HmUx8ThI8kNKRweW8Gz1wabqg
         RPzV/lak1++mIqAXOjgWCI4C0g3QzIn5jUUtvX/7fBbMlwhJiLQ5TkjKh91/DrwTKQ0A
         IbCg==
X-Forwarded-Encrypted: i=1; AFNElJ/1S/OMlN2/PnM0BUW/ksP9cl5AUgKStJerHX1ay+5Yt1T2fWb77DFWTGCnDA/tg5HlMcnWWtbQEarObTaA7HjZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvh7kQpA6qvRuh8FphCUvncWSajYKX3nMql2LKWWtLnFZpyeA+
	Tf3zZFFENM5HYfekH2IaJyMZrcRmYKFBYkjdfNz7IBtnsf0n5Nz/XvyAujbhAlU/dEwL3/gaOI3
	5A1H6GWz4rw==
X-Received: from dlbbs39.prod.google.com ([2002:a05:7022:927:b0:12c:8b66:5a8d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b99:b0:12c:2dd7:9099
 with SMTP id a92af1059eb24-12c73f9fb84mr20495568c88.30.1777156909066; Sat, 25
 Apr 2026 15:41:49 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:40:34 -0700
In-Reply-To: <20260425224125.160890-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224125.160890-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224125.160890-10-irogers@google.com>
Subject: [PATCH v7 09/59] perf data: Add open flag
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_154150_432655_33A63BD7 
X-CRM114-Status: GOOD (  18.50  )
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


