Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D324F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ1ZJoQ2YhOhJsqAmIeLdvIJJT/PHrvkcAt0k1aELS8=; b=C1y4ufRU4gUKIqicTZ3L1ZMxrd
	TlCmX/Om2dRxW/u6BkR+ylvmJNukfbdkdPcloI+noHruSamDdPIyuTYYD4BMWpfjWIINTnUUNhHHO
	yMRLi69iVohHiFOPRvhSTsOHY4g8gOqGVIEyuRKDO84Gja5/Mw/FTzPzKTXVy04MbGmY9aWg+QbW+
	pZqvRts4OTcKFzzvMMtkErNXWpAwrFcKe+dFKJjhCV6hcAP6g4Fm/ybufUa5Z0uXwRbJ3ZzSh0ymE
	6RWKCc3QbjDji8em/cLzgyoVpnYDRIJNs5+X1KXrDN384WQ5RvNRk/DFwlr/aw4PcGqGXAcQw4SDN
	Dwz685UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A5d-00000004MMn-0aL7;
	Mon, 16 Mar 2026 15:42:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A5a-00000004MLf-2gqS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:42:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475341477;
	Mon, 16 Mar 2026 08:42:34 -0700 (PDT)
Received: from [10.57.61.116] (unknown [10.57.61.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFA973F778;
	Mon, 16 Mar 2026 08:42:38 -0700 (PDT)
Message-ID: <268c246d-893b-4b50-8fbb-ff82539465aa@arm.com>
Date: Mon, 16 Mar 2026 15:42:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] iommu/arm-smmu-v3: Add Context Descriptor display
 to debugfs
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org, jpb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 wangzhou1@hisilicon.com, prime.zeng@hisilicon.com, fanghao11@huawei.com,
 jonathan.cameron@huawei.com, linuxarm@huawei.com
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-6-xiaqinxin@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260313104351.3502293-6-xiaqinxin@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_084242_784501_5240B926 
X-CRM114-Status: GOOD (  30.01  )
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
> Add Context Descriptor (CD) display functionality to debugfs.
> This allow inspecting CD contents for all Substream IDs including:
> - CD validity and translation parameters
> - TTBR0 and TCR configurations
> - Raw CD data
> 
> /sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
> └── 0000:01:00.0:0/
>      ├── ste
>      └── context_descriptors/
>          └── all
> 
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>   .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 112 ++++++++++++++++++
>   1 file changed, 112 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> index f62df02847ac..66ae1228c6ad 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
> @@ -27,6 +27,13 @@
>    * - Context Pointers: Stage 1 and Stage 2 translation context addresses
>    * - Raw Data: Complete 64-bit STE words in hexadecimal
>    *
> + * CD Information Displayed:
> + * - Validity: Active state of the context descriptor
> + * - T0SZ: Input address space size configuration
> + * - EPD0/EPD1: Stage 1 translation enable flags
> + * - TTBR0: Stage 1 translation table base address
> + * - Raw Data: Complete CD structure in hexadecimal format
> + *
>    * Directory Structure:
>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>    * └── smmu0/
> @@ -35,6 +42,8 @@
>    *     └── stream_table
>    *	   └── 0000:01:00.0:0/                    # PCI device with Stream ID 0
>    *             ├── ste                           # Stream Table Entry
> + *             └── context_descriptors/
> + *                 └── all                       # All Context Descriptors
>    *
>    * The capabilities file provides detailed information about:
>    * - Architecture version and translation stage support (Stage1/Stage2)
> @@ -59,6 +68,8 @@
>   static struct dentry *smmuv3_root_dir;
>   static DEFINE_MUTEX(arm_smmu_debugfs_lock);
>   
> +#define MAX_SSIDS	32	/* Reasonable limit for SSID enumeration */

Arbitrarily limiting to only 32 out of a potential 2^20 SSIDs seems odd, 
like it's rather more than needed for basic sanity-checking, but far too 
few for debugging specific usage.

FWIW I'd imagine it might be more useful to expose the CDs as individual 
files by index - and if userspace does want an "all" dump then there's 
always `cat`. Whether that would be all of them unconditionally based on 
the current STE.S1CDMAX, or just the "active" ones based on PASID 
allocations and S1DSS, is probably a question of what people think is 
most useful (and/or how fiddly it is to actually implement the latter).

> +
>   /**
>    * smmu_debugfs_capabilities_show() - Display SMMU capabilities
>    * @seq: seq_file to write to
> @@ -329,6 +340,90 @@ static int smmu_debugfs_ste_show(struct seq_file *seq, void *v)
>   }
>   DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_ste);
>   
> +/**
> + * smmu_debug_dump_cd() - Dump Context Descriptor details to seq_file
> + * @seq: seq_file to write to
> + * @dev: device associated with the CD
> + * @ssid: Substream ID
> + */
> +static void smmu_debug_dump_cd(struct seq_file *seq, struct device *dev, u32 ssid)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct arm_smmu_cd *cd;
> +	u64 data;
> +	int i;
> +
> +	if (!master) {
> +		seq_puts(seq, "No master data\n");
> +		return;
> +	}

If userspace can read these files racily with devices being removed then:

1) we should probably return an actual read error if the device has 
already disappeared such the file is no longer valid.

2) how do we know the device isn't going to disappear, and thus "master" 
become invalid, immediately *after* this check happens to pass?

Thanks,
Robin.

> +
> +	cd = arm_smmu_get_cd_ptr(master, ssid);
> +	if (!cd) {
> +		seq_printf(seq, "CD not available for SSID %u\n", ssid);
> +		return;
> +	}
> +
> +	seq_printf(seq, "CD for Substream ID %u:\n", ssid);
> +
> +	/* CD 0 */
> +	data = le64_to_cpu(cd->data[0]);
> +	seq_printf(seq, "  Valid: %s\n", data & CTXDESC_CD_0_V ? "Yes" : "No");
> +	seq_printf(seq, "  T0SZ: 0x%llx\n", data & CTXDESC_CD_0_TCR_T0SZ);
> +	seq_printf(seq, "  EPD0: %s\n", data & CTXDESC_CD_0_TCR_EPD0 ? "Yes" : "No");
> +	seq_printf(seq, "  EPD1: %s\n", data & CTXDESC_CD_0_TCR_EPD1 ? "Yes" : "No");
> +
> +	/* CD 1 */
> +	data = le64_to_cpu(cd->data[1]);
> +	seq_printf(seq, "  TTBR0: 0x%016llx\n", data & CTXDESC_CD_1_TTB0_MASK);
> +
> +	/* Display raw CD data */
> +	seq_puts(seq, "  Raw Data:\n");
> +	for (i = 0; i < CTXDESC_CD_DWORDS; i++)
> +		seq_printf(seq, "    CD[%d]: 0x%016llx\n", i,
> +			   le64_to_cpu(cd->data[i]));
> +}
> +
> +/**
> + * smmu_debug_dump_all_cds() - Dump all valid Context Descriptors for a device
> + * @seq: seq_file to write to
> + * @dev: target device
> + */
> +static void smmu_debug_dump_all_cds(struct seq_file *seq, struct device *dev)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	u32 max_ssids, ssid;
> +
> +	if (!master) {
> +		seq_puts(seq, "No master data\n");
> +		return;
> +	}
> +
> +	max_ssids = min_t(u32, 1 << master->ssid_bits, MAX_SSIDS);
> +
> +	seq_printf(seq, "Context Descriptors for device (max SSIDs: %u):\n",
> +		   max_ssids);
> +
> +	for (ssid = 0; ssid < max_ssids; ssid++) {
> +		struct arm_smmu_cd *cd = arm_smmu_get_cd_ptr(master, ssid);
> +
> +		if (cd && (le64_to_cpu(cd->data[0]) & CTXDESC_CD_0_V)) {
> +			seq_printf(seq, "\n--- SSID %u ---\n", ssid);
> +			smmu_debug_dump_cd(seq, dev, ssid);
> +		}
> +	}
> +}
> +
> +/* All CDs debugfs file operations */
> +static int smmu_debugfs_all_cds_show(struct seq_file *seq, void *v)
> +{
> +	struct device *dev = seq->private;
> +
> +	smmu_debug_dump_all_cds(seq, dev);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_all_cds);
> +
>   /**
>    * smmu_debugfs_create_stream_table() - Create debugfs entries for stream table
>    * @dev: device to create entries for
> @@ -388,9 +483,26 @@ int smmu_debugfs_create_stream_table(struct device *dev,
>   			goto cleanup_dev;
>   		}
>   
> +		/* Create CD directory */
> +		cd_dir = debugfs_create_dir("context_descriptors", dev_dir);
> +		if (!cd_dir) {
> +			ret = -ENOMEM;
> +			goto cleanup_dev;
> +		}
> +
> +		/* Create "all" file to show all valid CDs */
> +		all_cds_file = debugfs_create_file("all", 0444, cd_dir, dev,
> +						   &smmu_debugfs_all_cds_fops);
> +		if (!all_cds_file) {
> +			ret = -ENOMEM;
> +			goto cleanup_cd;
> +		}
> +
>   		/* Success for this stream ID, continue to next */
>   		continue;
>   
> +cleanup_cd:
> +		debugfs_remove(cd_dir);
>   cleanup_dev:
>   		debugfs_remove_recursive(dev_dir);
>   cleanup:


