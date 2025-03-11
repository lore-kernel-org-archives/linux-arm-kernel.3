Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D95C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkuVeKxG5j9sNHMq6du/tBG6qbpTHgVFJUKK29Pl5IU=; b=Pm8BD/jxI9jxtBj7ISkOQtV4E+
	JY8asOIi9rhge/SjRxAcisgbzaJiM00wSKsWh/lZYLPC9K8zlRYrBZp7ZRsvxxHnV6O7vnChAxokb
	pkDQJMtmz3TtkVmA6+c8U5AkvOOisTYs27LyjVkQ5ZgA1BX/Xjed5m9h/7/739rR90ygaNyULu+el
	DB5BV3jd54QlXhCpV7Lhngz1sEZ57eh18d/ChQx1gPDCYB+vm/88/RgtfqfPUdcYULlG3pGyUwewC
	P7uuypP9qsxmdWNsj1EYtF/I/oufBagKl+1w1P29BktZY+agBDVguz1rBP+/DM4JR+fC8Ur5PHfOY
	RNF/turg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts203-00000006G3J-3ho8;
	Tue, 11 Mar 2025 15:58:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1xj-00000006EcI-1lI5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E5A2A45DA1;
	Tue, 11 Mar 2025 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E2BC4CEF8;
	Tue, 11 Mar 2025 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741708570;
	bh=WOD9YXSZJSsUah42YQG9e0FFUMU6LOcUUbHhH1HrEIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBQQntQA1R+j3qafaEL1jZtkhTsmjlsv/zv9uSVqkUw1X4hLlQ6kBf3bRWEozlIUa
	 EqR9O4ZIdtinIIaddOnR7M0YqWEv+rU84w9pt6dTQUk/2XLLJngY7q5T1x7Us8h+gq
	 b1IR6RNoH9miWzGOEAujHc5vw8Bd6f4KxN4x6//ID1kvPRHeYHUG+9Je48tSpohuLb
	 1UmgashYH4PzfVY6JMn1V/1RymsT2SRu9SoWM0G1N1rv8ksb5I8QEXsq2hBLG6GRSH
	 bbPTRAlXtTOMYZv9u4O7lsmj/lzHhvaMA0Tem6wlMiPFfNVEfOzTa9kdlJlkfa7aG+
	 9Ad00t9hyTP7A==
Date: Tue, 11 Mar 2025 15:56:02 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	praan@google.com, patches@lists.linux.dev
Subject: Re: [PATCH v8 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <20250311155602.GA5138@willie-the-truck>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f465dd9defdc0fc748c2fa2cfc829e37778a4ced.1740504232.git.nicolinc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085611_522152_B5CD90AF 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, Feb 25, 2025 at 09:25:42AM -0800, Nicolin Chen wrote:
> There is a DoS concern on the shared hardware event queue among devices
> passed through to VMs, that too many translation failures that belong to
> VMs could overflow the shared hardware event queue if those VMs or their
> VMMs don't handle/recover the devices properly.
> 
> The MEV bit in the STE allows to configure the SMMU HW to merge similar
> event records, though there is no guarantee. Set it in a nested STE for
> DoS mitigations.
> 
> In the future, we might want to enable the MEV for non-nested cases too
> such as domain->type == IOMMU_DOMAIN_UNMANAGED or even IOMMU_DOMAIN_DMA.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
>  3 files changed, 5 insertions(+), 2 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

