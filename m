Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D513C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZITjXCuyDtKK1qtqnTTdQ9PmU2bXeOu1iAWHigtFFs=; b=b6WlvShf2pPuBFHF0VQ59k/zpw
	YuZoqv5n8DBUNmeajyKK1gQF/Y10+2yuO7fDftrEH6VShSQCmF2LTUQkyLa9r0I4e+X0mkJtQQEnF
	ko8LudHiKQOccaTsWkGvtlvN9yswI7Tq+XITFmOmNdAg7rZ+KDf3h7+ZNWQ27257+qi0wXhb0L57P
	3fVnGb9bup6O81z9ZOVMD+mKXtk1ny7UwH+QSq2ltqitzkJvhJBSNq+TNOJrviXXWrUAtGzO/Wrkx
	H8OLSLlAg/TBmbuPw684XiL6czlF+cTULHP8zm6j5spb3xccSD1zpFpZnESbqyiIMzUIB1cG7CD3K
	0q4eeOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsRG-00000005oUN-3BaG;
	Tue, 28 Jan 2025 20:44:02 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsPv-00000005oR1-0BAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:42:40 +0000
Date: Tue, 28 Jan 2025 12:42:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738096954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FZITjXCuyDtKK1qtqnTTdQ9PmU2bXeOu1iAWHigtFFs=;
	b=H6z2AtcawhAIWMhD9yaCeCJk3LBm6DXMoLKTAkNF/PTdoPU1ntEQpTT2ear9g3GN0Ex3gp
	Hjj9xpszPzHhxqUvb60Rg/LP2je3PbM2KTXqsZd70P1YYGDabpydCw6kfMAehbDB7EmqQK
	SCBQXoIwD5Pxt8hT1qDsOzRdphLh2Ys=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>, stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers
 array count
Message-ID: <Z5lBMBY7XoFJmpGM@linux.dev>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
 <Z5i2j9gFB2iyN9g4@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5i2j9gFB2iyN9g4@lpieralisi>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_124239_601831_5C0F6DAE 
X-CRM114-Status: GOOD (  22.90  )
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

Hi Lorenzo,

On Tue, Jan 28, 2025 at 11:50:55AM +0100, Lorenzo Pieralisi wrote:
> > @@ -188,13 +188,17 @@ int __init acpi_gtdt_init(struct acpi_table_header *table,
> >  		cnt++;
> >  
> >  	if (cnt != gtdt->platform_timer_count) {
> > +		cnt = min(cnt, gtdt->platform_timer_count);
> 
> Thank you for reporting this.
> 
> There is something I need to understand.
> 
> What's wrong cnt (because platform_timer_valid() fails for some
> reason on some entries whereas before the commit we
> are fixing was applied we *were* parsing those entries) or
> gtdt->platform_timer_count ?
> 
> I *guess* the issue is the following:
> 
> gtdt->platform_timer_count reports the number of GT blocks in the
> GTDT not including Arm generic watchdogs, whereas cnt counts both
> structure types (and that's what gtdt->platform_timer_count should
> report too if it was correct).

I've seen two different issues so far:

 - In one case, the offset of the platform timer array is entirely
   beyond the GTDT

 - In another, the GTDT has a timer array of length 2, but only the
   first structure falls within the length of the overall GTDT

Since cnt is the result of doing a bounds-checked walk of the platform
timer array, both of these issues cause the sanity check to fail.

> >  	if (platform_timer_count)
> > -		*platform_timer_count = gtdt->platform_timer_count;
> > +		*platform_timer_count = cnt;
> 
> I think this should be fine as things stand (but see above).
> 
> It is used in:
> 
> gtdt_sbsa_gwdt_init() - just to check if there are platform timers entries
> 
> arch_timer_mem_acpi_init() - to create a temporary array to init arch mem timer
> 			     entries (the array is oversized because it
> 			     includes watchdog entries in the count)
> 
> In both cases taking the
> 
> min(cnt, gtdt->platform_timer_count);
> 
> should work AFAICS

It was probably worth noting in the changelog that I did this to
gracefully handle the reverse of this issue where we could dereference
platform timer entries that are within the bounds of the GTDT but exceed
gtdt->platform_timer_count.

> (hard to grok though, we - as in ACPI maintainers -
> need to clean this up).

Heh, thought this smelled a little ripe ;-) Went for the minimal fix
first.

-- 
Thanks,
Oliver

