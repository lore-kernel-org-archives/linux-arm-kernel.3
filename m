Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB46C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:References:Mime-Version:Message-Id:In-Reply-To:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOLo3ff4tsSmGxvkqov67GLLuAc6G77T9V0c5aNAOI0=; b=b86TMAcs9IgdX5VVaMuQNeHTsp
	z8rQBz65McZiT15FLEzHFri6U9AII9326V6CneAdIGh+P10xNtwJYJHeIEmN1oQqDt7XSEuT0700v
	1ikfI7FgbzbGgaaC9fsM1P6zrniEqd6OSLP3xq9w9fvYx0fVaLlzR+DewEG18m7WxEeVCEBuI1Uhp
	2gL82D+S9/ei1bRY6F+9a5n1uSGsHqoWJ2uK0mgisuZ6XWOfXW+YgkbQte5ZEz5B04xzzYo2y2rDX
	1GWSNAESWp4ylsm/Wnqol/DQXXdvuMjp/WyaC01c+8ogQRwDSz613c8t/ve8uIg88s21DjvYb+yP8
	N5D0fTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKhc-000000037O6-2jQL;
	Tue, 04 Mar 2025 05:20:24 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKSS-000000034iV-0DFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e5789a8458eso7842452276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064683; x=1741669483; darn=lists.infradead.org;
        h=content-transfer-encoding:to:from:subject:references:mime-version
         :message-id:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOLo3ff4tsSmGxvkqov67GLLuAc6G77T9V0c5aNAOI0=;
        b=KvU6TZdinFwxxUk597uTss2EsntiUXztKosYiTlIMoHtqqEgYI3bFWwc7vVvxi2FmO
         0au3AFSFtg7KptphXja1nIXM45zJxhgBzHiVkTmOParGEUMXWXWh/e8iLwA2nl7Ipvq2
         0OpAUgiVb04hTCP2M5EO+PSXjdoX9U/bLIH68qPHchrAuIdxdICEHspp2yr+HUrKg/Xk
         igqOeRj/85SLoaPzXzSXGa2apwyErgnYTi0+0NxRYHcyF1yopzSWdLe0MQu9afffjIzB
         7aUGsZT1M0Aiq1ynkK93+JL5JDXiR3ZIGet54Iy65RMx+L18ujMCDk742sCfAPpb2TTd
         5j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064683; x=1741669483;
        h=content-transfer-encoding:to:from:subject:references:mime-version
         :message-id:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zOLo3ff4tsSmGxvkqov67GLLuAc6G77T9V0c5aNAOI0=;
        b=IIM0T6OA4J0jMLulX1sy9riE8EOOb+VR/fxyKVM9BxP8ejCHaP7SeyEbsR3HTp+9um
         iaa0J6kYFGkGcxqcsfhTJo5O6y/WnWbIG6SW0CxoWcE+oqm0bYF+B3XiTWSPtCMOnDUl
         1ZiQqSj/T8TMheClv98FcuQLCML0f6NLW1GrWvo1RAxQl4f0VV4FTjq9SGtLB2s619xX
         ClXxxB4CX200jJ7uRIBDHQxfm2e5GpadFJCTJBZb/7BSkWnQKvD11tyZzmqnBTj+eZv2
         qp07f4q8Jzx01eL4+0vV2wKDBJXqaDsDMkDULt0qgsZF2JeqicYn1gI5VuPBYv+kyTJM
         mHew==
X-Forwarded-Encrypted: i=1; AJvYcCWWpacqxY1kpiF15EhTwRhZur5lW08FYwjGUeq7e5T0N0/hQ1MT2JD6ZF5oSAB1vJbQpLTsene7hjRxtl2oexIg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+NdEjGVpQFTC8mwqSfOF7cFmcvEVeLyjKNdX1f8YvUVK91d9Y
	SjRGMpn7IVYWCPrGoJ8oOxPQxZe3JjGLjZdVkXLX8Jm44IFbhJ9DLWn8Ltn8lhvZIoIl4UvHipw
	hIm7MaQ==
X-Google-Smtp-Source: AGHT+IHDpQzFmEeksdtLyg6Z1FH7mwoupzV8v5kd9qFbwdPXjK/L//92Jc4K6SpsjhnXX9GqOGYKZRpXl0at
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a25:b20e:0:b0:e5b:423e:4757 with SMTP id
 3f1490d57ef6-e60b2f37f2bmr1979128276.4.1741064682500; Mon, 03 Mar 2025
 21:04:42 -0800 (PST)
Date: Mon,  3 Mar 2025 21:03:03 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-10-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 09/11] perf syscalltbl: Use lookup table containing
 multiple architectures
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_210444_104747_526D82A3 
X-CRM114-Status: GOOD (  18.96  )
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

Switch to use the lookup table containing all architectures rather
than tables matching the perf binary.

This fixes perf trace when executed on a 32-bit i386 binary on an
x86-64 machine. Note in the following the system call names of the
32-bit i386 binary as seen by an x86-64 perf.

Before:
```
         ? (         ): a.out/447296  ... [continued]: munmap())           =
                                =3D 0
     0.024 ( 0.001 ms): a.out/447296 recvfrom(ubuf: 0x2, size: 4160585708, =
flags: DONTROUTE|CTRUNC|TRUNC|DONTWAIT|EOR|WAITALL|FIN|SYN|CONFIRM|RST|ERRQ=
UEUE|NOSIGNAL|WAITFORONE|BATCH|SOCK_DEVMEM|ZEROCOPY|FASTOPEN|CMSG_CLOEXEC|0=
x91f80000, addr: 0xe30, addr_len: 0xffce438c) =3D 1475198976
     0.042 ( 0.003 ms): a.out/447296 lgetxattr(name: "", value: 0x3, size: =
34)                             =3D 4160344064
     0.054 ( 0.003 ms): a.out/447296 dup2(oldfd: -134422744, newfd: 4)     =
                                =3D -1 ENOENT (No such file or directory)
     0.060 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct io=
vec){.iov_base =3D (void *)0x2e646c2f6374652f,.iov_len =3D (__kernel_size_t=
)7307199665335594867,}, vlen: 557056, pos_h: 4160585708) =3D 3
     0.074 ( 0.004 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size: =
2)                              =3D 4160237568
     0.080 ( 0.001 ms): a.out/447296 lstat(filename: "", statbuf: 0x193f6) =
                                =3D 0
     0.089 ( 0.007 ms): a.out/447296 preadv(fd: 4294967196, vec: (struct io=
vec){.iov_base =3D (void *)0x3833692f62696c2f,.iov_len =3D (__kernel_size_t=
)3276497845987585334,}, vlen: 557056, pos_h: 4160585708) =3D 3
     0.097 ( 0.002 ms): a.out/447296 close(fd: 3</proc/447296/status>)     =
                                =3D 512
     0.103 ( 0.002 ms): a.out/447296 lgetxattr(name: "", value: 0x1, size: =
2050)                           =3D 4157935616
     0.107 ( 0.007 ms): a.out/447296 lgetxattr(pathname: "", name: "", valu=
e: 0x5, size: 2066)             =3D 4158078976
     0.116 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", valu=
e: 0x1, size: 2066)             =3D 4159639552
     0.121 ( 0.003 ms): a.out/447296 lgetxattr(pathname: "", name: "", valu=
e: 0x3, size: 2066)             =3D 4160184320
     0.129 ( 0.002 ms): a.out/447296 lgetxattr(pathname: "", name: "", valu=
e: 0x3, size: 50)               =3D 4160196608
     0.138 ( 0.001 ms): a.out/447296 lstat(filename: "")                   =
                                =3D 0
     0.145 ( 0.002 ms): a.out/447296 mq_timedreceive(mqdes: 4291706800, u_m=
sg_ptr: 0xf7f9ea48, msg_len: 134616640, u_msg_prio: 0xf7fd7fec, u_abs_timeo=
ut: (struct __kernel_timespec){.tv_sec =3D (__kernel_time64_t)-578174027777=
317696,.tv_nsec =3D (long long int)4160349376,}) =3D 0
     0.148 ( 0.001 ms): a.out/447296 mkdirat(dfd: -134617816, pathname: " =
=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=E2=96=92=EF=BF=BD=EF=BF=BD=EF=BF=BD", mode: IFREG|ISUID|=
IRUSR|IWGRP|0xf7fd0000) =3D 447296
     0.150 ( 0.001 ms): a.out/447296 process_vm_writev(pid: -134617812, lve=
c: (struct iovec){.iov_base =3D (void *)0xf7f9e9c8f7f9e4c0,.iov_len =3D (__=
kernel_size_t)4160349376,}, liovcnt: 4160588048, rvec: (struct iovec){}, ri=
ovcnt: 4160585708, flags: 4291707352) =3D 0
     0.197 ( 0.004 ms): a.out/447296 capget(header: 4160184320, dataptr: 81=
92)                             =3D 0
     0.202 ( 0.002 ms): a.out/447296 capget(header: 1448669184, dataptr: 40=
96)                             =3D 0
     0.208 ( 0.002 ms): a.out/447296 capget(header: 4160577536, dataptr: 81=
92)                             =3D 0
     0.220 ( 0.001 ms): a.out/447296 getxattr(pathname: "", name: "c=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD", value: 0xf7f77e34, size:=
 1)  =3D 0
     0.228 ( 0.005 ms): a.out/447296 fchmod(fd: -134729728, mode: IRUGO|IWU=
GO|IFREG|IFIFO|ISVTX|IXUSR|0x10000) =3D 0
     0.240 ( 0.009 ms): a.out/447296 preadv(fd: 4294967196, vec: 0x5658e008=
, pos_h: 4160192052)            =3D 3
     0.250 ( 0.008 ms): a.out/447296 close(fd: 3</proc/447296/status>)     =
                                =3D 1436
     0.260 ( 0.018 ms): a.out/447296 stat(filename: "", statbuf: 0xffce32ac=
)                               =3D 1436
     0.288 (1000.213 ms): a.out/447296 readlinkat(buf: 0xffce31d4, bufsiz: =
4291703244)                       =3D 0
```

After:
```
         ? (         ): a.out/442930  ... [continued]: execve())           =
                                =3D 0
     0.023 ( 0.002 ms): a.out/442930 brk()                                 =
                                =3D 0x57760000
     0.052 ( 0.003 ms): a.out/442930 access(filename: 0xf7f5af28, mode: R) =
                                =3D -1 ENOENT (No such file or directory)
     0.059 ( 0.009 ms): a.out/442930 openat(dfd: CWD, filename: "/etc/ld.so=
.cache", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
     0.078 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)     =
                                =3D 0
     0.087 ( 0.007 ms): a.out/442930 openat(dfd: CWD, filename: "/lib/i386-=
linux-", flags: RDONLY|CLOEXEC|LARGEFILE) =3D 3
     0.095 ( 0.002 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf: =
0xffbdbb70, count: 512)         =3D 512
     0.135 ( 0.001 ms): a.out/442930 close(fd: 3</proc/442930/status>)     =
                                =3D 0
     0.148 ( 0.001 ms): a.out/442930 set_tid_address(tidptr: 0xf7f2b528)   =
                                =3D 442930 (a.out)
     0.150 ( 0.001 ms): a.out/442930 set_robust_list(head: 0xf7f2b52c, len:=
 12)                            =3D
     0.196 ( 0.004 ms): a.out/442930 mprotect(start: 0xf7f03000, len: 8192,=
 prot: READ)                    =3D 0
     0.202 ( 0.002 ms): a.out/442930 mprotect(start: 0x5658e000, len: 4096,=
 prot: READ)                    =3D 0
     0.207 ( 0.002 ms): a.out/442930 mprotect(start: 0xf7f63000, len: 8192,=
 prot: READ)                    =3D 0
     0.230 ( 0.005 ms): a.out/442930 munmap(addr: 0xf7f10000, len: 103414) =
                                =3D 0
     0.244 ( 0.010 ms): a.out/442930 openat(dfd: CWD, filename: 0x5658d008)=
                                =3D 3
     0.255 ( 0.007 ms): a.out/442930 read(fd: 3</proc/442930/status>, buf: =
0xffbdb67c, count: 4096)        =3D 1436
     0.264 ( 0.018 ms): a.out/442930 write(fd: 1</dev/pts/4>, buf: , count:=
 1436)                          =3D 1436
     0.292 (1000.173 ms): a.out/442930 clock_nanosleep(rqtp: { .tv_sec: 178=
66546940376776704, .tv_nsec: 4159878336 }, rmtp: 0xffbdb59c) =3D 0
  1000.478 (         ): a.out/442930 exit_group()                          =
                                =3D ?
```

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Howard Chu <howardchu95@gmail.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/util/syscalltbl.c | 89 ++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 25 deletions(-)

diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 760ac4d0869f..db0d2b81aed1 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -15,16 +15,39 @@
 #include <string.h>
 #include "string2.h"
=20
-#if __BITS_PER_LONG =3D=3D 64
-  #include <asm/syscalls_64.h>
-#else
-  #include <asm/syscalls_32.h>
-#endif
+#include "trace/beauty/generated/syscalltbl.c"
=20
-const char *syscalltbl__name(int e_machine __maybe_unused, int id)
+static const struct syscalltbl *find_table(int e_machine)
 {
-	if (id >=3D 0 && id <=3D (int)ARRAY_SIZE(syscall_num_to_name))
-		return syscall_num_to_name[id];
+	static const struct syscalltbl *last_table;
+	static int last_table_machine =3D EM_NONE;
+
+	/* Tables only exist for EM_SPARC. */
+	if (e_machine =3D=3D EM_SPARCV9)
+		e_machine =3D EM_SPARC;
+
+	if (last_table_machine =3D=3D e_machine && last_table !=3D NULL)
+		return last_table;
+
+	for (size_t i =3D 0; i < ARRAY_SIZE(syscalltbls); i++) {
+		const struct syscalltbl *entry =3D &syscalltbls[i];
+
+		if (entry->e_machine !=3D e_machine && entry->e_machine !=3D EM_NONE)
+			continue;
+
+		last_table =3D entry;
+		last_table_machine =3D e_machine;
+		return entry;
+	}
+	return NULL;
+}
+
+const char *syscalltbl__name(int e_machine, int id)
+{
+	const struct syscalltbl *table =3D find_table(e_machine);
+
+	if (table && id >=3D 0 && id < table->num_to_name_len)
+		return table->num_to_name[id];
 	return NULL;
 }
=20
@@ -41,38 +64,54 @@ static int syscallcmpname(const void *vkey, const void =
*ventry)
 	return strcmp(key->name, key->tbl[*entry]);
 }
=20
-int syscalltbl__id(int e_machine __maybe_unused, const char *name)
+int syscalltbl__id(int e_machine, const char *name)
 {
-	struct syscall_cmp_key key =3D {
-		.name =3D name,
-		.tbl =3D syscall_num_to_name,
-	};
-	const int *id =3D bsearch(&key, syscall_sorted_names,
-				ARRAY_SIZE(syscall_sorted_names),
-				sizeof(syscall_sorted_names[0]),
-				syscallcmpname);
+	const struct syscalltbl *table =3D find_table(e_machine);
+	struct syscall_cmp_key key;
+	const int *id;
+
+	if (!table)
+		return -1;
+
+	key.name =3D name;
+	key.tbl =3D table->num_to_name;
+	id =3D bsearch(&key, table->sorted_names, table->sorted_names_len,
+		     sizeof(table->sorted_names[0]), syscallcmpname);
=20
 	return id ? *id : -1;
 }
=20
-int syscalltbl__num_idx(int e_machine __maybe_unused)
+int syscalltbl__num_idx(int e_machine)
 {
-	return ARRAY_SIZE(syscall_sorted_names);
+	const struct syscalltbl *table =3D find_table(e_machine);
+
+	if (!table)
+		return 0;
+
+	return table->sorted_names_len;
 }
=20
-int syscalltbl__id_at_idx(int e_machine __maybe_unused, int idx)
+int syscalltbl__id_at_idx(int e_machine, int idx)
 {
-	return syscall_sorted_names[idx];
+	const struct syscalltbl *table =3D find_table(e_machine);
+
+	if (!table)
+		return -1;
+
+	assert(idx >=3D 0 && idx < table->sorted_names_len);
+	return table->sorted_names[idx];
 }
=20
-int syscalltbl__strglobmatch_next(int e_machine __maybe_unused, const char=
 *syscall_glob, int *idx)
+int syscalltbl__strglobmatch_next(int e_machine, const char *syscall_glob,=
 int *idx)
 {
-	for (int i =3D *idx + 1; i < (int)ARRAY_SIZE(syscall_sorted_names); ++i) =
{
-		const char *name =3D syscall_num_to_name[syscall_sorted_names[i]];
+	const struct syscalltbl *table =3D find_table(e_machine);
+
+	for (int i =3D *idx + 1; table && i < table->sorted_names_len; ++i) {
+		const char *name =3D table->num_to_name[table->sorted_names[i]];
=20
 		if (strglobmatch(name, syscall_glob)) {
 			*idx =3D i;
-			return syscall_sorted_names[i];
+			return table->sorted_names[i];
 		}
 	}
=20
--=20
2.48.1.711.g2feabab25a-goog


