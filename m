Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6618BE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvmGat6otqprLKYMChybNFttpzUR0NkosDvyxRyEY1k=; b=d7IDZmnM88s0vbaxRDBd5mlU2Y
	SuTvAn5jQP93CANlyODcM5XdkJ4aAFvjA2WHqps2ZUKOA8ngJLrvHeeqQTX25dRXJn8v8yDei3rk2
	7ez658/QGQ5c/tOSuP7KnqNssD4jD70WuzAHoM9ghe0smYt6efnbAU6CzEidvsIrYrEW6OvQMOu1g
	vgiADd7WsXPWECAJ7AIctxjFAgVFCpoXfNohQzTjlezdQcN/40rjhHX3k1RQdTNHLEWt+bT9Aqnnt
	/AvsmtTxafvfrux+Gtkh1kk3BVkoBujh6ZLbE263yHh5g0kB/SpPK4RvDVlkBgi2gsLz2q7E+4ebC
	NE91R0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0S3-0000000DPN1-3RjQ;
	Thu, 09 Jan 2025 21:52:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0Qo-0000000DOzO-20sc;
	Thu, 09 Jan 2025 21:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC9B65C5CC5;
	Thu,  9 Jan 2025 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C59C4CEE5;
	Thu,  9 Jan 2025 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736459469;
	bh=0x1L7px6GPDuN8m2XYejKWaY2IIWooxoAEoHV0V6Woc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6JeSpPBmvIKVy1aiaXseMKmL48kdpl1zcK4ql1QqBBn+kNNyPLZPO8aZme2NZukJ
	 YiCoQBT5HTYD0iErWGTusMGjWgIH6e1GmDPgrYDXxcCw4ib6o9fahInGGItWRgUuRP
	 bnxJ5ZHSeOgCFNb32NdoIMI8VQnfDI+s6pSm6K4MuFkYmKLZRnELrBi6jHur+Px00N
	 IHoRP0b/+Xkt86vziXDu55mu0FCOklUTrpqtiQ/py3BKro3MOUtLcrtH/HK89y8gIU
	 +FZ88rpN8hQRVkhT+pFUTbMWc0B9oYpxGwxUiPD7B3HGahhHMuNE3eSyckDn76exf7
	 czOJNAWpptSPw==
Date: Thu, 9 Jan 2025 18:51:06 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4BEygdXmofWBr0-@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4A2Y269Ffo0ERkS@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_135110_596756_05E4B082 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 09, 2025 at 05:49:42PM -0300, Arnaldo Carvalho de Melo wrote:
> BTW this series is already pushed out to perf-tools-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next

Hey, now I noticed that with this latest version we see:

⬢ [acme@toolbox perf-tools-next]$ m
make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
  BUILD:   Doing 'make -j28' parallel build
Warning: Kernel ABI header differences:
  diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h

Auto-detecting system features:
...                                   libdw: [ on  ]
...                                   glibc: [ on  ]
...                                  libbfd: [ on  ]
...                          libbfd-buildid: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                                 libperl: [ on  ]
...                               libpython: [ on  ]
...                               libcrypto: [ on  ]
...                               libunwind: [ on  ]
...                             libcapstone: [ on  ]
...                               llvm-perf: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                               get_cpuid: [ on  ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]

   /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,32,i386 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
   /home/acme/git/perf-tools-next/tools/perf/scripts/syscalltbl.sh  --abis common,64 /home/acme/git/perf-tools-next/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
  GEN     /tmp/build/perf-tools-next/common-cmds.h
  GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
  PERF_VERSION = 6.13.rc2.gd73982c39183
  GEN     perf-archive
  GEN     perf-iostat
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/


While with the previous one we would see something like SYSCALLTBL as
the step name, like we have GEN, MKDIR, etc, can you take a look?

All is out there in perf-tools-next.

- Arnaldo

