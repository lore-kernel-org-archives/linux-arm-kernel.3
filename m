Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7057ECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=; b=xzQbPKF5hwT6ay
	osXYhhE15xa8ytsT9zBrzv0a4hvmhuOJE6jqpp9ZuZ+r6sEbRhWrj1HBFsfCBaSUx6uHF0F6rJV6J
	f8Y5IaDSA1gfpTVi0MWy1WfqABRtLxSqweme5IX8/HGKKv8ncgw1pMMDbH8o2hLlLdRtnnjX6kH4q
	CYyByzWNVXvsS+QV5hqYQ5p7Uxzo6PyxXEdUDMUf1xGvTVBMp2v7q3RUMIJHC4R9+wEc293PM2XhH
	PrKAldGrhrfgk2JnPsvqQE8g1J1lmkYupmOyl3GuNRWGG07P+UGHeIXrImM895bQY7CIN9t3bbh8z
	ddb7ZRazwofm8NK/CNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYIL-00000002rYv-3tv0;
	Wed, 22 Oct 2025 12:50:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYHJ-00000002qUS-0qyu;
	Wed, 22 Oct 2025 12:49:30 +0000
Message-ID: <20251022103112.599762593@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=;
	b=c+GsN7Okc6pVlhYZbNSP7Toqy1JPrPZo2WWCszVxgnGybEpRPIQIW6Oi++aJ7M7EDT5dih
	h5W1u7FWU9oeSXrfkqgLl34z0J+QHvA4b7h1UdTaSb3j4GNm74ot+FAPrjzNyxyUUYuQxA
	H2dbgpZcxCrNjP/+2WXs3ASsUYmpNyG3c1Odt1tWMxPuYJicOmHtcBcVm8vAUKTDG1GHMe
	EJbM5XwdqiAVnbKG7S/5QlckGl934URCN+8uz2S6h2zVGfduEqUnMA2N3jVYqd21H2V2Bs
	0Fd1DPkOp2ObPYIF2FbETMhr1t84W7XZDyHSCvUCrJXKJMafpd0naiVUH09whQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=;
	b=XL9aqYXe9gwXBer7lMaKuJJPuEejbrtT8VGos4rq/T6Pk40BsJ8Lc68pZAE8duaBoNwxvZ
	zqjZ+XGAseMveoCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org,
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
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [patch V4 12/12] select: Convert to scoped user access
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 14:49:16 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_054921_423902_C7EA937B 
X-CRM114-Status: GOOD (  11.39  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the scoped user access guard.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
V4: Use read guard - Peterz
    Rename once more
V3: Adopt to scope changes
---
 fs/select.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
---
--- a/fs/select.c
+++ b/fs/select.c
@@ -776,17 +776,13 @@ static inline int get_sigset_argpack(str
 {
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
-		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
-		else if (!user_read_access_begin(from, sizeof(*from)))
-			return -EFAULT;
-		unsafe_get_user(to->p, &from->p, Efault);
-		unsafe_get_user(to->size, &from->size, Efault);
-		user_read_access_end();
+		scoped_user_read_access(from, Efault) {
+			unsafe_get_user(to->p, &from->p, Efault);
+			unsafe_get_user(to->size, &from->size, Efault);
+		}
 	}
 	return 0;
 Efault:
-	user_read_access_end();
 	return -EFAULT;
 }
 


