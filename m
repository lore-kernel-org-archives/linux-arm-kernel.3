Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42185CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/p+Yc3grdnyzYnDTQLjDX5RLPPFCbXFwpNxCJbp/Io=; b=IJyoAQzBsIl48Q+455AHyluwzF
	jn5Tx8Va/vU10ljNAdvr1gRbRe1lDneJYsuDpL4MPd7RqxfSXVYGsSJunLX1pTcaiRqweYXkWxqA8
	84Uomd92hD0yozPeqaZBjAu9V9pl6AJU98piKEZ/6a7fYykwIQ/an3aiucIH5TjZP/ji/t3IFOfSj
	BauOg9hmMOTRTt240qn56d/JudJKKApGegrihdhmck5um5RrlRrA9aiYVHzGCVvJ2Cy0xbSgDUKJC
	BZXUjxAF0baI/E2sZwGE/axxeN4oOM62g8AQphg/xTTcLWJ8aUgEHfc/t4z1qFkyuA6i/KH5f3AhD
	191zdfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZSP-0000000HLzj-2PCd;
	Thu, 14 Aug 2025 15:01:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXZ3-0000000GubP-0jmX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C154450BD;
	Thu, 14 Aug 2025 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0912CC4CEED;
	Thu, 14 Aug 2025 13:00:12 +0000 (UTC)
Date: Thu, 14 Aug 2025 14:00:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, harisokn@amazon.com,
	cl@gentwo.org, Alexei Starovoitov <ast@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
Message-ID: <aJ3d2uoKtDop_gQO@arm.com>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com>
 <20250627044805.945491-2-ankur.a.arora@oracle.com>
 <aJXWyxzkA3x61fKA@arm.com>
 <877bz98sqb.fsf@oracle.com>
 <aJy414YufthzC1nv@arm.com>
 <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_060017_226392_CA1E4723 
X-CRM114-Status: GOOD (  20.16  )
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

On Wed, Aug 13, 2025 at 06:29:37PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 13, 2025, at 18:09, Catalin Marinas wrote:
> > On Mon, Aug 11, 2025 at 02:15:56PM -0700, Ankur Arora wrote:
> >> This also gives the WFET a clear end time (though it would still need
> >> to be converted to timer cycles) but the WFE path could stay simple
> >> by allowing an overshoot instead of falling back to polling.
> >
> > For arm64, both WFE and WFET would be woken up by the event stream
> > (which is enabled on all production systems). The only reason to use
> > WFET is if you need smaller granularity than the event stream period
> > (100us). In this case, we should probably also add a fallback from WFE
> > to a busy loop.
> 
> I think there is a reasonable chance that in the future we may want
> to turn the event stream off on systems that support WFET, since that
> is better for both low-power systems

Definitely better for low power.

> and virtual machines with CPU overcommit.

Not sure it helps here. With vCPU overcommit, KVM enables WFE trapping
and the event stream no longer has any effect (it's not like it
interrupts the host).

That said, my worry is that either broken hardware or software rely on
the event stream unknowingly, e.g. someone using WFE in a busy loop. And
for hardware errata, we've had a few where the wakeup events don't
propagate between clusters, though these we can toggle on a case by case
basis.

-- 
Catalin

