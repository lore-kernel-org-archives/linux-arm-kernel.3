Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D88FB5EA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 02:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRL0Yt8d8xETsY3o0SXrc6sREJD9liwpk0hprJ02H7s=; b=ZP9swhCFSeArDOR+5KVWBxDJIq
	nvi/d3Xv2Sd7bn7gwwXhvEvQ4nhI6SXL9wIcd71IemvcyzZdvLRFIMKwEbFTs+BF13UkwS1CzPTlZ
	6JtDHqbVt5hXhuDwuO67tvAqMPl8cPkr3rW31G4JbeZkc0wIO8kdSdH696AF7t1HVtCYxizEE3XJm
	yKyBAVOiaU0Ef22hbdtCtANzYpDCX0sHg6Hx8ziARMk6+AKQUW13Dno0bigLysmDx6NeT1L+stSJs
	4UPTRKUExaRFDAoFkHoCZgJauwh1aQC5RMMuZdqrCpPzK1vn6nIOp87MwGSENXunafpXoAsUJ/052
	up3QeqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JnL-00000005DxE-3amn;
	Tue, 17 Mar 2026 02:04:31 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JnI-00000005Dwm-1kVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 02:04:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LRL0Yt8d8xETsY3o0SXrc6sREJD9liwpk0hprJ02H7s=;
	b=MAO4sWhQ51Mk7+aGUJm4fPDxqXsT7LVpkhi4AUyRNdBBIii3Iyh+8MlAuvF0Ze+HStmTCEI7K
	bm5Nth84J4yx9o8pWLUaAX3lr0g8jWWY8s0sp9YmU9ryEP+Tib6euwRqiN7Lcvwyo6ZWRDr/9lZ
	0nfmYtdSBQ72OWhhiXcaWSI=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fZZrm2XFHz1cyrR;
	Tue, 17 Mar 2026 09:59:20 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id DD08F4055B;
	Tue, 17 Mar 2026 10:04:18 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 10:04:18 +0800
Message-ID: <73609118-bed1-48b8-b649-a23cd445b319@huawei.com>
Date: Tue, 17 Mar 2026 10:04:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] iommu/arm-smmu-v3: Add stream table directory
 structure to debugfs
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-5-xiaqinxin@huawei.com>
 <497de4f9-193e-4630-b6d6-30519feb27ba@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <497de4f9-193e-4630-b6d6-30519feb27ba@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_190429_138835_21D2560D 
X-CRM114-Status: GOOD (  26.63  )
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



On 2026/3/17 00:01:50, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2026-03-13 10:43 am, Qinxin Xia wrote:
>> Add stream table directory structure creation to debugfs
>> This organizes debugfs entries by device and stream ID:
>>
>> /sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
>> └── 0000:01:00.0:0/
>>      └─── ste
> 
> Similar to my previous comment on CDs (sorry I'm reading out of order), 
> I wonder if it might not be more useful to expose STEs by index, then 
> have the name of the associated device as an attribute/link below that. 
> Or perhaps even have whole cross-linked "by StreamID" and "by device" 
> hierarchies if you want to get really fancy. From userspace it's not 
> always easy to know exactly which StreamIDs are owned by which devices, 
> and I can say from experience that if you do have to debug things at the 
> STE level, the StreamID is often the thing you're starting from. Plus if 
> you wanted to, say, check that STEs are correctly disabled after SR-IOV 
> VF teardown, then there may not even be a device any more.
> 
> Thanks,
> Robin.
> 
To quickly obtain the mapping between SIDs and devices, I named the
directory dev_name+sid. Can we keep this naming mode and add a device
link to the directory?

According to Nicolin's suggestion, I plan to release the corresponding
debugfs in release_device in the next version. After VF teardown, users
cannot view information such as ste and cd anymore.

>> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
>> ---
>>   .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 80 ++++++++++++++++++-
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +
>>   3 files changed, 85 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/ 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> index d7f3defd94a3..f62df02847ac 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> @@ -31,7 +31,10 @@
>>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>>    * └── smmu0/
>>    *     ├── capabilities    # SMMU feature capabilities and 
>> configuration
>> - *     └── registers       # SMMU Key registers
>> + *     ├── registers       # SMMU Key registers
>> + *     └── stream_table
>> + *       └── 0000:01:00.0:0/                    # PCI device with 
>> Stream ID 0
>> + *             ├── ste                           # Stream Table Entry
>>    *
>>    * The capabilities file provides detailed information about:
>>    * - Architecture version and translation stage support (Stage1/Stage2)
>> @@ -324,5 +327,78 @@ static int smmu_debugfs_ste_show(struct seq_file 
>> *seq, void *v)
>>       smmu_debug_dump_ste(seq, dev);
>>       return 0;
>>   }
>> -
>>   DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_ste);
>> +
>> +/**
>> + * smmu_debugfs_create_stream_table() - Create debugfs entries for 
>> stream table
>> + * @dev: device to create entries for
>> + * @smmu: SMMU device
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int smmu_debugfs_create_stream_table(struct device *dev,
>> +                     struct arm_smmu_device *smmu)
>> +{
>> +    struct dentry *stream_dir, *cd_dir, *dev_dir;
>> +    struct dentry *ste_file, *all_cds_file;
>> +    struct iommu_fwspec *fwspec;
>> +    char name[64];
>> +    int i, ret = 0;
>> +
>> +    if (!smmu->debugfs->stream_dir) {
>> +        stream_dir = debugfs_create_dir("stream_table",
>> +                        smmu->debugfs->smmu_dir);
>> +        if (!stream_dir)
>> +            return -ENOMEM;
>> +        smmu->debugfs->stream_dir = stream_dir;
>> +    } else {
>> +        stream_dir = smmu->debugfs->stream_dir;
>> +    }
>> +
>> +    fwspec = dev_iommu_fwspec_get(dev);
>> +    if (!fwspec)
>> +        return -ENODEV;
>> +
>> +    for (i = 0; i < fwspec->num_ids; i++) {
>> +        u32 sid = fwspec->ids[i];
>> +
>> +        if (dev_is_pci(dev)) {
>> +            struct pci_dev *pdev = to_pci_dev(dev);
>> +
>> +            snprintf(name, sizeof(name), "%04x:%02x:%02x.%d:%u",
>> +                 pci_domain_nr(pdev->bus), pdev->bus->number,
>> +                 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
>> +                 sid);
>> +        } else {
>> +            snprintf(name, sizeof(name), "%s:%u", dev_name(dev),
>> +                 sid);
>> +        }
>> +
>> +        dev_dir = debugfs_create_dir(name, stream_dir);
>> +        if (!dev_dir) {
>> +            ret = -ENOMEM;
>> +            goto cleanup;
>> +        }
>> +
>> +        /* Create STE file */
>> +        ste_file = debugfs_create_file("ste", 0444, dev_dir, dev,
>> +                           &smmu_debugfs_ste_fops);
>> +        if (!ste_file) {
>> +            ret = -ENOMEM;
>> +            goto cleanup_dev;
>> +        }
>> +
>> +        /* Success for this stream ID, continue to next */
>> +        continue;
>> +
>> +cleanup_dev:
>> +        debugfs_remove_recursive(dev_dir);
>> +cleanup:
>> +        if (ret) {
>> +            debugfs_remove_recursive(stream_dir);
>> +            break;
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/ 
>> iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 211a0c87507a..c57897e5f644 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -3133,6 +3133,9 @@ static int arm_smmu_attach_dev(struct 
>> iommu_domain *domain, struct device *dev,
>>       arm_smmu_attach_commit(&state);
>>       mutex_unlock(&arm_smmu_asid_lock);
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +    smmu_debugfs_create_stream_table(dev, smmu);
>> +#endif
>>       return 0;
>>   }
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/ 
>> iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> index 247f27426f6b..e9cd24c1ab3c 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> @@ -737,9 +737,13 @@ struct arm_smmu_impl_ops {
>>   struct arm_smmu_debugfs {
>>       struct dentry *root_dir;
>>       struct dentry *smmu_dir;
>> +    struct dentry *stream_dir;
>>       struct arm_smmu_device *smmu;
>>   };
>> +
>>   int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t 
>> ioaddr);
>> +int smmu_debugfs_create_stream_table(struct device *dev,
>> +                    struct arm_smmu_device *smmu);
>>   #endif
>>   /* An SMMUv3 instance */
> 
> 

-- 
Thanks,
Qinxin


