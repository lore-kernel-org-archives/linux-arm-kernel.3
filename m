Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7ADC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=; b=z9Rtz7eZi5PIZV6xakVdnTpXUP
	rFLo+JrWw0UUYnPjxTc4oeXN+pdyrqXqndFsBH/3t/uolemUp9oFQqcRx3G76bLfhGxQsgv+VxTgT
	ph+uBAb8N3JdF8El6OjFwghk/nK2qUiTZ4KnOandsZ3bI6mdu/3D7MxY4hXUnAl/VePJKPPRwdGsF
	khHFwKPda9BiKKOuPYun4VRb10WINNHmpsIINyob0tmUxXNfRCUjS+LZ1Vs9dkjAIsB3aiIk1WoA7
	v7NPXRBvWzjVEfgrn5WCQCyU8xDoYWqyEO2/cVtidAeKR/kXDyHsHAHtbLhjKxj75TqSczqh9ty9h
	pfbtLniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1dN-00000001NMH-0zYl;
	Sun, 26 Jul 2026 16:23:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1dK-00000001NLh-1Crr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:23:23 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caf228a910so14595995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785083001; x=1785687801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=Kf59taKswWeI8cHI8EzULJCLX5OauYUMpD5NYeSBkWNSv6gQ9xzW2Jqd3HSdRKsPNo
         4wS2SJAqcbQtowW7LtUP7vkeRCnIDixK6WjvC5h8i9tzwsVGkCZ4gVNBnXIo4Z7GyOd2
         pg2z81Q6Ic1kyMDQTuuQZOQwgvHwJ2IqSIYJqM/SmuZT+V4Cidv7+8HkO9QuXG9nzSAE
         QGiJ2VjbnEdo/A9dn61U8k4vlj1hSRilz0BcqBNS9AIZRH2vDqLI4EN/1HLltd5PU/hC
         88O3m02y5oN/9dadpo+7LVhNQ2ZmiM/zNZlQSRJ6x7m5losnF91rLn+LqVWqxOY7Cnqv
         M4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785083001; x=1785687801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHRV8RVQazd81DBcHd8LNzyzM/eTYjhER1/AreGPfK4=;
        b=SJngkuI2gsheqAIQU1rVEbbH4J3Tn4pwd29+w8ItnPXOkwJgbtkVtBcaVcCO4pDQUb
         iSVG/y+pjdLuXuAgUVm0Dc3+8o5ndmb12sDAuTisIGX4vF2La8LMlDdEatBJH2YxPFKn
         P2IOcrwX0TRqA1AdS8WY7TeJ2uxem583lL8iUmYXeSiDDNnby7DbvvjEVrQsssCSYA/X
         6FRJRk5y0UlgUWMqvElZDpsf3BUg3KhLunS6XW9rysBAM+/BHbZTArdw/KFgNGAUL7tI
         egCYPetbARpt1LZDt9BtjGcHEUKO4lmaf7VON74slxGmIW7+A5htG3aATHNM4oBdv8ph
         iJhg==
X-Forwarded-Encrypted: i=1; AHgh+RpBmxwK2iwATCLFnpPz/c04mhffLqBHFR5D1afbzm4rpHLqGF+g0MlGDvAvEWSH8iLkrV9A2Te/gFO+AVk8DiAv@lists.infradead.org
X-Gm-Message-State: AOJu0YxohPs4VoEv7cnvPKPldK6XmqJOxjzVGBzftjpBy/5sixOIjRGK
	EA+lXUGFBaPpSL9aUWL6yKUZo/0o3IKmfw6+5xtIVvkuXlX3ZzeD4PdR3yR6ZBh4MjU=
X-Gm-Gg: AR+sD13n2d5HqBzw+n7fPKU6TIWIZTrClA4LmGlx/WEvG+wTkkNQH6WLRhg7IzcHG3H
	WL05uu3HJKANspy5878Zyseih0F0kg2KMJrL5RS7OkJpOxtyAR6I/rBnaiUT6u/EF/ckNAOxwf4
	eoyMVzupsE6Q/bcj5SGFjVqIORReHO6zc9CI6WMXzU4AlJcHYMhR7x3F2qOpT2BtvW+7sSCuDU4
	0Y0XjT3FK0nqzQMg2TdWcUIUUEYpKemHtcvDyAOOk0xRPmRaQHWd0efGn7sMBLFzCYMYk9ll3o3
	1tSTKyuO8M4AvHprp1S52nRtKX8P4OWXKWTcBrN/c9oMVyYJb5hngJH2T7ZzoNt1EwTvrJ5jblV
	UnJF0wdB5T4EPVyjjJp7vDfytF+YN25OiksAjaAJYHrO3LRt3ScY=
X-Received: by 2002:a17:903:124f:b0:2cf:7882:a444 with SMTP id d9443c01a7336-2cfde7bd3d6mr49402625ad.16.1785083001604;
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm22177955ad.20.2026.07.26.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:21 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1dJ-0001U5-2C;
	Sun, 26 Jul 2026 13:23:21 -0300
Date: Sun, 26 Jul 2026 13:23:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 4/4] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <amY0edpcgNbqFQ7s@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-5-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-5-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_092322_331258_AAF58821 
X-CRM114-Status: GOOD (  14.91  )
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

On Sun, Jul 26, 2026 at 08:19:04AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMU is affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice, and
> that infrastructure is already in place behind
> arm_smmu_erratum_repeat_tlbi_cfgi_key.
> 
> Neither IDR nor IIDR flags this Tegra264-specific bug, so hardware
> detection is not possible. Tegra264 is device-tree-only (no ACPI/IORT
> support) and already has a dedicated "nvidia,tegra264-smmu" compatible,
> so DT-probe is the only viable detection path.
> 
> Enable the workaround on instances matching the existing
> "nvidia,tegra264-smmu" compatible by calling static_branch_enable() on
> arm_smmu_erratum_repeat_tlbi_cfgi_key. Document the erratum in
> Documentation/arch/arm64/silicon-errata.rst.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

