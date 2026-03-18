Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE81103E166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2NdF1QMWjUu0qtpBR8177AKP0EmQ3nxJJ4E1dUpmQs=; b=iRac2xcs6xIwP8YXt91w+U5A22
	Al35hijWZnLbeq2MfrjWztaIWnOvCU5ZocPoklvEAuNr9D9Ue0x5giJLhQojiqUTGv8o8uDoBvLwq
	W4DoCfUpFPxHCozi6BS3frWD+5V8zTV+zq5bBuC1/RtzGDPZgZO+gpyjAg4slcJZRt02IbbJu+1sL
	0liVC8vbwlgjy1UJZVePys/Ez2N85Pol+ouoPCD/v99LGy9aNZLFXazfJ0GDsx0xNbKvNivz23uef
	XNWIwCiaWiAZhmTueuzimIHm7XAb9MFJEglt684gKNJjZhhPH7vrd82va7KdFsohlp9eSjxRj/+Rh
	EbPDjtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pKz-00000008Kjo-0C0r;
	Wed, 18 Mar 2026 11:45:21 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pKu-00000008Kiu-2Qs5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773834311; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=E2NdF1QMWjUu0qtpBR8177AKP0EmQ3nxJJ4E1dUpmQs=;
	b=aGw88IfIe8VPw9tuZd1F+YdyJo7CLzhsjof6kyfCQVPqT1UsUrVswXiM9wHhKr9DnyRivJR3ZQQ0xknNr9Ngcu4UNBXu5HyXZB3SlHe+HzokLz1BWWyK0+sWdYrt/BZl9g2e+c98J2uJW8VInJrUsU3Y4gbblPemO9yvR2ZKQJs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.EJ6bT_1773834309;
Received: from 30.246.163.250(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X.EJ6bT_1773834309 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Mar 2026 19:45:10 +0800
Message-ID: <b4085354-93e4-4484-8744-d8c7e7718c57@linux.alibaba.com>
Date: Wed, 18 Mar 2026 19:45:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] iommu: Add iommu_report_device_broken() to
 quarantine a broken device
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com, jgg@nvidia.com
Cc: rafael@kernel.org, lenb@kernel.org, praan@google.com,
 baolu.lu@linux.intel.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_044518_117122_C226963D 
X-CRM114-Status: GOOD (  18.13  )
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



On 3/18/26 3:15 AM, Nicolin Chen wrote:
> When an IOMMU hardware detects an error due to a faulty device (e.g. an ATS
> invalidation timeout), IOMMU drivers may quarantine the device by disabling
> specific hardware features or dropping translation capabilities.
> 
> However, the core-level states of the faulty device are out of sync, as the
> device can be still attached to a translation domain or even potentially be
> moved to a new domain that might overwrite the driver-level quarantine.
> 
> Given that such an error can be likely an ISR, introduce a broken_work per
> iommu_group, and add a helper function to allow driver to report the broken
> device, so as to completely quarantine it in the core.
> 
> Use the existing pci_dev_reset_iommu_prepare() function to shift the device
> to its resetting_domain/blocking_domain. A later pci_dev_reset_iommu_done()
> call will clear it and move it out of the quarantine.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h |  2 ++
>   drivers/iommu/iommu.c | 59 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 9ba12b2164724..9b5f94e566ff9 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -891,6 +891,8 @@ static inline struct iommu_device *__iommu_get_iommu_dev(struct device *dev)
>   #define iommu_get_iommu_dev(dev, type, member) \
>   	container_of(__iommu_get_iommu_dev(dev), type, member)
>   
> +void iommu_report_device_broken(struct device *dev);
> +

This declaration is inside the #ifdef CONFIG_IOMMU_API section, but
there's no corresponding stub in the #else block. While current
callers (arm-smmu-v3) always have CONFIG_IOMMU_API, for API
completeness, please add a stub.
Thanks.
Shuai

