Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A876C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBQQJi6WU1bah/DVQuUi6FKVvLm89ZzyfdYAUPnzobo=; b=VnuQyQiGNGWqRjl3+cy0lVcO+M
	rNzh4bJmXUSigDwyKs3NtXkswKcuw37mjalOYDpYpbE/ndIdAgt9BpI4TP9ROjgNLKfe12+C+0dq/
	kRyVHObqdNlF1Rv6ogoOBAbLe28r9fj0F9hVXJ0TPcTk738ekK/byc5U8hOFNjqmBEFlK3W2B/q6Y
	Ed9Iylt99oBGArLudZEwc4vSpJC1/8CF1XduINDywyCG3qSHpGon72Y/VIYXRQKNmkGsbCf/APX4c
	FTs8mjfvwjC34m0lGi1Qdjzpm5Ym2210w0CKAVQ/26yXE7GZuDK4H66lvxf9/l8XGsVgX8rw1q52+
	NwOdhsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CbD-0000000BTIi-3Bws;
	Thu, 17 Sep 2026 13:56:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CbA-0000000BTI6-3V2a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:56:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DEA61476;
	Thu, 17 Sep 2026 06:56:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDD73F7B4;
	Thu, 17 Sep 2026 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789653383; bh=cGE2EkalOjii1hGk7CCGEF4bxsitAjnoF4GCjMn4NIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7QaN8q/Mp6bfa0AwDVKGRPBV4gcPWlP4+59EpoUDwCxhGUnlQlmBkXOXkCcd0cwL
	 UncUueYSTPHhmqDFRIKpZ2gbeAHG/ywbMPlOCeKtVAiawqgZIGoToK7dYkhWKXZVUu
	 aOAxtL2+YJNombE8jY84/F4dqALrCg6F87cXUPkU=
Date: Thu, 17 Sep 2026 14:56:18 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <aqvxgq2VR8XX-u04@J2N7QTR9R3>
References: <0-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
 <1-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
 <aquxuBnh6pdxu4-8@J2N7QTR9R3>
 <20260917131601.GY3968357@nvidia.com>
 <aqvuyse0hmNCGJqt@willie-the-truck>
 <20260917134753.GD3968357@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917134753.GD3968357@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_065624_915811_9E25DED3 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, Sep 17, 2026 at 10:47:53AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 17, 2026 at 02:44:42PM +0100, Will Deacon wrote:
> 
> > If we can do that without churning the driver (looks like we can), then
> > it's probably worth it, but I wouldn't be keen on churning existing code
> > for things like this.
> 
> Okay, I will churn this series then..

Thanks, and sorry that this feedback was last-minute.

Mark.

