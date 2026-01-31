Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA40E7C6E6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUC+WDnW7L44j8AWJ3iUoM1jUSgb/IrmAbWsvMnp/cQ=; b=tvYKOLAl63P8Bp2Uq2NtPjxM/0
	68dAyOEJM5Lh+CNkDW7CS+YXhORF0kR1IXEUmgChT8tFVygA0cJM7n1mYrRDB8yGCq1jXgJLsoPUr
	dNvNmn/NHO4d5khEhLn/kXsBP6CxhhXWgreYq9LsIAJH8xqoQm1br3wnESNw9uUbrSeQPvK78Gs0g
	J/8NI1hsMc96rQYHpKtMJRtYQaIUJYnbG/AagjtkKzbQjkwl3++2ygDhd+6+e28TIn6GTLEOM2C+K
	i3F2PY8MH1xPDw6yH01FnI+hE5rk3vnRbo1AtCyoSdu060Dp+g2DZYlcECM7Aa3K8hHhS2+qjpzj1
	+shOI3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAz-00000002wUK-0Kak;
	Sat, 31 Jan 2026 20:02:37 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAt-00000002wRG-1Mta
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:32 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b708fa4093so831346eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889750; x=1770494550; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUC+WDnW7L44j8AWJ3iUoM1jUSgb/IrmAbWsvMnp/cQ=;
        b=JG5KRJXoGsWOWrRDo7QEHPk8HzwPVGFhkB+VpvA/OC30w5k+GFamXHdOHOf99W6Iuy
         /HdjvnMmW+zWhYCiEi+QSQq5JkDgpdU0vQPpJZlnQLkKErfs5h38n4W9HB02ORC0suPM
         BkCNxgs0OI/3KTkAkm00P6s6yY3MgWkW0cNsxEiJBabbSi524Fd1pyWNLzXzH1prWINN
         4+Hv8zZ8exGQ7Du5rKoxsNGrNgfJGLfpYq/n4LyCKl+gXGkqizFpW2TOzj66M9tBaD21
         mI24vkO7vJ+Ek8aTdtwR5BAeyiU46e/B5WXxn5XGYZQoDFDfnVTm/MuQ5VU4CUiIrcXx
         6MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889750; x=1770494550;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUC+WDnW7L44j8AWJ3iUoM1jUSgb/IrmAbWsvMnp/cQ=;
        b=vzqEUZZLPAQ7oUHFgy3dUfxpkn6b+j4FvnmRBK/evsCzI1JlgA306vUIV7/Bzd8TT7
         SsDuG8rla0yzAPaPlG0lwqXWgdxd4xh9Oo+YglnvYFDt0StkVEjCPAfrf5MfEk3xT2QI
         ubOncVDP/ddNGEBQgq60ZHi1m/9Lh258Tpl3EtM2qPYRWiiIIW0nDEW58sSCaOXj1sXt
         BG+k0ke77lvH/p31jJ2ZgygvaW8cfK7xXI4PNz0taaebIrku+W27n/K7LIm7TqYUqVE9
         OJJsfj7MQAIaDVM3iLgdexu7yXHhXAKbMmFJfIyffEp1G5vZPWHh3hHQ4+jPSJY6S0Pr
         4BOg==
X-Forwarded-Encrypted: i=1; AJvYcCUuNMIHZnQvOr4YT7WekGv+P+vMx9jZDHhdX/Bu8HuNUGtczhLWXuDlMOrBwls7HISlKa0vJMnlnWYP6q7xfGhW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd9hIN202UXCLOdcuavNBU7htd1SHuzGR+wdvmuySotCiLCs/A
	bEgu7MBN2Zxs9eb6EMC5YAzltFni0F6oyHBhDlHA+K+oDyIPZAVtrjuWxCMFjFzYpz9UpbIbAhZ
	1l4EhX8Rn0A==
X-Received: from dybpg11.prod.google.com ([2002:a05:7301:414b:b0:2b7:499d:745f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6095:b0:2b7:2d5e:3f49
 with SMTP id 5a478bee46e88-2b7c865542bmr2862726eec.10.1769889749601; Sat, 31
 Jan 2026 12:02:29 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:19 -0800
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
Mime-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-2-irogers@google.com>
Subject: [PATCH v2 1/6] perf test kvm: Add stat live testing
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120231_361158_CF213711 
X-CRM114-Status: GOOD (  12.57  )
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

Ensure the `perf kvm stat live -p ..` has some basic functionality.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/kvm.sh | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/kvm.sh b/tools/perf/tests/shell/kvm.sh
index 2a399b83fe80..f88e859025c4 100755
--- a/tools/perf/tests/shell/kvm.sh
+++ b/tools/perf/tests/shell/kvm.sh
@@ -7,9 +7,10 @@ set -e
 err=0
 perfdata=$(mktemp /tmp/__perf_kvm_test.perf.data.XXXXX)
 qemu_pid_file=$(mktemp /tmp/__perf_kvm_test.qemu.pid.XXXXX)
+log_file=$(mktemp /tmp/__perf_kvm_test.live_log.XXXXX)
 
 cleanup() {
-	rm -f "${perfdata}"
+	rm -f "${perfdata}" "${log_file}"
 	if [ -f "${qemu_pid_file}" ]; then
 		if [ -s "${qemu_pid_file}" ]; then
 			qemu_pid=$(cat "${qemu_pid_file}")
@@ -96,6 +97,32 @@ test_kvm_buildid_list() {
 	echo "perf kvm buildid-list test [Success]"
 }
 
+test_kvm_stat_live() {
+	echo "Testing perf kvm stat live"
+
+        # Run perf kvm live for 5 seconds, monitoring that PID
+	# Use sleep to keep stdin open but silent, preventing EOF loop or interactive spam
+	if ! sleep 10 | timeout 5s perf kvm stat live -p "${qemu_pid}" > "${log_file}" 2>&1; then
+		retval=$?
+		if [ $retval -ne 124 ] && [ $retval -ne 0 ]; then
+			echo "perf kvm stat live [Failed: perf kvm stat live failed to start or run (ret=$retval)]"
+			head -n 50 "${log_file}"
+			err=1
+			return
+		fi
+	fi
+
+	# Check for some sample data (percentage)
+	if ! grep -E -q "[0-9]+\.[0-9]+%" "${log_file}"; then
+		echo "perf kvm stat live [Failed: no sample percentage found]"
+		head -n 50 "${log_file}"
+		err=1
+		return
+	fi
+
+	echo "perf kvm stat live test [Success]"
+}
+
 setup_qemu() {
 	# Find qemu
 	if [ "$(uname -m)" = "x86_64" ]; then
@@ -148,6 +175,7 @@ if [ $err -eq 0 ]; then
 	test_kvm_stat
 	test_kvm_record_report
 	test_kvm_buildid_list
+	test_kvm_stat_live
 fi
 
 cleanup
-- 
2.53.0.rc1.225.gd81095ad13-goog


