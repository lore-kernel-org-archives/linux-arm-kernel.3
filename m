Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B1FC44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M86Ir7wes1y7r8ERYu4z2fhecNCYpHaDZuovfA+lIDI=; b=ELTeWwt0JXzIQJZZ/O/TBZMPHY
	AqrC1TJOGcCqa99tOqevsNw6JDNoq1C37smqDV30mC0F+saTGxgZnelRtjuutDQCLQtzY50l7r2dv
	9k9dVmtsIQdOKcFZmTp4YPulWUFUQGXJ4jCmMaE76FAnOi3WweiA5ujMPb1/Gm9aHibKCdBHJtuVD
	aUXvxCH5UayOBnq04Qg3E8ZxAxd9P0kD+p0R97mMnaU6AHNl5Epa4tYiKErbhChwRcEHQqdh0k9vf
	4664xT5686aKKAauvl9nk8u+iWuYJ41BqaY/khhbAxUc3HkHSJ6jiBfEpnWHg/0HkJrPEWNmw2LHz
	eN1mlkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNSL-0000000HXrR-0ctY;
	Thu, 16 Jul 2026 14:52:57 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNSI-0000000HXqd-1rpY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:52:55 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c1805b8a7so69016741cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784213573; x=1784818373; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M86Ir7wes1y7r8ERYu4z2fhecNCYpHaDZuovfA+lIDI=;
        b=I1q1EP1wR8ur6Bh3XNMrfEJzgODZPwnMGh+Fs5JuXGgKlrZ/hMT2wLu2l9iStjohTl
         pnUToeprqauydj5AElq49ArPdT6hPqP53G22bJKeS6pMgus6eQxw0K31xDsq0KkNtdNT
         6xxWOnKHX3fkScS99wWgv47SHTqLhSTwP66/RxVLpwiQT9Q15ZcPIfnMf3NuNnHqyH7n
         gnRezx0kXUTjoDxB6aOxgQq9HXmPpPxd/fBhFllePO7V9Bltb5LR8iDFhBHLrnFUpfIn
         vxQF5XJ+RkCynRTtnAG4YMME2RWUuYWV8P0W8360jNoVasXw/Ti5bGPAc9cDCHppeGrq
         CHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213573; x=1784818373;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M86Ir7wes1y7r8ERYu4z2fhecNCYpHaDZuovfA+lIDI=;
        b=qPUh5gVjZvTCsSjY+SiMAaGUbg3ipMY5PV0vALWidRLhQhDoANU6vyv6KLI+b/H2xd
         l7G6yAifM9bYnv29pMhPEDcqQGyoxEifjftvE6Ad7e5SBCezXDpsyyfjVMejKddzRAvF
         sCrF/rhznsOgr7GUobSCzBUiwE/LCk6ysC9D8Uo+j2PYgmJPqjdho+xobmjVq4/gqqqa
         lmnFi1DOooACGcI/vzo74qKsQb3sPXvbj5OOYViVHMNlXvU2RAHXGCl1jxs1PGoALjNo
         vFItRH2aXl/QisZ/lvvZEr58ShxV3powUgz8l9Bpy0M8d6anCYBYxmJQISvqdBmddCZh
         7voQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjsUey28TYjxGUA/DVd33rfheRG6vdZGFCAWuK1uMqN94d4WZ7YHQeY8vNbpg+81TP6W2bco7oukt2Cef3A7Io@lists.infradead.org
X-Gm-Message-State: AOJu0YwNMDf5MUT7J9ylljOrNLrrdvcn35hLH9Xstrxx+8oVpOFvs1VE
	LgBoVihTnxVz6gVaI+8vYE7Fo7mwXu4EsSYfuEFU76Ohqgfwkc0AJhHte0cklho3Mwo=
X-Gm-Gg: AfdE7cla0K65HCJrLvFR22dGf9ya0HfxoJ9JtcGN0pDEfamS6VcEoyTZ5uvOc8Uw/lq
	psHWiKQ5ef30/CtZP6pyMTrQCA/F3K9h5uahtiBOEC0CwLtjoUOHB0ZFI21d1hQPySFgCmEh1ii
	+clr4fSrLTdowwVXyw+dw6T6V35robM6rokvWNRP9BOQQhFaRFLt0oOBmp7W0pUZFyy0zkIy2S0
	4wPfWFHtE4InbelxdAPu2KC61POjBZ6IgBhKKpY6gMH66m4/aLk+w6Ab++Z3so1nD0QK+vbF2rm
	KquigxT33C6Fm6vowyIui24xpBhWml3QnX/nMEwg0gXtn6dJ23cMHL9psiDJirxhGbei6N7Sp/s
	BUz2/9e0449VTSMdSggfCIRjvXNc4pr8BEv6EEkPRzjzu9XsADQ==
X-Received: by 2002:a05:622a:1b88:b0:51c:1811:6eae with SMTP id d75a77b69052e-51e4f0a757dmr78823321cf.47.1784213572745;
        Thu, 16 Jul 2026 07:52:52 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51ec9fef211sm28849141cf.0.2026.07.16.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:52:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkNSF-00000002ZDm-0DPq;
	Thu, 16 Jul 2026 11:52:51 -0300
Date: Thu, 16 Jul 2026 11:52:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260716145251.GE210048@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <9d83ec13-3b1e-4c1b-8bab-16ea057cfba0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d83ec13-3b1e-4c1b-8bab-16ea057cfba0@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075254_497981_96B22272 
X-CRM114-Status: GOOD (  20.43  )
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

On Thu, Jul 16, 2026 at 11:55:20AM +1000, Alexey Kardashevskiy wrote:
> > > For AMD/SME, on host with memory encryption we now end up setting the C
> > > bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
> > > some other MMIO bus understands this attribute. Maybe we should stick to
> > > something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
> > > since this is not universally defined, just use the old dma_addr = phys
> > > if MMIO and ignore any unlikely DMA offsets.
> > > 
> > 
> > Considering for AMD/SME system an unencrypted dma addr is one without C
> > bit, will this be good?
> 
> Normally both encrypted and unencrypted DMA addresses do not have
> Cbit, with the only exception of "iommu=pt" (which is not the
> default afaik). And in this case, having Cbit in DMA handles only
> makes sense if p2p trafic goes via the root port (== IOMMU in
> passthrough mode, and I am not sure even about if the root port will
> convert this Cbit to T=1 MMIO in this mode) but if it goes via some
> PCI bridge - then Cbit won't mean encryption for sure. But I do not
> know much about p2p (never touched). But in any case
> force_dma_unencrypted() seems to make no sense here.

True p2p through a switch does not call the DMA API at all, it
directly stuffs the physical MMIO BAR address of the target into the
dma_addr_t - which won't have a C bit.

The DMA API is only involved if the p2p will transit through the root
port, so adding the C bit is correct.

AFAICT it is iommu=!pt that doesn't work at all since the AMD IOMMU
driver always does __sme_set() even for MMIO when forming the IOPTE,
which I guess is wrong for MMIO.

Jason

