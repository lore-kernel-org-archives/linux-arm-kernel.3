Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA80CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65cGZDz7HoPxstY7x2L7my2DOQ4uQMu696sLtL8irMg=; b=dxUe0etd4HpwHMh2Q3YRjrDxF9
	kBiu4CAjmnqdGi8ONm73h2WRONCHpagf9Mvyx+/2j5dx8NhtAh09FneGQufF2P25I31KIFMuQByaD
	3KhNRqDaadfNp0JEpORGeqbMf2yjQqLHMri/95cZnmPyMXMixBmOjQjw5JLxAP0IDPTcQEiLXN4Z0
	VmrzoR4vfNcuK1yAaPLXD40tXHGAMjeYG3Ou8+rjViiU9G3YNjKnUqBV5H6Rm1mJG/1g8H24kQZwf
	+J/EDSheHrgZCz+dbMu8Q2bUIaJOA5asjGf5OXrhxetwaI5BMCs5p2penxo2f+I5NBBnVsUeTszOW
	Qj0okHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLH7-00000001vEY-1aqL;
	Tue, 29 Sep 2026 00:00:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLH4-00000001vDm-2HH0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:00:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so9715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640046; x=1791244846; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=65cGZDz7HoPxstY7x2L7my2DOQ4uQMu696sLtL8irMg=;
        b=HqUa+rInQmqEMlYZqja/2C2e0lyu8E4CLV6O0WkMCnvW+RBaWAsBXhqhCK8CVpWa/o
         9xZVTEpwSUdob+FljvOTRRcg3yUXX/duiZ/1bb4Rq963bYR49lWivL24iicqYk9js/aH
         tYy89VDrtVW4ulCvab31RmlODkH/GVn2N4aOCV5wDcGSrrqHCBZomMpLqUvM4qkFlk+A
         rYXmr7wjg4EdDMSqe60KqE2tPq5Hh3Bh+RHnB2Apfbvf2ofDmidJQvlUCgbqL9U1dj4S
         R65Lsk/mIW08zvjtYq0Am2kOCjijodL+lpKD54olJUAJUQQbsGj8o0bieG/l2tLNT7F1
         7tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640046; x=1791244846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65cGZDz7HoPxstY7x2L7my2DOQ4uQMu696sLtL8irMg=;
        b=DASNaNEdkvXfX/zxKw9iYf/ZXehNhC/qhfM758kZ4ZPm0Wrnp0keWPRUlH/PC4evH9
         wqYfxX1915DBXMaQVL8csYmaJl5EOsTqGuV7O5dAzEM4q8GY6cIlKna5SQLfob+v1BhS
         Bxtf5M3kz+XAbIpntFbzFnLcSVpxvkWGcT+8qvmhy0uDGraN+hX9iclnnWya6pysPLDV
         a+mU+fvIsdbZQCstWp64avpg2awIX1vXqqhTK0z/bB8a90NZF3zPvdtIBs3xyD1AhqyP
         AcEKuURQaWgFuHQbtMvi58oA7f5S8WGJbK+U1ml+b29hzV8LJOUYL6ak/VckJrWwtJNB
         mRRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiaouqWtGI0G5AxnhE3rqZHkZhjE4vBsBDY7ClzDakwiyY5KEfHdQaTT8b9bdTLIycQH07cs476YiXNc6Eln6c@lists.infradead.org
X-Gm-Message-State: AFq9FYJbMlceuy3XPwo9ru7hkNtMAaT0vb04ggjRsg+qdQPjoXoy7NXN
	lvyF83q0xDFUWDj2qkL7tM1e9HsF5MxsD4LwRc2l4pceoIxBqaiz6JVPlhyCJsXgJZvi6YW/YJv
	rmoXOjAmQ
X-Gm-Gg: AYBFou3nh96h1AnMEW2wpoV1aTMdxl+sWT5ySPli+haqU4x/H1hks4BOrBHyLkQ5Vc9
	Kj6jb++LuK61LfpiF/F2WAJXCa6tTQ4FdU4JiCZO7+pnWbRPBHfcPUIWpFDsow22dQLwyd7rNhx
	flbMHy7uvUvBuBV/2ISrz+SdBUhTvABdW4aGYHiTjLM5Oj5EhiZ7HEC4EIjzSrJ+8v7UQ9AwITB
	C5vn0VQXwo4C22Wz44X/Esg/v9lRNIGa4Os0O5EDgh+Se4fsuQPlJrvju56kjOGyLspVf+i0aXo
	tSEQH+6CZDSsqkjc5cR2Xx5pGXNlU91vSD/swiX1hQa+LGpqcLBk/y0H7qg5z3XWJfoCl3kHPt8
	msItX3J6MhBMTk74HDqfiHLtFeibItHq32+ebqCFAklhKptdlpwanc9Hb2BxiyyXtbEvODl4yhQ
	XsHppwixghEpif0J3k9F7LwhRhiXoQeLrTTtueYuUiOPOfemEg7dTMcLSWU4TgsyToJ8QSQEXjG
	y0WnfWJCfwlBkuhgNQfP3eIlFPNhfyDP5r6DdiWFxiXzIPHkrCLzgoXdYM=
X-Received: by 2002:a17:903:26c6:b0:2d7:1cc3:a69c with SMTP id d9443c01a7336-2e2c7a664e1mr1000575ad.7.1790640044876;
        Mon, 28 Sep 2026 17:00:44 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9143a3aasm47233445ad.53.2026.09.28.17.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:00:44 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:00:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 2/5] iommu/arm-smmu-v3-test: Fix
 arm_smmu_v3_test_debug_print_used_bits()
Message-ID: <arr_pyGyKNH7Fbqb@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170046_587691_2707EBC3 
X-CRM114-Status: GOOD (  12.76  )
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

On Thu, Sep 24, 2026 at 08:56:13AM +0000, Mostafa Saleh wrote:
> arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
> instead of using the provided writer->ops->get_used() callback.
> This caused Context Descriptors to be incorrectly parsed as STEs.
> 
> Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

