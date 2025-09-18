Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED4CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ58dO+1I87k/f3wAGOCqHAx9cniKqhsCWw2XyHWtgM=; b=Up79MPyndsng29bdXeTIxSl888
	amEI9rF1taGvF4yI71VFGQv7sgl3JlJoM7QvWv21OHdmWTi7h6Kj/+mCsRZlAxAexu2K1TRFa43ts
	JjC6naPwt1tuYxJCjaKeLd3sZMO9Osz3OcYy1KJTsyyUxln4q7bVxx8Z6bAh9djyrHAnjfUFd/RjJ
	0/Gl6PiXBqIP9b1fHZ7u1zkeR1w8Cr3RnFMWUs9Vg0owige086lFTDLJw51xKy5NoZXFUKl2Rl9Ls
	uT1jSu1erIsaN5I3DGYl+w6jdCMlGUlk5+pIHqt21g29QqAgvStrf9YzUMnAad06woNkF/+WioiR7
	IQZTA7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBqu-0000000H3g7-3Qtp;
	Thu, 18 Sep 2025 10:27:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBqs-0000000H3fH-1ARr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BA3F401A7;
	Thu, 18 Sep 2025 10:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E21C4CEEB;
	Thu, 18 Sep 2025 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758191217;
	bh=sF1A73VvtGB9XaGt3W5JSsV7eemrEK6rpb1l1Er5U4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1zzuGQ1IyAP7rN8bAjxPCKuWxBOVPFyVgQbmSYdk2+6ldtbIGKD37s5zjPh0ka59
	 aFbSJKmPtZdoKfRTA0mKqVi1GpzqDCRJOtfiydL6CrKEQIXbFVD70NoxxUXh5QPl+b
	 4mcyZJtPnH7kqeP2PHfd2cs6QK+BNXP/BPIZnpE/7cUoCcbt9oSF7/xL9MBfdXbs39
	 7kmLXBYxcUJ3IopLad4+yYTRKQSf+rofLzeNxr0I7KjCbyk9u9uAmB99gdwheRKMGZ
	 yK5RkO33GDEah89sfUAcURR/s2QkRm48D/+zOMCB5D3J6c4BF0xNkuAafrnSuWY7lc
	 zZAN3WiY8ghZg==
Date: Thu, 18 Sep 2025 11:26:50 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMveas3QWXUk6xpm@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
 <aMrNTny9jgZJd_Ef@willie-the-truck>
 <20250917151612.GH1326709@ziepe.ca>
 <aMrS71vQ_MaVonzi@willie-the-truck>
 <20250917155931.GI1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917155931.GI1326709@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_032658_334072_A22E4263 
X-CRM114-Status: GOOD (  11.62  )
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

On Wed, Sep 17, 2025 at 12:59:31PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 04:25:35PM +0100, Will Deacon wrote:
> 
> > Ah right, so the driver would unnecessarily issue CMOs for the structures
> > that are just shared with the hypervisor. At least it's _functional_ that
> > way, but I'm sure people will complain!
> 
> Yes, functional, why would anyone complain? STE and CD manipulation is
> not fast path for anything?

Won't it also apply to cmdq insertion?

Will

