Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC1CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=buXtarGTm5jtJPETYvya0klPdCPo5lg6x42RHvHcKok=; b=byEpde85/SEoSC
	cl2swtjpbFKBh42eetjrl9JYtJ7wMTLwegQvfDHcUzP6hGODgzEq0es2lBNYlSe5kNrITZLWI01/k
	3fVEEVavycGWONCKK8INIxF3s3GUgqF0IB4Bj51aP/LJSEO3fy/5xjyz+tpgpA+4h/8YrI+o4pt+4
	46feEKAu6EgT1P18TnSIUcyFxK2/+UT2HSfn3HtDAh8AOy0Rr2ZRLMV5bA7T2nY5JNfZq4FSlCG/V
	Mp6ZQFGxbFkQZh3eZWHG17uhiMFyvgruk+M2H8gC77yZrR/fXkREV8+OD++YKqrLzyK7IX/zYhRFI
	bujkTRYzAkRpiYb5actg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcK-00000008TZA-1Dxk;
	Tue, 16 Sep 2025 16:33:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcD-00000008TU6-1eXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:14 +0000
Message-ID: <20250916163252.100835216@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=buXtarGTm5jtJPETYvya0klPdCPo5lg6x42RHvHcKok=;
	b=tMTiXy8mUOfJCFDjOKCgDFF1NRDxySWAX2O8TLSvs30T9S1E2AiTsQVgh458xzHMSqXC+2
	1kcDX0vVYCkmHTAnaz0FZEsRLQAAvYHzKDLzisOvelP0eqKwFI6cc4j+0qctuul9fH7MjB
	7wIpQIG4gAC6OzloTYfH8zv2oLDUVnHsmZuwknO78ukUXHESIfyJ7Ol0y+74ie0REODCVS
	J7WwfoNfO3O6ow0DP1vSfLqvfBAxhU8IVWtU3vBeuW07mt/gQmZw61yF3qXI8YHcyvsOIp
	13UYm6KCKQuy+rUfIT3REKlA5bOgbNNXmZZLG4ix/OlbvfXQOuxavMGPHieSdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=buXtarGTm5jtJPETYvya0klPdCPo5lg6x42RHvHcKok=;
	b=2X5FfAfxhvDIRItdbY0APY7iqOVIg/EJmgLkNdRtkF+wSl4K88PZjRMj9VVKNrzby18DHX
	Rzngsjl5TGRcEHBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 x86@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V2 2/6] kbuild: Disable asm goto on clang < 17
References: <20250916163004.674341701@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 18:33:11 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093313_576079_2713D43F 
X-CRM114-Status: GOOD (  12.03  )
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

clang < 17 fails to use scope local labels with asm goto:

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

That prevents using local labels for a cleanup based user access mechanism.

As there is no way to provide a simple test case for the 'depends on' test
in Kconfig, mark ASM goto broken on clang versions < 17 to get this road
block out of the way.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>
---
V2: New patch
---
 init/Kconfig |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- a/init/Kconfig
+++ b/init/Kconfig
@@ -96,9 +96,14 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
 	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
 
+config CLANG_ASM_GOTO_OUTPUT_BROKEN
+	bool
+	depends on CC_IS_CLANG
+	default y if CLANG_VERSION < 170000
+
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
-	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
+	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN && !CLANG_ASM_GOTO_OUTPUT_BROKEN
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASM_GOTO_TIED_OUTPUT


