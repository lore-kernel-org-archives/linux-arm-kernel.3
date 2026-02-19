Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF7AE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Itb8X4cIZwfE73sMJW8nQig0bc80Ee5Oiv34+fKbUuo=; b=q8JmKOwbQukaAdDDQC6b/DsXLQ
	y7gY5kNv4kwMjqERJ/yTatraij8FLqS+C8iEuD7GJyeoy10NvkyHccCSq5QBasHWqX64ALPKGcMBq
	RA7LJncN/HgywtWau4WjDgmDvSjdNjYllVwBKEMzWxhs8S9fdAy/ky/rHXLlKJxpT1SuqJ79CKfKb
	JLJYwngaNFBWywJjTbYbHPFBvuGQSgCzntDjgmtjC0ryhkPZgsm7xKRVE+Z/C8IJA/ARzUPLxOnG0
	FIJc3KEoBvY6D0w6YmJRjJ9Sq0uWQgB8DvU6VSmcojst1LkRik9UK0HE/Vg+aidXIUVwdMlCvmH3m
	7a+Ce5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4cx-0000000BQfq-13r2;
	Thu, 19 Feb 2026 14:03:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4cu-0000000BQfP-28sW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5781141796;
	Thu, 19 Feb 2026 14:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFE6C4CEF7;
	Thu, 19 Feb 2026 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509811;
	bh=UEx+46CzqVD6fjELuE6UtRXKHwauEBQEFSxMktcvS+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUG6ovFAS7J9JWzCzj/SsEULT5PXdNlUNh94A2VEMdvWRNiwW4bckyfe/a3UhqNHD
	 ksyDF2DN/of0ZnhrIaMIoaggev5HJuyG0HIXpye1Ya/hQMIjoD8iYJc0rd9rohZ8d/
	 +hbR+AK4zhc7UwiTGRkLdCW9WYr7NZ8+D3o2hx7KOlPbDQjlqYU7EuN1hLVGfzRXF4
	 RhY4sjgf5BYi05PIG0dqCYxS+vDcBEQVtrhfo4NyT/1b/EBZz99/c2g5uDV7yAAJyi
	 58MsTOyEvLACfMG+NlRbTwK9GxppOoYsIe8w401L0bYblDKJPsuj+7WNC0bypdUtD4
	 vXYV4ZjW0wFiQ==
Date: Thu, 19 Feb 2026 14:03:25 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Michael Williams <Michael.Williams@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aZcYLZ9wETnRDJ7P@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
 <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
 <aZcIy1Or4c5-i7Tm@willie-the-truck>
 <7b692e5c-d376-4023-80e0-76c9d9c0604f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b692e5c-d376-4023-80e0-76c9d9c0604f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_060333_390643_7ECFC547 
X-CRM114-Status: GOOD (  31.31  )
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

On Thu, Feb 19, 2026 at 01:51:26PM +0000, James Clark wrote:
> On 19/02/2026 12:57 pm, Will Deacon wrote:
> > On Thu, Feb 19, 2026 at 12:08:27PM +0000, James Clark wrote:
> > > I'm back to drag this up again. So I think all of the above discussion
> > > relies on the ordering given by the indirect read needed for the "might
> > > ignore a direct write..." part. But it's _might_ ignore a direct write, it's
> > > possible for an implementation to not do that, so there are two possible
> > > implementations:
> > > 
> > > #1 Where there is an indirect read to give the write ignore outcome
> > > #2 Where there is no write ignore outcome so it doesn't require an
> > >     indirect read
> > > 
> > > For #2 there's nothing to force the ordering. We're writing to two different
> > > registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have the
> > > PMBLIMITR_EL1 write come second for the buffer to be considered configured
> > > correctly. For example if the old value of PMBPTR_EL1 is higher than the new
> > > PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens first then it's
> > > misconfigured. That's why we think we need the isb() here.
> > 
> > I thought profiling was disabled in these cases, so why is it
> > misconfigured?
> > 
> > If it is misconfigured, what can go wrong given that we're either stopped
> > or pmscr is clear?
> > 
> > Will
> 
> It is stopped in the interrupt handler because PMBSR_EL1.S = 1. But in
> arm_spe_pmu_start(), PMBSR_EL1.S = 0 so it's not stopped. And with
> PMBPTR_EL1 still being set to the value from the last session it could be
> higher than PMBLIMITR_EL1.
> 
> PMSCR_EL1 doesn't affect SPEProfilingStopped(), it's only:
> 
>   boolean stopped = (PMBSR_EL1.S == '1');
> 
> The conditions for when the buffer needs to be configured correctly from
> R24557 are:
> 
>   ProfilingBufferEnabled() && !SPEProfilingStopped() &&
>     PMBLIMITR_EL1.FM != DISCARD
> 
> I think even if PMSCR_EL1 is clear you can still get a buffer management
> error, even if no samples were going to be written into the buffer. It just
> says:
> 
>   While the Profiling Buffer is enabled, profiling is not stopped, and
>   Discard mode is not enabled, all of the following must be true:
> 
>   * The current write pointer must be at least one sample record below
>     the write limit pointer.

... but doesn't that mean that R24557 is a breaking change to the
architecture? The current Arm ARM doesn't appear to require this,
existing software doesn't honour it so why should we hack extra barriers
into Linux?

Will

