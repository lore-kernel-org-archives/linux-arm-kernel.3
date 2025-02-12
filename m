Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXbzTqDjFgGUh3EBAmwFZErncm6z7JTBE0YhDYeRJSA=; b=G/XJqBadbllndVOWdj62qqxLvJ
	WbZLcdsXIsIXVgXKfUJVCQ1NtgyrBnBW21MY3oFvnBMyMSs1aS/6aB68iKF70a9lD8LVKzg67xCZY
	Yqwui31MiYFrz5hi03OXTpZZxDcOUY5Roz0MSd2FxWkg5KhzbqKWQfM/NytXiOFoPrCy1/1yY2QCq
	r9Kdx7C9S4V3dX/8+qeSFxPQUgAWU1nO9Ql1Z2whO2+jLqJBO7t6Qd/V2yl7n3VUth+HDDSlaSAFJ
	yPBm230gZWjn4ncZyppzCi6FVK9Ac9dReolQYMoW921AMbwCIrQuRsSUxTfezWY2B7pLXe1QfzPEF
	5H3MLsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAIB-000000072v8-3MQY;
	Wed, 12 Feb 2025 10:48:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA3i-00000006zqg-1ftn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F21B75C5724;
	Wed, 12 Feb 2025 10:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D81C4CEDF;
	Wed, 12 Feb 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739356413;
	bh=JjXhB+/E2GYRT9cPPM8Yrb46y4WEBtQtoQZkMTTIIsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apDjr8avlkhnXF3iYJxdGj3L2E/iuYjYY0W+1VgglUF2zyfjUBWv/QfwhUWcaktWx
	 f9zy5MauWALBXh1TzaiMxPgJc5g3WqukiknGRksl/qBTThVZopPV23wgS/UC91rcMT
	 y/gN3QnR5SLCS9sxxG+8vIxJT9FZ2OwGzBnbTURQT8aczBtFfJYvJ5mkQtfx59UXvn
	 pHMA1MLQ3ZKAPDKLMreZ7FRFiL+lASvFeKqtNzzTftT6xA9rQ1FD6csCO/Vmj0bBy4
	 2VrLr0k5JgYH3PusfRJfAiNhPBF5evGq/gRaKsEJqxPnm6BQqdXB3FAbX5H05tKNkA
	 Mr68rTFdKG2IA==
Date: Wed, 12 Feb 2025 11:33:27 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers
 array count
Message-ID: <Z6x4987CJ0zgmw3s@lpieralisi>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
 <Z5i2j9gFB2iyN9g4@lpieralisi>
 <Z5lBMBY7XoFJmpGM@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lBMBY7XoFJmpGM@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_023334_552519_63B82CDB 
X-CRM114-Status: GOOD (  29.46  )
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
> 
>  - In another, the GTDT has a timer array of length 2, but only the
>    first structure falls within the length of the overall GTDT
> 
> Since cnt is the result of doing a bounds-checked walk of the platform
> timer array, both of these issues cause the sanity check to fail.
> 
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

Hi Oliver,

I was about to ask Catalin/Will to pick this up, don't know if you have
time to update the changelog and send a v2 - a Link: to this thread will
be added anyway.

Thanks,
Lorenzo

