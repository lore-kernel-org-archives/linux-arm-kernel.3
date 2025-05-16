Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EBC5475C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joY3WU6FvsElAU9xhbYWKbDJgBT+rIdP+8QwV95CGWo=; b=oR3M0yHMH5s4nAprnb0T8x9Cu7
	zMXDdH1IkBAInHaboxk4yeBxA3Mj2znRBNOaYqKfcDGyPjeoyj+uQFX+RvkCD5BLMnjuNNx+5uszp
	FmV/PLyAKsIrkmIjhl6ZvPK56TyLmxtSx8p56DP8QGNqoZs/+drSs/fjdoSwhmklc2/ljzMpZMOvD
	1XtUEt6VnvyLs5P2m6Zpxc1Og87fJdP6ErzdMy2p/DxHRkeNnk2LxD4U0SWrx0s5lqhQYuMh1d4Wb
	OzarCbOA6NOJrNwaNIlGb/7ly8I18ivRM5odcQY6zmVK3YR52uxZbmJjXLoHvmbg+8s/qJDRbvIn4
	ZMRDaIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvis-00000003c7s-2FJQ;
	Fri, 16 May 2025 14:07:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJ4-00000003XsS-0TUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so11977105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402856; x=1748007656; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=joY3WU6FvsElAU9xhbYWKbDJgBT+rIdP+8QwV95CGWo=;
        b=Hi6vYrCHgXiL6QpXIsfNlxDh/EH+7L99N710a9QeBcmt7Bv5vZZg6Phq0u9lq+3wZL
         vcd9w6eDRYLZqEukPhfheQeIU+OJVDIqwekAju+EPCRg3byoPvSFj2naUK6VfEzbIPCP
         EwEWI60xmBTzVacUtok4i197O/SxVOxRDtoySR/XWhJEs/y5c/GxdIELaLSgMNyOIpUP
         q8tN6agbAh2ribNlUMqcVpytU2PmeUBenvNgEEEgXdCaCkr8a+lpFnuzb7K2IC38XzIi
         qLz0VjNJ6H+J6npK6jghDWLwwvJrCjkrDR188+OvE6t2f6fwMawgb1//rKcYUL5/wGlS
         KPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402856; x=1748007656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joY3WU6FvsElAU9xhbYWKbDJgBT+rIdP+8QwV95CGWo=;
        b=YGwgKC5nOw7DNP+OT7wRC5YuIIn7xob2hmzRXL2baj4jt6FgnrkV9fVT4LHJ+qgrq/
         y/ksFausI0vww+YqRV0U2g15oTKWR6+IUwlFxUe31I6A+oNv4R0qjW7aAhpQBybsp/fy
         XeRaBLHRVFI2Uvg/6Zg2pPY7IX1Q5q8SMsgtue6kDMMkuq476717UiA3ieSlYmhJzY2x
         LSW/gWa3tTHf93SjD2KaZVQi0eG8GJBHu08+pH9+rFc/Fqja4zUHygtZR+FrzFI4ikhU
         VN9r57hFzf6LJB8BTtkbB/RMs/L2WkRYdo6Ka1Z+nBwuV5Rt6cDdH3pP1kyqwMwcv6Ao
         4hpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGM8Fr/nFzpARG3JfEyDew23/iQ0IvhfqAj+C2i/F7ydW56h4Vni0dV54OvUor7qqXIMDUTmN7CnlaFipHe8TO@lists.infradead.org
X-Gm-Message-State: AOJu0YxTNYZID1S9EVGlzt0rTzrJ4NiYFn6yPATevQABinS1EhoEBlH1
	K3yPy0xxPCl1KUmCSAlxKej7t5V2KhxJ/Fq1dLEJKMzRIzCxxmtWLfjM3OOQ8onlwfi/I5Bto8V
	GzFzAfuYEpCiGaKfJuyjCdA==
X-Google-Smtp-Source: AGHT+IEP0L6waN1pYx413ZB1qsW+CdqJA3LvdQcIjwsBUP+soy2O83sqCMXyJfok6tygJ4jxVmXyO6ZQM4hHCpL7
X-Received: from wmrm14.prod.google.com ([2002:a05:600c:37ce:b0:43c:f7c3:c16e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:528b:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-442fefee1b8mr27105865e9.9.1747402856521;
 Fri, 16 May 2025 06:40:56 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:18 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-13-vdonnefort@google.com>
Subject: [PATCH v5 12/25] tracing: selftests: Add trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064058_153943_79571DCA 
X-CRM114-Status: GOOD (  12.08  )
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

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
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
index 000000000000..99f97e100fde
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc
@@ -0,0 +1,40 @@
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
+
+    # Test reset
+    clear_trace
+    assert_unloaded
+}
+
+if [ -z "$SOURCE_REMOTE_TEST" ]; then
+    set -e
+
+    setup_remote_test
+    test_unloading
+fi
-- 
2.49.0.1101.gccaa498523-goog


