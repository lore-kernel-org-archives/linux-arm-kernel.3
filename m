Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B10CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 19:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii2K5/lD+aBTxicdOXZF0Rxje4qtvj62/HMAMykB+YY=; b=XHLbZz4E//5/49/GghGiJQ8S1J
	GVq4fXZkJbGAP++DradtpjRL2W8nadx0qWaU3TPmDQWGwU71khbhV+mu1W86Vt3VPD48feDzHvHkc
	5EuHRRiRyOOKo26W1aFNdUFn5Tw6FULR2kadNji0wmZBXmBVcit7aXBH2MXlWJl7RhdnFUItJoxLM
	ygIu0akZstbWKKqxCumkSoMN2+Ucp3zTtYNCG7xWYLxGvCWq0G88iIfSvIHaykiSbP2NgWEoceCqb
	2rRGgrBcJ04KMlcOcMM1FkFSC78d52x605LPJ75ZvRNtffJUf/UjecoR3iarNzHhCsmuEIno3IHTH
	Oycq77Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHSAS-00000000jrg-0nis;
	Fri, 07 Nov 2025 19:30:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHSAP-00000000jqL-0Bh0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 19:30:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2959197b68eso22675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762543836; x=1763148636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii2K5/lD+aBTxicdOXZF0Rxje4qtvj62/HMAMykB+YY=;
        b=gIJJNLS0F/Pb/j4w/VsOodo00r6h/Qul5VW2hpPIEv/r3glljXYkqN6M0XeM66B5+/
         012DElcx6hQs8YM85+jZZnlocnyB/MFvUsjh/kUcQz0gtuZO2ccxSKAuFfpy82k+0w6e
         oKJoy5YdhzD4VcY4BgR+6lNEu7yZNfMMBiyLPoBVOlfyKm9LUkP9p+BISwR/+4xtmm+m
         ewuwyuBaDMjQYCuvPLSvjF4Voo8hKApcqDuxS76C46lRk1pKfdoi1zNR0mmgHlDl5ZZt
         WnDJjBqbUldspzwndtRiolMBNvGxlgDmnDV0SjpfoNMFjuPJCNtY7gRXrSEjLI/Lg2m+
         RA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762543836; x=1763148636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii2K5/lD+aBTxicdOXZF0Rxje4qtvj62/HMAMykB+YY=;
        b=hTyFe4JB62N/gr+4ZQnyGBJTauqR28tKFNK6kF+1CQyrkVP3bIhonK04dZW8aK4iCM
         X9QbUkENqEBaj4vdeBlwZviBXI/Cc+uKh60Tn9HoI7cV8/pkFd32rg4RjnlWCKFROwSC
         /K+mwjpj5MMbThGpdrtkIwe+wQwo5sMLsZP0C/G2u8qZ6KbVd56f4KN0p114H+yrt7yA
         GktlLMBK325Ep39mS5S1WlH0tGt2DM9U4p7AR776NGonjBowxmFJkkmUKBO2Ar742aA/
         13h73VVIVG0ieSbyMsIcdG8Uyeufj6jvQqyK++kmJZBMlR5GBnexVVWear7Q3z/nrKXU
         Xd0g==
X-Forwarded-Encrypted: i=1; AJvYcCVEE1XBNNc3mKjWZDa2xuKdbNoWdBX4JdWCrpCCYQk5V782rqx8zq1U47n6NY6VsFvwjXMe2E2JEY7Y7dJsFuxT@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ20EOvLb0oOJeL1mPykQ5e5wvFTUsgcqK3YFrBSGvCiTXZQ4b
	anxmUJ1rygxsWkGyoT6vStjmGR6aU+kk9fEcm7tc/NTMN5yXCt4AlYeu9v5Q2pUjUQ==
X-Gm-Gg: ASbGnctH/JBU5miN/VB+Tn9EYUUBOr3Lk5VcnPJzuutbcfRHFMo4XpeHGAXeFRgGkP5
	Mf1fMWiHFlf0rq2f7horUsLbS6Y8vMWIVA0kztpU0NMiZoVyRrJD84T7L6CI5JJ4twcEbv/aEY9
	gsW/Ikul3QdTcbktcFXCRwqMaUBpFWclNrpmEH/xDK/Lk/p6X44UyJY1v4EG2G4Qz0MUZwqbsVA
	8wZ6PB7ObkzxO1LaoRGTITWsYThEaGgOsCOZSAK6sTa2nOfFO3Xh/0BH60jO1O5S0LoSLzrYS3B
	DY5UlQmlpl8wVnv6EFnpALGSD3lzMcixZQHX8CuFiW1XSTqPMzDCtb2KfkJTcOoTHDbP5Q0DdEp
	1ZCwF2DqrAJgwEDZgOISPkCG9z5eXYmGcH9aV+/XcGAkym4c2xWTvQIShq2z6yvwkmdylSKUP1q
	4WsWsyHUMipGLVx9go8kZG6rhfWLxdelFMbmJE0k8Y5fXsLIYK
X-Google-Smtp-Source: AGHT+IGrZxEpsvavP2SSGDlxEEDNvgmombMxNJOrhRHYLBt6v8Cu6925mPYDaXVNFvL+7VqE7SGZkQ==
X-Received: by 2002:a17:903:32c1:b0:297:d83c:9c37 with SMTP id d9443c01a7336-297e56624e7mr492925ad.12.1762543834993;
        Fri, 07 Nov 2025 11:30:34 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68aa1edsm10072092a91.1.2025.11.07.11.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:30:34 -0800 (PST)
Date: Fri, 7 Nov 2025 19:30:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Ryan Huang <tzukui@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Mentz <danielmentz@google.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix error check in
 arm_smmu_alloc_cd_tables
Message-ID: <aQ5I1OYwWbfbA95X@google.com>
References: <20251107190917.2858684-1-tzukui@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107190917.2858684-1-tzukui@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_113037_084998_F82EBE78 
X-CRM114-Status: GOOD (  15.52  )
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
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks for the fix!
-Praan

