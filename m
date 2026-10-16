Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C4CCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcPINE8kLYO7ad2h8AzZJW55DUCIX7EGWisyHohuTdg=; b=TQhrHKrFzCKpekr9l95wRtU7tQ
	uoQBvHyCC9MX1PMcb2IDyNruCn3hFGDYJEu+enSgW3rdqhXyX75H2Jn9WY1YHsR4Tj6fqfSXOsLN4
	PIiyBc+bIuTEqSzAC/JHBpQu89zDIeMQiilMgt19VDzAT4wrpNcdhdPqCLYkcsuCoynjis9xFgdsQ
	YugS0YnT4Kk0SSIxvCsn3FRSW+ki7gp0vGG7qjVCNtsCpoUqMMu3Tu6WU7qIXS8nfmSYSogdGBbww
	7o137BEhJHbqKUbO7FmMT6iJky0vD0MQFGtp+8OkXhagW36iLanhZgExVoxEZErxtJISDoxsyCvfe
	vqkFnQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmJ5-00000003cfG-0nG8;
	Fri, 16 Oct 2026 18:05:27 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmJ2-00000003ceW-2Oj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:05:25 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92ed3993c1eso17187685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792173923; x=1792778723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bcPINE8kLYO7ad2h8AzZJW55DUCIX7EGWisyHohuTdg=;
        b=A8ez+q1HQLTacW7je6Ofc1eB26r/vAbdaoj9Y0aDbODWr9jABT1bsfJdlT6GzpqUJy
         pU3rQbEEksyGfCgiF2E707xbNnuuH4ns5tT3oe1SAPCVGPgdim99170GwWcvTSrmud7w
         Z/eEaJ2PsYrv5hwbyo30iTOL/M8xbkhjNHqhyv865HINOq6fzFyoMMhRRQS5LWGJREdK
         puFZu0m720uXmDZS+G3sPdzP7Qh1C9kuTChzTxqR2gsvDp2QqFzN149tVi5tFSaB4Pd/
         JoD69uhuLZgPb4BjUURwkjpjLavp/Xg5tJgz3fSX0GBabsniZDkXpQ6z3hBLeWbOctVK
         Q/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173923; x=1792778723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcPINE8kLYO7ad2h8AzZJW55DUCIX7EGWisyHohuTdg=;
        b=pnhLXwKSy43Dp1LvUyRTv/u8c1ijAihiBCQI2cD2h/g1CcrenanVifohq6MVd1jM6y
         Zhjb+jF0+VHFjci3fkXQiK3g8XVgplmpUyrKY40oeReIo9QUIL2rdS0d8g/ebLcLa63O
         o0IuCj6cKvj5QfrBhsxnxParhgxzsqEVoLMFfFuxkESU666gVoD4nsgcsyUr+HRBSmAb
         Tojm1UmcObqrNkjID5aopIiP7XgEcEP2M+aJCyIubK9OYuBWHoyA5HKXT2d5LOuMBObo
         lFIwSYvndCvWVyl2ooteAgYh4xOwKnLDYoffpWQ0pX4/TSBfrA4mfRGXDr6AS+x2G//6
         6l2A==
X-Forwarded-Encrypted: i=1; AKwUvByR3P60VS4Zr1Bv2rS9gWZ8yb2b4EWilR+6KIlJ0xp+K3SZshc8wq/pxYYTMpoVHR/98Kj3mWcTwSpRblPG4Bp3@lists.infradead.org
X-Gm-Message-State: AFq9FYIlXveZcyo+DuUpS2xTAp/UbMBg//3cuMjC1M6iASRU16pvGRNC
	KmjDNXNdHOtItr0jCVw90cWm9R81xzYzf5WfUQ8YDdTVJ58v4h5gmwo/uqRc4GehvNXjCKd3LOB
	TKjpU
X-Gm-Gg: AYBFou1FrDEVKjiuakVibJNC2Qe0siSME5cKbVRandmA2K3h7NPvME4GCyKxKZTZCgZ
	K0YzFaifafs9VlCPMPHfZeOOh367jw8Owja4+fnAu3Wnj/h2L5t0GJpGcbJ6UnTD6gWb38rC76/
	fmzLDt0E9VFRTO4kziS8kvXeYQMMa1r518Co8qXqUSoud1hlRVOgiVNPzoP90HdTuHhEeuzGyi5
	/XB9m9gsUHplVOaxkx2YWsqZ3cl3vtbYc4bAJWwGRPwz/mA8W7ybtvyQZ3RUM6uRpAzlyHXLi1Q
	X1EoQ/UCZ0m4esJwGrtopq0ffq5SILtwmt+0kvTIU8t1HVEn/ZpgxQ0IWmuMyATHlXUoOeuDI5Z
	isekDctn7EvgHVnZvXd75fsa/cpYZRhjxNjoquOV0tQdzJInBoHSIkXeurpmpsYlNiwIwGgmWpn
	nKNFnGqYg5qZkddwgcmAi/HY8iIKphxP+h7sEHype4bTsomK8MDpTBQMUXPRzA6f+X1Ab5mYmz8
	QoP1p8385WxT0hEQYqm7zZ7U+XOGiFZbN046TC3JZJBu6jEcZ2DshRJIzKN8WrgcYQ=
X-Received: by 2002:a05:620a:2990:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f29d69e08mr105371785a.53.1792173923072;
        Fri, 16 Oct 2026 11:05:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f23eb7ba5sm131256785a.27.2026.10.16.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:05:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHmIz-00000002FIM-2VOf;
	Fri, 16 Oct 2026 15:05:21 -0300
Date: Fri, 16 Oct 2026 15:05:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dawei.li@linux.dev, praan@google.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
Message-ID: <20261016180521.GJ14213@ziepe.ca>
References: <20261004195027.227748-1-danielmentz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004195027.227748-1-danielmentz@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_110524_619720_A99D506D 
X-CRM114-Status: GOOD (  17.22  )
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

On Sun, Oct 04, 2026 at 07:50:27PM +0000, Daniel Mentz wrote:
> The SMMU specification defines several types of SMMU-originated memory
> accesses, including Stage 1 and Stage 2 translation table walks, stream
> table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
> fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).
> 
> While the memory attributes used for Stage 1 and Stage 2 translation
> table walks are configured in io-pgtable-arm based on whether the SMMU
> is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables,
> CD tables, and queues are currently hardcoded to Inner Shareable,
> Write-Back.
> 
> On non-coherent systems, however, memory for stream tables, CD tables,
> and queues is allocated via dma_alloc_coherent() /
> dmam_alloc_coherent(), which provides CPU mappings with Normal
> Non-Cacheable attributes. Having a non-coherent SMMU access these
> buffers with Inner Shareable, Write-Back attributes results in
> mismatched memory attributes between the CPU and the SMMU.
> 
> Configure the memory attributes for tables and queues in
> arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
> ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
> table walks:
> 
> - In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
>   SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs.
>   This applies to stream table accesses as well as queue accesses (CMDQ
>   fetch, EVENTQ write, PRIQ write).
> - In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
>   non-coherent SMMUs, while retaining Inner Shareable, Write-Back
>   Read-Allocate for coherent SMMUs. This applies to CD table accesses.
> 
> Assisted-by: LLM
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Daniel Mentz <danielmentz@google.com>
> ---
> Changes in v2:
> - Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' in
>   arm_smmu_device_reset() (Nicolin, Will)
> - Collect Reviewed-by from Nicolin
> - Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.3532247-1-danielmentz@google.com/
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
>  1 file changed, 27 insertions(+), 10 deletions(-)

I think this looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Did you check the spec that this is every access? I remember there is
a table outlining every access and where the memory attribute lives?

Jason

