Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0951C10FCAE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3bwGumRbDmzIFSzMdzb43hR+4wh37KK3mBzHGH/rfg=; b=V78CPjQhJnHfEdYqwYuBRIpa4d
	J81cH2woq5h/PF2OjTa5a0U0cUuFgHBC1xIFRlf1+EGvfj8GKnEBLL+vGAp6h1W9KbF0k+DaFCDdm
	opDtLnVL4leN0KeUF2RVx3pBLvGn8RsAR9qSi+iFYqVlkHO4/QNANvadtnLmgL+7Hj25pz5DdrbCX
	1N+ksV+y4Db68YKZPHItaHjcX3Uijm7VP80JCqyxe6Lso3JEplDzbG8vecUKKKnpD/KCftlJexqYL
	Ex+gaxcTHEF+XC8j77lWh20j5eINdKfDckmaq898pe2LdiQIE5ZS+rp7uMy0b1DU9vKEuPTemHwcm
	IwPFaRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84EH-0000000GKD1-2lRe;
	Wed, 01 Apr 2026 22:40:05 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84EF-0000000GKCE-0E5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 22:40:04 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 81D2FE0352;
	Wed,  1 Apr 2026 22:39:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 7438620023;
	Wed,  1 Apr 2026 22:39:56 +0000 (UTC)
Date: Wed, 1 Apr 2026 18:40:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 4/5] ring-buffer: Add persistent ring buffer
 invalid-page inject test
Message-ID: <20260401184055.2f932674@gandalf.local.home>
In-Reply-To: <177494619065.71933.9842685686800241005.stgit@mhiramat.tok.corp.google.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
	<177494619065.71933.9842685686800241005.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4epogobj18rrgh3gykjen88bgr7uq4u3
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7438620023
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+9loO0uPQcdRrACGcallEQYGbxIHK2BJA=
X-HE-Tag: 1775083196-868687
X-HE-Meta: U2FsdGVkX1+DtxZ6fGh5PSCmac8SvXwgJMF+ah6/6elT9kqKlWpaklv4XEO8u9LjMnf0tQmnp6I8DfpcgzBMeCouBjJzqYip3Mk4eSz4Pa9CE/dxp9Bdm+UAvfR/9M4oUlunCCZ1d1SEu41IteuuzvNGV9mlmTPS66akoL/aQcm8ULR91oOF+x1Cos3xzAXorXhTOdjRSSEjv9Yz6XQsXC66+N3z+wpiPR/B5/LKGlUE9xPqUkYc6MmKPZqpKrqmW/xzPwRZ6adWKuOH1VD0Dh1q9ktlNwIKafAZckq/WWCwad0uzpGVs3/JM3BGjc2DjtghlvaD9wwxmO588lAnJ1L8ehUWZUjJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_154003_209799_86F7917B 
X-CRM114-Status: GOOD (  44.94  )
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


I replied with mostly grammar fixes and some rewrites of text.

On Tue, 31 Mar 2026 17:36:30 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Add a self-destractive test for the persistent ring buffer.

  "self-destractive"? Do you mean "self-destructive"?

Probably better to call it a "self-corrupting test".

> 
> This will inject erroneous value to some sub-buffer pages (where

            inject an erroneous

> the index is even or multiples of 5) in the persistent ring buffer
> when kernel gets panic, and check whether the number of detected

  when the kernel panics, and checks whether

> invalid pages and the total entry_bytes are the same as recorded

                                                  same as the recorded

> values after reboot.
> 
> This can ensure the kernel correctly recover partially corrupted

  This ensures that the kernel can correctly recover a partially corrupted

> persistent ring buffer when boot.

                         after a reboot or panic.

> 
> The test only runs on the persistent ring buffer whose name is
> "ptracingtest". And user has to fill it up with events before

                  The user has to fill it with events before a kernel panic.

> kernel panics.
> 
> To run the test, enable CONFIG_RING_BUFFER_PERSISTENT_INJECT
> and you have to setup the kernel cmdline;

  and add the following kernel cmdline:

Note, it's more proper to use a colon (:) than a semi-colon (;) when
referencing an example on the next line.

> 
>  reserve_mem=20M:2M:trace trace_instance=ptracingtest^traceoff@trace
>  panic=1
> 
> And run following commands after the 1st boot;

  Run the following commands after the 1st boot:

> 
>  cd /sys/kernel/tracing/instances/ptracingtest
>  echo 1 > tracing_on
>  echo 1 > events/enable
>  sleep 3
>  echo c > /proc/sysrq-trigger
> 
> After panic message, the kernel will reboot and run the verification
> on the persistent ring buffer, e.g.
> 
>  Ring buffer meta [2] invalid buffer page detected
>  Ring buffer meta [2] is from previous boot! (318 pages discarded)
>  Ring buffer testing [2] invalid pages: PASSED (318/318)
>  Ring buffer testing [2] entry_bytes: PASSED (1300476/1300476)
> 
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  Changes in v15:
>   - Use pr_warn() for test result.
>   - Inject errors on the page index is multiples of 5 so that
>     this can reproduce contiguous empty pages.
>  Changes in v14:
>   - Rename config to CONFIG_RING_BUFFER_PERSISTENT_INJECT.
>   - Clear meta->nr_invalid/entry_bytes after testing.
>   - Add test commands in config comment.
>  Changes in v10:
>   - Add entry_bytes test.
>   - Do not compile test code if CONFIG_RING_BUFFER_PERSISTENT_SELFTEST=n.
>  Changes in v9:
>   - Test also reader pages.
> ---
>  include/linux/ring_buffer.h |    1 +
>  kernel/trace/Kconfig        |   31 ++++++++++++++++++
>  kernel/trace/ring_buffer.c  |   74 +++++++++++++++++++++++++++++++++++++++++++
>  kernel/trace/trace.c        |    4 ++
>  4 files changed, 110 insertions(+)
> 
> diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> index 994f52b34344..0670742b2d60 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -238,6 +238,7 @@ int ring_buffer_subbuf_size_get(struct trace_buffer *buffer);
>  
>  enum ring_buffer_flags {
>  	RB_FL_OVERWRITE		= 1 << 0,
> +	RB_FL_TESTING		= 1 << 1,
>  };
>  
>  #ifdef CONFIG_RING_BUFFER
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index e130da35808f..07305ed6d745 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -1202,6 +1202,37 @@ config RING_BUFFER_VALIDATE_TIME_DELTAS
>  	  Only say Y if you understand what this does, and you
>  	  still want it enabled. Otherwise say N
>  
> +config RING_BUFFER_PERSISTENT_INJECT
> +	bool "Enable persistent ring buffer error injection test"
> +	depends on RING_BUFFER
> +	help
> +	  Run a selftest on the persistent ring buffer which names
> +	  "ptracingtest" (and its backup) when panic_on_reboot by

  Does this do anything with the backup?

> +	  invalidating ring buffer pages.

 	  This option will have the kernel check if the persistent ring
 	  buffer is named "ptracingtest", and if so, it will corrupt some
 	  of its pages on a kernel panic. This is used to test if the
 	  persistent ring buffer can recover from some of its sub-buffers
 	  being corrupted.

[space]

> +	  To use this, boot kernel with "ptracingtest" persistent

                     , boot a kernel with a "ptracingtest" persistent

> +	  ring buffer, e.g.
> +
> +	   reserve_mem=20M:2M:trace trace_instance=ptracingtest@trace panic=1
> +
> +	  And after the 1st boot, run test command, like;

                               , run the following commands:

> +
> +	   cd /sys/kernel/tracing/instances/ptracingtest
> +	   echo 1 > events/enable
> +	   echo 1 > tracing_on
> +	   sleep 3
> +	   echo c > /proc/sysrq-trigger
> +
> +	  After panic message, the kernel reboots and show test results
> +	  on the boot log.

          After the panic message, the kernel will reboot and will show the
          test results in the console output.

> +
> +	  Note that user has to enable events on the persistent ring
> +	  buffer manually to fill up ring buffers before rebooting.

	  Note that events for the ring buffer needs to be enabled prior to
	  crashing the kernel so that the ring buffer has content that the
	  test will corrupt.

> +	  Since this invalidates the data on test target ring buffer,
> +	  "ptracingtest" persistent ring buffer must not be used for
> +	  actual tracing, but only for testing.

	  As the test will corrupt events in the "ptracingtest" persistent
	  ring buffer, it should not be used for any other purpose other
	  than his test.


> +
> +	  If unsure, say N
> +
>  config MMIOTRACE_TEST
>  	tristate "Test module for mmiotrace"
>  	depends on MMIOTRACE && m
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 5ff632ca3858..fb098b0b4505 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -64,6 +64,10 @@ struct ring_buffer_cpu_meta {
>  	unsigned long	commit_buffer;
>  	__u32		subbuf_size;
>  	__u32		nr_subbufs;
> +#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
> +	__u32		nr_invalid;
> +	__u32		entry_bytes;
> +#endif
>  	int		buffers[];
>  };
>  
> @@ -2079,6 +2083,21 @@ static void rb_meta_validate_events(struct
> 	  ring_buffer_per_cpu *cpu_buffer) if (discarded)
>  		pr_cont(" (%d pages discarded)", discarded);
>  	pr_cont("\n");
> +
> +#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
> +	if (meta->nr_invalid)
> +		pr_warn("Ring buffer testing [%d] invalid pages: %s (%d/%d)\n",
> +			cpu_buffer->cpu,
> +			(discarded == meta->nr_invalid) ? "PASSED" : "FAILED",
> +			discarded, meta->nr_invalid);
> +	if (meta->entry_bytes)
> +		pr_warn("Ring buffer testing [%d] entry_bytes: %s (%ld/%ld)\n",
> +			cpu_buffer->cpu,
> +			(entry_bytes == meta->entry_bytes) ? "PASSED" : "FAILED",
> +			(long)entry_bytes, (long)meta->entry_bytes);
> +	meta->nr_invalid = 0;
> +	meta->entry_bytes = 0;
> +#endif
>  	return;
>  
>   invalid:
> @@ -2559,12 +2578,67 @@ static void rb_free_cpu_buffer(struct
> 	  ring_buffer_per_cpu *cpu_buffer) kfree(cpu_buffer);
>  }
>  
> +#ifdef CONFIG_RING_BUFFER_PERSISTENT_INJECT
> +static void rb_test_inject_invalid_pages(struct trace_buffer *buffer)
> +{
> +	struct ring_buffer_per_cpu *cpu_buffer;
> +	struct ring_buffer_cpu_meta *meta;
> +	struct buffer_data_page *dpage;
> +	u32 entry_bytes = 0;
> +	unsigned long ptr;
> +	int subbuf_size;
> +	int invalid = 0;
> +	int cpu;
> +	int i;
> +
> +	if (!(buffer->flags & RB_FL_TESTING))
> +		return;
> +
> +	guard(preempt)();
> +	cpu = smp_processor_id();
> +
> +	cpu_buffer = buffer->buffers[cpu];
> +	meta = cpu_buffer->ring_meta;
> +	ptr = (unsigned long)rb_subbufs_from_meta(meta);
> +	subbuf_size = meta->subbuf_size;
> +
> +	for (i = 0; i < meta->nr_subbufs; i++) {
> +		int idx = meta->buffers[i];
> +
> +		dpage = (void *)(ptr + idx * subbuf_size);
> +		/* Skip unused pages */
> +		if (!local_read(&dpage->commit))
> +			continue;
> +
> +		/*
> +		 * Invalidate even pages or multiples of 5. This will lead 3

							    This will cause 3

-- Steve

> +		 * contiguous invalidated(empty) pages.
> +		 */
> +		if (!(i & 0x1) || !(i % 5)) {
> +			local_add(subbuf_size + 1, &dpage->commit);
> +			invalid++;
> +		} else {
> +			/* Count total commit bytes. */
> +			entry_bytes += local_read(&dpage->commit);
> +		}
> +	}
> +
> +	pr_info("Inject invalidated %d pages on CPU%d, total size: %ld\n",
> +		invalid, cpu, (long)entry_bytes);
> +	meta->nr_invalid = invalid;
> +	meta->entry_bytes = entry_bytes;
> +}

