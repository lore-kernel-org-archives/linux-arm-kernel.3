Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2C8CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAHJKycBV24FB7D+5sgN+DCQ8BtvYWGyoFjnG0jF1+Y=; b=noODsSYMaFIcBOQVWg/wUFw2Pk
	zUyemTS2NDOTeAcPwDyqaZ6uBy9/TV1Srx6acLHqsUgLJir/Dhxu2XzEvrS20qi8nmiSPbJwFI4cS
	7qlmchE0B4V4lvfOHEbfSbC1zH5kioS6eU+xeHIhW8pY7vZWz+w9o//jTkqgbUB3GRnu5vQvzuRPk
	9JDgVd/mcOYUba5i4/Gn36dmDOttYKPrD0iPSRYme8DhqYG4aLCUBUl3x+jLb+xOIJfBSZOukgCf9
	ohUqE4IYPVIu7laUNAOLBxtL5A0r47vrnOUGg5mlmkd1zLnj6Sb7lixT39t5dZcL6v6D6pW4L+1kO
	QXktMVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcE-00000008TV5-2y93;
	Tue, 16 Sep 2025 16:33:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcC-00000008TTy-0ZrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:13 +0000
Message-ID: <20250916163004.674341701@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=QAHJKycBV24FB7D+5sgN+DCQ8BtvYWGyoFjnG0jF1+Y=;
	b=GEhOLZYOHp5C638N6Rsuee1kTC0rYKv5bwoA67L0S28vT6AEFAilXoAXHK1RTjW5v8sMnN
	Z4IjqkUEo6lHX0J4FSjUh24xozx+6NeydkTVGnuyE4WIuElD1ETs0oy2Wphr0XCukR6qSC
	OWIDKIAMCaPcbgs0jNBkR1K2lvRx5UAkzcpyp3Fjsbj0jWd6Aet/dpcox2cEkyObElCw2v
	Xv64gOHlSJyJKgKAmp2tqyqSORCna7OMkQEKQgsOKma1oFB4ZmyKr470EHX3f+aHwJHnZL
	4uKaga73pYP/zymmuSbR0U0577bWYWRDcvE0jBJpJi5ioURaonJoD7Dc7/FV8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=QAHJKycBV24FB7D+5sgN+DCQ8BtvYWGyoFjnG0jF1+Y=;
	b=sV7YXVNFf4kk3eGZA9fyUCDgJyEji7uiLDNlbiVtw2tZX9TqOBAQqt4Whov7Oat8X2WHOq
	0ymKt0WYDEZYY9Dg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 x86@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V2 0/6] uaccess: Provide and use scopes for user masked access
Date: Tue, 16 Sep 2025 18:33:07 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093312_317912_BA2A051D 
X-CRM114-Status: GOOD (  23.09  )
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

This is a follow up on the initial V1 to make the masked user access more
accessible:

   https://lore.kernel.org/r/20250813150610.521355442@linutronix.de

After reading through the discussions in the V1 thread, I sat down
and thought about this some more.

My initial reason to tackle this was that the usage pattern is tedious:

	if (can_do_masked_user_access())
		from = masked_user_read_access_begin((from));
	else if (!user_read_access_begin(from, sizeof(*from)))
		return -EFAULT;
	unsafe_get_user(val, from, Efault);
	user_read_access_end();
	return 0;
Efault:
	user_read_access_end();
	return -EFAULT;

This obviously has some interesting ways to get it wrong and after a while
I came to the conclusion that this really begs for a scope based
implementation with automatic cleanup.

After quite some frustrating fights with macro limitations, I finally came
up with a scheme, which provides scoped guards for this.

This allows to implement the above as:

	scoped_masked_user_read_access(ptr, return -EFAULT,
		scoped_get_user(val, ptr); );
	return 0;

The scope hides the masked user magic and ensures that the proper
access_end() variant is invoked when leaving the scope.

It provides a scope local fault label ('scope_fault:'), which has to
be used by the user accesses within the scope. The label is placed
before the exit code ('return -EFAULT' in the above example)

The provided scoped_get/put_user() macros use 'scope_fault'
internally, i.e. they expand to

    unsafe_get/put_user(val, ptr, scope_fault)

Obvioulsly nothing prevents using unsafe_get/put_user() within the scope
and supplying a wrong label:

	scoped_masked_user_read_access(ptr, return -EFAULT,
		unsafe_get_user(val, ptr, fail); );
	return 0;
fail:
	return -EFAULT;

This bug is caught at least by clang, but GCC happily jumps outside the
cleanup scope.

Using a dedicated label is possible as long as it is within the scope:

	scoped_masked_user_read_access(ptr, return -EFAULT, {
		unsafe_get_user(*val, ptr, fail);
		return 0;
	fail:
		*val = 99;
	});
	return -EFAULT;

That example does not make a lot of sense, but at least it's correct :)

In that case the error code 'return -EFAULT' is only used when the
architecture does not support masked access and user_access_begin()
fails. That error exit code must obviously be run _before_ the cleanup
scope starts because user_access_begin() does not enable user access
on failure.

Unfortunately clang < version 17 has issues with scope local labels, which
means that ASM goto needs to be disabled for clang < 17 to make this
work. GCC seems to be doing fine (except for not detecting the above label
scope bug).

The user pointer 'ptr' is aliased with the eventually modified pointer
within the scope, which means that the following would work correctly:

	bool result = true;

	scoped_masked_user_read_access(ptr, result = false,
		scoped_get_user(val, ptr); );

        if (!result) {
	   	// ptr is unmodified even when masking modified it
		// within the scope, so do_magic() gets the original
		// value.
		do_magic(ptr);
	}

Not sure whether it matters. The aliasing is not really required for the
code to function and could be removed if there is a real argument against
it.

Looking at the compiler output for this scope magic.

bool set_usr_val(u32 val, u32 *ptr)
{
	scoped_masked_user_read_access(ptr, return false,
		scoped_get_user(val, ptr); );
	return true;
}

On x86 with masked access and ASM goto supported clang-19 compiles
it to:

0000000000000b60 <set_usr_val>:
 b60:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 b65:	48 b8 ef cd ab 89 67 	movabs $0x123456789abcdef,%rax
 b6c:	45 23 01 
 b6f:	48 39 c7             	cmp    %rax,%rsi
 b72:	48 0f 47 f8          	cmova  %rax,%rsi
 b76:	90                   	nop    // STAC	
 b77:	90                   	nop
 b78:	90                   	nop
 b79:	31 c0                	xor    %eax,%eax
 b7b:	89 37                	mov    %edi,(%rsi)
 b7d:	b0 01                	mov    $0x1,%al
 b7f:	90                   	nop    // scope_fault: CLAC
 b80:	90                   	nop
 b81:	90                   	nop
 b82:	2e e9 00 00 00 00    	cs jmp b88 <set_usr_val+0x28>

GCC 14 and 15 are not so smart and create an extra error exit for it:

0000000000000bd0 <set_usr_val>:
 bd0:	e8 00 00 00 00       	call   bd5 <set_usr_val+0x5>
 bd5:	48 b8 ef cd ab 89 67 	movabs $0x123456789abcdef,%rax
 bdc:	45 23 01 
 bdf:	48 39 c6             	cmp    %rax,%rsi
 be2:	48 0f 47 f0          	cmova  %rax,%rsi
 be6:	90                   	nop    // STAC
 be7:	90                   	nop
 be8:	90                   	nop
 be9:	89 3e                	mov    %edi,(%rsi)
 beb:	90                   	nop    // CLAC
 bec:	90                   	nop
 bed:	90                   	nop
 bee:	b8 01 00 00 00       	mov    $0x1,%eax
 bf3:	e9 00 00 00 00       	jmp    bf8 <set_usr_val+0x28>
 bf8:	90                   	nop    // scope_fault: CLAC
 bf9:	90                   	nop
 bfa:	90                   	nop
 bfb:	31 c0                	xor    %eax,%eax
 bfd:	e9 00 00 00 00       	jmp    c02 <set_usr_val+0x32>


That said, the series implements the scope infrastructure and converts the
existing users in futex, x86/futex and select over to the new scheme. So
far it nicely held up in testing.

The series applies on top of Linus tree and is also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/masked

Changes vs. V1:
	- use scopes with automatic cleanup
	- provide read/write/rw variants to accommodate PowerPC
	- use the proper rw variant in the futex code
	- avoid the read/write begin/end mismatch by implementation :)
	- implement u64 user access for some shady ARM variant which lacks it

Thanks,

	tglx
---
Thomas Gleixner (6):
      ARM: uaccess: Implement missing __get_user_asm_dword()
      kbuild: Disable asm goto on clang < 17
      uaccess: Provide scoped masked user access regions
      futex: Convert to scoped masked user access
      x86/futex: Convert to scoped masked user access
      select: Convert to scoped masked user access

---
 arch/arm/include/asm/uaccess.h |   17 ++++
 arch/x86/include/asm/futex.h   |   76 ++++++++------------
 fs/select.c                    |   14 +--
 include/linux/uaccess.h        |  151 +++++++++++++++++++++++++++++++++++++++++
 init/Kconfig                   |    7 +
 kernel/futex/futex.h           |   37 +---------
 6 files changed, 214 insertions(+), 88 deletions(-)



