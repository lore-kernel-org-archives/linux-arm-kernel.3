Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2708CA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=; b=V74y96e2rUbnz7/aNC6phI2GAh
	CGMo7Wl7w4nzm753MTE8eEkUpOvcRLVoiV5k6pME3Demj8aflKtRhIEbP1isTHFkLemre112gjAT1
	GJsvz8uvUDNaZY1OZrBiTtL0pADyn0KNP/jlpWpy2SXde4aO6PiJQThL4OpdOHmMMSJBiKE25DLpg
	AQf9rGiIeBNZ1Wvs9tohaRrc9txHX0Ibias2mcgC1+JW5BqPAOiqbKaWEzSsAM9WiBM04gtu1CFjC
	s+cDT1eDBEAHNf/2TI/NuiS3Lc6Wfi+Y1I7hWe5eFBmcPRLSHSM7k3JzK5qos/in45JckNWyKkZhU
	5fWwPA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCkXn-0000000CWUN-462U;
	Fri, 02 Oct 2026 21:11:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCkXl-0000000CWTm-0nXV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 21:11:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d3b445a84fso20465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975507; x=1791580307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=Ni9PK0rlF4M7gOXj9IuHjCrfq98zYP6Bb3Q/H6gUHylYEMbD8WyqtMHL0dXUIuUkLw
         jEHZbIIBHQg3oaceps4lY4V/v80d49HJOmHCYKXvXXJPcteNKquxJWYE0DENOClsIi0W
         D4e9xTXHkbPQ/QpUsWGj+u3ktJX1SWwNj0jaXvWVGfKbPa8jxGCrC6NQJTbhXxNChoj0
         gg7f/7cgEGZROMQcWhbgRA7ltQE1pEQkYsp3TCx98JVxJ5x5pDzDrQtVvkdxBVNHvO2m
         keggVgvCBag0MjRS8Z6atlb9iq9Xt0sZCQXynFmp0JvzrkLkS80GzY9AEfkcE1kAmbPn
         UTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975507; x=1791580307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=2diYo0VdUTFb97zwdrtexlCL5rM7zUQR2mjja8icay8Nag701DhJVw1i6wI3sWzYEG
         UzTbMdxF1sbHnyF2GnV+W5rqCReCtSeDYadFONJInF6UmBfjwHc+HLP+wSVNKM2wfbzk
         ayUhQipB/Pfv0frVkyYoimtrOE/wdah/Fq8gII/PFqzbGGMeU8reb+WVzMcekmbsDU5P
         cCzw0ByZGvDYHGSgb4h+l9QCIh5HiWbHmtkk7gX0Vp/6/f+5YomGUTu04K0/cGz9Z6sb
         vOFMpcRW9CqumO0X1kW81SGl/uZw29sKy6xCW9nSa5bkQf4qlRSPY84SwLhGvo/uhSFm
         Vo+A==
X-Forwarded-Encrypted: i=1; AKwUvBy5OK7vyPRpOY8yZ3d8wXoXFRqSbBeGo41ThCWEavDJrInu4qaDByK5Z1KC9jhO1LEfl73h6WrkZJLKjEbljO1/@lists.infradead.org
X-Gm-Message-State: AFq9FYLXWoKW5LsWgHGF2LnRzbnsNL4YveKjFDIw4ELW/b+nW3+lqbG9
	IrkObF7hgvfD+qp6vH2T3v2574FuHfOEO/UeMCC0j2JW/H9rfuCgScCtmsFklRmWew==
X-Gm-Gg: AYBFou0uunqET7dbgglKX6QHNUSamgAhQbb6HTNnQqdwqnSaaI7uI/qb/fglTO/f5b+
	vY9itocoIPXghpwKJPv6ysBsImZhOOZvEVMS8ixD7NC+CaolKbU32ex9o9KV/06SI5BWPvnblzh
	drVnslH0a4rjDecc6dsQIAMBQOfLSPtKIsZcQQlp5GkCrOS0M2CZSuAKmKzdE0lNbUwbpelUTUK
	DVg1007MQPQNlwM6I99aUASxc+2z5jNybNHXGhAPbjJK3bedt+bUsOSNbwv/xjdVOfZZt9hGBZK
	ANjwunLzu3AepW2b90H7xLX8IoeiB1KMjsF8+dUcuWHJ6u3t2Vm5C1ydp3bfoJk2C5CA/cLSZOO
	7ETowhQ8Y+Y/sI/tzb/Ui0wpJ7p3/yH3ZL5v/pXBejzEK67B8Tk7Xe7xZzLZMpI68gyu9nm8csd
	P72CLNE5VczGpFSj662sifRyXBayUIC7izl8N/+RQIYh3aijbojwLVG14f5+danzM5N237XqzDC
	9OJiyowpRQ+gdRtz5uliSsQFJ0HFob8kqGQ
X-Received: by 2002:a17:903:b8c:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2e53091f83bmr1274215ad.2.1790975506423;
        Fri, 02 Oct 2026 14:11:46 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm39218a91.11.2026.10.02.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:45 -0700 (PDT)
Date: Fri, 2 Oct 2026 21:11:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <asAeCz_rmpe5hbsh@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002164748.GD3481470@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_141149_432773_BDCD2850 
X-CRM114-Status: GOOD (  32.88  )
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

On Fri, Oct 02, 2026 at 01:47:48PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:
> 
> > > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > > during resume (the SMMU resumes *before* the EP is made active). The EP
> > > can't use its ATC while suspended, and if it loses power/resets on the
> > > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > > back with an empty ATC.. same assumption the PCI reset path makes today
> > > (pci_dev_reset_iommu_prepare()).
> > 
> > In that case, would the STOP flag be too late? It's only set in
> > the middle of the SMMU suspend. So, an ATC command (via doamin
> > invalidation) might be issued prior to the Point of Commitment,
> > which will be timed out due to the unresponding EP?
> 
> How can you ever fix that?

The unfortunate reality is that this gap exists in the kernel even
today.. upstream SMMUv3 has no RPM, so it's always on, while the EPs can
runtime suspend independently. So an ATC_INV can already be issued to
an EP that has suspended. I'd argue RPM improves this slightly, since
once the STOP flag is set everything is elided, so the window closes at
SMMU suspend instead of never.

> 
> How does power management really work, is it expected that the end
> device is already quieted by its driver?
> 

Yes, power management would topo-sort all dependencies and invoke
suspend callbacks accordingly, i.e. in our case the suspend callbacks of
all SMMU clients would be called before the SMMU's suspend callback.

> Could the first step in power management install a blocked STE? Then
> we don't have to worry about ATC desync and that automatically stops
> generating new ATC invalidations if we go and detact the domains too
> 

Partially.. at SMMU suspend we set GBPA to abort and clear SMMUEN, so
nothing gets through while the SMMU is off. But that's global and only
happens after all EPs are down, it doesn't stop ATC_INVs in the window
Nicolin pointed out.

One way to ensure the ATC state is relying on the PCIe spec to lose ATC
content during D0 entry from D3cold, or D3hot with No_Soft_Reset=0). 

Another way to enforce this, is to *somehow* ask the endpoint drivers
disable ATS during *their* suspend, i.e. in the EP's driver's suspend
they could call pci_disable_ats or a better suited helper from pci core
and the in the pm_resume / rpm_resume they could call it's equivalent 
pci_enable_ats, counterpart ensuring a clean ATS state. Or maybe the 
pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
suspend/resume?

I could mention this explicitly in some comments or dev_warn if any of
the masters have ATS state as ON during suspend?

LMK what you guys think of that?

> Maybe I'm wondering if power management should involve the core code
> so it detaches all the domains from the device, setups up blocking and
> then the iommu itself could power ofF?

I'm slightly against the blocking domain attach because it's a
reasonable ask for the client drivers to be able to dma_map / unmap when
they're suspended, given that most of the modern IOMMU state is
in-memory and the only HW state is some sort of TLB/ATC maintenance. We
can map/unmap when the IOMMU is off and just ensure a clean cache state.

Drivers often want to pre-map everything, power ON just to run their
workload, power off and then unmap. 

That said, I agree it would be nice to have the core code handle power
management, which can be one of the next steps. (it would be complicated
to see how or what each IOMMU might have to handle for power mangement
in a generic way). 

> Jason

Thanks,
Praan

