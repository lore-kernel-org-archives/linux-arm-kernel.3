Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A24F53D6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2o/1+4icUhwGt9iwgUQ6f9mFmEZ1U9VGYwEOQCwjakY=; b=QO4+b/ocquV3eH4P415i3JKF3u
	s6sBFPK/EP4/4gNrs9rHINQFu5+UIYFCr05Q28cbYP5Jn+HcKiPJBdswAFM0gAjE0l9+Q6tIwFg2K
	oS8w8tA/IQRatacoTm0FuywrNBz/TH7Vx2zCASNBtZJPvolqinekpFSMf+8rNxlM3T/mYfBNZJJmX
	T+RK/Or5RDBmTh1A3TPrfFJvhTDDaG6Pju9hFxNik2aUDdmbTg/kSzJmFmnBG1aGS7TcyGNIw2z3F
	u4twgm7nUIE3hQSVHs62U2NQ7csd9GV1X0aiqL1pEoAn1mdHCndqk415PyZxCjVNeJ26rlvJg83It
	P4iRpVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A6C-00000004MSC-2Ooa;
	Mon, 16 Mar 2026 15:43:20 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2A67-00000004MQj-40il
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:43:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2o/1+4icUhwGt9iwgUQ6f9mFmEZ1U9VGYwEOQCwjakY=;
	b=R8DWJFZ1zzlA9LirDLf3RzOFuhbTGu6xYEeRH7Uvz63xfJp7zJfwyDRAb/igzFRYxxOswlCn5
	oSWHTz2NfLY17+toLyawyFj5EYXdVR0UiC1TKAqLEG6S1QmAJIIOyo/9KonIzrBuGDM6LwOCV+n
	U2c44kkCkhr1ijErU7BM/Ck=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fZK3w0ZFvz1prL7;
	Mon, 16 Mar 2026 23:38:04 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id CCD1D40538;
	Mon, 16 Mar 2026 23:43:04 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 23:43:04 +0800
Message-ID: <8551a85b-fcbe-4a39-b30c-7a9562a73e36@huawei.com>
Date: Mon, 16 Mar 2026 23:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] iommu/arm-smmu-v3: Add Stream Table Entry display
 to debugfs
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-4-xiaqinxin@huawei.com>
 <abRxQqNlGGzcbkim@Asurada-Nvidia>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <abRxQqNlGGzcbkim@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_084316_442036_24BEF6A7 
X-CRM114-Status: GOOD (  15.54  )
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



On 2026/3/14 04:19:14, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Fri, Mar 13, 2026 at 06:43:49PM +0800, Qinxin Xia wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> @@ -43,6 +49,8 @@
>>    */
>>   
>>   #include <linux/debugfs.h>
>> +#include <linux/pci.h>
> 
> It doesn't seem being used (yet).
> 
>> +static struct arm_smmu_ste *smmu_get_ste(struct arm_smmu_device *smmu, u32 sid)
>> +{
>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>> +
>> +	if (sid >= (1 << smmu->sid_bits))
>> +		return NULL;
>> +
>> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
>> +		u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
>> +		u32 l2_idx = arm_smmu_strtab_l2_idx(sid);
>> +
>> +		if (l1_idx >= cfg->l2.num_l1_ents || !cfg->l2.l2ptrs[l1_idx])
>> +			return NULL;
>> +
>> +		return &cfg->l2.l2ptrs[l1_idx]->stes[l2_idx];
>> +	}
>> +
>> +	return &cfg->linear.table[sid];
>> +}
> 
> arm_smmu_get_step_for_sid() instead?
> 
>> +/**
>> + * smmu_debug_dump_ste() - Dump STE details to seq_file
>> + * @seq: seq_file to write to
>> + * @dev: device associated with the STE
>> + */
>> +static void smmu_debug_dump_ste(struct seq_file *seq, struct device *dev)
>> +{
>> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>> +	struct arm_smmu_device *smmu;
>> +	struct arm_smmu_ste *ste;
>> +	u32 sid, cfg;
>> +	int i;
>> +
>> +	if (!master || !master->smmu) {
>> +		seq_puts(seq, "No SMMU master data\n");
>> +		return;
>> +	}
>> +
>> +	smmu = master->smmu;
>> +
>> +	/* Use first stream ID for debug */
>> +	if (master->num_streams == 0) {
>> +		seq_puts(seq, "No streams configured for device\n");
>> +		return;
>> +	}
>> +	sid = master->streams[0].id;
> 
> These might race with release_device that would destroy master?
> 
Can we lock streams_mutex here?
>> +
>> +	if (sid >= (1 << smmu->sid_bits)) {
>> +		seq_printf(seq, "Invalid Stream ID: %u (max %u)\n",
>> +			   sid, (1 << smmu->sid_bits) - 1);
>> +		return;
>> +	}
> 
> arm_smmu_sid_in_range() instead?
> 
>> +/* STE debugfs file operations */
>> +static int smmu_debugfs_ste_show(struct seq_file *seq, void *v)
>> +{
>> +	struct device *dev = seq->private;
>> +
>> +	smmu_debug_dump_ste(seq, dev);
>> +	return 0;
> 
> Could unwrap smmu_debug_dump_ste().
> 
> Nicolin
> 
As above, I will do clean code in the next version.
-- 
Thanks,
Qinxin


