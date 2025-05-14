Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC464C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B8s8wOZcQIedBiHD/XZ4OoWoxkT58SsoJWO7KKQ5g0=; b=jRqTaWtd1ZmE42CX9XjORQjUR5
	ZRNhuZnyEHLq0l522Pp4CbXotmvm0DijTyKZG+llx+deHHIp5mruWbymEAyEclkVlSOV0Es8VbAMG
	W/Bc+Hr0Ayy/rme6BLWAiujSAx9LsE66NXcPxEQl5caJ44+SV2AqL8CJL/A98kwQ/v2Xxnn24klaD
	g0nVBwAZ2UN6/F/bBBen0xI8jH7YfWKGcjU/R7MqaIOV1VNhWFPXp0MQUVjwWbDhbAaTww4cXsmzR
	luOn2l8KzTKfMqlHvOpgsywE2TLHm8Ajo1+bUwtE2XCUyfD7rkeHV3Yk8FR5KA+wuqpsq8YWJqy6S
	amOHBVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDc-0000000G5ar-2aEC;
	Wed, 14 May 2025 18:52:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGbw-0000000G0Yi-2O6K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 18:13:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a0b291093fso892452f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747246422; x=1747851222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+B8s8wOZcQIedBiHD/XZ4OoWoxkT58SsoJWO7KKQ5g0=;
        b=KRknhqHkghnzL9X/OMhPgi/Ua9/MXNxMd7AOmWovAdBd7OqrlhoYf+SKWUavD/u3Ff
         CafVAIM0ZwOg1k3/W4eAVOiD9QGtft8K9hugITLUaIu9VDc51JYR2zwHbiUHuyo2EpLK
         ZAA+yCxPkkLfCAL0zDzhKndhwVQ/sbw9pZxhhhE1wEQicmZzMMp4xQ8M3C42UaYv6xTq
         sIJxhPofY1lftqW3cKR7thXr36Gs0uK3h3/4tGl+HjoKbHS5J7sVsmdE3BkhVt9z/N4U
         dQnrPXNTNt7aiqkyjbJ4b4q6LPvayE0HY8DqwA7XMzwJoNx/HLTunmO4P3rb0x2fpHEu
         HdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747246422; x=1747851222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+B8s8wOZcQIedBiHD/XZ4OoWoxkT58SsoJWO7KKQ5g0=;
        b=eRqHhLz1CEEtB3U5Ul2/JvM2VhuZM04f+2Zpby0qjs0SNCmnvVpt59FzzZx4rWVZqW
         z7zi1BRIIngIZiYqDXs7iwTddEDNyPDJSEuGy2Am1GhAta1Ke+3xRWXzdlcvM4J8UNdg
         8EO+7BlRr71Guh4Ry4KZZlXfeqS5dvIbYmEyuOZiRU0/VtwEQJ33+8Zp3ID5FqZThKVo
         i5VqVd6o30FgfEWRi7Bb9soiSRWgLvaVzc7kBB8A+HsmS1qYVizAEOlSVBgWP9Y+4Sv6
         enU0ZWP9A8P8l5XNQS+frSFkHJrYXjo9VYFqnst8bEXrF2L/26XFyyashxC734vHeD9a
         TYiA==
X-Forwarded-Encrypted: i=1; AJvYcCXEnCcdsmk8wHLsna/cNgMQm+WizKpAZa644GkrJbIhhovyBsz9GSTr0BvcyzhB7o7TPQoX2wULCHBLJUflp8oo@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ+SL17I7SiCah4LGnaDkoGZF58i7pprsCqggWKPOct3Cgu7jn
	9rrMIFUS0zBync4xhvZe4SBKIbuLzemuE8XLrCxRECLsxqJDXUqGr/DMjSaq9w==
X-Gm-Gg: ASbGnct7WMkfmInfum15MgOjOah1HKjORm1mDsTRx/PeAXVNamW9iVkqnVwf06Yn/iv
	RXUnkeKCBGQhTcp0D9+0M7aYyprh2k+jw4e0ZDQeT7o01C2AIu+mud+YlfrmgqH7Hu2oXFRhma1
	ulSagNnZxH23uQQpMKpcWPkIOXbHyeavF3RrUWnSVgBVpjiSVH5jimXOdzxMuMDy9kq5+cKWCWK
	+nR5dJARUNHT024c9YagK1GjQ5/jsWHPXYCxkv6/fR1CkOj8L6pkWQARKg3Htk/x9354+YuWyQL
	+NZFa+H92gmzQ3Y0YgW5gt8DIX+hZgP/edT97Ef5iUddWDBh/ITtdKEDDjcZETVrnY7pVq4m7Xx
	qHWf+P3TWfPFu92UN
X-Google-Smtp-Source: AGHT+IFvClXcCFxtSP5/BJ1lEGzPWMtAqCzL3KhR0NmFK8QG8YRN7XnOJzzYM6av7qHYsTG1Y8cp+Q==
X-Received: by 2002:adf:fcc6:0:b0:3a0:9f24:774c with SMTP id ffacd0b85a97d-3a3511e0b62mr327856f8f.13.1747246421736;
        Wed, 14 May 2025 11:13:41 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf38sm20323930f8f.77.2025.05.14.11.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:13:41 -0700 (PDT)
Date: Wed, 14 May 2025 19:13:37 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/24] Tracefs support for pKVM
Message-ID: <aCTdUQRPjyhpYnmh@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250514133815.78bc2599@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514133815.78bc2599@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_111344_612377_108D2D39 
X-CRM114-Status: GOOD (  46.06  )
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

On Wed, May 14, 2025 at 01:38:15PM -0400, Steven Rostedt wrote:
> On Tue,  6 May 2025 17:47:56 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > The growing set of features supported by the hypervisor in protected
> > mode necessitates debugging and profiling tools. Tracefs is the
> > ideal candidate for this task:
> > 
> >   * It is simple to use and to script.
> > 
> >   * It is supported by various tools, from the trace-cmd CLI to the
> >     Android web-based perfetto.
> > 
> >   * The ring-buffer, where are stored trace events consists of linked
> >     pages, making it an ideal structure for sharing between kernel and
> >     hypervisor.
> > 
> > This series first introduces a new generic way of creating remote events and
> > remote buffers. Then it adds support to the pKVM hypervisor.
> > 
> > 1. ring-buffer
> > --------------
> > 
> > To setup the per-cpu ring-buffers, a new interface is created:
> > 
> >   ring_buffer_remote:	Describes what the kernel needs to know about the
> > 			remote writer, that is, the set of pages forming the
> > 			ring-buffer and a callback for the reader/head
> > 			swapping (enables consuming read)
> > 
> >   ring_buffer_remote():	Creates a read-only ring-buffer from a
> > 			ring_buffer_remote.
> > 
> > To keep the internals of `struct ring_buffer` in sync with the remote,
> > the meta-page is used. It was originally introduced to enable user-space
> > mapping of the ring-buffer [1]. In this case, the kernel is not the
> > producer anymore but the reader. The function to read that meta-page is:
> > 
> >   ring_buffer_poll_remote():
> > 			Update `struct ring_buffer` based on the remote
> > 			meta-page. Wake-up readers if necessary.
> > 
> > The kernel has to poll the meta-page to be notified of newly written
> > events.
> > 
> > 2. Tracefs
> > ----------
> > 
> > This series introduce a new trace_remote that does the link between
> > tracefs and the remote ring-buffer.
> > 
> > The interface is found in the remotes/ directory at the root of the
> > tracefs mount point. Each remote is like an instance and you'll find
> > there a subset of the regular Tracefs user-space interface:
> > 
> >   remotes/test/
> >      buffer_size_kb
> >      trace_clock
> >      trace_pipe
> >      trace
> >      per_cpu/
> >              cpuX/
> >                  trace
> >                  trace_pipe
> >      events/
> > 
> >             test/
> >                 selftest/
> >                           enable
> >                           id
> > 
> > Behind the scenes, kernel/trace/trace_remote.c creates this tracefs
> > hierarchy without relying on kernel/trace/trace.c. This is due to
> > fundamental differences:
> > 
> >   * Remote tracing doesn't support trace_array's system-specific
> >     features (snapshots, tracers, etc.).
> > 
> >   * Logged event formats differ (e.g., no PID for remote events).
> > 
> >   * Buffer operations require specific remote interactions.
> > 
> > 3. Simple Ring-Buffer
> > ---------------------
> > 
> > As the current ring-buffer.c implementation has too many dependencies to
> > be used directly by the pKVM hypervisor. A new simple implementation is
> > created and can be found in kernel/trace/simple-ring-buffer.c.
> > 
> > This implementation is write-only and is used by both the pKVM
> > hypervisor and a trace_remote test module.
> > 
> > 4. Events
> > ---------
> > 
> > A new REMOTE_EVENT() macro is added to simplify the creation of events
> > on the kernel side. As remote tracing buffer are read only, only the
> > event structure and a way of printing must be declared. The prototype of
> > the macro is very similar to the well-known TRACE_EVENT()
> > 
> >  REMOTE_EVENT(my_event, id,
> >      RE_STRUCT(
> >          re_field(u64, foobar)
> >      ),
> >      RE_PRINTK("foobar=%lld", __entry->foobar)
> >      )
> >   )
> > 
> > 5. pKVM
> > -------
> > 
> > The pKVM support simply creates a "hypervisor" trace_remote on the
> > kernel side and inherits from simple-ring-buffer.c on the hypervisor
> > side.
> > 
> > A new event macro is created HYP_EVENT() that is under the hood re-using
> > REMOTE_EVENT() (defined in the previous paragaph) as well as generate
> > hypervisor specific struct and trace_<event>() functions.
> > 
> > 5. Limitations:
> > ---------------
> > 
> > Non-consuming reading of the buffer isn't supported (i.e. cat trace ->
> > -EPERM) due to current the lack of support in the ring-buffer meta-page.
> > 
> > [1] https://tracingsummit.org/ts/2022/hypervisortracing/
> > [2] https://lore.kernel.org/all/20240510140435.3550353-1-vdonnefort@google.com/
> > 
> 
> BTW,  I tried to build this series and it fails.


Yes, appologies, I've started applying your comments today and I've figured out
I haven't tried building for x86.

I already have fixes locally for what's below.

I probably can send a v5 this week if you wish, unless you prefer to wait a bit
more for more comments?

> 
>   CALL    /work/git/test-linux.git/scripts/checksyscalls.sh
>   CC      kernel/trace/simple_ring_buffer.o
> In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
>                  from /work/git/test-linux.git/include/linux/compiler.h:390,
>                  from /work/git/test-linux.git/arch/x86/include/asm/atomic.h:5,
>                  from /work/git/test-linux.git/include/linux/atomic.h:7,
>                  from /work/git/test-linux.git/kernel/trace/simple_ring_buffer.c:7:
> /work/git/test-linux.git/kernel/trace/simple_ring_buffer.c: In function ‘simple_rb_move_tail’:
> /work/git/test-linux.git/include/asm-generic/rwonce.h:55:37: error: assignment to ‘struct list_head *’ from ‘long unsigned int’ makes pointer from integer without a cast [-Wint-conversion]
>    55 |         *(volatile typeof(x) *)&(x) = (val);                            \
>       |                                     ^
> /work/git/test-linux.git/include/asm-generic/rwonce.h:61:9: note: in expansion of macro ‘__WRITE_ONCE’
>    61 |         __WRITE_ONCE(x, val);                                           \
>       |         ^~~~~~~~~~~~
> /work/git/test-linux.git/arch/x86/include/asm/barrier.h:63:9: note: in expansion of macro ‘WRITE_ONCE’
>    63 |         WRITE_ONCE(*p, v);                                              \
>       |         ^~~~~~~~~~
> /work/git/test-linux.git/include/asm-generic/barrier.h:172:55: note: in expansion of macro ‘__smp_store_release’
>   172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
>       |                                                       ^~~~~~~~~~~~~~~~~~~
> /work/git/test-linux.git/kernel/trace/simple_ring_buffer.c:129:17: note: in expansion of macro ‘smp_store_release’
>   129 |                 smp_store_release(&new_tail->list.next,
>       |                 ^~~~~~~~~~~~~~~~~
> make[5]: *** [/work/git/test-linux.git/scripts/Makefile.build:203: kernel/trace/simple_ring_buffer.o] Error 1
> make[4]: *** [/work/git/test-linux.git/scripts/Makefile.build:461: kernel/trace] Error 2
> make[3]: *** [/work/git/test-linux.git/scripts/Makefile.build:461: kernel] Error 2
> make[2]: *** [/work/git/test-linux.git/Makefile:2004: .] Error 2
> make[1]: *** [/work/git/test-linux.git/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/work/build/trace/nobackup/debiantesting-x86-64'
> 
> Even when I fixed this, it then failed with the building of the sample module.
> 
> I think you need something like:
> 
> obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test_mod.o
> 
> remote_test_mod-y := simple_ring_buffer.o remote_test.o trace_remote.o
> 
> If the module needs more than one object file. Then the module should be
> called something that doesn't have a .c file and use that name with ".o" to
> add all the objects.
> 
> I think this could work, but this still had issues with functions not exported.
> 
> -- Steve

