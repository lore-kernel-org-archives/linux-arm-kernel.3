Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6AFEFD206
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbA09AF1OXQ/oSrogR8WInsNLGYMF3WVGQ4FVTvon0o=; b=xqGw5dkYGY1R+xPzlk3pCw8qxF
	Gg/0U9zFPLJIbeBAM2VNNajbgPiICuyBD1ICPmViCVlhm+uyWoKNIx6n23Ro7JM8pb6skZ6cdDUlY
	giYJkXR3EDnY/6xoTjd3sDYUG8HO8db1JCNMWCnKJrn46OZDeJNuInqEslPgOM4gwiNNmvgdOnQqP
	KcH207QOOlBmWeX2KUuVAYcwMVflzea9IYhbbhR9Ra8/Vhm1FCBSPfHhU8ql3GlzcBJpr4sWI+0yn
	kMpV3LpVp5jiE5bdyb8oqmXNPz/oaUjW+bYOzDiMPZMamHfQv2cEbEofkFsdXSt6wwB3L2RxCOIhN
	C+Eiy85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9wu-00000003T8X-28Bn;
	Wed, 25 Feb 2026 08:08:48 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9wp-00000003T7a-2bJj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:08:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sbA09AF1OXQ/oSrogR8WInsNLGYMF3WVGQ4FVTvon0o=;
	b=N3beNvOnpKvQk4C3ylXTjGIGt2WPFjdoWhYwucPa0oDnRx1SyaoWfr2tUYt47NKkaBNz7rgGS
	b+aT6xvKD0AcjNMQuUgu01dbTwctbju5ar+g0hVWUUQ+g7m/cIrSVILykAOkDHeCp3nIvHyOObG
	B2kV1PZInUI/KO36oKCTfT0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fLRtH60YFz1T4H6;
	Wed, 25 Feb 2026 16:03:35 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8CF8E404AD;
	Wed, 25 Feb 2026 16:08:27 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 25 Feb 2026 16:08:25 +0800
Message-ID: <051fd5f5-0a06-a4b8-9e2d-7dc088205d86@huawei.com>
Date: Wed, 25 Feb 2026 16:08:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 26/41] arm_mpam: resctrl: Add support for 'MB' resource
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>, Reinette Chatre
	<reinette.chatre@intel.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <kobak@nvidia.com>,
	<lcherian@marvell.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<punit.agrawal@oss.qualcomm.com>, <quic_jiles@quicinc.com>,
	<reinette.chatre@intel.com>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <xhao@linux.alibaba.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<maz@kernel.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-27-ben.horgan@arm.com>
 <20260205165018.0000089c@huawei.com>
 <f6f865bc-319c-8944-9989-4fd83a59d4b8@huawei.com>
 <61684bd8-8156-4fe1-8033-eaa12c6d3437@arm.com>
 <1acf06d1-08af-4b05-82e7-655c8ef7cf0e@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <1acf06d1-08af-4b05-82e7-655c8ef7cf0e@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_000845_484389_07880425 
X-CRM114-Status: GOOD (  21.12  )
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



On 2026/2/19 0:22, Ben Horgan wrote:
> Hi Fenghua, Zeng,
> 
> On 2/16/26 13:54, Ben Horgan wrote:
>> Hi Zeng,
>>
>> On 2/13/26 07:38, Zeng Heng wrote:
>>> Hi Ben,
>>>
>>> On 2026/2/6 0:50, Jonathan Cameron wrote:
>>>> On Tue, 3 Feb 2026 21:43:27 +0000
>>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>>
>>>>> From: James Morse <james.morse@arm.com>
>>>>>
>>>>> resctrl supports 'MB', as a percentage throttling of traffic from the
>>>>> L3. This is the control that mba_sc uses, so ideally the class chosen
>>>>> should be as close as possible to the counters used for mbm_total. If
>>>>> there is a single L3 and the topology of the memory matches then the
>>>>> traffic at the memory controller will be equivalent to that at egress of
>>>>> the L3. If these conditions are met allow the memory class to back MB.
>>>>>
>>>>> MB's percentage control should be backed either with the fixed point
>>>>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>>>>> bitmaps is not used as its tricky to pick which bits to use to avoid
>>>>> contention, and may be possible to expose this as something other than a
>>>>> percentage in the future.
>>>>
>>>> I'm very curious to know whether this heuristic is actually useful on
>>>> many
>>>> systems or whether many / most of them fail this 'shape' heuristic.
>>>>
>>>
>>> The current MPAM driver has restrictions that limit MB control support.
>>> For example, on some systems, the MPAM memory class MSCs are not located
>>> at the L3 cache but rather at the memory controller (e.g., Mata). In
>>> such cases, MB control and mbm_total bandwidth monitoring cannot be
>>> enabled.
>>>> I'm unsure whether the community would welcome and be willing to review
>>> a patch series supporting such systems. Of course, the changes would
>>> involve minor refactoring in the resctrl common layer.
>>
>> Having MSC at the memory controllers is quite common and it would be
>> good for the mpam driver and resctrl to support this. My current
>> priority is the initial MPAM support and look at this and other extra
>> features later but I'd be happy to help progress support in this area
>> through review and discussion. There is some discussion about adding new
>> schema at [1] and we should make sure  this is consistent with monitors
>> too. James has some out of tree patches from before that disccussion at [2].
>>
>> [1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
>> [2] git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
>>   mpam/snapshot+extras/v6.18-rc1
> 

Thank you for the information.

> Fenghua gave a talk at LPC on supporting cpu-less numa nodes in resctrl
> so is likely to have some patches/ideas around measuring bandwidth at
> memory controllers.
> 

I also listened to the LPC presentation on this subject. The Kunpeng
memory controller is per-NUMA, however not CPU-less.

 From an interface perspective, the interface that the Kunpeng memory
controller MSC solution aims to provide is somewhat similar to the
approach offered by Reinette:

"
One idea on how to accommodate this from resctrl side:
https://lore.kernel.org/lkml/fb1e2686-237b-4536-acd6-15159abafcba@intel.com/

mon_data
├── mon_L3_00       <== monitoring data at scope L3
│   ├── llc_occupancy
│   ├── mbm_local_bytes
│   └── mbm_total_bytes
├── mon_L3_01       <== monitoring data at scope L3
│   ├── llc_occupancy
│   ├── mbm_local_bytes
│   └── mbm_total_bytes
├── mon_NODE_00     <== monitoring data at scope NODE
│   └── mbm_total_bytes
└── mon_NODE_01     <== monitoring data at scope NODE
     └── mbm_total_bytes
"


Best regards,
Zeng Heng









