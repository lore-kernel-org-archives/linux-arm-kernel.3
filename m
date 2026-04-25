Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A20EFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=; b=1nhEvJqw77whPNlNz5tzDWfcZs
	19Z/RVcg/6a/VDxskmJWbzh9ZsfXkczlXqX19wP5eNjHnDfw4k6A3jktDlfvXeAFotxJDRFj+OUKk
	Z/pEOkkKxNK7OeRHGiT7DA8dl+I0XKLTa74apfC1OddGrJLkJdQoCu7GDQeGViIpwBY79Cjlqcuk8
	JZZKacRpe545OwClf2d+ovrLCRvIN8mFUdBcHJJ7qT2b454DpXpsj2o4kzzMwl52J07spa5LmuTHg
	VNsVE5FOcEI/Rcu6qBiNw+/6CpZ4NoonZbBn7RJ6d7UrHG2KLOlyT2WoUQbapWIeLj0yedpqn4tF2
	vg9WBjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpj-0000000EyG4-24u4;
	Sat, 25 Apr 2026 22:50:43 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlpY-0000000Ey3t-0A5d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:50:33 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2e60238adb1so21620335eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157431; x=1777762231; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=wmEDb+Lv8qmoBpCDiqc0oCCzhWVh1F4XwXRcVJ2LtC1D0JPpOiYTt00hnCDn1S7+fX
         EFr2ur29JvoG5v8xBzqm36UpXtlgoDPS+iBMa6RuM4mjpJmOnNpdkUpVtNIlA+Fg8ajA
         DshGnChy5UODDgd05k2J9bTsXIlCuyiLDCT0fYltdQlWyPYhy1mq4fXVix7U5UTYyViV
         L2P9iiuI5wVCNgclfJpqbQrlRpWRYojmKkencJaagM2IYdyi5hOZ1noHi/cdAQrAg9Uh
         G4RyraRefJS9Ip7xNKfZ2mwc4zkXorkEYdroCk9CNnJ4/OiVFYKu+y7R4b0jXeum/rBC
         V8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157431; x=1777762231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=tBwpFqoG/6shkdNxa6/SFl+8SOMLQNUdp6Krkj5S/PDpjjaN8WZDI+ku4EvkF2dXmA
         GTlt0KOlUply9kmvPV+zgxT60si4KSWczhr98Jgi4+gnLyNUCNQJVNZcLkA2zgM53AYO
         4I2GwMYZS8ryeTY60/mPEx3HsPoOug6JAH0jtOpC/OjvZ3MnXCkVA/TyjEQXMBgcbC7y
         PxSBjRc7TSXuWgRDQ1xs9aBynAtjJAa5vU5ZLv+MuqjgOodeAgIjCouE+SFhmDLT8FDo
         FnR1mp9+YVKC8TuAGMmbKqD2E0mHAFzBUiSo0E8hzkfs0a+BtLcEvBcZwwhplGH2QK+V
         B13g==
X-Forwarded-Encrypted: i=1; AFNElJ/i1CSSiHnxSnwS96vb5Gco2XyamVQHzF4d6voXOIkRcc63ClRrD8Rxnx0j1GuoKc3yVejTOKHumVl7CyvwIwP8@lists.infradead.org
X-Gm-Message-State: AOJu0YzLUTRlY+LchzscGtUfPycmOvfnczHr5oWswpfsEDseJ+ffJT9O
	kgj2OBIv5xCzohg4eugDR0gD+SbmyOIR4/39Zt1LXguWh1y0o9D+NG38ZURX7Y+1A9zgMhLQScq
	j1T3cz6PGUA==
X-Received: from dyjf14.prod.google.com ([2002:a05:7300:680e:b0:2d9:9fa3:5aa6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:cc14:b0:2c6:1557:9997
 with SMTP id 5a478bee46e88-2e478839eb6mr19777325eec.14.1777157430513; Sat, 25
 Apr 2026 15:50:30 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:01 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-10-irogers@google.com>
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
X-CRM114-CacheID: sfid-20260425_155032_103244_82792A76 
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


