Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AA7CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Subject:To:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=; b=ICcCjOPUR7athI4vf/bhAGCIU3
	lrKm0rlCAAr38Mz4RkUihLjHEWxHL/uadVvO4KtPM9qP2SOtodEJlw56BpxCNQ23X+NCzAVe3wrDg
	dIe39u/MWXG58A3+scrRz1djPKtHjdXxT7Hj4I4DvrxLGe4mJ0nzS20gn7xB9xyecy9nXNcO1IuVx
	sFobE95vFWavUu1OMBC7FrPX3mc6OO9ApsN0jB5sWW8QfY4UGsX+b5kMqn44L2iN3LQlhvyq9eBId
	R6FN56rMcFO8Ug4vXztWujxyWV+Ivv55snpZVsfwyYFA+UBEtP86iSCtiVQmsATq4oMYgfTaD71Yd
	eUF4MeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOO-00000007RvN-3NCO;
	Fri, 17 Oct 2025 10:09:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOM-00000007Rt5-128C;
	Fri, 17 Oct 2025 10:08:59 +0000
Message-ID: <20251017085938.150569636@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=;
	b=Eko32jphl7W3Xb+zGpZ6phPdMdJwxHmnxeLrIJj9qdJitAWXAuSbzoODtPZR1exPSq4jMr
	Xn7ZTH6KgwcOGALTdCL47R8+MFa4jiWK8UogHGnp9QeK4hbWrSPeVPSRc3y9z6FMLcfPGe
	KbL4vt6K04JVr8neOXAHUbizdH9XNtossRpzFH+fjRoWAjYd4ZAa2/eiSueqkaHZBNR5/Y
	WgMiXtDNsPUyxQGr8DumDuVWYTMwSZ2IlWZkWq/cFKVncN/jALJBcLTV8IeVbKMcArrHJ2
	eizyzm/gJ8rGmf9GDpZ/1JOEQhlypSXGiWokxNij3wWrwzykELy0t6VKFNZubQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=;
	b=jvhhlE5ZDsXkGj4CvFqtuuX6HrygY+mr5PHtByDjb6j+LIqTh5z4fS9wp9QqAIwAio4UlZ
	gHuITp9EO2Np+kAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Fri, 17 Oct 2025 12:08:54 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030858_454523_E9BAF2B0 
X-CRM114-Status: GOOD (  15.25  )
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

This is a follow up on the V2 feedback:

   https://lore.kernel.org/20250916163004.674341701@linutronix.de

The main concern over the V2 implementation was the requirement to have
the code within the macro itself.

The main reason for that was the issue with ASM GOTO within a auto cleanup
scope. Clang refuses to build when the ASM GOTO label is outside of the
scope and GCC silently miscompiles the code and misses the cleanup.

After some back and forth discussion Linus suggested to put the local label
workaround into the user access functions themself.

The second reason for having this construct was to make the potential
modification of the pointer (when the architecture supports masking) scope
local, as that preserves the original pointer for the failure path.

Andrew thankfully pointed me to nested for() loops and after some head
scratching I managed to get all of it hidden in that construct.

So now the scoped access looks like this:

	scoped_masked_user_read_access(ptr, efault) {
	        // @ptr is aliased. An eventual mask modification is scope local
		unsafe_get_user(val, ptr, efault);
		...
	}
	return 0;
efault:
        // @ptr is unmodified
	do_stuff(ptr);
	return -EFAULT;


Changes vs. V2:

    - Fix the unsigned long long pointer issue in ARM get_user() -
      Christophe, Russell

    - Provide a generic workaround for the ASM GOTO issue and convert the
      affected architecture code over - Linus

    - Reimplement the scoped cleanup magic with nested for() loops - Andrew

    - Provide variants with size provided by the caller - Mathieu

    - Add get/put_user_masked() helpers for single read/write access

    - Fixup the usage in futex, x86. select

    - A clumsy attempt to implement a coccinelle checker which catches
      access mismatches, e.g. unsafe_put_user() inside a
      scoped_masked_user_read_access() region. That needs more thought and
      more coccinelle foo and is just there for discussion.

The series is based on v6.18-rc1 and also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/masked

Thanks,

	tglx
---
Thomas Gleixner (12):
      ARM: uaccess: Implement missing __get_user_asm_dword()
      uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
      x86/uaccess: Use unsafe wrappers for ASM GOTO
      powerpc/uaccess: Use unsafe wrappers for ASM GOTO
      riscv/uaccess: Use unsafe wrappers for ASM GOTO
      s390/uaccess: Use unsafe wrappers for ASM GOTO
      uaccess: Provide scoped masked user access regions
      uaccess: Provide put/get_user_masked()
      coccinelle: misc: Add scoped_masked_$MODE_access() checker script
      futex: Convert to scoped masked user access
      x86/futex: Convert to scoped masked user access
      select: Convert to scoped masked user access

---
 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  313 ++++++++++++++++++++++++++-
 kernel/futex/futex.h                         |   37 ---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 10 files changed, 497 insertions(+), 106 deletions(-)

