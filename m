Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB3CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=; b=cikH4W8+pEKa4TA8EWLsqAQG5+
	actJnM23AjqXrpDyCatrMy8lHKzz1ANlKlZheH7awA2qQph+Y64lhPFmfMVC9nTahbBukVRsNzoBS
	f9pA58qfRbXJ3KVeR1BSKxL8QymjWnonFSKhDZqCYGHt84WrCWxvvoc6+uUholHoyK9MYVOEq0cLr
	UVHYg7UgFNILaFRSTZrAPBdMbWwAv10UijXfPLT2ixaIxNwTP9Ru3npUah2BXth0QkOvZE8ZUd40l
	B7nCycemN7xqbadY2b1zDFeaZ9TWjF182p/lOMdsgoosdJTxe+YQfWWcGz24BsnKQpt+FY/h3dDdA
	rtIe+GHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpG-0000000FF2B-0vtq;
	Thu, 06 Nov 2025 10:02:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwp0-0000000FEex-1qfF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=w9PW9ll4SirBP3p5BmkWSwcxX9yBXq2ZLAtMao42da/rXWAnfeOtC1bJ9E8uAfpxuSE2b8
	o07hAS/4ARBr1kRqhqTX3XwZDQsgQ+FrFmE7XJMCGEXaB3jbVJrTSErDfCMYnV+vU7oRWd
	M3pggh1B7o4RNaeIYbjFDC15R3pGSZ7sPp7WD5gZIuZcMJxq/sUfoDglnjG5zT3qid2PH7
	jzIhhtDpYrfa0KoL3/elxR9+XxUP7WmSF6bX5TALqR88WnUut9GIod+6V4RB+c4yddjEKh
	PRaFadMESxmzpE2bz01vYUPmZZWNXbrxU0DD02uX7uuDs1tPvs5rlLRHiMFQ7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=roC/+VvH0dZdpOXVcl5LaZh8YoB3OJiAs7429ePimDjbFeWjQFkuAY1yyXpFRnqgrs+hL8
	3HyvwAGXnWd15yDQ==
Date: Thu, 06 Nov 2025 11:02:14 +0100
Subject: [PATCH v5 21/34] vdso/datastore: Reduce scope of some variables in
 vvar_fault()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-21-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1296;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yVlwKjEkg/2DD/Mb0uz8N0TzPw8B5Wtv5ed+5obQYGU=;
 b=rikyX4UvTCgMDvnqGEuNjGrWUOEUBhmdyXJkxjtZyBaXdECGv3cgj+MOuFa0Z7Wx1uBoedvNc
 xcGQPOSE4rSBWH/8RnmCUhVj64mbOeK2j099iHbxdTUw9CYVbrde/2i
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020226_666797_BF6AD227 
X-CRM114-Status: GOOD (  11.40  )
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

These variables are only used inside a single branch.

Move their declarations there.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/datastore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a04ff4116c14f43f4450210eba99c5..2cca4e84e5b5e7686d6a2b42b41af4f399cc5261 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long addr, pfn;
-	vm_fault_t err;
+	unsigned long pfn;
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
@@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			 * Fault in VVAR page too, since it will be accessed
 			 * to get clock data anyway.
 			 */
+			unsigned long addr;
+			vm_fault_t err;
+
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 			err = vmf_insert_pfn(vma, addr, pfn);
 			if (unlikely(err & VM_FAULT_ERROR))

-- 
2.51.0


