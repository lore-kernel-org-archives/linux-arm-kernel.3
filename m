Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC7FA1FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/bQL7TanDi+LGxlRj56HG2qI4sxsGUbPbeeZiNiay8=; b=LztB8ie+gEVJB6b8mXAlVkZ8or
	bGTKid2Pqdz/5G07VoWMaZ2S8o/Q57ZH/5o2wxEL9mE2Cc8mZ4MrDXXt17b5hFXTVgWHpUcgxZosi
	M6TpcxUAFAw1/Eq03jsnLlJKymfh557fXKfI+1u8d3278x2FvWlxx4MEnj2LHYO7qdAr+6dAYBIsl
	j4gviHGH3RrEYYKahRDJtpqxpzuet9/1IDCGkFJwAPa37KFLg2+E3S0SvSJ6+T6+dYPye9wajk6Te
	Fp6DMKPM3Vs2CJJaIDZF+VsfuyBL5tlbh1lgElhX/malii3Otfk+mJ/aF/0SSh9Ds9nCRC9KAr9XG
	BrudLTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZkr-0000000AS0N-0Kmv;
	Wed, 22 Apr 2026 15:44:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZkp-0000000ARzr-0YA9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 15:44:44 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b46da8c48eso9965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776872681; x=1777477481; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3/bQL7TanDi+LGxlRj56HG2qI4sxsGUbPbeeZiNiay8=;
        b=ECl7Y+mb4qjW7vaAqy80o9MUv6+offyuOy4IcB1w0b5AwRpZUoxw5Sq0oVIeFAscwZ
         lytk7Mkexp5HHgznhzYU9lD/q+dNAAAe8VfcD+ewLHPIKAyLPta33WVNZao1BS/sGxq8
         OmujGJkNd//wiEvZ0CjklHcToNox7YmtcmsQ7FM9AOjdhDzg8yDUNi4dFEIQZ1Ix93OL
         4C6Yji34SFRsneS+Qqae/E9785pMe2PoGvVfkmLVTp64h436fwZDnwFxhloGHRMptZvS
         Df+4ragIvt+zXP1di/t6K7FKI8nCYg3skPMxXWMcyUE5uYEd61htHsUbWilYnDobn9F8
         McSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872681; x=1777477481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/bQL7TanDi+LGxlRj56HG2qI4sxsGUbPbeeZiNiay8=;
        b=QfnJN3TqyastFnMhCUkZQEPix+k98uj2oz907hUC4Ejg8wV7SG+EGxi7UmzRXTi/2N
         0zXW2c7il/2Rbg0auuVJ0WcdvCHj1D676sTgc1uxeD+vx9jFjnlWd/WB0x7XBDOzFB2x
         Z0JHCeZfA/IamhwQa8k2PbnS6b8/0jLmfj9zgDX9/yd+7Xux/VRwZlgQVz80lzGPc3vJ
         c3FVnASVCSj8fjW/B1D5pDd8ZyL9bvLB6XANkDD1/29PsQKMPNI0sQmzkEDQaGNm+BhK
         K7vJ0mV6mHcDPEBFRE+Si+c2Wqn5KafIpbe5ThwoFZFpMqbkZjz4Q+wTpuP2pWo1Z72g
         qupQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KrdUZzT3HxY/exvNrjbapL2HQKgFjal6e4IQa6zLHcSnCsYQf4y8d94yOTL3WFZjp/1slKl1uHmTO9XhdWc/y@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvx5GZtzgOircYJOA7GZy+2MDDcZDBmcfIDf9bi4f/Ud0rgt28
	pQHJmPqVPXz/3mJv/tF2NTf1VDAKQhWPwtIA5L8q3Kx2PKwZy0wqAFGZEL9NYWV1lA==
X-Gm-Gg: AeBDievlaoswSOVPkvJLU603QM+z+8zyXdEk9Apm/xV0lJcZhSPDkEhSqYKhMZFvHVI
	cP4vy/9zJujFXJPVjBuO57P3qdiSvbvehFYJz34EiQY4lfBr83OJ14tzXIRFQqk0p4sLMj/xinD
	8QU+Pskm+V/aezYefxQIdSRpulR9vl1so04ATmUpsRsapnthjCw6DXScl+OD83XybYuyOQ0/hd0
	56zI7TZynq91fXwvmvo0xtVWyhLEDhRfcHEo4uCtcI46bGObbqwhPxQ5Mn7N1VZJp4Zv8A6kzHw
	VUm2v4/H6hGJN/jO4X877U8xqwkg14Nni4VHtx8OmLB5ULE8Y0m4dyF1a0TWpfKM0QaoiWBXppQ
	QMxzUjVRbgx7GPAC7lgF/BltPbxTKtAmMd5pa/ZLW3HTxJZO9yKcJ/NTFwC8zM0EpupGLSz3qYN
	YlWn0wfMljbRAD3TEb7k9Nk/XCFKf5FqKjFLkDbloLVQVcQ9wukmOkWGk8u2G2lniozRgycV0lT
	+t0jA0=
X-Received: by 2002:a17:903:2f10:b0:2ae:4e8e:954e with SMTP id d9443c01a7336-2b603f3d6demr6173345ad.5.1776872680351;
        Wed, 22 Apr 2026 08:44:40 -0700 (PDT)
Received: from google.com (174.188.87.34.bc.googleusercontent.com. [34.87.188.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b60003ffd7sm152803975ad.80.2026.04.22.08.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:44:39 -0700 (PDT)
Date: Wed, 22 Apr 2026 15:44:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Evangelos Petrongonas <epetron@amazon.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <aejs4So33q0PoghS@google.com>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_084443_180209_421AD9EB 
X-CRM114-Status: GOOD (  32.27  )
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

On Wed, Apr 22, 2026 at 06:44:31AM +0000, Evangelos Petrongonas wrote:
> On Mon, Apr 20, 2026 at 09:40:32AM -0300 Jason Gunthorpe wrote:
> > On Mon, Apr 20, 2026 at 12:32:01PM +0000, Evangelos Petrongonas wrote:
> > > When the hardware advertises both Stage 1 and Stage 2 translation, the
> > > driver prefers Stage 1 for DMA domain allocation and only falls back to
> > > Stage 2 if Stage 1 is not supported.
> > > 
> > > Some configurations may want to force Stage 2 translation even when the
> > > hardware supports Stage 1. 
> > 
> > Why? You really need to explain why for a patch like this.
> > 
> > If there really is some HW issue I think it is more appropriate to get
> > an IORT flag or IDR detection that the HW has a problem.
> 
> It's not a hardware bug there's no IORT or IDR bit that would make sense
> here.
> 
> The motivation is live update of the hypervisor: we want to kexec into a
> new kernel while keeping DMA from passthrough devices flowing, which
> means the SMMU's translation state has to survive the handover. The Live
> Update Orchestrator work [1] and the in-progress  "iommu: Add live
> update state preservation" series [2] are building exactly this plumbing
> on top of KHO; [2]'s cover letter calls out Arm SMMUv3 support as future
> work, and an earlier RFC from Amazon [3] sketched the same idea for
> iommufd.
> 
> For this use case, Stage 2 is materially easier to persist than Stage 1,
> for structural rather than performance reasons: An S2 STE carries the
> whole translation configuration inline. To hand over an S2 domain, the
> pre-kexec kernel only needs to preserve the stream table pages and the
> S2 pgtable pages. An S1 STE points at a Context Descriptor table and as
> a result Persisting S1 therefore requires preserving the CD table pages
> too, and because the CD is keyed by ASID coordinating ASID identity
> across the handover.
> 
> In the long term the plan should be to persist both stages.
> However, until a patch series that properly introduces SMMU support for
> is developed/posted we would like to experiment with S1+S2-capable
> hardware with an easier to implement handover machinery, that relies on
> S2 translations.
> 

Hi Evangelos,

We (Google) currently have a series in the works specifically for
arm-smmu-v3 state preservation. Our plan is to post it in phases (S2
preservation first then the S1 + CD series) once the iommu: liveupdate
persistence series has stabilized.

Since the iommu core liveupdate framework itself is still in flux,
it’s a bit premature to accept/merge this patch before both the series.

Furthermore, it must be noted that even if the iommu liveupdate series
is merged, until the framework is fully integrated with the SMMU driver,
liveupdate shall remain essentially non-functional or 'broken' for
drivers that haven't yet implemented the necessary support hooks.

We’d prefer to wait until the core infrastructure is solid so we can
ensure the SMMUv3 implementation aligns perfectly with the final
requirements of the iommu liveupdate persistence series.

That said, we don't mind posting our arm-smmu-v3 series with S2-only
preservation early as an early RFC if that helps align on the design
and implementation details.

Thanks,
Praan

> [1] https://lwn.net/Articles/1021442/ — Live Update Orchestrator
> [2] https://lore.kernel.org/all/20260203220948.2176157-1-skhawaja@google.com/ —
> [PATCH 00/14] iommu: Add live update state preservation
> [3] https://lore.kernel.org/all/20240916113102.710522-1-jgowans@amazon.com/ — [RFC
> PATCH 00/13] Support iommu(fd) persistence for live update
> 
> > Jason
> 
> Kind Regards,
> Evangelos
> 
> 
> 
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597

