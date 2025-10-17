Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C626CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PbyCiuHUJUF033svwvjOYrdhpWf8nguQ+4KJNq1qik=; b=fLnh8FbzEVYnE5oQg/EAlRpGC7
	otaHtb+i/K1N4BsYX15lZkgXDI4Lmnlo4l/RT0KamkYa0H8cyVQLGoMd16dvaFc1FkQABVnpRz3wX
	y0WGbJPotBbG8GtFEAw3avdnp+fRFeKaMZMIJGVSS1lloreehVzA66GbNfSNoZkLXkaiEzqP9/pcb
	DuJQ7o5Hn23K1cq+BIy2ETxRMPlOR2LvGOzlprOyZSlKbLNuOVJ8ZGT5D4I2ABUWD0Wg8CjbufZb/
	lyON7ZB0DCtvfEtgzMhB48GL79jcRuXjR33GyBEXSMZkb4goI46QcEa7id+vuElDJD+IjzeIfBFgJ
	09mdmQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fwx-00000007661-2o6E;
	Fri, 17 Oct 2025 08:36:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fwv-00000007657-3kqD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:36:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ece1102998so1266501f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760690191; x=1761294991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PbyCiuHUJUF033svwvjOYrdhpWf8nguQ+4KJNq1qik=;
        b=Qu/JmtJE+mdRvTv1t8dWaozJY17G3ZeUWTYW0QZPAm77KZ9eH1+rgc7lGcCQ7maw5v
         29IrLy8dyhVzeOJYL7AEiVVzz8fpoV9CuM6bJLvqYd9CFwpVcLZUsVvb3zAmq7EU0V/I
         g3/+Wl5pYAn+8ofF1qwIH4Nevdk8+Jutcsauyr+S3tH8Z9py0ouQ1vM1UErhFGgEYs1n
         Ro7YuXzc2TIOAYSTNZeOdpNyRmOavsSxim7jTkESBMfvTppRKm1W8iRK1EiZP5qg3LL1
         2hPm4N/ufWjotO+RkkY6Rm45/Hw5OtiayOBx3VmXa/pvPpw0+1E5l/lzmTL8N55lEuCw
         hHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760690191; x=1761294991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PbyCiuHUJUF033svwvjOYrdhpWf8nguQ+4KJNq1qik=;
        b=cpQ5OZ3r6uqYOSf+Lmgyl08YrZzGfx/0r+g3Syto+QZ3q0qSB6pNyxm8rRdlmVwY8u
         OuxQQDUGH/PZu5ImDIW6CKrUg+FDr11+cRP7BfqDmr2f+2oTRgBMq00TcOxjlbUBfA1t
         KoWLpR2TUloGqv/jgs9fi+a8yb/9FIZMbTKA4fUeaNG4w+Z4mu/k3m1Iwq220J6ZiwIk
         yf202Oy5f1Zu6DJxe9cpYOjTHY7Bt2v5nCPfmVdb/sMUZivJYQL6PzfCXh+HH+ey8tIX
         7P/8sJO3z2fZBbgRUpihBBFWHVl/kVqktAx1LJ7RMrr5krTSBu30FLMeSwDJR6s3qzq8
         40Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWXfHfE5Z/BNtKvwDfiqjOwtO23EHTI+OCURehHmxFJrO+tvfFwCetSc1Ehi/eWEOrrJ3C5BsDM0mOpKVMgeeZT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywedh8shOE3r6oE5BRdhzWoFCfzmi3NTeaF4gchtr8Fqk9mBfOR
	X+9+rzFv2aQUDYFOwV14NLZNTv5kcGCZ04suMQLWQyUFSKMi3wBot8zSHTpfBL1NlQ==
X-Gm-Gg: ASbGnctwBIScaq30P7ew7VJz/hnV05jKJbki2Za3cXMiHBQx1BBVMKcw3VSMakJGRa3
	PAKv22DBjiAMRVUltALtvc0KKuOKdCig2uAVgjRLexppJ8FWNP6mrijQyQKPUMeSuv48P0BlbM+
	zk2pO8E6g0R+7HVZn0BtBnHUMUzX6swZ2nQmipjhIBdbCjNxs9IJzwk0cApqgkKGlXzLcbOv6p6
	3KsBsvdLFz3u39mfzdYinpHTEVSTObJJ6VyujZzutW8nJM33+EesF/SNhzibjMF0WgKRDyTWU0X
	PDsk2wCnP3DJ1X6FhIVLfQ6iBZFmU/x5oPhj7YgsI0SOBNej1bOWFq0RGmbtXubDTt8b0fLRgea
	PF3ERXWQ+MXOt5dNR0sG9gsGVFPBaInJZvRjt6Ibs1o1vuYvaoi+Zz7N+mpUvbRIv3zkMI9CFHJ
	ALObEeFX0HLk7Czf/TOQ0FLnd3TUslkGbcRWwWLcx8eibWwnOFyfIoogAwj10hVw==
X-Google-Smtp-Source: AGHT+IH72Zzon///3YHUGrfdJjvES6bGUL67+sdtzqRk2m12B632kNe5kfL2AL8JY16sBojJ3cT0Wg==
X-Received: by 2002:a05:6000:1867:b0:427:6a4:93da with SMTP id ffacd0b85a97d-42706a496dcmr779835f8f.49.1760690190913;
        Fri, 17 Oct 2025 01:36:30 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42707b482b3sm2142688f8f.50.2025.10.17.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:36:30 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:36:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/28] tracing: Add a trace remote module for testing
Message-ID: <aPIAC0WEVg1pVr0H@google.com>
References: <20251003133825.2068970-1-vdonnefort@google.com>
 <20251003133825.2068970-15-vdonnefort@google.com>
 <20251016170645.15416c8a@gandalf.local.home>
 <20251016171155.0d871fc3@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016171155.0d871fc3@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013634_009922_CEC5C499 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, Oct 16, 2025 at 05:11:55PM -0400, Steven Rostedt wrote:
> On Thu, 16 Oct 2025 17:06:45 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Fri,  3 Oct 2025 14:38:11 +0100
> > Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > > diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> > > index 918afcc1fcaf..52131d89993c 100644
> > > --- a/kernel/trace/Kconfig
> > > +++ b/kernel/trace/Kconfig
> > > @@ -1244,4 +1244,12 @@ config TRACE_REMOTE
> > >  config SIMPLE_RING_BUFFER
> > >  	bool
> > >  
> > > +config TRACE_REMOTE_TEST
> > > +	tristate "Test module for remote tracing"
> > > +	select TRACE_REMOTE
> > > +	select SIMPLE_RING_BUFFER
> > > +	help
> > > +	  This trace remote includes a ring-buffer writer implementation using
> > > +	  "simple_ring_buffer". This is solely intending for testing.
> > > +  
> > 
> > Nit, this should go up a few places so that it's with the other "test module" selections.
> 
> And when I tried to build it, I hit this:
> 
>   GEN     .vmlinux.objs
>   MODPOST Module.symvers
> ERROR: modpost: "simple_ring_buffer_reserve" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_commit" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_unload" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "trace_remote_free_buffer" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "trace_remote_alloc_buffer" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_init" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "trace_remote_register" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_reset" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_swap_reader_page" [kernel/trace/remote_test.ko] undefined!
> ERROR: modpost: "simple_ring_buffer_enable_tracing" [kernel/trace/remote_test.ko] undefined!
> WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)
> make[3]: *** [/work/git/linux-trace.git/scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[2]: *** [/work/git/linux-trace.git/Makefile:1960: modpost] Error 2
> make[1]: *** [/work/git/linux-trace.git/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/work/build/nobackup/debiantesting-x86-64'
> make: *** [Makefile:248: __sub-make] Error 2

And of course, I forgot to check CONFIG_REMOTE_TEST=M ...

The following snippet should do.

Do you want a v8 now (and with your previous comment) or shall I wait a bit more?

--

diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 0c023941a316..aa305be834f9 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -665,6 +665,7 @@ struct dentry *tracefs_create_file(const char *name, umode_t mode,
        fsnotify_create(d_inode(dentry->d_parent), dentry);
        return tracefs_end_creating(dentry);
 }
+EXPORT_SYMBOL_GPL(tracefs_create_file);
 
 static struct dentry *__create_dir(const char *name, struct dentry *parent,
                                   const struct inode_operations *ops)
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index c2ec6017c37c..02303161aab7 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -162,6 +162,7 @@ int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)
 
        return 0;
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_swap_reader_page);
 
 static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *cpu_buffer)
 {
@@ -267,6 +268,7 @@ void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned
 
        return &rb_event->array[1];
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
 
 void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer)
 {
@@ -280,6 +282,7 @@ void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer)
         */
        smp_store_release(&cpu_buffer->status, SIMPLE_RB_READY);
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_commit);
 
 static u32 simple_rb_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
@@ -337,6 +340,7 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 
        return 0;
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_reset);
 
 int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
                              struct simple_buffer_page *bpages,
@@ -427,6 +431,7 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 {
        return __simple_ring_buffer_init(cpu_buffer, bpages, desc, __load_page, __unload_page);
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
 
 void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
                                 void (*unload_page)(void *))
@@ -449,6 +454,7 @@ void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
 {
        return __simple_ring_buffer_unload(cpu_buffer, __unload_page);
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
 
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
@@ -459,3 +465,4 @@ int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool
 
        return 0;
 }
+EXPORT_SYMBOL_GPL(simple_ring_buffer_enable_tracing);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index dc6bc387ebca..e54cc3e75dc5 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -895,6 +895,7 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 
        return ret;
 }
+EXPORT_SYMBOL_GPL(trace_remote_register);
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
 {
@@ -910,6 +911,7 @@ void trace_remote_free_buffer(struct trace_buffer_desc *desc)
                        free_page(rb_desc->page_va[id]);
        }
 }
+EXPORT_SYMBOL_GPL(trace_remote_free_buffer);
 
 int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size, size_t buffer_size,
                              const struct cpumask *cpumask)
@@ -960,6 +962,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
        trace_remote_free_buffer(desc);
        return ret;
 }
+EXPORT_SYMBOL_GPL(trace_remote_alloc_buffer);
 
 static int
 trace_remote_enable_event(struct trace_remote *remote, struct remote_event *evt, bool enable)

