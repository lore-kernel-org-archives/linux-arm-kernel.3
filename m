Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD745EA7942
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8pYXi6g6Yw4GaQ3pl7+YF6one4johfFT7BVCjidNzA=; b=BPuTqDsxWkEPWZLyj54rtoggqk
	RT/D8x9e92uNxJAjgsobf+hh4DTUiSjaaftz9mU6tSdUGN/CEsWLpladw+yQv55JaKjWpWOpkb4pU
	MFZc8+nXNZylp8zwNOVmY/N8F8CAmJdmhhr9Y7iXE+fbRkBx9awn6gl+qLoIdPKS1WO6QNeUXS2v8
	7fKN74/IqgD1ZCfRfR6uizb8DsWFioCtevFySQciVDIqvvNQg05WGB9x3ufRGsdwWZQmFVdOEHkkz
	reR6LlIPi7kUssm7L7dIChNh79N+t4AqU80AThXl/ErQL20mC/iArYtw0b936Gm1OJGQFDjb5jBV9
	FDiita9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhzl-00000008wsf-1pXy;
	Wed, 04 Feb 2026 18:52:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhzi-00000008wsJ-4B01
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:52:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C45B4339;
	Wed,  4 Feb 2026 10:52:44 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2D83F778;
	Wed,  4 Feb 2026 10:52:49 -0800 (PST)
Date: Wed, 4 Feb 2026 18:52:47 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, suzuki.poulose@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH] arm64: swiotlb: =?utf-8?Q?Don?= =?utf-8?B?4oCZdA==?=
 shrink default buffer when bounce is forced
Message-ID: <aYOVf066Fdr9L-nw@arm.com>
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120070102.182977-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_105255_080705_057FE3D8 
X-CRM114-Status: GOOD (  10.58  )
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

On Tue, Jan 20, 2026 at 12:31:02PM +0530, Aneesh Kumar K.V (Arm) wrote:
> arm64 reduces the default swiotlb size (for unaligned kmalloc()
> bouncing) when it detects that no swiotlb bouncing is needed.
> 
> If swiotlb bouncing is explicitly forced via the command line
> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
> query the forced-bounce state and use it to skip the resize when
> bouncing is forced.

I think the logic you proposed in reply to Robin might work better but
have you actually hit a problem that triggered this patch? Do people
passing swiotlb=force expect a specific size for the buffer?

-- 
Catalin

