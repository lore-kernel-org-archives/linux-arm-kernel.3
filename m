Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D10CEACC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOqB4C/lS20t6tPC5FIrQm+ReT0eGwkkWKV6KUVlY+c=; b=s/pM1GtC3fcno54P4wuEN+UhlT
	+XBltIs/vWBF+BdSXcCB/hUSuUE/MdVlO/+gEinHrGVbiUjDMtV3sFo9C3fi/DX3+VvEy/LVSzf/p
	uPY6kScnvy+BugrAL6RgV52Vtb8NbAR/ixKrYrKRT4UvsbIPWUqGrzErF9yZch1r7aJONlFyyQlBd
	rOM1KXyLw4eSKNOOkbTRJPv11MZ2X/Cw79+XIfKnYnzW+XBPDFlkS+Y/42uzaw+a3BNCf+IiIdHBt
	PlK5Wohig8587J+NUZc+Zo5v4pNn1iNY2slB7FezoIzBpfg4HwmGyYtQPpZnanUORsZ0KU+FKUsU4
	Gz8QTYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK04A-0000000D3sE-2KR7;
	Fri, 14 Nov 2025 20:06:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK045-0000000D3rn-3DIU;
	Fri, 14 Nov 2025 20:06:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763150795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOqB4C/lS20t6tPC5FIrQm+ReT0eGwkkWKV6KUVlY+c=;
	b=YK9eEZEalWaKmf+x8aV4nBEexkqfsmiKreG3Y2jkPgAgLWTY9R8IBAqeSpkzvcfTlK/5vT
	+O81wGsZ0UIeJ5jBhUw4Eoayfv/X/R8/YAkUQfbLySwBD+nR9giKh2lTUX2IuXR2sbXviX
	FoDaeDfQYEVnADDuXPIQ/3NYR3mHOmWH0metLgocPmrm5KlONkA2MI+xuHLeh3MThztb1A
	kXnDdCaO2sDMKHkhrx9itHQBX0xVNdyadNovuurLFgsetAEAqd8BZzCxmcKF/5SsAQ1SuC
	9Fvj3cEHnJH7K5iz+x8gAJ7PDgm0830h9iPB4luicMqudfO8UPSUoF00Q35K7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763150795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JOqB4C/lS20t6tPC5FIrQm+ReT0eGwkkWKV6KUVlY+c=;
	b=1Zyc6PyPyhUajFuS2x9XsSMHMGTgSzQMRTnNoHUVo4zlrqPxJr60WPV70Jazg4G37kJhwh
	jOcgXkNRpr6vopAw==
To: Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, rcu@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v7 00/31] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <1a911310-4ca5-45a4-b9bf-5f37c6ab238e@app.fastmail.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <c4768cf3-f131-44e6-9b25-ebeb633f32ee@app.fastmail.com>
 <beb46a02-b902-438b-8b6d-b5f0d7ad0ae6@app.fastmail.com>
 <89398bdf-4dad-4976-8eb9-1e86032c8794@paulmck-laptop>
 <1a911310-4ca5-45a4-b9bf-5f37c6ab238e@app.fastmail.com>
Date: Fri, 14 Nov 2025 21:06:34 +0100
Message-ID: <87zf8o9y5x.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_120639_869650_369856F4 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, Nov 14 2025 at 10:45, Andy Lutomirski wrote:
> But I did that test on a machine that would absolutely benefit from
> the IPI suppression that the OP is talking about here, and I think it
> would be really quite nice if a default distro kernel with a more or
> less default distribution could be easily convinced to run a user
> thread without interrupting it.  It's a little bit had that NO_HZ_FULL
> is still an exotic non-default thing, IMO.

Feel free to help with getting it over the finish line. Feeling sad/bad
(or whatever you wanted to say with 'had') does not change anything as
you should know :)

Thanks,

        tglx

