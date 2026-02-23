Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400AAEC1120
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sGcZneDFcdfwURBJr7w0EZkJUKWDffeIZC2cPyZtn9M=; b=XZoSh1OYrtjLFn
	7PBVDKzfvXWJv5QkWPeH9PKa5HN2s0GC/L+APOZAqUN4GkgloK/qMbHZaD3gQ8JLg1/VIC6vsLHg+
	on1OiSfEkJhkYuIFoIPKQBeTfKR8v/ja8PcWGCOE376IhEqgStKYgLw3sXyNKBYR2tCunSKX/9UOV
	BkH44Xz7O2d3u8xJrNKzFHBRaJB4rznQmojS2DV36HgcWG5zoHAJ3aXY/VDOHqeOM+jhXHXDMLMfB
	OWwvWQsQDVst1gXw+L8ywrO+MaTbLgZVw7Py/YX8bbA7yVoyIG5WbCVs91gmiYvTVUXX2fvB76JXv
	8nMf5VNiIpxJ+LU2dTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubKg-00000000uRt-0YXT;
	Mon, 23 Feb 2026 19:11:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubKc-00000000uRU-3dhm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 611A84457F;
	Mon, 23 Feb 2026 19:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55F7C2BCAF;
	Mon, 23 Feb 2026 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873857;
	bh=lEKimZnEjne2BNdsm8RfAwEFAB1/q1VUQbalmtODD1Q=;
	h=From:Subject:Date:To:Cc:From;
	b=W7lb9mvt8Ss7DIDpVVbHvo8HG9uV2RHrY5VNGVfhxu/bODlNHPOMU8AHU7cyge+Yt
	 iRloWl9TfRuTMAM2B+UtspS3O6ZXW8kKmkvGes8uLVlEMNdiU2xt3fqmoiVtIi1Cod
	 SarcI/AdLtw17TCwEFJVDqDlJoLVMkEcAdtk4srZiwFRO4xHP50LbwxcaP0hEea+z4
	 RQpOuIRuHl6d6iyM1gY+9wf/r1WTKKzhKqKQITVCr+YsLeL7dTY8wNVJ/jbAXYxUvW
	 G8FCGINS88O6kG4fIPtGvpELH4y3kmpwj/vyFTEAcpNbcJGdv8VyHGqk/ExuZxYFDL
	 2gl/lR3828f7g==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
Date: Mon, 23 Feb 2026 12:10:27 -0700
Message-Id: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgIwbxKqWLGCc6gknJJNIi3
 t1Ul2/x/w5CkUmgr3aItLFw8AXPRwV2Nn4i5LEYVK10rVSDbhU0PvjfGrKgpJhtEnTajKRtN7R
 GQ2k/kRx/r+/rfVvysJBN/xkcxwnoIdTAeQAAAA==
X-Change-ID: 20260223-fms-anonymous-structs-f6ade6c8b5a6
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=nathan@kernel.org;
 h=from:subject:message-id; bh=lEKimZnEjne2BNdsm8RfAwEFAB1/q1VUQbalmtODD1Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlzllkKpdb9/H8vK1IjjHf1par1+w9qXs5/w91Rs6jo7
 o0KpXUhHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiR+IYGR7dj3Mv9tp9XOzY
 T6tjbKzOTUe/79vdcuXP9qw297/fahUZ/qec2K/kXJAvNPuxK8fqb9Jb/zLOkuXmujS3dH7QXL9
 tnWwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_111058_956051_771FB11B 
X-CRM114-Status: GOOD (  14.68  )
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

Hi all,

The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
enable -fms-extensions") in 6.19 to gain access to a Microsoft
(originally Plan 9) extension around including a tagged structure/union
anonymously in an other structure/union. Since then, Clang 23.0.0
(current main) has added a flag to enable only that extension, rather
than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
narrower compiler option would have avoided the build error fixed by
commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
'-fms-extensions'"). While these errors are not expected to be common,
using the narrower option when available has no drawbacks because the
kernel only cares about this extension in '-fms-extensions', no others.
While this could result in build errors for folks using
'-fms-anonymous-structs' if a developer uses another extension in
'-fms-extensions' (either intentionally or unintentionally), flagging
these uses for further scrutiny seems worthwhile.

This series converts the build system to use that flag when it is
available. The first patch consolidates all of the C dialect flags into
a single variable to make future updates to the dialect flags less
painful, as updating the logic in every place that uses their custom
built C flags is getting cumbersome (and C23 is looming). The second
patch makes the actual switch.

I would like Nicolas to carry this in the Kbuild tree for 7.1, please
provide Acks as necessary.

[1]: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956

---
Nathan Chancellor (2):
      kbuild: Consolidate C dialect options
      kbuild: Use '-fms-anonymous-structs' if it is available

 Makefile                              | 16 ++++++++++++----
 arch/arm64/kernel/vdso32/Makefile     |  3 +--
 arch/loongarch/vdso/Makefile          |  2 +-
 arch/parisc/boot/compressed/Makefile  |  2 +-
 arch/powerpc/boot/Makefile            |  3 +--
 arch/s390/Makefile                    |  3 +--
 arch/s390/purgatory/Makefile          |  3 +--
 arch/x86/Makefile                     |  6 +-----
 arch/x86/boot/compressed/Makefile     |  6 +-----
 drivers/firmware/efi/libstub/Makefile |  3 +--
 init/Kconfig                          |  5 +++++
 scripts/Makefile.warn                 |  5 -----
 12 files changed, 26 insertions(+), 31 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-fms-anonymous-structs-f6ade6c8b5a6

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


