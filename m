Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C20C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 00:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gExe4UUIf70zdOjJu5jsWMDA9jFycb5huYLAdDG+iA=; b=oJ/Ih/y6P+95so+d7wQ+DNHLwb
	5h13JBAUHQQEB9P/wvVFelSd9xrxG1oYbF5ERQ1Bni0IDn+eqMJvsRe9dmCy3JrvsAPsr1hF3F+S+
	45MRsTWhInG871xdcjzDwOWfAo/gNp4z7t4GNg6CGIokWftSU7Zcc5wSUrGLeryHFUywWxv6xUxWR
	vM/1zg4p23V38l7eWd60+OpFPhhL/2XJcmhkTLhSlzjH6dQBxey8f8P5yxZbk/QuUoagIQvFzjB0p
	1RCaRgTfugYkF32ycd9WFKlVKxZw13BItA04udHZflo8UoytgtNqc2hGjKvqArTGpJIyJemejKZ/o
	hkmMrjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCp5y-0000000H21c-484Z;
	Thu, 08 May 2025 00:26:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCp41-0000000H1fB-1JxH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 00:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B81215C5DB2;
	Thu,  8 May 2025 00:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F3CC4CEE2;
	Thu,  8 May 2025 00:24:33 +0000 (UTC)
Date: Wed, 7 May 2025 20:24:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/24] tracing: Introduce trace remotes
Message-ID: <20250507202444.43963c84@gandalf.local.home>
In-Reply-To: <20250506164820.515876-3-vdonnefort@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
	<20250506164820.515876-3-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_172437_470045_4F6CB853 
X-CRM114-Status: GOOD (  15.71  )
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

On Tue,  6 May 2025 17:47:58 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> +
> +static bool trace_remote_loaded(struct trace_remote *remote)
> +{
> +	return remote->trace_buffer;
> +}
> +
> +static bool trace_remote_busy(struct trace_remote *remote)

Can you add comments to what these functions are doing?

Doesn't need to be kerneldoc (it actually shouldn't be), but describe why
they would return true and why they would return false.

> +{
> +	return trace_remote_loaded(remote) &&
> +		(remote->nr_readers || remote->tracing_on ||
> +		 !ring_buffer_empty(remote->trace_buffer));
> +}
> +
> +static int trace_remote_load(struct trace_remote *remote)
> +{
> +	struct ring_buffer_remote *rb_remote = &remote->rb_remote;
> +
> +	lockdep_assert_held(&remote->lock);
> +
> +	if (trace_remote_loaded(remote))
> +		return 0;
> +
> +	remote->trace_buffer_desc = remote->cbs->load_trace_buffer(remote->trace_buffer_size,
> +								   remote->priv);
> +	if (!remote->trace_buffer_desc)
> +		return -ENOMEM;

The error may not be -ENOMEM, have the load_trace_buffer return an ERR_PTR
and then you can return:

	if (IS_ERR(remote->trace_buffer_desc)
		return PTR_ERR(remote->trace_buffer_desc);


> +
> +	rb_remote->desc = remote->trace_buffer_desc;
> +	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
> +	rb_remote->priv = remote->priv;
> +	remote->trace_buffer = ring_buffer_remote(rb_remote);
> +	if (!remote->trace_buffer) {

Same here.

> +		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void trace_remote_unload(struct trace_remote *remote)
> +{
> +	lockdep_assert_held(&remote->lock);
> +
> +	if (!trace_remote_loaded(remote) || trace_remote_busy(remote))
> +		return;

Can this cause leaks? Should trace_remote_unload() return an error value to
let the caller know it wasn't unloaded?

> +
> +	ring_buffer_free(remote->trace_buffer);
> +	remote->trace_buffer = NULL;
> +	remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
> +}
> +

Short description of what trace_remote_start does.

> +static int trace_remote_start(struct trace_remote *remote)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&remote->lock);
> +
> +	if (remote->tracing_on)
> +		return 0;
> +
> +	ret = trace_remote_load(remote);
> +	if (ret)
> +		return ret;
> +
> +	ret = remote->cbs->enable_tracing(true, remote->priv);
> +	if (ret) {
> +		trace_remote_unload(remote);
> +		return ret;
> +	}
> +
> +	remote->tracing_on = true;
> +
> +	return 0;
> +}
> +

Same for stop.

-- Steve

> +static int trace_remote_stop(struct trace_remote *remote)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&remote->lock);
> +
> +	if (!remote->tracing_on)
> +		return 0;
> +
> +	ret = remote->cbs->enable_tracing(false, remote->priv);
> +	if (ret)
> +		return ret;
> +
> +	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
> +	remote->tracing_on = false;
> +	trace_remote_unload(remote);
> +
> +	return 0;
> +}

