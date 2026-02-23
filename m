Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C862DEA4FBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcdCr2FiaC+FaV33TjV5e2CA95tksjZ9715T4tTDq0g=; b=DSe5FlArWs5o+0bViFa3Ech1MP
	nPkzdB31npxsRTiJnfVKuZB4zTm56pw+C/ckec7u7aKK2tFfE1KOjJVDrNIfzhUTiIlFBd3dhy1gm
	2qctvPIvJ8p88ycyQJXE+VDX1kO4rnHAXgEyZlu0qpunfPBjhf/HWa3UVrtQjaBgO0KR9KaVndIMm
	sgzXUPyVPVaIwu1RUooL4E8mp5J4ONOh4csZkkCPisPRnamzNjcWW3K+JLSQoP2DerHqqxRds6uyW
	L1Bu6EexJmbcFC/oppumthUXD0Dq2iK4EWAfCrsniZpufmpNCdX9hOj9pDbKW5LsRMkdPbPpj75D9
	H20h/JLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVj9-00000000Kdy-2DxK;
	Mon, 23 Feb 2026 13:11:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVj7-00000000KdU-0bpc;
	Mon, 23 Feb 2026 13:11:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C1C2339;
	Mon, 23 Feb 2026 05:11:45 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28AA73F59E;
	Mon, 23 Feb 2026 05:11:49 -0800 (PST)
Date: Mon, 23 Feb 2026 13:11:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, ardb@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZxSEoFkXMg18qLV@J2N7QTR9R3>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-3-jszhang@kernel.org>
 <877bs4wi0c.ffs@tglx>
 <aZxLE-wNGaEGDHGI@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZxLE-wNGaEGDHGI@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_051153_231669_109D2267 
X-CRM114-Status: GOOD (  22.40  )
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

On Mon, Feb 23, 2026 at 08:41:55PM +0800, Jisheng Zhang wrote:
> On Sun, Feb 22, 2026 at 11:06:11PM +0100, Thomas Gleixner wrote:
> > On Fri, Feb 20 2026 at 17:09, Jisheng Zhang wrote:
> > > Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> > > is a pointer which is set during booting, and every irq processing needs
> > > to access it, so it sits in hot code path. We can use the
> > > runtime constant mechanism which was introduced by Linus to speed up
> > > its accessing.
> > 
> > The proper solution is to use a static call and update it in
> > set_handle_irq().  That removes the complete indirect call issue from
> > the hot path.
> 
> + Ard, Mark,
> 
> Good idea. The remaining problem is no static call support for current
> GENERIC_IRQ_MULTI_HANDLER (or similar, arm64 e.g) platforms.

There are various reasons for not supporting static calls, and in
general we end up having to have a fall-back path that's *more*
expensive than just loading the pointer.

> For arm64, Ard tried to add the static call support[1] in 2021, but
> Mark concerned "compiler could easily violate our expectations in
> future"[2],

To be clear, that's ONE specific concern, not the ONLY reason.

> and asked for static calls "critical rather than a nice-to-have"
> usage.
> 
> Hi Ard, Mark,
> 
> Could this irq performance improvement be used as a "critical" usage for
> arm64 static call? Per my test, about 6.5% improvement was seen on quad CA55.

As per my other mail, does this meaningfully affect a real workload?

> Another alternative: disable static call if CFI is enabled, and give
> the platform/SoC users chance to enable static call to benefit from
> it.

Who is this actually going to matter to?

Mark.

> 
> Any comment is appreciated.
> 
> Thanks
> 
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg931861.html
> 
> [2] https://www.spinics.net/lists/arm-kernel/msg932481.html
> 
> > 
> > Thanks,
> > 
> >         tglx
> 

