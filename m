Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBDAFD0073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 19:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUm9HzLUU22F5cVwjfz4Zoc4xR/667vc4nney7zidvE=; b=FwBNrzgL3YvQFYWRWVyDMa2Oob
	oXxNgLx0jmDHfXYhsGAzhtUB5ETLjvfeZeV349s8HB/XwA9FZqosk4/3rO4x6VYmkoaFvq+OzmMie
	ETgCBMDla650ZMpmU8VFOAUlJqpuS58hoUkbnzbkq7+MJveH1ySZArWVKh4t/w0fD3n5FSjEN0tQH
	vUGqew0/Yi4/stSl6cclHcAN6zt3HVC/pFym4tyWkpskV8WkCvssjcl36r1Kcnk6GdVFvS+XkGnnB
	uQdCp1RMt+J8xHWbczInI+9VjVihbFQcYg2M1M6fOHToQ8FOfYCHCeprMiu+KejnJtJHmSBEm/lQE
	0QYwoqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmYW-0000000Bow7-06o1;
	Sun, 01 Mar 2026 19:34:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmYU-0000000BovQ-0hGn;
	Sun, 01 Mar 2026 19:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 245B560008;
	Sun,  1 Mar 2026 19:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D9BC116C6;
	Sun,  1 Mar 2026 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772393656;
	bh=BS3ZMwHlDBcAakH4xSCy5YZLU7NRjvFZNyLUzpzSoag=;
	h=From:To:Cc:Subject:Date:From;
	b=fBMoKZh/LWCvwocBJu3/DdC0EKLnEGnsvFsFINLPykRPzdRWemfcP23uVosUvNyQU
	 LRS5bvFJZDxSZkMlwzOw4Q9gcfCc9YeJPDZ595R+nFJuTlGbuECzRBOyUNBixZFt5D
	 iE6iCR4qfZsuoqEikqKYjCmQqHupeKgd5ohtJHLAKZG9ct5D+lRrUezJ2xNtVUijBa
	 Af6pXyHwm+tJZeEEamUZy10vahwIWTBFKZnBtk749nsFwX6r3fnDReMFMlj+wF5hhC
	 s98itWgns3vCxpdLt7eM0O1669ALiZebwBSZ8BHviYayyJ1j0E9NlR26Z/ra4XBWdC
	 Zj+TlcM/lie1Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andre Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] uaccess: Fix build of scoped user access with const pointer
Date: Sun,  1 Mar 2026 20:33:58 +0100
Message-ID: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510; i=chleroy@kernel.org; h=from:subject:message-id; bh=BS3ZMwHlDBcAakH4xSCy5YZLU7NRjvFZNyLUzpzSoag=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQumbKswe2Zuf6EuTudmqtKPfYcXrNP0W3Fv5jev4WbX s0s28pV0lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAmkpLB8D+a+w/zg3+ige3h eQsXCTO+PXiEYyrjCsvO1ltzHW5ZPPvO8IspVKT412bj9XLyP/d83ZRVd+LX0vcHZX+6RcXGh8T 9EmYFAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

After converting powerpc checksum wrappers to scoped user access,
following build failure happens:

	  CC      arch/powerpc/lib/checksum_wrappers.o
	In file included from arch/powerpc/lib/checksum_wrappers.c:12:
	arch/powerpc/lib/checksum_wrappers.c: In function 'csum_and_copy_from_user':
	./include/linux/uaccess.h:691:1: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
	  691 | ({                                                                      \
	      | ^
	./include/linux/uaccess.h:755:37: note: in expansion of macro '__scoped_user_access_begin'
	  755 |         for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
	      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
	./include/linux/uaccess.h:770:9: note: in expansion of macro '__scoped_user_access'
	  770 |         __scoped_user_access(read, usrc, size, elbl)
	      |         ^~~~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/checksum_wrappers.c:17:9: note: in expansion of macro 'scoped_user_read_access_size'
	   17 |         scoped_user_read_access_size(src, len, efault)
	      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cast __scoped_user_access_begin() to (void __user *) to fix it.

Fixes: e497310b4ffb ("uaccess: Provide scoped user access regions")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
Thomas, I encountered this problem while preparing some patches to start using
scope user access widely on powerpc in order to benefit more from masked user
access. Can you make this patch go into 7.0 as a fix in order avoid dependency
on this change when we start using scoped user access ?

 include/linux/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1f3804245c06..5d9f6d45d301 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -752,7 +752,8 @@ USER_ACCESS_GUARD(rw)
  */
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 for (bool done = false; !done; done = true)						\
-	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
+	for (void __user *_tmpptr = (void __user *)					\
+				    __scoped_user_access_begin(mode, uptr, size, elbl); \
 	     !done; done = true)							\
 		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
 			/* Force modified pointer usage within the scope */		\
-- 
2.49.0


