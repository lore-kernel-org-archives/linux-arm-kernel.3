Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E5FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2lRSuF/an/7YC+KLWyfsyxeZeo/jAhgGQaxohFrdhc=; b=qB+NFaoS1MsQHpGHgLUzr7qdtt
	gCkZQw+EFDCYGn5W9EuplRBj5x7n8aenO5dM8RpQv2sW54YmgjKJ7T/9Pdgr7EPZK0pdZIAQrlwz1
	T6cqh4sICpcepsJwIokj+IMEyEVqCmlYn2AQxAAQcL7kEkp7flC9BhAcxvMqCXkmj58JSLEdrHbU1
	0aB2AbZyOxaNfKK/hS90KZzNBNGc6YJNDYYwWAgpBAL+TUKU8NQlpbJr0rutiG8B7r66tfygxwToC
	i3Hsk0i6F3/PkDihiWobf3x0H69CJ1LlC0UbYfWY+3l3icqgOsn5rFTuoh2XjdvZYFN6eIhI4fP8M
	cPJsE4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexdB-00000002Vye-44MR;
	Wed, 01 Jul 2026 16:17:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexd9-00000002Vx6-0E6q;
	Wed, 01 Jul 2026 16:17:44 +0000
Date: Wed, 1 Jul 2026 18:17:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782922658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L2lRSuF/an/7YC+KLWyfsyxeZeo/jAhgGQaxohFrdhc=;
	b=EsVOyL/O4PkbWArMdz+v6gZguCvGG9j7x/3IOQgfmssmAyzbqbf3Dwnmp6iiWjIQLh8IAK
	JRAGYLysl4sguhM8CiL52IwItjrsA45kJA1HxJerrdKce1yFKscd6hUfBDk8kRLLBMASP9
	HAaDRaeyfaUrcTEpWpEuetEq4glZT0vuVbB1uLjbuxzlPtCFN1uTxxJMQUwfqVd4rBfF4R
	wCJsPf0rmhs1B6MbHjJUE4G4tH6Wt9Gtq6+Gm8frjT4c8E48ygPJmbA5oLD59dsCa1kUWd
	30TWjA4Jl5hk3kMLudqnPwPZBzaW22VoMTwcgpgNZPMUp1ROWvJNyZ1aXCKRQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782922658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L2lRSuF/an/7YC+KLWyfsyxeZeo/jAhgGQaxohFrdhc=;
	b=qFYc53saNm3tZyv7Mrg+WEORV4WZSIwyhGD1WLYh9NkQnExpQvcYwwIZIB8tgYMjlnnAMr
	VNvK+45twjg6TcDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH] futex: Optimise the size check get_futex_key()
Message-ID: <20260701161736.xYYizA0e@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
 <38239f40-1673-469f-baa3-4a343d2aa4c3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38239f40-1673-469f-baa3-4a343d2aa4c3@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_091743_237853_3CED55AB 
X-CRM114-Status: GOOD (  12.17  )
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

The futex address must be naturally aligned and this is checked via
"address % size" where `address' is the supplied address and `size' is
the expected size of futex. It is guaranteed that `size' is power of two
but the compiler does not see it and creates here a `div' operation
(x86, arm, gcc-15).

We can take advantage of the pow2 property and rewrite it as
"address & (size-1)".

As per testing, the command
|perf bench futex hash -f 1 -b 16384 -t 1 -r 30

improved from
| [thread  0] futex: 0x5619f931f740 [ 7001583 ops/sec ]
to
| [thread  0] futex: 0x55da173e5740 [ 7376137 ops/sec ]

or by 5.3%

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Could someone verify this, please? The 5% look a bit high. This is on
top of the series (but not worsen by the series).

 kernel/futex/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 179b26e9c9341..2b00ab510e7d2 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -520,7 +520,7 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 	 * The futex address must be "naturally" aligned.
 	 */
 	key->both.offset = address % PAGE_SIZE;
-	if (unlikely((address % size) != 0))
+	if (unlikely((address & (size-1)) != 0))
 		return -EINVAL;
 	address -= key->both.offset;
 
-- 
2.53.0


