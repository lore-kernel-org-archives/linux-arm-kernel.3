Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A669C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIj47rywpj/D2C6gd9xtKK9WJO9HLsTC+3sPjXM4C/Y=; b=mFOXLNmBb2iRKI1cJTSTGV/PSI
	IGFua6Ncpru+YgKek0d5Cl8MRccMY5oXiYXsMuupFrLrbgH1x5YEcNHGazyv2tvdry96tyt+IKCJW
	mkLHg7n/y4jXr/qk6Heoe+QxQpwFLftBXe5B9zMmzD4DN7PaxM+Na18lvVfhaiLB9jhw9BzxpQ+bs
	T4rfU8nU5ixo97bqqvSYWdU4ACmb4TwwfU1C9CN11dL3dJxR2sytHXSXviC8VqOv7C3VUrIwn5uZB
	Pdvn665a99CvY2OowZ/s//ksHiGhNCJfwqikugv/jNpJhhY/aGFkgEH1L7YrdFNpuXKkvYQw9euUM
	qJvPDCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhzD-0000000FgbZ-0pyX;
	Wed, 21 May 2025 11:51:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhqu-0000000Fevg-0TM2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:43:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a35919fa8bso2716678f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747827793; x=1748432593; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIj47rywpj/D2C6gd9xtKK9WJO9HLsTC+3sPjXM4C/Y=;
        b=vqeZKzH0tWnbBRf+rOlJYIqXL8EeonRvQSiwcd78nz/ObfqItwQ3uf0IOYZQgFHaoI
         L7TppAAKFoIVEabJro8ro4S2FoAD/x5dgDYBQT6ZqzCIzcTwkamkNA/DYylwtUAwPo2/
         ZJ8SMq5AxbdsuH1znXSYn9qenfzTGf5h7Bf/gHfNzG+P28lmCRO+Xs1zmgpvAU4kDLWn
         x0zujLt4D6JgxOzxFploVDG/LzP2tORortcEUTY9cSwqQXdjp6QTHsg5iR1WYvA4pPIa
         PB0G/CYE4131twcEui8GfoA2kODdVDI9OFNj9GBmbB2BWN1vBSrKzNp7LmuwkcarMi2D
         qzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827793; x=1748432593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIj47rywpj/D2C6gd9xtKK9WJO9HLsTC+3sPjXM4C/Y=;
        b=Hbu5MAIYbVUHGTrVga+iZvUC1Hcvn7zMxs2LDMXjLCAJvnHEH41/IFd7pFFRq5hwKB
         vytK+ri1s5XyJq3j83xnRlQCr/4PAQwFrGUMy72EA3VCd4lS/Mr+saAfBol9o7aObEyu
         0iebAl3+rK9/pIRXKAnYEXpHJNpQ0TnPMJzoQl9Mwq+alVfBbwPgGGp7X93CO4Nf7gFx
         Bk/FMhJ/PqQQl7nTlK5BpYOV7M+5YYVrVAHNbYl76ZTPL8uLjdbCVRrxhpNWzyUCHXuG
         0Q6cahu1OM8JBpVaUsMbUhICX8aQov2DMXdzlaLyg4LiZyiU1WNU8yMrv9wH8QXuc3pE
         7j7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYRaJi8h4HPF8wtjMqbubSd1ho32aVQpqPUYbb/+M6Jq+oaFgRopsKV9SxlE60x1AExrqtPMHlt9/RUUULlI+q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb8PUJVUPEwXHdUc9Gl+7NdQd3U7FkWBGnJZxNY1cbBbioVCaT
	PvSO7nCSKfyr3g+Y04GiHlgsHOg0SpD69cnTvSLICstiR/f3n21W8yzaJdOR6Wk4TA==
X-Gm-Gg: ASbGncvlraAOQs1cwmokE6otel5m+bTXPob1CNghfnUF+EVSEsxnIDVBlEvXmVPRTeh
	53DtCYZ9JInY6asyDomugVI2DPmFsKgGTVDPOVMXnNXfIwy0uXpQ6gzzVhjFLxh/LVhuDki/SYe
	9b8e95MLgEQUG1NNJ+5VWAIW6uTgDCBOuCKUnA4myoS1Ywx9Lf0xpRf/7Zeqo1T+HY+3HrdL0A1
	NjFJSNDBaPerjGxxNvHwsjQP0Hudqo6PBwsYy5Tj9jd5bgkb4XZ29AXRlJRmeXH4B0H18QJO3E8
	lOWoCafUV2GoQJxYz1sEuxmDNv2clObAaX7HFep2Dw3eNV06zlWM/+FMTv9DlJJblPR2IwP37VZ
	LYqkpiAwbzWyttZjp9kCb2xcUCt4=
X-Google-Smtp-Source: AGHT+IFyiCTkts5eQTrnHL23MgrDGPsbhNN/YKTP/ITQvr4EG2o+sxQ9Os5W8avbkK1VKu9zMlICZg==
X-Received: by 2002:a05:6000:2012:b0:3a3:4b95:a8ce with SMTP id ffacd0b85a97d-3a35fe5bb43mr16581965f8f.4.1747827793442;
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm19215908f8f.22.2025.05.21.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
Date: Wed, 21 May 2025 12:43:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v5 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
Message-ID: <aC28TB_2Aul4s1T6@google.com>
References: <20250520085201.3059786-1-vdonnefort@google.com>
 <20250520085201.3059786-11-vdonnefort@google.com>
 <86tt5edy7t.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt5edy7t.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_044316_149276_130D70E9 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, May 21, 2025 at 12:01:26PM +0100, Marc Zyngier wrote:
> On Tue, 20 May 2025 09:52:01 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > With the introduction of stage-2 huge mappings in the pKVM hypervisor,
> > guest pages CMO is needed for PMD_SIZE size. Fixmap only supports
> > PAGE_SIZE and iterating over the huge-page is time consuming (mostly due
> > to TLBI on hyp_fixmap_unmap) which is a problem for EL2 latency.
> > 
> > Introduce a shared PMD_SIZE fixmap (hyp_fixblock_map/hyp_fixblock_unmap)
> > to improve guest page CMOs when stage-2 huge mappings are installed.
> > 
> > On a Pixel6, the iterative solution resulted in a latency of ~700us,
> > while the PMD_SIZE fixmap reduces it to ~100us.
> > 
> > Because of the horrendous private range allocation that would be
> > necessary, this is disabled for 64KiB pages systems.
> > 
> > Suggested-by: Quentin Perret <qperret@google.com>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 1b43bcd2a679..2888b5d03757 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -59,6 +59,11 @@ typedef u64 kvm_pte_t;
> >  
> >  #define KVM_PHYS_INVALID		(-1ULL)
> >  
> > +#define KVM_PTE_TYPE			BIT(1)
> > +#define KVM_PTE_TYPE_BLOCK		0
> > +#define KVM_PTE_TYPE_PAGE		1
> > +#define KVM_PTE_TYPE_TABLE		1
> > +
> >  #define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
> >  
> >  #define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > index 230e4f2527de..6e83ce35c2f2 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > @@ -13,9 +13,11 @@
> >  extern struct kvm_pgtable pkvm_pgtable;
> >  extern hyp_spinlock_t pkvm_pgd_lock;
> >  
> > -int hyp_create_pcpu_fixmap(void);
> > +int hyp_create_fixmap(void);
> >  void *hyp_fixmap_map(phys_addr_t phys);
> >  void hyp_fixmap_unmap(void);
> > +void *hyp_fixblock_map(phys_addr_t phys, size_t *size);
> > +void hyp_fixblock_unmap(void);
> >  
> >  int hyp_create_idmap(u32 hyp_va_bits);
> >  int hyp_map_vectors(void);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 1490820b9ebe..962948534179 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -216,34 +216,42 @@ static void guest_s2_put_page(void *addr)
> >  	hyp_put_page(&current_vm->pool, addr);
> >  }
> >  
> > -static void clean_dcache_guest_page(void *va, size_t size)
> > +static void __apply_guest_page(void *va, size_t size,
> > +			       void (*func)(void *addr, size_t size))
> >  {
> >  	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
> >  	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
> >  	size = PAGE_ALIGN(size);
> >  
> >  	while (size) {
> > -		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > -					  PAGE_SIZE);
> > -		hyp_fixmap_unmap();
> > -		va += PAGE_SIZE;
> > -		size -= PAGE_SIZE;
> > +		size_t map_size = PAGE_SIZE;
> > +		void *map;
> > +
> > +		if (size >= PMD_SIZE)
> > +			map = hyp_fixblock_map(__hyp_pa(va), &map_size);
> 
> You seem to consider that if size if PMD_SIZE (or more), then va must
> be PMD aligned. I don't think this is correct.
> 
> Such an iterator should start by doing PAGE_SIZEd operations until va
> is PMD-aligned. Only at this point can it perform PMD_SIZEd
> operations, until the remaining size is less than PMD_SIZE. And at
> that point, it's PAGE_SIZE all over again until the end.

Arg yes you're right :-\ 

Shall I respin a v6 with that fix or shall I wait a bit more?

> 
> Does that make sense to you?
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

