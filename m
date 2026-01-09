Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E872DD167F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWaGLgv5UfE7DEtdkmBrJUHOduy849Pp+S+RmL7BJB8=; b=RhVtdNJd9AtEedr4TDRIyULXvi
	BHA9/HkWbz8Z+Tk0XHGWoCEabyAkluAkiQStOyzAPSjD/qgosXx2wPaeBO5pr0LfsLmvsparfkeIF
	dz8QztycWjYAQ+EhB8IfY88qmP1J5ZynGD1LN8EUC1FGayDRIF+Ms2kAvOHKK0CgmTK/ejvEYnnLB
	f3biwmWZSf3Moty9snqC7XMUAxo03wQdcJRjkT4cecJB4Ii1/F4P5nItx19gs+H/WdLgYC2Pxtrgc
	hS3sv0l/oOPr9OLwsyy/Y9vw9Q5Q/HgnS56rC5aW/ZW5+DiH7wSB/ZlNS5KO36DdhrIKZ5LkAel8Z
	Q1IedGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9DV-000000024X1-10Xz;
	Fri, 09 Jan 2026 09:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9DS-000000024Wg-21cf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 575F7497;
	Fri,  9 Jan 2026 01:55:26 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C4643F5A1;
	Fri,  9 Jan 2026 01:55:26 -0800 (PST)
Message-ID: <37dfa4c6-8326-4013-b292-b3e58ff6601c@arm.com>
Date: Fri, 9 Jan 2026 09:55:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/45] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-16-ben.horgan@arm.com>
 <OSZPR01MB87980D7660524C1FF389A4518B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB87980D7660524C1FF389A4518B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_015534_603884_B83F3517 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Shaopeng,

On 1/8/26 10:36, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has its own data structures to describe its resources. We can't use
>> these directly as we play tricks with the 'MBA' resource, picking the MPAM
>> controls or monitors that best apply. We may export the same component as
>> both L3 and MBA.
>>
>> Add mpam_resctrl_exports[] as the array of class->resctrl mappings we are
>> exporting, and add the cpuhp hooks that allocated and free the resctrl
>> domain structures.
>>
>> While we're here, plumb in a few other obvious things.
>>
>> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built even though
>> it can't yet be linked against resctrl.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Domain list is an rcu list
>> Add synchronize_rcu() to free the deleted element
>> Code flow simplification (Jonathan)
>> ---
[...]
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 860181266b15..303aacfcb9d6 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1628,6 +1628,9 @@ static int mpam_cpu_online(unsigned int cpu)
>>                          mpam_reprogram_msc(msc);
>>          }
>>  
>> +       if (mpam_is_enabled())
>> +               mpam_resctrl_online_cpu(cpu);
> 
> return mpam_resctrl_online_cpu(cpu);

Ack

> 
> Considering the fixes added in [PATCH v2 27/45],
> How about changing the code as follows? 
> 
> +		err = mpam_resctrl_control_init(res, i);
> +		if (err) {
> +			pr_debug("Failed to initialise rid %u\n", i);
> +			pr_debug("Internal error %d - resctrl not supported\n", err);
> +			cpus_read_unlock();
> +			return err;
> +		}
> +	}
> +           /* Find some classes to use for monitors */
> +         mpam_resctrl_pick_counters();
> +         for (enum resctrl_event_id j = 0; j < QOS_NUM_EVENTS; j++) {
> +         …
> + }
> +	cpus_read_unlock();

Hmm, probably better to propagate the error from
mpam_resctrl_monitor_init_abmc() rather moving the early exit.

> 
> 
> Best regards,
> Shaopeng TAN
> 
>> +       if (!exposed_alloc_capable && !exposed_mon_capable) {
>> +               pr_debug("No alloc(%u) or monitor(%u) found - resctrl not supported\n",
>> +                        exposed_alloc_capable, exposed_mon_capable);
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>> +       if (!is_power_of_2(mpam_pmg_max + 1)) {
>> +               /*
>> +                * If not all the partid*pmg values are valid indexes,
>> +                * resctrl may allocate pmg that don't exist. This
>> +                * should cause an error interrupt.
>> +                */
>> +               pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
>> +       }
>> +
>> +       /* TODO: call resctrl_init() */
>> +
>> +       return err;
>> +}
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index 7f00c5285a32..2c7d1413a401 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -49,6 +49,9 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>  }
>>  #endif
>>  
>> +bool resctrl_arch_alloc_capable(void);
>> +bool resctrl_arch_mon_capable(void);
>> +
>>  /**
>>   * mpam_register_requestor() - Register a requestor with the MPAM driver
>>   * @partid_max:                The maximum PARTID value the requestor can generate.
>> --
>> 2.43.0

Thanks,

Ben


