Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFE0E74AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwPYwEwlA8AQqGFVX8ciFphTUx+Kwdfw+FGZ4sMFQSo=; b=TEVbccSJSTP2FJ2vdwRJQeo7Cm
	IONVuecY5fgFmDzdbRJO7Y4JKuIsp0RXXSqJ36T3oOD0kbP8UIGcbqAZDBp6VZtGfothhbpktZ0b+
	gUlIhqaVwgIXA9Gfc1h156hJfcjGfWi4ar1YUMxCFXQ/zxP3rvIY+mZQzbE3dOqFBHanzNmuJrQks
	BrUAYXpREfVZSHYTeG4hv/3x9YaPwUCsgY21KhP5tdvEdO98mCQm1bKZNxN/WujuwqNMIBqauKgOe
	SIIsS5wCBGsd21gc/jiifmhPf/8PJ6Y1z4Kh03/i+LjeHHWqJH7stJ3el89LsiHEqre5mJ1cauu1+
	ldbkRdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWNC-0000000ACwA-0UPu;
	Tue, 03 Dec 2024 17:07:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWMA-0000000ACnb-3hR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:06:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2955BFEC;
	Tue,  3 Dec 2024 09:07:06 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55A083F58B;
	Tue,  3 Dec 2024 09:06:37 -0800 (PST)
Date: Tue, 3 Dec 2024 17:06:34 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64/signal: Consistently invalidate the in
 register FP state in restore
Message-ID: <Z086mm/qzNCRB2jH@e133380.arm.com>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-4-d853479d1b77@kernel.org>
 <Z08k6QsYRzO8+O4t@e133380.arm.com>
 <f9e297ab-8325-4b48-b8fc-21486ff48cd2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e297ab-8325-4b48-b8fc-21486ff48cd2@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_090639_016818_C47F2B7A 
X-CRM114-Status: GOOD (  33.54  )
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

Hi,

On Tue, Dec 03, 2024 at 04:53:11PM +0000, Mark Brown wrote:
> On Tue, Dec 03, 2024 at 03:34:01PM +0000, Dave Martin wrote:
> > On Tue, Dec 03, 2024 at 12:45:56PM +0000, Mark Brown wrote:
> > > When restoring the SVE and SME specific floating point register states we
> > > flush the task floating point state, marking the hardware state as stale so
> > > that preemption does not result in us saving register state from the signal
> 
> Now I think about it again this should probably be dropped from the
> series, or at least ordered after the reenablement.
> 
> > > +	 * thread floating point state with preemption enabled, so
> > > +	 * protection is needed to prevent a racing context switch
> > > +	 * from writing stale registers back over the new data. Mark
> > > +	 * the register floating point state as invalid and unbind the
> > > +	 * task from the CPU to force a reload before we return to
> > > +	 * userspace. fpsimd_flush_task_state() has a check for FP
> > > +	 * support.
> > > +	 */
> 
> > Maybe add a comment in fpsimd_flush_task_state() about why the
> > system_supports_fpsimd() check is important?  It's not obvious there
> > why we should ever be calling that function on non-FPSIMD systems.
> 
> There already is a comment in there about it?

There's a comment, but it's not clear that calling that function is
considered correct / useful if there is no FPSIMD.

Not a big deal, anyhow.

> > But would it be a good idea to stick a
> > WARN_ON(!test_thread_flag(TIF_FOREIGN_FPSTATE)) at the start of the
> > functions that rely on this?
> 
> As I mentioned in reply to one of your other messages I want to just gut
> the whole API here and replace it with get/put functions for the state
> which would include the get/put functions making sure they're paired
> with each other.

No argument from me on that, but it would be good to have a way to
check that functions that expect to be called with the FP context held,
actually are (similar to lockdep_assert_held() etc.)

If the number of affected functions is low, I guess comments may be
enough, though.

> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Ack, but opinions can differ about what context is unneeded.

I'll try to keep the noise down on these threads.

Cheers
---Dave

