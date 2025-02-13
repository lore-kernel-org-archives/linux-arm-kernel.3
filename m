Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC671C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVCFtiwujzbXkpW5Uts1EM44uRKfVCoT8Jxt43kwJZs=; b=MAmCAZLWmyHfiKdb8j4Z2oQuc0
	9bfV1t/ScImCnNOF4OI+povNcpgSzkUAWgeM6PSt3AKBmKOSSxk7ldnj0O0Y8+OXv6yXKj6BnecXz
	KbCK11w8Qdcv0jnhUr8JpIMWMoVea/yIsr7CKKXkratqz7wbfl6CXzXwo/FzFHwNMidB+CSBDQ4eB
	xXTDVOXQPgtxI0RK34AtyiCQoJ+pOZVI1ST+m4vLo3+Lw6VnID63FZ9S+FJTePrPFrfGB8aUZacN/
	EVYR+DifW9BqYmZZFZ6LXjrw7dEzks88hSeSun3Up0zS7tCsKYJia1Tgao91HCEYMea8efGINYBeC
	1Smzw4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXop-0000000AvVI-26zs;
	Thu, 13 Feb 2025 11:55:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXnO-0000000AvG2-3MI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:54:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739447656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nVCFtiwujzbXkpW5Uts1EM44uRKfVCoT8Jxt43kwJZs=;
	b=Q3BI4qYOehHagnGv2BUg8gNnenIzTcCi1NMESdqL0fLyHd4Yzz9+IYpIkFW3DSmDQXC8IS
	mDGtthYVDx2iQwWZwUnTh5RKYIrVO3hb0Gfqd1n1IKRRgimeBkq0ktFM6oTIF5/fZCTowq
	Gq3dQ9PHcGRe4lFk/9u9qz7xDA+MuzWXW085gYb3gIveOvL3Y5trtL5vHA8iXcWnWTD0YW
	N5txuktSnn/uYzDWCNP62XXc7dXXwAOMmprC65aAK79c1RgYmPW9hsupcNDm5bZgV/YLLR
	o5Wz5nWNxmHCU6rp6EVQiJketXY0mDMiDZ3D3yWCHb/4u5bU1K44Ws+l+l30Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739447656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nVCFtiwujzbXkpW5Uts1EM44uRKfVCoT8Jxt43kwJZs=;
	b=Jc11mgkW0InKn0tScvUbjLrXp5+HWbjchgXOPuZeADaKpvfZUaX8cj1bJW72TjyGhkpFQJ
	YQ0RMmw6VpI9zhBw==
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
 kevin.tian@intel.com, maz@kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com,
 patches@lists.linux.dev
Subject: Re: [PATCH v1 01/13] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
In-Reply-To: <a580069c5e494ffffa668218b6fe3a207b01efec.1739005085.git.nicolinc@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
 <a580069c5e494ffffa668218b6fe3a207b01efec.1739005085.git.nicolinc@nvidia.com>
Date: Thu, 13 Feb 2025 12:54:15 +0100
Message-ID: <87y0yajc0o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_035418_981919_8AB55EB8 
X-CRM114-Status: GOOD (  19.71  )
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

On Sat, Feb 08 2025 at 01:02, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
>
> All the iommu cases simply want to override the MSI page's address with
> the IOVA that was mapped through the iommu. This doesn't need a cookie
> pointer, we just need to store the IOVA and its page size in the
> msi_desc.

We need to do nothing :)

> Instead provide msi_desc_set_iommu_msi_iova() which allows the IOMMU side
> to specify the IOVA that the MSI page is placed during
> iommu_dma_prepare_msi(). This is stored in the msi_desc and then
> iommu_dma_compose_msi_msg() is a simple inline that sets address_hi/lo.
>
> The next patch will correct the naming.
>
> This is done because we cannot correctly lock access to group->domain
> in

Now this gets really confusing. How is the next patch which corrects the
naming related the locking problem?

> the atomic context that iommu_dma_compose_msi_msg() is called under. Today
> the locking miss is tolerable because dma_iommu.c operates under an
> assumption that the domain does not change while a driver is probed.
>
> However iommufd now permits the domain to change while the driver is
> probed and VFIO userspace can create races with IRQ changes calling
> iommu_dma_prepare_msi/compose_msi_msg() and changing/freeing the
> iommu_domain.
>
> Removing the pointer, and critically, the call to
> iommu_get_domain_for_dev() during compose resolves this race.

So this change log really fails to follow the basic structure:

   The context, the problem and the solution

Something like this:

   The IOMMU translation for MSI message addresses is a two stage
   process:

     1) A cookie containing the IOVA address is stored in the MSI
        descriptor, when a MSI interrupt is allocated

     2) The compose callback uses this cookie to apply the translation
        to the message address.

   This worked so far because .......

   With the iommufd rework this becomes racy, because ...

   Fix this by storing ... instead of ... ....

Hmm?

        tglx


