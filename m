Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DD4CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtzgOVlx3+XiZk8bPWEWW2C41hmZeWg0/ZKf/2wFHh8=; b=hiBonslxyp1WQ+asa/dNGOO29h
	OFvSyo70ptNgiaMYdS1mYKo+Jl5l2OpuMb6GfM4d6Rd94byydyme2Y6VKhzfNqi3OSohgTNMv+yoY
	ItoVKqQwceSqnLEAyPMVZBXrWnmVe1e1qmGpdKbp13dKyyWvS+pF8q6BTKLffN5anvPq5v213RKGm
	ZIRYmWoxvJIR6lWk8Iv8I8KRMYrl7x1YyvoDCLa8B7lRu43P61gQp1Oe7E7IUoqbjDS5+XWMmF9EN
	Wy36dEpGATAAOnA6rUwt1aNmvMsr3Jaod9Zu4j1HY7WzIpJ6OvaLMRU3h3o19g+Bzx+ThNZNIDpKK
	OKdXf3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFeh-00000005qHo-0JcH;
	Fri, 08 May 2026 07:29:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFee-00000005qHB-2DyD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:29:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so54125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778225387; x=1778830187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gtzgOVlx3+XiZk8bPWEWW2C41hmZeWg0/ZKf/2wFHh8=;
        b=pX358BGLsKce6HaWq/6UCF0gXm+lh1EBRKLAc3squ+elR7iQTrxYezVZImawIasZEa
         Yvv4eaaBOEvyg7FOB/S4qa7kxweOGc3IZZ6yJnF4vBW1JtRuJqddxsTjLihSnpWts18B
         mMDv16IZs0aNBHSqum65qnhVJqy/EPS7iSmgurb6tRSU9+joWP4NtMRw6TSdMkAUZddt
         ymYSmU9LZ9K3ptgehP2oAeex0L9SKg4zbVVQUuuSFgRoX9WsCmYkd74D4itLZT7WwTQP
         p7t1SIFrOH5GO/CK4+72AA0SEAwVHj31TsZ8ioH9tWlxMbIybcIfk3nIGSjqLSGnZbY3
         51aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225387; x=1778830187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtzgOVlx3+XiZk8bPWEWW2C41hmZeWg0/ZKf/2wFHh8=;
        b=n6LypIOPBIqtF9Ax9PRNlNEktcKF4ShtZ6zsRSB0G63uA0DO0Y2GbnxXotuQxf6LPn
         oJeXft53lv5JEHinSwzPbGsJ4sveHDLguXVnGJLyWsfMJ0wtAdYB+g2hk8MSZ3lvgrfs
         c3M3h2OAXghiTgGP7x5Grz7viiXl5BYjalZfjkkPdC/P40L++i8DgNIPCe6occNLAu2o
         Oh/g+8odr/rIMI/e14fhld0GE6AhNh0UNeiWTrBVIjEIdFB16lCF5VmkBKziLw0hsV/v
         FoLQFj4JIOeCTuLNXijmKCdJ0mpj8FnTavfjRtGefVohFIUuNloH1ow8pt4i8M1xNMf9
         VDOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iVFV6mhk6GZULciEmQ08SzHCaYgkQLLO9ObCGTsoo7S7dgKHCBvpPKg76/q43wgO5VbaIns4+YS0+33d6v1T4@lists.infradead.org
X-Gm-Message-State: AOJu0YzEg6dkEmUYXeUlfNBO6uk1fSsMSqAqqLrmmUBEGDaTPWRhNJG4
	4wVwz5KDLWOyldX+3Z5541BqNP565Z3T9URJfIP47VTfJwTmQo0kFFFo2GnJOzlzTw==
X-Gm-Gg: Acq92OHpoGJCA2uN2/QLf18BFL7+eUV8pwm1r7tGMKkSeyu9uDJq99KLsxc1kO2vR7k
	2FFeeCv3i9Zm2X8AUEBrhuNPn8Xa+PIkMYXg9VANcqmQNV9yvappvfRrZn/+zMnyTbE6BB+PZlV
	qAYjARIplnSswlRyuyNR5ed6jyF4DB7uNoK2gsjX7b8H+jLYBFLggCHBNxhCAHu/rXEihNmLLbV
	CAq/vZU48yBWPuew9WVM/40aDeZcwAc4ryV82BBVaJZR0HiRcKQTkA7aE/JNQiQya3eNslJ7szL
	vPcQIoKTtaJSUE15Eun9Dp1SB55hWYqvUcnTtTktu+JBhB/TEwciiA+PU9OaeHUblE/qiFLaLBp
	mWMeOQcVxgSVo+/m2wmxgfaH2XY4anYo+far3vyu8z79/guJ7tIPz3/S27Pq9ioVdluFKQe/4Ij
	uq3C3Yf4GmYdGlEzuJuDyQAavRZqHLbNvWisYM5SeuOIFlBZQUr9tVh7Ohvt/mvoAzGAXR
X-Received: by 2002:a17:903:3c6d:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2bae9a8bf41mr2914125ad.8.1778225386989;
        Fri, 08 May 2026 00:29:46 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e9fd64sm10355055ad.69.2026.05.08.00.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:29:46 -0700 (PDT)
Date: Fri, 8 May 2026 07:29:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <af2Q47MaAECnRzvY@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_002948_634174_191E731B 
X-CRM114-Status: GOOD (  12.29  )
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

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
> Like STE/CD, add a wrapper struct around the u64 array to represent the
> already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
> because the command submission path will have the swap to le64.
> 
> This makes the API clearer when a u64 is referring to a formatted
> command and makes the following changes easier to follow.
> 
> Move the command constants out of the struct and into an enum alongside
> the rest of the constants defining the HW format so the entire HW format
> is self contained and independent of struct arm_smmu_cmdq_ent.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

