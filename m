Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4E6E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn7eNXksb+tXbYJau2jP0gtFK32RD1iKf8zKULsX7mw=; b=a4moGWWtR4UznZfY+SLzT8P/lL
	2h4CBlvBO+2WWITFpJU/gD6HJDsXROy0kL/jc40etraYchjGhtB2ye0XVmjVTZgb7+NUhIYEajylu
	VdpXjqy1LS/FkjAkBOTEZSbaxM0SbIViCLdYIvK60KhrH2uaOIZlyp5YftA5oOfD3Pv/wybVBo8tF
	FkHLDgaAIZPUhXOhki2e+nek3tFPn2ZC4jTs/7hZ5dL90AqIjbu4Et+3YKrD85wuEQ/aQiojRIOhq
	5ldQdpL6fsNkD8X6wtmuvDrKZDrlBBQmdF5d9k+aKBsE362UCnqqJLBZlDZW200O/+Hdtyce6svg0
	CEq85XSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsds4-00000009Xvn-2rPu;
	Wed, 18 Feb 2026 09:29:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsds1-00000009Xun-2RXc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:29:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102A41477;
	Wed, 18 Feb 2026 01:29:14 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF0D63F7F5;
	Wed, 18 Feb 2026 01:29:18 -0800 (PST)
Date: Wed, 18 Feb 2026 09:29:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZWGa149nbQ_Nc_o@arm.com>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
 <aZRyzy0SJ8uF3K2J@arm.com>
 <aZSChrCVnoWSe7h0@willie-the-truck>
 <aZSb8VbCC471Cw1X@arm.com>
 <a537c546-2fbf-4509-b668-33851e0d44d5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a537c546-2fbf-4509-b668-33851e0d44d5@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_012921_655525_4B57D0C1 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Prateek,

On Wed, Feb 18, 2026 at 09:31:19AM +0530, K Prateek Nayak wrote:
> On 2/17/2026 10:18 PM, Catalin Marinas wrote:
> > Yes, that would be good. It's the preempt_enable_notrace() path that
> > ends up calling preempt_schedule_notrace() -> __schedule() pretty much
> > unconditionally.
> 
> What do you mean by unconditionally? We always check
> __preempt_count_dec_and_test() before calling into __schedule().
> 
> On x86, We use MSB of preempt_count to indicate a resched and
> set_preempt_need_resched() would just clear this MSB.
> 
> If the preempt_count() turns 0, we immediately go into schedule
> or  or the next preempt_enable() -> __preempt_count_dec_and_test()
> would see the entire preempt_count being clear and will call into
> schedule.
> 
> The arm64 implementation seems to be doing something similar too
> with a separate "ti->preempt.need_resched" bit which is part of
> the "ti->preempt_count"'s union so it isn't really unconditional.

Ah, yes, you are right. I got the polarity of need_resched in
thread_info wrong (we should have named it no_need_to_resched).

So in the common case, the overhead is caused by the additional
pointer chase and preempt_count update, on top of the cpu offset read.
Not sure we can squeeze any more cycles out of these without some
large overhaul like:

https://git.kernel.org/mark/c/84ee5f23f93d4a650e828f831da9ed29c54623c5

or Yang's per-CPU page tables. Well, there are more ideas like in-kernel
restartable sequences but they move the overhead elsewhere.

Thanks.

-- 
Catalin

