Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FDF53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/0CKGvPOl7BVTBCKbKNZviyVP3Tup7TnwROT2hNFNE=; b=LZFITrWgJj6Pioh1L/ezgHxatW
	UtjR0DV8JGEGufA9e2U/M3rz8WIfgZz7u5XPG4EB5EZ+APcBpn4vriaaDb5D9intJsk7hjUVrNnjJ
	jvnD7e6+1P0ue/uArvU94/H2CVSjSihfmOCfF5oHpcadRlHuFfoLbjpl6BWHYCvYADlGDe1oKYqZz
	hzsai6ZCzI4+SIhP5duSYUiqxWPyZAplPsl8WCfwG6pHZu2fKwqY/+rhec0Nw6FxZh8p3A8ZNChc6
	1gPfQ70qJz/SHV/mcVa/7z/Tdux4we6M1hIsg+0nQjLeIaznJdkWH1HcgwTYWo9AKWfxguc/qftmB
	w5O34rVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29cP-00000004IYk-3qem;
	Mon, 16 Mar 2026 15:12:33 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29cL-00000004IYK-1ywg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:12:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q/0CKGvPOl7BVTBCKbKNZviyVP3Tup7TnwROT2hNFNE=;
	b=kGhFhQksGC037qL98iFElnN6J4GDIbTEoDJRsTIRpTk70CrjC0SeruGJXybv5vChluYmgXIxz
	JuGxB0P7xF/8jgQsBKYpKGypfrLi5SAFXl9lvb2Ix4mRmr1LCk03YX9wMO6XfSR9qOqqP8nWUVe
	imqnqyX2vS64eJyMDpAxB/g=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fZJN210Zjz1T4GK;
	Mon, 16 Mar 2026 23:06:58 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id E1E5A40561;
	Mon, 16 Mar 2026 23:12:16 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 23:12:16 +0800
Message-ID: <42f9d052-f0df-419f-8aad-ea18e10962d8@huawei.com>
Date: Mon, 16 Mar 2026 23:12:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] iommu/arm-smmu-v3: Add Context Descriptor display
 to debugfs
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-6-xiaqinxin@huawei.com>
 <abR7ys1LYRhJ8Hn6@Asurada-Nvidia>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <abR7ys1LYRhJ8Hn6@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081230_395272_E6331322 
X-CRM114-Status: GOOD (  16.73  )
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



On 2026/3/14 05:04:10, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Fri, Mar 13, 2026 at 06:43:51PM +0800, Qinxin Xia wrote:
>>    * Directory Structure:
>>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>>    * └── smmu0/
>> @@ -35,6 +42,8 @@
>>    *     └── stream_table
>>    *	   └── 0000:01:00.0:0/                    # PCI device with Stream ID 0
>>    *             ├── ste                           # Stream Table Entry
>> + *             └── context_descriptors/
>> + *                 └── all                       # All Context Descriptors
> 
> I wonder if we should do per-RID/PASID v.s. all. Otherwise, cd_dir
> seems unnecessary, as it could be a file instead?
> 

That's exactly what I'm thinking about.
Per-PASID could be better expanded, but now all maybe is enough.

>> +/**
>> + * smmu_debug_dump_cd() - Dump Context Descriptor details to seq_file
>> + * @seq: seq_file to write to
>> + * @dev: device associated with the CD
>> + * @ssid: Substream ID
>> + */
>> +static void smmu_debug_dump_cd(struct seq_file *seq, struct device *dev, u32 ssid)
>> +{
>> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>> +	struct arm_smmu_cd *cd;
>> +	u64 data;
>> +	int i;
>> +
>> +	if (!master) {
>> +		seq_puts(seq, "No master data\n");
>> +		return;
>> +	}
>> +
>> +	cd = arm_smmu_get_cd_ptr(master, ssid);
>> +	if (!cd) {
>> +		seq_printf(seq, "CD not available for SSID %u\n", ssid);
>> +		return;
>> +	}
> 
> master->cd_table can be free-ed. We could hit UAF in a race. This
> very likely needs arm_smmu_asid_lock.
> 
>> +	seq_printf(seq, "CD for Substream ID %u:\n", ssid);
>> +
>> +	/* CD 0 */
>> +	data = le64_to_cpu(cd->data[0]);
>> +	seq_printf(seq, "  Valid: %s\n", data & CTXDESC_CD_0_V ? "Yes" : "No");
>> +	seq_printf(seq, "  T0SZ: 0x%llx\n", data & CTXDESC_CD_0_TCR_T0SZ);
>> +	seq_printf(seq, "  EPD0: %s\n", data & CTXDESC_CD_0_TCR_EPD0 ? "Yes" : "No");
>> +	seq_printf(seq, "  EPD1: %s\n", data & CTXDESC_CD_0_TCR_EPD1 ? "Yes" : "No");
> 
> All these are unnecessary if V=0? Maybe the per-SSID output should
> depend on V=1 at all. Same might apply to STE.
> 
I made this judgment before dump:

		if (cd && (le64_to_cpu(cd->data[0]) & CTXDESC_CD_0_V)) {
			seq_printf(seq, "\n--- SSID %u ---\n", ssid);
			smmu_debug_dump_cd(seq, dev, ssid);
		}

So, the CDs dumped here are valid.
You remind me that "Valid" print can be omitted here :-)

>> +/* All CDs debugfs file operations */
>> +static int smmu_debugfs_all_cds_show(struct seq_file *seq, void *v)
>> +{
>> +	struct device *dev = seq->private;
>> +
>> +	smmu_debug_dump_all_cds(seq, dev);
>> +	return 0;
> 
> Just unwrap the smmu_debug_dump_all_cds().
> 
> Nicolin
> 
-- 
Thanks,
Qinxin


