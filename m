Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF3EF3C999
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2BIaLrHmTdiO79bYx9b6ErOuUG3GaaTJ6BAtvYvqsU=; b=pb/eKk64d8qr6WbdcAWDsIgt5v
	24OEIhMjgzY5UysEBqDly7l57eMz562l3Qcq9p0HWCI02QkdvFuHOrLa+0fhbIVA5PqKoCeq5EIIg
	j6uZS1sLwVCyLkdWNQIuECFt/eCnIcbqSozRmHvgulleB9jx51micivbG3oZNUuZ+508blqc6NCEF
	6Hn2Vj3BJ5sO3wn/m56RivYLgbCXysmU8MqZPwKsUXP0XtViGjbfm6SqQkJ3cDB5MaNqbMEdc9gJX
	l/lZPwbBAUkpvYUBZAbGhZ0etxlQ5BtLKzl1Fb8G32497fCmc+5rZYpQ17sO9BcMBF2jtbx4Du0s6
	XlG25c6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuK3-00000002Jf4-019M;
	Tue, 24 Feb 2026 15:27:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuK0-00000002Je8-2iNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80A2339;
	Tue, 24 Feb 2026 07:27:28 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD7AF3F59E;
	Tue, 24 Feb 2026 07:27:29 -0800 (PST)
Message-ID: <78af29ea-772a-4fbb-8a34-dbc2760d6415@arm.com>
Date: Tue, 24 Feb 2026 15:27:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
From: Ben Horgan <ben.horgan@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <9945d28e-f1f2-e11a-1481-8d80167d6f89@huawei.com>
 <b844c632-c8fc-48f1-b347-07f166019b22@arm.com>
 <28dbde39-5b21-5f2f-59f5-4500c8b0296d@huawei.com>
 <2f2410a0-69dd-4da5-bd84-d168ba6b0605@arm.com>
Content-Language: en-US
In-Reply-To: <2f2410a0-69dd-4da5-bd84-d168ba6b0605@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072736_799406_D034AA9F 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Zeng,

On 2/24/26 14:19, Ben Horgan wrote:
> Hi Zeng,
> 
> On 2/24/26 11:03, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/2/16 20:22, Ben Horgan wrote:
>>> Hi Zeng,
>>>
>>> On 2/14/26 09:40, Zeng Heng wrote:
>>>> Hi Ben,
>>>>
>>>> On 2026/2/4 5:43, Ben Horgan wrote:
>>> [...]
>>>>>
>>>>> Based on:
>>>>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
>>>>> (To include telemetry code which changes the resctrl arch interface)
>>>>>
>>>>> The series can be retrieved from:
>>>>> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v4
>>>>> (Final commit is a fix already in 6.19-rc8)
[...]
>>>> [   10.978497] mpam:mpam_resctrl_pick_caches: class 255 is not a cache
>>>> [   10.980470] mpam:mpam_resctrl_pick_mba: class 2 is before L3

This debug message was removed in v4 of the series.
v3 has it: https://lore.kernel.org/linux-arm-kernel/20260112165914.4086692-28-ben.horgan@arm.com/
v4 doesn't: https://lore.kernel.org/linux-arm-kernel/20260203214342.584712-27-ben.horgan@arm.com/

Do you know which version of the series you were running?

>>>> [   10.980472] mpam:mpam_resctrl_pick_mba: class 3 has no bandwidth
>>>> control
>>>> [   10.997406] mpam:topology_matches_l3: class 255 component 0 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   10.997411] mpam:mpam_resctrl_pick_mba: class 255 topology doesn't
>>>> match L3
>>>> [   10.997415] mpam:mpam_resctrl_pick_counters: class 2 is before L3
>>>> [   11.024109] mpam:topology_matches_l3: class 3 component 276 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   11.024114] mpam:class_has_usable_mbwu: monitors usable in free-
>>>> running mode
>>>
>>> mbwu enabled?
>>
>> The fact that the number of monitors merely satisfies the conditions for
>> free-running mode does not imply that the MBWU functionality can be
>> successfully mounted. The specific reasons are explained above.
> 
> True
> 
>>
>>>
>>>> [   11.063882] mpam:topology_matches_l3: class 255 component 0 has
>>>> Mismatched CPU mask with L3 equivalent
>>>> [   11.113183] mpam:mpam_resctrl_alloc_domain: Skipped monitor domain
>>>> online - no monitors
>>>> [   11.113189] MPAM enabled with 32 PARTIDs and 4 PMGs
>>>>
>>>>
>>
>> Sorry for the late reply. And this is my first day back from a long
>> vacation.
> 
> No problem. Hope you had a good holiday.
> 
>>
>>
>> Best regards,
>> Zeng Heng
> 
> Thanks,
> 
> Ben
> 
> 


Thanks,

Ben


