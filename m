Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59833FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If5xBJAT9cmaBlpHv1RfksiobxX7tdSEd4N3Q0R0ZXk=; b=0isum2elPCnIRiVlmu7xmK5fbC
	GC2w/AKdMy4Sx3fQ/yXgPcruKV1f8eAYgxo6ec5GfZGzl2asx4Q628r631Tow/cb/1SvlezLpIAPt
	9AYSdAQF13ofKi/aFS79QF+iHEnL4BDhyF9j/oj4b53HQV7BItrKHQFCJFuFSuEy/bgjEmG45SHKq
	9fR8+X1Yh+mqAccG87eWhEZYXiQcP8SOls6JSQwvDn494uWg4fySCnKxUa/gVlEELsxlZWTnp0iCH
	uJnZDPZRxcD8C/4KDkhj1OC+0H5ZNu1KLxFHHalDDUCvTx2KKdYfbkt3tnPes1e5FRBVWfy0Sschz
	MJPP2TcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLi3-0000000Gyby-484N;
	Mon, 27 Apr 2026 13:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLi1-0000000GyaS-3aFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9F291684;
	Mon, 27 Apr 2026 06:09:00 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA463F763;
	Mon, 27 Apr 2026 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777295346; bh=3lEd+nslUIMJVRUD1dkEUnZLHxcKxZauUlrUhoeYug0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRhUICjQxC+J+gvIvJyw2LTbu4lmfhcdu1zeIon7sP5Cu1DlCLj8NmSfJ0DGmjqkh
	 SgHNRlBLRGTIUfbLt5bYT6YTi4qbcOKfqbZ5feYtj/InEylUd9HrXR/LV4EzammT6n
	 orT1KUk1/9VsJ7Xuaty1zbu1UTXWHvTETCRMH6rc=
Date: Mon, 27 Apr 2026 14:08:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>,
	leo.bras@arm.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paulmck@kernel.org, puranjay@kernel.org,
	usama.arif@linux.dev, rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/irqflags: __always_inline the
 arch_local_irq_*() helpers
Message-ID: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
References: <20260421-arm64_always_inline-v2-1-c59d1400514d@debian.org>
 <ae9V6jrYEwa6Uwqn@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae9V6jrYEwa6Uwqn@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_060910_014404_9D5070BB 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, Apr 27, 2026 at 01:26:18PM +0100, Catalin Marinas wrote:
> On Tue, Apr 21, 2026 at 08:58:57AM -0700, Breno Leitao wrote:
> > Force-inline all of the arch_local_irq_*() wrappers so they cannot be
> > emitted out-of-line:
> > 
> >   - arch_local_irq_enable()
> >   - arch_local_irq_disable()
> >   - arch_local_save_flags()
> >   - arch_irqs_disabled_flags()
> >   - arch_irqs_disabled()
> >   - arch_local_irq_save()
> >   - arch_local_irq_restore()
> 
> I'll queue this, thanks!
> 
> I think we should also do local_daif_{mask,restore,inherit} as they seem
> to be called from noinstr locations in entry-common.c.

I agree we probably should mark those as __always_inline, but I beleive
they're safe as-is. For their current usage in entry-common.c they're
only called between between enter_from_*_mode() and exit_to_*_mode(), in
a period where instrumentation is safe.

Mark.

