Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94AECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Subject:To:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=; b=f/oletM0TnUeeFS93GedN/rPn+
	mJuai7gyoE4f9GNBCt3f15PpSs+31HYQw3KlV5he/YXrttxiNdHM4hWwF+s96ql9VtDg/TYJEFuks
	+l/DKBFDWKlRAq4V3z/G2qoEW31bh25e3HCUCp7Tl91kUCqmzlPvxRrtyVozPlj5wgOJ+4P5k4+Z1
	VW+AoQqxdZcySqdjbuPAbYCqSYLuHhEsMLeMkf5lxFUrjfFcslf5vETHbpl9KS1peeUFWgtkktPIT
	IvXM3afKxpr0v1SZxIIyyarRy07WaN+iAbzO7lSOqWzLagMovml3OcnlVGVEI7DPQEPtdeoYN4BaT
	ttxwPVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHN-00000002qbP-1f6M;
	Wed, 22 Oct 2025 12:49:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYH7-00000002qIU-4AhG;
	Wed, 22 Oct 2025 12:49:12 +0000
Message-ID: <20251022102427.400699796@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=;
	b=EtfaCoDmFor8sSyXEn7oHgxdwynsxqOq3FyCVUuhPIgRs9x5vdmO92747Cz8TOKGl4pO+h
	ZKBXS45G2J7mtFB7bIbQVW+HUcOV3Y864eGZCPy97TDME/wSAWlPnheYnWGw8sDNUcEaqJ
	18ozfWu+ohRqajooCKIUx6N5b6VdCCo0mx4CHbj65zTzjsxNaXDmXnMkdMlfRmJWxg+7TX
	2HmOV/4/UrxLFOcsdgGb0UUsX1EeRuVxhh5jfU948EwHm7mOOaa17GMdraDdgMT+nOu2Dm
	Nh9yba2+vXILBG3SJv5GUZIWaa5XNotuqPRL+KLJqsLbbK0pDKlJWBfK0candw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=;
	b=ss9zZT1nrdUlW60YnW7MoEIuOhi/H1ZFLAptXi6Q2OQGKph9Q1UEzducE2vpLJL3u2pCgV
	douIrhd397x/hWDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 00/12] uaccess: Provide and use scopes for user access
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
 David Laight <david.laight.linux@gmail.com>,
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
Date: Wed, 22 Oct 2025 14:49:02 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_054910_185044_11C17CE2 
X-CRM114-Status: UNSURE (   9.53  )
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

This is a follow up on the V3 feedback:

   https://lore.kernel.org/20251017085938.150569636@linutronix.de

Changes vs. V3:

  - Remove the superflouous if (1) in the scope macro - Andrew

  - Use asm_inline in the x86 conversion - Andrew

  - Rename to scoped_user_*_access(), remove underscores, use a void
    intermediate pointer and add a comment vs. access range - David

  - Use read scope in select - PeterZ

  - Fix comments, shorten local variables and remove pointless brackets -
    Mathieu

  - Simplify the coccinelle script, which needs still more polishing -
    Julia

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
      uaccess: Provide scoped user access regions
      uaccess: Provide put/get_user_scoped()
      coccinelle: misc: Add scoped_$MODE_access() checker script
      futex: Convert to scoped user access
      x86/futex: Convert to scoped user access
      select: Convert to scoped user access
---
 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  308 ++++++++++++++++++++++++++-
 kernel/futex/futex.h                         |   37 ---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 10 files changed, 492 insertions(+), 106 deletions(-)



