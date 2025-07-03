Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50388C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuHvBdZctEtzhPELFeCYnZqsR6O+CCEh7cw6bo3Z+rc=; b=ox/ZtIcjaZ6u5s0UMALes1pv9Q
	/AizD0XkherU0Nq/FF2/Crl8YZ9Feaa7frcOIeDxLvZWez7orGhYDWPwwPKzXNEWkhgy7SYWDAIxz
	89C4QAjFqqkFUC39R0JjeIw2pr9e5jE36lrMHgXIdlRH9zI8RXRKJ2X+wAIuD9iBVqQX+IaG9IBie
	HVJdYW9qRLn7r2rvixQNt6GC83KMTBuJy2EL8BXj5c5OVzJd47e/KqjsQTiXCuWn6x2+CRWfAx/nu
	Ag51OaNAf90eAKBXjJPHC2uAwllNabtSgKd+umbk9sb14AQ5rBw00fHGwSwpMBVXtvNFpPmUP92Di
	VwVLIkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSiq-0000000Cmiq-124e;
	Thu, 03 Jul 2025 22:48:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSBw-0000000ChQK-2dTC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:14:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235e389599fso273395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751580843; x=1752185643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuHvBdZctEtzhPELFeCYnZqsR6O+CCEh7cw6bo3Z+rc=;
        b=YOQoHUXnOnRSS/14dhxoTQ9vBUKcNLmrq/vhvCoQ2ZuAtsl6gMrNAf1MQKSY9FpGTw
         smVqPFMyKYEwqPaiJ5UOnLgQLo8ee4lHq01S8JKmIyYy891Npp0Fh3rAe4cyR6w2FjPl
         KjPUTqhl4vHFHa2Ekn3GmG1GTLcJMIk+VF7Zm0BbJeNk967GAkan0mCOE8fZEoxTYlsP
         L97Z94JBX74x0C7WsXryGXy6N0zfXLhrB/bD5Jze/LgT/rngyxvXTduVKXTYhR19YiuV
         i1K54GyMqRLP9wfnKvKvh+oUtnpch6k/glH+/+5vLADruIoT7BVAmg+YoA5VWWGunSW8
         Vt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580843; x=1752185643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuHvBdZctEtzhPELFeCYnZqsR6O+CCEh7cw6bo3Z+rc=;
        b=icxrw0C56P8V/DRCOv8H6r9QdfLrGKUvPnoQ3AI+XdFdOFxKSaJLUWCTvFrJl65JK6
         KeRfObjscRV5i54q2YmyWp4kRINO/giaToo1wP6nHKC0/rI4vsaM07xAUSMRfAh0c008
         xuSbtuUkuOh14ZlY38TBudJCW0K4k8L3/BPBtURWVMIkLFHgcYx3vsoIjPgh6ovzBJvu
         1a/nsoPXjLl43Ca4tp5Oz1FOn6j2J7dB3TSbMW3EaktKVbcuZQOdXNC3wY+AoznhaZNV
         +ojtVwPF3IXZOpNPXfsMCjniHf/X4rnHCHbYsQmJN4Y90G6/UuZ76epFOYY5zoCMpP6M
         5FxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBrBLFC7qNBZnDaSYazcNnuuoMs+bbbCb4H7TqNfjrBaFSMmHCNvVK6rzXwN1pVInjNk30XjAHyek9YRSaGRF8@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZWgdhA+VMCcwXhyk87A62edm0xdqysfwZ2wKfic6dbbjgita
	c3EXQ8X8Ue+ml5ZOzfO6gxXKi+EKoMZtr8IM6zxukqujfpkXfc+u2WeoSGHEzUWkUA==
X-Gm-Gg: ASbGncvYLgIJc2gVCeea8qncJVre27yos9S+Z9SPfTZflKC5pDSUi/3bWOaNpyBd1/s
	6J/erXqZappqqw2IY5xi9bSLYYW2sHZRsUCxF0Y11zDdGeTUVA5JY7C2WtLJXXo0f/gPGhFLbSt
	F0Wr7j3n3VaRVBVzPVCL1hoe2thMGa30mKOGkNyoJJvUhvXuG9/RkaCN/iKBeU8OaCevcqTzj8J
	67h1axooTP8ThRLmJSEh4jpHuCBgpBJvqEgc0qXJ4vYHSoBu4WyLOwovuCmk95aFAGFessnsCdS
	DB78H33qoYktxAXCpL+r4Z5ckLz8k57/KbEpNis660njslHzCjM3lch6vWcIX8K0XN+pbt85FwP
	9uIsXe8Jah36PGJVqF+D6Re21k+al5pFw/uaHaQ==
X-Google-Smtp-Source: AGHT+IH31YOAgpp6cWXPyDDiSdW0FsgI8z3zIJNlzWY7vAq0H2n7kS+w2YKYWOMSnIdeLnEkqfRSUA==
X-Received: by 2002:a17:902:ebca:b0:234:9f02:e937 with SMTP id d9443c01a7336-23c7ac250c0mr3191765ad.25.1751580842742;
        Thu, 03 Jul 2025 15:14:02 -0700 (PDT)
Received: from google.com (135.228.125.34.bc.googleusercontent.com. [34.125.228.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455ec28sm4302055ad.117.2025.07.03.15.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:14:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:13:55 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Rolf Eike Beer <eb@emlix.com>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm: fix building smmuv3 as loadable module
Message-ID: <aGcAo3pUwdsa-mON@google.com>
References: <20250523121257.2340274-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121257.2340274-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_151404_683023_98759A55 
X-CRM114-Status: GOOD (  14.41  )
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

On Fri, May 23, 2025 at 02:12:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The smmu-v3 kunit test fail to link when the SMMU driver is configured
> as a loadable mdoule:
> 
> ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> 
> The problem is that the drivers/iommu/arm/arm-smmu-v3/Makefile only gets
> parsed while building modules, but the driver itself is accidentally marked
> as built-in unconditionally, so not only does the kunit test fail, but the
> entire driver is missing.
> 
> Change the driver configuration back to $(CONFIG_ARM_SMMU_V3) so it
> actually gets build here.
> 
> Fixes: e436576b0231 ("iommu: make inclusion of arm/arm-smmu-v3 directory conditional")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks, this fixed our allmodconfig builds downstream.

Tested-by: Carlos Llamas <cmllamas@google.com>

