Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B878C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 22:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuSletg3itwsifS0Pf73fBweBoBSkCY5MMD6bIiKHUM=; b=qe2m80IS6HYBqoI8UvMjLpKACF
	01QV7JTOvr8N35hMbLbg1F7FX9Rb/JNQQvR7RCqB/Ao4LlcTialiueRzRHMUZ431SW8WoeVG/UJth
	n0FoV/36/AhZwT2Hu3C4vopTmTB+NxkJnbCRUmG6b+PK4zJ+krfsD4x8bPUdfwflsy4DaQhrC9VmI
	CY08ySOkb63LFntt3oMk/8TW7AEFonizJd+s3Scu53oN7hNtjgb56J0oUomYoa7iLeT89JeBR8Fxo
	bLYyjQZrI+nIbZzD1twWcPgcU5T0yIPrvb5IoCWXgyKtno4jKGrznvfYSrNSJdiQXAgQ7Y84+AfiD
	frgLkYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJ8M-000000048Kp-0mYg;
	Mon, 17 Mar 2025 22:40:34 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJ6e-000000048B0-3Njw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 22:38:50 +0000
Date: Mon, 17 Mar 2025 15:38:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742251125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DuSletg3itwsifS0Pf73fBweBoBSkCY5MMD6bIiKHUM=;
	b=w73MujJEgi79uE2nYyf1yxCCBii2ix3gfNcfmwc3/fVH3HyAHE0cByR5j5iusSMQ2G7GiS
	8B7LyLZ3dAKSIiG5/txRwqw05gu8hIOZYvcaAUKRy+J1kMOgV0nJZIdpyqR+xnaw6ceaix
	8nAdgVfFYFp+GXA4tueRzn5yki05AvQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, maz@kernel.org, suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <Z9ikak5AOtDJNVgE@linux.dev>
References: <20250128155428.210645-1-mark.rutland@arm.com>
 <174197730164.734861.6726211221092480832.b4-ty@arm.com>
 <20250317212611.GA12724@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317212611.GA12724@willie-the-truck>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_153849_247922_9C4B40B5 
X-CRM114-Status: GOOD (  34.19  )
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

On Mon, Mar 17, 2025 at 09:26:12PM +0000, Will Deacon wrote:
> On Fri, Mar 14, 2025 at 06:37:25PM +0000, Catalin Marinas wrote:
> > On Tue, 28 Jan 2025 15:54:24 +0000, Mark Rutland wrote:
> > > On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> > > a hardware prefetcher to form an address using the contents of a memory
> > > location which is accessible by privileged accesses in the active
> > > translation regime, potentially leaking the contents of this memory
> > > location via a side channel. This has been assigned CVE-2024-7881:
> > > 
> > >   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> > > 
> > > [...]
> > 
> > Applied to arm64 (for-next/leaky-prefetcher), thanks!
> > 
> > There hasn't been much review (thanks Oliver for looking at the KVM
> > bits) and there's some implied work that can go on top of this series.
> > But the patches looked fine to me, so I queued them. Mark or others,
> > please shout if you'd like them dropped, they are on a branch.
> 
> I'm really not comfortable with this series and would prefer to see it
> dropped while we continue the discussion, especially as it's causing
> minor conflicts with the KVM/arm64 tree in -next.

Catalin, unless you say otherwise, I'm going to assume this will be
dropped in the interim.

> The series is pitched a bit like an erratum workaround, but the overall
> problem that a memory-dependent prefetcher can bypass permission checks
> is fairly general and, even if nobody else gets this wrong, I doubt that
> it's the last time Arm will mess it up. So, while the EL3 mitigation may
> be Arm-specific, I don't think the rest of it really is. That's
> especially true given the sorry state of spectre mitigations on
> third-party derivatives of Arm designs, such as the Qualcomm Kryo parts,
> and the fact that we provide userspace with a mechanism today for
> querying the state of those mitigations via sysfs.
> 
> The immediate question, then, is whether this broken behaviour is
> prohibited by CSV3. The text in the latest Arm ARM just refers to
> "Data loaded under speculation", so it's not entirely clear whether that
> applies to a prefetcher.

Hmm, good point. I think prefetchers fall under the ARM ARM glossary
definition of speculation, which includes:

 - Operations generated by the hardware that are not directly generated
   by any instructions appearing in the Execution stream.

> If we decide to go with a new entry for this, then we also need to
> change the default behaviour along the lines of Doug's Spectre-BHB
> changes queued on for-next/spectre-bhb-assume-vulnerable so that we
> assume vulnerable if we don't know better. To do otherwise will result
> in false assurances to userspace on derivative and third-party
> implementations.

Is the idea here that we'd assume any part with FEAT_CSV3 is vulnerable
to CVE-2024-7881 unless told otherwise by firmware / known good list of
implementations?

ARCH_WORKAROUND_4 assumes software has already detected an affected
implementation and doesn't distinguish between "not affected" and "not
mitigated". So I'd be concerned that we're gonna turn on KPTI for a load
of unrelated parts for something that hasn't (yet) been defined as a new
ecosystem bug.

> To be clear: I'm not at all against mitigating this problem and
> advertising the status of that mitigation. I *am* against quietly
> handling it like a CPU erratum whilst simultaneously telling userspace
> that meltdown is not a problem regardless of the mitigation state.

I like your idea of treating this as a broken CSV3 implementation
instead of an entirely new CPU bug, if only to avoid the 'assume the
worst' problem.

Either way KVM will need to implement the SMCCC call to the letter, even
if we wind up nuking CSV3.

Thanks,
Oliver

