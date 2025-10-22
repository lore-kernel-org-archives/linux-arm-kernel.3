Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D1CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=MKNcUChSn/NfFd+dS8+uLnvvYuPvhQsaUPbuMoERc+Y=; b=YL7OQFjZOR80QS
	vcaCrCb4L3UssYzO/Wvyf0giMnZugTq9VoyMIRzQdnFj7iUngumU3UtjUfIT+F/767srBAUano3hL
	nKGp9DIpttr7p9BTwzCPcG6ddz3ZFQbroAOQej6g5U6/MQthbSuS417PnMDn2VIFyzYHsWDfF3TbG
	aCAwzLjSxKeUZK/yA78WvxDsEbr2sJM1d9wta0OeS5vjYPx4+TT0EdY8oy9QH/EyMMBGU6kf4qCOt
	gv9cD1H6rEQMhpiYcm3Rz+7hsAKhiWEUGydjydOHiHaARi+Kd8RLX3AoLDenEc+GATjRQcdNQrh1G
	BoPZckxYC8VRaXpj/INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHh-00000002qrf-3ps6;
	Wed, 22 Oct 2025 12:49:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHC-00000002qPa-3FNS;
	Wed, 22 Oct 2025 12:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=MKNcUChSn/NfFd+dS8+uLnvvYuPvhQsaUPbuMoERc+Y=; b=HK48sjs9iihPu5cScYoOSCpYcW
	c7H2csDT04hjOZSZFbdy1cEtgPiQBV+tcYZNB1IQYDvUAXVAT8zqqaR2fyaDO7lrOgJ26h306k6TP
	Tj8OGsxPAYEBmWfmpxubp3jmM+34gIAcjM8s7ChR+tsUbwgXU7OJQ2jGgYHKugFySuNRHek89xoHQ
	GKTaCrI5jB/ZCR/c+g6VF2ty22Hg9PCAT2XM5wXNzRAOzIemU39Edu/Xd2uysIKjgu1/GW3oYLJVl
	e/XeK91zOS8O1HGKG6skcMPcBdyOzE1ugKj077gp3mvxQNqdzATkpdtEzWfhAiYKfUdYVb0L/0Xbe
	8Reexfog==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXPT-00000000X3L-3Slm;
	Wed, 22 Oct 2025 11:53:45 +0000
Message-ID: <20251022103112.232389777@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=MKNcUChSn/NfFd+dS8+uLnvvYuPvhQsaUPbuMoERc+Y=;
	b=a+rP69sfJ/Qp9q3znoDwceoCND840rG89ZVmZnuwGf5auP3gibFmiK9GeAwPeKlsQPgjSC
	IEqDkhxWDgRylSHXUcBaufuyU0/+DeBR9LE0wMGuAySTKPrhbWb7NBxN01PMlZG65ZnUdx
	9nQhGFU8gZHZZ5xxFRf2aI6pAPw7iR+PiAlFiq3RxntxNFyLAqDnifIWEG+9PAntrrgwZi
	rDCWm4zogflzWQHer9+U8mqmPmY7BGAZCUtifi/nt78sGYZqEj9Hg7TN86VsDKDu39fTHu
	U3CT83eVCk6lxvVN0wBHfNiXmYcrzkHYw44qZOqKRncTZNgK5wwPA+VEwQz9Pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=MKNcUChSn/NfFd+dS8+uLnvvYuPvhQsaUPbuMoERc+Y=;
	b=Ad5CWnRPgGiAM9amesSMP3EPFCura86UkqdaB4otezD1D4yBpXZCc6MwYvvX+osIXMIhow
	Gu/Agcs2yZ8ttBDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
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
Subject: [patch V4 06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 14:49:09 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_125344_074057_2541D0C4 
X-CRM114-Status: GOOD (  11.44  )
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

ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:

bool foo(u32 __user *p, u32 val)
{
	scoped_guard(pagefault)
		unsafe_put_user(val, p, efault);
	return true;
efault:
	return false;
}

It ends up leaking the pagefault disable counter in the fault path. clang
at least fails the build.

S390 is not affected for unsafe_*_user() as it uses it's own local label
already, but __get/put_kernel_nofault() lack that.

Rename them to arch_*_kernel_nofault() which makes the generic uaccess
header wrap it with a local label that makes both compilers emit correct
code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/uaccess.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/s390/include/asm/uaccess.h
+++ b/arch/s390/include/asm/uaccess.h
@@ -468,8 +468,8 @@ do {									\
 
 #endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT && CONFIG_CC_HAS_ASM_AOR_FORMAT_FLAGS */
 
-#define __get_kernel_nofault __mvc_kernel_nofault
-#define __put_kernel_nofault __mvc_kernel_nofault
+#define arch_get_kernel_nofault __mvc_kernel_nofault
+#define arch_put_kernel_nofault __mvc_kernel_nofault
 
 void __cmpxchg_user_key_called_with_bad_pointer(void);
 


