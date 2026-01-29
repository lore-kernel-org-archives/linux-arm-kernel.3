Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FA4D6B09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvFyap7RNZHMXYc5niknRKnnJH48u6rIWKvtjJsGutM=; b=1j47Hg5/mprp37bPBTnoIpvSTi
	cqcrYChkHo/vqR3dW6QxDOftejN27/NpJGf4Z/aY/VvJvNPL8bEO3DTk8oSWXPaqJRjvApGLxwXtV
	H9AH9FryiHkGvAAEp50wzUqQdWCQImYc8NhG9dkzSwxqUbbDyndUtIx59PSqIP7mxPOT7sYoqOTrw
	tzMw18MnVoC2+eg9Ery4H9NGxUp1HFw472g2+5Els72qgoL4cJBxIMp1Y+x0HXX0D8Q73JZwaQ7R+
	k7E3v841sRHL1HnjGmGfaXACK2isWDrpG7x5MkFn5xrUuSfNFpBJpvLbkfIhMXljuLeKyy9uDvsxp
	zhHwBibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVSP-00000000OQn-2Zc2;
	Thu, 29 Jan 2026 17:05:25 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVSK-00000000OPy-0r2a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:05:23 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 2F91C160201;
	Thu, 29 Jan 2026 17:05:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 3B01F60015;
	Thu, 29 Jan 2026 17:05:11 +0000 (UTC)
Date: Thu, 29 Jan 2026 12:05:23 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 15/30] tracing: selftests: Add trace remote tests
Message-ID: <20260129120523.6f710ff2@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-16-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-16-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: txaufewkoqfauzwkqo47d1diq43oa8q6
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 3B01F60015
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18BLc+YPC0Jad8q2qNeGSamiSkist3+hCI=
X-HE-Tag: 1769706311-773773
X-HE-Meta: U2FsdGVkX18Gk3kh6frTDRcDF0tQBXJ5dAmTOR263lq+mjgXcTAeLPXIei7FJ5BLztwLyBZ/hXl6282qf0MCx78WPvPe6Vd4hZ3PIYWs6aqPUk1zQHysAjLvy4PWfu9AeXLPj38m+I10sjlarN3a00PXUnFHJQX9Q5MOyImib//LQL1kI1ciw/GzqcOaBk2/HzpZTDnPxlrZDG7PqfRupWk7RJJOnqpfIpvAYNheYH44ACfHOpDFCvHEcSneqDvufOY14MT9W85629RcnJB2zXRvyjpWX8pd2/sGCkiPOBZ95Fpdlj71kk3Dw7E0oTWaWmKgQWyBEGEXGb1i0qEJModXvjth6QWh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_090522_692517_B3763D94 
X-CRM114-Status: GOOD (  14.66  )
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

On Mon, 26 Jan 2026 10:44:04 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
> @@ -0,0 +1,127 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace remote non-consuming read
> +# requires: remotes/test
> +
> +. $TEST_DIR/remotes/functions
> +
> +test_trace()
> +{
> +	echo 0 > tracing_on
> +    assert_unloaded
> +
> +    echo 7 > buffer_size_kb
> +    echo 1 > tracing_on
> +    assert_loaded
> +
> +    # Simple test: Emit few events and try to read them
> +    for i in $(seq 1 8); do
> +        echo $i > write_event
> +    done
> +
> +    check_trace 1 8 trace
> +
> +    #
> +    # Test interaction with consuming read
> +    #
> +
> +    cat trace_pipe > /dev/null &
> +    pid=$!
> +
> +    sleep 1
> +    kill $pid
> +
> +    test $(wc -l < trace) -eq 0
> +
> +    for i in $(seq 16 32); do
> +        echo $i > write_event
> +    done
> +
> +    check_trace 16 32 trace
> +
> +    #
> +    # Test interaction with reset
> +    #
> +
> +    echo 0 > trace
> +
> +    test $(wc -l < trace) -eq 0
> +
> +    for i in $(seq 1 8); do
> +        echo $i > write_event
> +    done
> +
> +    check_trace 1 8 trace
> +
> +    #
> +    # Test interaction with lost events
> +    #
> +
> +    # Ensure the writer is not on the reader page by reloading the buffer
> +    echo 0 > tracing_on
> +    echo 0 > trace
> +    assert_unloaded
> +    echo 1 > tracing_on
> +    assert_loaded
> +
> +    # Ensure ring-buffer overflow by emitting events from the same CPU
> +    for cpu in $(get_cpu_ids); do
> +        break
> +    done
> +
> +    events_per_page=$(($(get_page_size) / $(get_selftest_event_size))) # Approx: does not take TS into account
> +    nr_events=$(($events_per_page * 2))
> +    for i in $(seq 1 $nr_events); do
> +        taskset -c $cpu echo $i > write_event
> +    done
> +
> +    id=$(sed -n -e '1s/\[[0-9]*\]\s*[0-9]*.[0-9]*: [a-z]* id=\([0-9]*\)/\1/p' trace)
> +    test $id -ne 1
> +
> +    check_trace $id $nr_events trace
> +
> +    #
> +    # Test per-CPU interface
> +    #
> +    echo 0 > trace
> +
> +    for cpu in $(get_cpu_ids) ; do
> +        taskset -c $cpu echo $cpu > write_event
> +    done
> +
> +    for cpu in $(get_cpu_ids); do
> +        cd per_cpu/cpu$cpu/
> +
> +        check_trace $cpu $cpu trace
> +
> +        cd - > /dev/null
> +    done
> +
> +    #
> +    # Test with hotplug
> +    #
> +
> +    [ "$(get_cpu_ids | wc -l)" -ge 2 ] || return 0
> +
> +    echo 0 > trace
> +
> +    for cpu in $(get_cpu_ids); do
> +        echo 0 > /sys/devices/system/cpu/cpu$cpu/online

Note, my test VM doesn't have cpu0/online, so this needs to test for the
existence of these files:

 ./ftracetest: 105: /work/git/linux.git/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc: cannot create /sys/devices/system/cpu/cpu0/online: Permission denied

-- Steve


> +        break
> +    done
> +
> +    for i in $(seq 1 8); do
> +        echo $i > write_event
> +    done
> +
> +    check_trace 1 8 trace
> +
> +    echo 1 > /sys/devices/system/cpu/cpu$cpu/online
> +}
> +
> +if [ -z "$SOURCE_REMOTE_TEST" ]; then
> +    set -e
> +
> +    setup_remote_test
> +    test_trace
> +fi

