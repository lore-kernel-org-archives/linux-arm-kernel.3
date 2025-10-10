Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFB2CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jiTFrzMAhXf0lHXfGbE7QYutHmJtDJtsPx27BIBz86Y=; b=ZdRiVur5bVcGo8FJQZtRBx7ip7
	40AeGK19OWWkqMchzIE1LfNAXNQSghz+qHYuPi8zCiQKRRl0TuT+V1ljnBatBbfM5KmWgxI2eiOXE
	eqe9KbOIpq6F4AJhAIn+K7j//XTUXyFeg3muDqToz/3tCQ1t4rKhvFkphpupegXdcqf3d8+QGQ+Ux
	HixQJkwGnLBP5VEX4hto5V8E/fnkS4W1j0Ss2TEof4A2GadHB6g/a/fADQiqw00Kz6rpwOzxUYMnQ
	r8wfEWDlGn07sj4tEbSWQ6wKSmTrj6YOR0ECcat0yeL3hunBc+fx2nYUJibzMVV6HcNJ6jEskmii0
	Aod1ZoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CkX-00000008VXX-2k54;
	Fri, 10 Oct 2025 13:01:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CkT-00000008VVb-0ULa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 13:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760101286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jiTFrzMAhXf0lHXfGbE7QYutHmJtDJtsPx27BIBz86Y=;
	b=CWyh3aIagF+jI2oPORJPbBH5vSg1fQ7fY1w72Ae2MA2zeeHLp2Q/QWNOEBpSQM191rg03l
	+3EwI5nPJgBJ57vUYIFC4Fyb4ms/t3EeJz/6ihphYpl8ZbpnFI6KuV4daLF8s23VivQisf
	7RzVOvKyynIt/sRY9/Nh65n9HIPAJMY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-2P4-NoKQNfO1yltQ51solQ-1; Fri,
 10 Oct 2025 09:01:23 -0400
X-MC-Unique: 2P4-NoKQNfO1yltQ51solQ-1
X-Mimecast-MFC-AGG-ID: 2P4-NoKQNfO1yltQ51solQ_1760101281
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4151D195609E;
	Fri, 10 Oct 2025 13:01:21 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.128])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32AC71954128;
	Fri, 10 Oct 2025 13:01:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 0/2] arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in headers
Date: Fri, 10 Oct 2025 15:01:14 +0200
Message-ID: <20251010130116.828465-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_060129_226493_A11627A1 
X-CRM114-Status: GOOD (  16.65  )
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

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembler and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembler code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The related cleanup patches for x86, parisc, sh, arc, s390x and many
other architectures already got merged via their specific architecture
tree, see for example:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=179e949719fe81
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2cb74be378675c

The x86 have already been merged in Linux v6.15, and as far as I know,
there haven't been any complaints about problems in userspace with the
updated uapi headers yet, so I think these changes should be fine.

Thus, please merge the arm64 patches via the arm64 tree. Thanks!

 Thomas


v2:
- Split the arm64 patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next and fixed the conflicts

Thomas Huth (2):
  arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/arm64/include/asm/alternative-macros.h       |  8 ++++----
 arch/arm64/include/asm/alternative.h              |  4 ++--
 arch/arm64/include/asm/arch_gicv3.h               |  4 ++--
 arch/arm64/include/asm/asm-extable.h              |  6 +++---
 arch/arm64/include/asm/assembler.h                |  2 +-
 arch/arm64/include/asm/barrier.h                  |  4 ++--
 arch/arm64/include/asm/cache.h                    |  4 ++--
 arch/arm64/include/asm/cpucaps.h                  |  4 ++--
 arch/arm64/include/asm/cpufeature.h               |  4 ++--
 arch/arm64/include/asm/cputype.h                  |  4 ++--
 arch/arm64/include/asm/current.h                  |  4 ++--
 arch/arm64/include/asm/debug-monitors.h           |  4 ++--
 arch/arm64/include/asm/el2_setup.h                |  2 +-
 arch/arm64/include/asm/elf.h                      |  4 ++--
 arch/arm64/include/asm/esr.h                      |  4 ++--
 arch/arm64/include/asm/fixmap.h                   |  4 ++--
 arch/arm64/include/asm/fpsimd.h                   |  2 +-
 arch/arm64/include/asm/ftrace.h                   |  6 +++---
 arch/arm64/include/asm/gpr-num.h                  |  6 +++---
 arch/arm64/include/asm/hwcap.h                    |  2 +-
 arch/arm64/include/asm/image.h                    |  4 ++--
 arch/arm64/include/asm/insn.h                     |  4 ++--
 arch/arm64/include/asm/jump_label.h               |  4 ++--
 arch/arm64/include/asm/kasan.h                    |  2 +-
 arch/arm64/include/asm/kexec.h                    |  4 ++--
 arch/arm64/include/asm/kgdb.h                     |  4 ++--
 arch/arm64/include/asm/kvm_asm.h                  |  4 ++--
 arch/arm64/include/asm/kvm_mmu.h                  |  4 ++--
 arch/arm64/include/asm/kvm_mte.h                  |  4 ++--
 arch/arm64/include/asm/kvm_ptrauth.h              |  6 +++---
 arch/arm64/include/asm/linkage.h                  |  2 +-
 arch/arm64/include/asm/memory.h                   |  4 ++--
 arch/arm64/include/asm/mmu.h                      |  4 ++--
 arch/arm64/include/asm/mmu_context.h              |  4 ++--
 arch/arm64/include/asm/mte-kasan.h                |  4 ++--
 arch/arm64/include/asm/mte.h                      |  4 ++--
 arch/arm64/include/asm/page.h                     |  4 ++--
 arch/arm64/include/asm/pgtable-prot.h             |  4 ++--
 arch/arm64/include/asm/pgtable.h                  |  4 ++--
 arch/arm64/include/asm/proc-fns.h                 |  4 ++--
 arch/arm64/include/asm/processor.h                |  4 ++--
 arch/arm64/include/asm/ptrace.h                   |  4 ++--
 arch/arm64/include/asm/rsi_smc.h                  |  4 ++--
 arch/arm64/include/asm/rwonce.h                   |  4 ++--
 arch/arm64/include/asm/scs.h                      |  4 ++--
 arch/arm64/include/asm/sdei.h                     |  4 ++--
 arch/arm64/include/asm/smp.h                      |  4 ++--
 arch/arm64/include/asm/spectre.h                  |  4 ++--
 arch/arm64/include/asm/stacktrace/frame.h         |  4 ++--
 arch/arm64/include/asm/sysreg.h                   | 10 +++++-----
 arch/arm64/include/asm/system_misc.h              |  4 ++--
 arch/arm64/include/asm/thread_info.h              |  2 +-
 arch/arm64/include/asm/tlbflush.h                 |  2 +-
 arch/arm64/include/asm/vdso.h                     |  4 ++--
 arch/arm64/include/asm/vdso/compat_barrier.h      |  4 ++--
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  4 ++--
 arch/arm64/include/asm/vdso/getrandom.h           |  4 ++--
 arch/arm64/include/asm/vdso/gettimeofday.h        |  4 ++--
 arch/arm64/include/asm/vdso/processor.h           |  4 ++--
 arch/arm64/include/asm/vdso/vsyscall.h            |  4 ++--
 arch/arm64/include/asm/virt.h                     |  4 ++--
 arch/arm64/include/uapi/asm/kvm.h                 |  2 +-
 arch/arm64/include/uapi/asm/ptrace.h              |  4 ++--
 arch/arm64/include/uapi/asm/sigcontext.h          |  4 ++--
 tools/arch/arm64/include/asm/cputype.h            |  4 ++--
 tools/arch/arm64/include/asm/esr.h                |  4 ++--
 tools/arch/arm64/include/asm/gpr-num.h            |  6 +++---
 tools/arch/arm64/include/asm/sysreg.h             | 10 +++++-----
 tools/arch/arm64/include/uapi/asm/kvm.h           |  2 +-
 69 files changed, 141 insertions(+), 141 deletions(-)

-- 
2.51.0


