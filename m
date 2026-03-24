Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84E4F54AC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIVar2XSUD8cxHHwMjaGV6t1yc3VT/8+s3ndQMtgs74=; b=kPdtnwhQ4u65DmhdC2QxBxN25Z
	KszGvQtc6eLD7mhxEKITIyXmg4EgCJgCKWkFG/rBqHiWECqWwkvaGV6CFSkjXHi7XgqhqwTMC/xPV
	t/G6C+OUqOB8wmYHTVQEjh/CeEtna0K9zMBG5IqMGSwoA5z3IblzpKXAoSju0s+NatsXyxp6Z+Ews
	FGHUe0xmp9cmdSEJxYVHs5BuqA8ISYEvAflh26YqnEe6Y60kiWVI1mObJMofVBBh52MJp3tCOyFL9
	j865WsDYK8iUfQNMEdPFaaQ3XyZVG3awyBuku65rXpXMYoOleTzzRiIq1z3UDZgOX2HsLr+WieYUy
	1/9nuYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52vk-00000001fea-10mS;
	Tue, 24 Mar 2026 14:40:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52vh-00000001fe5-469E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:40:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b04c9e3eb7so90785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774363224; x=1774968024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIVar2XSUD8cxHHwMjaGV6t1yc3VT/8+s3ndQMtgs74=;
        b=IdoX64OlkT6bCAc9Nt9kpBy7EXY3QOjwL6aBzmuxQ7OxgVc02l/dpZd4netlflMcpD
         u/b6cXqf2ExvhjWCW2eQvsyHvvNqqkjlLHql4u+xpMdsCU08U8h+5BftvpduuNlTjgkp
         ZDSpnprG5aTXZe4zHihmF3ZS+/YIfKe6HMPk35vsgw+hu83pB5FSmvsyGg2oc6ad6VOs
         r5IlkJ/zjQTVwm+cUYJ/3fWPuvipScV1StsQB2WPHJQIRlwFCxY7DkCrWjUCMtgJ6Vcm
         sx4lGBwnvFpY8GXEqgFMLgV627Xh++ncDlIZsqw8CoOwzLtM0kEJH7sq0t+k/VGEPIiz
         3G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363224; x=1774968024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIVar2XSUD8cxHHwMjaGV6t1yc3VT/8+s3ndQMtgs74=;
        b=ROU11IZKrKZQ+dHjMvOLYJwD3A4rv0s3SSafeEJ5fsexwqDePo/n6kC4/IITLdsLk8
         WBWszbNBJmjfBaYNYOl9LS3m6fD5WlW/pOChO0oQgzIcIPsIMZ7TlDqyt/Gdz4VYWtXB
         aMoLEm1uDVUJr3jDWO0bll6rtRBbDEpBXsvdLCV9ZpwYCXF7rcSQeKx2jLwOiTzfGBh0
         E1HllwqCTxu3mY+yp/CcumQlkWYfChFjUfbbDFr8u9Z1rpTjgoND4IVt0QvQzfCCJW7v
         WTprfrQznodIOcmlSGVnZSFYzasDc5liNLZ2NwjUxNORm0W5QHyHHV7KnMKGQM1nStWA
         rd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWedooRbd5sNxRsqdgwuOQQ0y7wexkd0WD1y8YjmGdBUykDmOJTF1FTY6DuA3tivl9nSFq9+FQ8ahbLJ+qaZEfJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxLveqGbxc+Lmc7tDpuRQMzPRmdbBzSUMVVjHnmxEVUlxyfXIu8
	AIAEzBLf3t6t1fma/KjPftOLPS8f1GQAhNsYUAIUl3/AFT4tEeFQjyFvPMGmdDxMPg==
X-Gm-Gg: ATEYQzy+jFWsqE81F4U7S8x7n1Rdd9uQbJ29v0/lGbFLOZhbIJ4a+YkvMWl0WJiTOXp
	gcA4x5tBAzg+dV8btvi7bxQiKXcQffE4/lXpQrHxc86PHmGo0ODMVO9eBlhUOG8piUo5QBG9FRR
	Q4OD1FnHWyVs3JKhtE/qXVUlwKnkO+SXjG7mTVBuQrKeq/qg4mqUIB5IlepfgfClhXZQiShRl5F
	PrRIwCmzOxiA2tCuhqQfh7fdxLRnI+quASZ8cIm9Q2KJsaC0JsAXC4oBEjS7rSq/HVFiHSW52j4
	BW1rsCFnco1CG6/VNfn3ryPVOWBnvMWfzpDm7HKCYFFej+xpuj5sFltIpYZilo92V6GplOIJT73
	CeYVcnhRhJUP2zD17Mci6vMCdyNOycZ5bAaezfgsn90p2bZcCjuz4rkwA+5u9KThXxq4FEco7I4
	FWRG6B4If/tfbVxic+ccGXMZJrsda5Sp+hAK6RrtBOe3p5WmJNugwmN5S3Kg==
X-Received: by 2002:a17:902:f652:b0:2ae:575b:2345 with SMTP id d9443c01a7336-2b0a6707a09mr2261445ad.9.1774363223664;
        Tue, 24 Mar 2026 07:40:23 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ac5b287sm719016a91.4.2026.03.24.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:40:23 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:40:18 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Do not continue in
 __arm_smmu_domain_inv_range()
Message-ID: <acKiUrnbe5ZGvPIl@google.com>
References: <20260321225041.11090-1-nicolinc@nvidia.com>
 <20260321225041.11090-2-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321225041.11090-2-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_074026_013175_D3121973 
X-CRM114-Status: GOOD (  15.28  )
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

On Sat, Mar 21, 2026 at 03:50:40PM -0700, Nicolin Chen wrote:
> The loop in the __arm_smmu_domain_inv_range() is a while loop, not a for
> loop. So, using "continue" is wrong that would fail to move the needle.
> 
> Meanwhile, though the current command is skipped, the batch still has to
> go through arm_smmu_invs_end_batch() to be issued accordingly.
> 
> Thus, use "break" to fix the issue.
> 
> Fixes: 587bb3e56a2c ("iommu/arm-smmu-v3: Add arm_smmu_invs based arm_smmu_domain_inv_range()")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

