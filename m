Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odoNhC1jkxHEmpElHSk6/Y6iPKFT+XGqoxzHTbmY1lw=; b=WgJOIUJEOKMxqQ+oJAX9BYSa36
	ffv85tDhYePqQ7Qaw0/X8HnZmewUctTlRNNm9HjPhjWSNqQKgxHbSqBl+FZaf8cOe5oyEzkSqBJS4
	FiZBx/cZgWgr4GM1inCeejSW6FJZYn63T/Bn3eKd5EarW+KsY5RCcp5mI5ahKL+tkjVLPs/Dq05+2
	AFq2iLWGgWGU45sgZ5jy+re4UMFiPN55K7yuSXx8KGgae0oL31C4WG0KPoZzT32CPG/Wq/i716yoz
	PMFAJwmk8scC4e6yBm+uR6eCzfBfiziomazc/up8gKNzMaKYUO1pd7BAgYmIhW4K1Y7wApOElXYd3
	Bw2JNWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQZy-0000000DiVL-2CSg;
	Mon, 11 May 2026 13:21:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQZo-0000000DiRj-1dnd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:21:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778505699; x=1779110499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odoNhC1jkxHEmpElHSk6/Y6iPKFT+XGqoxzHTbmY1lw=;
        b=sx3FVQHd34ZyWB/tPLHkLPl4sSCBbRAAIf5Bkzo4HDDQmmYfreCKgpM4R2/HBz8nuF
         92uCR7B+IkoA2TDhHlSSkmbmv2B19c2uUqY6pBdonKrTNAy9MC+XfwX/gYz+arJhGEdm
         22NLLIlHSC78aBlYTFcCMnuUeQLDoR7U5lV4LWxXrpnaxv2N7yvKeEw91iLVdpv8vVpD
         lV5vugAcPcMuQxZlMF0Nw5unKs/GozwiJCwHPmkqdq2xWLMlqn5PUjLJYE36KjoggoDp
         rpxgIH6ylpFZwNvFuMXS978OUuMJ4jcbpS6xQjADDLGF3DJNmPdHI2jPWpKsLiQ+0J7y
         0VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505699; x=1779110499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odoNhC1jkxHEmpElHSk6/Y6iPKFT+XGqoxzHTbmY1lw=;
        b=AvliK76NIOoxUJ60T/Fsczxfhlst6Nigk5tpfCtytenW3SmjZmpeUaU0uG3zWIYqlI
         u/l6jBXiJERhLG1ObXUqjruYLPp8jgSZfEbOKuxQzfQCKozy9VoqmnsiexLRpeR1tbjQ
         zvI4364Fe8sTWc4K/7s4NsCvqFzhE5F17XmQbpdVV/VghubyrTkVmL2/xHzZkR+fCmDH
         uP4RWnwnbhu2J5R/BBOeA6BsozPbV15LolFuyVGhvavw8H639mLVIXOhlrQrCooEgU5T
         C90+7ANCKLSnElK+4kaV8yRe9NSlKF2vEqwzEQLweu8ywFBa2X4STVhFxnfz/aMRFnXj
         adWw==
X-Forwarded-Encrypted: i=1; AFNElJ/ELgdR5yKMJDSuFC/ZRIvWlFjmM2Jyyfub1QcUQwwwqBD5t/V1YsifsH+sIfgUHfqDY2GRtc58hZlmzK8HDrir@lists.infradead.org
X-Gm-Message-State: AOJu0YxcPFLOc61KXAVXIKB5rlag6PuibTHU0Kkz5Llm40uv8SpyWyvN
	lFkyRn5z2GcbWCzxmaqR1jmaM5GN2zJWTaJWp/fBRKML3AxZVheGFy5kIU7X93C/QA==
X-Gm-Gg: Acq92OGuOhdtz2fXdJFzVm0Xn9BXz8g3/843I0DzyI9/V5HzW82JCojk+pOmPzm7/4t
	vd8c5FlY6xLEzsSC+WC+b6sW4WLRlxtM1IY86EORQuFtoO/E443SoySgWKNBjgtp1JnRmFA5D5d
	rYGaEQx7g/XmvjuEy0KuAO3SczBbxvDJdKywte0V+mD+7C44MJppCME/Lv2C0o1dgAR8wzDcBmc
	jOmtL0TxSaZ3/uvOYKAvqzLh2TdlgsWNPnUXfo4jmJWXCO3nmM8npCeCXglOTrXLLVjmVYME4Bd
	68xSn2L0m48V8mjDzgXL3G/7KDx+TGBoj3oBrkmfIRMYmn6UsCX/NgoqhBNzC71EmblytOqQJt5
	pb/HCJoty5pddzJMb57eYYhWYxLauhHaG8u3qd6cqQ+y19B/6n/aQqzdXZNvaUwoaudvjfD1FDM
	xygPoLTZep5OVzwT71ReeFLt7UNMXQE99FZpo6PkvavDdvd0s8GXIKpNZWzxFAy66vRUSK
X-Received: by 2002:a17:903:1666:b0:2b0:5c88:51e1 with SMTP id d9443c01a7336-2bc747c1c17mr5151525ad.14.1778505698122;
        Mon, 11 May 2026 06:21:38 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm20960916b3a.19.2026.05.11.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:21:37 -0700 (PDT)
Date: Mon, 11 May 2026 13:21:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <agHX241sD1AjG8KB@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
 <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
 <af3ryl7G58D2GeWr@google.com>
 <4e129891-2f52-4bac-8e33-1fdde42fd29a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e129891-2f52-4bac-8e33-1fdde42fd29a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062142_082862_4054C190 
X-CRM114-Status: GOOD (  43.38  )
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

On Fri, May 08, 2026 at 03:24:32PM +0100, Robin Murphy wrote:
> On 2026-05-08 2:57 pm, Pranjal Shrivastava wrote:
> > On Fri, May 08, 2026 at 02:31:11PM +0100, Robin Murphy wrote:
> > > On 2026-05-08 2:12 pm, Pranjal Shrivastava wrote:
> > > > On Fri, May 08, 2026 at 09:35:50AM -0300, Jason Gunthorpe wrote:
> > > > > On Thu, May 07, 2026 at 10:30:14PM +0000, Pranjal Shrivastava wrote:
> > > > > > > @@ -92,6 +92,16 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
> > > > > > >    		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
> > > > > > >    					      CTXDESC_CD_1_TTB0_MASK);
> > > > > > > +
> > > > > > > +		/*
> > > > > > > +		 * Enable Hardware Access and Dirty updates (DBM) if supported.
> > > > > > > +		 * This is safe to enable by default, as PTE_WRITE and PTE_DBM
> > > > > > > +		 * share the same bit.
> > > > > > > +		 */
> > > > > > > +		if (master->smmu->features & ARM_SMMU_FEAT_HA)
> > > > > > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> > > > > > > +		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> > > > > > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> > > > > > 
> > > > > > IIUC, we should be setting these if IO_PGTABLE_QUIRK_ARM_HD is present?
> > > > > 
> > > > > SVA does not use IO_PGTABLE at all, and it directly constructs its own
> > > > > CD.
> > > > > 
> > > > > No relation between those two flows.
> > > > 
> > > > I understand that but I mean we need to know if the system supports
> > > > HTTU ? Like for SMMU we use the IO_PGTABLE_QUIRK, shouldn't we be
> > > > checking if the CPU's tables support HTTU?
> > > > 
> > > > Are we assuming that if the SMMU IDR presents HTTU capability the MMU
> > > > would also have it? I think an unconditional enablement is risky as we
> > > > may not have system-wide HTTU support.
> > > > 
> > > > If we look at arm_smmu_master_sva_supported, the driver already
> > > > maintains a strict agreement between the CPU and SMMU for SVA.
> > > > It checks sanitized CPU ID registers for things like PARANGE & ASIDBITS,
> > > > and it uses system_supports_bbml2_noabort() to decide whether to enable
> > > > FEAT_BBML2.
> > > > 
> > > > Shouldn't we follow this exact same pattern for HTTU ?
> > > > We should probably be checking cpu_has_hw_af() (from asm/cpufeature.h)
> > > > in the SVA support check or here if we wanna enable HTTU.
> > > 
> > > It might make sense to depend on CONFIG_ARM64_HW_AFDBM - when that is
> > > enabled, then IIRC we already expect to cope with some CPUs not supporting
> > > hardware updates, so it should still be fine for an SMMU to make them even
> > > if no CPU does. However, if it's disabled then I'm not sure if missing
> > > access flag faults (if SMMU HA silently sets them) might be an issue - for
> > > dirty, we'd just never put down the Writeable-Clean permission so enabling
> > > SMMU HD wouldn't do anything anyway.
> > 
> > I see, so IIUC, you mean if IS_ENABLED(CONFIG_ARM64_HW_AFDBM) but CPU
> > doesn't enable HTTU, it is perfectly safe to let the SMMU do HTT updates,
> > Since the fault handlers are already expecting HW-triggered updates?
> > 
> > Which means our check would be something like:
> > 
> >     if (IS_ENABLED(CONFIG_ARM64_HW_AFDBM) {
> >     	if (smmu->features & FEAT_HA)
> > 	 ...
> >     }
> > 
> > instead of cpu_has_hw_af()?
> 
> Hmm, looking closer, cpu_has_hw_af() is the thing which actually influences
> mm behaviour (via arch_has_hw_pte_young and arch_wants_old_prefaulted_pte),
> and that can still be false at runtime if ARM64_HW_AFDBM is enabled but any
> CPU doesn't support HAFDBS, so perhaps you were right the first time :)
> 

Yea, I believe the cpu_has_hw_af() is the right gate.

> Although AFAICS from __cpu_setup(), ARM64_HW_AFDBM will still
> unconditionally enable TCR_EL1.HA on CPUs which do support it, so maybe it
> is OK anyway?
> 

I believe cpu_has_hw_af() is still the safer gate for SVA. While 
individual cores might turn on their local HA support, cpu_has_hw_af()
represents the sanitized system view.

In mismatched systems (where some cores support HAFDBS and others don't),
cpu_has_hw_af() will be false & mm shall default to software-managed AF/
Dirty for consistency across all threads. Enabling HTTU in the SMMU while
the kernel mm is in 'SW-Managed' mode could cause the SMMU to silently 
flip bits that the kernel is expecting to handle via faults, leading to a
mismatch.

Thanks,
Praan

