Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42192C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXw9x8JH3uhFXMErtD1TeJ6ztBjjBHVnGulpmGx0HUI=; b=fY6FA+4Gs4Smc42yzsbRvbiEW6
	DL2HpL9zcrFUwnlx7zsQH582pUYgKP8yoPu9pYmESMVt6c1lCDCJZVRe/e+QDRqKNR9p/NMSNFyNV
	ZEQbMhmd+3p3XQ7ICuJc/W8bK80U6/bx9IO4WtcZkcmlrz8vOPNMXnnrMa18PtWXRd6RCsk59zIIs
	3zbf7en8kvNYPNj1pf07BM+kpDnwDg2CHm+YvJuS3gMogUmVQWKwM2AopKByAlhobB4szH3glXpUm
	cwb0Az9S+rHi6Ny9AInwrBuV9vpaMaLqm8HfLeYx+wJZtbhI4bntHUyDaD0IDVV7QPPezIvMdOguj
	JlGBm3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqna-0000000Eigc-3cPa;
	Tue, 11 Aug 2026 18:02:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqnX-0000000EigE-49xR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:02:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6735614BF;
	Tue, 11 Aug 2026 11:01:54 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0831B3F632;
	Tue, 11 Aug 2026 11:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786471318; bh=d1JUCW+D1eTd8DUoupFSJQyX4uvqeMQqa9JvlVMaU48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLq9cRrZ7WB6KsN/kuiPxx31EYcbxkIasoR3nv0kH+sIXYFV2r2OrwI1lbxD4XyBZ
	 ptpatfpZHro8yvLjl8Kw7Q0TlOkXGKLHQ1wjPIo1xGa2GZGf/2f/Kt403KyksNMlPq
	 pXg5H7kXGNhCbhllTI9l6dCRfkqp8MvV07hYbFYU=
Date: Tue, 11 Aug 2026 19:01:54 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <antjkuiPhsfE7e_H@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-5-yeoreum.yun@arm.com>
 <20260811154521.GF15499@e132581.arm.com>
 <antUM71hxHaBJ_5l@e129823.arm.com>
 <20260811174503.GJ15499@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811174503.GJ15499@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_110200_124260_F8EAAD1D 
X-CRM114-Status: GOOD (  29.66  )
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

> On Tue, Aug 11, 2026 at 05:56:19PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > > Can we treat this as a refactoring instead and split it into at least
> > > two patches? This would make it easier to review now and easier to
> > > understand later if someone will read the changes.
> > > 
> > >  - Lock refactoring
> > >  - SMP call refactoring
> > >  - active_config refactoring
> > 
> > It couldn't since separation of Lock and SMP can introduce the bug for
> > that patch. and the Lock and SMP call refactoring isn't meaningful
> > without active_config.
> 
> Each time I read through this patch, I find it a bit difficult to follow
> the overall logic, as it combines several changes together.
> 
> I have no strong opinion for this though. Perhaps we could split out the
> support for a NULL feat_csdev->drv_spinlock into a separate change
> first, as that seems independent and should not introduce regression.

If the NULL lock is separated, since it before the SMP refactoring
there will be a *race* for it.
OTOH, if SMP first, absent of NULL lock would make a deadelock.

So If we really want to seperate, we should the SMP and Lock
refactorying must be one group.

However, seperating the active_config from there, I'm not sure whether
This would really make a difficulty of backport.
We might separate the active_config as a cleanup but, this would require
also for backporting but active_config one wouldn't have a fix tag.

So, I think it would be better to keep as-is.

> 
> > > > +#define feat_csdev_lock(feat_csdev, flags)				\
> > > 
> > > Could use inline here?
> > > 
> > > static inline void feat_csdev_lock_irqsave(..., unsigned long *flags)
> > > {
> > >     ...
> > > }
> > 
> > I think this is much annyoing. since the deference might add more
> > instruction to save the flags. Otherwise the typecheck is for
> > compilet-time check and not for runtime.
> > 
> > So, it would be better to remain as-is.
> 
> An inline function provides stronger type checking at the API boundary.
> It is readable and easier to maintain. Dereferencing *flags would be
> fine, as this is not a hot path.
> 
> I was inspired by the implementation in include/linux/serial_core.h
> (see uart_port_lock_irqsave() and uart_port_unlock_irqrestore()).

I think there’s always been quite a bit of debate around this,
particularly regarding the maintainability of inline functions versus
function-like macros. Personally, I don’t find this particular function
any harder to read or maintain as a macro.
On the contrary, even though this isn’t a hot path, adding an extra
instruction still feels like a less preferable trade-off to me.

@Suzuki, What do you think? inline or macro for feat_csdev_lock_irqsave()?

-- 
Sincerely,
Yeoreum Yun

