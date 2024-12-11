Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JniKxZaKIckwpZT/I3NSeEVGJX/9DihSJgU5m9ylrJY=; b=H5z0j0cHKjGadocu1F4nxgfgHE
	5kw7ULj9Vw4PZnklHJSf+oez/za2CGvEcCEb7oCj99fcBoqFAWLeqtWMurAl7NbjCXjTpw1vFE6oi
	K2hYc8Y9mU+DkOVZ9Q0CsPTN8Q8rEWIgj9OsjiJyG+/w8dQAl0QmUI29Tukhhz8N/tAqDyMT8ot8Q
	SgWKjLaP1NPWT1zTtoJXQbXQ12Q4+yWN6C9x70qFt46fsOO7sNAmawGxNNxx8AvKR8PQZMGN4vghl
	ur3mAnSIOTHnrE1AJ8BZ0uYOre8Bj/Sm1aOdeHzDgmhSclh8J7kRBb4h/rFvxWenu75TfAE6Dlhz9
	06VXOWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNgK-0000000F8Rg-3INi;
	Wed, 11 Dec 2024 14:27:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNeT-0000000F8EA-0N1R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:25:22 +0000
Date: Wed, 11 Dec 2024 15:25:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733927119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JniKxZaKIckwpZT/I3NSeEVGJX/9DihSJgU5m9ylrJY=;
	b=oZ3V66Sew7gClffQOrHqY78VWXJUbUzqFXHLdb6mAJUHtN2lM53BRX0HxOUm21QQDlSmIH
	r2Ka4+RbT0M60LM3aE+tOiVwbNWJptwi+foi/VMCODdUgV60nNKhYtMPiBiCZJ3+Aadwuo
	n01zz9i0K1crpJHShTz83I6JmdMyw76zmLNbbqUPBDHmCbydd0cDAwFVRnHT9NOxM7++77
	4oZN6WBmzSPwKY2UPo38UjvNSx5un1kF5593+Ab9mC3RoZghFEXjR8kahVmgPkknbVNrBA
	kmZuBQiND+pNNb/1mE+4GpqyYThyVarfjAaNZ4VxZKr30fb19DyElD/6DjObXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733927119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JniKxZaKIckwpZT/I3NSeEVGJX/9DihSJgU5m9ylrJY=;
	b=d7+F9tU81J6PP0W/cr25Ib9q5pTZelDPbjs7enEICI6UojHUyU8/5vvl8k9YB0rsU4bX1d
	LahZ3EQ1IsluJFAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
Message-ID: <20241211142517.fhnOz46I@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210160556.2341497-4-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_062521_273111_2598CEDE 
X-CRM114-Status: GOOD (  15.75  )
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

On 2024-12-10 17:05:55 [+0100], Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_HIGHPTE was added in linux-2.6.32, a few years before 64-bit
> support. At the time it made sense, as the CONFIG_ARM_LPAE option allowed
> systems with 16GB of memory that made lowmem a particularly scarce
> resource, and the HIGHPTE implementation gave feature parity with 32-bit
> x86 and frv machines.
> 
> Since Arm is the last architecture remaining that uses this, and almost
> no 32-bit machines support more than 4GB of RAM, the cost of continuing
> to maintain HIGHPTE seems unjustified, so remove it here to allow
> simplifying the generic page table handling.
> 
> Link: https://lore.kernel.org/lkml/20241204103042.1904639-8-arnd@kernel.org/T/#u
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I sent a patch to drop HIGHPTE support on x86 today, see
> https://lore.kernel.org/lkml/20241210144945.2325330-9-arnd@kernel.org/T/#u
> 
> If that one gets merged, we can merge this one instead of the one
> that makes HIGHPTE depend on !PREEMPT_RT, but if we decide against
> the x86 change, then we probably don't want this one either.

Based on what I have written in 20241211140402.yf7gMExr@linutronix.de it
makes sense.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

