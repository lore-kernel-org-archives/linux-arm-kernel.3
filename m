Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E2CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG9c7IfmrMj5SYE5QngWHzgS5zVNj1KkYNbZ00E7vJE=; b=QGgBPzd5KRbL0S2ThSeqTtpREO
	kwjb3lLczIhctXvkMhM2gCXYLqngDZYjWl6FtJqK4hatwjHcb1BX9lp7usPH/uIbmnsSfJKIQODYX
	VvDQjCGAnwL5HYwT21C8RdpAphaDfCcdJ7m3DNyemXA3NHwcMH27Ma1kqZd/O4jHqG9yuFlq4MwIs
	Gvpz82sT9jf637aEnpbcy28lIxDiO5PPEfm0bhfKwYXUi9mVdvImnRYhkA9FM/al0SMcF8F0qikiC
	p9JgZsVnIoqzCf01CBx/0cAeLb9TLlRjX5ZneYBtxaFjNmMMsMQmbIMEFK9cwEVaYUHM+/IpBfSxT
	t8cTbPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbasT-00000004kVO-0qEW;
	Mon, 22 Jun 2026 09:23:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbasQ-00000004kUj-3R6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 09:23:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69605f796b8so19632a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782120212; x=1782725012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG9c7IfmrMj5SYE5QngWHzgS5zVNj1KkYNbZ00E7vJE=;
        b=VEtXHOTYJWmgd6lhYUffYDHMLa5aVakjvf7TotHgBhBMJjRWB4d9nDEm0Fv+MBJ//q
         +7qF9Oj/DAi4oq/HjkjqBNmgQpcAMzXCf620jE7tIkyvGj24DBqhYYEp24dXsMzXX0NB
         S6QKmWjoWUIBzu9XMVZsv18RF1PeaIlmyzw8rYfpahurNkdX2b8OVIMXsE9kgfqGtnmT
         A166iOrTaKh/kdC1hXM2S+44YIZm+/4VT4ljOB6GeHO68HtEm54I/bq0mbFfStwAr2Rf
         emMHRB4zQbEShY2knMqrGAls8kI0JZ5/jquW1XAp+6nH2Uht6KKzKaC+3pj0b88ZT5UE
         eciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120212; x=1782725012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG9c7IfmrMj5SYE5QngWHzgS5zVNj1KkYNbZ00E7vJE=;
        b=a8NQwdjbEZm5M5xmeSkr+JZrrdy7A1rhWZBEv6fdgC35tg4tsCskq2/VgFwm7eVbke
         ttaA1Ao3mTbrSx7r4mla9GS2hZ1lT+3WGjal2Y1sV+dIgjTmG7hqPMc98GKRqn+BrHQF
         +9HMx6Nv5PmTLPrtyB7jwd0BHUkNGlC0JL0lekOHVRMzuOIdZqtDMeKtnlWhokWSLnc2
         9Vu6T3hB6W6xx0DK6O8aKAnIiXfmhpW32rZGpEnG8VCYLhZ6TG/FkQGgVm1OFksbuJda
         lJJp2P1o46y2abLaT6RcEz5y8BNegutDLsHDm4b3NdlAZEihmtHbFNZEnZ9ewssI64oQ
         /eEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hyH22+qidze2hRQUfD1qrkA6o1UN33vn1enSZlHdTYLK+1jg6xLeA6HgUR05n2J1fRJP4r88kByPMkaUTrUIX@lists.infradead.org
X-Gm-Message-State: AOJu0YyPbG5to2/E//f3DMN6uf3WbG6sQqlW8uRM2s6ViEKZgOc5j5sB
	cgn0WHG1n3V2mAeEbbESC48rZMknwH81AcLl8XeCpvqbmeJhYQu4AanM8LbYGCkLMA==
X-Gm-Gg: AfdE7clomk+VFyvbDPD4/BEsL+v9SEoRm7QpkeRicBcEdDlxEVx80LjkH8dQLIfcSrW
	G0t5LOanCcIeq09+aSVpCT8JoVU9O2HaW0/Uo2++5uD5nowxPfl5yIujL0tjZCSIhIfHbiTEw0v
	65gku5q+yHd4BzHXRmPUIkN7gPZGG8glmD37DOb8nmigaGqwGQ0CdIJNQ6b2qQauw3wMEKL1y7L
	jhIPyeaDqoRJ1cT78Qr3pDcSdBgjMSBiEHUqR5wYNEK5W9+F4Z+T6BRxmMhCzsjT8MDu4RTpUwx
	f6AVns1WE0Y6qObjJv9bktXXryOez8RZPYxdYtuiXY9hGBuC7jqGY0eDogu3vWrcEriiW6uhs1i
	sLku+aH+AcG6vl7dLDVx1awb3swe3Q2kc0qrQFr290KXBght7KL10pewZbH3LLCLwvVKCPwclrf
	H1xlfjJTgnKFpbwdESIo3Gvt/drU67QObo7ltNk1ODw9jWPqvQxur9VfMjK4c=
X-Received: by 2002:a05:6402:a58a:20b0:671:dad9:8caf with SMTP id 4fb4d7f45d1cf-697498db0b9mr73558a12.5.1782120211444;
        Mon, 22 Jun 2026 02:23:31 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86f480sm2949634a12.13.2026.06.22.02.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:23:30 -0700 (PDT)
Date: Mon, 22 Jun 2026 09:23:26 +0000
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
Message-ID: <ajj_DkqiDwiF8imZ@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-6-sebastianene@google.com>
 <ajQjOH9Cjk1UqdT-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajQjOH9Cjk1UqdT-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_022334_918587_2F4B2E4A 
X-CRM114-Status: GOOD (  29.23  )
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

On Thu, Jun 18, 2026 at 05:56:24PM +0100, Vincent Donnefort wrote:
> On Wed, Jun 17, 2026 at 02:51:28PM +0000, Sebastian Ene wrote:
> > Prevent the pKVM hypervisor from making assumptions that the
> > endpoint memory access descriptor (EMAD) comes right after the
> > FF-A memory region header.
> > Prior to FF-A version 1.1 the header of the memory region
> > didn't contain an offset to the endpoint memory access descriptor.
> > The layout of a memory transaction looks like this from 1.1 onward:
> > Type | Field name | Offset
> > [ Header | ffa_mem_region  | 0
> >   EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
> > ]
> > Verify that the offset to the first endpoint memory access descriptor
> > is within the mailbox buffer bounds.
> > 
> > Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
> > should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.
> > 
> > Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 2d211661952e..1a2abd0154c6 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -476,11 +476,14 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >  	DECLARE_REG(u32, fraglen, ctxt, 2);
> >  	DECLARE_REG(u64, addr_mbz, ctxt, 3);
> >  	DECLARE_REG(u32, npages_mbz, ctxt, 4);
> > +	u32 offset, nr_ranges, checked_offset, em_mem_access_off;
> >  	struct ffa_mem_region_attributes *ep_mem_access;
> >  	struct ffa_composite_mem_region *reg;
> >  	struct ffa_mem_region *buf;
> > -	u32 offset, nr_ranges, checked_offset;
> >  	int ret = 0;
> > +	size_t mem_region_len = !FFA_MEM_REGION_HAS_EP_MEM_OFFSET(hyp_ffa_version) ?
> > +		offsetof(struct ffa_mem_region, ep_mem_offset) :
> > +		sizeof(struct ffa_mem_region);
> >  
> >  	if (addr_mbz || npages_mbz || fraglen > len ||
> >  	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > @@ -488,8 +491,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >  		goto out;
> >  	}
> >  
> > -	if (fraglen < sizeof(struct ffa_mem_region) +
> > -		      sizeof(struct ffa_mem_region_attributes)) {
> > +	if (fraglen < mem_region_len + ffa_emad_size_get(hyp_ffa_version)) {
> 
> Can't we replace mem_region_len with ffa_mem_desc_offset()? that pretty much
> looks like the same thing.
> 

We can't because `ffa_mem_desc_offset` dereferences struct
ffa_mem_region to extract ep_mem_offset as per the latest updates. 

> 
> >  		ret = FFA_RET_INVALID_PARAMETERS;
> >  		goto out;
> >  	}
> > @@ -508,8 +510,13 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >  	buf = hyp_buffers.tx;
> >  	memcpy(buf, host_buffers.tx, fraglen);
> >  
> > -	ep_mem_access = (void *)buf +
> > -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> 
> This check looks like ffa_mem_desc_offset() with count to 1.
> 
>
> > +		ret = FFA_RET_INVALID_PARAMETERS;
> > +		goto out_unlock;
> > +	}
> > +
> > +	ep_mem_access = (void *)buf + em_mem_access_off;
> >  	offset = ep_mem_access->composite_off;
> >  	if (!offset || buf->ep_count != 1 || buf->sender_id != HOST_FFA_ID) {
> >  		ret = FFA_RET_INVALID_PARAMETERS;
> > @@ -574,9 +581,9 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
> >  	DECLARE_REG(u32, handle_lo, ctxt, 1);
> >  	DECLARE_REG(u32, handle_hi, ctxt, 2);
> >  	DECLARE_REG(u32, flags, ctxt, 3);
> > +	u32 offset, len, fraglen, fragoff, em_mem_access_off;
> >  	struct ffa_mem_region_attributes *ep_mem_access;
> >  	struct ffa_composite_mem_region *reg;
> > -	u32 offset, len, fraglen, fragoff;
> >  	struct ffa_mem_region *buf;
> >  	int ret = 0;
> >  	u64 handle;
> > @@ -599,8 +606,14 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
> >  	len = res->a1;
> >  	fraglen = res->a2;
> >  
> > -	ep_mem_access = (void *)buf +
> > -			ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > +	em_mem_access_off = ffa_mem_desc_offset(buf, 0, hyp_ffa_version);
> > +	if ((u64)em_mem_access_off + ffa_emad_size_get(hyp_ffa_version) > fraglen) {
> 
> ditto. ffa_mem_desc_offset()
> 
> > +		ret = FFA_RET_INVALID_PARAMETERS;
> > +		ffa_rx_release(res);
> > +		goto out_unlock;
> > +	}
> > +
> > +	ep_mem_access = (void *)buf + em_mem_access_off;
> >  	offset = ep_mem_access->composite_off;
> >  	/*
> >  	 * We can trust the SPMD to get this right, but let's at least
> > -- 
> > 2.54.0.1136.gdb2ca164c4-goog
> > 

Thanks,
Sebastian

