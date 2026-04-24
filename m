Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A90AFED3F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=; b=KYw2QmKefQRlk7/pWGi2oNTDVX
	vayM+Ia3HFuqCyiXs9CD65j7P/itqhvn7s56ByyRMCmnV8cGEYVoR8rHBCfUFWOnZEkwuWbsKiUlb
	SGFY1nP2wJvjniPacylS+bUaLEh7WC37lLlg0+ae7XpzVn6+zUjV5P6IeCoajbMRnlKNA0DdQgqob
	l8vFNd36lO/avAuUdOkk46DxDqx+KwV2H//TwZJgSPZYbrXNjfvbSinRV1FDnGcreqG2b7bGAuA/v
	S9utfnuE9vf3v0lx133HkL1BL5lRzlBV6Kj5jY4ThdBSdyC6TZnP9JBUdFmZ0RAuC0Aa6fQRJr6zh
	XJesPutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhT-0000000DTbv-1mBI;
	Fri, 24 Apr 2026 16:48:19 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJhF-0000000DTPD-40LN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:48:07 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12c21dbc9c1so29133080c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777049284; x=1777654084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=BMlCP8dKEeZgF2ovXjx7Y7i++4ub5frY3n95QQ1jFc8V3WU7etsqOS1PWWoQWPGAMj
         Ev80lXMY0GHDfzEb9IhYuF+Lk1sfeeFTlhZie4GcuQDF/GeooS95jSN9tPqLIuaKziS+
         +PbBXQzOyvsOvxw662kuyAT8l/BFGutg7q/2Q4VLIxxb0AzqJ9MQ3qs9e/3UKK0X8Do5
         QBKFJ7ddJ0C6budf+m9BKkdZP9FCWUi3tWso7SJnwE4wGbNocegMQMQmKdKNJenRkbFw
         BUSlzOa3T4LHhiVf/Zt/XaeeE9UkO4fO6I32hx97I1rUd38Le6ubRSYjlKs5R26F2QWr
         u3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049284; x=1777654084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=DCcH9DAuvWDDPlYVZLmIMSpFn0NflHE8gcIjFskxRi0jlwzRGUbF35TClHJSlZ7g9J
         z6+w3+EKo7e35UkGScbf4F+Hc9MbSkIAaA6q68B0PzmI0RA6jsWVifNdcFBcZ1ly/H7R
         rUADm+72RfogTaf+w/bXTixvKt0Os5h8sRAW2XxcD5hXjDHQUrZ7BGuCP+1Su/NsrAQ5
         ZTgsxhhUQZ6Ya1L7gegQouGmzJdMm9ppao2rowzaTydKwyIphKTxeiisJknyBDoX+Gpi
         s1fSLUPegH0/Pvfrk0h7NPPXtqnBzS5GM0/01bjBAeCqeX8o7mhmcTvK8doS6JslV2IS
         xiXg==
X-Forwarded-Encrypted: i=1; AFNElJ9it3TkTNZRTxoEhJp3L1SJC2Wqa93QbzQcS2hXK+bOQDE2VdKtdRGkgtHRToAm5VJYhgMKnz9S2tq764p3jVNs@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ9GXMN92oBnstzGkQh0BkbffgjOJtJik/T9YcwvTtA7CPvNKX
	iR+a9Me5GQNwvbVEfp7bnoV3zWnAEqkqnAsM57UUNgO877sEdmp3U9PSIZEmkSE6ssQJpBnZVTK
	zBS+kDBGj5w==
X-Received: from dled13-n1.prod.google.com ([2002:a05:701b:42cd:10b0:12a:ad8d:be18])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:60f:b0:124:abaa:7ff2
 with SMTP id a92af1059eb24-12c73f9bc97mr18739871c88.24.1777049284122; Fri, 24
 Apr 2026 09:48:04 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:46:31 -0700
In-Reply-To: <20260424164721.2229025-1-irogers@google.com>
Mime-Version: 1.0
References: <20260423163406.1779809-1-irogers@google.com> <20260424164721.2229025-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424164721.2229025-10-irogers@google.com>
Subject: [PATCH v5 09/58] perf data: Add open flag
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_094806_002175_432B9139 
X-CRM114-Status: GOOD (  18.56  )
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


