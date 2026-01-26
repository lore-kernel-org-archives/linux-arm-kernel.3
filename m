Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F39ECF65CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku8hCC/KeIeBXZMKlasY4QhX+B4SFXs580a4fks1WRY=; b=TmeAE1yq2aUXsAQSZAbW/T2fD8
	CTM5c/kQAP6gaFb6s4S78eZcF/NSKJqxsu6tG0TSPXtXGShXnzWrnfkTsbAJiUflrlgGZ4Obz2rdt
	d0b7aZw/KOJszMRna/xbN13CyjOAtbZW5jZfgnEDcQSO2Ihjbtan6FRy8jM1HYxaa5V4LEfMRnR8/
	O481XDE0e07wQn1jPERGJ8dcrOJ7j7CUMI9WhjCz1g7BlmgzIeFygN56AVIlO3cyMJhk9c1ZWhg+f
	mQjUFtIU8Mf+wQS/DWbWvWHn/N7WKlYk7BU+G1JA3c20/hTZgXcypU4NtUaWM0AAYIwZerF7QcbC2
	ZC4C7M1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJCZ-0000000CEMJ-3bxK;
	Mon, 26 Jan 2026 09:48:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJCX-0000000CELZ-3V5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:48:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2572209f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420883; x=1770025683; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ku8hCC/KeIeBXZMKlasY4QhX+B4SFXs580a4fks1WRY=;
        b=DjTeeC8dGkCK+c6NIrT5gUeSygucphOnyxdVGwOBGyYb75IsTOC/0Jnd/3/uDi/5vU
         p8zzNwHHOIEN4MHyn1SLtbtsnz71WUQ0simMxHuXJXgmayeLQKpogS+XNYAQ1uZl7Mxf
         MRjFgBryqUEy7b9vDaMkRFzZncmMLCgb2LPbVn17bC13pfJe+VjraPhvXMsZ28bzm2mx
         2OKdCI8dkhXonGpwOTyu89uywZChB/AovzBxIqhGHD+zGNQFAC5EGt9RvVOl5OzkdKUb
         Ht3Rbmtkg2MKBgv9pBRGLsg9Mqwt6GNyaa/xNLyVElAIYcTcygvCzGmxSYsSalllz7Pz
         EkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420883; x=1770025683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ku8hCC/KeIeBXZMKlasY4QhX+B4SFXs580a4fks1WRY=;
        b=qdaMBow1guWujmzGjfgCSTyzJIk+QzrBvaGjgw9WOc02SGULfntruuB82mqrcvGxhU
         kaOhaZ3z6DEIY0aaTsA6dkGxbDJkh9p7cHW41sPfryA/5GHulxh0jOrzxp5tXhehMKda
         NdY36rzBjkV3SWUc+9tcoQT2G8nRR+4WMEzCjR1RJfW0R9NEL9DDfhTZ5WXzaMZsifn6
         /sgfITawWS3seL9+SjM91sjdcIu0LJUtbGw1yn0JMWxSKOOVliGzNOiAu1+hCDFbM8oM
         5ZBb3kdpkicywvhq3yD/DVDx/+MGSfUtPyvw8l+isOxreqLIawM7QHieaYFHZahzy7oS
         DeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFdppm8jo+DdSs9jk53yR2k3Tb2P5RG4v/exJuPe5qMN6weHflmy/ctJ7sQ9sji8gT0oKrp9YKELriqSXek2Ec@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1JmZ8rQESxQbbLb7YYDMLpADeAMgVQENXNnjrwLqQFbVW0SDS
	kV8oz6ZCC+Nv2QSObBaVHOsC7O9arawzzuvWTFbE4bGDPV5yAj9U4ZhC
X-Gm-Gg: AZuq6aLsjUPJ30jzI0tgLvs2GFi74SLNnwGViwD4UlE78FrsQfuMWhsuLonkAH+KYJ1
	XC77OtWcSTj/9+L/dY250HLdORyRo1u4KM4hTLSUGS72psfNCMF2qJ6gwGMqg7DY4EbLHWYQa8c
	d4ZE70B7DRgY4exS4mt0pe0+rEA4PgQblK9Y/d8jhEl9s495QQY463BfDjtBL8nLS3y2aWnR5FR
	7rWHBgZQErmlqNBKeqFz1xe/9Rzn7myfRL9WwfkVjKvLWsGGnIQwBjXlf8dmGSsqHwKuifW9rl6
	puXUU1NK0WXwEtz1Iw99GYBE2eODkdX+tN3MTo3NsXewOMHB4dyjybrx3LGKi+sHR4oDUtlwIL3
	13al1DHeTKggdzHk2zql9kazWv2Fk2v2dmpnb2HQ7DASV4fypOxGwmpPPU4dd
X-Received: by 2002:a05:6000:2403:b0:430:f97a:6f42 with SMTP id ffacd0b85a97d-435ca39c59bmr8042341f8f.54.1769420883063;
        Mon, 26 Jan 2026 01:48:03 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7b4d8sm27562381f8f.38.2026.01.26.01.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:48:02 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 26 Jan 2026 10:48:01 +0100
To: Steven Rostedt <rostedt@kernel.org>
Cc: Florent Revest <revest@google.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv6 bpf-next 0/9] ftrace,bpf: Use single direct ops for bpf
 trampolines
Message-ID: <aXc4UesvE3zYfPqn@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <CAEf4BzaRU0DoM9hHtW5Bm7njodfg06JzTOe=ABAqZ6iMjAt4iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzaRU0DoM9hHtW5Bm7njodfg06JzTOe=ABAqZ6iMjAt4iQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_014805_904487_C8B2B50F 
X-CRM114-Status: GOOD (  32.02  )
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

hi,
gentle ping, thanks

jirka

On Thu, Jan 15, 2026 at 10:54:09AM -0800, Andrii Nakryiko wrote:
> On Tue, Dec 30, 2025 at 6:50 AM Jiri Olsa <jolsa@kernel.org> wrote:
> >
> > hi,
> > while poking the multi-tracing interface I ended up with just one ftrace_ops
> > object to attach all trampolines.
> >
> > This change allows to use less direct API calls during the attachment changes
> > in the future code, so in effect speeding up the attachment.
> >
> > In current code we get a speed up from using just a single ftrace_ops object.
> >
> > - with current code:
> >
> >   Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c true':
> >
> >      6,364,157,902      cycles:k
> >        828,728,902      cycles:u
> >      1,064,803,824      instructions:u                   #    1.28  insn per cycle
> >     23,797,500,067      instructions:k                   #    3.74  insn per cycle
> >
> >        4.416004987 seconds time elapsed
> >
> >        0.164121000 seconds user
> >        1.289550000 seconds sys
> >
> >
> > - with the fix:
> >
> >    Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c true':
> >
> >      6,535,857,905      cycles:k
> >        810,809,429      cycles:u
> >      1,064,594,027      instructions:u                   #    1.31  insn per cycle
> >     23,962,552,894      instructions:k                   #    3.67  insn per cycle
> >
> >        1.666961239 seconds time elapsed
> >
> >        0.157412000 seconds user
> >        1.283396000 seconds sys
> >
> >
> >
> > The speedup seems to be related to the fact that with single ftrace_ops object
> > we don't call ftrace_shutdown anymore (we use ftrace_update_ops instead) and
> > we skip the synchronize rcu calls (each ~100ms) at the end of that function.
> >
> > rfc: https://lore.kernel.org/bpf/20250729102813.1531457-1-jolsa@kernel.org/
> > v1:  https://lore.kernel.org/bpf/20250923215147.1571952-1-jolsa@kernel.org/
> > v2:  https://lore.kernel.org/bpf/20251113123750.2507435-1-jolsa@kernel.org/
> > v3:  https://lore.kernel.org/bpf/20251120212402.466524-1-jolsa@kernel.org/
> > v4:  https://lore.kernel.org/bpf/20251203082402.78816-1-jolsa@kernel.org/
> > v5:  https://lore.kernel.org/bpf/20251215211402.353056-10-jolsa@kernel.org/
> >
> > v6 changes:
> > - rename add_hash_entry_direct to add_ftrace_hash_entry_direct [Steven]
> > - factor hash_add/hash_sub [Steven]
> > - add kerneldoc header for update_ftrace_direct_* functions [Steven]
> > - few assorted smaller fixes [Steven]
> > - added missing direct_ops wrappers for !CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >   case [Steven]
> >
> 
> So this looks good from BPF side, I think. Steven, if you don't mind
> giving this patch set another look and if everything is to your liking
> giving your ack, we can then apply it to bpf-next. Thanks!
> 
> > v5 changes:
> > - do not export ftrace_hash object [Steven]
> > - fix update_ftrace_direct_add new_filter_hash leak [ci]
> >
> > v4 changes:
> > - rebased on top of bpf-next/master (with jmp attach changes)
> >   added patch 1 to deal with that
> > - added extra checks for update_ftrace_direct_del/mod to address
> >   the ci bot review
> >
> > v3 changes:
> > - rebased on top of bpf-next/master
> > - fixed update_ftrace_direct_del cleanup path
> > - added missing inline to update_ftrace_direct_* stubs
> >
> > v2 changes:
> > - rebased on top fo bpf-next/master plus Song's livepatch fixes [1]
> > - renamed the API functions [2] [Steven]
> > - do not export the new api [Steven]
> > - kept the original direct interface:
> >
> >   I'm not sure if we want to melt both *_ftrace_direct and the new interface
> >   into single one. It's bit different in semantic (hence the name change as
> >   Steven suggested [2]) and I don't think the changes are not that big so
> >   we could easily keep both APIs.
> >
> > v1 changes:
> > - make the change x86 specific, after discussing with Mark options for
> >   arm64 [Mark]
> >
> > thanks,
> > jirka
> >
> >
> > [1] https://lore.kernel.org/bpf/20251027175023.1521602-1-song@kernel.org/
> > [2] https://lore.kernel.org/bpf/20250924050415.4aefcb91@batman.local.home/
> > ---
> > Jiri Olsa (9):
> >       ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
> >       ftrace: Make alloc_and_copy_ftrace_hash direct friendly
> >       ftrace: Export some of hash related functions
> >       ftrace: Add update_ftrace_direct_add function
> >       ftrace: Add update_ftrace_direct_del function
> >       ftrace: Add update_ftrace_direct_mod function
> >       bpf: Add trampoline ip hash table
> >       ftrace: Factor ftrace_ops ops_func interface
> >       bpf,x86: Use single ftrace_ops for direct calls
> >
> >  arch/x86/Kconfig        |   1 +
> >  include/linux/bpf.h     |   7 ++-
> >  include/linux/ftrace.h  |  31 +++++++++-
> >  kernel/bpf/trampoline.c | 259 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
> >  kernel/trace/Kconfig    |   3 +
> >  kernel/trace/ftrace.c   | 406 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
> >  6 files changed, 632 insertions(+), 75 deletions(-)
> >

