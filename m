Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B07DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7vDbC+h+/IIbH/cXwkOmZAco4ey3LkcdIeQn9K9PmM=; b=2qbF3kUEKcZKpZudB3VW4ybDbP
	h6azRiOnj8dmEZ2ebwhltRsuQwJJJBeJgfxkn7w8A6EAIQU2fEyt3ZR14CvRCCUe0O/xva650MmZh
	1xQz/O3GLAH4rsahTMWa1tCYa+XSPutkKanQgwQ74JNayX6sc+d7TXpPwEu7wP3+4JesEPqrw3G6g
	15Tab+5H1eFnCnGkS2UGPP2X/IP1yJkxONh4ss1B++812qhnML6H35PB9b2mlU7zY32Cn8/+8YWyH
	hqTscmB8+6AMOe19MIYa57D9POrEEX4k3J73yKHAWrlanQfulas/ccx3mN9+xVyv0xPztyIhaqE7q
	Upc3Fd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xr-00000008qk3-3HPh;
	Tue, 09 Sep 2025 17:17:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx9H-00000006xxj-0Mar
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:08:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3df35a67434so3493482f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 05:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757419713; x=1758024513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7vDbC+h+/IIbH/cXwkOmZAco4ey3LkcdIeQn9K9PmM=;
        b=kTar596T9rCQsps5jKzbrOsRfZs/XqeH2BL6gp9Xj66nFeEvA7ID6gfgOPKFNF5iA3
         oH2YVotV6X2PJjNYHWjsWyBFvDI3AyJLo3eNVUgyFGHdLkwsy83kJX/YQJsDGdiF5EJq
         XYHM5k+Bw211ty8DNYPY8qHpFck71M37xdKgbrwwVbU4MZGgTcjg80ziq6I+Ab/NT3DO
         TrzuDYDKuJcsOdF9HNaDnSv4YDhO7uz+5E70bXOGBtiNjEv4ONyWT6ISH6rWVmWQPge1
         EUx7OrHVe0Xvmfyckwqpt01HSQ48gixDDI+MdyGL0TenUV6D+bsCVKv/yhE3t8RCfHP7
         lfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419713; x=1758024513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7vDbC+h+/IIbH/cXwkOmZAco4ey3LkcdIeQn9K9PmM=;
        b=e7BwdDS9BYbanenVUBpt7tPPctkqahfzrTcu++QkNwtqgPccwkEmQndhWG3txUTS7+
         gDhLnZrxTAaWfb9fPXxOLMk6ddAvAT5AIZ53w4yMocsdLcOM5uWLV9kYGHRciS10wiKE
         XymXmIpS33dLAXTCcvEd9u8lbJSiV4OAoFL0v0r3Bac3x1j3ibQL49cY8La2XYtmor6N
         sUwrTrRV1FzQpPnw/u530J5+CC9z+Yq7ofajmSgu0JqyKCeC7C+2yEm3Xv3Kwf8Y2KE6
         OGffUDueVBsAQBf92/DOttd3Yun5n3yZLsoBXqT4kVxQ5a4EovEM7jbolHv3uKaGd/X0
         o2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCURtTu9bxG/35c/whwrusuBaGQBdNjQPkl1rMB8efRLRpTQ6Ir8OdAXGUo3zDwRkqwMzL3DfKxS1eBucPI5ilFL@lists.infradead.org
X-Gm-Message-State: AOJu0YzjergxV75s2XaZLaMu0zkaO2nLZgzkHO4HWkiVHTcse8N4N0h1
	bUXshYogGWU8Qn6Ju2rkNojNG2I6iyhlIpH4gbN3cuN732d9duyVAKMuaUx/Z6xBew==
X-Gm-Gg: ASbGnctWJoxpBQFY6ZHjPlq8xK0W4nrxBwujV15kZfdYMqIl6BBS47YmkDlGMxum6bo
	yw95pfxqAOiAM1nrSP8kwO15YhQs/Od5CwhLdpIluhLkfsN5LTWwqhrfdy1Fvx9Y02RiVhewcEC
	6Hqiz5SbxZ9YCxDxaFUZwnjk5mDY9M+NQuKpPA1hQntFzQhXAOJ/j1PmZ8QfA/NXDQd+b/cpRwB
	bFGItjskuF6wCrh8Agpl1fLFmhUREfeXly8CbMD1H7th6HyJZdWjHjxDnzWbNUwoe86Gb0b+lqj
	mWBTvRbpMAT/jzTYbxOhDBAkuBjs5zAhdyX4QwWexjB27xRjTaM+CYuQlezHRF6bO0O/zrnJuBX
	peBDY7JuL0uSzMTn+XeVDdnd+nXSjnOgSotWeGAUhzN+bzcq3w8xSkJhURsjkEvEDsexi6LF/qY
	lWoNcc
X-Google-Smtp-Source: AGHT+IEmpSA1PmUMsgcmd2ZNoedzp7F9aWzukj/yEFhZuO5KFbaj8r4hHCaj2MqwR9Y8LELRFzynbQ==
X-Received: by 2002:a05:6000:2486:b0:3e7:490c:1a2 with SMTP id ffacd0b85a97d-3e7490c049dmr6915730f8f.10.1757419712364;
        Tue, 09 Sep 2025 05:08:32 -0700 (PDT)
Received: from google.com (211.29.195.35.bc.googleusercontent.com. [35.195.29.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9cb9sm2559883f8f.20.2025.09.09.05.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:08:31 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:08:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/24] tracing: Introduce trace remotes
Message-ID: <aMAYvA9LSvfxvt_C@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
 <20250821081412.1008261-4-vdonnefort@google.com>
 <20250908193606.47143d09@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193606.47143d09@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_050835_126340_A48F3DC2 
X-CRM114-Status: GOOD (  38.34  )
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

On Mon, Sep 08, 2025 at 07:36:05PM -0400, Steven Rostedt wrote:
> On Thu, 21 Aug 2025 09:13:51 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > A trace remote relies on ring-buffer remotes to read and control
> > compatible tracing buffers, written by entity such as firmware or
> > hypervisor.
> > 
> > Add a Tracefs directory remotes/ that contains all instances of trace
> > remotes. Each instance follows the same hierarchy as any other to ease
> > the support by existing user-space tools.
> > 
> > This currently does not provide any event support, which will come
> > later.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
> > new file mode 100644
> > index 000000000000..de043a6f2fe0
> > --- /dev/null
> > +++ b/include/linux/trace_remote.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _LINUX_TRACE_REMOTE_H
> > +#define _LINUX_TRACE_REMOTE_H
> > +
> > +#include <linux/ring_buffer.h>
> > +
> > +struct trace_remote_callbacks {
> > +	struct trace_buffer_desc *
> > +		(*load_trace_buffer)(unsigned long size, void *priv);
> 
> I believe this is one of those cases where the 80 char limit is more of a
> guildline than a rule. It looks better to keep the above as one line.
> 
> > +	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
> 
> Heck, this is already passed 80 characters ;-)
> 
> > +	int	(*enable_tracing)(bool enable, void *priv);
> > +	int	(*swap_reader_page)(unsigned int cpu, void *priv);
> > +};
> > +
> > +int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
> > +int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
> > +			      const struct cpumask *cpumask);
> > +void trace_remote_free_buffer(struct trace_buffer_desc *desc);
> > +
> > +#endif
> > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > index d2c79da81e4f..99af56d39eaf 100644
> > --- a/kernel/trace/Kconfig
> > +++ b/kernel/trace/Kconfig
> > @@ -1238,4 +1238,7 @@ config HIST_TRIGGERS_DEBUG
> >  
> 
> 
> > +
> > +int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
> > +{
> > +	struct trace_remote *remote;
> > +
> > +	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
> > +	if (!remote)
> > +		return -ENOMEM;
> > +
> > +	remote->cbs = cbs;
> > +	remote->priv = priv;
> > +	remote->trace_buffer_size = 7 << 10;
> > +	remote->poll_ms = 100;
> 
> What's with the magic numbers?

The 7KiB value can be modified with the tracefs file buffer_size_kb.

the 100ms can't be modified. I could either make a tracefs file or just a
trace_remote_set_poll_ms() function so it can be modified after registration.

In all cases, I'll add a TRACE_REMOTE_DEFAULT_XXXX definition at the start of
the file.

> 
> > +	mutex_init(&remote->lock);
> > +
> > +	if (trace_remote_init_tracefs(name, remote)) {
> > +		kfree(remote);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +void trace_remote_free_buffer(struct trace_buffer_desc *desc)
> > +{
> > +	struct ring_buffer_desc *rb_desc;
> > +	int cpu;
> > +
> > +	for_each_ring_buffer_desc(rb_desc, cpu, desc) {
> > +		unsigned int id;
> > +
> > +		free_page(rb_desc->meta_va);
> > +
> > +		for (id = 0; id < rb_desc->nr_page_va; id++)
> > +			free_page(rb_desc->page_va[id]);
> > +	}
> > +}
> > +
> > +int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
> > +			      const struct cpumask *cpumask)
> > +{
> > +	int nr_pages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
> > +	struct ring_buffer_desc *rb_desc;
> > +	int cpu;
> > +
> > +	desc->nr_cpus = 0;
> > +	desc->struct_len = offsetof(struct trace_buffer_desc, __data);
> 
> The above is better as:
> 
> 	desc->struct_len = struct_size(desc, __data, 0);
> 
> As it also does some other checks, like make sure __data is a flexible
> array.
> 
> > +
> > +	rb_desc = (struct ring_buffer_desc *)&desc->__data[0];
> > +
> > +	for_each_cpu(cpu, cpumask) {
> > +		unsigned int id;
> > +
> > +		rb_desc->cpu = cpu;
> > +		rb_desc->nr_page_va = 0;
> > +		rb_desc->meta_va = (unsigned long)__get_free_page(GFP_KERNEL);
> > +		if (!rb_desc->meta_va)
> > +			goto err;
> > +
> > +		for (id = 0; id < nr_pages; id++) {
> > +			rb_desc->page_va[id] = (unsigned long)__get_free_page(GFP_KERNEL);
> > +			if (!rb_desc->page_va[id])
> 
> What exactly are these pages allocated for? Is this what the remote will
> use to write to? There should be more comments about how this is used.

Those are the actual ring-buffer data pages. I'll add a comment here.
> 
> > +				goto err;
> > +
> > +			rb_desc->nr_page_va++;
> > +		}
> > +		desc->nr_cpus++;
> > +		desc->struct_len += offsetof(struct ring_buffer_desc, page_va);
> > +		desc->struct_len += sizeof(rb_desc->page_va[0]) * rb_desc->nr_page_va;
> 
> Shouldn't the above be:
> 
> 		desc->struct_len += struct_size(rb_desc, page_va, rb_desc->nr_page_va);
> 
> ?

Yes, that'd look way better.

> 
> > +		rb_desc = __next_ring_buffer_desc(rb_desc);
> 
> Is there no check to make sure that the cpu mask matches what the rb_desc
> will have?

The function is filling rb_desc[], based on the cpumask input, so both will
match when returning from this function.
It is then easy to handle the case where some CPUs are not part of the cpumask.
See remote_test_load() where for_each_ring_buffer_desc() iterates over all the
CPUs from the trace_desc but uses rb_desc->cpu.

Is it what you meant?

> 
> -- Steve
> 
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	trace_remote_free_buffer(desc);
> > +	return -ENOMEM;
> > +}
> 

