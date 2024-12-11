Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNWhv5561LH+95ZybovZ5QdJpH0cPUFUZxKRgUtXR3E=; b=i2M6o5eoFjNnZvtv4AILzLdNBh
	9iPV+78cvS4aI6RAReD1ZB4b6TzirqiLNOJde2z2eRLtaiiD1Q3EjjYre559/Hggol6afnH+tC5nn
	isXuv8cnhhdKc4wmozAUdKwCb5gFx1ku9UX6Jg1DHtQNfXiGipTC7DnfBS8D6sIgGOCkTPeQ1wFFv
	j6koXKBssSCKsxhQAMZ1/HmFUiThtMFUqyzbJcGp0Ca9SVo6+Yobnir2ZuoDEveBYeF7BYehI2n5D
	D9SP1JmahOjFxnJlAdXmu9tR/K12qogsJaJCNz3AdLywKXRbWe10dmq/n6VhY00xYyq7mgxc7jap8
	49jeec8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP9U-0000000FN2d-3h9R;
	Wed, 11 Dec 2024 16:01:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP67-0000000FLjz-3BeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nNWhv5561LH+95ZybovZ5QdJpH0cPUFUZxKRgUtXR3E=; b=ulUOh6HOqEKJ/+/0ZTK/7V4JHs
	IYfIm3L3Fkn9lb8DFP5UyS6eX3eSLbEgzX29gw5Me/d9xkMQ//Hn+bJbR3pT4jN4rErOXi4eKbQGp
	+OL+TBvpdG0l8l54bTeNZTfTEWl3xU5wsNCqV5TyfESZ5fsf+soeB60fmIsNqlJ4tbD1/59jcMOnH
	SBoNQaErwL41M+p5wwp9jRoe3pWupX74UV5NihoTveX9a8DSi484J4WXGHkXi9QEvGeMz9AT0w79t
	FFAyGZ3nPdkV4s5LaWpBgIO4/oM9EO+F2DWiUnOMCtOt5as48fE1m8hqzLQxacQ758xMBbNzsjrcd
	L3MGkrlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47116)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tLP3o-000493-1m;
	Wed, 11 Dec 2024 15:55:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tLP3j-0004Rn-1O;
	Wed, 11 Dec 2024 15:55:31 +0000
Date: Wed, 11 Dec 2024 15:55:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Message-ID: <Z1m18yn67dsJRVWA@shell.armlinux.org.uk>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <20241211134811.wM_UADhQ@linutronix.de>
 <20241211140402.yf7gMExr@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211140402.yf7gMExr@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_075759_791522_614142DA 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, Dec 11, 2024 at 03:04:02PM +0100, Sebastian Andrzej Siewior wrote:
> On 2024-12-11 14:48:11 [+0100], To Arnd Bergmann wrote:
> > I guess if you have boxes with 4GiB+ and can proof that the performance
> > improves without HIGHPTE (since you don't have to map the page table).
> > The question is then how much of low mem has to be used instead and when
> > does it start to hurt.
> 
> Some numbers have been been documented in commit
>    14315592009c1 ("x86, mm: Allow highmem user page tables to be disabled at boot time")
> 
> and I would like cite:
> | We could probably handwave up an argument for a threshold at 16G of total
> | RAM.
> 
> which means HIGHPTE would make sense with >= 16GiB of memory.

However, there is more to consider.

32-bit Arm works out at the same for this:

    Assuming 768M of lowmem we have 196608 potential lowmem PTE
    pages. Each page can map 2M of RAM in a PAE-enabled configuration,
    meaning a maximum of 384G of RAM could potentially be mapped using
    lowmem PTEs.

because, presumably, x86 uses 8 bytes per PTE entry, whereas on Arm we
still use 4 bytes, but because we keep two copies of a PTE (one for
hardware, the other for the kernel) it works out that we're the same
there - one PTE page can also map 2M of RAM.

However, what is quite different is the L1 page tables. On x86,
everything is nice and easy, and each page table is one 4k page.
On 32-bit Arm, this is not the case - we need to grab a 16k page for
the L1, and the more immovable allocations we have in lowmem, the
harder it will be to satisfy this. Failing to grab a 16k page
leads to fork() failing and an unusable system.

So, we want to keep as many immovable allocations out of lowmem as
possible - which is an additional constraint x86 doesn't have, and
shouldn't be overlooked without ensuring that the probability of it
happening remains acceptably low.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

