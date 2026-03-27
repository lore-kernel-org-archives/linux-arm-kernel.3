Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F110ED64D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIlhM2qMFo6dSK8GC0TbpDUNloCygSkt2NM9zQRWDGY=; b=akrc0FL6+lD2yB2s9mLB7DJmN/
	HKqXolihl8cbzuaDUGbOp+apeZBwifWoVWNrv35v6W2gQaBrmSY5rNKqQ3eK2/wia/UTZzgb3YqlS
	WqTsq3xKq0PHtbBCQQ1H4Ky5zMc39XJWFX2mqhk8s33aiPoI5PhEP08Qm/ss83GrnioPwpB17F+nn
	cKvkiLcmVpfwMoWuVbxNK5EQ0THD7s4Yau6gAIu6hvzUv1YxXY8/B7CiDenQWBe6ReDPaj0Bpj2M8
	B9HhVKekbDRmhov/lVhqbp0llmrZIETOoSgLvVt0+z1wNDRNcbkM970iOtikdYTJyfgtelRPARbcQ
	jyZIPspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63tV-000000077Fz-1wY9;
	Fri, 27 Mar 2026 09:54:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63tT-000000077Fd-1Xgh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:54:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50FD835A1;
	Fri, 27 Mar 2026 02:54:11 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F09043F915;
	Fri, 27 Mar 2026 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774605257; bh=5KkNXKFXPbf31+6X3nGXCwHQTOliXxDHJhxWm0sK3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WOdpxI4NX3BG+hpX/5RtLozDV1bRMVxWnBxcLH1IQElOZvQMO+mDePmKVd6n1Fv7D
	 5in7PsDiEjcZ5uvFnStVOJHZsud2i9al5Hi0W8xkj6g+9QXEiNENMRmQ7U4rsOj8V7
	 WNK9pTC5PAEJycxNyAAHDQcXCcnFR1wXkftInKhw=
Message-ID: <96b5d9fb-6e94-405d-a395-d7e441387959@arm.com>
Date: Fri, 27 Mar 2026 09:54:12 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
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
 "zengheng4@huawei.com" <zengheng4@huawei.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
 <20260319165540.381410-3-ben.horgan@arm.com>
 <TY4PR01MB16930BFFB7CE7FEB56CA693098B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <TY4PR01MB16930BFFB7CE7FEB56CA693098B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_025419_528879_560F7269 
X-CRM114-Status: GOOD (  16.57  )
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

On 3/27/26 03:00, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory
>> bandwidth monitors assignable. Rather than supporting the 'default'
>> mbm_assign_mode always use 'mbm_event'mode even if there are sufficient
>> memory bandwidth monitors. The per monitor event configuration is only
>> provided by resctrl when in 'mbm_event' mode and so only allowing
>> 'mbm_event' mode will make it easier to support per-monitor event
>> configuration for MPAM. For the moment, the only event supported is
>> mbm_total_event with no bandwidth type configuration. The 'mbm_assign_mode'
>> file will still show 'default' when there is no support for memory
>> bandwidth monitoring.
>>
>> The monitors need to be allocated from the driver, and mapped to whichever
>> control/monitor group resctrl wants to use them with.
>>
>> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
>>
>> When CDP is in use, two monitors are needed so the available number of
>> counters halves. Platforms with one monitor will have zero monitors when
>> CDP is in use.
>>
>> Co-developed-by: James Morse <james.morse@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

>>  
>> +/*
>> + * This must run after all event counters have been picked so that any free
>> + * running counters have already been allocated.
>> + */
>> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>> +{
>> +       struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +       struct rdt_resource *l3 = &res->resctrl_res;
>> +       struct mpam_class *class = mon->class;
>> +       u16 num_mbwu_mon;
>> +       size_t num_rmid = resctrl_arch_system_num_rmid_idx();
>> +
>> +       if (mon->mbwu_idx_to_mon) {
>> +               pr_debug("monitors free running\n");
>> +               return 0;
>> +       }
> 
> ABMC is not supported under this condition. 
> Why does this condition conclude that there are enough monitors(monitors freee running)?

This is just a mistake. I missed removing this condition when support for using mbwu in
"free running"/non-AMBC mode was removed.

Thanks,

Ben

> 
> Best regards,
> Shaopeng TAN
> 

