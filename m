Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F74CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGJAat1lSE+xA4ccOXO/Rvvg+VzvniBWhEkJ/rAnlko=; b=zZos/Jz91l8hY0HN+uH6Prjgv8
	KXF0wbHnUb0PLdRgZAdf/iO9bTGdg5Hsumx422vau2gq4qscOy9GMll9GfJ1jfwifIVFxAo0svqZV
	s27U4TLulh2qqZmknM8uH89h+0MrXX+f0kDa4prR9JRcEcmFOAh9T1StTqMxqssRSilzZCXxMJ475
	BTFeZGeDhdXW9vjvxhS718T6HPGb1Dd8o4h5n//3VgsXvMOg4DSxde2dEyG48SGbSotdPraV3GK3/
	4pUF5SwVbftQ62S/6sbVj+pQa1y1eVun6t3vzT3FL4rR78okGIBisTDDVimg4c6gdqKDQZoKGUWzz
	oII4pRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfcM-000000042lX-1E60;
	Wed, 03 Sep 2025 05:01:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfZb-000000040zp-3cl6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 04:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C85340BEB;
	Wed,  3 Sep 2025 04:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C8CC4CEF0;
	Wed,  3 Sep 2025 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756875498;
	bh=6YJvO7PqsDrEvLx2JteHA5sSPVycN44jl8SxtQBZTHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RHRNFLhQh+CxZitPcxGq0MmzpR0gHMbqTumPkFZKSLS1jgT5b0kVXbXhWc/Pvdxsq
	 RsNZjGr70W6P93yRbsaOro7UK+llD/EXQ0e3fIWkdW/OUAV0zkpkUGIuXPtAC1XQSr
	 aZn3ox+K9cek1H/kDmIg6KLBhcslnlqdT/TxpqOcok4yzPr65Ji4pHjSkJB6CioEIZ
	 mTiHxFltJ3QvXv5hIi3YkbFtWGl9DH/Gm0EcblCyeNRf6pEEq7Ayj69TfR8wcV/+9Q
	 RrJKVnC8aON60DMRGR3DyEKleqf27d0g9yduDWZ0WbzKRr0N6dJH8gJqc3MJc3bco5
	 cj1PJVVYYGJlg==
Date: Wed, 3 Sep 2025 13:58:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 12/24] tracing: selftests: Add trace remote tests
Message-Id: <20250903135814.57c4ec19de536032c640b755@kernel.org>
In-Reply-To: <20250821081412.1008261-13-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-13-vdonnefort@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_215819_958063_B475D1AB 
X-CRM114-Status: GOOD (  20.68  )
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

On Thu, 21 Aug 2025 09:14:00 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> Exercise the tracefs interface for trace remote with a set of tests to
> check:
> 
>   * loading/unloading (unloading.tc)
>   * reset (reset.tc)
>   * size changes (buffer_size.tc)
>   * event integrity (trace_pipe)
> 
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc
> new file mode 100644
> index 000000000000..60bf431ccc91
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace remote buffer size

I think this test requires `remotes/`. If so, please add

# requires: remotes

Then this test will be skipped if it is not enabled.

> +
> +. $TEST_DIR/remotes/functions
> +
> +test_buffer_size()
> +{
> +    echo 0 > tracing_on
> +    assert_unloaded
> +
> +    echo 4096 > buffer_size_kb
> +    echo 1 > tracing_on
> +    assert_loaded
> +
> +    echo 0 > tracing_on
> +    echo 7 > buffer_size_kb
> +}
> +
> +if [ -z "$SOURCE_REMOTE_TEST" ]; then
> +    set -e
> +    setup_remote_test
> +    test_buffer_size
> +fi
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/functions b/tools/testing/selftests/ftrace/test.d/remotes/functions
> new file mode 100644
> index 000000000000..504a495b3b1b
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/functions
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +setup_remote()
> +{
> +	local name=$1
> +
> +	[ -e $TRACING_DIR/remotes/$name/write_event ] || exit_unresolved
> +
> +	cd remotes/$name/
> +	echo 0 > tracing_on
> +	clear_trace
> +	echo 7 > buffer_size_kb
> +	echo 0 > events/enable
> +	echo 1 > events/$name/selftest/enable
> +	echo 1 > tracing_on
> +}
> +
> +setup_remote_test()
> +{
> +	[ -d $TRACING_DIR/remotes/test/ ] || modprobe remote_test || exit_unresolved
> +
> +	setup_remote "test"
> +}
> +
> +assert_loaded()
> +{
> +	grep -q "(loaded)" buffer_size_kb
> +}
> +
> +assert_unloaded()
> +{
> +	grep -q "(unloaded)" buffer_size_kb
> +}
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/reset.tc
> new file mode 100644
> index 000000000000..93d6eb2a807f
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/reset.tc
> @@ -0,0 +1,105 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace remote reset

Ditto.

> +
> +. $TEST_DIR/remotes/functions
> +
> +get_cpu_ids()
> +{
> +    sed -n 's/^processor\s*:\s*\([0-9]\+\).*/\1/p' /proc/cpuinfo
> +}
> +
> +dump_trace()
> +{
> +    output=$(mktemp /tmp/remote_test.XXXXXX)

For the test-local temporary working directory, can you use $TMPDIR
instead of /tmp ? That directory is removed after running each test.

> +    cat trace_pipe > $output &
> +    pid=$!
> +    sleep 1
> +    kill -1 $pid
> +
> +    echo $output
> +}
> +
> +check_reset()
> +{
> +    write_event_path="write_event"
> +    taskset=""
> +
> +    clear_trace
> +
> +    # Is the buffer empty?
> +    output=$(dump_trace)
> +    test $(wc -l $output | cut -d ' ' -f1) -eq 0
> +
> +    if $(echo $(pwd) | grep -q "per_cpu/cpu"); then
> +        write_event_path="../../write_event"
> +        cpu_id=$(echo $(pwd) | sed -e 's/.*per_cpu\/cpu//')
> +        taskset="taskset -c $cpu_id"
> +    fi
> +    rm $output
> +
> +    # Can we properly write a new event?
> +    $taskset echo 7890 > $write_event_path
> +    output=$(dump_trace)
> +    test $(wc -l $output | cut -d ' ' -f1) -eq 1
> +    grep -q "id=7890" $output
> +    rm $output
> +}
> +
> +test_global_interface()
> +{
> +    output=$(mktemp /tmp/remote_test.XXXXXX)
> +
> +    # Confidence check
> +    echo 123456 > write_event
> +    output=$(dump_trace)
> +    grep -q "id=123456" $output
> +    rm $output
> +
> +    # Reset single event
> +    echo 1 > write_event
> +    check_reset
> +
> +    # Reset lost events
> +    for i in $(seq 1 10000); do
> +        echo 1 > write_event
> +    done
> +    check_reset
> +}
> +
> +test_percpu_interface()
> +{
> +    [ "$(get_cpu_ids | wc -l)" -ge 2 ] || return 0
> +
> +    for cpu in $(get_cpu_ids); do
> +        taskset -c $cpu echo 1 > write_event
> +    done
> +
> +    check_non_empty=0
> +    for cpu in $(get_cpu_ids); do
> +        cd per_cpu/cpu$cpu/
> +
> +        if [ $check_non_empty -eq 0 ]; then
> +            check_reset
> +            check_non_empty=1
> +        else
> +            # Check we have only reset 1 CPU
> +            output=$(dump_trace)
> +            test $(wc -l $output | cut -d ' ' -f1) -eq 1
> +            rm $output
> +        fi
> +        cd -
> +    done
> +}
> +
> +test_reset()
> +{
> +    test_global_interface
> +    test_percpu_interface
> +}
> +
> +if [ -z "$SOURCE_REMOTE_TEST" ]; then
> +    set -e
> +    setup_remote_test
> +    test_reset
> +fi
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
> new file mode 100644
> index 000000000000..f4bd2b3655e0
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
> @@ -0,0 +1,57 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace remote trace_pipe

Ditto.

> +
> +. $TEST_DIR/remotes/functions
> +
> +test_trace_pipe()
> +{
> +    echo 0 > tracing_on
> +    assert_unloaded
> +
> +    echo 1024 > buffer_size_kb
> +    echo 1 > tracing_on
> +    assert_loaded
> +
> +    output=$(mktemp /tmp/remote_test.XXXXXX)
> +
> +    cat trace_pipe > $output &
> +    pid=$!
> +
> +    for i in $(seq 1 1000); do
> +        echo $i > write_event
> +    done
> +
> +    echo 0 > tracing_on
> +    sleep 1
> +    kill $pid
> +
> +    prev_ts=0 # TODO: Init with proper clock value
> +    prev_id=0
> +
> +    # Only keep <timestamp> <id>
> +    sed -i -e 's/\[[0-9]*\]\s*\([0-9]*.[0-9]*\): [a-z]* id=\([0-9]*\)/\1 \2/' $output
> +
> +    IFS=$'\n'

This fails checkbashisms test. Can you use printf for this?

IFS=$(printf "\n")


> +    for line in $(cat $output); do
> +        ts=$(echo $line | cut -d ' ' -f 1)
> +        id=$(echo $line | cut -d ' ' -f 2)
> +
> +        test $(echo "$ts>$prev_ts" | bc) -eq 1
> +        test $id -eq $((prev_id + 1))
> +
> +        prev_ts=$ts
> +        prev_id=$id
> +    done
> +
> +    test $prev_id -eq 1000
> +
> +    rm $output
> +}
> +
> +if [ -z "$SOURCE_REMOTE_TEST" ]; then
> +    set -e
> +
> +    setup_remote_test
> +    test_trace_pipe
> +fi
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc
> new file mode 100644
> index 000000000000..99f97e100fde
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/unloading.tc
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace remote unloading

Here, please add "requires: remotes" line.

Thank you,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

