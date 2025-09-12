Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F151CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxvjZGaUhQE3tBmTvfPNkI17t+fU8O22dx4zR7i+9sk=; b=Cz9OgNe//yDaHQWajJ7I+S3bl/
	N91krjGApVqM+WUwwvG0/0eCnOWiv3enAuz0n/Ufd3KiR6m2YwZmp+1TZVqu1uA0hKSbfFRVPErKO
	wGBc/8JCSF6327bjv93ekmMD+DNzIqhmE6LXGGE/08vj4W1zYaZjV0qryOA61ZQPgbn+dJa/Fm8s9
	vadyENrNomJJdqjl2B+NZgzudxdgRmLn5Yg3QNwAVeP6vtCInSvCaJeOYcS12DjnZAQ3jxAewoGVh
	LHyfZv90eKNf7By9dDlomuTDTeGO+uOTQdVchJLa2QUi1N/mVD3Ys8jJIJLBdi3QhKmONPavqdq7j
	U1iXIRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux79W-0000000Ag6X-0Hxb;
	Fri, 12 Sep 2025 17:01:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux79U-0000000Ag5u-2gcx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 17:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B320A601D3;
	Fri, 12 Sep 2025 17:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FE7C4CEF1;
	Fri, 12 Sep 2025 17:01:32 +0000 (UTC)
Date: Fri, 12 Sep 2025 18:01:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMRR6nzqRrFGPTsN@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRN3z3WNRGuwBgQ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRN3z3WNRGuwBgQ@arm.com>
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

On Fri, Sep 12, 2025 at 05:44:15PM +0100, Catalin Marinas wrote:
> On Sat, Aug 16, 2025 at 04:19:27PM +0100, Yeoreum Yun wrote:
> > +#define FUTEX_ATOMIC_OP(op)						\
> > +static __always_inline int						\
> > +__futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)		\
> > +{									\
> > +	return __llsc_futex_atomic_##op(oparg, uaddr, oval);		\
> > +}
> > +
> > +FUTEX_ATOMIC_OP(add)
> > +FUTEX_ATOMIC_OP(or)
> > +FUTEX_ATOMIC_OP(and)
> > +FUTEX_ATOMIC_OP(eor)
> > +FUTEX_ATOMIC_OP(set)
> > +
> > +static __always_inline int
> > +__futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> > +{
> > +	return __llsc_futex_cmpxchg(uaddr, oldval, newval, oval);
> > +}
> 
> The patch looks fine and my impression that the __futex_* functions will
> be used in patch 6 to dispatch between lsui and llsc. But you got them
> the other way around. I'll comment there.

Ah, ignore me, I misread patch 6. It looks good.

> For this patch:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

