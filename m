Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863F7EC1122
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQMEKXUSkaG7neBfJPWJGw4i7WIIDOqWY1P7BMsbh/o=; b=BhERs85LpUUY90mWiuH+K4b8uB
	qpk1fA1NKXXfZjmcAm1hdxIrsXHsCDBzctUIS92Ag9ub05CUWsZSAWGCuMdRv1L85+WmAW39j0QyH
	kZW13aoVwdbjI9/JHofTkPBxchLJjXdg95C38kIpbRkNepR+wEKK46C+5qP60eI5YV+WHhvSUzBr9
	k2D6Bez2K+6ZBw4JzkaCiqJbjHob37BNNHH+VUbIz/MdY/9GYsCiczflv9MNeeGj7i456wA2shKdn
	t9v1Oxy0R4lV3pMpRMVy+vQ0JBcv2xVbgksw/j4pKKh6kkRq9yl2I/CpLTZw7wIMp8OWVpl6X7q3a
	vXAAL4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubKu-00000000uV3-36DT;
	Mon, 23 Feb 2026 19:11:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubKr-00000000uUB-3W9y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FFC24052E;
	Mon, 23 Feb 2026 19:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEF7C2BCB5;
	Mon, 23 Feb 2026 19:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873873;
	bh=HnBXmWSMpA4wuIlOSxrj2rJBVS6hgScD9wUDZt2+qlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ec7rpLCAzCv/KZRrk93iS8TKBy0dmX0TGeVU6K4v5xX/A3r84WlF1+spB2Ck3L8+F
	 Ly7Wrk5nDJOONGQAATDn57wpDwS2nId7NK4Vw6pPbxqhuUY3hzAD8tHDKWPeYQ16aq
	 CDGEXsS4binEbD98XFg/kkeskjcNzRQjVBeAbf9hU+krUTPdo4EdS3QsbFUpmWqK+x
	 83fmxFV+JzQ6K58ijzWKw7NoMdRiJVu6YnkQ+ER5K9bPSOKZ9CiQSYDQwcw9L4xCAq
	 zh+5+/I2WpfYgv6lc5TMsUwpiBXIECDLTQU1MmY+kExyurkj5huthCznFvUTJv9pGV
	 pHQjm+oF6bRiA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 23 Feb 2026 12:10:29 -0700
Subject: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=nathan@kernel.org;
 h=from:subject:message-id; bh=HnBXmWSMpA4wuIlOSxrj2rJBVS6hgScD9wUDZt2+qlw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlzllnaL/tzZJ9j+UqRFKP/HVNX104yzPm+PPiz5Fdep
 pLXR1Z0d5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJlJ1h+Gf2bHvS3EU6Cuzv
 6lVV6lZmRpcf6jghx2ystVX28+qCK1GMDBd67Cest0lolmS6u+nMHYW1j73/xRXE1p4vP+5/d3u
 xCTcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_111113_930319_4C990AD4 
X-CRM114-Status: GOOD (  13.52  )
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

Clang recently added '-fms-anonymous-structs' [1] to specifically enable
the Microsoft tagged anonymous structure / union extension, for which
the kernel added '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
enable -fms-extensions"). Switch to this more narrow option if it is
available, which would have helped avoid the issue addressed by
commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
'-fms-extensions'"). GCC has talked about adding a similar flag [2] as
well but potentially naming it differently.

Move the selection of the flag to Kconfig to make it easier to use
cc-option (as CC_FLAGS_DIALECT may be used in arch Makefiles, which may
be too early for cc-option in Kbuild) and customize based on compiler
flag names.

Link: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956 [1]
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123623 [2]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile     | 2 +-
 init/Kconfig | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 06ff3032a6bc..1d5c0ab9ed5c 100644
--- a/Makefile
+++ b/Makefile
@@ -791,7 +791,7 @@ endif
 
 CC_FLAGS_DIALECT := -std=gnu11
 # Allow including a tagged struct or union anonymously in another struct/union.
-CC_FLAGS_DIALECT += -fms-extensions
+CC_FLAGS_DIALECT += $(CONFIG_CC_MS_EXTENSIONS)
 # Clang enables warnings about GNU and Microsoft extensions by default, disable
 # them because this is expected with the above options.
 ifdef CONFIG_CC_IS_CLANG
diff --git a/init/Kconfig b/init/Kconfig
index c25869cf59c1..c4282d049463 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -960,6 +960,11 @@ config CC_IMPLICIT_FALLTHROUGH
 	default "-Wimplicit-fallthrough=5" if CC_IS_GCC && $(cc-option,-Wimplicit-fallthrough=5)
 	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
 
+config CC_MS_EXTENSIONS
+	string
+	default "-fms-anonymous-structs" if $(cc-option,-fms-anonymous-structs)
+	default "-fms-extensions"
+
 # Currently, disable gcc-10+ array-bounds globally.
 # It's still broken in gcc-13, so no upper bound yet.
 config GCC10_NO_ARRAY_BOUNDS

-- 
2.53.0


