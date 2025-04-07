Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F155C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcXjjA+jirbGtlXlcOVxvxixEqyX9/ZtaNYQ+3n7vks=; b=WX3gy23p/XMCWJ18ERZYbdmZaD
	RdsJ/ZFmqYS00I4oHzjevxx1gADYemi/xrFrAUzLSqiTKPFaiszGeqC0Xd0h7XSpzIdUg2mu1GH75
	v5Tz3GZbQ7wnlJ5kSOjw+1JdC3kdkJJqV/a6G2mRqRGTy7bEOTUzYpnXPQ88vriND7tW9KfuSf8Ak
	ROk7DdsBLJZLdz8xRGkHNBArRz6B1E6bmr/8uzSVpHMJcpX2w6KHPfco19Muu6Nie5YwvFEDOoKRo
	H0tL6eCI1thuy3APh7Q9ob4JjnVH32CZHbUPgWdLV2dZcwLJLm5CchZiQDaxKqtgeeRpxlfu9CiGn
	L0s9DReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i8f-0000000H4Ci-2T38;
	Mon, 07 Apr 2025 08:47:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1huo-0000000H0wN-2uui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:33:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2264c9d0295so324265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014788; x=1744619588; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcXjjA+jirbGtlXlcOVxvxixEqyX9/ZtaNYQ+3n7vks=;
        b=4MyjHl7t7SCv3iaNnOLVkYCc/6JXgCJ9F/D88UcQpxpMmLQexeN3SrgvInjEWqeA3u
         BMHGEJrf3iYLGqFGSaxwO0fR8hHsO0Zf1vH9M/4YN4v6jTQSo5kBUNmVU5S0ba78UDZ+
         BXCwUBN4jwwCk7Kh7kIPiGuIIWZ3K8SGUzjjd4mYvHFSO76cRKfuEwJCYnUdN8cWPWio
         6fZCOTrIkbftTjPs7WCykEpxdRdWn4MMy6owkDy1x14Y4xIo+VAB/6qklLGD7n1nPZ4h
         nSMjAHg86L/gnAjJRs/G8jRNBS29i9Vi0tfwP9LDxcDCqkbhsAsA/zqK50zR2sEU9GOl
         SDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014788; x=1744619588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcXjjA+jirbGtlXlcOVxvxixEqyX9/ZtaNYQ+3n7vks=;
        b=gySk2PWvs/58h4ZE/d3QWoOoGdpLaWVL42ml99cRgzkyA/mDw1BeAQgScaR6f6HcM0
         6DiIS4WALi5PMaexprNUDM7O5aZ9J29I6BFWdhixGELH0Ao/Ob9OshX9oFzZh9exHfbb
         5Xn66TFNQJJZGnL0OOpp95VlMy2YRbS17SFNDkOc4BhzIJo38hzGuvBB3OpgU9iE0df0
         DOemsLXr+bPesGKK1eo+ctW6zqxSP80oKjQjpYvF8bF4w5DQhsaf1UT59X04ny19ImGd
         7igUZ4jZW7riA9hvKbM9HvIQ7xnbk3t5/kzrRde+B1jpKJSzw43pg7dwcIKRAjBOQ+4H
         1DNw==
X-Forwarded-Encrypted: i=1; AJvYcCXeyuE18TYczs9+7dCLhpobcGq7B1WsqaKfRCFU9kQfunUbazNqufkF/dG0ojwy/RMteRqIO3sQ/CYqK3FmmfmN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7VJHD3FpHuWUBg3FO3E1ik7xC8B6uxRJ8bOo921v0Y/3534n0
	hygiLguTSd6nsstvgA0vOuUZuv05RYkJvtwbydK4Pzmq3pxE/PZ5X0mxTHYzgg==
X-Gm-Gg: ASbGncvr3U93gtCtthgeLJpLI9dMly7/NyFMhVYuaHmyn3fyVJ2dR6+xyCRQoNJ/luj
	2A9a3J2PQG71yO0LwjUtrkyn+hLlXDAtOU3kyAsc6n9Aj+eHFqQ64/yq9EDJmmGq7658A39JEDi
	gKi+QTpUHyus+I1omZxs8SQ1Fe/qO0yVuBgg/DKBLovPV75lpNa/aagoeLx/HRn67vLpkT1xj0y
	vc51Q7o93/MAyIqkaeuxt2goK/B35MaDlwsrjixBed2MWGtV7vBybAhppAnJKCzkN6lshnhSUIB
	TK8HUPt2u5lvgtO/qJPZhHZ66EL1o8ZKfYPBJ3QXLJXOAn01Pv8zR4N0jKT09RdIY2pdyfozN0H
	PYDUF+RPjYpQWnw==
X-Google-Smtp-Source: AGHT+IGgoaBTlg9BjbIvqCWdACY/aXtozoW3tXEbZzO1wBZolldhDpZWuJ7yv4qhtjzddz/sud5TLQ==
X-Received: by 2002:a17:903:c4a:b0:215:aca2:dc04 with SMTP id d9443c01a7336-22a95eb8d41mr3228575ad.26.1744014788291;
        Mon, 07 Apr 2025 01:33:08 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c385csm75476405ad.81.2025.04.07.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:33:07 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:32:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 1/4] iommu/arm-smmu-v3: Pass in vmid to
 arm_smmu_make_s2_domain_ste()
Message-ID: <Z_ONu4pIDyiWr2DK@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <214b10db02f1046efdc70e2c4803111357f60070.1741150594.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_013310_735549_6C2915C6 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, Mar 04, 2025 at 09:04:00PM -0800, Nicolin Chen wrote:
> An stage-2 STE requires a vmid that has been so far allocated per domain,
> so arm_smmu_make_s2_domain_ste() has been extracting the vmid from the S2
> domain.
> 
> To share an S2 parent domain across vSMMUs in the same VM, a vmid will be
> no longer allocated for nor stored in the S2 domain, but per vSMMU, which
> means the arm_smmu_make_s2_domain_ste() can get a vmid either from an S2
> domain (non nesting parent) or a vSMMU.
> 
> Allow to pass in vmid explicitly to arm_smmu_make_s2_domain_ste(), giving
> its callers a chance to pick the vmid between a domain or a vSMMU.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 2 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c    | 3 ++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 6 +++---
>  4 files changed, 10 insertions(+), 7 deletions(-)
> 

Thanks

