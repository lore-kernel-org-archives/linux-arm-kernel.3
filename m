Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB957C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 22:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoKlMc1lHrduXpDbBbVFy4M8aj5m5zbNDdssxMr5tdc=; b=BgOWu7ya9PtZk3OkUJCYy/emxJ
	otLO8EjTraGJMx7IbHquWoAgw6urbBNZKrTEnBpU7FddijB7HwpBX+ejAttMowkRzR0UsEJ35gI7J
	iv0Edj/mUFdMHgNZRODOfMDeaE372jEfBIpA8SxVSVcFkMuw5m/r99QdNLKCZywdstN3EpcVTv1i6
	tgcFuRKmNdDkwOjiT0RxMbWLT3kMBYdzLht+yqXhpqgG3/nZ54Y+2IJw2Gb3A1qiaDLaFoSD+swwx
	z7CUFn0Mc1r3HZ95mQI1mgIZdQPTwstHbKdiy1UpyVIRZLtTeLthK370UsSqUt+3zUOtVwUD4EjGP
	7l43502w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaOu-0000000BymA-1oPK;
	Tue, 03 Jun 2025 22:46:32 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaMk-0000000Byc1-2yV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 22:44:20 +0000
Date: Tue, 3 Jun 2025 15:43:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748990654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GoKlMc1lHrduXpDbBbVFy4M8aj5m5zbNDdssxMr5tdc=;
	b=lzCIQEGZ9FI8wt89dqHEjgAakygFlEyD4l9ip53qVy9LfjTGPS95wVhPcy/2qmUyOYVAjE
	JRaFapvUKpqg/O3lcUMMPEcYcp7ibaVQc7D6mRAMyy7cTKnSFcjae5MS7anwW9DSr5vcUV
	rFDNBe0JSQRHTY/ygvKnzMkxuvVGfU8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/17] ARM64 PMU Partitioning
Message-ID: <aD96rn78BSUDbEu1@linux.dev>
References: <20250602192702.2125115-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_154418_984272_07AD4C27 
X-CRM114-Status: GOOD (  25.13  )
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

On Mon, Jun 02, 2025 at 07:26:45PM +0000, Colton Lewis wrote:
> Caveats:
> 
> Because the most consistent and performant thing to do was untrap
> PMCR_EL0, the number of counters visible to the guest via PMCR_EL0.N
> is always equal to the value KVM sets for MDCR_EL2.HPMN. Previously
> allowed writes to PMCR_EL0.N via {GET,SET}_ONE_REG no longer affect
> the guest.
> 
> These improvements come at a cost to 7-35 new registers that must be
> swapped at every vcpu_load and vcpu_put if the feature is enabled. I
> have been informed KVM would like to avoid paying this cost when
> possible.
> 
> One solution is to make the trapping changes and context swapping lazy
> such that the trapping changes and context swapping only take place
> after the guest has actually accessed the PMU so guests that never
> access the PMU never pay the cost.

You should try and model this similar to how we manage the debug
breakpoints/watchpoints. In that case the debug register context is
loaded if either:

 (1) Self-hosted debug is actively in use by the guest, or

 (2) The guest has accessed a debug register since the last vcpu_load()

> This is not done here because it is not crucial to the primary
> functionality and I thought review would be more productive as soon as
> I had something complete enough for reviewers to easily play with.
> 
> However, this or any better ideas are on the table for inclusion in
> future re-rolls.

One of the other things that I'd like to see is if we can pare down the
amount of CPU feature dependencies for a partitioned PMU. Annoyingly,
there aren't a lot of machines out there with FEAT_FGT yet, and you
should be able to make all of this work in VHE + FEAT_PMUv3p1.

That "just" comes at the cost of extra traps (leaving TPM and
potentially TPMCR set). You can mitigate the cost of this by emulating
accesses in the fast path that don't need to go out to a kernel context
to be serviced. Same goes for requiring FEAT_HPMN0 to expose 0 event
counters, we can fall back to TPM traps if needed.

Taking perf out of the picture should still give you a significant
reduction vPMU overheads.

Last thing, let's table guest support for FEAT_PMUv3_ICNTR for the time
being. Yes, it falls in the KVM-owned range, but we can just handle it
with a fine-grained undef for now. Once the core infrastructure has
landed upstream we can start layering new features into the partitioned
implementation.

Thanks,
Oliver

