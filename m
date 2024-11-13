Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7326BD597DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 03:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X32hJXSKXyuLTq4R9lt75Tsune+4HWC7brMAnjuouZQ=; b=oRCRRtafuHmm5+rlOuYjmryfH7
	JOQeCgqKD7afdnr7mVz6a0cevBOzZzAELMOwJ3AAsHpjZFyk1YgqTbsZfc+VcS+YN3xjhcx4FU9Ij
	ugWScOB3dbMZTpUtEZFyBhd0gNswAnw2hK1PWmimIgAv2LvkPkbH0SF6M8jzeyjYM89UavNta8SBX
	6aJ+yzEdZlt5JtDEXVBzsOFFqpc+UWnuWTcjtpt1O/eS6ZMZ/1GRoy8/GqhdAEMEx2QDOdmlCLrn9
	VvgZlxp8XtCmqFwDor5cTPxkIvnPhR2EpD/17cvXXYW+bNu3SrDccLB8GSTcKSo1WV/7RhoLKP2QS
	3cnHl7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4E6-00000005giA-3RwJ;
	Wed, 13 Nov 2024 03:39:30 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB4CJ-00000005gdT-2ATX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 03:37:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xp87Z63DWz1SGPx;
	Wed, 13 Nov 2024 11:35:38 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 102AA180042;
	Wed, 13 Nov 2024 11:37:29 +0800 (CST)
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 13 Nov 2024 11:37:28 +0800
Message-ID: <fa65b60a-9277-685c-0bcd-4ee1f9f69fff@hisilicon.com>
Date: Wed, 13 Nov 2024 11:37:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <wangwudi@hisilicon.com>, Nianyao Tang
	<tangnianyao@huawei.com>
References: <20241112090426.1876148-1-wangzhou1@hisilicon.com>
 <874j4ctqrb.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <874j4ctqrb.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_193739_906189_0CFD319B 
X-CRM114-Status: GOOD (  26.57  )
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

On 2024/11/12 23:29, Marc Zyngier wrote:
> On Tue, 12 Nov 2024 09:04:26 +0000,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> during unmapping operation, which will cause some vSGIs lost.
>>
>> To fix the issue, it needs to send VINVALL command after VMOVP.
>>
>> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>> ---
>>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>  arch/arm64/Kconfig                          | 10 +++++++
>>  drivers/irqchip/irq-gic-v3-its.c            | 29 +++++++++++++++++++++
>>  3 files changed, 41 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 65bfab1b1861..77db10e944f0 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -258,6 +258,8 @@ stable kernels.
>>  | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
>>  |                | ,11} SMMU PMCG  |                 |                             |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>  +----------------+-----------------+-----------------+-----------------------------+
>>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>  +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 70d7f4f20225..d41cf6bf1458 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1232,6 +1232,16 @@ config HISILICON_ERRATUM_161600802
>>  
>>  	  If unsure, say Y.
>>  
>> +config HISILICON_ERRATUM_162100801
>> +	bool "Hip09 162100801 erratum support"
>> +	default y
>> +	help
>> +	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> +	  during unmapping operation, which will cause some vSGIs lost.
>> +	  So fix it by sending VINVALL command after VMOVP.
>> +
>> +	  If unsure, say Y.
>> +
>>  config QCOM_FALKOR_ERRATUM_1003
>>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>>  	default y
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index 52f625e07658..e98d13d0adf9 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -44,6 +44,7 @@
>>  #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
>>  #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
>>  #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
>> +#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
>>  
>>  #define RD_LOCAL_LPI_ENABLED                    BIT(0)
>>  #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
>> @@ -3804,6 +3805,7 @@ static int its_vpe_set_affinity(struct irq_data *d,
>>  	struct its_vpe *vpe = irq_data_get_irq_chip_data(d);
>>  	unsigned int from, cpu = nr_cpu_ids;
>>  	struct cpumask *table_mask;
>> +	struct its_node *its;
>>  	unsigned long flags;
>>  
>>  	/*
>> @@ -3866,6 +3868,17 @@ static int its_vpe_set_affinity(struct irq_data *d,
>>  	vpe->col_idx = cpu;
>>  
>>  	its_send_vmovp(vpe);
>> +
>> +	/*
>> +	 * Version of ITS is same in one system. As there is no cache in ITS,
>> +	 * and only cache in related GICR should be clean, so one VINVALL is
>> +	 * enough here.
>> +	 */
>> +	its = list_first_entry(&its_nodes, struct its_node, entry);
>> +	if ((its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801) &&
>> +	    is_v4_1(its))
>> +		its_send_vinvall(its, vpe);
> 
> Can this be done using the GICR_INVALLR register instead? I would
> expect it to be a bit better performance wise, as it doesn't require
> to take a global lock. Something like the hack below (untested).
> 
> Thanks,
> 
> 	M.

Hi Marc,

Many thanks for your suggestion! It is OK in theory and it works fine in test
as well.

I will send V3 soon.

Best,
Zhou

> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index fdec478ba5e7..d30d6ee727c1 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -62,6 +62,8 @@ static u32 lpi_id_bits;
>  
>  static u8 __ro_after_init lpi_prop_prio;
>  
> +static struct its_node *find_4_1_its(void);
> +
>  /*
>   * Collection structure - just an ID, and a redistributor address to
>   * ping. We use one per CPU as a bag of interrupts assigned to this
> @@ -3797,6 +3799,22 @@ static void its_vpe_db_proxy_move(struct its_vpe *vpe, int from, int to)
>  	raw_spin_unlock_irqrestore(&vpe_proxy.lock, flags);
>  }
>  
> +static void its_vpe_4_1_invall_locked(int cpu, struct its_vpe *vpe)
> +{
> +	void __iomem *rdbase;
> +	u64 val;
> +
> +	val  = GICR_INVALLR_V;
> +	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
> +
> +	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
> +	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
> +	gic_write_lpir(val, rdbase + GICR_INVALLR);
> +
> +	wait_for_syncr(rdbase);
> +	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
> +}
> +
>  static int its_vpe_set_affinity(struct irq_data *d,
>  				const struct cpumask *mask_val,
>  				bool force)
> @@ -3849,6 +3867,10 @@ static int its_vpe_set_affinity(struct irq_data *d,
>  	vpe->col_idx = cpu;
>  
>  	its_send_vmovp(vpe);
> +
> +	if (find_4_1_its()->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801)
> +		its_vpe_4_1_invall_locked(cpu, vpe);
> +
>  	its_vpe_db_proxy_move(vpe, from, cpu);
>  
>  out:
> @@ -4156,22 +4178,12 @@ static void its_vpe_4_1_deschedule(struct its_vpe *vpe,
>  
>  static void its_vpe_4_1_invall(struct its_vpe *vpe)
>  {
> -	void __iomem *rdbase;
>  	unsigned long flags;
> -	u64 val;
>  	int cpu;
>  
> -	val  = GICR_INVALLR_V;
> -	val |= FIELD_PREP(GICR_INVALLR_VPEID, vpe->vpe_id);
> -
>  	/* Target the redistributor this vPE is currently known on */
>  	cpu = vpe_to_cpuid_lock(vpe, &flags);
> -	raw_spin_lock(&gic_data_rdist_cpu(cpu)->rd_lock);
> -	rdbase = per_cpu_ptr(gic_rdists->rdist, cpu)->rd_base;
> -	gic_write_lpir(val, rdbase + GICR_INVALLR);
> -
> -	wait_for_syncr(rdbase);
> -	raw_spin_unlock(&gic_data_rdist_cpu(cpu)->rd_lock);
> +	its_vpe_4_1_invall_locked(cpu, vpe);
>  	vpe_to_cpuid_unlock(vpe, flags);
>  }
>  
> 

