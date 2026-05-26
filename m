Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28684CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/gStB7riG3y0hEx2ktfiQB2K0otiavQ178eEzNn/V0=; b=bFmyFMvH14PLb8+Cx7SEWHjuJr
	4OMH+9lQJFLe0Tb+sCxiEattGTRBxcD6RGRWeEB1XpxIUUCAvgOJI8D2XHrtpMkhdQAhiOjJT66d/
	95HNjF2qn3s8RvV/Wx5PLDw/9vEukBM+oylNaf5uJrWuQpq0X9FeMzs+Ekzi+X3uvV/uAN47bMXgr
	ENSbQOxuwm0kPKyuH7zB2KuCDaLt5rf6eLg/4uGZs7KR0+26J5aGDuwSu2CFaGX7lOnU9lF1MU5IJ
	8jlYV76qHgsnjhA6UY0iyGzU52bzhskkgXEKcUclVjAPt9KcJ1BMetNeVUv3zcr3SDpyOYrOKtnld
	cFdZxe4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpkb-00000001jlP-22cu;
	Tue, 26 May 2026 11:15:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpkU-00000001jj4-3s3W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:15:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so6493904f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779794101; x=1780398901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/gStB7riG3y0hEx2ktfiQB2K0otiavQ178eEzNn/V0=;
        b=Qxoj6yfg2sTXuWR6IV1wNZrBczDof8bZFJoRsAnI9EEI5hBhy+ZuDTGjyZZfEE3MSz
         0RyYKk3HD6bL44Ff619hg5xD+FxvZw6Dnll3jVzafeJmS4Rq9u+tyOGx8OmiXOVEQ1b8
         RghE0w+C4TM0JTV5r7rThWXkDEQSzVfRLpvw9sRfjYSmvdx2OXE16o/a+CO/ulooUUeZ
         2MLPddhezHN4XtaKUdxs8llVnRDaB1gHel623DQvpJkR5+p4Hq0gZmgJkGQifZcr/Puy
         u1ViU3Tq0CXprSM6QR2oPnC4+2TgIlrhLt9/KTfytYt6Tg/PvMofv0GfNi4ITjlh3ORM
         vX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794101; x=1780398901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/gStB7riG3y0hEx2ktfiQB2K0otiavQ178eEzNn/V0=;
        b=RJuIHH4ZyWBG7hSaout+3n50fY+v6gXFzBp2cLOeak6OXNjmQD4FXxqCllP4PEVX7t
         bojxgouDPgVm5oBPDosnt3lWxpEod7mzCovfb5gA8zRDLMq8L7PQDwwqFhnxuP6Ui7KQ
         fdKYDfm32mBBDPAswazeFey4J1RmAyAvYomV576qkLt0syGK7avbF9WTIZ0N4D+GvMdr
         yHGTH77X/d4YpGKdFVy9FYBNgmcX6d//OhvEOT+J0CQ6JhQ3xJhwhjd9LH+uc3ky9b+o
         tCOT2UJiKcp1XrgKbyDG8yGX+6jejw0rsqwoxPH/WLsy6TwvBVwM7bGDwx5xezantBAv
         2dgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZXTJXTkq4kk/Zo0Q7bKnNhr9esZpLEuJFDWODHpa4c6phRnl4Ur0UO46u2dZa5EAa5eEr68u03j+heaLMl3pd@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/RWHbVK8xgm71TAsNo3RkoaWM663WvRMt5IiJJ/qNNyf4IM3
	5flASsfDZJ94dlsUI+6lSD0v/9KB28YQQyRvCXCyOVdX7ZtD3ZP6ovlNbc7Kc3ilz1U=
X-Gm-Gg: Acq92OEMW/GScMC8vyNbjKLufQy3KzdBid2wHxsXRQeNAZR/rkneIf9qGc8cfiUuIAs
	nXmqDXx76KdQfJPYs/9tcnvQB2BrLY28WLvXBEQSVAWIWv0fVGcyHIXYcP+6LzAJ+Yiy9fIiwnj
	V6EJVQUAmDL5TxSJS5UonnCgNH3EXR4NSAUoKBqSp29GlwBbNmAoIXip+NOxOyQdQmURPjZTmlU
	rb86zw0uBLRVrRiYMvIAu5wmg2EQVMFtjYJwDtXhPvjH/VyVxjoSYY1XboGqf9arRufhqQtrTkd
	yIvqHZapYK5GQx+cYQtis5LouVaerAGoWlssn6XNOfPHhQPNw/Cj8vcbCzcTLtGkFxQ8QFPggKH
	uSdoPhzAfv85hvgaruvpIB+VQD2av2drG74N7hcKWiEDebuEZBLhNjjYQnaZJOyFBnY8BQPIWo1
	tvDSbDAG0N+q9SXaclf6NJB+b92f34NGDU
X-Received: by 2002:a05:6000:4707:b0:455:7e5d:9142 with SMTP id ffacd0b85a97d-45eb38bb01fmr30064916f8f.32.1779794101143;
        Tue, 26 May 2026 04:15:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm35375627f8f.6.2026.05.26.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:15:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 26 May 2026 12:14:37 +0100
Subject: [PATCH 2/2] perf test cs-etm: Test thread attribution
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-james-cs-context-tracking-fix-v1-2-ebd602e18287@linaro.org>
References: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
In-Reply-To: <20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Amir Ayupov <aaupov@meta.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041503_015405_94ADE7BF 
X-CRM114-Status: GOOD (  21.70  )
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

Add a workload that creates two threads that read and write to a pipe so
that every read/write results in the other thread being scheduled. If
this is run on one CPU then the threads will alternate and we can test
that processor trace always attributes symbols to the correct thread and
that the attribution changes at the exact point that the thread switch
happened.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/Makefile          |  1 +
 .../shell/coresight/context_switch_loop/.gitignore |  1 +
 .../shell/coresight/context_switch_loop/Makefile   | 29 ++++++++
 .../context_switch_loop/context_switch_loop.c      | 83 ++++++++++++++++++++++
 .../tests/shell/coresight/context_switch_thread.sh | 48 +++++++++++++
 5 files changed, 162 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/Makefile b/tools/perf/tests/shell/coresight/Makefile
index fa08fd9a5991..710e742d9def 100644
--- a/tools/perf/tests/shell/coresight/Makefile
+++ b/tools/perf/tests/shell/coresight/Makefile
@@ -6,6 +6,7 @@ include ../../../../../tools/scripts/utilities.mak
 
 SUBDIRS = \
 	asm_pure_loop \
+	context_switch_loop \
 	memcpy_thread \
 	thread_loop \
 	unroll_loop_thread
diff --git a/tools/perf/tests/shell/coresight/context_switch_loop/.gitignore b/tools/perf/tests/shell/coresight/context_switch_loop/.gitignore
new file mode 100644
index 000000000000..86a7becebba4
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_loop/.gitignore
@@ -0,0 +1 @@
+context_switch_loop
diff --git a/tools/perf/tests/shell/coresight/context_switch_loop/Makefile b/tools/perf/tests/shell/coresight/context_switch_loop/Makefile
new file mode 100644
index 000000000000..722afc993cb0
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_loop/Makefile
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+
+include ../Makefile.miniconfig
+
+BIN=context_switch_loop
+LIB=
+
+all: $(BIN)
+
+$(BIN): $(BIN).c
+ifdef CORESIGHT
+ifeq ($(ARCH),arm64)
+	$(Q)$(CC) $(CFLAGS) $(BIN).c -O0 -o $(BIN) $(LIB)
+endif
+endif
+
+install-tests: all
+ifdef CORESIGHT
+ifeq ($(ARCH),arm64)
+	$(call QUIET_INSTALL, tests) \
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/$(INSTDIR_SUB)/$(BIN)'; \
+		$(INSTALL) $(BIN) '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/$(INSTDIR_SUB)/$(BIN)/$(BIN)'
+endif
+endif
+
+clean:
+	$(Q)$(RM) -f $(BIN)
+
+.PHONY: all clean install-tests
diff --git a/tools/perf/tests/shell/coresight/context_switch_loop/context_switch_loop.c b/tools/perf/tests/shell/coresight/context_switch_loop/context_switch_loop.c
new file mode 100644
index 000000000000..6b7cd11952a2
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_loop/context_switch_loop.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/compiler.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+static int loops = 100;
+static char buf;
+int work = 1234;
+
+#define write_block(fd) \
+	do { \
+		if (write(fd, &buf, 1) <= 0) \
+			exit(1); \
+	} while (0)
+
+#define read_block(fd) \
+	do { \
+		if (read(fd, &buf, 1) <= 0) \
+			exit(1); \
+	} while (0)
+
+static noinline void thread1(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		read_block(in_fd);
+		work += i * 3;
+		write_block(out_fd);
+	}
+}
+
+static noinline void thread2(int in_fd, int out_fd)
+{
+	for (int i = 0; i < loops; i++) {
+		write_block(out_fd);
+		work += i * 7;
+		read_block(in_fd);
+	}
+}
+
+int main(int argc, char **argv)
+{
+	int a_to_b[2], b_to_a[2];
+	pid_t thread1_pid;
+	int status;
+
+	if (argc > 1) {
+		loops = atoi(argv[1]);
+		if (loops < 0) {
+			fprintf(stderr, "Invalid number of loops: %s\n", argv[1]);
+			return 1;
+		}
+	}
+
+	if (pipe(a_to_b) || pipe(b_to_a)) {
+		perror("Pipe error");
+		return 1;
+	}
+
+	thread1_pid = fork();
+	if (thread1_pid < 0) {
+		perror("Fork error");
+		return 1;
+	}
+
+	if (!thread1_pid) {
+		prctl(PR_SET_NAME, "thread1", 0, 0, 0);
+		thread1(b_to_a[0], a_to_b[1]);
+		exit(0);
+	}
+
+	prctl(PR_SET_NAME, "thread2", 0, 0, 0);
+	thread2(a_to_b[0], b_to_a[1]);
+
+	if (waitpid(thread1_pid, &status, 0) != thread1_pid || !WIFEXITED(status) ||
+	    WEXITSTATUS(status))
+		return 1;
+
+	return 0;
+}
diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
new file mode 100755
index 000000000000..10b4118dff9b
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -0,0 +1,48 @@
+#!/bin/bash -e
+# CoreSight / Context switch thread attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+TEST="context_switch_loop"
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for "-C 0" in record command
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+# shellcheck source=../lib/coresight.sh
+. "$(dirname $0)"/../lib/coresight.sh
+
+DATA="$DATD/perf-$TEST.data"
+SCRIPT="$DATD/perf-$TEST.script"
+
+check_samples() {
+	owner_samples=$(grep -c "thread1.*thread1" "$SCRIPT" || true)
+	next_samples=$(grep -c "thread2.*thread2" "$SCRIPT" || true)
+
+	if [ "$owner_samples" -eq 0 ] || [ "$next_samples" -eq 0 ]; then
+		err "No samples found"
+	fi
+
+	if grep "thread2.*thread1" "$SCRIPT"; then
+		err "Thread1 symbol was attributed to thread2"
+	fi
+
+	if grep "thread1.*thread2" "$SCRIPT"; then
+		err "Thread2 symbol was attributed to thread1"
+	fi
+}
+
+# Pin to one CPU so the two threads alternate running but record into the
+# same trace buffer.
+perf record -o "$DATA" -e cs_etm/timestamp=0/u -C 0 \
+	-- taskset --cpu-list 0 "$BIN" 20 > /dev/null 2>&1
+
+# Test both instruction and branch sample generation modes.
+perf script -i "$DATA" --itrace=i4 -F comm,pid,tid,ip,sym > "$SCRIPT" 2>/dev/null
+check_samples
+perf script -i "$DATA" --itrace=b -F comm,pid,tid,ip,sym > "$SCRIPT" 2>/dev/null
+check_samples
+
+exit 0

-- 
2.34.1


