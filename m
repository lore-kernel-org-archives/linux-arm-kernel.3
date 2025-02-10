Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E8C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXxJ1jFzWbWJEOO3pmkHS53hnSaPSIVREc8BxzJcJIQ=; b=tmhDjYzX39zKwuL3SthNVw7/3N
	XDnhSNUreukCpSNEG+caHpz/isCSYzKhXvNB2r3wG6mdIiSVWu/hx4K4up5jHdtRVbAkyKlCPFfze
	qUaKGaC4nfIb2XPycpi/oLtV+3hhx3utsWR2/ziHOgU6nVdzikW5yWArHNDiswZ8M0tTNDZetxpgF
	v/DWuNUoXNHafGzOi4KbZwZ4FLAyXOsYWozUFKrRZ7xlAh2mBtOzb/2FWaaAP7g/SbeVfsjC3wJfu
	+5/+AkNk3tKIjuAVG6oL2QfbEt7DdbehHcpzcZVus1yfn05BzSEtlE0faq4xL3y9bBwM4jAUOCNqL
	vTJ84Ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1theKY-000000020qF-2gbh;
	Tue, 11 Feb 2025 00:40:50 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdMv-00000001sNA-3hwD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 23:39:15 +0000
Received: by mail-yb1-xb44.google.com with SMTP id 3f1490d57ef6-e3983426f80so3800428276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 15:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739230753; x=1739835553; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXxJ1jFzWbWJEOO3pmkHS53hnSaPSIVREc8BxzJcJIQ=;
        b=HBnQGcJYdgMCXBc7raPJv63po0h8gwgY6Lp1h4ZzJC3eKEuExKhykvfw9SPEcBGaJO
         UoGIK7AQ753QlSIpmc7jfNttjkPRv8b7yAgrm2m0q6SjT4n7q2saxcWKUmZNFRc4nRXj
         8lS29ITEj2AfGSmDmeAW5EizwgQsTI7cRV+UTTqalrUbDFMrq0oWtCB2EabKz7+cT4q4
         RvI4pw+H5bKkHKn8+7yqTE/5E0JcyZ0v8v5MfWncg1HyMo5+XgL/0KM0b9obJn3JMC2T
         qpisgVrca3XaKnBZA74WLKPYzRhd0ozz0P5RZy85Oz0HqjB+3aEZBL3qn+Egtm7Rj+O9
         Lbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739230753; x=1739835553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXxJ1jFzWbWJEOO3pmkHS53hnSaPSIVREc8BxzJcJIQ=;
        b=QDdNRUGT7K3v3QMOb1Hasmx23GqsjlXJIsDI6y+NkhQg2ASk9znIDlugl8XKSORhYA
         5c3fe5BaaP1QuJ6YU/mA+hA5EXDI5Hw3+AivdNO7qPC2F/Dtb0FgCM3JO6cvY1My1+2P
         HV48Mc8zI+N/1uIZgbKR3g2WZ99i+LV4hrVjYVh1bkBo1FM9LWIOYPjynyiB3duQZkfC
         6pn5RUenOYdcO5lAcoEpO+UMEYY/brXxqvJBNMN3h+FNrSBtExwone59L8svRIyp25yO
         Gt3ho9R0PUVT1Jm4fnaabTL9/ycz4/0wOuYJw1z1PZb38/UakoU1Eay+6cb4jHQcsOAx
         7NDg==
X-Forwarded-Encrypted: i=1; AJvYcCWXUFxYjU9DmDo75Ub3vdLimRp/PjWBM/p1sWnZqfQdMTh2GtYn7kM89ja0851VNt//bGdTpJCahlO4zot3AfVa@lists.infradead.org
X-Gm-Message-State: AOJu0Yye1D4JdTm0GiNI/8VDDfKKGOLGi80wV6D/t7NzX1V0ReO8Iw1r
	KaM5WHFYJFkX1dH3qpWg8Az7GPCqybOBLMsMQg5XZ9VJDYDjaOlVmo9D2M/Xgzk=
X-Gm-Gg: ASbGnctMF2XkLi7LUItzGLHJ/qptSXjsXFhkmE4RwygfJmUy24ahaTN/SBMHu1Oa4hD
	OseDNXZgNSQxpveOed19WMR9d8N/hYx4sFGjeQSKK//Sg7PRBDQ/V2jjw5Ul2Wi5CBwE9IZ2HPZ
	r1qoYYFspWWDxjllSp5oboJlwi/y/s6pYcFvkUZFSWusDJch0O09zCUD3eZYaV+eirYPooB9aqA
	Ac+K03XuXQRbudeN1jTN3HPdA1jhzTyMOS8JKVKs8/NJ+MzqSIunc0jkg9LCZFCe7SLMZpEDxV3
	PKU=
X-Google-Smtp-Source: AGHT+IG71jAKEw7FJpT77SS9sjNFLR4JmA/QwoakSSs+2sWovO33XZJsi9MG3conuVTCN8p77CfPYQ==
X-Received: by 2002:a05:6902:2683:b0:e57:3e85:60f6 with SMTP id 3f1490d57ef6-e5b461c3296mr14877224276.27.1739230752604;
        Mon, 10 Feb 2025 15:39:12 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a45dbfcsm2898666276.38.2025.02.10.15.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:39:11 -0800 (PST)
Date: Mon, 10 Feb 2025 15:39:10 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/7] perf syscalltbl: Use lookup table containing
 multiple architectures
Message-ID: <Z6qOHi0D89o1pdQl@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-7-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210165108.95894-7-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_153914_116133_36EE4EA5 
X-CRM114-Status: GOOD (  31.29  )
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

On Mon, Feb 10, 2025 at 08:51:07AM -0800, Ian Rogers wrote:
> Switch to use the lookup table containing all architectures rather
> than tables matching the perf binary.
> 
> This fixes perf trace when executed on a 32-bit i386 binary on an
> x86-64 machine. Note in the following the system call names of the
> 32-bit i386 binary as seen by an x86-64 perf.
> 
> Before:
> ```
>          ? (         ): a.out/447296  ... [continued]: munmap())                                           = 0
>      0.024 ( 0.001 ms): a.out/447296 recvfrom(ubuf: 0x2, size: 4160585708, flags: DONTROUTE|CTRUNC|TRUNC|DONTWAIT|EOR|WAITALL|FIN|SYN|CONFIRM|RST|ERRQUEUE|NOSIGNAL|WAITFORONE|BATCH|SOCK_DEVMEM|ZEROCOPY|FASTOPEN|CMSG_CLOEXEC|0x91f80000, addr: 0xe30, addr_len: 0xffce438c) = 1475198976
>      0.042 ( 0.003 ms): a.out/447296 lgetxattr(name: "", value: 0x3, size: 34)                             = 4160344064
>      0.054 ( 0.003 ms): a.out/447296 dup2(oldfd: -134422744, newfd: 4)                                     = -1 ENOENT (No such file or directory)
>      0.060 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct iovec){.iov_base = (void *)0x2e646c2f6374652f,.iov_len = (__kernel_size_t)7307199665335594867,}, vlen: 557056, pos_h: 4160585708) = 3
>      0.074 ( 0.004 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size: 2)                              = 4160237568
>      0.080 ( 0.001 ms): a.out/447296 lstat(filename: "", statbuf: 0x193f6)                                 = 0
>      0.089 ( 0.007 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct iovec){.iov_base = (void *)0x3833692f62696c2f,.iov_len = (__kernel_size_t)3276497845987585334,}, vlen: 557056, pos_h: 4160585708) = 3
>      0.097 ( 0.002 ms): a.out/447296 close(fd: 3</proc/447296/status>)                                     = 512
>      0.103 ( 0.002 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size: 2050)                           = 4157935616
>      0.107 ( 0.007 ms): a.out/447296 lgetxattr(pathname: "", name: "", value: 0x5, size: 2066)             = 4158078976
>      0.116 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", value: 0x1, size: 2066)             = 4159639552
>      0.121 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", value: 0x3, size: 2066)             = 4160184320
>      0.129 ( 0.002 ms): a.out/447296 lgetxattr(pathname: "", name: "", value: 0x3, size: 50)               = 4160196608
>      0.138 ( 0.001 ms): a.out/447296 lstat(filename: "")                                                   = 0
>      0.145 ( 0.002 ms): a.out/447296 mq_timedreceive(mqdes: 4291706800, u_msg_ptr: 0xf7f9ea48, msg_len: 134616640, u_msg_prio: 0xf7fd7fec, u_abs_timeout: (struct __kernel_timespec){.tv_sec = (__kernel_time64_t)-578174027777317696,.tv_nsec = (long long int)4160349376,}) = 0
>      0.148 ( 0.001 ms): a.out/447296 mkdirat(dfd: -134617816, pathname: " ��� ���▒���▒���", mode: IFREG|ISUID|IRUSR|IWGRP|0xf7fd0000) = 447296
>      0.150 ( 0.001 ms): a.out/447296 process_vm_writev(pid: -134617812, lvec: (struct iovec){.iov_base = (void *)0xf7f9e9c8f7f9e4c0,.iov_len = (__kernel_size_t)4160349376,}, liovcnt: 4160588048, rvec: (struct iovec){}, riovcnt: 4160585708, flags: 4291707352) = 0
>      0.197 ( 0.004 ms): a.out/447296 capget(header: 4160184320, dataptr: 8192)                             = 0
>      0.202 ( 0.002 ms): a.out/447296 capget(header: 1448669184, dataptr: 4096)                             = 0
>      0.208 ( 0.002 ms): a.out/447296 capget(header: 4160577536, dataptr: 8192)                             = 0
>      0.220 ( 0.001 ms): a.out/447296 getxattr(pathname: "", name: "c������", value: 0xf7f77e34, size: 1)  = 0
>      0.228 ( 0.005 ms): a.out/447296 fchmod(fd: -134729728, mode: IRUGO|IWUGO|IFREG|IFIFO|ISVTX|IXUSR|0x10000) = 0
>      0.240 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: 0x5658e008, pos_h: 4160192052)            = 3
>      0.250 ( 0.008 ms): a.out/447296 close(fd: 3</proc/447296/status>)                                     = 1436
>      0.260 ( 0.018 ms): a.out/447296 stat(filename: "", statbuf: 0xffce32ac)                               = 1436
>      0.288 (1000.213 ms): a.out/447296 readlinkat(buf: 0xffce31d4, bufsiz: 4291703244)                       = 0
> ```
> 
> After:
> ```
>          ? (         ): a.out/442930  ... [continued]: execve())                                           = 0
>      0.023 ( 0.002 ms): a.out/442930 brk()                                                                 = 0x57760000
>      0.052 ( 0.003 ms): a.out/442930 access(filename: 0xf7f5af28, mode: R)                                 = -1 ENOENT (No such file or directory)
>      0.059 ( 0.009 ms): a.out/442930 openat(dfd: CWD, filename: "/etc/ld.so.cache", flags: RDONLY|CLOEXEC|LARGEFILE) = 3
>      0.078 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)                                     = 0
>      0.087 ( 0.007 ms): a.out/442930 openat(dfd: CWD, filename: "/lib/i386-linux-", flags: RDONLY|CLOEXEC|LARGEFILE) = 3
>      0.095 ( 0.002 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf: 0xffbdbb70, count: 512)         = 512
>      0.135 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)                                     = 0
>      0.148 ( 0.001 ms): a.out/442930 set_tid_address(tidptr: 0xf7f2b528)                                   = 442930 (a.out)
>      0.150 ( 0.001 ms): a.out/442930 set_robust_list(head: 0xf7f2b52c, len: 12)                            =
>      0.196 ( 0.004 ms): a.out/442930 mprotect(start: 0xf7f03000, len: 8192, prot: READ)                    = 0
>      0.202 ( 0.002 ms): a.out/442930 mprotect(start: 0x5658e000, len: 4096, prot: READ)                    = 0
>      0.207 ( 0.002 ms): a.out/442930 mprotect(start: 0xf7f63000, len: 8192, prot: READ)                    = 0
>      0.230 ( 0.005 ms): a.out/442930 munmap(addr: 0xf7f10000, len: 103414)                                 = 0
>      0.244 ( 0.010 ms): a.out/442930 openat(dfd: CWD, filename: 0x5658d008)                                = 3
>      0.255 ( 0.007 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf: 0xffbdb67c, count: 4096)        = 1436
>      0.264 ( 0.018 ms): a.out/442930 write(fd: 1</dev/pts/4>, buf: , count: 1436)                          = 1436
>      0.292 (1000.173 ms): a.out/442930 clock_nanosleep(rqtp: { .tv_sec: 17866546940376776704, .tv_nsec: 4159878336 }, rmtp: 0xffbdb59c) = 0
>   1000.478 (         ): a.out/442930 exit_group()                                                          = ?
> ```
> 

I think I am conflating some things in my mind here. This change doesn't
impact perf report does it? perf report reports syscall numbers only,
but it could be hooked up into this change to correctly report the
correct syscall name from a perf.data generated on any architecture?

I believe that question is tangential to this patch but let me know!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/util/syscalltbl.c | 89 ++++++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 25 deletions(-)
> 
> diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
> index 760ac4d0869f..db0d2b81aed1 100644
> --- a/tools/perf/util/syscalltbl.c
> +++ b/tools/perf/util/syscalltbl.c
> @@ -15,16 +15,39 @@
>  #include <string.h>
>  #include "string2.h"
>  
> -#if __BITS_PER_LONG == 64
> -  #include <asm/syscalls_64.h>
> -#else
> -  #include <asm/syscalls_32.h>
> -#endif
> +#include "trace/beauty/generated/syscalltbl.c"
>  
> -const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> +static const struct syscalltbl *find_table(int e_machine)
>  {
> -	if (id >= 0 && id <= (int)ARRAY_SIZE(syscall_num_to_name))
> -		return syscall_num_to_name[id];
> +	static const struct syscalltbl *last_table;
> +	static int last_table_machine = EM_NONE;
> +
> +	/* Tables only exist for EM_SPARC. */
> +	if (e_machine == EM_SPARCV9)
> +		e_machine = EM_SPARC;
> +
> +	if (last_table_machine == e_machine && last_table != NULL)
> +		return last_table;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(syscalltbls); i++) {
> +		const struct syscalltbl *entry = &syscalltbls[i];
> +
> +		if (entry->e_machine != e_machine && entry->e_machine != EM_NONE)
> +			continue;
> +
> +		last_table = entry;
> +		last_table_machine = e_machine;
> +		return entry;
> +	}
> +	return NULL;
> +}
> +
> +const char *syscalltbl__name(int e_machine, int id)
> +{
> +	const struct syscalltbl *table = find_table(e_machine);
> +
> +	if (table && id >= 0 && id < table->num_to_name_len)
> +		return table->num_to_name[id];
>  	return NULL;
>  }
>  
> @@ -41,38 +64,54 @@ static int syscallcmpname(const void *vkey, const void *ventry)
>  	return strcmp(key->name, key->tbl[*entry]);
>  }
>  
> -int syscalltbl__id(int e_machine __maybe_unused, const char *name)
> +int syscalltbl__id(int e_machine, const char *name)
>  {
> -	struct syscall_cmp_key key = {
> -		.name = name,
> -		.tbl = syscall_num_to_name,
> -	};
> -	const int *id = bsearch(&key, syscall_sorted_names,
> -				ARRAY_SIZE(syscall_sorted_names),
> -				sizeof(syscall_sorted_names[0]),
> -				syscallcmpname);
> +	const struct syscalltbl *table = find_table(e_machine);
> +	struct syscall_cmp_key key;
> +	const int *id;
> +
> +	if (!table)
> +		return -1;
> +
> +	key.name = name;
> +	key.tbl = table->num_to_name;
> +	id = bsearch(&key, table->sorted_names, table->sorted_names_len,
> +		     sizeof(table->sorted_names[0]), syscallcmpname);
>  
>  	return id ? *id : -1;
>  }
>  
> -int syscalltbl__num_idx(int e_machine __maybe_unused)
> +int syscalltbl__num_idx(int e_machine)
>  {
> -	return ARRAY_SIZE(syscall_sorted_names);
> +	const struct syscalltbl *table = find_table(e_machine);
> +
> +	if (!table)
> +		return 0;
> +
> +	return table->sorted_names_len;
>  }
>  
> -int syscalltbl__id_at_idx(int e_machine __maybe_unused, int idx)
> +int syscalltbl__id_at_idx(int e_machine, int idx)
>  {
> -	return syscall_sorted_names[idx];
> +	const struct syscalltbl *table = find_table(e_machine);
> +
> +	if (!table)
> +		return -1;
> +
> +	assert(idx >= 0 && idx < table->sorted_names_len);
> +	return table->sorted_names[idx];
>  }
>  
> -int syscalltbl__strglobmatch_next(int e_machine __maybe_unused, const char *syscall_glob, int *idx)
> +int syscalltbl__strglobmatch_next(int e_machine, const char *syscall_glob, int *idx)
>  {
> -	for (int i = *idx + 1; i < (int)ARRAY_SIZE(syscall_sorted_names); ++i) {
> -		const char *name = syscall_num_to_name[syscall_sorted_names[i]];
> +	const struct syscalltbl *table = find_table(e_machine);
> +
> +	for (int i = *idx + 1; table && i < table->sorted_names_len; ++i) {
> +		const char *name = table->num_to_name[table->sorted_names[i]];
>  
>  		if (strglobmatch(name, syscall_glob)) {
>  			*idx = i;
> -			return syscall_sorted_names[i];
> +			return table->sorted_names[i];
>  		}
>  	}
>  
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

