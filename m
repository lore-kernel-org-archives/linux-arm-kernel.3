Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5206DCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqYnKnbGHzQgmhRaZYPYelkKBButwc5rs1zMUjpk+zk=; b=oi8SLy60NM2fnINtV++j3oFar1
	O/oXmXfHarY0bMG2SO2TltTYHKoxWVsc5s7pvWkknieRxkClbppearbS4Ww3ukmPKnD71jxxvLqm0
	uSMzFFt4/m9BH89Gr3xerjwzO6wJxt+H3qPvHnsRkeZjWx7JSJASYI+B4O/o1NLQ10mg3cE2gxjN3
	2I3ZmvkVytd7xfycJKVnNWkyHUpyDL1MLx5xj4ctK6+8Zykw3O2MsE6I/5diViIBLHJbdQpOo0qQC
	Efx5I1UWKzoCd73ErS3q+EoWol6NdeMpueYOCrLxS5IJA2Umph5l5IfZdGYIZYLw0Pr+RrCO/x9Rz
	L/hpDQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1a5-00000007biL-0aGM;
	Thu, 21 May 2026 11:28:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1a1-00000007bhh-2js2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:28:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E86143739;
	Thu, 21 May 2026 11:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0AD1F000E9;
	Thu, 21 May 2026 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779362925;
	bh=cqYnKnbGHzQgmhRaZYPYelkKBButwc5rs1zMUjpk+zk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=boUXeObsYisSteJn543SeGcDn2P7jIsR8T8Qd1ui3HYNqIXkJ8vvaQ7K1IOeKUdT0
	 O+sjHFTXr9zg67gTKgajqJc7C17Cg3ijjZ3KOTp4dH8QOWhYHKuwdNhNjpJBHnTcvN
	 zKJYFMoQHG2WKkHYCYl8ehi/PVpOViOezHsC4BXdOu54QLE/uLa5qRbsqwpfRNnze7
	 vS4bvdYaW2QHxOrHoxQe1nZ9lyskJcRPiUrEGZWr/y3dA7WdWmWJzc/fufNnLqXImC
	 goAp9oeySrorbhOo5A44XBj3ZJEtd8QBgi7eRFZ1wkp6IqYSuUUq5ziECMYNc7Ybdd
	 t78GAFTvcsrPg==
Date: Thu, 21 May 2026 12:28:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@arm.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, jevans@nvidia.com, raghupathyk@nvidia.com,
 srikars@nvidia.com, nbenech@nvidia.com, alwilliamson@nvidia.com, Dan
 Williams <danwilliams@nvidia.com>
Subject: Re: [RFC PATCH 0/2] arm64: add SMCCC cache invalidation backend for
 memregion users
Message-ID: <20260521122820.35fd34af@jic23-huawei>
In-Reply-To: <20260521073047.320614-1-smadhavan@nvidia.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_042847_174565_9DB92513 
X-CRM114-Status: GOOD (  20.76  )
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

On Thu, 21 May 2026 07:30:45 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> This series adds an arm64 backend for memregion cache invalidation users
> based on the Arm SMCCC cache clean+invalidate interface.
> 
> Per DEN0028, this interface targets systems where a Normal Cacheable
> memory region can be modified in ways that are not handled by usual PE
> coherency mechanisms, and where VA-based CMOs may be too slow or
> insufficient for large ranges and/or system-cache implementations.
> 
> Representative use cases include device-backed memory state transitions
> where stale CPU/system cache lines must be invalidated reliably (for
> example secure erase, reset/offline flows, and dynamic memory
> reconfiguration).
> 
Hi Srirangan,

Great to see this moving forwards. I was wondering when it would
surface upstream :)

Usual thing for an RFC is to have some reference to why it is an RFC.
I'm not immediately spotting any open questions or dependencies to
stop this going upstream now (if review of actual code goes well).

So why RFC?  Is the spec still in beta?

> Patch 1 introduces the Arm SMCCC cache clean/invalidate function IDs and
> transient return codes needed by callers [1].
> 
> Patch 2 adds an arm64 cache maintenance provider that:
> - discovers SMCCC support and attributes at init time
> - registers with the generic cache coherency framework used by
>   cpu_cache_invalidate_memregion()
> - handles transient BUSY/RATE_LIMITED responses with bounded retries
> - coalesces waiters when firmware reports a global operation type
> 
> This patch set does not add a software fallback path; when firmware does
> not implement the SMCCC cache maintenance interface, the provider is not
> registered and existing behavior is preserved.

By which you mean it kicks out an error? This kind of hints there
might be a software fallback (assuming no other implementation has
registered). In many cases there isn't a safe software solution.

Jonathan

> 
> Reference:
> [1] https://developer.arm.com/documentation/den0028/latest
> 
> Srirangan Madhavan (2):
>   arm64: smccc: add cache clean/invalidate IDs and return codes
>   arm64: mm: add SMCCC-backed cache invalidate provider
> 
>  MAINTAINERS                     |   1 +
>  arch/arm64/mm/Makefile          |   1 +
>  arch/arm64/mm/cache_maint.c     | 180 ++++++++++++++++++++++++++++++++
>  include/linux/arm-smccc.h       |  17 ++-
>  tools/include/linux/arm-smccc.h |  17 ++-
>  5 files changed, 212 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/mm/cache_maint.c
> 
> 
> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b


