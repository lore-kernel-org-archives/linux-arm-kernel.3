Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 04:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tiyLSFhGQIazqS+RdeJFZkLmUgfPzgraQrJhFzcejdE=; b=X7moKSn2A1m9wMia0hP2doLFe4
	KDZonYgN+klyPAHpmzVzZMoRWrtAuhBWK/a4fw7jjMuS9W/26eM39TrF9zk4e3Un1QkkoxqWftAnp
	8+0WSheSWB/a9y1t7M+ARHhwo0JWs6OVFO5JcSqMuA+I9ulm5iZiJ9ffH7g74BYtf8UD/BiAGoga4
	CbVLspvrdB1HS41FqwIoxiJqkwZIP7ANANKQtAU96UMzXui5pjPWEG+lf4dFiE+WzXlx4fLgKHXpj
	ngM4plYqKOXxb1G3Dp3XjiAVAkFPjZHGkEogcuHldRPcjp/+1QA8a8MJq5auKUQ81e9t/y0fGPJOp
	TAvlmUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYyQ-00000003WDL-3PVw;
	Wed, 20 May 2026 04:56:02 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYyN-00000003WCa-0xJw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 04:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1779252959; x=1810788959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tiyLSFhGQIazqS+RdeJFZkLmUgfPzgraQrJhFzcejdE=;
  b=cuosfWBOC/axXhFqSpeUF7G1h5/25HcxsaEf4n5kBp7euGsMmlLhp/eg
   5RcyDN+Ar5cP9+7/aKJXJ9/mb6s/gg5kFeaxupj+ajgA6a9s3Wl/sjstl
   dfzTHnA7TJolId8KJnk+5fSYSnLAFehn8iV+LGuBSGYmKJAiSLBnA7L0p
   R3rnfcijDDYGc5m1Fry+P8WqY/oegjqQKIZHlzwqpwFaYJJ4meKN12Eok
   R/ScgjB6UdFwLQesXYa33aeUfIIoGOkJNugs9gTrWSMLRoDH4ugTyrJ83
   VNa3AsndnAHIPdrKVIQZ4QtgCch76a0W3sEIMDWZb4Bo8LmAD74qJ7JJz
   w==;
X-CSE-ConnectionGUID: jhBqsK8iRY2zcUyTZOJLbw==
X-CSE-MsgGUID: sCNdyvvCSVem+q/QxBnZjw==
X-IronPort-AV: E=Sophos;i="6.23,243,1770595200"; 
   d="scan'208";a="19854895"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:55:56 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:11695]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.131:2525] with esmtp (Farcaster)
 id cbe9bf8f-1c52-407e-9e5c-65f8468c83ec; Wed, 20 May 2026 04:55:56 +0000 (UTC)
X-Farcaster-Flow-ID: cbe9bf8f-1c52-407e-9e5c-65f8468c83ec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 20 May 2026 04:55:55 +0000
Received: from 80a9970eed1e.amazon.com (10.187.171.26) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 20 May 2026 04:55:54 +0000
From: Justinien Bouron <jbouron@amazon.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Ada Couprie Diaz
	<ada.coupriediaz@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, "Lorenzo
 Stoakes" <ljs@kernel.org>, Quentin Perret <qperret@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Justinien Bouron <jbouron@amazon.com>, Gunnar Kudrjavets
	<gunnarku@amazon.com>
Subject: [PATCH] arm64: Add user and kernel page-fault tracepoints
Date: Tue, 19 May 2026 21:55:24 -0700
Message-ID: <20260520045524.75670-1-jbouron@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.171.26]
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_215559_351665_618E7948 
X-CRM114-Status: GOOD (  12.05  )
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

Those tracepoints were made generic in commit 06aa9378df01
("x86/tracing, x86/mm: Move page fault tracepoints to generic"), call
them from arm64's page fault handling routine.

Signed-off-by: Justinien Bouron <jbouron@amazon.com>
Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
---
Benchmarking
============

Since the added code sits in the page-fault handling hot-path, I've also
ran some benchmarks to make sure this change is not accidentally
introducing a regression. All testing below was done on a c6g.metal EC2
instance (i.e. bare-metal) which is an ARM64 CPU with 64 cores and
128GiB of RAM.

First, a microbenchmark that maps anonymous memory and write to the
first four bytes of each page, thus running into page-fault for each
one:
```
#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>

int main(int argc, char **argv) {
    int npages = atoi(argv[1]);
    size_t size = npages * 4096;
    printf("pid = %d\n", getpid());
    char *p = mmap((void*)0xcafe0000,
            size,
            PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
            -1, 0);
    assert(p != MAP_FAILED);
    for (int i = 0; i < npages; i++)
        *(uint32_t *)(p + i * 4096) = 0xdeadbeef;
    munmap(p, size);
}
```

Compiled with: `gcc microbench.c -no-pie -o microbench` (GCC 15.2.0)

Before the change:
    $ hyperfine --runs 50 './microbench 100000'
    Benchmark 1: ./microbench 100000
      Time (mean +/- stddev):     174.3 ms +/-   3.4 ms    [User: 5.9 ms, System: 168.3 ms]
      Range (min ... max):   168.7 ms ... 185.1 ms    50 runs
After the change:
    $ hyperfine --runs 50 './microbench_orig 100000'
    Benchmark 1: ./microbench 100000
      Time (mean +/- stddev):     177.9 ms +/-   3.1 ms    [User: 6.3 ms, System: 171.6 ms]
      Range (min ... max):   173.3 ms ... 186.0 ms    50 runs

Second benchmark, linux kernel compilation benchmark with defconfig (on
commit 70390501):

Before the change:
    $ hyperfine --runs 3 --prepare 'make clean && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches' 'make -j65'
    Benchmark 1: make -j65
      Time (mean +/- stddev):     155.744 s +/-  2.767 s    [User: 6812.900 s, System: 1156.095 s]
      Range (min ... max):   153.709 s ... 158.895 s    3 runs

After the change:
    $ hyperfine --runs 3 --prepare 'make clean && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches' 'make -j65'
    Benchmark 1: make -j65
      Time (mean +/- stddev):     153.315 s +/-  0.179 s    [User: 6799.948 s, System: 1148.976 s]
      Range (min ... max):   153.119 s ... 153.471 s    3 runs

Testing
=======

Re-using the microbenchmark above, we can see the page-faults generated
by writing to each mmap'ed page (mmap'ed region starts at address
0xcafe0000):
```
$ sudo perf record -e exceptions:page_fault_user -- ./microbench 16
pid = 307352
[ perf record: Woken up 2 times to write data ]
[ perf record: Captured and wrote 0.015 MB perf.data (63 samples) ]
$ sudo perf script
      microbench  307352 [034] 29395.753387: exceptions:page_fault_user: address=0xfffff7fda640 ip=0xfffff7fda640 error_code=0x82000007
      microbench  307352 [034] 29395.753406: exceptions:page_fault_user: address=0xfffff7fff066 ip=0xfffff7fd60c4 error_code=0x92000007
      microbench  307352 [034] 29395.753407: exceptions:page_fault_user: address=0xfffff7fff066 ip=0xfffff7fd60cc error_code=0x9200004f
      microbench  307352 [034] 29395.753410: exceptions:page_fault_user: address=0xfffff7ffde28 ip=0xfffff7fd60d0 error_code=0x92000007
      microbench  307352 [034] 29395.753412: exceptions:page_fault_user: address=0xfffff7ffde70 ip=0xfffff7fd619c error_code=0x9200004f
      microbench  307352 [034] 29395.753416: exceptions:page_fault_user: address=0xfffff7fbeb38 ip=0xfffff7fd6304 error_code=0x92000007
      microbench  307352 [034] 29395.753419: exceptions:page_fault_user: address=0xfffff7ffcd28 ip=0xfffff7fd62f8 error_code=0x9200004f
      microbench  307352 [034] 29395.753422: exceptions:page_fault_user: address=0xffffffffeff0 ip=0xfffff7fcfa90 error_code=0x92000047
      microbench  307352 [034] 29395.753428: exceptions:page_fault_user: address=0xfffff7fe1b90 ip=0xfffff7fdc9b0 error_code=0x92000007
      microbench  307352 [034] 29395.753431: exceptions:page_fault_user: address=0x400040 ip=0xfffff7fd7160 error_code=0x92000007
      microbench  307352 [034] 29395.753432: exceptions:page_fault_user: address=0x41fdf8 ip=0xfffff7fd72f0 error_code=0x92000007
      microbench  307352 [034] 29395.753434: exceptions:page_fault_user: address=0xfffff7ffa020 ip=0xfffff7fd7548 error_code=0x92000007
      microbench  307352 [034] 29395.753437: exceptions:page_fault_user: address=0xfffff7ffb000 ip=0xfffff7fd7640 error_code=0x92000007
      microbench  307352 [034] 29395.753443: exceptions:page_fault_user: address=0xfffff7ff4008 ip=0xfffff7fc4848 error_code=0x92000047
      microbench  307352 [034] 29395.753446: exceptions:page_fault_user: address=0x41fec0 ip=0xfffff7fd7cd0 error_code=0x9200004f
      microbench  307352 [034] 29395.753464: exceptions:page_fault_user: address=0xfffff7fed000 ip=0xfffff7fd11c4 error_code=0x92000007
      microbench  307352 [034] 29395.753502: exceptions:page_fault_user: address=0xfffff7fa14d8 ip=0xfffff7fdcbe0 error_code=0x92000047
      microbench  307352 [034] 29395.753509: exceptions:page_fault_user: address=0xfffff7f9fa88 ip=0xfffff7fc54c0 error_code=0x92000007
      microbench  307352 [034] 29395.753512: exceptions:page_fault_user: address=0xfffff7f9fb20 ip=0xfffff7fc5534 error_code=0x9200004f
      microbench  307352 [034] 29395.753515: exceptions:page_fault_user: address=0xfffff7de02e0 ip=0xfffff7fc5704 error_code=0x92000006
      microbench  307352 [034] 29395.753519: exceptions:page_fault_user: address=0xfffff7f887c8 ip=0xfffff7fc4bb0 error_code=0x92000007
      microbench  307352 [034] 29395.753522: exceptions:page_fault_user: address=0xfffff7dffcef ip=0xfffff7fdc358 error_code=0x92000007
      microbench  307352 [034] 29395.753526: exceptions:page_fault_user: address=0xfffff7e01650 ip=0xfffff7fd027c error_code=0x92000007
      microbench  307352 [034] 29395.753530: exceptions:page_fault_user: address=0xfffff7ff5610 ip=0xfffff7fdcc10 error_code=0x92000047
      microbench  307352 [034] 29395.753534: exceptions:page_fault_user: address=0xfffff7f9d080 ip=0xfffff7fcb6a4 error_code=0x9200004f
      microbench  307352 [034] 29395.753538: exceptions:page_fault_user: address=0xfffff7f9e000 ip=0xfffff7fcb6fc error_code=0x9200004f
      microbench  307352 [034] 29395.753542: exceptions:page_fault_user: address=0xfffff7fa02d8 ip=0xfffff7fcb6a4 error_code=0x9200004f
      microbench  307352 [034] 29395.753568: exceptions:page_fault_user: address=0xfffff7e821c0 ip=0xfffff7e821c0 error_code=0x82000007
      microbench  307352 [034] 29395.753585: exceptions:page_fault_user: address=0xfffff7feb000 ip=0xfffff7fc1a40 error_code=0x92000047
      microbench  307352 [034] 29395.753594: exceptions:page_fault_user: address=0xfffff7f2b1e0 ip=0xfffff7f2b1e0 error_code=0x82000007
      microbench  307352 [034] 29395.753596: exceptions:page_fault_user: address=0xfffff7e1188c ip=0xfffff7e1188c error_code=0x82000007
      microbench  307352 [034] 29395.753597: exceptions:page_fault_user: address=0xfffff7fa7458 ip=0xfffff7f2b21c error_code=0x92000047
      microbench  307352 [034] 29395.753600: exceptions:page_fault_user: address=0xfffff7fade39 ip=0xfffff7f2b224 error_code=0x92000047
      microbench  307352 [034] 29395.753601: exceptions:page_fault_user: address=0xfffff7ecdd20 ip=0xfffff7ecdd20 error_code=0x82000007
      microbench  307352 [034] 29395.753603: exceptions:page_fault_user: address=0xfffff7fa6518 ip=0xfffff7f2b2a0 error_code=0x92000047
      microbench  307352 [034] 29395.753605: exceptions:page_fault_user: address=0xfffff7e6ec50 ip=0xfffff7e6ec50 error_code=0x82000007
      microbench  307352 [034] 29395.753607: exceptions:page_fault_user: address=0xfffff7fa2180 ip=0xfffff7e1c918 error_code=0x92000047
      microbench  307352 [034] 29395.753609: exceptions:page_fault_user: address=0xfffff7e7dac8 ip=0xfffff7e7dac8 error_code=0x82000007
      microbench  307352 [034] 29395.753623: exceptions:page_fault_user: address=0xfffff7ed6720 ip=0xfffff7ed6720 error_code=0x82000007
      microbench  307352 [034] 29395.753626: exceptions:page_fault_user: address=0xfffff7e28220 ip=0xfffff7e28220 error_code=0x82000007
      microbench  307352 [034] 29395.753627: exceptions:page_fault_user: address=0xfffff7f349e2 ip=0xfffff7e282b8 error_code=0x92000007
      microbench  307352 [034] 29395.753629: exceptions:page_fault_user: address=0xfffff7ead1c0 ip=0xfffff7ead1c0 error_code=0x82000007
      microbench  307352 [034] 29395.753631: exceptions:page_fault_user: address=0xfffff7e39e40 ip=0xfffff7e39e40 error_code=0x82000007
      microbench  307352 [034] 29395.753633: exceptions:page_fault_user: address=0xfffff7f453c4 ip=0xfffff7e37c58 error_code=0x92000007
      microbench  307352 [034] 29395.753635: exceptions:page_fault_user: address=0xfffff7f53412 ip=0xfffff7e2e788 error_code=0x92000007
      microbench  307352 [034] 29395.753636: exceptions:page_fault_user: address=0xfffff7e53bc0 ip=0xfffff7e53bc0 error_code=0x82000007
      microbench  307352 [034] 29395.753643: exceptions:page_fault_user: address=0x421008 ip=0xfffff7e7bbc8 error_code=0x92000047
      microbench  307352 [034] 29395.753658: exceptions:page_fault_user: address=0xcafe0000 ip=0x4008e4 error_code=0x92000045
      microbench  307352 [034] 29395.753663: exceptions:page_fault_user: address=0xcafe1000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753664: exceptions:page_fault_user: address=0xcafe2000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753666: exceptions:page_fault_user: address=0xcafe3000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753675: exceptions:page_fault_user: address=0xcafe4000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753676: exceptions:page_fault_user: address=0xcafe5000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753678: exceptions:page_fault_user: address=0xcafe6000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753679: exceptions:page_fault_user: address=0xcafe7000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753681: exceptions:page_fault_user: address=0xcafe8000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753682: exceptions:page_fault_user: address=0xcafe9000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753684: exceptions:page_fault_user: address=0xcafea000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753686: exceptions:page_fault_user: address=0xcafeb000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753687: exceptions:page_fault_user: address=0xcafec000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753689: exceptions:page_fault_user: address=0xcafed000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753691: exceptions:page_fault_user: address=0xcafee000 ip=0x4008e4 error_code=0x92000047
      microbench  307352 [034] 29395.753692: exceptions:page_fault_user: address=0xcafef000 ip=0x4008e4 error_code=0x92000047
```

IP 0x4008e4 corresponds to the instruction where the write to each page
is performed:
```
   4008c8:       b9402be0        ldr     w0, [sp, #40]
   4008cc:       53144c00        lsl     w0, w0, #12
   4008d0:       93407c00        sxtw    x0, w0
   4008d4:       f9401fe1        ldr     x1, [sp, #56]
   4008d8:       8b000020        add     x0, x1, x0
   4008dc:       5297dde1        mov     w1, #0xbeef                     // #48879
   4008e0:       72bbd5a1        movk    w1, #0xdead, lsl #16
=> 4008e4:       b9000001        str     w1, [x0]
   4008e8:       b9402be0        ldr     w0, [sp, #40]
   4008ec:       11000400        add     w0, w0, #0x1
   4008f0:       b9002be0        str     w0, [sp, #40]
   4008f4:       b9402be1        ldr     w1, [sp, #40]
   4008f8:       b9402fe0        ldr     w0, [sp, #44]
   4008fc:       6b00003f        cmp     w1, w0
   400900:       54fffe4b        b.lt    4008c8 <main+0x9c>  // b.tstop
```

First error_code when writing to the mmap'ed region is 0x92000045 which,
as expected, corresponds to user-mode, write fault, at page-table level
1 (see https://esr.arm64.dev/#0x92000045). Following faults have similar
error_code but for page-table level 3 fault
(https://esr.arm64.dev/#0x92000047).

For kernel page-faults, tested using tracepoints directly:
```
# echo 1 > events/exceptions/page_fault_kernel/enable
# echo test
test
# cat trace_pipe
    ps-307392  [028] ..... 29802.331281: page_fault_kernel: address=0xaaaaaaae0280 ip=__arch_clear_user error_code=0x96000044
    ps-307392  [028] ..... 29802.331303: page_fault_kernel: address=0xfffff7ffe8e4 ip=__arch_clear_user error_code=0x96000046
    ps-307392  [028] ..... 29802.331851: page_fault_kernel: address=0xfffff7f13360 ip=strncpy_from_user error_code=0x96000007
    ps-307392  [028] ..... 29802.349787: page_fault_kernel: address=0xaaaaaab23000 ip=__arch_copy_to_user error_code=0x96000047
    ...
```

---
 arch/arm64/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0f3c5c7ca054..e75cc0348e74 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -45,6 +45,9 @@
 #include <asm/traps.h>
 #include <asm/virt.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 struct fault_info {
 	int	(*fn)(unsigned long far, unsigned long esr,
 		      struct pt_regs *regs);
@@ -606,6 +609,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	int si_code;
 	int pkey = -1;
 
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, esr);
+	else
+		trace_page_fault_kernel(addr, regs, esr);
+
 	if (kprobe_page_fault(regs, esr))
 		return 0;
 
-- 
2.53.0


