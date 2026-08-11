Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy+5uWluUfW6cmKFNi0chunzcBDbaIJjnH05RmLv7t0=; b=1oViah28NzNRCLJzrzZJlk30+t
	46Of4rMKyWNfMILKJabyJUpINU3/CVsPOD+DJg8kyBKPTmiUsFdKvEX8MbEJoG5EXMVjzFNUJfMqx
	WfC5fea+bm5b0R7QiYbXATJg9BohC/vnPupRV2tyxPHSsXBBgTw+uiGcsmWMm2AN0r13NVtBhw3OP
	By/8G2kTr3LlnQKJ/CU8O7AFwkPKCQ4sleeJMZnicaUDj66P3s5OspJnq8GsA0anvdP8r7Ge6HL9Q
	bXiA0ysMC/Xcm7gRBPMI70Zj9s9XCvfh2g7m/EYeLZZ7cHzy8sVqY8Wkm31tG6kvG3mbjyeW2SQ3i
	yrQ+z6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqXG-0000000EgSm-2reS;
	Tue, 11 Aug 2026 17:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqXD-0000000EgSD-43s0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C1F14BF;
	Tue, 11 Aug 2026 10:45:02 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABDC43F632;
	Tue, 11 Aug 2026 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786470306; bh=cWEo8FsNzwLULwn2CFxYiVChwvARplzxVV5XI4k/OPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6V6YhrJ9xWdpWCqKS7Hk+J6g9gSWhaIuT8KA8d9MEtlqEAh5NIL/FNtwx7ibhEYv
	 RqXrUECESPn/Wf9amRg6bD9D+jEA3PqnUsEkUJNSUFwwIPZwngaeh3ty74yyXPSkMW
	 5Wisd02iv6JLR2HgIfNDGIR9KnvDbSY7hW6crRiA=
Date: Tue, 11 Aug 2026 18:45:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260811174503.GJ15499@e132581.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-5-yeoreum.yun@arm.com>
 <20260811154521.GF15499@e132581.arm.com>
 <antUM71hxHaBJ_5l@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <antUM71hxHaBJ_5l@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_104508_046706_F0D5B1D2 
X-CRM114-Status: GOOD (  20.61  )
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

On Tue, Aug 11, 2026 at 05:56:19PM +0100, Yeoreum Yun wrote:

[...]

> > Can we treat this as a refactoring instead and split it into at least
> > two patches? This would make it easier to review now and easier to
> > understand later if someone will read the changes.
> > 
> >  - Lock refactoring
> >  - SMP call refactoring
> >  - active_config refactoring
> 
> It couldn't since separation of Lock and SMP can introduce the bug for
> that patch. and the Lock and SMP call refactoring isn't meaningful
> without active_config.

Each time I read through this patch, I find it a bit difficult to follow
the overall logic, as it combines several changes together.

I have no strong opinion for this though. Perhaps we could split out the
support for a NULL feat_csdev->drv_spinlock into a separate change
first, as that seems independent and should not introduce regression.

> > > +#define feat_csdev_lock(feat_csdev, flags)				\
> > 
> > Could use inline here?
> > 
> > static inline void feat_csdev_lock_irqsave(..., unsigned long *flags)
> > {
> >     ...
> > }
> 
> I think this is much annyoing. since the deference might add more
> instruction to save the flags. Otherwise the typecheck is for
> compilet-time check and not for runtime.
> 
> So, it would be better to remain as-is.

An inline function provides stronger type checking at the API boundary.
It is readable and easier to maintain. Dereferencing *flags would be
fine, as this is not a hot path.

I was inspired by the implementation in include/linux/serial_core.h
(see uart_port_lock_irqsave() and uart_port_unlock_irqrestore()).

Thanks,
Leo

