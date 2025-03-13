Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F43C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTXAnJRwaP5gnDFZv9RcGZleoH3O3LNs2YJZFBrUr3c=; b=UfNHWFJ3jQGbj7cEO8ukV3qcUa
	rX/d/g3cqcHjTEpYuTiCBYv4JRSjVi7yNwRwth7f1ypxnDLWwJDhb54w4MDDO1COfbs/sUGbK+2dS
	mTRvgWWB39lM278XPe952siHno95/hhW6J/+CcogLlyImDsRhqwH9cF0HbYzglfKKRI36k9ircND6
	yvH4Ivo17Va9HIseFH9PfxAW+tl9W9WEQs8sLqyhvLUJ/wYxhTkCFA7fIFvMObBX6cCWC9BnagXh3
	vLK2kjAYCb4DSCX3w1pJI/txMZS900ujRaPjPD8153RDW7NZWauqDmJuehke7Own8Lh0jBlHCjyGo
	f15RLvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoga-0000000CN3C-0IvG;
	Thu, 13 Mar 2025 19:57:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoeu-0000000CMxS-3Qpr;
	Thu, 13 Mar 2025 19:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B85B65C5F80;
	Thu, 13 Mar 2025 19:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5735BC4CEDD;
	Thu, 13 Mar 2025 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741895759;
	bh=fYqkeQRnWF5f+DKytRvz15lVWn76of85/QsqfnCc3FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tayN66tOOF6jMNqkZ5ePRkN7Ee8y31+K7eOP673REb6XV5zLOulLsRfo22a7MqFoR
	 r05dup9BfCoNTPi13Zt83sIUdU+jQp+O6qGxWwhxvO9rqtQzqhlgsYmC6J6o96heGe
	 tEZKHpS32417/8hRF8VY9nI86YAlkqCylsTC58mV+N6MaC89xKmr+Fw0aYT1thVWVD
	 kLLQq6AjOM3w5/E47TIz0UotatLlZ8zec9LhnkXbtISpJG7a5wnaa24YnUNxeOXM36
	 xdRBDo37cTFAdPfkCSrUG1AI/Z2PyR8BcDXtw87iq3W7zxnUfCSnwF40tvVk3JMEPq
	 vPcac02Z+5zwA==
Date: Thu, 13 Mar 2025 12:55:56 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 09/11] perf syscalltbl: Use lookup table containing
 multiple architectures
Message-ID: <Z9M4TIY9HstTLzNs@google.com>
References: <20250308003209.234114-1-irogers@google.com>
 <20250308003209.234114-10-irogers@google.com>
 <Z9MwQJ5bRu6-N43w@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9MwQJ5bRu6-N43w@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_125600_947445_E8A88096 
X-CRM114-Status: GOOD (  16.38  )
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

On Thu, Mar 13, 2025 at 04:21:36PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Mar 07, 2025 at 04:32:07PM -0800, Ian Rogers wrote:
> > Switch to use the lookup table containing all architectures rather
> > than tables matching the perf binary.
> > 
> > This fixes perf trace when executed on a 32-bit i386 binary on an
> > x86-64 machine. Note in the following the system call names of the
> > 32-bit i386 binary as seen by an x86-64 perf.
> > 
> 
> Reproduced the results here:
> 
> root@number:/home/acme/c# file faccessat2
> faccessat2: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, BuildID[sha1]=8dafcc1549658d57248dce883e8ec7eea3d6e8a5, for GNU/Linux 3.2.0, not stripped
> root@number:/home/acme/c#
> 
> root@number:/home/acme/c# strace ./faccessat2 |& head 
> execve("./faccessat2", ["./faccessat2"], 0x7ffce63265e0 /* 39 vars */) = 0
> [ Process PID=2552445 runs in 32 bit mode. ]
> brk(NULL)                               = 0x849a000
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf7fb3000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> statx(3, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, STATX_BASIC_STATS, {stx_mask=STATX_ALL|STATX_MNT_ID|STATX_SUBVOL, stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=85091, ...}) = 0
> mmap2(NULL, 85091, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf7f9e000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> root@number:/home/acme/c#
> 
> Before:
> 
> root@number:/home/acme/c# perf trace ./faccessat2 |& head
> faccessat2(123, (null), X_OK, AT_EACCESS | AT_SYMLINK_NOFOLLOW) = -1
>          ? (         ): faccessat2/2552543  ... [continued]: munmap())                                           = 0
>      0.024 ( 0.002 ms): faccessat2/2552543 recvfrom(ubuf: 0x2, size: 4159848428, flags: DONTROUTE|CTRUNC|TRUNC|DONTWAIT|EOR|WAITALL|FIN|SYN|CONFIRM|RST|ERRQUEUE|SOCK_DEVMEM|ZEROCOPY|FASTOPEN|CMSG_CLOEXEC|0x91f20000, addr: 0xe30, addr_len: 0xffcda98c) = 138993664
>      0.047 ( 0.006 ms): faccessat2/2552543 lgetxattr(name: "", value: 0x3, size: 34)                             = 4159602688
>      0.063 ( 0.003 ms): faccessat2/2552543 dup2(oldfd: -135160188, newfd: 4)                                     = -1 ENOENT (No such file or directory)
>      0.071 ( 0.023 ms): faccessat2/2552543 preadv(fd: 4294967196, vec: 0xf7f16420, vlen: 557056, pos_h: 4159848428) = 3
>      0.098 ( 0.004 ms): faccessat2/2552543 lgetxattr(name: "", value: 0x1, size: 2)                              = 4159516672
>      0.104 ( 0.001 ms): faccessat2/2552543 lstat(filename: "", statbuf: 0x14c63)                                 = 0
>      0.114 ( 0.004 ms): faccessat2/2552543 preadv(fd: 4294967196, vec: 0xf7ee8380, vlen: 557056, pos_h: 4159848428) = 3
>      0.118 ( 0.002 ms): faccessat2/2552543 close(fd: 3)                                                          = 512
> root@number:/home/acme/c# 
> 
> After:
> 
> root@number:/home/acme/c# perf trace ./faccessat2 |& head
> faccessat2(123, (null), X_OK, AT_EACCESS | AT_SYMLINK_NOFOLLOW) = -1
> sh: line 1: perf-read-vdso32: command not found
>          ? (         ): faccessat2/2556897  ... [continued]: execve())                                           = 0
>      0.028 ( 0.002 ms): faccessat2/2556897 brk()                                                                 = 0x8fe4000
>      0.068 ( 0.003 ms): faccessat2/2556897 access(filename: 0xf7ff2e84, mode: R)                                 = -1 ENOENT (No such file or directory)
>      0.080 ( 0.005 ms): faccessat2/2556897 openat(dfd: CWD, filename: "/etc/ld.so.cache", flags: RDONLY|CLOEXEC|LARGEFILE) = 3
>      0.094 ( 0.001 ms): faccessat2/2556897 close(fd: 3)                                                          = 0
>      0.103 ( 0.003 ms): faccessat2/2556897 openat(dfd: CWD, filename: "/lib/libc.so.6", flags: RDONLY|CLOEXEC|LARGEFILE) = 3
>      0.108 ( 0.002 ms): faccessat2/2556897 read(fd: 3, buf: 0xffdd84b0, count: 512)                              = 512
>      0.216 ( 0.001 ms): faccessat2/2556897 close(fd: 3)                                                          = 0
> root@number:/home/acme/c#
> 
> And interestingly the openat syscall got its contents obtained via the
> BPF augmenter... better to test this more thoroughly, but I think it
> should come after this series lands.

Right, I don't see the filename in openat() in my tests.

openat() is 295 on i386 and that's preadv() on x86_64 so BPF won't try
to augment the argument.  I wonder how it can get the filename.  But
anyway we can take a look later.

Thanks,
Namhyung


