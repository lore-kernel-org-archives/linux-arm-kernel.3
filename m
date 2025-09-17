Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E8ECAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQCmsx+q19QryaLAotidJn5GzikFHQ0lTjuulNLAXTM=; b=PLbB5qof7mWkcTHKPsQwon+oiH
	tD4g+u1z7jr8cU2lDa4pXJBAOFG2ly/V8LriObSz2bgScGwnkxhVaVicCbOUNPss3ANBVOKUsv4ef
	53lkjzX0P0Bh44C186muvTHXJkDALR2Qtpndaqqs+v/ymersiq3eyqOUc0ZOQlGbXSL6/2qaOku2d
	d+v8hpSSaDqRY+88i3pUxuRz53ov2Mui2y40fSaZAgRP4BWWPZALPOtHsblSJieLmn6E+W4e9EBP0
	d+hfzu0xIBL3wkb5wnfPjlhaEyMToF41Q+zVTlNx5n2QfgJkj77IM8m4VcBnJ9a1wEdP+m09ayxpN
	R1t0JP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt4y-0000000CBjq-2MDc;
	Wed, 17 Sep 2025 14:24:16 +0000
Received: from smtps.ntu.edu.tw ([140.112.2.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt4v-0000000CBhS-0Gbc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:24:15 +0000
Received: from wmail1.cc.ntu.edu.tw (wmail1.cc.ntu.edu.tw [140.112.2.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 5BA1845D47;
	Wed, 17 Sep 2025 22:23:49 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 22:23:49 +0800
From: Bill Tsui <b10902118@ntu.edu.tw>
To: Will Deacon <will@kernel.org>
Cc: oleg@redhat.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: ptrace: fix hw_break_set() by setting addr
 and ctrl together
In-Reply-To: <dcb568c3dd5feb15890fa75e988e33bb@ntu.edu.tw>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-2-b10902118@ntu.edu.tw>
 <aL7y00ggniiCTpZS@willie-the-truck>
 <dcb568c3dd5feb15890fa75e988e33bb@ntu.edu.tw>
User-Agent: Roundcube Webmail/1.4
Message-ID: <0fd573cc044584f00976c410955ed486@ntu.edu.tw>
X-Sender: b10902118@ntu.edu.tw
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_072413_387475_FB24D50C 
X-CRM114-Status: GOOD (  10.41  )
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

The following can reproduce the error for `arm64 compat` watchpoints
(breakpoints follow the same logic). I realized that testing my patch
can take time to set up from scratch, hoping this can facilitate the
review process.

There are three parts:
1. watch_unaligned.c
2. tracee.c
3. compile & run

Basically, watch_unaligned runs tracee and set 1-byte watchpoints on it.


1. watch_unaligned.c

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <linux/ptrace.h>
#include <asm/ptrace.h>
#include <sys/uio.h>
#include <elf.h>
#include <sys/uio.h>
#include <asm/ptrace.h>

#define MAX_WATCHPOINTS 4

#define AARCH64_BREAKPOINT_EL0 2

#define ENABLE 1

typedef enum {
     arm_hwbp_break = 0,
     arm_hwbp_load = 1,
     arm_hwbp_store = 2,
     arm_hwbp_access = 3
} arm_hwbp_type;

void error_detach_close(pid_t pid, FILE* pipe, const char* msg) {
     perror(msg);
     ptrace(PTRACE_DETACH, pid, NULL, NULL);
     pclose(pipe);
}

void watch_1byte(int pid, uint32_t addr) {
     // Set hardware watchpoint on ARM64
     // Use PTRACE_SETREGSET with NT_ARM_HW_WATCH for watchpoints
     printf("Setting watchpoint at address 0x%x\n", addr);
     struct user_hwdebug_state watch;
     memset(&watch, 0, sizeof(watch));
     watch.dbg_regs[0].addr = addr;
     uint32_t size = 1;
     uint32_t byte_mask = (1u << size) - 1u;
     uint32_t type = arm_hwbp_access;
     uint32_t priv = AARCH64_BREAKPOINT_EL0;
     watch.dbg_regs[0].ctrl =
         (byte_mask << 5) | (type << 3) | (priv << 1) | ENABLE;

     struct iovec ioVec;
     memset(&ioVec, 0, sizeof(ioVec));
     ioVec.iov_base = &watch;
     // According to lldb. Otherwise dbg_regs[16] will cause error
     ioVec.iov_len = sizeof(watch.dbg_info) + sizeof(watch.pad) +
                     (sizeof(watch.dbg_regs[0]) * MAX_WATCHPOINTS);

     if (ptrace(PTRACE_SETREGSET, pid, NT_ARM_HW_WATCH, &ioVec) == -1) {
         perror("PTRACE_SETREGSET");
     } else {
         printf("Watchpoint at address 0x%x set successfully\n", addr);
     }
     printf("---\n");
}

FILE* run_tracee(pid_t *pid, uint32_t *addr) {
     // run tracee and get pid & addr
     FILE *pipe = popen("./tracee", "r");
     if (!pipe) {
         perror("popen failed");
         return NULL;
     }

     char line[64];
     if (fgets(line, sizeof(line), pipe) == NULL) {
         perror("read pid failed");
     }
     *pid = atoi(line);

     if (fgets(line, sizeof(line), pipe) == NULL) {
         perror("read addr failed");
     }
     *addr = strtoul(line, NULL, 0);

     return pipe;
}

int main() {
     pid_t pid;
     uint32_t addr;

     FILE *pipe = run_tracee(&pid, &addr);
     if (!pipe) {
         return 1;
     }

     printf("Attaching to PID %d\n", pid);
     if (ptrace(PTRACE_ATTACH, pid, NULL, NULL) == -1) {
         error_detach_close(pid, pipe, "ptrace(ATTACH)");
         return 1;
     }
     printf("Attached\n\n");

     int status = 0;
     if (waitpid(pid, &status, 0) == -1) {
         error_detach_close(pid, pipe, "waitpid");
         return 1;
     }

     // The TEST

     // watch non-4-byte aligned. (Fail)
     watch_1byte(pid, addr);
     // watch any 4-byte aligned. (Success)
     watch_1byte(pid, 0);
     // watch non-4-byte aligned again. (Success)
     // because bp_len was previously set to 2 successfully
     watch_1byte(pid, addr);

     // continue and let it trigger, proving functionality
     if (ptrace(PTRACE_CONT, pid, NULL, NULL) == -1) {
         error_detach_close(pid, pipe,"ptrace(CONT)");
         return 1;
     }
     if (waitpid(pid, &status, 0) == -1) {
         error_detach_close(pid, pipe, "waitpid (after CONT)");
         pclose(pipe);
         return 1;
     }
     if (WIFSTOPPED(status)) {
         printf("Watchpoint triggered, signal: %d\n", WSTOPSIG(status));
         ptrace(PTRACE_CONT, pid, NULL, NULL);
         ptrace(PTRACE_DETACH, pid, NULL, NULL);
     }
     pclose(pipe);
     return 0;
}


2. tracee.c

#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

int main() {
     volatile int a = 42;
     printf("%d\n%p\n", getpid(), (void*)((uintptr_t)&a + 1));
     fflush(stdout);
     while (1) {
         a += 1;
     }

     return 0;
}


3. compile & run

# 64-bit tracer
aarch64-linux-gnu-gcc watch_unaligned.c -o watch_unaligned

# 32-bit tracee
arm-linux-gnueabi-gcc tracee.c -o tracee

# run
./watch_unaligned

output:

     Attaching to PID 325
     Attached

     Setting watchpoint at address 0xffacca39
     PTRACE_SETREGSET: Invalid argument
     ---
     Setting watchpoint at address 0x0
     Watchpoint at address 0x0 set successfully
     ---
     Setting watchpoint at address 0xffacca39
     Watchpoint at address 0xffacca39 set successfully
     ---
     Watchpoint triggered, signal: 5

Summary: the first watchpoint failed but should be supported since it 
was
successfully set and triggered just after addr 0x0 with length 1.

Thanks,
Bill

