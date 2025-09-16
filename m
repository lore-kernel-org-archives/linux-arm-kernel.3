Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB604CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xUyqhsEiyiUoxhJieOdMTcH66oxWdRq1GQhqVdXzx4=; b=g2UUKdR9BhtJbnwfa9HLHyA8RV
	0H4cUvU/qd8WwUEfV9k5mFhv4c/fmSPqzAAkOH3hBNj9mbRPEKykN4Nw17x3qX4OhOFriBcpkapcM
	fDKX8a10pXMl4R0DSQiEAHaLtqtHg9sbSMCcvhJN1F02v3c07wX1VD+25kD1uhLo0ezQ7OVeYOl36
	Ui62IH8PrXoXvChoRybD7QDXdr0xE3npzFiciSKunFU3cUeQGJrZtNeR24x2MCkbhbyu26oBC6h9l
	eFUr1mWMUwplzDtPZYfdoUfOiBL3ss8ljzizA3IVlblRsQQXI+PkmG4PgwsjNB1dkSeXvkrBRdvSg
	z+bR5qSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycjC-000000097PF-0sG1;
	Tue, 16 Sep 2025 20:56:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycjA-000000097M2-0SMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 20:56:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758056198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xUyqhsEiyiUoxhJieOdMTcH66oxWdRq1GQhqVdXzx4=;
	b=yOLgRMgnYE69+7MlYv3qCTagaN6kVQQCjqUEw0JlvAlnaNwzk/bGmJ3rTHtN7JjeISB+jL
	mv+meKS0TlnU5SVG/SgMlwbTkAm359ew/MyEUJ5/eC87h1UxbKKNDPr9JIXMLhhGxP37kJ
	Z9j2QuWaWNM10eyAyULEp5yuzjc5SxupVQHIqzbyAlWA/hDW6VqMGzo+yw6QBYszEo15+8
	XYFDG6ypTWzqzTC0tu8oFlgFAj1qP0c++HrNFH9jDrEp/AvK1Wmea2CJ5+jW0W74Z2eg8L
	/Jp6cte4T9TsFdscMLpIwBTThoJjhc02ubExYMXQafm24zgdgYPwF+Ih4LRBfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758056198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xUyqhsEiyiUoxhJieOdMTcH66oxWdRq1GQhqVdXzx4=;
	b=MFtM5T/YeW0GGddiSAFphbAmE/KU1rx1JNt3/rcSiWFowx9AM/VhLqeqVeXdFSY84jYUx4
	QiFRM/gYAMBeeMDw==
To: Nathan Chancellor <nathan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
 version 17
In-Reply-To: <87ikhi9lhg.ffs@tglx>
References: <20250916163004.674341701@linutronix.de>
 <20250916163252.100835216@linutronix.de> <20250916184440.GA1245207@ax162>
 <87ikhi9lhg.ffs@tglx>
Date: Tue, 16 Sep 2025 22:56:36 +0200
Message-ID: <87frcm9kvv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_135640_288140_12CADC7D 
X-CRM114-Status: GOOD (  15.46  )
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

clang < 17 fails to use scope local labels with CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y:

     {
     	__label__ local_lbl;
	...
	unsafe_get_user(uval, uaddr, local_lbl);
	...
	return 0;
	local_lbl:
		return -EFAULT;
     }

when two such scopes exist in the same function:

  error: cannot jump from this asm goto statement to one of its possible targets

There are other failure scenarios. Shuffling code around slightly makes it
worse and fail even with one instance.

That issue prevents using local labels for a cleanup based user access
mechanism.

After failed attempts to provide a simple enough test case for the 'depends
on' test in Kconfig, the initial cure was to mark ASM goto broken on clang
versions < 17 to get this road block out of the way.

But Nathan pointed out that this is a known clang issue and indeed affects
clang < version 17 in combination with cleanup(). It's not even required to
use local labels for that.

The clang issue tracker has a small enough test case, which can be used as
a test in the 'depends on' section of CC_HAS_ASM_GOTO_OUTPUT:

void bar(void **);
void* baz();

int  foo (void) {
    {
	    asm goto("jmp %l0"::::l0);
	    return 0;
l0:
	    return 1;
    }
    void *x __attribute__((cleanup(bar))) = baz();
    {
	    asm goto("jmp %l0"::::l1);
	    return 42;
l1:
	    return 0xff;
    }
}

Add another dependency to config CC_HAS_ASM_GOTO_OUTPUT for it and use the
clang issue tracker test case for detection by condensing it to obfuscated
C-code contest format. This reliably catches the problem on clang < 17 and
did not show any issues on the non known to be broken GCC versions.

That test might be sufficient to catch all issues and therefore could
replace the existing test, but keeping that around does no harm either.

Thanks to Nathan for pointing to the relevant clang issue!

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1886
Link: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14
---
V2a: Use the reproducer from llvm
V2: New patch
---
 init/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/init/Kconfig
+++ b/init/Kconfig
@@ -99,7 +99,10 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
+	# Find basic issues
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
+	# Detect buggy clang, fixed in clang-17
+	depends on $(success,echo 'void b(void **);void* c();int f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}}' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASM_GOTO_TIED_OUTPUT
 	depends on CC_HAS_ASM_GOTO_OUTPUT

