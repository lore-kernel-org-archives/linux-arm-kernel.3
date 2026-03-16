Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347BBF53D6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHoEv1Pi5tlCG9KnieeWTdpZj0vztkTKD+zAaKFJHOI=; b=1nWA2/R1bUeckNAJ6sJpbnZ0Ei
	FCWSqHMqBjUPrla9hrGmhm580xLC0YXyq1wzGUyzCQ3ffL6BlXAaZB0ZsNP+GvQYzGmJ+/QOQrJ3h
	H/IqUox3Q3iYJ1tE1B22w0MESQscEn1VDAHkUb4Obm5011sEoiDuimXyfvSOuRA1UC71QNKc5ySIM
	fcrn3yey5mOQbIcpUzmf8WMU5loF0DPjQVX5hK1+RFPiKUofD4WZX2Tmf8hGGT4h0TGnEYRknO/CO
	DbBI6eT/pm7BFh1taAQizXvpLUJeys8/H+1SMfvZi8i3AUXOQztN6RnY1/O1uVJdd2G7oifyIFFJT
	g6fz9wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AOF-00000004P6A-2t2O;
	Mon, 16 Mar 2026 16:01:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AOD-00000004P4x-1hbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:01:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A4B1477;
	Mon, 16 Mar 2026 09:01:49 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28D43F778;
	Mon, 16 Mar 2026 09:01:52 -0700 (PDT)
Message-ID: <497de4f9-193e-4630-b6d6-30519feb27ba@arm.com>
Date: Mon, 16 Mar 2026 16:01:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Add stream table directory
 structure to debugfs
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org, jpb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, fanghao11@huawei.com,
 jonathan.cameron@huawei.com, linuxarm@huawei.com
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-5-xiaqinxin@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260313104351.3502293-5-xiaqinxin@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090157_587634_C951391C 
X-CRM114-Status: GOOD (  25.13  )
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

On 2026-03-13 10:43 am, Qinxin Xia wrote:
> Add stream table directory structure creation to debugfs
> This organizes debugfs entries by device and stream ID:
> 
> /sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
> └── 0000:01:00.0:0/
>      └─── ste

Similar to my previous comment on CDs (sorry I'm reading out of order), 
I wonder if it might not be more useful to expose STEs by index, then 
have the name of the associated device as an attribute/link below that. 
Or perhaps even have whole cross-linked "by StreamID" and "by device" 
hierarchies if you want to get really fancy. From userspace it's not 
always easy to know exactly which StreamIDs are owned by which devices, 
and I can say from experience that if you do have to debug things at the 
STE level, the StreamID is often the thing you're starting from. Plus if 
you wanted to, say, check that STEs are correctly disabled after SR-IOV 
VF teardown, then there may not even be a device any more.

Thanks,
Robin.

> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>   .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 80 ++++++++++++++++++-
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> index d7f3defd94a3..f62df02847ac 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> @@ -31,7 +31,10 @@
>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>    * └── smmu0/
>    *     ├── capabilities    # SMMU feature capabilities and configuration
> - *     └── registers	   # SMMU Key registers
> + *     ├── registers	   # SMMU Key registers
> + *     └── stream_table
> + *	   └── 0000:01:00.0:0/                    # PCI device with Stream ID 0
> + *             ├── ste                           # Stream Table Entry
>    *
>    * The capabilities file provides detailed information about:
>    * - Architecture version and translation stage support (Stage1/Stage2)
> @@ -324,5 +327,78 @@ static int smmu_debugfs_ste_show(struct seq_file *seq, void *v)
>   	smmu_debug_dump_ste(seq, dev);
>   	return 0;
>   }
> -
>   DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_ste);
> +
> +/**
> + * smmu_debugfs_create_stream_table() - Create debugfs entries for stream table
> + * @dev: device to create entries for
> + * @smmu: SMMU device
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int smmu_debugfs_create_stream_table(struct device *dev,
> +				     struct arm_smmu_device *smmu)
> +{
> +	struct dentry *stream_dir, *cd_dir, *dev_dir;
> +	struct dentry *ste_file, *all_cds_file;
> +	struct iommu_fwspec *fwspec;
> +	char name[64];
> +	int i, ret = 0;
> +
> +	if (!smmu->debugfs->stream_dir) {
> +		stream_dir = debugfs_create_dir("stream_table",
> +						smmu->debugfs->smmu_dir);
> +		if (!stream_dir)
> +			return -ENOMEM;
> +		smmu->debugfs->stream_dir = stream_dir;
> +	} else {
> +		stream_dir = smmu->debugfs->stream_dir;
> +	}
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if (!fwspec)
> +		return -ENODEV;
> +
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		u32 sid = fwspec->ids[i];
> +
> +		if (dev_is_pci(dev)) {
> +			struct pci_dev *pdev = to_pci_dev(dev);
> +
> +			snprintf(name, sizeof(name), "%04x:%02x:%02x.%d:%u",
> +				 pci_domain_nr(pdev->bus), pdev->bus->number,
> +				 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> +				 sid);
> +		} else {
> +			snprintf(name, sizeof(name), "%s:%u", dev_name(dev),
> +				 sid);
> +		}
> +
> +		dev_dir = debugfs_create_dir(name, stream_dir);
> +		if (!dev_dir) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		/* Create STE file */
> +		ste_file = debugfs_create_file("ste", 0444, dev_dir, dev,
> +					       &smmu_debugfs_ste_fops);
> +		if (!ste_file) {
> +			ret = -ENOMEM;
> +			goto cleanup_dev;
> +		}
> +
> +		/* Success for this stream ID, continue to next */
> +		continue;
> +
> +cleanup_dev:
> +		debugfs_remove_recursive(dev_dir);
> +cleanup:
> +		if (ret) {
> +			debugfs_remove_recursive(stream_dir);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 211a0c87507a..c57897e5f644 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3133,6 +3133,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>   
>   	arm_smmu_attach_commit(&state);
>   	mutex_unlock(&arm_smmu_asid_lock);
> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
> +	smmu_debugfs_create_stream_table(dev, smmu);
> +#endif
>   	return 0;
>   }
>   
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 247f27426f6b..e9cd24c1ab3c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -737,9 +737,13 @@ struct arm_smmu_impl_ops {
>   struct arm_smmu_debugfs {
>   	struct dentry *root_dir;
>   	struct dentry *smmu_dir;
> +	struct dentry *stream_dir;
>   	struct arm_smmu_device *smmu;
>   };
> +
>   int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr);
> +int smmu_debugfs_create_stream_table(struct device *dev,
> +					struct arm_smmu_device *smmu);
>   #endif
>   
>   /* An SMMUv3 instance */


