Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E44D2ECE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt0yF1gUFNzqnjb415Zqgjzh682XK2d9h0diu4AC/GI=; b=T06nrjW2a8yGPJNP3IlcdtLkwN
	//OstwjbjeRouKPreHMUcWJN8DQbEwvXA2qu+OpMnvuP5zKlShdaxxg0RysCxh0trv6ThrVPwZs83
	Z9ACiqQCrl4KlT2fjMoLDMuzm5DI3kyXpMyN+guxNnruLZIYFJ/5ZgCReK0Q1x8iw199HibnNB2Nh
	xi5IZ4n1yT8q+SARBPr2sqUu7Fjdmvg9PblKrHI+N57MpQOPl81sORX6GACgiiAgA1HCsIFfxE3GJ
	KXVf3ldLrLLwHfpZZaVuFGW1JkGetZPYQmf6rhn7lXjxLNwwy8qxS/tKRFwxC8FKPW9YMe1y+aK02
	8A+uup8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvx4-00000002qAN-2aqV;
	Mon, 19 Jan 2026 20:34:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvx1-00000002qA2-1l50
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:34:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8015497;
	Mon, 19 Jan 2026 12:34:06 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891903F694;
	Mon, 19 Jan 2026 12:34:08 -0800 (PST)
Message-ID: <efd5ee5b-f5f5-4efc-abbc-0213b8c60b14@arm.com>
Date: Mon, 19 Jan 2026 20:34:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/47] arm_mpam: resctrl: Pre-allocate assignable
 monitors
From: Ben Horgan <ben.horgan@arm.com>
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
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-32-ben.horgan@arm.com>
 <TYCPR01MB88047C83A1CE49648667437B8B8DA@TYCPR01MB8804.jpnprd01.prod.outlook.com>
 <2ef49c6c-9de8-4aca-9e78-726b8665cdeb@arm.com>
Content-Language: en-US
In-Reply-To: <2ef49c6c-9de8-4aca-9e78-726b8665cdeb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_123416_071338_FEBFF43D 
X-CRM114-Status: GOOD (  16.59  )
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

On 1/16/26 11:04, Ben Horgan wrote:
> Hi Shaopeng,
> 
> On 1/16/26 10:34, Shaopeng Tan (Fujitsu) wrote:
>> Hello Ben,
>>
>>> From: James Morse <james.morse@arm.com>
>>>
>>> When there are not enough monitors, MPAM is able to emulate ABMC by making
>>> a smaller number of monitors assignable. These monitors still need to be
>>> allocated from the driver, and mapped to whichever control/monitor group
>>> resctrl wants to use them with.
>>>
>>> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
>>>
>>> When CDP is in use, two monitors are needed so the available number of
>>> counters halves. Platforms with one monitor will have zero monitors when
>>> CDP is in use.
>>>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [...]
>>> +bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>> +{
>>> +       if (r != &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res)
>>> +               return false;
>>> +
>>> +       return mpam_resctrl_abmc_enabled();
>>> +}
>>> +
>>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>>> +{
>>> +       return -EINVAL;
>>> +}
>>
>> $ echo "default" | sudo tee /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> default
>> tee: /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:Invalid argument
>> "return  -EOPNOTSUPP;" might be better.
> 
> I'll keep this as -EINVAL in the case when 'enable' matches the current mode
> and change it to return 0 when there is nothing to change. This will match the 

Actually, resctl_arch_cntr_assign_set() only gets called on an attempt
to change the value so I'll keep it as is.

> behaviour once this is handled in resctrl. See the outcome of the discussion on
> this resctrl patch [1] Note, that I haven't yet updated the patch to match the 
> discussion. Any objection?
> 
> [1] https://lore.kernel.org/lkml/bf8bb682-6a4d-4f39-916c-952719fcf48d@arm.com/
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


