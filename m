Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF58ACDB470
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1yY6fW7A2By32TyWMvRTUIRlB5g4qNh9tuneOqU99E=; b=bBDQ3RpX0MDu9VPUrBE2AKlgue
	0nGoPIbDD/YInATrW+ai0/zPtQKYlMmFy9/UKgimBAk6+CHECbqUdl+LanNgKVDJyhlvu4TVffdAI
	BN4ms6pMW8I1OeMmTvMek5JdKJjHlJSSK9ER9+B6EscxX4IzfEfRXxtimhaW7jYUN0T2YQCQbRt6C
	V2p7XqdYjz5Mu8w6VWD+mnFSXnVXNZmh0sKjgO0WakZmzJz4cFR4R6pB92/ir0D5ikvn16drXsrR0
	QghcPBPRPFtncpI2vwk9adD/762dzgClAuNIH4UwQNRh+kPCNVXQ5+j792P7OEomLDqJBl6m2r5sP
	9ZKBdvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcjg-00000004tl8-2Pzf;
	Mon, 22 Jun 2026 11:22:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcjd-00000004tkC-424U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 11:22:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49245a7a018so87885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 04:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782127356; x=1782732156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1yY6fW7A2By32TyWMvRTUIRlB5g4qNh9tuneOqU99E=;
        b=iQxjzv1mA4j9H541uELLC5qmUuOjHSbCnQNhAKw/GJOK4n4fgwei2h4pw9fZ3eKUp7
         MIzJdWD5UJ2CF9URIllkv3Hn8WREM7dRgO3CQftXyqVgoJxOo0Bie6vOzg631PV+XhZf
         ZOG7Uot6rM9b6I6lpq9k6Ex34uZZMyNdh2qKQTDcOgRgR+10+6RrzOJ//R4HMzVAxpqn
         Fh/iId13a8JeT6ON0ES4TItX0WzRENKd+HCOQQDHjCmdtcvd2ynAMmbS+U8TBim+cV1M
         /4a6qmBaHxe0rY6nU4KOydysv78kcPL8CrjEmeiA5FEnrQONZA2MpgiVBn0x3yYmyqN4
         oWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127356; x=1782732156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1yY6fW7A2By32TyWMvRTUIRlB5g4qNh9tuneOqU99E=;
        b=Q0znFy/QYMOFekVyViCpgM0BsnsGtTshkTjVHmWg12Nr1+uKxxEfSObM3ILdWH9DoH
         ZfAX/8LyVYH/Osa1qQAnn25a4HEU6dtC9SVeOyr2PublH3MXU5AM/XSr7zsCxubgAGNW
         T045eEI8aMXbjjMyY1uqKFvXTuNXVMBqjWVD3J3S06sYalSOTaA5rziabPgTuN/b7+0V
         Rh8vFg+AzDgULwu1TVgGxzCN4njJW5ilM1ZopWBFBu/Vpq9MI3mC5Th00Zkjmarl8vjQ
         jKxMe8CeDbCqk0WbKgPkI6d8zx8v9Pb+EL8dQAjCJKxjjsWCyPiO9DNjT/d7Mo1g3M4a
         WGxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cmO3lKV6L6T0kq/rPJ58FLJ++u6mXz7EXG5RGYDorUopB+vBUDHM14gWVTu3pn+IPntnxdIoCwa7RWvIRMULW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7KifOIH5buTt0QkwAQkyIdbfnaY3bda/7A1K+UHUApU37UNEx
	rGDQZy81fkPoNMkLiPzcxgu9kci3WaRBExh5YgZSRpXzOeOmAYD8UJ9V3Wa25Aaz+w==
X-Gm-Gg: AfdE7clqNbIykZ8XOolnIrFM3JE83GueQYrOEvNrx4nei1/EgITd6DWVyBsD7yJyvjg
	S0AkqAXLdgbLhieseOe8HdwLg34yrtS/Lahy4UX07x9yNN5bSnJhstqzMYRGOtslbHi078BG+2F
	SEEUCDyAHQ1+w6/d1D3QD6LYScbnPGXIkQXJ/zPqwii+28LU5GYHwYLXNiR+y+XsMhrGeWQQvX+
	jxjBkfw3vVUiICWSH85St+QGKoShqyxebdKSFw3V8B4n+KUxAorKGK9r/Av5vo+6rMKQ+xEpfSM
	q2dBP2shJiEmm4tR1Y7K02woyo+lQIIDV8QbGPchxtBA/zcL4lxZZVhDjdsjb94b78aZ3NTwVhh
	AIxi9nN2EmJ66cTTQF8pN1qECqNuyVy+B+MuiIFyhUXN+xWIFsiJyz6ioy7GJbi2FbU7Uufv/eb
	+kznlY7MxWmCYyRPUK9ACd5ABUJbkSKKXpmmCGxrbHubXFhbxvVifCQbbg1s60EvFkMk5UbQ==
X-Received: by 2002:a05:600c:2254:b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-49241527581mr2615965e9.1.1782127355433;
        Mon, 22 Jun 2026 04:22:35 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm25252029f8f.31.2026.06.22.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:22:34 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:22:31 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v7 5/7] KVM: arm64: Validate the offset to the mem access
 descriptor
Message-ID: <ajka9wZXKlYWlYDA@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-6-sebastianene@google.com>
 <ajQjOH9Cjk1UqdT-@google.com>
 <ajj_DkqiDwiF8imZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajj_DkqiDwiF8imZ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_042238_042593_64F2EA23 
X-CRM114-Status: GOOD (  34.70  )
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

On Mon, Jun 22, 2026 at 09:23:26AM +0000, Sebastian Ene wrote:
> On Thu, Jun 18, 2026 at 05:56:24PM +0100, Vincent Donnefort wrote:
> > On Wed, Jun 17, 2026 at 02:51:28PM +0000, Sebastian Ene wrote:
> > > Prevent the pKVM hypervisor from making assumptions that the
> > > endpoint memory access descriptor (EMAD) comes right after the
> > > FF-A memory region header.
> > > Prior to FF-A version 1.1 the header of the memory region
> > > didn't contain an offset to the endpoint memory access descriptor.
> > > The layout of a memory transaction looks like this from 1.1 onward:
> > > Type | Field name | Offset
> > > [ Header | ffa_mem_region  | 0
> > >   EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
> > > ]
> > > Verify that the offset to the first endpoint memory access descriptor
> > > is within the mailbox buffer bounds.
> > > 
> > > Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
> > > should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.
> > > 
> > > Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
> > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 29 +++++++++++++++++++++--------
> > >  1 file changed, 21 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > index 2d211661952e..1a2abd0154c6 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > @@ -476,11 +476,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> > >  	DECLARE_REG(u32, fraglen, ctxt, 2);
> > >  	DECLARE_REG(u64, addr_mbz, ctxt, 3);
> > >  	DECLARE_REG(u32, npages_mbz, ctxt, 4);
> > > +	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
> > >  	struct ffa_mem_region_attributes *ep_mem_access;
> > >  	struct ffa_composite_mem_region *reg;
> > >  	struct ffa_mem_region *buf;
> > > -	u32 offset, nr_ranges, checked_offset;
> > >  	int ret = 0;
> > > +	size_t mem_region_len = !FFA_MEM_REGION_HAS_EP_MEM_OFFSET(hyp_ffa_version) ?
> > > +		offsetof(struct ffa_mem_region, ep_mem_offset) :
> > > +		sizeof(struct ffa_mem_region);


While talking with Vincent about this change, we agreed that it would be
easier to introduce a helper that will get the size of the struct
ffa_mem_region which is different based on the ff-a version.

This would hopefully increase the readability of this. The description
of the struct ffa_mem_region can be found in (Table 5.19: Lend, donate or
share memory transaction descriptor) from DEN0077A.

I will spin a new version to address this and collect the review tags.

> > >  
> > >  	if (addr_mbz || npages_mbz || fraglen > len ||
> > >  	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > > @@ -488,8 +491,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> > >  		goto out;
> > >  	}
> > >  
> > > -	if (fraglen < sizeof(struct ffa_mem_region) +
> > > -		      sizeof(struct ffa_mem_region_attributes)) {
> > > +	if (fraglen < mem_region_len + ffa_emad_size_get(hyp_ffa_version)) {
> > 
> > Can't we replace mem_region_len with ffa_mem_desc_offset()? that pretty much
> > looks like the same thing.
> > 
> 
> We can't because `ffa_mem_desc_offset` dereferences struct
> ffa_mem_region to extract ep_mem_offset as per the latest updates. 
> 
> > 
> > >  		ret = FFA_RET_INVALID_PARAMETERS;
> > >  		goto out;
> > >  	}
> > > @@ -508,8 +510,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> > >  	buf = hyp_buffers.tx;
> > >  	memcpy(buf, host_buffers.tx, fraglen);
> > >  
> > > -	ep_mem_access = (void *)buf +
> > > -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > > +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > > +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> > 
> > This check looks like ffa_mem_desc_offset() with count to 1.
> > 
> >
> > > +		ret = FFA_RET_INVALID_PARAMETERS;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	ep_mem_access = (void *)buf + em_mem_access_off;
> > >  	offset = ep_mem_access->composite_off;
> > >  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
> > >  		ret = FFA_RET_INVALID_PARAMETERS;
> > > @@ -574,9 +581,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
> > >  	DECLARE_REG(u32, handle_lo, ctxt, 1);
> > >  	DECLARE_REG(u32, handle_hi, ctxt, 2);
> > >  	DECLARE_REG(u32, flags, ctxt, 3);
> > > +	u32 offset, len, fraglen, fragoff, em_mem_access_off;
> > >  	struct ffa_mem_region_attributes *ep_mem_access;
> > >  	struct ffa_composite_mem_region *reg;
> > > -	u32 offset, len, fraglen, fragoff;
> > >  	struct ffa_mem_region *buf;
> > >  	int ret = 0;
> > >  	u64 handle;
> > > @@ -599,8 +606,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
> > >  	len = res->a1;
> > >  	fraglen = res->a2;
> > >  
> > > -	ep_mem_access = (void *)buf +
> > > -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > > +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > > +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> > 
> > ditto. ffa_mem_desc_offset()
> > 
> > > +		ret = FFA_RET_INVALID_PARAMETERS;
> > > +		ffa_rx_release(res);
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	ep_mem_access = (void *)buf + em_mem_access_off;
> > >  	offset = ep_mem_access->composite_off;
> > >  	/*
> > >  	 * We can trust the SPMD to get this right, but let's at least
> > > -- 
> > > 2.54.0.1136.gdb2ca164c4-goog
> > > 
> 
> Thanks,
> Sebastian

