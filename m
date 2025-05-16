Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6649C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpBkNoozJVxD0Tq1ED6D91sfOcjjeUcczIiXGsr8Xa4=; b=VXl44E/aS1EmqFOXHRWFcxOg40
	/vT33ZafRJ380C8+J6uP39+XKIIgB6Lr60qK9yuWGTFgPqg0nknvqbEcLaYpG7pHIfrq4IGs4ic6k
	M9E7oCSgsxlH7n+AXOmJa8AQFTt2Dfm8HLH6ts0/9BUVFP+W6L9UDB5Q/fGRpob0iKWAe7/fT/M4w
	dyk7bnCuzFPWlD/Mn2eaFvL665g/yJtjaazhcW7Us+SBlOLuepeWSXhGAQe8UYu/9vd75QSOPfk84
	FNMBAcBqc8gHMvSAi8g8hzBYqif6jFKb5pN79MHiAM0Dv8gmQKeo7sEwUgjyXeCXpCSZVq7HhOfxJ
	BALWAX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqtS-00000002vci-10cz;
	Fri, 16 May 2025 08:58:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqrP-00000002vV4-2wWh;
	Fri, 16 May 2025 08:56:09 +0000
Date: Fri, 16 May 2025 10:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747385764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpBkNoozJVxD0Tq1ED6D91sfOcjjeUcczIiXGsr8Xa4=;
	b=aBYd6I8/V6Pks/ycPy+/9hpvymndG8CqJ3udu8r5+O0NqEyuqUjG8dV+Xilch/vOYTSS2O
	Za0yiBEoQYer3mi17p0x/iZUvKU4c7R1GKeXbqQcimcw1rWdDsq0dyx81CRlHqgRep+F5v
	s60YuWaabOj1Z7t472P1i7+AKQmCVDH0ZVMAFovdZeD/wxWJnfhLUdbHvqwlT3Rcm/sIEo
	/rN8R+Iulo7vx1CdPsKGLq0KL+BTBfYxAPGftCib7K8aCN7mLOyE5arjDB8P0xwYDAIXy2
	2CyW8fkln40Uq1Wz0hUYPqye6z2gb/K2ZZ2R1grOVtwAP/HnCVItGIc0ea6xnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747385764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpBkNoozJVxD0Tq1ED6D91sfOcjjeUcczIiXGsr8Xa4=;
	b=6ufqT1mobYp7JSSs1K0Omsc0AhHenLEHpntMn1SMwQZs6Bqn7id7Xzyi9d/oCd+si9xvqM
	XFCxkDCbqLKa9mDg==
From: Nam Cao <namcao@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <20250516085522.g9Uq2WBN@linutronix.de>
References: <cover.1747046848.git.namcao@linutronix.de>
 <aCb1kBEkiriPbMo4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCb1kBEkiriPbMo4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_015607_877124_86837993 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 16, 2025 at 10:21:36AM +0200, Ingo Molnar wrote:
> 
> * Nam Cao <namcao@linutronix.de> wrote:
> 
> > Nam Cao (22):
> >   x86/tracing: Remove redundant trace_pagefault_key
> >   x86/tracing: Move page fault trace points to generic
> 
> Does the renaming of the tracepoint class from 'x86_exceptions' to
> 'exceptions' have any negative effects on tooling?

No, tracepoint class name doesn't affect userspace. The tracepoints' names
seen from userspace are the same after the patches:
	exceptions:page_fault_kernel
	exceptions:page_fault_user

Best regards,
Nam

