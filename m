Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E740105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HUM5Peji35ebwET4gUkp+UHqMLMeBn40HuXvqqkAUU=; b=bxZdjiPDZh4JVZptzxw749TBfN
	CxI97QJAwIWoEluFxYn1oqZZzwkud3qeBA8bmxKT9ZlZGq0f/Y113zO9HoJLKJ9KvbDg2Rb5h0koP
	nM7TqG5WDbOXpSu66NZSbXjDc5dE5kEZr5cE/7A5/vmAoiTKvs58fQIvm713xK9s/dKwEVqNNzcn1
	ONcGmJYo1HIouKypUGoUAXZyv2GzZGV5GYiYdfj35vceg1utKywpzS4ZsuJEFL/8C74LGCYSo95fk
	cxHlCiMbUabZI9/htqj1vXM4CveKBhr5snyvqXy/wkZakiFIWJmmBrp7Cpr2wFSIr3LWQdntio0MH
	pACRh9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13il-00000000PoC-2Yap;
	Fri, 13 Mar 2026 14:42:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ie-00000000Plm-0TpL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:42:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87823165C;
	Fri, 13 Mar 2026 07:42:17 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B60C3F7BD;
	Fri, 13 Mar 2026 07:42:21 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:42:18 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 5/8] arm64: futex: support futex with FEAT_LSUI
Message-ID: <abQiSiX_xxjSY96-@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-6-yeoreum.yun@arm.com>
 <abMDOC5DYEm74And@arm.com>
 <abPXrvl9tC+nv6q9@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abPXrvl9tC+nv6q9@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074228_283523_58481EE1 
X-CRM114-Status: GOOD (  30.85  )
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

On Fri, Mar 13, 2026 at 09:23:58AM +0000, Yeoreum Yun wrote:
> > On Fri, Feb 27, 2026 at 03:17:02PM +0000, Yeoreum Yun wrote:
> > > +
> > > +		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
> > > +			return -EFAULT;
> > > +
> > > +		oldval = oval64.futex[futex_pos];
> > > +		other = oval64.futex[other_pos];
> > > +		orig_other = orig64.futex[other_pos];
> > > +
> > > +		if (other == orig_other) {
> > > +			ret = 0;
> > > +			break;
> > > +		}
> >
> > Is this check correct? What if the cmpxchg64 failed because futex_pos
> > was changed but other_pos remained the same, it will just report success
> > here. You need to compare the full 64-bit value to ensure the cmpxchg64
> > succeeded.
> 
> This is not matter since "futex_cmpxchg_value_locked()" checks
> the "curval" and "oldval" IOW, though it returns success,
> caller of this function always checks the "curval" and "oldval"
> and when it's different, It handles to change return as -EAGAIN.

Ah, ok, it makes sense (I did not check the callers).

> > > +	}
> > > +
> > > +	if (!ret)
> > > +		*oval = oldval;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static __always_inline int
> > > +__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
> > > +{
> > > +	/*
> > > +	 * Undo the bitwise negation applied to the oparg passed from
> > > +	 * arch_futex_atomic_op_inuser() with FUTEX_OP_ANDN.
> > > +	 */
> > > +	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
> > > +}
> > > +
> > > +static __always_inline int
> > > +__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
> > > +{
> > > +	u32 oldval, newval, val;
> > > +	int ret, i;
> > > +
> > > +	if (get_user(oldval, uaddr))
> > > +		return -EFAULT;
> > > +
> > > +	/*
> > > +	 * there are no ldteor/stteor instructions...
> > > +	 */
> > > +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
> > > +		newval = oldval ^ oparg;
> > > +
> > > +		ret = __lsui_cmpxchg32(uaddr, oldval, newval, &val);
> >
> > Since we have a FUTEX_MAX_LOOPS here, do we need it in cmpxchg32 as
> > well?
> >
> > For eor, we need a loop irrespective of whether futex_pos or other_pos
> > have changed. For cmpxchg, we need the loop only if other_pos has
> > changed and return -EAGAIN if futex_pos has changed since the caller
> > needs to update oldval and call again.
> >
> > So try to differentiate these cases, maybe only keep the loop outside
> > cmpxchg32 (I haven't put much though into it).
> 
> I think we can remove loops on __lsui_cmpxchg32() and return -EAGAIN
> when other_pos is different. the __lsui_cmpxchg32() will be called
> "futex_cmpxchg_value_locked()" and as I said, this always checks
> whether curval & oldval when it successed.

Yes, I think for the futex_cmpxchg_value_locked(), the bounded loop
doesn't matter since the core would invoke it back on -EAGAIN. It's nice
not to fail if the actual futex did not change but in practice it
doesn't make any difference and I'd rather keep the code simple.

> But in "eor" when it receive "-EAGAIN" from __lsui_cmxchg32()
> we can simply continue the loop.

Yes, for eor we need the bounded loop. Only return -EAGAIN to the user
if we finished the loop and either __lsui_cmpxchg32() returned -EAGAIN
or the updated on futex_pos failed.

Thanks.

-- 
Catalin

