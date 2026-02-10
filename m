Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6ECEB26E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvcJJH5d5JgEvxanVj/ek92gZbnlOESr5TRIM0ol9rg=; b=pJrHgx0yXxVSEroJqEWPZY9s0O
	LMV1bcIXMIGTu/hR4R5iiiWjl5HbT+nuveEl10CkGciEl10d4Rpd2a9PHKOXuUTifNuVTSUpzSLDH
	Yx6dWBlP3PwxTydQcgE7u61+FIjWk82tpdBLbbz3cOLSePYEjSQKb/mhDaFPMDOq0ENt/uNLWpI7G
	a4P962ToiuYAz+nWnaanhy0ah3wCOa3cJz47VF3EKTKh7vLPauXA+6UyNkpDRdOBUx2mj19SptnBw
	BZp62w+EJlW9dMdNAggYW6qUiTepYF+52qBw2mXTdDiei2/qXKvCb71r6uWDEPxePa1F3njz92zh0
	AlrWeWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqre-0000000HGV3-3URp;
	Tue, 10 Feb 2026 16:45:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqrY-0000000HGU2-2QIf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6A1339;
	Tue, 10 Feb 2026 08:45:13 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6423A3F632;
	Tue, 10 Feb 2026 08:45:16 -0800 (PST)
Date: Tue, 10 Feb 2026 16:45:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 6/7] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aYtgmZZhAKAvtfaK@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121190622.2218669-7-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_084522_540735_D9BF8B23 
X-CRM114-Status: GOOD (  14.78  )
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

I wonder whether we can shorten this function a bit. Not sure it would
be more readable but it would be shorter.

On Wed, Jan 21, 2026 at 07:06:21PM +0000, Yeoreum Yun wrote:
> +static __always_inline int
> +__lsui_cmpxchg32(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
> +{
> +	u64 __user *uaddr64;
> +	bool futex_on_lo;
> +	int ret, i;
> +	u32 other, orig_other;
> +	union {
> +		struct futex_on_lo {
> +			u32 val;
> +			u32 other;
> +		} lo_futex;
> +
> +		struct futex_on_hi {
> +			u32 other;
> +			u32 val;
> +		} hi_futex;
> +
> +		u64 raw;
> +	} oval64, orig64, nval64;

	union {
		u32 futex[2];
		u64 raw;
	}

> +
> +	uaddr64 = (u64 __user *) PTR_ALIGN_DOWN(uaddr, sizeof(u64));
> +	futex_on_lo = IS_ALIGNED((unsigned long)uaddr, sizeof(u64));

	futex_pos = (unsigned long)uaddr & 4 ? 1 : 0;

> +
> +	if (futex_on_lo) {
> +		oval64.lo_futex.val = oldval;
> +		ret = get_user(oval64.lo_futex.other, uaddr + 1);
> +	} else {
> +		oval64.hi_futex.val = oldval;
> +		ret = get_user(oval64.hi_futex.other, uaddr - 1);
> +	}

and here use

	get_user(oval64.raw, uaddr64);
	futex[futex_pos] = oldval;

> +
> +	if (ret)
> +		return -EFAULT;
> +
> +	ret = -EAGAIN;
> +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
> +		orig64.raw = nval64.raw = oval64.raw;
> +
> +		if (futex_on_lo)
> +			nval64.lo_futex.val = newval;
> +		else
> +			nval64.hi_futex.val = newval;
> +
> +		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
> +			return -EFAULT;
> +
> +		if (futex_on_lo) {
> +			oldval = oval64.lo_futex.val;
> +			other = oval64.lo_futex.other;
> +			orig_other = orig64.lo_futex.other;
> +		} else {
> +			oldval = oval64.hi_futex.val;
> +			other = oval64.hi_futex.other;
> +			orig_other = orig64.hi_futex.other;
> +		}

Something similar here to use futex[futex_pos].

We probably also need to check that the user pointer is 32-bit aligned
and return -EFAULT if not.

-- 
Catalin

