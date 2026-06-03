Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A007DCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOXx4FMVBf42H3tjiR0f95GuNqRQb+jbsKeNwGOUqHo=; b=QsUQ+pN4XemSq0uAPYYPqTO7oM
	9Q4i9CsjsOfBtmwW0iXGshKJ2PWQhXplos1eaMNezkszJoO/L4P18MHk3kZBFyd+z2u+qRYP9SxTb
	5wlnXdSK382kC+zYuT+F5boqwMFysAr6b+HXVEr5ndkjiOV3u1a5UVNWbT8R0gsUW72L3H8LN830S
	PZrrAV0jHRDen1E5q/2KhkQomMOjsQWRIa3+BLXnkqsZHBE9m+z4JmviIu8HnAAzM8ESRhqJrdV9K
	RHpSTwuLfVUWOdb35fh1JCrNKc8ZNTqpPz04g01SsSfl61VYBCNvcY/dPfFxPLR1ZnNV2pwEC95aL
	yW1+iZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk4v-0000000EyXG-2XJA;
	Wed, 03 Jun 2026 11:48:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk4t-0000000EyWd-1xoc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:48:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9A784413D;
	Wed,  3 Jun 2026 11:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD61F00893;
	Wed,  3 Jun 2026 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780487286;
	bh=VOXx4FMVBf42H3tjiR0f95GuNqRQb+jbsKeNwGOUqHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GctQJny3UgC8O86VRtB6iFyYdWdFOgoL4Ens8zphR4TmB4KIRhIX6tS8l2m68Dzcj
	 y0KsKjV6HPMQkay9mVcpsM3cxu0Gbdo8H2DloWBrRxlmmjG0EIkoeUvyeMGrM/lcUy
	 60KBufwVLd1dP3WM39tIL+1EiAgKS++iCgnHlQtpZHmBK77BBxBAQYbQasbf35U/b3
	 7IShrNyyPhBHab/ZN537hICFb86660KCwMjAra/jFO6VJQsMaYVIoKLxXzoZ+xIvRH
	 cOSZOy0lUA6tsLFGdYpHJGLJ3jbmNrNU0+UfjjIeNInvPh00Piqc5iLHRBWzde274N
	 9cxKVzxDYXu3w==
Date: Wed, 3 Jun 2026 12:48:01 +0100
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, Gavin Shan <gshan@redhat.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Message-ID: <aiAUceqBREjwXk_V@willie-the-truck>
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
 <ah638FZAyCSqtzMi@willie-the-truck>
 <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_044807_550463_7A597769 
X-CRM114-Status: GOOD (  26.77  )
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

On Tue, Jun 02, 2026 at 04:48:43PM +0100, Suzuki K Poulose wrote:
> On 02/06/2026 12:01, Will Deacon wrote:
> > On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
> > > With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> > > debug_smp_processor_id(). This debug function complains when certain
> > > conditions that ensure CPU ID stability are not met, specifically when
> > > it's called from a preemptible context.
> > > 
> > > In arm_cca_report_new(), which runs in a preemptible context,
> > > smp_processor_id() triggers a splat [0] due to this.
> > > 
> > > However, the CPU ID obtained here is used as the target CPU for
> > > smp_call_function_single() to designate a specific CPU for subsequent
> > > operations, not to assert that the current thread will continue to
> > > execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> > > correct, and thus there's no actual harm except for the splat.
> > > 
> > > Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> > > ID without the debug checks, avoiding the unnecessary warning message
> > > while preserving the correct functional behavior.
> > 
> > That's pretty disgusting imo so I'd like to see some more justification
> > for this approach.
> > 
> > > Note that while migrate_disable() would pin the task to the current CPU,
> > > this path should not block CPU hotplug events. Therefore, we snapshot
> > > the current CPU ID and accept that smp_call_function_single() may fail
> > > if the CPU goes offline.
> > 
> > Why shouldn't it block CPU hotplug events? What happens if the CPU goes
> > offline and comes back online again during the loop of continue calls?
> 
> It need not. It can continue the calls. The RMM keeps track of the internal
> progress in the "REC" object for this "VCPU". Hotplug ON/OFF
> doesn't change the REC object in CCA Guest. So, a REC can come back and
> execute it. But the Linux could fail the operation if the CPU isn't
> available for fetching the report, after we do a RSI_ATTEST_TOKEN_INIT.

I couldn't really shake that out of the RMM spec tbh:
RSI_ATTESTATION_TOKEN_CONTINUE is allowed to return RSI_ERROR_UNKNOWN
and I couldn't find anything about hotplug.

But my main point, really, is why are we not using migrate_disable()
here? I can't see the justification.

Will

