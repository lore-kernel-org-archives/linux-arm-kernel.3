Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B84CCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spGZim1ZyhgHsaiJXpVGDnA2fCWowtbUu0fv4Gh0GyM=; b=uPlBe6qDfpqQ9apXmOBEmrgxfh
	D6ayiRdz3kBQIcCKye7W575Ujhmg0+1Y73C2t9jopo2s5AF/xBw/lfuWEtMr0G/AwdLlU6SA0Idz6
	nw0I2VHh/c0d4cbd+sW0FTtyHP7vJZ7VLgNfszOzdzYNpXGM6qOsIHxVxhXDibr7D/BkGQh6IjrAs
	/LLq3AjqmL1h23/P+NArH5AL2jQJcUvede2JSy+eTOACn+cK4jgQl47/6hKAnjLMawPtuGiNZXwD1
	a1fbLqJz3dUB1NoAY0X8syX8YJhDxepsgmDL7PQah1p6YMD4WtFEZVVgW0TpcF8nYB7xJvz2wxEnF
	SjSPLWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQD-0000000EsfH-0ik1;
	Wed, 03 Jun 2026 11:06:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQB-0000000EseL-0ela
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:06:04 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84236f9b638so1747966b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484762; x=1781089562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=spGZim1ZyhgHsaiJXpVGDnA2fCWowtbUu0fv4Gh0GyM=;
        b=ag6dIqUreNACBUji02qklRiaWgzFZ96KxNmpC6Lv7WOHt4q+iSqIb59TK9gSJmcEma
         AJl0RxYo6drYdZfTvQywc5MthjeInQyHMla0FeFzxRjmamzvnlcDyJFMe5JHT1JTnMrA
         UfTLRyzDdEW0AtyqDM6AHp2M23wlEptEw/J0qJHyP2iv0JXxKy184gTIYOVif7Ocukgk
         a7iyFQe3x9xkverzafUsdVXliaFCHbvo9JmSIvI5V4HsNzk0rETK11fXzB4GTJlVyiff
         B4xyBe1JjjTebIv4uspvBMVOFtkS9SX8ukPfkDO0BfGwL34SG1GPkhECV3c1LTIxaoqE
         Exgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484762; x=1781089562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spGZim1ZyhgHsaiJXpVGDnA2fCWowtbUu0fv4Gh0GyM=;
        b=EK9FYDizsVY0de12LTLpKxjoA0jikm/6JDS+s0ErqhIbdDmnK5MdcBNC6kdwtCC7Jx
         0jEwRiUOg6thSabrrJVxAb3PWrhc7M8+z5c5UKIWgvDyzFowLswlCvWL1rKosZHtdaDW
         eTXfaAzIWiK3zNSQU+YjcMPYO6pbkX6tPTXT0+wuTN0UvW7FmOo646E0lt8jdjStxjLx
         /Cr8YEyFe5jNckOR/sfBGLADp7ZZbVB0bcerjOVxle1hfkBnLftN3TNsJjr/HLA3f/wD
         WukUrrZB6TdZ1WK6grtty30Sd5lXRwK0VBx8ZXQ5BgKUibteO6n9IyiCxnOqR4qyOR7H
         vMbA==
X-Forwarded-Encrypted: i=1; AFNElJ9uCNL9g19EIbwwNWSPesSD5md7rlsQWlFb7V7ZFZc/8IyafKHI9mOZFvHd3bP30nDhpjNhrl7QTRmMiytiNiTn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvsf1AuyiNjv/WvD/0FuMrm5863ZYGse47sbJYkpwrijcskh9g
	/JXVAGLU3iPeUBqekd0yDH6ezo20XQwoMIPn3EE3lHK06UBJ7YfajK+/
X-Gm-Gg: Acq92OElDbw0uYvilv/V+tbZCUv/c9E2tYNV+bU5pvmsKeXNuko56iatsdgBkxx1xYw
	ISCEjCKm62c8YLeRA6Ly+0qrdRwo3cMt4vl6K4tbJkXlNf0Eae9kdz77wIhJ9PD+jTcAg6aZRbC
	A2on/1Vx7ogSK8Obc/N39xtkv3q7NrcUwei4R0b1cSoczCLKIQMJa5ayvkCRxpMNR4oeidzTRje
	RNgGjMgUoIzf1d83nXGZpsjeNXnvURPOWxzUOELLSbZ/Zrl9TefnqOVxZGYpeFVnmJumB1ziJ8C
	6lqCh1AWwlhwBxf5G+4aSwwdM97+jtQDylQXbuwJN3TmTSoveZJapBtSL6xoWDtVGLErC4gf7i7
	AsWw6ZbfJ0IpbOpKA/hto9Hs3glBbEMZgq+amF8pQxg1ukzsAtwavdx/wg84NSCdLlQrVZ05Y4+
	wgn+/GiBThhpnfIakI0Or/Xwu+KXdMKL6nGvWx0weJNYAmQbIFsA1R8Q==
X-Received: by 2002:a05:6a00:ad1:b0:841:d0a9:76e with SMTP id d2e1a72fcca58-84284df0234mr3088644b3a.5.1780484762139;
        Wed, 03 Jun 2026 04:06:02 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm2583248b3a.43.2026.06.03.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:06:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 20:05:57 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: Take the SRCU lock for page table walks in
 fault injection and AT emulation
Message-ID: <aiAKlchUO_TN4Q2u@v4bel>
References: <ah7_BAAzHggzdZeI@v4bel>
 <ah_Nal3ai65tgt-z@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah_Nal3ai65tgt-z@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040603_198358_F3839232 
X-CRM114-Status: GOOD (  29.73  )
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

On Tue, Jun 02, 2026 at 11:44:58PM -0700, Oliver Upton wrote:
> Hi Hyunwoo,
> 
> On Wed, Jun 03, 2026 at 01:04:20AM +0900, Hyunwoo Kim wrote:
> > inject_abt64() rewalks the guest stage-1 page tables via
> > __kvm_find_s1_desc_level() when injecting an abort for a failed S1PTW, and
> > __kvm_at_s12() calls kvm_walk_nested_s2() to perform the stage-2
> > translation. Both walks reference kvm->memslots through kvm_read_guest(),
> > which reads the descriptors, and __kvm_at_swap_desc(), which updates the
> > access flag, so they must run while holding the kvm->srcu read lock.
> > __kvm_at_swap_desc() asserts srcu_read_lock_held() on entry, and the other
> > callers of these walks, handle_at_slow(), kvm_translate_vncr() and
> > kvm_handle_guest_abort(), take the lock before calling them.
> > 
> > inject_abt64() is reached from the SEA and size fault injection paths,
> > which run before kvm_handle_guest_abort() takes the lock, and
> > __kvm_at_s12() does not hold the lock across the stage-2 walk. Take the
> > kvm->srcu read lock with guard(srcu) in both places so that it is held for
> > the duration of the walk.
> 
> Just state the expectation that srcu is held rather than giving the
> play by play. Perhaps:
> 
>   walk_s1() and kvm_walk_nested_s2() expect to be called while holding
>   kvm->srcu to guard against memslot changes. While this is generally
>   the case, __kvm_at_s12() and __kvm_find_s1_desc_level() call into the
>   respective walkers without taking kvm->srcu.
> 
>   Fix by acquiring kvm->srcu prior to the table walk in both instances.
> 
> > Cc: stable@vger.kernel.org
> > Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
> > Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> 
> I'd prefer if we scoped the critical section to only the relevant calls
> to the software table walk, like below.

Thanks for the review.

I agree this direction is the better patch. I'll do some more testing 
and then submit a v2.

> 
> -- 
> Thanks,
> Oliver
> 
> diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> index 9f8f0ae8e86e..889c2c15d7bd 100644
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@ -1569,7 +1569,8 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
>  	/* Do the stage-2 translation */
>  	ipa = (par & GENMASK_ULL(47, 12)) | (vaddr & GENMASK_ULL(11, 0));
>  	out.esr = 0;
> -	ret = kvm_walk_nested_s2(vcpu, ipa, &out);
> +	scoped_guard(srcu, &vcpu->kvm->srcu)
> +		ret = kvm_walk_nested_s2(vcpu, ipa, &out);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1665,7 +1666,8 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
>  	}
>  
>  	/* Walk the guest's PT, looking for a match along the way */
> -	ret = walk_s1(vcpu, &wi, &wr, va);
> +	scoped_guard(srcu, &vcpu->kvm->srcu)
> +		ret = walk_s1(vcpu, &wi, &wr, va);
>  	switch (ret) {
>  	case -EINTR:
>  		/* We interrupted the walk on a match, return the level */


Best regards,
Hyunwoo Kim

