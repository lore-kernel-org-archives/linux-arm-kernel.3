Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9324DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TnKwYV0Kzd1zXkaaqOGDYWO3WX2nNMrzmPg/2ozAlk=; b=CTDDbRuZ30gEnFXvR4b+lxMqeq
	G3QIoP50MJkuj3x76JNiAJb0bp9Yh6J8hSiXCueLb605EE85ArQgdF6IbBmUyx1IlLShmTrZbN1ih
	8JemEhX8o/UYxsbjdObHbaZmPXgLH7r/WbrYq7rgk3DTWng1wGHJso5xJ2ImYyDsTJMD3jnVGnRAo
	XHbW72OcYqdUAkrBxYTMX2V8LkM1tl+OIICF4dS2JQM/57zFQZ8ME+si3M1md/WU/OIQm8RaPjwVC
	Y4JaEAPCNIRdKuI2pOdhH6HkuNrfuNKSU+IoS3BDu7hShpNOtz1fhwwEHO8g4m82+CAhsL+xIINJJ
	BLl6UfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAZ7-00000002vbI-0Sf3;
	Wed, 13 May 2026 14:28:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAZ4-00000002vaA-0ciW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:27:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b46da8c48eso1535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778682476; x=1779287276; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3TnKwYV0Kzd1zXkaaqOGDYWO3WX2nNMrzmPg/2ozAlk=;
        b=ULPVnfgI6sXI3vMUJJznwtFQ/zJ8bXZXyv51mqmhuR++DnqI/c8OZDUgWcX8M4OqVY
         Gphyb6j57Ujv2h4MVuaoMweXT3ofcg+XJsUfCzySramtwJB3ev/mHOt8u8fL145TcHai
         kwKjqjes+puB2I+g7iHLQGdxF/ouIk63XetG8Y5kLCDldGW1hvtIwQ0+O86bjRIEM545
         1S07q3rqHzmT2gDpZodUJqqmxKpEfnygRwi0GHD71Lv0I3xXyHGLEJM1oM4xkOmo2vt1
         Vr1dZghku/Rcgd4EOogi4Y+bMVNEgGXUUdusjjjlEPtziqInv8c6eCwm8EdtH/R+f/qt
         5Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682476; x=1779287276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TnKwYV0Kzd1zXkaaqOGDYWO3WX2nNMrzmPg/2ozAlk=;
        b=Ml4KaZP7rOfMMXSypamiZCmBCaB8Iyc4EtAQk1XR42kthG6osL5fJ8AaWFr947XzUN
         m9qQE+Ev3UTVurEuqOTUffDxte1p9umM3BELm1Knva3Z+NEGJhVmQY4Qy9t2Ug77eeTx
         Et36PfZ7wa7dvtDI016ieq8J4B2b0vm4vgP4DFAr1pEncwGrt38RdMojlI/A9uzMgVqC
         MFzitSJUWau0SC21p3v1dkS0zRsIXY02UinWr9oyYxdzyl2Zl5qYBPivvTJklF+JFyCZ
         M8PLYbhEitUM92uKF494dj1SA4jPxFlm23kHR+44PslE7OsXaIpAt1u3GWM7Pp4aBkjB
         8/Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/4Hv6jQZTE7jWjsNKTyVdYYrTeOFLRi/y3ycso4LEqCGM497L0UnpG+zV5Yn0n28vd2R/NOORafeh28eyZjnS5@lists.infradead.org
X-Gm-Message-State: AOJu0YwejnT2nMc5T7Sa0efzdB2awVUBkGQcbq3RQ2kQTi01gk3Ivwe/
	noIUlzfzb0aP2fy2vCJp6mjprmEmUyrWAeqHAeGUboImBVTWD6WhPgI0aC35CL1Gbg==
X-Gm-Gg: Acq92OHE1v8brQ0EnRJNkVUHIxrFhwFe3phm+GVflD4duUdTPKENumWmZq1Yo5+BwZn
	6jHE9FyCCYwOxvpGB+OLgnz7tNmUm8ydr8myRq4iPGt/jjiYbNH4qjddDv7qbAdDHNZHCrYX5l2
	f+RDFOytdXBrud7wj0hSfaxRvQ6sVPaoPMPSSLMR3HAOb+bDvj1kyfjF7Ge2gthTotEZG/3XS0B
	GZsB4owJLgQ5S0vC6qt6Oq+Dn2FmcSHZHXafr06uQDJFDEAJghA5d9BO0GT+ys10LmlS2f0wKxF
	vdaMr1lBUin16STD0iPuP2iQqujzzBJY5w5tNDJeZC28uc9s+jeuXczJqQ/7Z5cSCnDvYTrdoig
	3+kHnD2a1uENyeNJupMKOiMXXLGmpr+mcROLxc6zllXL/HHPJfrUxYCOYnwuyE0nPtDvb4XfB5O
	jO9UNFmt9HUvckdv7TYpPv1zyXkPQWSViHCig+/MlGhToV8mxHhmBbhxIXUrB7QOgg1yLB
X-Received: by 2002:a17:903:2154:b0:2b8:e82d:ff7c with SMTP id d9443c01a7336-2bd2c0f12bemr1729045ad.9.1778682475851;
        Wed, 13 May 2026 07:27:55 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edfa2fb1sm3416572a91.17.2026.05.13.07.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:27:55 -0700 (PDT)
Date: Wed, 13 May 2026 14:27:48 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <agSKZPJmFMLc0gno@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
 <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
 <af3ryl7G58D2GeWr@google.com>
 <4e129891-2f52-4bac-8e33-1fdde42fd29a@arm.com>
 <af7oyeleKFXpcIKu@nvidia.com>
 <agHYDxuYyqzmAfy5@google.com>
 <agRjt9XpN66ktdk9@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agRjt9XpN66ktdk9@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_072758_198666_6A9F2DE8 
X-CRM114-Status: GOOD (  38.71  )
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

On Wed, May 13, 2026 at 12:42:47PM +0100, Will Deacon wrote:
> On Mon, May 11, 2026 at 01:22:23PM +0000, Pranjal Shrivastava wrote:
> > On Sat, May 09, 2026 at 12:56:57AM -0700, Nicolin Chen wrote:
> > > On Fri, May 08, 2026 at 03:24:32PM +0100, Robin Murphy wrote:
> > > > On 2026-05-08 2:57 pm, Pranjal Shrivastava wrote:
> > > > > I see, so IIUC, you mean if IS_ENABLED(CONFIG_ARM64_HW_AFDBM) but CPU
> > > > > doesn't enable HTTU, it is perfectly safe to let the SMMU do HTT updates,
> > > > > Since the fault handlers are already expecting HW-triggered updates?
> > > > > 
> > > > > Which means our check would be something like:
> > > > > 
> > > > >     if (IS_ENABLED(CONFIG_ARM64_HW_AFDBM) {
> > > > >     	if (smmu->features & FEAT_HA)
> > > > > 	 ...
> > > > >     }
> > > > > 
> > > > > instead of cpu_has_hw_af()?
> > > > 
> > > > Hmm, looking closer, cpu_has_hw_af() is the thing which actually influences
> > > > mm behaviour (via arch_has_hw_pte_young and arch_wants_old_prefaulted_pte),
> > > > and that can still be false at runtime if ARM64_HW_AFDBM is enabled but any
> > > > CPU doesn't support HAFDBS, so perhaps you were right the first time :)
> > > 
> > > IIUIC, v2 should be:
> > > 
> > > +		/*
> > > +		 * Enable Hardware Access and Dirty updates (DBM) if supported by
> > > +		 * both the SMMU and the CPU. It is unsafe to enable SMMU's HTTU,
> > > +		 * if the CPU does not support it as it bypasses mm page aging.
> > > +		 */
> > > +		if (cpu_has_hw_af()) {
> > 
> > Ack, yes. IMO, this is the correct system-wide gate.
> 
> Hmm, I'm not so sure :/
> 
> cpu_has_hw_af() doesn't take into account CPUs with broken DBM and, in
> fact, ID_AA64MMFR1_EL1.HAFDBS allows support for AF to be advertised
> without support for DBM.
> 
> Having said that, I don't understand why we need to care about the CPU
> support. The comment above states:
> 
>   "It is unsafe to enable SMMU's HTTU, if the CPU does not support it as
>    it bypasses mm page aging."
> 
> but I don't understand what that "bypassing" means. vmscan should still
> pick up the correct state from the page-table, so what's the problem?

I agree that for the Access Flag (AF), vmscan would eventually see the 
bit in the table. However, I’m concerned about Hardware Dirty (HD/DBM).
I know the vmscan might eventually get to it.. but here's my worry:

IIUC, in arm64 the dirty state of a page is tracked through a specific 
protocol using the PTE_RDONLY and PTE_WRITE (DBM) bits. A shared writable
page is initially mapped with both bits set (_PAGE_SHARED [1])

It also seems to be documented in arch/arm64/include/asm/pgtable.h [2]:

/*
 * PTE bits configuration in the presence of hardware Dirty Bit Management
 * (PTE_WRITE == PTE_DBM):
 *
 * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
 *   0      0      |   1           0          0
 *   0      1      |   1           1          0
 *   1      0      |   1           0          1
 *   1      1      |   0           1          x
 *
 * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
 * the page fault mechanism. Checking the dirty status of a pte becomes:
 *
 *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
 */

Thus, if the CPU does not support/enable Hardware Dirty management
(TCR_EL1.HD == 0), it is forced to trigger a Permission Fault on the 1st
write because PTE_RDONLY is 1. The fault allows the kernel to call 
folio_mark_dirty() [3]

If we enable SMMU HD independently in the Context Descriptor, the SMMU
will see a write and silently clear PTE_RDONLY in the hardware table.
When the CPU later accesses the page, it sees PTE_RDONLY == 0 and 
proceeds without ever faulting.

Now, if we're work on an SVA page, with only SMMU supporting HTTU. A DMA
writes to the page and the process (CPU) calls fsync(). IIUC, it performs
a lookup in the Page Cache specifically for folios tagged as DIRTY.
Since, vmscan didn't run yet, this could potentally drop the writes..

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1-rc3/source/arch/arm64/include/asm/pgtable-prot.h#L61
[2] https://elixir.bootlin.com/linux/v7.1-rc3/source/arch/arm64/include/asm/pgtable.h#L390
[3] https://elixir.bootlin.com/linux/v7.1-rc3/source/mm/memory.c#L3698

