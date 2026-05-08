Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC6CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk+VF2UUzCSCg/RvIE6fW76wSTl5BC3qMVjRSFknw3M=; b=XG9KY0uByUSkbjYGnH/4HnrwxQ
	Vq/3taXygBrgulRqV2Z2bPaA4xJGagDYE6RxhLqoQYMvXXi5UzLkAOVbJAoX3IBSiPv4BnNyeba5h
	jIcUXsgjNCg9D6rH8bW92gH6PHM11+ATiCcWjAJjIbHsDOpB1aEN7K7RqYnHN1XcwLxfYqyWa+Zsa
	xxyliraV3y0T5V8SWxydQWORn+G9n08SM2qDeRlLvITFhA6lnYiWrkR4ckSA8zpGmuwZYyY1RpHc3
	nC2uhpv6lUsd3kCKz5klLVqzbezGF+JNc6rZvlk4K9eCFRq0PJ0DUxbhkIHddhv6EM0hVosetIw+h
	7GAummfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJfO-00000006OLW-30Rr;
	Fri, 08 May 2026 11:46:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJfM-00000006OKa-0a55
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:46:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba180a022dso74485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778240807; x=1778845607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+VF2UUzCSCg/RvIE6fW76wSTl5BC3qMVjRSFknw3M=;
        b=ZMXVmrCmlbYdfsU0jVTAb0q0XTywayv9gIKclqk7dc0GS5YY11cc5b5UN+6+GZ7mbo
         6LdeMGkvXLMRquiK7WULMvqFJJgYCIsdpNWrzfrb1anIrxdQaR97sbAMqubWNEu4Y18O
         vm1PSnCyNXIT9iaDl99SH+C0YG+SafsyuUN+zWdM+dHlC5x+qo3x7/+w798wxXuB1/L8
         IrpeSyjzb7R900VkMK+p7M3MloGH9jxhzjKE2eOcnBMYV3AsIv1DJZNynBURwyRWZ4kL
         xXMwqF4cPoPd0ncKQmklkOg6q2cKwtWWSwfIecS1Hl/sez82Ky82zKYzaUFldeA8hj7G
         JkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240807; x=1778845607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yk+VF2UUzCSCg/RvIE6fW76wSTl5BC3qMVjRSFknw3M=;
        b=nER7NYfanMk4Zk+rkQ366Thca/0/9sUUpJbbc6s0dQiJ0nz2oe8Jt+EJ6rBESuERTQ
         rtHhFJ2xpNWwCHdwck35SIQCDIeJAETbX8vAlTHziRF9o/uMU9uJxI89iCzeFFkcjzQ1
         aymmPYGfBCNy9ieCEvL2u6TiBId2dfbe649e14oq+CEOqq9EFTOL7FrPUcwVgM9dw05b
         +IZDRzKypfE0AjtzJjIcQ1MgfLwJK+F3AT7TXY5sRBVysSCo5LNtGL52s8EEb7uLVNMz
         0MdG/+mt8hKwuuiyzrCG0ZUDMkwtyZUVWb8phO7v3MY0+KZtTkMGiDxELNsLAWgTmoo7
         rOCQ==
X-Forwarded-Encrypted: i=1; AFNElJ94Stcw5DtlhYMBBuEqT9U8oFF9w+NyMsSyvMf4KTx/SzPTSOKl0Rqjfe0z+RJ2xJ/Yt0oVpf2dd9VB8t7rFy2t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72HUZcLLcQcWBaFzjw9NCtJqb5+ViKuv+6AmJOLFCDBbLUMNb
	y7ESPGuakLXfrjeP1gse9SX0gNNq28tSuUM+sLZNaJClFxNK+qoPDz1iO5ZznntcYQ==
X-Gm-Gg: Acq92OGs1M+56pzo49dQ9viXrzrA0MUjwkpFCafKudpU0gSLPEEUA1a2dreJFHjUWwz
	ITMCxzeDGc3HH5vU/5P76baUcTyVuLiiQKVvF5HSIKspBBVFkO8FyoBUERmEkZh50OtB4mnk0MX
	pHk99SDvGYCsmySsV+zynHqlxMEJxA4A/0x5vsdsB1owoCb0xnwm7/QEuOMp4X1Y4hJijjDizrD
	m946T8Wa7dUwgQo58fX3hwKPaKJWlD5A9ON3nI53fNt7bYTWikkF60GLxp61BbcH6bbCkVAHNvT
	08ws8wY9zpsyPfjAbifGagp/s2JQe+hi9hNQ8CRttmng2M9YNxbPkREHqrCu7x8HuUrKWfFPLzJ
	/aWukFVPMasTxTjWHd8iSqQmfKA25JfGJWU43mGfG+IRQ2k/rkTYVjP6V9mGN8CKUR4crYZfU1y
	CiPl2QFreeV7h8645QEMJsmYTeJuWM1m9eGLV3vyHyJJQx3vLOk6psjDvDFQufRVHq6cf7
X-Received: by 2002:a17:903:1210:b0:2a7:87c2:fcde with SMTP id d9443c01a7336-2baee8320bbmr2253775ad.15.1778240806820;
        Fri, 08 May 2026 04:46:46 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm15031850b3a.25.2026.05.08.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:46:46 -0700 (PDT)
Date: Fri, 8 May 2026 11:46:39 +0000
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
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <af3NH0cihPUQ8PST@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044648_243150_108EB76C 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> Add a new command make function and convert all the places using
> ATC_INV.
> 
> Split out full invalidation to directly make the cmd instead of
> overloading size=0 to mean full invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Nit: I guess it's worth mentioning that we remove CMDQ_ATC_0_GLOBAL as
we don't set ent->atc.global = true anywhere in the driver anymore.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

