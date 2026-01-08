Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B9D185CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+qnn6TED72I3GKeAKAScex0MpQZJdmQn7zb+oUHHi4=; b=1Kl49a1WNLDLEgGOSQENly1D+V
	RAuF5N54CjhwTXV4oiC/gnpS/xgGLoParkdDM/JnOG9gKBYv/MMi3QEucF+cCZtr+7tpnktGBHPR5
	qftSb4QlZ0M2cSVcBoO7kAOZNqnn3cdqnhXvH2g9qWwfY81JH7YJLZTjmRPx4mXsH1eXnhc5/bK5X
	OBdXzRS/07KleZNmAPUIqMPkaTvZjbDpaXjnvYevW6xQ0KioCpekXAs6iTfuEG3LuaY4f+AU0ZaNz
	xmST++iUrjaz9uQWKmgVufi2b+hsHk6Cm/Bq73WrbAfv7aiPaBalC+KhoiQlds4LzGwhT/kqUuQbO
	pKC+zEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncw-0000000Giat-12Uq;
	Thu, 08 Jan 2026 10:52:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdncl-0000000GiM6-3wS3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 10:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J+qnn6TED72I3GKeAKAScex0MpQZJdmQn7zb+oUHHi4=; b=j/LxuvKaZI7AymqlzPzw4zglOb
	7nVNLS6NaKWTYzg0QXm368jqSPBWrG3Cx2PzVVK5J0qa+VsWFqsQouxEldHH0tBJfeccb7MiFiMXD
	srKmUuHn27exfnz2xjobLFxou7mgK8VagICdL8dB40UKUmbmrSbZOj9Jn8bZw9pCT9MpkXcolycJY
	Qo6cim6rljeAXTsqFxPRA7inH0l+u0jKJfnBF1/W6AkeA+6EH+yJ78Qc2SWU5ODbzfQlhqP2rNsqh
	4wK0aA+s8M9VOb8ReyIrITSLgzZWlXyeDoogf1PJZHmCFWeYbX6vo8VIxWUqUHCy72R8SQT7OsnVj
	dPIHdjRg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnci-0000000Cy6G-1qrU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 10:52:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA494497;
	Thu,  8 Jan 2026 02:52:02 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27633F6A8;
	Thu,  8 Jan 2026 02:52:02 -0800 (PST)
Message-ID: <adcc278e-6be6-4658-821a-eb8995d65512@arm.com>
Date: Thu, 8 Jan 2026 10:52:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/45] arm_mpam: resctrl: Add support for csu counters
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
 <20251219181147.3404071-28-ben.horgan@arm.com>
 <OSZPR01MB87980DA8A2534414337384608B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB87980DA8A2534414337384608B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_105212_925204_0D7DCA61 
X-CRM114-Status: GOOD (  20.99  )
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

On 1/8/26 10:44, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl exposes a counter via a file named llc_occupancy. This isn't really
>> a counter as its value goes up and down, this is a snapshot of the cache
>> storage usage monitor.
>>
>> Add some picking code to find a cache as close as possible to the L3 that
>> supports the CSU monitor.
>>
>> If there is an L3, but it doesn't have any controls, force the L3 resource
>> to exist. The existing topology_matches_l3() and
>> mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
>> even if the class belongs to a later cache.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> Allow csu counters however many partid or pmg there are
>> else if -> if
>> reduce scope of local variables
>> drop has_csu
>> ---
>>  drivers/resctrl/mpam_internal.h |   6 ++
>>  drivers/resctrl/mpam_resctrl.c  | 148 ++++++++++++++++++++++++++++++++
>>  2 files changed, 154 insertions(+)
[...]
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index f8d8c241797a..5fde610cc9d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
[...]
>>  
>> +static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>> +                                     enum resctrl_event_id type)
>> +{
>> +       struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +       struct rdt_resource *l3 = &res->resctrl_res;
>> +
>> +       lockdep_assert_cpus_held();
>> +
>> +       /* There also needs to be an L3 cache present */
>> +       if (get_cpu_cacheinfo_id(smp_processor_id(), 3) == -1)
>> +               return;
>> +
>> +       /*
>> +        * If there are no MPAM resources on L3, force it into existence.
>> +        * topology_matches_l3() already ensures this looks like the L3.
>> +        * The domain-ids will be fixed up by mpam_resctrl_domain_hdr_init().
>> +        */
>> +       if (!res->class) {
>> +               pr_warn_once("Faking L3 MSC to enable counters.\n");
>> +               res->class = mpam_resctrl_counters[type].class;
>> +       }
>> +
>> +       /* Called multiple times!, once per event type */
>> +       if (exposed_mon_capable) {
>> +               l3->mon_capable = true;
>> +
>> +               /* Setting name is necessary on monitor only platforms */
>> +               l3->name = "L3";
>> +               l3->mon_scope = RESCTRL_L3_CACHE;
>> +
>> +               resctrl_enable_mon_event(type);
>> +
>> +               /*
>> +                * Unfortunately, num_rmid doesn't mean anything for
>> +                * mpam, and its exposed to user-space!
>> +                * num-rmid is supposed to mean the number of groups
>> +                * that can be created, both control or monitor groups.
>> +                * For mpam, each control group has its own pmg/rmid
>> +                * space.
>> +                */
>> +               l3->mon.num_rmid = 1;
>> +       }
>> +}
> 
> Dave posted the following patch, Will you apply it?
> https://lore.kernel.org/lkml/20250820131621.54983-1-Dave.Martin@arm.com/

Thanks for the reminder. I'll squash that into this patch.

> 
> Best regards,
> Shaopeng TAN
> 
> 

Thanks,

Ben


