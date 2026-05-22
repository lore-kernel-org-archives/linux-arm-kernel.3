Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202DECD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc0Kr6q/YLQ3soV5ofZAEXnCcqwAjSYBE+48VtKkBGU=; b=isWB8Esxnx8qpFR+5hWRkASdgH
	RC4p76IFaB1XmI7v7UEX577tAPk75iG3RwLWnlLk/87E+52abn63sgGTF5ZbaGHAbf1et+3HUtRS3
	ziWv6q6r9Gi8pmCMc5QQ6WIGmrcgN4L5VrqzNlNY+DDXfbNnsneK2n1UxgkUCkqiNMTL3ftP7raL4
	sZG0LRb4cQWakGXzypuUTUXu9qXACQsGUGeCypyjAZZejUMcg9tPDMK5LZQWzC1XBNMtxNNDB4cX9
	tH1WDlg5kkAq2bKD+a8ZjHRJYJfZtxj8yQeT9VCF3B5quDfW6atb9+9VhMZNtxtU55D81Gt2qzXht
	ohC/pjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzM-0000000C2iW-3WnZ;
	Fri, 22 May 2026 22:05:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXzG-0000000C2cx-3rxc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 22:05:00 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82fa860e71eso3892081b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 15:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779487497; x=1780092297; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oc0Kr6q/YLQ3soV5ofZAEXnCcqwAjSYBE+48VtKkBGU=;
        b=OWTqcO+zGvW8IfCeFsji6wKpInQbj3A33qweIK15vn8OpIar6BqzAW583wssUcqAFQ
         sx+0UD4/+UyYt4iPcjDpMi3fmTBxBi0+6JfAbISFOJT2ZA8oE1+AlX9YYMHCEyVpIK9B
         4an/r74d+4xiIgd2Ux8hPdP3dK9T6OTf3iFQMf4J0vFb23DD06lnptAV8DwZ+juvMu3d
         zl0o3leDzyi4Rg5TQypqofRBQFrInk/r3Z4Gm/+eg0/roUMMEPH3+lWkH3zI1lEh4d4z
         Lw7xFGgyiVDiU+aS6F0Sonnmv2xaG8wHwpVhKkukfgo6la0zn41BTYWyo6DM2tB9wApa
         XeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779487497; x=1780092297;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oc0Kr6q/YLQ3soV5ofZAEXnCcqwAjSYBE+48VtKkBGU=;
        b=QlZKvfK2RawzZUqTU78/cN2zPRFBPZvN5pRtQef0VBGq3FCe3p2tu8X7U3gEjDwfBv
         ZowgHSsNCHJMKXFTtzjVn/I2fvXi19rEPhAleAX2U1Z+Gg6AbIr6zNDOYDAESkkemV38
         a0C5COYyPQ0r8jWTBwXDsDTvi/y/EdcNWE6u1Ev5wZALCWTcKn1Aqmb9XdgcvbXwEyvl
         JkN/t3/9lNrfeb1BXX5OVRxcDsCTT65mTjvFBj7k1G0LVipIp4rnxDWm9f1jDycXeYpw
         +43bMg4D0PMdg376QQNAQyg4cjG6dZAbwTXYgUwlXSmkoVwowKxpelw46wzvyK2VHlIq
         Cn5g==
X-Forwarded-Encrypted: i=1; AFNElJ8V7Avaj2dPCbv59ke5VezFTTo5Mq3NDStd2D2btE5XRrwuRrukcQ4uDEN9oxkwXRu7oEgv9s7sajp4ucr8h77M@lists.infradead.org
X-Gm-Message-State: AOJu0YxNbwATlZihETOMuqI1phAx6EjouKaxKu5LeX8L43WpbHDuxlen
	uzvilhDA5kW/sDZFsuOy1pdzMtNlyyXFpzlZZlZKEMa7TrEtDpw+usAZiVotd9tGY5A/pkx++Qw
	eGDlSjRL0eQ==
X-Received: from pfnr26.prod.google.com ([2002:aa7:845a:0:b0:82f:805:b62a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c8:b0:82f:559d:ece3
 with SMTP id d2e1a72fcca58-8415f32d5ffmr4770377b3a.15.1779487496964; Fri, 22
 May 2026 15:04:56 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:19 -0700
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
Mime-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260522220435.2378363-9-irogers@google.com>
Subject: [PATCH v9 08/23] perf data: Add open flag
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_150458_968144_649A94C6 
X-CRM114-Status: GOOD (  19.13  )
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
Acked-by: Namhyung Kim <namhyung@kernel.org>
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
 tools/perf/util/data.c | 27 ++++++++++++++++++++++-----
 tools/perf/util/data.h |  4 +++-
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
index 94dc534a7386..ebeb46331005 100644
--- a/tools/perf/util/data.c
+++ b/tools/perf/util/data.c
@@ -345,9 +345,10 @@ static int open_dir(struct perf_data *data)
 	if (asprintf(&data->file.path, "%s/data", data->path) < 0)
 		return -1;
 
-	if (perf_data__is_write(data) &&
-	    mkdir(data->path, S_IRWXU) < 0)
+	if (perf_data__is_write(data) && mkdir(data->path, S_IRWXU) < 0) {
+		zfree(&data->file.path);
 		return -1;
+	}
 
 	ret = open_file(data);
 
@@ -360,9 +361,16 @@ static int open_dir(struct perf_data *data)
 
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
 
@@ -375,16 +383,24 @@ int perf_data__open(struct perf_data *data)
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
@@ -457,6 +473,7 @@ int perf_data__switch(struct perf_data *data,
 
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
2.54.0.794.g4f17f83d09-goog


