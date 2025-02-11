Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B5C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMch1HIVZL0GsRqZJwBamjdSUtwIeuUTfLpGso7d8Mc=; b=sjkoiJoFupi3EE3CDhJrnL1iKE
	q5+xFkcXf5/r/EOqh1TH9WLsNiM5+am2CKzJrW+ymm/bEXxkjVgkFXY5UH8EGqDQBqlQfcYBLtw2C
	O+FsvrjCRV7roVszAotn/RPSbcSxyWx9MthGgpAi9YFA5+akPD+vEk/ZVmuSDZmfynbhKSof4fdJ/
	X7NAGycq/gC/iMI+lDVljYZSjjyhIasS6Q7/EOlZmCsTT9ltRMUDoyYJfz/8vRmOn8LYpVCeOgitv
	MpWuHE2IqwUO8NZ2JixvXuWzcCPpiAKOv/2gdZH2SMqILsS48uLEOklvqsmru9sC+2gTyDEqB0eqJ
	rcZwIXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrrF-00000004EOB-41sr;
	Tue, 11 Feb 2025 15:07:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrpq-00000004E3O-2Uj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wMch1HIVZL0GsRqZJwBamjdSUtwIeuUTfLpGso7d8Mc=; b=da6tO3St4QZjVO9rW5F4uw5AHD
	FKKdPane4YRfDJt9BuaW78I6ABcPLDGY9pB2W9mebXiwCvIrkcJ6MYsl0ck6XjJrA7Hvq3F8D8/Gk
	2p6aS/oHO5W3vxSwSZO8d52Tceo0y+QVrfstynyfMd3Fer0pexVHmRnB/JeC1cKR5u8CaPaxt6tmG
	RMGSjhW7oY6BSTKK/Etjg1oitWjybsNRHf7qNvvhZqiz10sGQM/PSsA7T3LFQInUbUHUgQGxG7xh/
	FPxwbYS7OUqo53l7IkdQne4GIwwQSli6lFvWL+cK1InoT2pakLgxpGldWVToqhIde+fAAtJSZqURN
	KvoCpPWg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51408)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thrpV-0002fz-25;
	Tue, 11 Feb 2025 15:05:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thrpS-0000AA-0g;
	Tue, 11 Feb 2025 15:05:38 +0000
Date: Tue, 11 Feb 2025 15:05:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/9] arm: Rely on generic printing of preemption model.
Message-ID: <Z6tnQvIBlGnoGRN_@shell.armlinux.org.uk>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-4-bigeasy@linutronix.de>
 <20250210120429.iFfBClW1@linutronix.de>
 <Z6oYO5uKlEJ8C8Ne@shell.armlinux.org.uk>
 <20250210153902.06VTSS6d@linutronix.de>
 <Z6oo0MExaEy5J55_@shell.armlinux.org.uk>
 <20250211145249.StI6tEZv@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211145249.StI6tEZv@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_070602_625902_B01ECB2A 
X-CRM114-Status: GOOD (  22.20  )
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

On Tue, Feb 11, 2025 at 03:52:49PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-10 16:26:56 [+0000], Russell King (Oracle) wrote:
> > > This this applied, die("test") on ARM ends as:
> > > 
> > > [    1.595106] Kernel panic - not syncing: test
> > > [    1.596044] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W 6.14.0-rc2-00009-gb80a798df08c-dirty #13 PREEMPT
> > > [    1.596768] Tainted: [W]=WARN
> > > [    1.596946] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
> > 
> > Hmm. I've no idea what you're testing, what you've quoted makes zero
> > sense to me.
> > 
> > First...
> > 
> > void die(const char *str, struct pt_regs *regs, int err)
> > 
> > is the die function prototype, so it takes a bit more than what you've
> > indicated.
> > 
> > Second, "Kernel panic" suggests that panic() has been called. However,
> > this only happens when die() is called (or more specifically
> > oops_end()) from either interrupt context (in which case we get
> > "Kernel panic - Fatal exception in interrupt") or if panic_on_oops
> > is set ("Kernel panic - Fatal exception").
> > 
> > I don't see a path which would result in
> > "Kernel panic - not syncing: test" to be printed from this path.
> > 
> > Since __die() does not call dump_stack(), we're not going to call
> > dump_stack_print_info() from __die(), so I don't think it's appropriate
> > to remove this information.
> 
> Okay. Let me try again with a stack overflow during boot. With the
> series:
> 
> | Freeing unused kernel image (initmem) memory: 2048K
> | 8<--- cut here ---
> | Unable to handle kernel paging request at virtual address df82a000 when write
> | [df82a000] *pgd=80000040007003, *pmd=41487003, *pte=00000000
> | Internal error: Oops: a07 [#1] SMP ARM
> | Modules linked in:
> | CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.14.0-rc2-00009-gdca8d546a8a3-dirty #16 PREEMPT

Got it. Printed from __die() -> __show_regs() -> show_regs_print_info()
-> dump_stack_print_info().

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

