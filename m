Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27E0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YXXgpvbN08bPPlqF8m3WXG5KfKhy154HeLasqpKc2o=; b=z/mg9sQinRxhXZ
	yi+CYlvkSk+CzM8spqIQJOLvwKRd749QahOaGxTeq/VwKZgz509ic4S0KSGB5oSGswKje1cqGR2P0
	9bfhrbN7cxEWUou+ePr+XuNX18OLDHuhrAvnZyAwzp/EO9rJsg2AG+asWVkLd5Glc6u0PN4oaGs2q
	T3QtSRJF0mVu7tOYmV1d68heSWaW/YNju7O0d1KYYXdnIr3HIiYKfs7K9z4zUO7iQdoMfDz2cCymq
	/Rjl501AhBAIR13oe6lLwNuHG/7Zb5m4Za/iI9rM47jjo+LJZVnjUXymgp05D3L39lUcBxJDwyb2f
	IkvFt6wKiBLzDaYb4v/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErT5-0000000CltL-0jUb;
	Tue, 13 May 2025 15:22:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErPn-0000000CkwB-19ji
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:19:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 713D11688;
	Tue, 13 May 2025 08:19:19 -0700 (PDT)
Received: from [10.1.34.195] (e137867.arm.com [10.1.34.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E63933F63F;
	Tue, 13 May 2025 08:19:28 -0700 (PDT)
Message-ID: <068c3ea3-2de3-4e5e-99c1-09a9668b80da@arm.com>
Date: Tue, 13 May 2025 16:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] arm64: debug: remove hook registration, split
 exception entry
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <aCM6KOHu2i0NqaBC@uudg.org>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aCM6KOHu2i0NqaBC@uudg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_081931_412106_691EBAF4 
X-CRM114-Status: GOOD (  29.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Re-sending with proper text format, apologies for the noise...

On 13/05/2025 13:25, Luis Claudio R. Goncalves wrote:

> On Mon, May 12, 2025 at 06:43:15PM +0100, Ada Couprie Diaz wrote:
>> [...]
>>
>> Single Step Exception
>> ===
>>
>> Of note, this allows us to make the single exception handling mostly
>> preemptible coming from EL0 in patch 7, fixing an issue with PREEMPT_RT[0].
>> The commit message details the reasoning on why this should be safe.
>> It is *definitely* not preemptible at EL1 in the current state, given
>> that the EL1 software step exception is handled by KGDB.
>>
>> CC-ing Luis and Sebastian as they were active on the original bug report.
> I have been running the ssdd test in a tight loop on a kernel with your
> patches and PREEMPT_RT enabled, on two different aarch64 boxes (8 cores and
> 144 cores). So far, so good. The patch series seems to have solved the
> problem I reported.
>
> For the first 10h of tests the kernel also had LOCKDEP and locking debug
> features enabled. Now I am running the test with a production-like
> configuration. As soon as these tests are done I will run a few more sanity
> tests and reply here with my test ACK.
Hi Luis,

Thanks for taking the time to test, I'm glad it seems OK for now.
> Is there any specific test you would like me to run on that test setup I
> have?

There are a couple of edge-cases that might be problematic if my 
conclusions are wrong : 1. Race between a step exception being taken, 
and the related hardware breakpoint/watchpoint being removed 2. 
Migration of a task stepping a CPU-bound breakpoint/watchpoint

I have been stress testing them on an AMD Seattle board with 4 cores, 
but more extensive testing is always welcome.

I'll describe my testing below, but it is a bit messy and might be 
unclear, my apologies.

I have been using the following very rough program (compiled with -O0) :

	#include <sys/mman.h>
	#include <stdio.h>
	#include <errno.h>
	#include <string.h>
	#include <unistd.h>
	#include <signal.h>
	
	#define TEST_ADDR (void*)0x6000000000
	
	volatile int exit_flag = 0;
	
	void signal_exit(int signal) {
		exit_flag = 1;
	}
	
	int main() {
		void *p = mmap(TEST_ADDR, sizeof(long), PROT_READ|PROT_WRITE,
			MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0);
		int map_err = errno;
	
		printf("r : %p\np : %p\n", TEST_ADDR, p);
		// Reference to make TEST_ADDR appropriate for the address space if it fails
		printf("main : %p\n", (void *)&main);
	
		if (p == MAP_FAILED) {
			printf(strerror(map_err));
			return -1;
		}
	
		struct sigaction interrupt_handler = {
			.sa_handler = &signal_exit,
			.sa_mask = 0,
			.sa_flags = SA_RESETHAND
		};
	
		sigaction(SIGINT, &interrupt_handler, NULL);
	
		unsigned long *data = (unsigned long *)p;
		while (!exit_flag) {
			*data += 1;
		}
	
		printf("Exiting gracefully\n");
	
		munmap(p, sizeof(long));
		return 0;
	}


Which runs continuously, repeatedly changing a fixed addressed, so that 
a hardware watchpoint can be set externally via perf and be CPU-bound :

	perf stat -C $CPU -emem:0x6000000000/8:w


So to test 1. I run perf in a loop, with --timeout 10 so that it 
adds/removes the watchpoint repeatedly, one for each CPU.

	while true; do perf stat --timeout 10 -C $CPU -emem:0x6000000000/8:w ; done


My machine has 4 hardware watchpoints, so I can cover all cores and see 
that the counts are consistent, even if the target task switches cores.
(It is never 0 on all cores, no errors are produced, it is consistent 
with the count when perf is ran on all-cores rather than core-by-core 
(-a) or with the task PID (-p) )

To test 2. I again set one perf monitor per CPU, this time without 
timeout, and then load the system to try to force preemption (with ssdd 
for example),
similarly waiting for inconsistencies, errors, or the count stopping.

However, this might be more difficult if the number of cores is much 
greater than the number of hardware watchpoints.
For 1. the task could be pinned to a core, but for 2. the task could be 
limited to as many cores as the system has hardware watchpoints.


Hopefully that makes sense, but I understand it's a bit involved.

> As for the code review, I am not that well versed on ARM debug exceptions,
> I may take a bit longer to complete the task with the required accuracy.
No worries, any input would be appreciated !
> Best regards,
> Luis
Thanks,
Best regards
Ada
>> Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
>> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>
>> [...]
>>
>> Testing examples
>> ===
>>
>> Perf (for EL1):
>> ~~~
>> Assuming that `perf` is on your $PATH and building with `kallsyms`
>>
>>    #!/bin/bash
>>    
>>    watch_addr=$(sudo cat /proc/kallsyms | grep "D jiffies$" | cut -f1 -d\  )
>>    break_addr=$(sudo cat /proc/kallsyms | grep "clock_nanosleep$" | cut -f1 -d\  )
>>    
>>    cmd="sleep 0.01"
>>    
>>    sudo perf stat -a -e mem:0x${watch_addr}/8:w -e mem:0x${break_addr}:x ${cmd}
>>
>> NB: This does /not/ test EL1 BRKs.
>>
>>
>> GDB commands (for EL0):
>> ~~~
>> The following C example, compiled with `-g -O0`
>>
>>    int main() {
>>            int add = 0xAA;
>>            int target = 0;
>>
>>            target += add;
>>
>>    #ifdef COMPAT
>>        __asm__("BKPT");
>>    #else
>>        __asm__("BRK 1");
>>    #endif
>>    
>>            return target;
>>    }
>>
>> Combined with the following GDB command-list
>>
>>    start
>>    hbreak 3
>>    watch target
>>    commands 2
>>    continue
>>    end
>>    commands 3
>>    continue
>>    end
>>    continue
>>    jump 11
>>    continue
>>    quit
>>
>> Executed as such : `gdb -x ${COMMAND_LIST_FILE} ./a.out`
>> should go through the whole program, return 0252/170/0xAA, and
>> exercise all EL0 debug exception entries.
>> By using a cross-compiler and passing and additional `-DCOMPAT` argument
>> during compilation, the `BKPT32` path can also be tested.
>> NOTE: `BKPT` *will* make GDB loop infinitely, that is expected. Sending
>> SIGINT to GDB will break the loop and the execution should complete.
>>
>> [...]

