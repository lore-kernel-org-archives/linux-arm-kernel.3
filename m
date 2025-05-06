Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A69C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StZLsBHNOuNl+tKb9Vl4bYLuw1HG3lhuSVUqOiGX97k=; b=BIiNpKZJb26KwB6g+qPFWD7lGv
	ZmOt8UNKXMr0WB1TFhKNmmdWE5rBs2aklvFyR6EJ65qYjAXoQ4HSQp9s8p19pzbx5eR2Bze+Qeo02
	d++8DdgUdS9yDzr8ZKfti+Gi72+hzpMzQc2sN7tUpXmxilFymXXV63y0deNMaIqq4VtclIFwSiYsy
	8smz5Wrn3BjrQ7+MhWhRs8X67KeMdrjwbX9BYrg8/6D2iXwPfepaFBq6dqjlZDPjUBvnb39Y4vkM3
	DEKI6NG/YrXVCFdp0555Rde4kCDWm/ppPwc8nl7q2aH6fC3IoKDBsWkrwzyxUAQbVUG00zjUgRAzW
	pLkYhYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhh-0000000DYAZ-0jo2;
	Tue, 06 May 2025 22:23:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTY-0000000CjvV-3PjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:49:01 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so33569425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550139; x=1747154939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=StZLsBHNOuNl+tKb9Vl4bYLuw1HG3lhuSVUqOiGX97k=;
        b=NJJ5y5POLfZhOGuVyVKyOviaR8TNnbwc76iwzwaM/2c6U0VbrKZUfIS9A7gY0FTbXj
         O4l3w2RJJlFhS/Ecsb+D4Arv6acFOXfQ2kvdeMZOFDePZVp3gP8xzgdDoe+hhFdXUeLs
         YIl3/BOg1zbPmkb4tyf+IWk98FdCs/x1C9bTOpGHNyHg02YlHbJZlWokdjin9cNwj5rQ
         Q1eZ7x4I88N3Znl2AgoM6DyaLT2mXVHohv6Pq97nYCzmafeXjHNlvoi3a4uLkLoGhnZe
         rDU1QhF6bGtbC3F76600uTOoSkW3reg+WRHqh7z5Nb8EvKLOtgfi5nl0hp9a+/nIXVEx
         cYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550139; x=1747154939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StZLsBHNOuNl+tKb9Vl4bYLuw1HG3lhuSVUqOiGX97k=;
        b=JPDMlsZjviL0NCett/Qx54Y4uxmXGSzLuMimdhdfIZNFHiUhBr/2qTmgHtGCr9yG4a
         FtCS2n3OoyNlT2/aOHQDg62YWRkhOO+/AaWrfMRqhTwlsLGz8CDl/GPuwzqVIJBDFpwK
         sq1IrYxTjR07XzUauj6tjatgWzEM+wytLPLuTkGOzfaP6K7Y0/gnDftqryYf0B6q+fPS
         6HdE4HP/m0iHMgkw2MjCWrCGZdQ4s3ZwxbMz8k1jn7isFBJt09y5OpyiOHMUwC9jJb1o
         EQzVW5PGQ+DRfVOyQEsSzCldeGmhxyBG65nMRS8EQApQeH8aBbs218Eid6EoNyw7wYBg
         JkiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJMPueCkphS9WspejGn0jaLPvdNOl0/zUHOzMd0k6WlWAfBvHYNBV+fI+srgMM5p+FSgqHlX3ao0vzU7Ivhbuq@lists.infradead.org
X-Gm-Message-State: AOJu0YwsGAwLFVmkzxdLZ1S+sLEwUUJ/U/LfoGfC3qpyJ4pKvxTp+b17
	rUsenPNRVjNev0qiW+F3wYsVxBrWT1MvK3M7f6DYOd3jmk3Yrklx0c35ad3GNdKIB61H5Ny1mjW
	YYcxQ6m6LMlixCbAJ5Q==
X-Google-Smtp-Source: AGHT+IE4iNBpupyaQ3P75QFzmU9O/zuYSK3OEQZ8J4G0/UVK153ETEX0RF18FXE6x2Rnf6IDgYTafM4dkGCo96Dx
X-Received: from wmhu9.prod.google.com ([2002:a05:600c:a369:b0:43d:1873:dbaf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1914:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-441c48bca55mr85552645e9.11.1746550139272;
 Tue, 06 May 2025 09:48:59 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:07 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-12-vdonnefort@google.com>
Subject: [PATCH v4 11/24] tracing: selftests: Add trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094900_855165_D71E9BF6 
X-CRM114-Status: GOOD (  12.39  )
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

Exercise the tracefs interface for trace remote with a set of tests to
check:

  * loading/unloading (unloading.tc)
  * reset (reset.tc)
  * size changes (buffer_size.tc)
  * event integrity (trace_pipe)

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc
new file mode 100644
index 000000000000..60bf431ccc91
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc
@@ -0,0 +1,24 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote buffer size
+
+. $TEST_DIR/remotes/functions
+
+test_buffer_size()
+{
+    echo 0 > tracing_on
+    assert_unloaded
+
+    echo 4096 > buffer_size_kb
+    echo 1 > tracing_on
+    assert_loaded
+
+    echo 0 > tracing_on
+    echo 7 > buffer_size_kb
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+    setup_remote_test
+    test_buffer_size
+fi
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/functions b/tools/testing/selftests/ftrace/test.d/remotes/functions
new file mode 100644
index 000000000000..504a495b3b1b
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/functions
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+
+setup_remote()
+{
+	local name=$1
+
+	[ -e $TRACING_DIR/remotes/$name/write_event ] || exit_unresolved
+
+	cd remotes/$name/
+	echo 0 > tracing_on
+	clear_trace
+	echo 7 > buffer_size_kb
+	echo 0 > events/enable
+	echo 1 > events/$name/selftest/enable
+	echo 1 > tracing_on
+}
+
+setup_remote_test()
+{
+	[ -d $TRACING_DIR/remotes/test/ ] || modprobe remote_test || exit_unresolved
+
+	setup_remote "test"
+}
+
+assert_loaded()
+{
+	grep -q "(loaded)" buffer_size_kb
+}
+
+assert_unloaded()
+{
+	grep -q "(unloaded)" buffer_size_kb
+}
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/reset.tc
new file mode 100644
index 000000000000..93d6eb2a807f
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/reset.tc
@@ -0,0 +1,105 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote reset
+
+. $TEST_DIR/remotes/functions
+
+get_cpu_ids()
+{
+    sed -n 's/^processor\s*:\s*\([0-9]\+\).*/\1/p' /proc/cpuinfo
+}
+
+dump_trace()
+{
+    output=$(mktemp /tmp/remote_test.XXXXXX)
+    cat trace_pipe > $output &
+    pid=$!
+    sleep 1
+    kill -1 $pid
+
+    echo $output
+}
+
+check_reset()
+{
+    write_event_path="write_event"
+    taskset=""
+
+    clear_trace
+
+    # Is the buffer empty?
+    output=$(dump_trace)
+    test $(wc -l $output | cut -d ' ' -f1) -eq 0
+
+    if $(echo $(pwd) | grep -q "per_cpu/cpu"); then
+        write_event_path="../../write_event"
+        cpu_id=$(echo $(pwd) | sed -e 's/.*per_cpu\/cpu//')
+        taskset="taskset -c $cpu_id"
+    fi
+    rm $output
+
+    # Can we properly write a new event?
+    $taskset echo 7890 > $write_event_path
+    output=$(dump_trace)
+    test $(wc -l $output | cut -d ' ' -f1) -eq 1
+    grep -q "id=7890" $output
+    rm $output
+}
+
+test_global_interface()
+{
+    output=$(mktemp /tmp/remote_test.XXXXXX)
+
+    # Confidence check
+    echo 123456 > write_event
+    output=$(dump_trace)
+    grep -q "id=123456" $output
+    rm $output
+
+    # Reset single event
+    echo 1 > write_event
+    check_reset
+
+    # Reset lost events
+    for i in $(seq 1 10000); do
+        echo 1 > write_event
+    done
+    check_reset
+}
+
+test_percpu_interface()
+{
+    [ "$(get_cpu_ids | wc -l)" -ge 2 ] || return 0
+
+    for cpu in $(get_cpu_ids); do
+        taskset -c $cpu echo 1 > write_event
+    done
+
+    check_non_empty=0
+    for cpu in $(get_cpu_ids); do
+        cd per_cpu/cpu$cpu/
+
+        if [ $check_non_empty -eq 0 ]; then
+            check_reset
+            check_non_empty=1
+        else
+            # Check we have only reset 1 CPU
+            output=$(dump_trace)
+            test $(wc -l $output | cut -d ' ' -f1) -eq 1
+            rm $output
+        fi
+        cd -
+    done
+}
+
+test_reset()
+{
+    test_global_interface
+    test_percpu_interface
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+    setup_remote_test
+    test_reset
+fi
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
new file mode 100644
index 000000000000..f4bd2b3655e0
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
@@ -0,0 +1,57 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote trace_pipe
+
+. $TEST_DIR/remotes/functions
+
+test_trace_pipe()
+{
+    echo 0 > tracing_on
+    assert_unloaded
+
+    echo 1024 > buffer_size_kb
+    echo 1 > tracing_on
+    assert_loaded
+
+    output=$(mktemp /tmp/remote_test.XXXXXX)
+
+    cat trace_pipe > $output &
+    pid=$!
+
+    for i in $(seq 1 1000); do
+        echo $i > write_event
+    done
+
+    echo 0 > tracing_on
+    sleep 1
+    kill $pid
+
+    prev_ts=0 # TODO: Init with proper clock value
+    prev_id=0
+
+    # Only keep <timestamp> <id>
+    sed -i -e 's/\[[0-9]*\]\s*\([0-9]*.[0-9]*\): [a-z]* id=\([0-9]*\)/\1 \2/' $output
+
+    IFS=$'\n'
+    for line in $(cat $output); do
+        ts=$(echo $line | cut -d ' ' -f 1)
+        id=$(echo $line | cut -d ' ' -f 2)
+
+        test $(echo "$ts>$prev_ts" | bc) -eq 1
+        test $id -eq $((prev_id + 1))
+
+        prev_ts=$ts
+        prev_id=$id
+    done
+
+    test $prev_id -eq 1000
+
+    rm $output
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+
+    setup_remote_test
+    test_trace_pipe
+fi
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc
new file mode 100644
index 000000000000..05bb21f80e34
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc
@@ -0,0 +1,36 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace remote unloading
+
+. $TEST_DIR/remotes/functions
+
+test_unloading()
+{
+    # No reader, writing
+    assert_loaded
+
+    # No reader, no writing
+    echo 0 > tracing_on
+    assert_unloaded
+
+    # 1 reader, no writing
+    cat trace_pipe &
+    pid=$!
+    sleep 1
+    assert_loaded
+    kill $pid
+    assert_unloaded
+
+    # No reader, no writing, events
+    echo 1 > tracing_on
+    echo 1 > write_event
+    echo 0 > tracing_on
+    assert_loaded
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+
+    setup_remote_test
+    test_unloading
+fi
-- 
2.49.0.967.g6a0df3ecc3-goog


