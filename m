Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF3D2F02C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XuNWvBJUYaIOmIzpA8BuMoQZhRZt07aDpv0FA02CMk=; b=fn5STcwF6oLqesE11kx5YvsUJJ
	gWlpd300QIr8eml1Sih4bv8v7PUVfdTlRRILvW9rChb3VMDv69DySP7OwBb/rxDGScXZXi3BnZkUh
	f0or4z152qKx+VHVHxLPbbwl8+NGC8mT9gSaTtsryN5XXJfz4XtzjUKi2j+rM2B8uP7KnycdIbUwE
	IylMi2Ao1xnwCzrRs0HkoUjj445XPqcjlotKkAfDm13YMvShGRBNZWej0Qi1eM8VaMJC6JG+o0WdT
	kYx53HLDj9gOPrgFw0OCB74h11LlaqOyYMaVVChzHfyonv6sw17XLpnUpTYKsb2zG0MX3hYgiRXGq
	vDwF7p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjGW-0000000EJoU-0JOE;
	Tue, 27 Jan 2026 13:37:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjGT-0000000EJo9-0XSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 807D9418CA;
	Tue, 27 Jan 2026 13:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D929BC116C6;
	Tue, 27 Jan 2026 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521072;
	bh=CxMYKCSKw2QE4poORmA1SK+NSJK5nohfykCt6J2f6vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArLQaZsCjh7QGKVXWREIP5FBsspCF0Y1Kd/rsbF4FUqeIJT7Qb+5+VhW4rrZsSOQU
	 829gFp8JfY11+DBpQ+bhdyWjyG0eo08Ee7FcjrSIUZI8YYZtrr6rRnqTyHF0pNMHsA
	 oSP1aICBL1SFdChwY2r5uf1xE3MmmILT9IJJHcMydIpfEZn1LT+fUNtGUNQhaApLoI
	 wOhKBhClRmGlyennBmq7MVkZCVFo84K58v2RsHFxnyI5KL+8QLteyQQGpX5mvnHNHA
	 0+OOJNFaJo7kRYeTYz2OEe9m8wLRwZVHl9xFhyn6vKrdYnhNflMufRWgCCpmrI5UsS
	 ib1xPR7D27czQ==
Date: Tue, 27 Jan 2026 13:37:46 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/8] iommu/arm-smmu-v3: Introduce an RCU-protected
 invalidation array
Message-ID: <aXi_qqx8oNn44UbS@willie-the-truck>
References: <cover.1769476588.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769476588.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_053753_210500_E9B29961 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 26, 2026 at 07:09:11PM -0800, Nicolin Chen wrote:
> Changelog
> v10:
>  * Rebase on arm/smmu/updates
>  * Add Reviewed-by from Pranjal
>  * Fix typo in kdoc and update comments
>  * Add dma_wmb() in arm_smmu_write_entry()
>  * Drop free_fn from arm_smmu_invs_unref()
>  * Replace refcount_t users with WRITE_ONCE/READ_ONCE()
>  * Verify num_trashes in arm_smmu_v3_invs_test_verify()

I think it probably just slipped through the cracks, but Pranjal had a
concern in v9 about the rwlock not being irqsafe:

https://lore.kernel.org/r/aXND9YJTwm6om689@google.com

Did that get discussed someplace that I missed?

Will

