Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77FC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MJ40kT4710HmcEWSuZdjclOwHS9zhiVrIrryh8M1XY=; b=ZFcqh35IneumiTr0H4O2M7qW/e
	irqIC320/zxVkUZXiI3ixFgDCrdaxV6ZpTq6CdWrvHPRlUSxAjPsmT63bfYU8VKdYJhehNi/C5Kwm
	0NLkrxzioofCYbXe8G8wEAd8bxSxGKUdOMAqyKoOSx5uF0LRsfvjls68F++aJjxLehQvjxNq2lWnp
	6ObyJ192lPz0vuHuDy6tcU/PbLNOn4ga7anwHaWthENA/DF5VXDft3JAATAhsnC5hFVV7gl9Dy6uS
	NcFSMzu/UsGy8e1e2lMe2fLyZUOTjIMLCOEkGvaCbbmTHU4JR2jucvYoNjXPoHl3qR0J1JcHTWFfT
	WesWfvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ZT-00000009672-0HMz;
	Tue, 21 Jul 2026 10:19:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ZQ-0000000966J-3oMK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:19:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495509b08ebso120945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784629167; x=1785233967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MJ40kT4710HmcEWSuZdjclOwHS9zhiVrIrryh8M1XY=;
        b=VejT0To103nqNOdX5crM4mEe/Npj/nS3S46GoseESJ74vudftyeG4xPMkg4ocNTYlP
         VW3jEOg4iQ05+KxBLH/hxLkcmbl9Vu+1saPEMyg95wn5KrkegX62M+0g2vNgZaked3yP
         0Wztrd+UCN4TydNvetKN3GNPmypo4ynfsr0w6HQDKkFM/lOwjlqK11PFIdBw1NRhU1r7
         P4ZUv/5IVaMZM9zEUtyUaLUUpuMFD4Eo0flKWWVTu1eq6/YJ9hu+IJc3p1YcsQyZMB4H
         3RvQG4TThefwvt+uhcw3bHAt3aPBX2NpazJ54OEzhdhn6AP9M11tSWvXU8JJS9GrT4hf
         1wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629167; x=1785233967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MJ40kT4710HmcEWSuZdjclOwHS9zhiVrIrryh8M1XY=;
        b=B4w0pcRMU/Uy21zKKVP4934zafQUSUdeAOPcJXjt4dJT3+xkIUxkvLCmWLP+9KtWrq
         yHHSmgwiyKyJ5TuYMZSVy7C5GUINLFNoZpJo98bKaOFSEsHul47aQSK2fohPSv8zlnz2
         LVBuG6cQBYpzaD6T5Hp8vF6mI7GiNJ1UXg+OQBUKn+hYAZHwAty90CB4v2m8kdSxy5MJ
         NNKkp6+LmZgzZw+FIyvDDqcNZPgZY3PtgUAyvkAMLMPwKnb5F8SgHX7M5jGh14gyZUDp
         UA8xYEqxT06LU0NhcNdQmRcf9Sp4DcbhVrEpOBqLk49ZpOXrGQRF83TanCQfcJeuxACU
         XxWg==
X-Forwarded-Encrypted: i=1; AHgh+RrmiOTp7k/wscivzVBtekhRvGT4RgSeHG2bcDx+Xh8K99iV5LZn3kFd7qj5rErL/osXSugdSp55yUCGQhed0OMw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4gGJOlmTEhPE9SvOxd9BWDaqdOo23SZr/nrbJpZaESNIPYb/Q
	5q0LaD5MdRNyzRuVUS7SPO3LU22y3tXhH5Wb0vpCTOuIOEr6cgY9MTYRx/IkgXqoOw==
X-Gm-Gg: AfdE7cn2GTuTzOeNL+fGQUhJJM3smVqGob9vMgTUx5Y9aXnPKAd07VFD4UcANI0upAl
	bduqC0v6tc59WsRhmw1J8QkUphEo8tAGB6a9otAsb/djWFg+MrN3zgI2MGxiBu6pCAmgeA4IEbP
	brHWbxC4eF4oEzbfEXK+nMnvcSbUlL+N8mAt3vforVlDo7HoeybptIurP2gf0JfdZIpfSSyaf28
	7w2NdxPyvx6+H/WsT+pMijfxfrqXIUK8LMfX5h4X5upazrkMY32pKGZsNIyc9ZL142RrDmzTemx
	gcnVF4359ZlOTG94XyeLTRnHoGEQfLKsSyNyVfnVsbqyKLT9aALrGoRsBmueXRa2qWEbJrX4Etm
	PSO+tnjtiVBP56Kb795qYFF+HBnHaMPDcuTJIxqGwzADxmMmNmhfyxwpeDL0tpKoBZ0vzGqlIDS
	GyPurf+I9LfOLDqgd/n38g/hqBj5sUyoDZqlXpjQ==
X-Received: by 2002:a05:600c:300b:b0:495:4747:548b with SMTP id 5b1f17b1804b1-495642ea594mr1062635e9.0.1784629166651;
        Tue, 21 Jul 2026 03:19:26 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee926dsm35363290f8f.35.2026.07.21.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:19:25 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:19:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, oupton@kernel.org,
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	vdonnefort@google.com, tabba@google.com, sebastianene@google.com,
	keirf@google.com, Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] KVM: arm64: Optimize protected mode and FWB
Message-ID: <al9HqhO6sp3FFbtQ@google.com>
References: <20260721085646.1660673-1-smostafa@google.com>
 <86y0f4ejr4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0f4ejr4.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_031928_963245_1B1C1301 
X-CRM114-Status: GOOD (  25.12  )
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

On Tue, Jul 21, 2026 at 11:10:07AM +0100, Marc Zyngier wrote:
> On Tue, 21 Jul 2026 09:56:45 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > KVM opportunistically enables FWB if supported by the system for guest
> > VMs, which allows it to elude cache maintenance for data as they are
> > forced to be cacheable from stage-2.
> > In that case, __clean_dcache_guest_page() will immediately return.
> > However in protected mode, before calling __clean_dcache_guest_page()
> > it loops over the range and fix_map/unmap it, issuing TLB
> > invalidations, dsb() and isb() unnecessarily.
> > 
> > This can be optimized by returning early if FWB is supported,
> > kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> > functions issue dsb() for the unmap path.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 4e329e39a695..049a09be2bbf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -261,6 +261,13 @@ static void __apply_guest_page(void *va, size_t size,
> >  
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> > +	/*
> > +	 * Guest stage-2 uses FWB if available, making it safe to elide CMOs.
> > +	 * In contrast, the host stage-2 never has FWB enabled.
> 
> Beeeeeeep!!! Since a373930ec9406 ("KVM: arm64: Switch pKVM host S2
> over to KVM_PGTABLE_S2_AS_S1"), FWB is enabled everywhere when
> available.
> 
> Not sure that changes anything, but the comment is factually wrong.

Ah, I see it uses KVM_PGTABLE_S2_AS_S1 in that case, that should not
change the patch, I will need to update the comment.

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

