Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0ECD46C0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqtx3GKeWlbRYwAAspTZTrscZSHgALPqC5u3jbp+Ayo=; b=VVB/KSBa+J6ILtTnegErpfmEOo
	P1Z9UCT+cuUoLHuMqybGQDqj6exXSwFFzZOpfhHKR8XUsbE8ZQwq7xVT7RIqyUKDvRXjc1+E9PMVG
	RLbOqJSleNtVnoUsASUI/po8EZJYRlBESb5z/Qnda1CP7WSZgGJdirpkPE/XhmreCy4N7I6HDYyXU
	59/RIZq1NVYQvusWjZwyERVYj6IpL04Elvi2c135bLLzfp8gYgBF0dZEN4LqpWuMitCrbmPuPDYzp
	aX1n+XsSpbqupt5fkeur4NtlFLmFAusDJzVRdcKlnnGUB2NpUsbMcHoMdejeZvhHmO7wEFxpzL+XE
	HQ4ac8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEoD-0000000Gvpw-1Oom;
	Wed, 28 Jan 2026 23:18:50 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEo8-0000000GvpK-1ycm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 23:18:47 +0000
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 639FE5AE25;
	Wed, 28 Jan 2026 23:18:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id DDFB620028;
	Wed, 28 Jan 2026 23:18:37 +0000 (UTC)
Date: Wed, 28 Jan 2026 18:18:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 13/30] tracing: Introduce simple_ring_buffer
Message-ID: <20260128181847.222ea802@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-14-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-14-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: DDFB620028
X-Stat-Signature: 43a88gcurwuf8bqzrc4mxa8bqquddtyf
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ZFlBAvfYpiv4UK3DXQtN9wdssDvp2zME=
X-HE-Tag: 1769642317-813279
X-HE-Meta: U2FsdGVkX1/DPWmHGM5YdDiSmH/xbwgqYKsu3og5E/hd/iyv1bC4NvCV+P+AsUta6AtV/JbZxNb9Wwx3odoI7NCRp4vAuT3huo+kruP5HY8CrX9KGQTi2I5YxGJxV9rlm6TGfIgWgQPyJ++CArLUFwOv+It/l94JhVBJpn+4Cu7R4ofdnAs6JlWcVBNQ2xSGAJlevFx73Csxsoo2miR1GhiH4/dQq6e1GHHC0BuXvwKnQ9IR+IAJNGsVUKShHMupgyYKIiH0uwelS1sigPFP6oE3nUevFxaowL0RggulYZdAMA9wxH7gGIC5w+qzdDlRgKS5EC3rC3DCMO005EKnF9jAQTb3Yt9G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_151844_590790_2FA6F3A2 
X-CRM114-Status: GOOD (  14.92  )
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

On Mon, 26 Jan 2026 10:44:02 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> +
> +/**
> + * simple_ring_buffer_init - Init @cpu_buffer based on @desc
> + *
> + * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
> + * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
> + * @desc:	A ring_buffer_desc
> + *
> + * Returns: 0 on success or -EINVAL if the content of @desc is invalid
> + */

Again, kerneldoc goes with the function and not the prototype.

Especially helps with review, as I like to see the kerneldoc what reading
the function.

-- Steve

> +int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
> +			    const struct ring_buffer_desc *desc);
> +
> +/**
> + * simple_ring_buffer_unload - Prepare @cpu_buffer for deletion
> + *
> + * @cpu_buffer:	A simple_rb_per_cpu that will be deleted.
> + */
> +void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer);
> +
> +/**
> + * simple_ring_buffer_reserve - Reserve an entry in @cpu_buffer
> + *
> + * @cpu_buffer:	A simple_rb_per_cpu
> + * @length:	Size of the entry in bytes
> + * @timestamp:	Timestamp of the entry
> + *
> + * Returns the address of the entry where to write data or NULL
> + */
> +void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
> +				 u64 timestamp);
> +
> +/**
> + * simple_ring_buffer_commit - Commit the entry reserved with simple_ring_buffer_reserve()
> + *
> + * @cpu_buffer:	The simple_rb_per_cpu where the entry has been reserved
> + */
> +void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer);
> +
> +/**
> + * simple_ring_buffer_enable_tracing - Enable or disable writing to @cpu_buffer
> + *
> + * @cpu_buffer: A simple_rb_per_cpu
> + * @enable:	True to enable tracing, False to disable it
> + *
> + * Returns 0 on success or -ENODEV if @cpu_buffer was unloaded
> + */
> +int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
> +
> +/**
> + * simple_ring_buffer_reset - Reset @cpu_buffer
> + *
> + * @cpu_buffer: A simple_rb_per_cpu
> + *
> + * This will not clear the content of the data, only reset counters and pointers
> + *
> + * Returns 0 on success or -ENODEV if @cpu_buffer was unloaded.
> + */
> +int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
> +
> +/**
> + * simple_ring_buffer_swap_reader_page - Swap ring-buffer head with the reader
> + *
> + * This function enables consuming reading. It ensures the current head page will not be overwritten
> + * and can be safely read.
> + *
> + * @cpu_buffer: A simple_rb_per_cpu
> + *
> + * Returns 0 on success, -ENODEV if @cpu_buffer was unloaded or -EBUSY if we failed to catch the
> + * head page.
> + */
> +int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
> +
> +#endif

