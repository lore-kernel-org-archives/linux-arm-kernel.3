Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB08CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W3ZOFfDhqX8vh6C4yIuWTuxJv6mmoplDTMsMIIiSDs=; b=L5vP0mzUVDq9XWMKpS6fcddAm7
	b3JniDm2ZoUQuuTnAuzg3ZCXzTv3U5Vc23wjc6Ncz3lBkHO79HO/GGkLaaOF1wgHIfN3joknAJD+E
	V4irTveNo+KT38RrHLGpu0xwRNaVBCyVXbwL1gW4PGRaTqQF7/hpjRll+XYd6pFgFHbbhkOCReHO3
	utIBykVceLzLxCqb6N9Gyr5k4J9bp4zUfMTi1srsc+E8716T/avgHQYoFUpFo5McH5Ok27P3IqsR3
	B78JAR3TVxgvQQJVJftxynoy+27jqlORzpSLQM0jtQtzD3rsNe/wWodMy4Xw5/KnqFkn/GYayoZ/Z
	OPdkKGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInBl-000000077qm-1ejN;
	Fri, 01 May 2026 12:41:49 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInBi-000000077pu-0htM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:41:47 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50fb4a7d704so14194971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777639305; x=1778244105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2W3ZOFfDhqX8vh6C4yIuWTuxJv6mmoplDTMsMIIiSDs=;
        b=Se07q/QMcia1cDEy9vFg6fhhUVz3xT3LdaFmhjncSmnZv1eeQirxKn0CQWepvsJqj0
         3jCc5T1cy9o+n8URpmJ58XN46caAOa3inrFwzouOXCm/nIBHF3OqgO8ZVhsW9aRdFuci
         4BWqTXD2B48HYKkZfH1mWWUlWMrcbLUWv+029gyacCvGon2NiRaOkskyzOLtLypKXc6m
         HGYFNRJbV0siTY4SaBJp9hrbrGH0W+TQfX4Yev5I3iNrVlsxDQ5KQRmcUKTNBorIiABX
         JzCWq40sgtHBQOD3V9jbpB1LSRTxJ79nX+SHzZLOFvtsLYI0wgBiokny4rpx87IeWHuD
         j5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777639305; x=1778244105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2W3ZOFfDhqX8vh6C4yIuWTuxJv6mmoplDTMsMIIiSDs=;
        b=M5Jopq8jSv7mNkkGBSqS2Uofpq7qcxPJiO0pK/3DpK2eICn2TjNdSXdA0UEKDY2r9M
         oNliVL39Ojg4MItPo3ft62lE5lYO1VTKtpooARhpVduynKSClEKxu+MSxjpBC3430wt8
         ZZZNLyOSPgwJn3LyrKVHGtUW1rAVPR9Bd78A3/irzP9YSslQLQgRpI7G3oig+0QTyoJx
         DO+gvGh6/ch07IWHTu+Vvgr0tXcXVN7aOvoANlTq/XxfobMgCUAf06+LC/deSctY63NN
         UUIc4OCRRxIGbK/F/4sI8poZeG4g4aiqc71G5OOZy3GjS2XQ2FYlRI86MK74gVJUpAog
         YhGw==
X-Gm-Message-State: AOJu0YyDLDHFpgyX3V4ZKjaNoBmugW/LTvU5SaqGYe1jLhNDfwsz0/Ml
	mBmb62i7cBsY3qRO1Y2Al+y2NuRLA8OLY1B8DW3Rw0JVIcvHrbswxbDZVZuRpLWiTMETLdPc46+
	EwZ1F0VY=
X-Gm-Gg: AeBDieuIMMOCrDPaGZoamLGCbQ1XeXEQ9B/nSIrB8w4I3EMGlDa8kGC6zGOxf9jWLJu
	9Ji7oOpL5oOk2hrsUYOLfbriLxKIk5aa9hiekxZstYrO5vBkn7lYCeHpAga7+UUjfvQMUkt8gqE
	Hr++iQ38yp+yA6SW5sF+KuAfBd7UyPZAShZQ2zkVjE5LkYr+ICfqWnWtVWR80kOFgribl5aXpOO
	VCAJpBytuX0xoakMH+SZ84Wdq0XoSekC6HXNNIPN79CaPx0My+M6Gh/NuBwT58FtreoNVP4Seld
	e5a4j0BzNTOjA/42jzxFSK0NDJGjnev351gDcnIAKfNw9Xd45O1SV8sjZzPUK+b2/g4Bff6kJ+Q
	kOpGC7bTDth8L0Bh6dm7pdqan6sFlVGLfjX6hxvWlTxZBvR5hYwO8uCXnYAnQR24nvkFl06OUWK
	z6sPMP86CvZxx8Sxkm9XZziU0UAXDGlNSMnTIBodQzqk71tq5R16lfIq+OPnRk4krt3B9lI7BSm
	Ef8YDQVpOAhIqYQ
X-Received: by 2002:ac8:7f84:0:b0:510:1b61:d0e4 with SMTP id d75a77b69052e-5103e8fad49mr37362611cf.35.1777639304723;
        Fri, 01 May 2026 05:41:44 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b8174csm14655201cf.25.2026.05.01.05.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:41:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wInBf-000000058bc-2ERN;
	Fri, 01 May 2026 09:41:43 -0300
Date: Fri, 1 May 2026 09:41:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <20260501124143.GB6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_054146_216127_34710605 
X-CRM114-Status: GOOD (  15.89  )
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

On Fri, May 01, 2026 at 11:19:06AM +0000, Mostafa Saleh wrote:
> Range TLB invalidation has a very specific algorithm. Instead of
> re-writing it for the hypervisor, move it to a function that can
> be re-used.

I think this is too narrow.

You should start at __arm_smmu_domain_inv_range() and shove all of
that callchain into a new file "arm-smmuv3-tlbi.c" which you can then
double compile for pkvm.

pkvm would have to present the tlbi description and the invs array
which shouldn't be hard for it. Then it will enjoy all the same
hypervisor optimizations we are working on for the normal driver.

I am about to send a patch series here for iommupt that significantly
alters this. I think it will help your pkvm effort as the invalidation
entry point becomes significantly decoupled from the
iommu subsystem:

static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
				     struct arm_smmu_invs *invs)

struct arm_smmu_tlbi {
	struct arm_smmu_domain *smmu_domain; // Can be removed 
	unsigned long start;
	unsigned long last;
	u8 leaf_levels_bitmap;
	u8 table_levels_bitmap;
};

Which pkvm should have no trouble invoking. It has to build an invs,
but I guess that is pretty simple and done once at boot for pkvm?

Once done all the fiddly bits about building the commands would be
shared. There is really no reason this should differ anyhow.

https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/

cover-letter: Organize SMMUv3 the invalidation flow so iommupt can use it

Jason

