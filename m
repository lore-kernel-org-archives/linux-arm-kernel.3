Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9CDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yLdj0cmrC6cmm5my+2tCW7QYb/awxmk6AZD+bYmv5I=; b=OnIeJ0UEo3pFZ66ho8LFEwk50s
	JAZP8yMG6slJThhAZumFtUrD6rjjbgzssn0CSW9JRlo+LTD6vq4TZXl3cDbz6/3SGHPGDszDafO7+
	rjJrb747Nc2OOgsgL7yuU0WTEZ3DIWWaP0MCOpMZpQ9Ec+wcw8OCpveCx7m7VZ1sUjgMiG1QvYvhT
	lMYBuzmdi40FXsQhhwGfgw05B+FwN8R+50be1LxFKw0YX/RirvQIqUlat0zFUvSqfVUzFyGrsnkx1
	RexXLAkeyPT3NZHj2AA27Q0z4u4LhNmhtiCye2pW18IxGDFxzLvjroTpN59w/rVYIvb9iaRRuIN5L
	PiDLlGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHty-000000041Vi-0nnB;
	Mon, 17 Mar 2025 21:21:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHsH-000000041Nz-3MWx;
	Mon, 17 Mar 2025 21:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9E455C4CA0;
	Mon, 17 Mar 2025 21:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8C8C4CEE3;
	Mon, 17 Mar 2025 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742246392;
	bh=sJ6V7jkkaFv6f6/KnI1DYggtxUE5WU7pJdhow50px1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWCv+zb65t1erf7mNp1n3wlDSg7N1Ehr3MtQYr69qMkJx4fNJ9PsNwrjwE69hGJ3Q
	 y0c6PtQGJ9sZOHq564nBFC53Y03F56F5/t5PKQfLk7/EFiuvUKHPH4Lg3xMu6WHEkN
	 MP41himlDFtUSaLWdxHAH8lIBoz/00EqeX9VaIMZ59jFuxig/TycEOxsPy43dq7WEN
	 /XUwcJQWoGM6q4JMjDTiMcbE4nADwtjGimkee72dcNZZkRhPfjEgo17vQB2AQ1OqYO
	 dCtrOhP7C0RKkIYVtstp3RjOjs2YTICgixi7y9HsuY7KnSkdy16WlvZ8zz8G0cKaNn
	 ZOaRpmBdUssrA==
Date: Mon, 17 Mar 2025 18:19:50 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
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
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 00/11] perf: Support multiple system call tables in
 the build
Message-ID: <Z9iR9iocSKg0SPph@x1>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
 <Z9NEX3j_1RUvaFI0@x1>
 <Z9PCjQ8PhOadVGQ8@google.com>
 <Z9RjHpEJGWtj8PAM@x1>
 <Z9iKhwoj1GXvH4c9@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9iKhwoj1GXvH4c9@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_141953_947196_E0090DD8 
X-CRM114-Status: GOOD (  22.63  )
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

On Mon, Mar 17, 2025 at 05:48:10PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Mar 14, 2025 at 02:10:54PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, Mar 13, 2025 at 10:45:49PM -0700, Namhyung Kim wrote:
> > > On Thu, Mar 13, 2025 at 05:47:27PM -0300, Arnaldo Carvalho de Melo wrote:
> > > > On Thu, Mar 13, 2025 at 05:20:09PM -0300, Arnaldo Carvalho de Melo wrote:
> > > > > Still building, but noticed this on x86_64:
> > > > > 
> > > > > 105: perf trace enum augmentation tests                              : FAILED!
> > > > > 106: perf trace BTF general tests                                    : FAILED!
> > > > > 107: perf trace exit race                                            : Ok
> > > > > 108: perf trace record and replay                                    : FAILED!
> > > > > 
> > > > > 
> > > > > The first doesn´t help that much with verbose mode, haven't checked if
> > > > > before this series it was failing :-\
> > > > > 
> > > > > root@x1:~# perf test -vvv 105
> > > > > 105: perf trace enum augmentation tests:
> > > > > --- start ---
> > > > > test child forked, pid 19411
> > > > > Checking if vmlinux exists
> > > > > Tracing syscall landlock_add_rule
> > > > > ---- end(-1) ----
> > > > > 105: perf trace enum augmentation tests                              : FAILED!
> > > > > root@x1:~#
 
> This one is now ok:
 
>      0.004 ( 0.000 ms): perf/200342 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_NET_PORT, rule_attr: 0x7ffd649bd0d0, flags: 45) = -1 EINVAL (Invalid argument)
> root@number:~# perf test enum
> 105: perf trace enum augmentation tests                              : Ok
> root@number:~#
 
> now looking at:
 
> root@number:~# perf test -vvvvvvvvv 106
> 106: perf trace BTF general tests:
> --- start ---
> test child forked, pid 200467
> Checking if vmlinux BTF exists
> Testing perf trace's string augmentation
> String augmentation test failed
> ---- end(-1) ----
> 106: perf trace BTF general tests                                    : FAILED!
> root@number:~#
 
> No clue from the test, reading its source code now to see where it is
> failing to try and reproduce the problem.

root@number:~# rm -f /tmp/1234567 ; touch /tmp/1234567 ; perf trace -e renameat* --max-events=1 -- mv /tmp/1234567 /tmp/abcdefg
         ? (         ): mv/200698  ... [continued]: renameat2())                                        = -1 EEXIST (File exists)
root@number:~# 

At this point it works:

⬢ [acme@toolbox perf-tools-next]$ git log -1
commit 58f4f294b358861adaee68dfd19da1060058ec27 (HEAD)
Author: James Clark <james.clark@linaro.org>
Date:   Mon Jan 6 16:42:58 2025 +0000

    perf test trace_btf_general: Fix shellcheck warning


root@number:~# rm -f /tmp/1234567 ; touch /tmp/1234567 ; perf trace -e renameat* --max-events=1 -- mv /tmp/1234567 /tmp/abcdefg
     0.000 ( 0.006 ms): mv/218282 renameat2(olddfd: CWD, oldname: "/tmp/1234567", newdfd: CWD, newname: "/tmp/abcdefg", flags: NOREPLACE) = -1 EEXIST (File exists)
root@number:~#

Seems like some transient problem on this test machine, didn't manage to
bisect and now everything seems to work:

Well, not always :-\

root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : Ok
106: perf trace BTF general tests                                    : Ok
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : Ok
106: perf trace BTF general tests                                    : Ok
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test 105 106 107 108 
105: perf trace enum augmentation tests                              : Ok
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# for test in 105 106 107 108 ; do perf test $test ; done
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# for test in 105 106 107 108 ; do perf test $test ; done
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : FAILED!
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~#

So, overall, I think this should land and we should continue trying to
figure out how to find out about the above failure cases, probably the
perf trace cases, since they do set up BPF programs, etc should be done
serially?

Doesn't seem to be the case:

root@number:~# for test in 105 106 107 108 ; do perf test --sequential $test ; done
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : Ok
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# for test in 105 106 107 108 ; do perf test --sequential $test ; done
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : Ok
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# perf test --sequential 105 106 107 108
105: perf trace enum augmentation tests                              : FAILED!
106: perf trace BTF general tests                                    : Ok
107: perf trace exit race                                            : Ok
108: perf trace record and replay                                    : Ok
root@number:~# 

But then if that is the case it needs some love and care to deal with
other BPF users in the system, being more graceful in the face of
errors.

- Arnaldo

