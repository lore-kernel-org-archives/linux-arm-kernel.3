Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB60C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jw2vNpybPCVuX/v6xAl+GdK1At9+x6m0OEpSnKsaMkU=; b=aGy9Fp8NO8bWPhgCtJRJKRRWKY
	VuzmS4iBXaP6enWJRPRqQl6c6bdXaNqMfN3/cEskDZDz+hHXSPV5dy6yyycl5NLtdsXmdb+pLyPvS
	B7cC2t/F0Wxe14t1N0oHA7MV4TeI6AYNjAcybxptqxtaHLrpqhUEhijwiTt2WRlpw8jMSjBNsuMRc
	mSo7drsai+6bPvIgP6aMXj4MDOlKECjS4cdHZZvSeQHgUAqRO804rRr3j1UsAe08V3yTd95szmp+S
	3GVkd+EKyZJpxOYnWkTgEAfj3sS9Ihq/8q7zJ+x4enkHIkXE0kA4iNjmuXBOadeNMBGw8v/u/Ng/1
	LIJMnY1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWfp-0000000E53u-0W9X;
	Fri, 21 Mar 2025 07:20:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWe8-0000000E4vn-42ME
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:18:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2240aad70f2so165985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742541503; x=1743146303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jw2vNpybPCVuX/v6xAl+GdK1At9+x6m0OEpSnKsaMkU=;
        b=2CmWI/nYn7ohTCH48vmwxEi6aA+Zplk1ceiI4NxK9fDhpkGPa+yj9UU87L48YnLt9a
         w0GhnmIg2KBwr7R4stXb/K3mJDb9KrKHlNj4+VpqdvCEVaAAqIHVQPUWZsON3ovjoFyK
         9RgEqr2Skej738+NsUOaskeJrUQW9y/KZKd0vQcBlaqfACV7GoYuKF7OIw0M9uFx8vK5
         NQQiXinrRMz/+yUBjj9wvirEz4DMMycXYNQJWP22DViD+eOEFgP/emfLnLIopRmKoPGZ
         V1Q6fjf1GnhNuMzwPeSNTxc43cszCQGdZN44xWfKBeqWr6xBu8IJ8iA9DNUogXOPpA5N
         5pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742541503; x=1743146303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw2vNpybPCVuX/v6xAl+GdK1At9+x6m0OEpSnKsaMkU=;
        b=ElpmFDXl+mPz6NaNcwOhv564sgxY0ZAJIzSYMGsCTOZnLFUs5HS2iFKe0VthXGj6vH
         flkp2NFWu6PpDZ11HVvJ50eumQuwU+bxKpOHo80SVjMiyltZwyd04XhJsbxwUfvLmSuj
         EZgUtjt4VP1uIoba6dKshQrSt+z0/tGrj/64f184EsKN52xLDXhuBzUEXRuiSFO8lyfW
         CFy6OwfpNV2Euofkf7o8M3cAwBFy7McPrNZeQsiZKoh7r787qmee6v8Q+006qtWWeNZq
         Sb8lwyZeC4tjaWWk+3Uwt6thGvFz3AXafXd7jr9npKfPiyjeaticlZYeVeJAFUvU+XNk
         ZUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyb4K0cJzEdmLhGs0XXcsQ6wJJTHdWPmNTRR+B5Uzw6LnP+hlD763JmtqjZ2+wTHR5Uex8DZ2Ya4yA+E8LSVqg@lists.infradead.org
X-Gm-Message-State: AOJu0YzvnzJh8eNLeB6/NzrsO1UnJoZhTgnD9lD3KE0dZg3B7Rdyu1be
	uKp/jQO+GdJOq2p8hV32kCAzufLZpH2qmE6T4SjvYib4HUKYHafT0xczHh6rpQ==
X-Gm-Gg: ASbGncuU6ovdVOgYIsLCy2la/XzRs4YcKCU0Lhuqc3NvXWLsfLa1934gMdJwnwCacvh
	aGmxrRf34ZlvKDIDxn2nEE/wdM7wR7I76qXMJGMKVeu5XQR6l6jvaMQXyM+5+ImzuWMHjp+Ar8w
	3DKIeZBdxDlIWqpv5Nkz62YG1OCvyRjeFAWh+HxoL8dcfbFNpt4iDkZ6mmXeKKf4N1EwtWpK2Ru
	CC0LbgXHNL3+cm4gNs2Y8IxldbgOA+dT/4LuIZVT9wcxE0gfOcOyqTJoAnPO+ol9UElHE8fSqpz
	G0jbDTtI2fjcieo5M9WNpU41EIlzbORf0nKScEINAl08xFO98BWEgkwfkCZDO8+QzRO+kLZMOV2
	7bPI=
X-Google-Smtp-Source: AGHT+IGKB7mjuTcB4qOfGRT8FLFl5rRI2m4ialLvr7Ln2GXnSWiW/ah0grXskxwzpysFlmKw1G3WUA==
X-Received: by 2002:a17:903:98d:b0:220:ce33:6385 with SMTP id d9443c01a7336-227844c198fmr1390535ad.9.1742541503101;
        Fri, 21 Mar 2025 00:18:23 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d580sm1092506b3a.119.2025.03.21.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:18:22 -0700 (PDT)
Date: Fri, 21 Mar 2025 07:18:15 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] iommu: Split out and tidy up Arm Kconfig
Message-ID: <Z90St0D6hyphtOID@google.com>
References: <a614ec86ba78c09cd16e348f633f6bb38793391f.1742480488.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a614ec86ba78c09cd16e348f633f6bb38793391f.1742480488.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_001824_998274_B4C4770A 
X-CRM114-Status: GOOD (  20.26  )
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

On Thu, Mar 20, 2025 at 02:21:28PM +0000, Robin Murphy wrote:
> There are quite a lot of options for the Arm drivers, still all buried
> in the top-level Kconfig. For ease of use and consistency with all the
> other subdirectories, break these out into drivers/arm. For similar
> clarity and self-consistency, also tweak the ARM_SMMU sub-options to use
> "if" instead of "depends", to match ARM_SMMU_V3. Lastly also clean up
> the slightly messy description of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT as
> highlighted by Geert - by now we really shouldn't need commentary on
> v4.x kernel behaviour anyway - and downgrade it to EXPERT as the first
> step in the 6-year-old threat to remove it entirely.
> 
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/Kconfig     | 157 +-------------------------------------
>  drivers/iommu/arm/Kconfig | 144 ++++++++++++++++++++++++++++++++++
>  2 files changed, 145 insertions(+), 156 deletions(-)
>  create mode 100644 drivers/iommu/arm/Kconfig
> 

Thanks for this! It looks good.
I was able to toggle configs and build for arm64.

> +
> +config QCOM_IOMMUa
Nit: I don't have much context but:

1. Shall this be in .../arm/Kconfig? Is this an custom
implementation of some arm-smmu version? If yes, then maybe we can
update the help string while at it?

> +	# Note: iommu drivers cannot (yet?) be built as modules

2. I don't think this is true now? Shall we remove this comment?

> +	bool "Qualcomm IOMMU Support"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_LPAE
> +	select QCOM_SCM
> +	select IOMMU_API
> +	select IOMMU_IO_PGTABLE_LPAE
> +	select ARM_DMA_USE_IOMMU
> +	help
> +	  Support for IOMMU on certain Qualcomm SoCs.
> 

With the above nits:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

