Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB250CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgTtcRu6NSnBWGtIWO7eX+TS4tOWPmPLWeTY0Ct3HVU=; b=tmvxLWqVzwJn1iUOZVSTTA0XAv
	5ncGPxtp5rSx1UirUJvqkeSmxzHxwl96TA+y24WuT6j+d0s6NojSXLZ1SRpJY7sjXXScauzyKaQ/Q
	tvlOYKJSU6oEgw6QW0c2lOsuv9AkPX0CkdUl3jRl7XETPJc4jNIB2Ui8ATOcdpZWZnQ30b5GpyY+d
	ZIAigpIizEu0FTltTQswqrtYScSRjRObpWCooZnt+ODz6f+RTe97qW7TWpqFKOr6E/mdAC77FQwjd
	PIuvMwfAnauI2CHEWgOhg5bh1fxKbyTBwcCwf5Rj5wGDC9NGF8Gt3GpUEchxBxsmHDTswR87BQslN
	PKo22qXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBUS-0000000BpZm-3W31;
	Wed, 10 Sep 2025 03:27:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBUP-0000000BpZL-32hg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 03:27:23 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cM5bn1M9mz2Cg7S;
	Wed, 10 Sep 2025 11:22:45 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 472841A016C;
	Wed, 10 Sep 2025 11:27:17 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 11:27:17 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 11:27:16 +0800
Message-ID: <f102058c-809d-e96e-9d96-1c1e14b36517@hisilicon.com>
Date: Wed, 10 Sep 2025 11:27:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] irqchip/gicv3-its: Add workaround for HIP09/HIP10/HIP10C
 erratum 162100803/162200807/162400807
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangwudi@hisilicon.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>, <yuzenghui@huawei.com>,
	Nianyao Tang <tangnianyao@huawei.com>, Kunkun Jiang <jiangkunkun@huawei.com>
References: <20250909110615.129179-1-wangzhou1@hisilicon.com>
 <86h5xbd8zp.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <86h5xbd8zp.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_202722_105044_58F5CFBF 
X-CRM114-Status: GOOD (  45.69  )
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

On 2025/9/9 21:57, Marc Zyngier wrote:
> On Tue, 09 Sep 2025 12:06:15 +0100,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> HIP09/HIP10/HIP10C ITS have a problem, an ITS RAS will be reported in
>> some cases when GICv4.1 is enable.
> 
> Do you mean a RAS *error*? Why can't the firmware ignore this event instead?

Not only a RAS error, vSGI will be lost :(  I will add this information.

> 
>> A workaround is that set ITT size to max value(0xf) when doing MAPD with V = 1,
>> and avoid to send MAPD with V = 0 to hardware. Just clear V field in ITS device
>> table and clear ITS cache to implement MAPD with V = 0 instead.
>>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>> Reviewed-by: Nianyao Tang <tangnianyao@huawei.com>
>> Reviewed-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>  Documentation/arch/arm64/silicon-errata.rst |   6 ++
>>  arch/arm64/Kconfig                          |  13 +++
>>  drivers/irqchip/irq-gic-v3-its.c            | 114 +++++++++++++++++---
>>  3 files changed, 119 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index b18ef4064bc0..dfafc608dc57 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -264,6 +264,12 @@ stable kernels.
>>  +----------------+-----------------+-----------------+-----------------------------+
>>  | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100803      | HISILICON_ERRATUM_162100803 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip10           | #162200807      | HISILICON_ERRATUM_162100803 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip10c          | #162400807      | HISILICON_ERRATUM_162100803 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>  +----------------+-----------------+-----------------+-----------------------------+
>>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index e9bbfacc35a6..803df402c9af 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1270,6 +1270,19 @@ config HISILICON_ERRATUM_162100801
>>  
>>  	  If unsure, say Y.
>>  
>> +config HISILICON_ERRATUM_162100803
>> +	bool "Hip09/10/10c 162100803/162200807/162400807 erratum support"
>> +	default y
>> +	help
>> +	  There is a hardware conflict between vSGI and vLPI, fix it by
>> +	  configure a max ITS ITT size 0xf when doing MAPD with V = 1, clear V
>> +	  field in ITS device table and clear ITS cache to implement MAPD with
>> +	  V = 0 instead. Hip09/10/10c have this same problem, just use
>> +	  HISILICON_ERRATUM_162100803 as the compile macro and
>> +	  ITS_FLAGS_WORKAROUND_HISILICON_162100803 as ITS flag for convenience.
>> +
> 
> I don't think any of the details belong to Kconfig. You don't even
> explain *what* the problem is (hardware conflict doesn't mean
> much). It is also completely unclear what MAPD has to do with vSGI and
> vLPI.
>

The hardware problem is a little tricky, let me try to explain.

In the case of ITS pipeline back-pressure, ITS hardware will mistake vSGI for vLPI,
then use a wrong "eventid" to do ITT size RAS checking, if the "eventid" is larger
than internal cached ITT size, an ITS RAS will be reported and related irq will be
discarded.

So one way to fix this problem is to let the internal cache ITT size to be a very
large value, above problem will not be triggered. Above mistake only happens in
certain step of ITS pipeline, so after above step, ITS hardware still consider the
irq as a vSGI...

Only MAPD can change internal cache ITT size, so we hack MAPD here...

>> +	  If unsure, say Y.
>> +
>>  config QCOM_FALKOR_ERRATUM_1003
>>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>>  	default y
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 467cb78435a9..647bc70cc2f7 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -49,6 +49,7 @@
>>  #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
>>  #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
>>  #define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
>> +#define ITS_FLAGS_WORKAROUND_HISILICON_162100803	(1ULL << 5)
>>  
>>  #define RD_LOCAL_LPI_ENABLED                    BIT(0)
>>  #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
>> @@ -716,7 +717,12 @@ static struct its_collection *its_build_mapd_cmd(struct its_node *its,
>>  
>>  	its_encode_cmd(cmd, GITS_CMD_MAPD);
>>  	its_encode_devid(cmd, desc->its_mapd_cmd.dev->device_id);
>> -	its_encode_size(cmd, size - 1);
>> +
>> +	if (its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100803)
>> +		its_encode_size(cmd, 0xf);
> 
> You are telling the ITS that it is allowed to go and access
> unspecified data (16 bit worth of translations). That's not
> acceptable. If you *have* to do that, then override the size in the
> driver code to actually allocate the corresponding memory.

Then we have to override the ITT memory to 2 ^ 16 * 8 for one device :(

> 
>> +	else
>> +		its_encode_size(cmd, size - 1);
>> +
>>  	its_encode_itt(cmd, itt_addr);
>>  	its_encode_valid(cmd, desc->its_mapd_cmd.valid);
>>  
>> @@ -725,6 +731,61 @@ static struct its_collection *its_build_mapd_cmd(struct its_node *its,
>>  	return NULL;
>>  }
>>  
>> +static struct its_baser *its_get_baser(struct its_node *its, u32 type)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
>> +		if (GITS_BASER_TYPE(its->tables[i].val) == type)
>> +			return &its->tables[i];
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct its_collection
>> +*its_build_mapd_cmd_hisi_quirk(struct its_node *its, struct its_cmd_block *cmd,
>> +			       struct its_cmd_desc *desc)
>> +{
>> +	struct its_baser *baser = its_get_baser(its, GITS_BASER_TYPE_DEVICE);
>> +	u32 devid = desc->its_mapd_cmd.dev->device_id;
>> +	void *base = baser->base;
>> +	u32 *dt_entry;
>> +	void __iomem *its_func_en = its->sgir_base + 0x80;
>> +	u32 tmp, tmp1, mask = 1 << 19;
>> +	int i = 100;
>> +
>> +	/*
>> +	 * Modify v to 0 in the dt entry of devid, dt entry format as below:
>> +	 * word0: [0-31] ITT address; word1: [0-7] ITT address, [8-12]: ITT
>> +	 * size, [13]: V. Only support flat device table.
> 
> Do you mean that the HW only supports flat tables? Or that you expect
> the kernel to only produce flat device tables?

Our hardware only support flat table, so here only consider flat table.
Will modify the comment to make it clearer.

> 
>> +	 */
>> +	dt_entry = (u32 *)(base + devid * 8 + 4);
>> +	*dt_entry &= ~(1 << 13);
>> +
>> +	dsb(ishst);
> 
> Is this always cacheable memory? Does the ITS always snoop the CPU
> caches? What protects against a concurrent access?

Yes，CPU and ITS is CC for DT table. HW follows the config in GITS_BASER.InnerCache.

> 
>> +
>> +	/*
>> +	 * Cache invalidate by a private register GITS_FUNC_EN, whose offset
>> +	 * is 0x20080 of ITS base address. GICv4.1 already maps sgir_base
>> +	 * (offset is 0x20000), so address of GITS_FUNC_EN can be got by
>> +	 * sgir_base + 0x80. Bit 16 is used to clear DT cache, the flip of
>> +	 * bit 19 indicates that DT cache has been cleared.
>> +	 */
>> +	while (--i) {
>> +		tmp = readl_relaxed(its_func_en) & mask;
>> +		writel_relaxed(tmp | (1 << 16), its_func_en);
>> +		tmp1 = readl_relaxed(its_func_en) & mask;
>> +		if (tmp != tmp1)
>> +			break;
>> +	}
> 
> Please define these bits so that they have names instead of using raw
> values. Why do you need to write bit 16 every time? Surely once you
> have written it *once*, the HW remember what it has been told to do?

HW will not remember it, so we have to write bit 16 every time.

> 
> And frankly, using readl_relaxed_poll_timeout_atomic should be the
> right thing to do.

The HW logic is that write bit 16 will trigger DT cache clear in one HW cycle
or not. NOT that waiting bit 19 to flip.

> 
>> +
>> +	if (i == 0)
>> +		WARN_ON(1);
>> +
>> +	return NULL;
>> +}
>> +
>>  static struct its_collection *its_build_mapc_cmd(struct its_node *its,
>>  						 struct its_cmd_block *cmd,
>>  						 struct its_cmd_desc *desc)
>> @@ -1306,11 +1367,18 @@ static void its_send_inv(struct its_device *dev, u32 event_id)
>>  static void its_send_mapd(struct its_device *dev, int valid)
>>  {
>>  	struct its_cmd_desc desc;
>> +	its_cmd_builder_t fn;
>> +
>> +	if (dev->its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100803 &&
>> +	    valid == 0)
>> +		fn = its_build_mapd_cmd_hisi_quirk;
> 
> Make the new helper handle both values of the valid bit.

OK.

> 
>> +	else
>> +		fn = its_build_mapd_cmd;
>>  
>>  	desc.its_mapd_cmd.dev = dev;
>>  	desc.its_mapd_cmd.valid = !!valid;
>>  
>> -	its_send_single_command(dev->its, its_build_mapd_cmd, &desc);
>> +	its_send_single_command(dev->its, fn, &desc);
>>  }
>>  
>>  static void its_send_mapc(struct its_node *its, struct its_collection *col,
>> @@ -3354,18 +3422,6 @@ static struct its_device *its_find_device(struct its_node *its, u32 dev_id)
>>  	return its_dev;
>>  }
>>  
>> -static struct its_baser *its_get_baser(struct its_node *its, u32 type)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
>> -		if (GITS_BASER_TYPE(its->tables[i].val) == type)
>> -			return &its->tables[i];
>> -	}
>> -
>> -	return NULL;
>> -}
>> -
>>  static bool its_alloc_table_entry(struct its_node *its,
>>  				  struct its_baser *baser, u32 id)
>>  {
>> @@ -4902,6 +4958,16 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>>  	return true;
>>  }
>>  
>> +static bool __maybe_unused its_enable_quirk_162100803(void *data)
>> +{
>> +	struct its_node *its = data;
>> +
>> +	if (is_v4_1(its))
>> +		its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_162100803;
>> +
>> +	return true;
>> +}
>> +
>>  static const struct gic_quirk its_quirks[] = {
>>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>>  	{
>> @@ -4956,6 +5022,26 @@ static const struct gic_quirk its_quirks[] = {
>>  		.init	= its_enable_quirk_hip09_162100801,
>>  	},
>>  #endif
>> +#ifdef CONFIG_HISILICON_ERRATUM_162100803
>> +	{
>> +		.desc = "ITS: Hip09 erratum 162100803",
>> +		.iidr = 0x00051736,
>> +		.mask = 0xffffffff,
>> +		.init = its_enable_quirk_162100803,
>> +	},
>> +	{
>> +		.desc = "ITS: Hip10 erratum 162200807",
>> +		.iidr = 0x01051736,
>> +		.mask = 0xffffffff,
>> +		.init = its_enable_quirk_162100803,
>> +	},
>> +	{
>> +		.desc = "ITS: Hip10c erratum 162400807",
>> +		.iidr = 0x00061736,
>> +		.mask = 0xffffffff,
>> +		.init = its_enable_quirk_162100803,
> 
> Can you try to merge these three entries and adjust the mask
> accordingly? mask=0xeffcffff should do the trick, assuming that you
> don't have any other hardware overlapping this.

The iidrs are different, how to merge these entries?

> 
>> +	},
>> +#endif
>>  #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
>>  	{
>>  		.desc   = "ITS: Rockchip erratum RK3588001",
> 
> If the HW is this bad, and that this only affects virtual interrupts,
> why don't you simply disable GICv4 support? Messing with the internals
> of the ITS tables feels like a pretty bad idea. Or as I suggested
> above, get the firmware to ignore RAS events from the ITS.

The hack is ugly, but we want to try to save vSGI direct injection...

Best,
Zhou

> 
> 	M.
> 

