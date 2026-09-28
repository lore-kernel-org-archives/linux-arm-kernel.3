Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E4CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1T7FYtEHLzKBOAf0DCFYQLvpaY4ZVWXjng9Q2koYuQ=; b=tVDV7sbmfbyEu+7kPprpK2/yfH
	Vo3fKzyZ3VPdHrht3KaBSS2KjYSKGReEmbHFZl2PTxMNk9xywemru8XPUvwe90lGP8EJ22ZcSe+/h
	8OnvGkr3yefKaIijYqkbzvdAx0+zvLI4ia2UuDcgRi8tgVN5QdMoW5ITAskR+WKYo7ThSg+61KeQQ
	q+CarU32HuTnwJuiu4BWIa1ao1MCJ2PukVJL26vs4nc8FdeH3oFlpMKmKDQTRb+iMqJj/FEBG60a/
	kWQVwePMSuctRCZF/XR8y7cfxRyMhZbpjFmCuHjI3NEo1XIiN7Zkmj4F3M550+0LngYpA2MJmepIx
	9S0jZF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIc-00000001UTT-1Zx1;
	Mon, 28 Sep 2026 19:46:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIS-00000001UMW-1B2T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:45:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d3b445a84fso2995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790624755; x=1791229555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1T7FYtEHLzKBOAf0DCFYQLvpaY4ZVWXjng9Q2koYuQ=;
        b=UJhShlUrvYXiJwMWxOdXK6U4BHt4ic4+4JIrO/us7FlBMfWRMBc46u02HRnjcFetlR
         ae2ff9ZIBD9Y8+F/qN/ChTGhp+NUBO6w5isLMGSa2BfyB6ZPIpjRcVbOgP98HJA/4v/Z
         Gc8DPBRSsLmOtFYI8jyWH2i0CWuXyy42OqBNSaPufX/DBNlRZjBYwXNNYwEih1z7bJb5
         QbzrnlG+qE8bG7k0KJje5hRKwk6h3RGrb0SLHcvvxU6mq5TONGMoe+x6ARYhtdW9HK92
         ATAY/M7GJB0CvQpZh35aWgHNQOfKsqc6yQxiTi/Ww4Ypw3N+KEnhZzNUcvcEdJUsCeXg
         9NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1T7FYtEHLzKBOAf0DCFYQLvpaY4ZVWXjng9Q2koYuQ=;
        b=q8LEtHQjdJTMDJuIUI7Ev8NCrBUyFoHLmwGZy6xJ5Fo9gRaVRUb37CTTxvR3SpTASy
         A/9Hb77wos5o2H1bm7KBTK/+46yNpXMFUTwvF20KHGVFtN6TwXZWe5Q3ZNFRVLnUKIxN
         AZS6rc4fspxwSwWYg9ttZflOk7aNIExIUoGJYLDRPK/ODQ7n9x78TEKmLDQF2xpzEtFM
         /0W4DVwDp7H8EZpffdNznle9AgJYNQwMfMHYfxJZRFt1SB0YKvz+XIqPmjkZY0dAQRtv
         EsVL1sVjVo66MFNoGlc53OiCFmIvNTrRpY5fSWDIoa9B4PHwe89FTkyLsjRppky6OqK+
         oNVg==
X-Forwarded-Encrypted: i=1; AKwUvBwQdyS9ZqurG2cc2hc5Hgj86FYYqSmt2JACLXDAX5vNqjiZEQ7i2fLMG8tdy9HLMKHPUg6iJSRAlUk9BYSDahVF@lists.infradead.org
X-Gm-Message-State: AFq9FYJ9ttALAkfTL9NXtlt/G40+5Y78vd7aIqEltAguchJwZj6FGl3+
	1TDfvNcphHD2KnvWiz6kL1cOTd/vyqi8p6DMUlkIAueTmSJX04ylcl+rSfajTsdRmU6C5Gui07z
	SG1kZxBE6ibY=
X-Gm-Gg: AYBFou1JRZRRCGN2R7OweSpqpsglJlHtNfG031AaiPomZIXxZAh5OryHEcOUORvdhPr
	+FV1wv82ETM7XF/E6H3HQXhlchtWkDmTeFxfh4vgZLH1IFOXGdZNHfvm1szial/lPUdFQjEpbkn
	VxgRdV3tcMfiexfvYUvnxGnxf3zuEJtL5fz3hTos6A5RrgejWP+0gp3utl3cRUsrBcCXhLZovEq
	lZ6eq7sjHitbaBQolBoxe4JcJ9Y404ssv/OpIA3TQLcc2WIJpwcmn8lotJqSotllUtivXrFDG1e
	unxpKWggFjpNq3j+WSvONVOoBbnoDBOW9L02mw7B2+0Hgf/l1dIoAxzaC4R3hj8hdhlzOGD999x
	0g9IomVquyMcOuXQA3zpgn+Dtokbvw29b5znRMRL4IT6pf5OefkF4aqiyvVkGE4L8I9bFjt+XUg
	5PLoELavE+pcwx1XpJRnJp70ImbkqT+Y6dJwVQx1LLHQB+O9i97/pTrSTZxRsW7umP84Og4+wyo
	0hHy0VWzw+Bgej3tvqQpoWxukxsri8a6LPn
X-Received: by 2002:a17:903:4b0c:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2dfa9773f0fmr8136125ad.15.1790624754609;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4926b3f9fsm1077587a91.0.2026.09.28.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:45:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/9] Organize the SMMUv3 invalidation flow so iommupt
 can use it
Message-ID: <arrD6aTjENIsa4sO@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124556_326730_1FB3FBBE 
X-CRM114-Status: GOOD (  21.90  )
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

On Mon, Sep 21, 2026 at 08:55:08PM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table, the precursor patches have been merged now. What's left:
>  1) Organize the SMMUv3 invalidation flow so iommupt can use it
>  2) Use the generic iommu page table for SMMUv3
> 
> The first patch should ideally go to -rc
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> iommupt has a design that focuses on building a single iommu_iotlb_gather
> for arbitary batches of map/unmap operations. The gather uses the free
> list and it captures invalidations of tables, leaves and supports mixed
> levels.
> 
> The introduction of PT_FEAT_DETAILED_GATHER provides some additional
> information that is useful for ARM: the damage bitmaps for the table and
> leaf changes.
> 
> Prior to switching SMMUv3 over to use iommupt prepare for this by
> reworking the internal invalidation to work on the same data format that
> iommupt will produce. Bridge the invalidations generated by io-pgtable
> into the new format. The conversion is simple enough, io-pgtable generates
> invalidation operations that have only a single set bit in
> table_levels_bitmap/leaf_levels_bitmap, so we can convert the io-pgtable
> provided size into the proper level leaf or table bit.
>

[...]

FWIW, I was able to run dma_map_benchmark for 4K & 2M 
(-g 1 / -g 512, 1..256 threads) and I observe no change in map/unmap
latency vs. base, no measurable overhead on the leaf unmap hot path.

Tested-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

