Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D5CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESKXExJLIuE1yoebiA/ue+cSaONVpwchtGyuhY5cYRs=; b=hoMTpDRrhk+jxLSyBFy3K3U4r2
	GBXLpDd4yXNuIK/c4IouXHTI2jbqM9cWklIc+aevNgDpgR4AXP3wYDfRjMZw8ysrw+7v8cojxP8/3
	3+CoN0j6q1MeACXNYJciiA2lqSO4a+GWKEDgb8FwLEsDcdP06HKS/agTUXA74e9X0AE5zSBuCQ7bl
	GU012z74siVAVsrzTUfxuXb9GoTVJUY9NT2euat3oYNd8yQVshfEiQcZxQ5L7MI8xnrHSderN6ztG
	cSsvogMegSZ9EWjx6RpuEjTSJ6VZL235hfnn6OTJ4Gt3gyLYtjYHeneChWxNDZqHlvD0r93Cb6fHH
	1rrvMS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLc0-0000000Eddb-3bWN;
	Wed, 10 Sep 2025 14:15:52 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLby-0000000Edbu-1wbv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:15:51 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-80e2c527010so395438485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757513749; x=1758118549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESKXExJLIuE1yoebiA/ue+cSaONVpwchtGyuhY5cYRs=;
        b=KMPTL3cBGsEhTGw7wOkrAlRiWtesMmleJqA6QSbATYsFojdIEDZf/k6EHOtq8rYDk3
         /MLx3iGih+Y3kQKK2f7XJDurQNWTDky8YQtlobtQXPTih4W6KkCjuUpDOGTSq75bKWxK
         0cjg4zYXUdvK2j+Qab4uKil2sdHmo8BjhJ00Y0kwGnSIZ8iL32pOddlsrgBCriB3weqc
         SN+qXi2k5r3nEOw9M7nf4oRGGMk3UYK2DRBd+RxoClaKinUh/dGaelbJ32+RxU1N9Twa
         sBHC/sZ66gvKhxlo9jb2i6wVZzruYCvLVyv5lJTQ996TPY9l1b+xry1mRyOevMERGOGu
         XP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513749; x=1758118549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESKXExJLIuE1yoebiA/ue+cSaONVpwchtGyuhY5cYRs=;
        b=Jjt8Gwi5S8U+nQuIG/5bfWQg2reNnDONe64lz52FjxNGnaTj/fYqm5bNOAgb3V9Mzo
         GILYfQW/9L9dkRmXVb070pgQKi9B28Kh8usfakOaMhZ6uXVtUWugHtj1HtgjYe8UHW0Q
         oMbZyi0qxqymwn7mabUCsLqiT4m5Cb3fe2x/eqObJvqiNzUAB1x5RiUCQ8zyt2AxHbru
         4lidul0zCWLHCf5VUTA/mHg8TXNp/1a5EzD1v4lk6+8gqE4vRe9la21E7tRuP877oxNn
         0hAj10M0+Rmxs5sFU+SATpMe2g9Gzn76+L+BSx7NBrxaFBAqhqtf0GY0sqko+TjeexFA
         83ww==
X-Forwarded-Encrypted: i=1; AJvYcCWsKHOcO0L2cQrRcEnmdNuvlXljpzijgLxOkp3wFodxSKeHqC5SJcPIWWjwVTPA+JiGmd/yT4TVt0FzLooaeoWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyMDRJ+AUt+js2oXpMwHvGwtUbQjtLz7U2VmXVwALZCuKPhMVVO
	7Mp2LuVyIGlQS9+QBhxJxVhLYa4qk4xrZ9boMgDtkvxeTZ2dFonNycFC9J7FOq+/jhI=
X-Gm-Gg: ASbGncv4u8AqKqU48QHUI4jjBib3hWAqXZx8WF1srfg8EuyflSEDQjI2eJLl1eW1pOh
	t7w7kgXAD6irVqOwTbvpC4BbUPbWoQzZWBIPadeSvs6PK5kAtsfOEH3pO/33dntc82exFOgVqgj
	q6HNBPSZEJy8MAIVafK3wY9osG5/oEJKGWAYgK6kdda9ZBaYAauFWnO+KOpgVWP1lWJ1vM6mP2Z
	gMt73pOaeq/C6TW42xIlqiK/4eVBalldrEq3PGbkNkM4UL1y4+tEwDqWc4x3XCG13IEl9DxGsSx
	SBE1RIqwbwoG+djrAv9eGphPGCZ4dKkiGDn59ltteFo6anbQpCAMsB3d0mR7XgvTYi5+k4pR9yh
	Hr+vtRkSFANZU1AcYB0FOhZie+PmFcQeOmcVJQQoEZfBku5N3y20rH0nxHuBG0qCqvCvynUj1b5
	Ho4iyftto5Yt+h7g==
X-Google-Smtp-Source: AGHT+IFfyhIETCUrm58is+DJKy2K1cA7/NQr1D0/v2K3gk+WAtxi+xyNq/8bDediao12ZQz9GzGhAQ==
X-Received: by 2002:a05:620a:4515:b0:818:2b52:2315 with SMTP id af79cd13be357-8182b522920mr1251451085a.49.1757513748711;
        Wed, 10 Sep 2025 07:15:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5a359305sm292432785a.31.2025.09.10.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:15:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uwLbv-00000003rnA-0eIs;
	Wed, 10 Sep 2025 11:15:47 -0300
Date: Wed, 10 Sep 2025 11:15:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: will@kernel.org, robin.murphy@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	yangyicong@huawei.com, wangzhou1@hisilicon.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
Message-ID: <20250910141547.GD882933@ziepe.ca>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250902161028.GC184112@ziepe.ca>
 <f2720f17-5e81-4f69-aaf5-791b47973178@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2720f17-5e81-4f69-aaf5-791b47973178@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_071550_614974_B3B30DD7 
X-CRM114-Status: GOOD (  12.01  )
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

On Wed, Sep 10, 2025 at 11:20:08AM +0800, Qinxin Xia wrote:
> Ok, I see, my colleague Wang Zhou also released a version of io_ptdump
> a long time ago, which is implemented in smmu debugfs. Will recommends that
> io_ptdump be implemented in a way similar to CPU page table dump. Using
> debugfs to expose the data and using format-specific callbacks to implement
> specific data dumps, I'll talk to him about this as well.

I feel we should have a iommu subsystem debugfs and per-iommu_domain
directories to dump the page tables.

The smmu debugfs can report what iommu_domains each STE/CD is
referencing.

This also needs RCU freeing of page table levels as a locking
strategy.

Jason


