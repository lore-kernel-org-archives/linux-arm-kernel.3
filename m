Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B231C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+s7LRa+xfn1TaMGIJNFktf1+ZXT37mg0JkHIAIfYYQ=; b=Xhg+GbgK2CicfvCwFXOg5Uh3ba
	GzS3iFkJ/u68R+Btjea+/KoK53gokUMBTn2LuaoKCbt/qBiENrmQtECBZqlawyFbvY05T3w4uMIz6
	0PclhHVtZ9oFX6dSkm/KLyqtG/UwN4rFQm5CU2pBM8QDqyeTnIsTF4PR/9hFuiNnK0G27sdLSTQPN
	sTdDmRx627g0FMCZgCy4hAomB/OWs3buqX6mlA7xlt7lNii7MPZF21qp4Oeq+tcrp4iODR0kIHlJo
	gsVKij7t4cVX7WqxxXjh89O6I+1V4b1aNAcoQamkPVniYbv1YE/SiDxomfB/oXB4zSi1ZC84Nt3zC
	tUJMHgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Cz-00000007Uq2-2vn1;
	Wed, 29 Jul 2026 10:08:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Cx-00000007UpC-04tL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:08:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69fec8b4638so10922a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785319693; x=1785924493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+s7LRa+xfn1TaMGIJNFktf1+ZXT37mg0JkHIAIfYYQ=;
        b=scWSnjcmOFd3dtvuhqCcT1lrTtsXgP1RUg4j0AHaWtrRx/Stbn5HePriCly1icgRRS
         UTQ3fLzYTGEAvhvvB0wzGiuOkZd7Ajqvv880CGAVy8dTwUK0rjb46QmXVswuSE+XY0nd
         IRjlBfrXojZe9pj8fCed8aYS1TW0AvXbcd2kZvZP4cck0N4MzGfuOiZyEg7fcEsVfX70
         zcw+Vrdw+omGe+sF5imKMDlCd2viCP1mnVOgTCODhLTl26RQ/z4oCKPUOkEpTOdOSDVp
         jTi8MeJRDQyzp9ha3eQsR849H/IrvWAfOLgJV+1ncC3I3iD1a5FZSkeGzMHKSAmK+LSM
         0zJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785319693; x=1785924493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+s7LRa+xfn1TaMGIJNFktf1+ZXT37mg0JkHIAIfYYQ=;
        b=LB09yeFnNpjiD3RpOfVswXIdGDd26pzvUWUPZNYH2kBDSwApp1zGvbJ3z8ivTGqdzK
         JnFQDJSOZQNcKifG6XmSMRqLUZfueB1nBzlUFQgUQGojF0bsd0+qIaLpvXPGpfeYSgl5
         YhK9eqoFz/J5eEHorWDuR3Vp/JK3vQGVRPMyqVlbULCbd6FZ2phtx5BNKL8szJSItFuC
         ZwzyiTirgT618ii47MlZgaLKGUGrkgMGUcD6qdKZ5p2wlEFxs8MfKRqT1lQRv156f7iE
         wEpuDPfelc5HYCNhwOeMFJadHBGI9ExM81q2gIhL7G5//gTIbPz54gAAMojl9wrsE0vG
         +euQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsZBwDZXg/cKhk1Zmr7LFyqwuDUm1XOghlLfzDhlItD13thBXvt/LJI9Q49CVpf/h9pNOq16wDa/GE35nYfBIP@lists.infradead.org
X-Gm-Message-State: AOJu0YzXyjeY/2X4MfEjvw69lplweWjKC9C0Eu4CZAwLPx10brYyehsG
	57Y+hrragcinkWaxMEb9EK5/4QJjbsUbVQFlmGHie/esewsSsmJASdNg1G8f8B2BTQ==
X-Gm-Gg: AR+sD11ieWH+xa/sVWgD5gb4oLxzc62njS6V9+y3+xMU/dfk/XwWMuA2vAjqZUq6bT+
	uUk9FxVmlhhjdQXe9jaAK090Mzwlx2s1FaIX8hYyqNEPlUp6jH2NX5QdoRIeZ5kc887KZ1+Uc+l
	2PH66jr1ozPcjdE8CcvTKUaNeV2RzrAmkQmjgVcRzjo5qXbyn+EsCJ8U3OCaSmxdwLFtvHw5J5J
	CAa9QiQ9RDYugmkR0smROTkaVaHWrrmCV4G8WBoRE172IJ0v9/UpWSGn0jF9vCyRRoGfL8/4XXK
	Fn5mWWosmZG1p3YzTIC3IDm+xVKOz2TbQjplwHFMMfjYbiISlw3AAtOivbwcPINIviXI6Bb6QTb
	qIxh10lYVyAugOBgrSJ/p9VkPdJpRS2KM74xovWNcwU0ZvQF/Exdcq5kkz+V7SZAiyxGGDHZqTq
	2f54w+AzHLOHW034iwUqWWpFKj8Tlxf/53moJHBnG3zcS4ZK1r/r8ofxgWQnNWaD39vze8HpY9u
	KT7aeUpxXdjx2cjPdhBuJWd8UL08Q==
X-Received: by 2002:a05:6402:4244:10b0:69c:83f3:4831 with SMTP id 4fb4d7f45d1cf-6a063f622a5mr16396a12.7.1785319692673;
        Wed, 29 Jul 2026 03:08:12 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4dda2sm89863166b.36.2026.07.29.03.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:08:11 -0700 (PDT)
Date: Wed, 29 Jul 2026 10:08:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <amnRB98ZZIysHuM3@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
 <ami_mpd_1pF4Tmdu@google.com>
 <yq5a5x1ygo7z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5x1ygo7z.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030815_099730_74D363B8 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Jul 29, 2026 at 02:35:36PM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> > On Fri, Jul 17, 2026 at 11:34:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> >> reference and update the direct callers accordingly.
> >> 
> >> This is a preparatory change for a follow-up patch which updates the
> >> attributes based on the selected swiotlb pool. Keeping the signature change
> >> separate makes the follow-up patch easier to review.
> >> 
> >
> > I do not understand the point of this, why would
> > swiotlb_tbl_map_single() force attrs over the caller which should
> > already know the context (whether DMA is shared or not) which case
> > would this be useful to force from the SWIOTLB code?
> >
> 
> The mapping request was for private memory, but the device could not use
> it because the dma_capable() (force_dma_unencrypted() == true) check
> failed. As a result, dma_direct_map_phys() allocated a swiotlb bounce
> buffer, which is shared. Since the DMA now targets the shared bounce
> buffer rather than the original private memory, the attributes must be
> updated to reflect the new shared mapping.
> 
> dma_addr = phys_to_dma(dev, phys);
> if (unlikely(!dma_capable(dev, dma_addr, size, true)))
> 	if (is_swiotlb_active(dev))
> 		return swiotlb_map(dev, phys, size, dir, attrs);
> 
> 

But it does not make sense to me to have it in such a low level
function, and it shouldn't change the attrs that was passed.

dma_direct_map_phys() is the right place to do this it should set
the correct attrs before calling swiotlb_map().

Thanks,
Mostafa

> -aneesh

