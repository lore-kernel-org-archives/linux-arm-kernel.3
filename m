Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwUITOpMFwTi/W8s/xf6chXl/H4CSWnHTKuu/cNkV+Y=; b=BnVIE7yCgSPpyeMkHXBrdQJeY4
	4d/YpKPZyRsrnzDrTd76BOxp1Cg532Zj4dqVOMTcZey6XMv5bxB0zjSGSVUJre4NHPVCUM05hbVYM
	qg7xaDtsiVmzY+XKI2HhDMb1XjL+V8jRtDBLkVWu9b2JAdCT50sVmRNk9jgJOUACVDythyh8rLNRC
	sZOQz4G8lIp2Is8qtabx9WJc+wws7pFbGeFBEEdC+dj/R2CQ5GC0+tpiqxn0LzeBbsZa3Qw9fSYSP
	AC9051LW9kqZSeMv7AXpsK5k00G7ff5Om6sScUkAOMlyT0z6uAj7yrEYuJN54K5US+BCzgnyScAtW
	IJQ3YcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPYj-00000004zBX-1wCX;
	Fri, 21 Feb 2025 09:43:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPL0-00000004vce-1SNj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:28:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740130129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwUITOpMFwTi/W8s/xf6chXl/H4CSWnHTKuu/cNkV+Y=;
	b=Rft1jIC3rQkJoE7ktmxfkISLJACrDfiV6yT2t1mrEsrrvrMsFcMh9LAAsgjtcHjO+iGIV7
	7Uimzs+uA08ag7Zw6Yd0AcgKAETr/ty5Cn9lnjuf1WrbsU/un+oG3S/7QLvlWvIB/Q3/Qa
	JmUgGr15GKukhSOtvTAk4Ve/DWl2pvZ6xe5/8EbszUIp3HOotmQqXvMwF0Zfe74xJKvolq
	JDc9LYS7weYz0Au5rIuJ3117mpJTUrUw0U6Mr9JxkmJiH8Eai2djymgBdfAAk1gRCItlQe
	/YoGy/ImnMlFzjZfst6JAB2yRLMCbOcs4b1E/GfQjwMCM688FKot2ywYYCR+PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740130129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwUITOpMFwTi/W8s/xf6chXl/H4CSWnHTKuu/cNkV+Y=;
	b=T+KPnXw5Wr2dPlolH6aNGJaBaBOXcpbTXXzHKxX6PowtAno4QpBmWblRtwqYDSoMbjfhhW
	5yDF1qjXgyrByPAg==
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
 kevin.tian@intel.com, maz@kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com,
 patches@lists.linux.dev
Subject: Re: [PATCH v2 2/7] genirq/msi: Refactor iommu_dma_compose_msi_msg()
In-Reply-To: <eda62a9bafa825e9cdabd7ddc61ad5a21c32af24.1740014950.git.nicolinc@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <eda62a9bafa825e9cdabd7ddc61ad5a21c32af24.1740014950.git.nicolinc@nvidia.com>
Date: Fri, 21 Feb 2025 10:28:48 +0100
Message-ID: <87ikp3hcj3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_012850_527869_BF7EF75F 
X-CRM114-Status: GOOD (  14.33  )
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

On Wed, Feb 19 2025 at 17:31, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
>
> The two-step process to translate the MSI address involves two functions,
> iommu_dma_prepare_msi() and iommu_dma_compose_msi_msg().
>
> Previously iommu_dma_compose_msi_msg() needed to be in the iommu layer as
> it had to dereference the opaque cookie pointer. Now, the previous patch
> changed the cookie pointer into an integer so there is no longer any need
> for the iommu layer to be involved.
>
> Further, the call sites of iommu_dma_compose_msi_msg() all follow the same
> pattern of setting an MSI message address_hi/lo to non-translated and then
> immediately calling iommu_dma_compose_msi_msg().
>
> Refactor iommu_dma_compose_msi_msg() into msi_msg_set_addr() that directly
> accepts the u64 version of the address and simplifies all the callers.
>
> Move the new helper to linux/msi.h since it has nothing to do with iommu.
>
> Aside from refactoring, this logically prepares for the next patch, which
> allows multiple implementation options for iommu_dma_prepare_msi(). So, it
> does not make sense to have the iommu_dma_compose_msi_msg() in dma-iommu.c
> as it no longer provides the only iommu_dma_prepare_msi() implementation.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

