Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D4D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyDxOQ8Lw5prQGezJfzgyKDZ5+VnUcEleF9/ih+sij8=; b=pPpfM15RmFCYjagOM7jftLM93o
	QMm6/G9g/oAnDIRGU6373lsxdifkAZOkFOTMY3PUqwgQnACk21tEixrT9Mys+K9Sf/nCpb6tY7zRU
	nYUqOkmzQHAwe5v8bIyPkP1Vslaex4Fbq7e0j4ExcA+GFw82q/gqiCmaSe+BZcnw7VO1BiYWkyK2z
	KVzMwVBU7E1nY4a5Jk7pxjCt8a0RP+FuFBOasr76XcYjUdVS/bl5bS/+j+ea+6mFYJYYZO7LxR1+E
	+gvN5a7zom4lq2/ETw8wQAQ/5FxpPujcqPzV6vFinQfpmRwnjv5Gz7NmqkE7TB000YPFN0DNf+lKD
	wbqZI8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1ca-00000000eHK-2KwW;
	Fri, 28 Nov 2025 16:47:00 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1cX-00000000eGo-3lli
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:46:59 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8b29ff9d18cso185366485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764348417; x=1764953217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyDxOQ8Lw5prQGezJfzgyKDZ5+VnUcEleF9/ih+sij8=;
        b=jPYSGtvKXKiGw+Uhzm+2gqI8XmFMjl3zLECXoWC46w111mOqXURdKGF1r5gpJU/59O
         dw6XBsuD+E9squqx5jbNPKerOatExkEHoLKzSVOB0kmgCU5B855gIiYp4kJZ0sDTMoEL
         lFlJlMK399HFA0dQEwiP3L/g2dsPhWJSrXp0bU5p+12nlSHIWCDRROnhoDcHINd2r5DN
         33U05mWjnPoliEusaf8Za/rj9+2097C9ZRyybGqr+YDMVyiIFE8yydBMSoPjCTtgW6rq
         U5rKEhaLb+uyzSTj51j2L1vDdZRviELcBuQLGFF6v8WCUcMmV1KNRsEz4MJ6pbJoAcCu
         zvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764348417; x=1764953217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyDxOQ8Lw5prQGezJfzgyKDZ5+VnUcEleF9/ih+sij8=;
        b=QGEcSDBBPhaqaVYsSSHL/Qm86HPjHksqI3G9i+3k0j5oTr0rANxXKXxbF/JsU5Vui3
         XcEnYCFn1ZChRdVTV0MEHItMpHKzlFKFOfyYCX/cVyd6jMP9NJmfQO3W/F3bhSJZwfjh
         UJ0N7Oki3qZ1mb7i5QVMdnIb4n/SMTkdSueNNticPOkWBvYfhkLclB4ztFxOpA6LkgJH
         VebxlDdoCjd+QfQpdF4jgFsk2HTAtbTLcIbhuocjval24w9KEX0497/ZMtJzOnQDdEMX
         SUaXMTBfzWeGAzjIKl5HQxq6DllDpfDmhZKX3VX9yRLtt49/tok3Z1Ywnq+jUm1w0Ktr
         viEA==
X-Gm-Message-State: AOJu0Ywoif5xKlYf5NxYVPQpLzr0eLeF9JNF8M0BWMSPJWaQjdFvluvv
	QF1KrQp3QxpMdHDNLj5j8xmomDc2kYfqA+Cmc+0HM5zd9qlCHGR32sTTt/BZyK60TW0=
X-Gm-Gg: ASbGncvYiBLTuyBcj8tQC90sb1lzLW0QET70bnSbKElh4xQmw3hQUY9xHgiKgBXpGaU
	up4SFE+ymahL85cy8C46F/MXeE15TsMFQyJztp1hiCEmX/bKcUeXHCd8ZJGfCgXqkH0F8/il1W9
	QyRUxbE6MXkCgZoXp2XHu0m13w9JJeOsndSOJrgvW88csVi10rBMKq3LgDH0bXJAUxU6QIF1FBy
	+WMAldZYRSaSe1CQ8TO5Mt0LkFtppPV2ee1tfZvaAkrIzD9/eHc7nwkSg1bi4KUwZnyj3RRUI+0
	JfVU3Pk0ukYyXTr/ZWZOucE0vlQOqm/nrrKqJk++q08JUrgSFbrcUWB+7KUCqgZJqxN8GEwwBHb
	kDs7oExEPjj9HgdIUMiXV176hT8QXPRCQFTLPHVqxv3SvfrhJ0POQBOjyW3Zxs0O8DJsaP7J9rQ
	883JoyW6hVIrMlWFtcL3PHF6VJ386eunW9+Wvljm0mKJe1nZRULdhsQnAZMkN54+GLb0U=
X-Google-Smtp-Source: AGHT+IEp5YYm0eW3jhapM8OVullA+b9CRrzLXKAGXQfH68FS3XEeNccrfEDUvP/XIE+WOdxNSzgv+g==
X-Received: by 2002:a05:620a:4694:b0:8b2:e986:26ff with SMTP id af79cd13be357-8b33d469db8mr3847315685a.66.1764348416499;
        Fri, 28 Nov 2025 08:46:56 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b6591sm338772785a.30.2025.11.28.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:46:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP1cV-00000003Pw0-0IzM;
	Fri, 28 Nov 2025 12:46:55 -0400
Date: Fri, 28 Nov 2025 12:46:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 05/27] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <20251128164655.GB812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-6-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-6-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084657_937881_D9D3FC92 
X-CRM114-Status: GOOD (  11.16  )
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

On Mon, Nov 17, 2025 at 06:47:52PM +0000, Mostafa Saleh wrote:
> The KVM SMMUv3 driver would re-use some of the cmdq code inside
> the hypervisor, move these functions to a new common c file that
> is shared between the host kernel and the hypervisor.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
>  .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.c  | 114 +++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 161 ------------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  61 +++++++

I would think these inlines should go in some -common.h instead of
arm-smmu-v3.h for better clarity, and ideally pkvm stuff does not
include arm-smmu-v3.h at all?

Jason

