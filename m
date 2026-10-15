Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37816CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq1PMVG3geF9fjk69d98kSJtFGwOj3dkjnJpIiojHVI=; b=Urp8PCrj3jbgWy3D9Qsom5uXri
	Tpz2fUysHH4hyH8sL8bBkDidsnMSqD7Md06MkRDmCBERcoSGQpzyTJbCpLQBMJFjQqjjqyxm8JFiC
	dslcB5YO7PCTnSkBgg9CqlD+qt9R2F5UibuYa/8C09MyQjvR870HOT24cQHn/gDqm4ONecsC98kWn
	tVkQC61lmZrt7evqZN/44L+NuzP4Numg3Ufm3M9dczEZVggJVGCTMUoZxmnbLQq72sEcll4OiscYE
	UCAeVpwgvqrgq5KAwAJKfPAg9YDpuINRMPsIvTTh8f0lNOtjt0aUVys9c8uu6epn/NwTwpU/sucJd
	r0GSNV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKCV-000000003Bh-2A7Q;
	Thu, 15 Oct 2026 12:04:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKCU-000000003BM-26UY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bq1PMVG3geF9fjk69d98kSJtFGwOj3dkjnJpIiojHVI=; b=iAhEpDQRi/x1WRshGtxkOJWakV
	mixwEovmhwNKgJDJAdDfFd2iqgDwqUT3BE2NLjO/askfyElpzScS8s8owKo916NuzvrUMxhRgjSuc
	jPUZlND8t7+zuBelV7tJh1xmx+e0Jw6H3JM4veIw6j8mURDmmHY95UOajwrhyzJmui/lFpeoBZQie
	lTP0fauTc/qX55KFKFk6bNS4K7Nsj9RRuWm3/dfmTtrsXxaKDG6jSYIxRRJC4VkH/EnxyF7AEPssK
	jWhwgJ8t5znewfeXKxhV3GV8dRNmlG7ppqY1xfq04qSX3xM9Hg6KMsJOIgpAHPQWzAFfg5UuF9hOt
	bn6LE+cA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHKCR-00000000KdF-03nx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:04:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FEA514BF;
	Thu, 15 Oct 2026 05:04:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D528E3F871;
	Thu, 15 Oct 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792065879; bh=9hD0gbQLuZhAtA/2D6ZAId/8XxZyvrMdTlj7LEroJC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWuo7fwfRMkLuTfqYVBJpBe4G9ihPMuBmC9+Rd8NFryOfIE1Nn8l9gnmM+U3VNoST
	 UQe6IbmfqqwbrsdbIi70juGwH6B/T180+9Qi2aWGX3erhCqE9qmc6kr66HcCwKEubQ
	 +ebgCSucVqtXL8lVUw4S2++i9oj0Q5g6fR1HNlzk=
Date: Thu, 15 Oct 2026 13:04:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <atDBVHvDQ3Pwr2Uq@arm.com>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
 <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130443_674118_1518A3AB 
X-CRM114-Status: GOOD (  33.23  )
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

On Wed, Oct 14, 2026 at 07:28:08PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 06:30:10PM +0100, Catalin Marinas wrote:
> > On Thu, Sep 17, 2026 at 11:14:17PM +0100, Mark Brown wrote:
> 
> > >  	u64			por_el0;
> > >  #ifdef CONFIG_ARM64_GCS
> > > -	unsigned int		gcs_el0_mode;
> > > +	unsigned int		gcscre0_el1;
> 
> > u64?
> 
> Sure, I always find the decision about which to use in a given situation
> confusing.

gcs_el0_mode was a software view. gcscre0_el1 is a raw sysreg value,
described in the Arm ARM as 64-bit (though the top bits are RES0).

> > > -	current->thread.gcs_el0_mode = enabled;
> > > +	gcs_set_el0_mode(current, enabled);
> > 
> > I think we have an existing bug here and it's more serious without this
> > patch. restore_gcs_context() does not update the actual register and,
> > with current mainline, we may even skip the hardware write in
> > gcs_thread_switch(). Basically one task can disable GCS for another
> 
> Right, that's an existing bug.
> 
> > task. Can we get gcs_set_el0_mode() to actually update the register as
> > well?
> 
> We also set the mode from ptrace at which point it's being set for a
> different thread.

Could we do like in arch_set_shadow_stack_status() for gcspr_el0 and
only set it if task == current?

> > On the sigreturn bug, do you recall why we thought we needed to update
> > the gcs_el0_mode in the signal handler (or even expose it)? Wouldn't it
> > be better if the signal handler did a prctl() directly if it needed to
> > change the mode for the current thread?
> 
> In theory you could have tasks with a mix of GCS and non-GCS threads
> doing green thread stuff, especially if the clone3() stuff had gone in
> so that the GCS wasn't so tied to the thread.  You could also have mixed
> push or write permissions in that case.  I am not sure that any of this
> is a realistic use case though, I'm certainly not aware of any current
> users. 
> 
> The case where a signal handler tries to handle a GCS fault by disabling
> GCS could be handled using prctl() if someone wants it.  I'm not aware
> of anyone doing that yet, there was some talk about implementing it in
> glibc at LPC but it's not been implemented.

Just thinking, if we fault on a modified field, a handler using prctl()
would also have to update features_enabled in the sigcontext, otherwise
sigreturn fails. I think that is already the case today for disabling
(the frame still has ENABLE, so sigreturn returns -EINVAL). prctl()
changes to WRITE/PUSH are silently reverted.

Another option is to ignore the field on sigreturn and keep it for
information only. I favour the latter, but it needs to be a separate
patch for discussion and a change to the sigreturn text in
Documentation/arch/arm64/gcs.rst.

-- 
Catalin

