Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D3FC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXzQHBcfzaLnN6Lveuvs/XelZu2O0eMLfcdM7y12o5A=; b=Y5uZ23uIx87OCCbFhgsH3afZ02
	A7W14lhjZsglul/nIbL0RBxuCmWZjnAVV7RjFEri2gqI8vTotLLWv5HoGlRN4njDwgg+rWsCLoJya
	V18r8lhgeFMXRnA3Zin2XUjSiGGTR6oFCdMnDhJtvU+OoJDbDhuPZyD9ZsPjwta6SPQqC8yFC8div
	KILup9AmptEVs8PmUrZACeA7Ty7lzIXZs7TIQWagdQPIASJqQQFsA97xFHnBFW7AiVw+kRa3zrcAy
	/Zt8B5Ouo7YtRoFeSPQIp8Put/7LOZb3G+4Kss1n8MPl0gRDAn2cV/Mp8t/vbunq6YizmfsFOblDw
	VNfu1JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZT-00000005Wn9-3VcB;
	Wed, 21 Jan 2026 13:48:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZG-00000005WbF-3Q58
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 13:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0270442A4;
	Wed, 21 Jan 2026 13:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ED5C116D0;
	Wed, 21 Jan 2026 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769003297;
	bh=VpCP4rWPoedg5kjG3d2wjsJQWbzX2GfdwhAN9xSoVLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AW2mIWUcA6xvVB3CX2ffd0Gv+2enV+Qb302ghmDEvuHFFUb2Nb8p8O2GzIoCVmqjL
	 xxpFpUbCtnCm+OHuGUAubzYXYTq65VDS61Vsk13OHdoUZSYKS3W6ukkPBZJgiTt87X
	 LOQCEY4FubaP3wEGZkIG5IBfNjprOE5zFDrEugixMzsWd35dJ5Y9i5+GxJQorkZzV9
	 u/8sykpDJ2eb4uNfJIuw9mqYMQzT/jdcSe0zLb4Nd6jPdtvFc5kr095gtiQkRfRVIM
	 5aRgBdJa9/Q/2664KNUAJsMODwSapoqHbv+jKPP4B6icJzvIainfOrjq3KZi/3fyC0
	 Gbw2TE7crSvNA==
Date: Wed, 21 Jan 2026 13:48:10 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 6/9] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aXDZGhFQDvoSwdc_@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-7-yeoreum.yun@arm.com>
 <aW5dzb0ldp8u8Rdm@willie-the-truck>
 <aW6tix/GeqgXpTUN@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW6tix/GeqgXpTUN@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_054818_945928_4B67A690 
X-CRM114-Status: GOOD (  25.18  )
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

On Mon, Jan 19, 2026 at 10:17:47PM +0000, Yeoreum Yun wrote:
> > > +"2:\n"
> > > +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
> > > +	: "+r" (ret), "+Q" (*uaddr), "+r" (*oldval)
> > > +	: "r" (newval)
> > > +	: "memory");
> >
> > Don't you need to update *oldval here if the CAS didn't fault?
> 
> No. if CAS doesn't make fault the oldval update already.

Sorry, it was the "+r" constraint with a pointer dereference that threw
me but you have the "memory" clobber so it looks like this will work.

> > > +
> > > +	for (i = 0; i < FUTEX_MAX_LOOPS; i++) {
> > > +		if (get_user(oval64.raw, uaddr64))
> > > +			return -EFAULT;
> >
> > Since oldval is passed to us as an argument, can we get away with a
> > 32-bit get_user() here?
> 
> It's not a probelm. but is there any sigificant difference?

I think the code would be clearer if you only read what you actually
use.

> > > +		nval64.raw = oval64.raw;
> > > +
> > > +		if (futex_on_lo) {
> > > +			oval64.lo_futex.val = oldval;
> > > +			nval64.lo_futex.val = newval;
> > > +		} else {
> > > +			oval64.hi_futex.val = oldval;
> > > +			nval64.hi_futex.val = newval;
> > > +		}
> > > +
> > > +		orig64.raw = oval64.raw;
> > > +
> > > +		if (__lsui_cmpxchg64(uaddr64, &oval64.raw, nval64.raw))
> > > +			return -EFAULT;
> > > +
> > > +		if (futex_on_lo) {
> > > +			oldval = oval64.lo_futex.val;
> > > +			other = oval64.lo_futex.other;
> > > +			orig_other = orig64.lo_futex.other;
> > > +		} else {
> > > +			oldval = oval64.hi_futex.val;
> > > +			other = oval64.hi_futex.other;
> > > +			orig_other = orig64.hi_futex.other;
> > > +		}
> > > +
> > > +		if (other == orig_other) {
> > > +			ret = 0;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (!ret)
> > > +		*oval = oldval;
> >
> > Shouldn't we set *oval to the value we got back from the CAS?
> 
> Since it's a "success" case, the CAS return and oldval must be the same.
> That's why it doesn't matter to use got back from the CAS.
> Otherwise, it returns error and *oval doesn't matter for
> futex_atomic_cmpxchg_inatomic().

Got it, but then the caller you have is very weird because e.g.
__lsui_futex_atomic_eor() goes and does another get_user() on the next
iteration instead of using the value returned by the CAS.

It would probably be clearer if you restructured your CAS helper to look
more like try_cmpxchg() and then the loop around it would be minimal.
You might need to distinguish the faulting case from the comparison
failure case with e.g. -EFAULT vs -EAGAIN.

Will

