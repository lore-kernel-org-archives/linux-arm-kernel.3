Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBA2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uecw5GuJ6xKMR/52t0KK0j/pRrv42h6jWvdNot4nYIc=; b=wBPo8DhRbISNVbvHoW+KbOuRUT
	wjOqFulS5G4hilYiOKr8ufxeBZfgRIPd5QsKuexdIp+eNaeBGMh4sv3dZYsUJArIegWBUW0KAChMz
	oWZR/YlFpv1cptbW6h6fpOarM8JEYQNW+YurUh4RiSk0jnawb7OE2uwexT4pN7Zw6aGsj5FokIxQI
	fcIJWABdYOQYxwb7TqpnpuRHiV3ypyCP0WEAUQyfz2R6+0vh2J6afUdBXJcD5XRhs353IErEaFh84
	ov2aRqvK7sQfiO7oOTJSN9wBgh3PaV4X4fMJT1j7rEONJx0e2TjIYaJ3rw6pRoTmGngXvmcFe+aMa
	xUai07KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRx6-00000000gEL-3kN9;
	Fri, 07 Nov 2025 19:16:52 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRx3-00000000gBN-0s7i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 19:16:51 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-87bb66dd224so12376416d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762543008; x=1763147808; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uecw5GuJ6xKMR/52t0KK0j/pRrv42h6jWvdNot4nYIc=;
        b=Uk3Lk10WB7mbTnM3YWfPzCEV6QoRtAj2P1trOBg36Lm3zHhEqeMl380d46U9c7rooc
         g1zgLJdcYyuRxtOgTBXossWt/Dt9JN34hrrGTcV3qSLVmgRAQLPYbBv7RCquOY49Jw7u
         xF9nWIXUJ15l6Lxm4oudT5El7IeycFby0guVyHiGIWUCQqrKURGZzreu8qFGJ8JoOYM4
         dKQVeoPr/L/V5oolm0cMHQMh66a/LCY8lrpb+vjCz1Ex6kPKYqjv4ar7Xdq8iGyFwv6f
         bs8YZmAafRJZZ52XsitEnkHcttKm8EuB6OC1mIoHTk1cWIUwP/emX7qsLVoE+8aExqA5
         1pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762543008; x=1763147808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uecw5GuJ6xKMR/52t0KK0j/pRrv42h6jWvdNot4nYIc=;
        b=Mj4CDJ6xfaTDpWTLfD497zaTQUcNdkkViYV9kbA5WgeemeiEbiQyd8K4OOJWEW7COb
         gKSR8QunFsCoYbpb7twRxo1MGqKO0Meyhse8lCrT8WdJOblnwA26eGGQZ0Oe/b3W45O7
         ztRIOhssbgLUzM0Md0l9A37Mj3n/cpUhrwTInXoRMK5dy2WzVpC9JXqgLfFCBnuXplwH
         ENaj1YnbFk4cpaa/5WYXbsjeL1AMR+7H3lp6o11U045Gp3yJSmsbJuccrvlKrhX2fajD
         4GTgC5RS2exFkqsjVn6e6iEhPls47vQs/tlk2xNwLlVO5ssuBuvIhTIsBApWXyNe9a51
         jhHA==
X-Forwarded-Encrypted: i=1; AJvYcCWHNDwRYmTnNucNRFor9N+NrKyPrzDdZbQrCh/gfNFZLpvyQuaPlsBYDgQOnyKbkei4SXrbSg3r/cpK0fx/kdmq@lists.infradead.org
X-Gm-Message-State: AOJu0YzylkZjBx7bTaiRwGHQUF+dVIy4g/9v18HmEbYAtYepZOQI0lGZ
	ZqIzpeb+hfZmG/8WJB6t2QC68szQUXBtz26RlVHkRK/r9taPWPK/noZS1fs9BBxiz38=
X-Gm-Gg: ASbGnctE1kRTgoTLAxByK5NKA+Lkt6s6vhE/LCKD6qIBHSndtL8cugWeUH+/eq1by4l
	YygvYTuDJudwiPjXt4Y6AF7///DQ/E6NYGx5iDOtmhhwPNGnBYiMPCJGe/dUry2kbSM85rBt7HG
	v3wsep3s7FGT6h31WCJRoWl+uE0n0sMN6FfZR6s+Sye+gshcguyJ08QcM47cESu+cdDXqiJzXR5
	SOrFtvh+byJvHXD3wssTaB6q4tmQwAA4GwsoXCSUkbOcBE6kBgjmaQmu152I8jELoJ9KY3jQZqV
	DeiHRm0K8IlVBQzSxspyesNN/swTUt7fdvrAkKLsEmZQgvqHnKBGIMbAVHECep5XYXHtvqQb6IF
	k7+ZwIxpxpLqnstYRRUvs/PxkKE7TUgrKLn/6AWAx8e65pC7LzV/12Sh+0H+YaoocDZPZxH0gp3
	YWZbCaNcaNPOU+LS3YMWgPueKBEZmzsFRsEGwPrOZ6coXU+g==
X-Google-Smtp-Source: AGHT+IFuKO535u2kiOv/DIfBewHOhom5AEVBkvPZuA5a9xJpNKB2nCPzp+ZUXTed1YvzsoYZhtcP/A==
X-Received: by 2002:ad4:5c66:0:b0:880:224e:aab1 with SMTP id 6a1803df08f44-8823871af07mr2487486d6.66.1762543007674;
        Fri, 07 Nov 2025 11:16:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8823896a8d9sm593576d6.17.2025.11.07.11.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vHRx0-00000008LqN-30pE;
	Fri, 07 Nov 2025 15:16:46 -0400
Date: Fri, 7 Nov 2025 15:16:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ryan Huang <tzukui@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Mentz <danielmentz@google.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix error check in
 arm_smmu_alloc_cd_tables
Message-ID: <20251107191646.GB1859178@ziepe.ca>
References: <20251107190917.2858684-1-tzukui@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107190917.2858684-1-tzukui@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_111649_375633_D631F2DB 
X-CRM114-Status: GOOD (  14.46  )
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

On Fri, Nov 07, 2025 at 11:09:17AM -0800, Ryan Huang wrote:
> In arm_smmu_alloc_cd_tables(), the error check following the
> dma_alloc_coherent() for cd_table->l2.l1tab incorrectly tests
> cd_table->l2.l2ptrs.
> 
> This means an allocation failure for l1tab goes undetected, causing
> the function to return 0 (success) erroneously.
> 
> Correct the check to test cd_table->l2.l1tab.
> 
> Fixes: e3b1be2e73db ("iommu/arm-smmu-v3: Reorganize struct arm_smmu_ctx_desc_cfg")
> Signed-off-by: Daniel Mentz <danielmentz@google.com>
> Signed-off-by: Ryan Huang <tzukui@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

