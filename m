Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE171C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/NGEpiao+5FFKVeDuEUem6OzsJVlejAUXMUh+wDaLY=; b=phUu2t+ejzNuHthbXp9YnolEgi
	2YRSuFAvpTQGcnPlnl25G06bBKqHMgxpT7fEo0GBG0bgTHbpUGfNJeH7+fzv9bNxH/YPzESxQIyvw
	mNVMwlLKGa24grROk6gFymcImgqzUBoQ0HTkUTPgGH6RSQUs/TxAsgIhonRjsk8gw6xd8BFvQD8t5
	N0ifmDicKJAuUP5CD2rOrM1KaOTA9v6+RaipT20sSuudcq4pZUscdZ1YU9oHU9IxTzqdi0sCAT+4z
	v7nawkog37oDROxVh1p0HpGdzmkNmMKzWM/Kyt/5lIQd+r6wzowRx0f58VoLqSA1A8yzAkN7W2C20
	5oJ9lGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspUS-0000000CTUi-08B1;
	Thu, 13 Mar 2025 20:49:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspSm-0000000CTCE-1rDz;
	Thu, 13 Mar 2025 20:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1A615C63CE;
	Thu, 13 Mar 2025 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F84C4CEE3;
	Thu, 13 Mar 2025 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741898851;
	bh=2ptC1nB6iTpHCXQhoIYsaJqR4EN2MYDh6QRC1rrBrkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S86SFHPbqyPRihfU9Y7jh/O6zioevBKixqE1TPy5bMBGmHfHBZTcHPwCx/Gp/Zz6w
	 VNqXIUsOj3U/N6x1SlqUhlBmovtn093k2m2XnJngfbW8nBo8TwRrsOtzp1Qw6GZE8z
	 c2RedR0TPA+fxCdhPPnaYO6vkW8OZAZI+Ys59HZ3qji6ekg1Rz4auRHl5TRqOABiL7
	 HEuZr7Ks7AqwVnJN907Wmqy2M05NTEqEBE64EV/3lZy2oIYD5JLsiGSA0a022UKzBg
	 CAUcSl4H5h+0LOeEL2QwUfXfmOPfWL9nqLkkPYggV2Akg16KuFa0QLWzzzSNxCNjx6
	 czilEh84yNZUQ==
Date: Thu, 13 Mar 2025 17:47:27 -0300
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
Message-ID: <Z9NEX3j_1RUvaFI0@x1>
References: <20250308003209.234114-1-irogers@google.com>
 <Z9KFLGpenwOP32q3@google.com>
 <Z9M24AJzui9lFbGo@x1>
 <Z9M9-YhDJg3NgiUy@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9M9-YhDJg3NgiUy@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_134732_570207_82428854 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Mar 13, 2025 at 05:20:09PM -0300, Arnaldo Carvalho de Melo wrote:
> Still building, but noticed this on x86_64:
> 
> 105: perf trace enum augmentation tests                              : FAILED!
> 106: perf trace BTF general tests                                    : FAILED!
> 107: perf trace exit race                                            : Ok
> 108: perf trace record and replay                                    : FAILED!
> 
> 
> The first doesn´t help that much with verbose mode, haven't checked if
> before this series it was failing :-\
> 
> root@x1:~# perf test -vvv 105
> 105: perf trace enum augmentation tests:
> --- start ---
> test child forked, pid 19411
> Checking if vmlinux exists
> Tracing syscall landlock_add_rule
> ---- end(-1) ----
> 105: perf trace enum augmentation tests                              : FAILED!
> root@x1:~#

So:

root@x1:~# perf trace -e landlock_add_rule perf test -w landlock
root@x1:~# 

But:

root@x1:~# perf trace perf test -w landlock |& grep landlock_add_rule
    26.120 ( 0.002 ms): perf/19791 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_PATH_BENEATH, rule_attr: 0x7ffde75e2680, flags: 45) = -1 EINVAL (Invalid argument)
    26.124 ( 0.001 ms): perf/19791 landlock_add_rule(ruleset_fd: 11, rule_type: LANDLOCK_RULE_NET_PORT, rule_attr: 0x7ffde75e2690, flags: 45) = -1 EINVAL (Invalid argument)
root@x1:~# 

-e is having some trouble, when no event is specified, then it works.

Something in the changes made to:

static int trace__parse_events_option(const struct option *opt, const char *str,
                                      int unset __maybe_unused)


- Arnaldo

More data:

root@x1:~# perf trace -vvv -e landlock_add_rule perf test -w landlock
Using CPUID GenuineIntel-6-BA-3
Opening: cpu/cycles/
------------------------------------------------------------
perf_event_attr:
  type                             0 (PERF_TYPE_HARDWARE)
  config                           0xa00000000 (cpu_atom/PERF_COUNT_HW_CPU_CYCLES/)
  disabled                         1
------------------------------------------------------------
sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8 = 27
Opening: cpu/cycles/
------------------------------------------------------------
perf_event_attr:
  type                             0 (PERF_TYPE_HARDWARE)
  config                           0x400000000 (cpu_core/PERF_COUNT_HW_CPU_CYCLES/)
  disabled                         1
------------------------------------------------------------
sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8 = 28
Opening: raw_syscalls:sys_enter
------------------------------------------------------------
perf_event_attr:
  type                             2 (PERF_TYPE_TRACEPOINT)
  size                             136
  config                           0x197 (raw_syscalls:sys_enter)
  { sample_period, sample_freq }   1
  sample_type                      IP|TID|TIME|ID|CPU|PERIOD|RAW
  read_format                      ID|LOST
  disabled                         1
  inherit                          1
  mmap                             1
  comm                             1
  enable_on_exec                   1
  task                             1
  sample_id_all                    1
  mmap2                            1
  comm_exec                        1
  ksymbol                          1
  bpf_event                        1
  { wakeup_events, wakeup_watermark } 1
------------------------------------------------------------
sys_perf_event_open: pid 19786  cpu 0  group_fd -1  flags 0x8 = 29
sys_perf_event_open: pid 19786  cpu 1  group_fd -1  flags 0x8 = 30
sys_perf_event_open: pid 19786  cpu 2  group_fd -1  flags 0x8 = 31
sys_perf_event_open: pid 19786  cpu 3  group_fd -1  flags 0x8 = 33
sys_perf_event_open: pid 19786  cpu 4  group_fd -1  flags 0x8 = 34
sys_perf_event_open: pid 19786  cpu 5  group_fd -1  flags 0x8 = 35
sys_perf_event_open: pid 19786  cpu 6  group_fd -1  flags 0x8 = 36
sys_perf_event_open: pid 19786  cpu 7  group_fd -1  flags 0x8 = 37
sys_perf_event_open: pid 19786  cpu 8  group_fd -1  flags 0x8 = 38
sys_perf_event_open: pid 19786  cpu 9  group_fd -1  flags 0x8 = 39
sys_perf_event_open: pid 19786  cpu 10  group_fd -1  flags 0x8 = 40
sys_perf_event_open: pid 19786  cpu 11  group_fd -1  flags 0x8 = 41
Opening: raw_syscalls:sys_exit
------------------------------------------------------------
perf_event_attr:
  type                             2 (PERF_TYPE_TRACEPOINT)
  size                             136
  config                           0x196 (raw_syscalls:sys_exit)
  { sample_period, sample_freq }   1
  sample_type                      IP|TID|TIME|ID|CPU|PERIOD|RAW
  read_format                      ID|LOST
  disabled                         1
  inherit                          1
  enable_on_exec                   1
  sample_id_all                    1
  { wakeup_events, wakeup_watermark } 1
------------------------------------------------------------
sys_perf_event_open: pid 19786  cpu 0  group_fd -1  flags 0x8 = 42
sys_perf_event_open: pid 19786  cpu 1  group_fd -1  flags 0x8 = 43
sys_perf_event_open: pid 19786  cpu 2  group_fd -1  flags 0x8 = 44
sys_perf_event_open: pid 19786  cpu 3  group_fd -1  flags 0x8 = 45
sys_perf_event_open: pid 19786  cpu 4  group_fd -1  flags 0x8 = 46
sys_perf_event_open: pid 19786  cpu 5  group_fd -1  flags 0x8 = 47
sys_perf_event_open: pid 19786  cpu 6  group_fd -1  flags 0x8 = 48
sys_perf_event_open: pid 19786  cpu 7  group_fd -1  flags 0x8 = 49
sys_perf_event_open: pid 19786  cpu 8  group_fd -1  flags 0x8 = 50
sys_perf_event_open: pid 19786  cpu 9  group_fd -1  flags 0x8 = 51
sys_perf_event_open: pid 19786  cpu 10  group_fd -1  flags 0x8 = 52
sys_perf_event_open: pid 19786  cpu 11  group_fd -1  flags 0x8 = 53
Opening: __augmented_syscalls__
------------------------------------------------------------
perf_event_attr:
  type                             1 (PERF_TYPE_SOFTWARE)
  size                             136
  config                           0xa (PERF_COUNT_SW_BPF_OUTPUT)
  { sample_period, sample_freq }   1
  sample_type                      IP|TID|TIME|ID|CPU|PERIOD|RAW
  read_format                      ID|LOST
  disabled                         1
  enable_on_exec                   1
  sample_id_all                    1
  { wakeup_events, wakeup_watermark } 1
------------------------------------------------------------
sys_perf_event_open: pid 19786  cpu 0  group_fd -1  flags 0x8 = 54
sys_perf_event_open: pid 19786  cpu 1  group_fd -1  flags 0x8 = 55
sys_perf_event_open: pid 19786  cpu 2  group_fd -1  flags 0x8 = 56
sys_perf_event_open: pid 19786  cpu 3  group_fd -1  flags 0x8 = 57
sys_perf_event_open: pid 19786  cpu 4  group_fd -1  flags 0x8 = 58
sys_perf_event_open: pid 19786  cpu 5  group_fd -1  flags 0x8 = 59
sys_perf_event_open: pid 19786  cpu 6  group_fd -1  flags 0x8 = 60
sys_perf_event_open: pid 19786  cpu 7  group_fd -1  flags 0x8 = 61
sys_perf_event_open: pid 19786  cpu 8  group_fd -1  flags 0x8 = 62
sys_perf_event_open: pid 19786  cpu 9  group_fd -1  flags 0x8 = 63
sys_perf_event_open: pid 19786  cpu 10  group_fd -1  flags 0x8 = 64
sys_perf_event_open: pid 19786  cpu 11  group_fd -1  flags 0x8 = 65
Problems reading syscall 156: 2 (No such file or directory)(_sysctl) information
Problems reading syscall 183: 2 (No such file or directory)(afs_syscall) information
Problems reading syscall 174: 2 (No such file or directory)(create_module) information
Problems reading syscall 214: 2 (No such file or directory)(epoll_ctl_old) information
Problems reading syscall 215: 2 (No such file or directory)(epoll_wait_old) information
Problems reading syscall 177: 2 (No such file or directory)(get_kernel_syms) information
Problems reading syscall 211: 2 (No such file or directory)(get_thread_area) information
Problems reading syscall 181: 2 (No such file or directory)(getpmsg) information
vmlinux BTF loaded
Problems reading syscall 212: 2 (No such file or directory)(lookup_dcookie) information
Problems reading syscall 180: 2 (No such file or directory)(nfsservctl) information
Problems reading syscall 182: 2 (No such file or directory)(putpmsg) information
Problems reading syscall 178: 2 (No such file or directory)(query_module) information
Problems reading syscall 185: 2 (No such file or directory)(security) information
Problems reading syscall 205: 2 (No such file or directory)(set_thread_area) information
Problems reading syscall 184: 2 (No such file or directory)(tuxcall) information
Problems reading syscall 134: 2 (No such file or directory)(uselib) information
Problems reading syscall 236: 2 (No such file or directory)(vserver) information
event qualifier tracepoint filter: id == 29098429
mmap size 528384B
libperf: mmap_per_cpu: nr cpu values 12 nr threads 1
libperf: idx 0: mmapping fd 29
<SNIP>
root@x1:~#

root@x1:~# cat /sys/kernel/tracing/events/syscalls/sys_enter_landlock_add_rule/id
1449
root@x1:~# perf trace -e landlock_add_rule perf test -w landlock
root@x1:~# strace -e landlock_add_rule perf test -w landlock
landlock_add_rule(11, LANDLOCK_RULE_PATH_BENEATH, {allowed_access=LANDLOCK_ACCESS_FS_READ_FILE, parent_fd=14}, 0x2d) = -1 EINVAL (Invalid argument)
landlock_add_rule(11, LANDLOCK_RULE_NET_PORT, {allowed_access=LANDLOCK_ACCESS_NET_CONNECT_TCP, port=19}, 0x2d) = -1 EINVAL (Invalid argument)
+++ exited with 0 +++
root@x1:~# 

root@x1:~# vim /tmp/build/perf-tools-next/trace/beauty/generated/syscalltbl.c
<SNIP>
static const char *const syscall_num_to_name_EM_X86_64[] = {
	[0] = "read",
	[1] = "write",
	[2] = "open",
<SNIP>
	[442] = "mount_setattr",
	[443] = "quotactl_fd",
	[444] = "landlock_create_ruleset",
	[445] = "landlock_add_rule",
	[446] = "landlock_restrict_self",
	[447] = "memfd_secret",
	[448] = "process_mrelease",
	[449] = "futex_waitv",
	[450] = "set_mempolicy_home_node",
<SNIP>
};
static const uint16_t syscall_sorted_names_EM_X86_64[] = {
	156,	/* _sysctl */
	43,	/* accept */
	288,	/* accept4 */
<SNIP>
	246,	/* kexec_load */
	250,	/* keyctl */
	62,	/* kill */
	445,	/* landlock_add_rule */
	444,	/* landlock_create_ruleset */
	446,	/* landlock_restrict_self */
	94,	/* lchown */
	192,	/* lgetxattr */
<SNIP>
};

<SNIP>

#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
       {
	      .num_to_name = syscall_num_to_name_EM_386,
	      .sorted_names = syscall_sorted_names_EM_386,
	      .e_machine = EM_386,
	      .num_to_name_len = ARRAY_SIZE(syscall_num_to_name_EM_386),
	      .sorted_names_len = ARRAY_SIZE(syscall_sorted_names_EM_386),
       },
       {
	      .num_to_name = syscall_num_to_name_EM_X86_64,
	      .sorted_names = syscall_sorted_names_EM_X86_64,
	      .e_machine = EM_X86_64,
	      .num_to_name_len = ARRAY_SIZE(syscall_num_to_name_EM_X86_64),
	      .sorted_names_len = ARRAY_SIZE(syscall_sorted_names_EM_X86_64),
       },
#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)

<SNIP>

