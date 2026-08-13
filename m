Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42754C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIiI9SltfPrXcp9GxH8c00S+yO98PCAJKDJI9QVodgA=; b=MMRcYJDXYul6bRbKkaVxVntkZ2
	BC6BCDj+PX6KV8jaaVBynES8tTXPOZwKsZPBBQL/vwt/FDxDIpX38SHW+RdVJ5n1WkBmNUuyaKbrD
	R1sGY3poR6zmm9ceA8Or48lB1Hkm2OLrZQiKqvbBH7NtrNcOU1Hid5A7+9R5Pa7U7/ooAhCKoARv+
	T5DE2tOZXGW1GvUrtlCbavj3yfl4K5xPmw8r0W966Kn2s4tC69uyAQVYWcm3C8LTYOKxO3GJpjmka
	JV9bq1JGGjdKfNo7hhScI58i1Kh4MKLd5Si99sHvOGVUYFfQs4k5nQmkxalC150elIuWb8nmMz6Og
	NBm6L+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX6L-00000000vsw-02gO;
	Thu, 13 Aug 2026 15:12:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX6I-00000000vsM-02dn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:12:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495509b08ebso48155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786633928; x=1787238728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIiI9SltfPrXcp9GxH8c00S+yO98PCAJKDJI9QVodgA=;
        b=DPAo7na9qkmMKBPEJXcKvM03XIDAr4gpcJ1zsgh+O6JQtfwKzT392jkJmlJl9ZbO2h
         if6nTqfEc9nKrdBX9eeQzQ6WKnZFjhV5zjEm7+FrdJjn6gK0drfE9MiZ9/gSh3I0PhGK
         ukKE598HebJZOx2decz0S76saxZAEWK5WVq7Aj5RIaEe1QDO8zs9+d4t1hHmh3I+R6Py
         HDZaqKxllsGOUDeU/+GTZOKtyFLaixL0tmVLDaRA9T5Crl7E1IK1Ib8CcwIsxNquye5u
         5VxvwsJNAzglecWLGrJyAh3FhJetpK68ZVqhYq+BDUKlVFdp8Od1gtsuj1DF6VHV2gPW
         Lmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633928; x=1787238728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIiI9SltfPrXcp9GxH8c00S+yO98PCAJKDJI9QVodgA=;
        b=FKNg9sWFux8oyDuP+bCjCXT3aQ/DrCudRHrXm+SAGNasoWc9fWjyBKB7xCl8oW9687
         MgjL0bUJHyF9ZxdH1e7IzSSe2hZooKGADFS/7RAC/XYu6S+3vG+P0sh6x3I/Tpx0oaC6
         9QaE4jqM1GnFiD3yjfXN1fJ1W1SbT9BCfeYqINpjCT2c45u71siSv/KmTzgwuMlqqmHh
         3qA6MR2k2R+AjAg+IcJZymOK/93YdZocy91n1Lmv/IPL5zr9zqQnfrt3pNqsxCJdKrgV
         iEMJZg8nnJgQjvRM6u5juBFtpaHlZYn2/xdkYFnsoTM4ovXbPLG/iXCXRELhSuGYOqLm
         Ptdw==
X-Forwarded-Encrypted: i=1; AHgh+RotNqVsbi+7+uHXzkVJoN4uKRiZIN1wcaXbf2oHwmIKH8MOdovpEWVMyB1tk8Ma4Ysl7hJyoyGjBGFbF+p73/Cl@lists.infradead.org
X-Gm-Message-State: AOJu0YyU/GWLnDPsyv4SlY7PNhpYMQZxIfmMLumU/MHNyv7bgTQ37iGU
	uHubqw6AIDW8KNavyLA++++/iDZTe4vy5LuoXSl19ueHHWMOF+eEtlTdXCbKCPl9GxW8SoxvE7P
	LWLr4lA==
X-Gm-Gg: AR+sD13qwIZLOt2XeKlgeL53JxSM0HmHAyz7AxcfAPOJaMMjEBCXRy5JRv0PqZOIo4H
	zfFpZH/aHAv5oDfefKO5rPpKIlCc/jaz4NC0wBX3lcfvtcTfpU/ftztjI060/AfxhsYMxuOesfC
	Fw2j0h5OqBy1+9P6UTIo+LjgDUlMXQm6Bbdj1mNA7Wtl6JUYZ9iWB0XMnCLaFYlnWngF82UpN4r
	xn/Rp+qMxKiZxAvEhW8wIyK+tQIiKlIoD6rWxEmfr0lFInCt/M3GPcX06cEhTyioQfWNlX3ytgt
	6QDq7ZIKar6DFWMzt+xp3LuqdTe2DN1iQ/Hs+DHop4Wk2QGVVpqRrA0/7zQbACJmcbeFshkkW8A
	8vhV/gAMVwxIIPP5c+3N2dfHtaenKJbkVdUGv3FYo384Rr11tFpRDx+6e47MG9DZHewfPKanqmB
	YZnI5BuVoDGqJAJmJMVs581ZG1nnt1fEyIfS0OyDxUtGboRiq2iZJSqS50gzEbC+0BJpJtygw7b
	WTCiT27adMgypbZ/My6NZ2U+0Od0g==
X-Received: by 2002:a05:600c:6094:b0:499:83b9:4e4d with SMTP id 5b1f17b1804b1-49983b95116mr892995e9.0.1786633927802;
        Thu, 13 Aug 2026 08:12:07 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2cd7ecsm7938f8f.36.2026.08.13.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:12:06 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:12:03 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <an3ew9xbnLe1dr5g@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzm5BoV0rToJ7ij@google.com>
 <20260708001058.GA422027@nvidia.com>
 <an3MSKEj7VhT4WkP@google.com>
 <20260813141320.GF730363@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813141320.GF730363@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_081210_098806_33EC0A5C 
X-CRM114-Status: GOOD (  33.78  )
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

On Thu, Aug 13, 2026 at 11:13:20AM -0300, Jason Gunthorpe wrote:
> 
> > Sorry I lost track of this thread and I just saw v4.
> > 
> > In the mobile space, I haven't seen an SMMUv3 that does not support
> > RIL.
> 
> Oh? That's very surprising, AFAIK none of our embedded chips support it
> yet.. Even the server chips are only just getting it. Are you sure?

Yes, SMMUv3 is getting more and more common in moblie HW (opposed to
custom SoC IOMMUs). Devices that I have seen in the market in the
last couple of years have RIL. For example Pixel-10 which is currently
getting upstreamed. Also, I have a mini desktop with QCOM X1 which
have RIL.

The only SMMUv3 I have seen without RIL, is an old morello board I
have.

> 
> I gather it wasn't even available in ARM IP until recently ish?
> 
> > However, I have seen workloads that are really sensitive to translation
> > latency (display, camera...). And I'd be concerned about those
> > regressing.
> 
> Yes, those exist, but again, they are already facing these problems if
> running without RIL.

Yes, but my point is that those typically support RIL and that change
regresses them.

> 
> And, for the common case of putting something into a carve out region
> it is not so likely even an expanded RIL will intersect with a
> reserved IOVA that has a high alignment.

Not necessarily, those devices can run with a small IOVA space to
reduce the page table walk length making IOVAs quite close.

> 
> At least the things we have built are calibrated to handle a TLB
> reload occasionally. The isochronous TLB's are not even sized to be
> never-miss for all cases because things like 4k media require such a
> large amount of IOVA the area cost is too high.
> 
> While others can do something else you are reaching into a pretty
> narrow condition to hit a problem:
>  - HW that must have a never-miss TLB to work

I am not saying that, but we shouldn't over invalidate TLBs either
when it is easy to avoid that.

>  - HW that doesn't have a carve out, or has a badly aligned carve out

I do not think a carveout will help. But it's a very strong constraint
to enforce carveout on all devices specially media which are quite
complex and composite by nature.

>  - A SMMU that has RIL (non RIL is already worse)

This regression only impacts RIL, otherwise it does not matter.

>  - A non-isochronos workload that regularly exceeds the RIL/single
>    expansion thresholds
>  - Unlucky IOVA allocation that places isochronous near other
>    workloads in the IOVA space.
> 

It is not just luck, it depends on the IOVA space and access patterns
of the device.

> > There is a clear trade-off here as you mentioned with TLBI latency,
> > would it be make sense to make that behviour configurable from a
> > module param?
> 
> I think it makes sense for a driver to indicate to the core code that
> it needs isochronous and we can do more global things like change how
> single works as well. Having an isochronous flag on the domain, for
> example, would be a good overall direction.

But according to what? It makes sense to optimize server chips,
but that should not cause over-invalidation regressions on other
hardware.

> 
> I'm inclined to leave this as is and let someone come with a specific
> problematic HW, rather that try to badly guess without much
> information if it might popssibly be a problem.
> 

It's not really a guess, I mentioned some examples above, that I
have seen problems of translation latencies on them.

And why not the other way around:
- Which uses cases can't handle few RIL commands?
- Why those drivers does not unmap memory with a granule/IOVA fitting
  to RIL?
- Why those systems does not use FQ domains in the first place?

Thanks,
Mostafa

> Then we will know the HW and can mark the driver as I suggest above.
> 
> Jason

