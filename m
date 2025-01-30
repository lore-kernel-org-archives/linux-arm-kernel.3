Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB496C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8c/mMTgLuk8KWmONZ27hwSO0Mag9IsrrF1O7VrNRGg8=; b=qLbz1UxHesgPzHgTQUq1CZ/Laz
	JJiPnOCF/mF6qhERO5FxYy8BCzd46mz+1oIQGcyUouFVB8MGrxLTYbhyk0rDM88O63+d7LH4HMEfr
	yIpup4Jmvb8emz3gJ3fv6yDtztFV28tI4tyg7rCwWuGV5vZpPsWyMhkw5PjWrZUAsdNZ8W65mveDP
	MvJp/4Nyne+4twbnocvB8CEYroWpxwyKpyAqRFbBof1fPOAwAsJCCOSN+ZQM9lhOkdgQOR0FMGeSu
	UC0a/72FfQrIOa/dFj6GZkaLBaDAO0osO+FjD2/u2Iz4PGglifRwMQIZ8SsS7qSrwAm1bBJ5eaaN4
	ShB3o0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYpL-00000009Lg0-3GTi;
	Thu, 30 Jan 2025 17:59:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYTT-00000009IaO-2jcZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 793DF5C618A;
	Thu, 30 Jan 2025 17:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766E9C4CED2;
	Thu, 30 Jan 2025 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738258626;
	bh=uSM1MPbvBqUgJ0jp5x1Q+m8RSmC36vz1+mKZC8DAuew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3aXBrT1xWurjBUpscuGw4PcYy9pbYV8+odimCcMebVNDWpTgDv1Cb/DfvS7o9RrW
	 7vwbI46DvKvtqWyNRqdmNUnTR1xQjxfiNGLF/QtG8BCPczGZkGvw1vfYYGG9r6JzoV
	 uMMy889mgmFWrw4CpPWuXbXjSygGQLqwAU5z1SCwefC02EfCb6VIX4D/5Lu5F3wy2F
	 RqKYGc+4Zr9tLA4nh8/jAVgtwGwNfM8Zwy7ikxu/Rdp8iSd/XP6PDr8IJm9n/nqQMa
	 tyOtbIpUAzVQp6wIoh8PR011LfVWQqyrXwOl9b28ZMutQQ7dxPI+gDtupBfewd+kwG
	 xCfLjLTn0aQ4w==
Date: Thu, 30 Jan 2025 18:37:00 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>, stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers
 array count
Message-ID: <Z5u4vCwVCIhiE72I@lpieralisi>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
 <Z5i2j9gFB2iyN9g4@lpieralisi>
 <Z5lBMBY7XoFJmpGM@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lBMBY7XoFJmpGM@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093707_774820_887247C1 
X-CRM114-Status: GOOD (  33.64  )
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

On Tue, Jan 28, 2025 at 12:42:24PM -0800, Oliver Upton wrote:
> Hi Lorenzo,
> 
> On Tue, Jan 28, 2025 at 11:50:55AM +0100, Lorenzo Pieralisi wrote:
> > > @@ -188,13 +188,17 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
> > >  		cnt++;
> > >  
> > >  	if (cnt != gtdt->platform_timer_count) {
> > > +		cnt = min(cnt, gtdt->platform_timer_count);
> > 
> > Thank you for reporting this.
> > 
> > There is something I need to understand.
> > 
> > What's wrong cnt (because platform_timer_valid() fails for some
> > reason on some entries whereas before the commit we
> > are fixing was applied we *were* parsing those entries) or
> > gtdt->platform_timer_count ?
> > 
> > I *guess* the issue is the following:
> > 
> > gtdt->platform_timer_count reports the number of GT blocks in the
> > GTDT not including Arm generic watchdogs, whereas cnt counts both
> > structure types (and that's what gtdt->platform_timer_count should
> > report too if it was correct).
> 
> I've seen two different issues so far:
> 
>  - In one case, the offset of the platform timer array is entirely
>    beyond the GTDT

And we were parsing it before the commit you are fixing was applied
because we weren't validating the first entry ?

That's how the loop was working before:

#define for_each_platform_timer(_g)
	for (_g = acpi_gtdt_desc.platform_timer; _g;
		_g = next_platform_timer(_g))

We were parsing the first entry and now we don't anymore (rightly so),
even with this fix applied, correct ?

>  - In another, the GTDT has a timer array of length 2, but only the
>    first structure falls within the length of the overall GTDT

Right.

> Since cnt is the result of doing a bounds-checked walk of the platform
> timer array, both of these issues cause the sanity check to fail.

Yep.

> > >  	if (platform_timer_count)
> > > -		*platform_timer_count = gtdt->platform_timer_count;
> > > +		*platform_timer_count = cnt;
> > 
> > I think this should be fine as things stand (but see above).
> > 
> > It is used in:
> > 
> > gtdt_sbsa_gwdt_init() - just to check if there are platform timers entries
> > 
> > arch_timer_mem_acpi_init() - to create a temporary array to init arch mem timer
> > 			     entries (the array is oversized because it
> > 			     includes watchdog entries in the count)
> > 
> > In both cases taking the
> > 
> > min(cnt, gtdt->platform_timer_count);
> > 
> > should work AFAICS
> 
> It was probably worth noting in the changelog that I did this to
> gracefully handle the reverse of this issue where we could dereference
> platform timer entries that are within the bounds of the GTDT but exceed
> gtdt->platform_timer_count.

Yes, that's strike three, where platform_timer_count is borked,
I understand you have not hit this one though but it seems
right to fix it the way you did.

I am just trying to understand given that we are sending the fix to
stable whether this fix can affect other broken GTDTs (or better, whether
other borked FW can affect this change) but I hope not, it should not.

> > (hard to grok though, we - as in ACPI maintainers -
> > need to clean this up).
> 
> Heh, thought this smelled a little ripe ;-) Went for the minimal fix
> first.

I am sorry you have to deal with this, the kernel is not there to
validate the firmware but on the other hand when it doesn't that's the
outcome. Apologies.

Lorenzo

