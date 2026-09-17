Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIT7gK6myMlC0MkhhrFdGW+pdZ57n54Ge/impHw3fJI=; b=AN+DDYwSbOq5AXEWbPrvICSrRP
	bb4gmuKRM2dXpU/Uc2WQf+NQYP8tY2lHuH/W7OK1W9HBb98VGse5U8cGZpQ5zaK8iII6o6aGhRIR0
	k3gkc0M54i3/rnsMm7e9tHC0U+30bm2ai5+OJCI49uvRNAvz/94vqdW1KGKXhhLTDfL6CH1qgX4C5
	fRyDEte7aUeG6WpydnVCwn+D19vCVJGLrFsLELFGnB5GlCBPCYnJh+JoO93PpewmZimxv7LpUpv2+
	uXq8k1EqiwATg0lpm3kpH02RXOjccKNm+xoKmsdwC4+wvjtwlmxN+zYh9Ad25D3ExvR44kXhsXpix
	clPqS73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Lt-0000000B03y-12mm;
	Thu, 17 Sep 2026 09:24:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Lq-0000000B03E-1jO5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:24:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 916F41476;
	Thu, 17 Sep 2026 02:24:13 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C313F7B4;
	Thu, 17 Sep 2026 02:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789637057; bh=sIT7gK6myMlC0MkhhrFdGW+pdZ57n54Ge/impHw3fJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7GdL8vsGKEmaHpBo+qCZDuZPOa023qP2/nhUH2BJ4KcPpmnDmpj3kiwXlwm2J6gl
	 U2T14K+mz6GUdh3g1YVTF+ze9PPzmY86a8koarA7M/h2I/iyGS9Y/gWaekuiodFmM8
	 MIaWPPL8o5Wibq6sTWKEvcDyq8MV5L3te6jCQL7U=
Date: Thu, 17 Sep 2026 10:24:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
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
Message-ID: <aquxuBnh6pdxu4-8@J2N7QTR9R3>
References: <0-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
 <1-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_022418_496261_8396D6D4 
X-CRM114-Status: GOOD (  11.09  )
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

Hi Jason,

Nit on terminology below.

On Wed, Sep 16, 2026 at 09:27:42PM -0300, Jason Gunthorpe wrote:
> The erratum (MMU-700: #3777127, S3: #3673557) deals with under
> invalidation of a CONT PTE grouping in the SMMU. The recommended work
> around is to use a Range Invalidate (RIL) that spans the entire CONT. The
> only user of CONT in the kernel right now is through SVA sharing a CPU
> page table that contains a CONT created by the mm.

As someone familiar with VMSA, I've never seen "RIL" used to describe a
range invalidate and I think using that in the code below is confusing.
I *think* "RIL" has come from "SMMUv3.2-RIL", which is the SMMU feature
for Range Invalidate *and* Level hint, where "RI" is Range Invalidate,
and "L" is Level.

Can we please spell that out as "range invalidate" or "range op"
(matching the arm64 architecture code) rather than "RIL"?

That'll be easier to follow, especially as nothing in the code mentions
what "RIL" means -- that's only mentioned in this commit message.

Mark.

