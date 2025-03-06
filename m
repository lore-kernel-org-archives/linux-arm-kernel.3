Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1CBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/sH/OJh0EAJJWkuOYTmkuOkt6T2BK1qxWYk8xKmB1Q=; b=MSJmB8LMV/RrucGsHWnm/BjzJI
	4v1/CO4clXGulEnC5Ramop/ss4h8HE+aDzci2v7yz9oq5Kq4NWXA0BlrV5HG4fTL2xVtNLEWO5q/R
	jDJ0z53+/yLPl7WbG1CMix8YGlJ7u74080pS8uKZQseIod2XY3/77iGGviZSDTjDeZJk+szzZ2q1i
	yDHRzwcg9OdcGQMdjI27pMpW1F3y10AaV6NtU4L9gQdnZ8cg68uKRMj+BBtBscxNrOZlYlU2WTRA9
	LBEAQMSDoiupLf1TLqTOPSbT4DAUTVPex8M2c1NYLkptek+shiXrmm0lp2uY0ac/EPft6PhXgGchT
	U9PG4nvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFer-0000000BoLJ-0l99;
	Thu, 06 Mar 2025 18:09:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFcR-0000000BnlC-2tkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16BDF5C352B;
	Thu,  6 Mar 2025 18:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51837C4CEE0;
	Thu,  6 Mar 2025 18:06:47 +0000 (UTC)
Date: Thu, 6 Mar 2025 18:06:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	maz@kernel.org, steven.price@arm.com, aneesh.kumar@kernel.org,
	gshan@redhat.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 0/3] arm64: realm: Fix DMA address for devices
Message-ID: <Z8nkNNR6vuoQ9bQD@arm.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
 <CGME20250303113525eucas1p1099e087e2c11b9021603a6f13f8135c4@eucas1p1.samsung.com>
 <2b6d5287-bdea-4ec3-a07f-986bd3c3b285@arm.com>
 <7b5c90cf-00e4-4684-8719-f380badab064@samsung.com>
 <7ad365f0-d335-4da1-845a-8fe3bc5eb055@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad365f0-d335-4da1-845a-8fe3bc5eb055@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_100651_785293_A0B231EB 
X-CRM114-Status: GOOD (  20.43  )
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

On Thu, Mar 06, 2025 at 11:39:14AM +0000, Suzuki K Poulose wrote:
> On 04/03/2025 13:40, Marek Szyprowski wrote:
> > > On 27/02/2025 14:41, Suzuki K Poulose wrote:
> > > > Linux can be run as a Confidential Guest in Arm CCA from Linux v6.13. The address
> > > > space (GPA or IPA) of a Realm VM is split into two halves, with private bottom
> > > > half and shared top half. In Linux we treat the "top" bit of the IPA space as
> > > > an attribute, to indicate whether it is shared or not (MSB == 1 implies shared).
> > > > Stage2 (GPA to PA) translations used by the CPU accesses, cover the full IPA space,
> > > > and are managed by RMM. The "top" bit as attribute is only a software construct.
[...]
> > The changes look fine. However I won't be able to setup new dma-mapping
> > git tree this week because I got really sick has to stay in bed. :/ If
> > You don't want such delay, please merge it via ARM64 tree. Here is my:
> 
> Sorry to hear that. Hope you feel better soon.
> 
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Thanks Marek.
> 
> Btw, this series fixes the "Realm Guest" support for Linux, which was merged
> in v6.13. To be precise, this should have :
> 
> Fixes: 42be24a4178f ("arm64: Enable memory encrypt for Realms")
> 
> Will/Catalin,
> 
> Please let me know if you would like me to send the series with
> all the Acks, Reviews and mainly the Fixes tag added ?

We can add the acks and fixes tag, no worries. I can queue them for 6.15
unless Will takes them as fixes for 6.14 (I'll wait for a bit).

-- 
Catalin

