Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E0CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 02:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AP5nRqn8HiO7kWk2V0wNJy2RE6mlmulFDtaIJdCmRc=; b=thC/NrPP10tsRIT1GTW23aZc9s
	veoLtBAyQeuroF6Dfne64yOGi64AbKVsVNys8Pxy9r7byW9L2TcO9k94si4Aa14nQRjm554tV+liq
	PwL9s4i9Uy6K8lQs13KABl+YjM2FSQaM8a2RtQdOdI3K4Hm/Dqf/O+EHRVenib+HZr7Q1eoah1tJp
	PxWnb5EXynUzauN2Cz03mDs3M1Cs1mrsdDHNlXbgB8aK99TV/1yQP3aLrS2y38bvMAvXq5b0wnO7Y
	BFl693hT0rGsBN9G30BcLTkcrI0iYHcKV5sZXq/fET8FBykuV84T94O3yX+IOXrQT7Qw81yQ+ei9C
	zzVTgxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4ol-0000000G51c-0Ltv;
	Thu, 18 Sep 2025 02:56:19 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4oh-0000000G515-23YO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 02:56:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cS0XW2bMKz13NhL;
	Thu, 18 Sep 2025 10:51:55 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id E3FF3180B57;
	Thu, 18 Sep 2025 10:56:05 +0800 (CST)
Received: from kwepemq500001.china.huawei.com (7.202.195.224) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 10:56:05 +0800
Received: from [10.67.146.137] (10.67.146.137) by
 kwepemq500001.china.huawei.com (7.202.195.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 10:56:05 +0800
Subject: Re: [PATCH] irqchip/gic-v4.1:Check whether indirect table is
 supported in allocate_vpe_l1_table
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <guoyang2@huawei.com>,
	<wangwudi@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
	<wangzhou1@hisilicon.com>, <guozicheng3@hisilicon.com>
References: <20240122160607.1078960-1-tangnianyao@huawei.com>
 <86sf2p91zt.wl-maz@kernel.org>
 <5de3da53-9c0d-2a2d-876b-2181e540fa2f@huawei.com>
 <86r0i98o0a.wl-maz@kernel.org>
 <de3c10be-f4d4-75d0-bc70-0791e5217516@huawei.com>
 <86v83fmn9l.wl-maz@kernel.org>
From: Tangnianyao <tangnianyao@huawei.com>
Message-ID: <cae508d5-c846-5daf-a1b8-4014f14759e5@huawei.com>
Date: Thu, 18 Sep 2025 10:56:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <86v83fmn9l.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.67.146.137]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500001.china.huawei.com (7.202.195.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_195615_842781_44131403 
X-CRM114-Status: GOOD (  28.92  )
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



On 5/15/2024 17:34, Marc Zyngier wrote:
> On Wed, 15 May 2024 09:56:10 +0100,
> Tangnianyao <tangnianyao@huawei.com> wrote:
>>
>>
>> On 1/22/2024 22:02, Marc Zyngier wrote:
>>> On Mon, 22 Jan 2024 13:13:09 +0000,
>>> Tangnianyao <tangnianyao@huawei.com> wrote:
>>>> On 1/22/2024 17:00, Marc Zyngier wrote:
>>>>> [Fixing the LKML address, which has bits of Stephan's address embedded
>>>>> in it...]
>>>>>
>>>>> On Mon, 22 Jan 2024 16:06:07 +0000,
>>>>> Nianyao Tang <tangnianyao@huawei.com> wrote:
>>>>>> In allocate_vpe_l1_table, when we fail to inherit VPE table from other
>>>>>> redistributors or ITSs, and we allocate a new vpe table for current common 
>>>>>> affinity field without checking whether indirect table is supported.
>>>>>> Let's fix it.
>>>>> Is there an actual implementation that doesn't support the indirect
>>>>> property for the VPE table? I know this is allowed for consistency
>>>>> with the original revision of the architecture, but I never expected
>>>>> an actual GICv4.1 implementation to be *that* bad.
>>>>>
>>>>> If that's the case, I'm a bit puzzled/worried.
>>>> I met this problem in a developing implementation and find it's allowed by GIC spec.
>>>> In such environment,  in a common affinity field with only redistributors and without
>>>> any ITS in it, forcing its_vpe_id_alloc to allocate a large vpeid(like 65000), and there
>>>> comes an error message "VPE IRQ allocation failure". It originally comes from
>>>> allocate_vpe_l2_table, reading GICR_VPROPBASER with GICR_VPROPBASER_4_1_SIZE=1
>>>> and GICR_VPROPBASER_4_1_INDIRECT=0.
>>> Really, you should get your HW engineers to fix their GIC
>>> implementation.  I'm OK with working around this issue for
>>> completeness, but shipping such an implementation would be a mistake.
>>>
>>> [...]
>>>
>>>> I have another question here. The max number of pages  for GITS_BASER
>>>> and GICR_VPROPBASER is different here, while GITS_BASER.Size is
>>>> bit[7:0] with max 256, and GICR_4_1_VPROPBASER.Size is bit[6:0] with max 128.
>>>> Kernel usually probe ITS basers first and then probe GICR_4_1_VPROPBASER in
>>>> a common affinity group. Maybe we need to check this in "inherit_vpe_l1_table_from_its" ?
>>> This is because GITS_BASER[] is generic (also works for devices and
>>> collections), while GICR_VPROPBASER is tailored to the VPE table which
>>> is usually smaller.
>>>
>>> I would expect that GICD_TYPER2.VID reports something that cannot
>>> result in something going wrong (in this case, the L1 allocation
>>> cannot be more than 128 pages).
>>>
>>> Overall, the kernel isn't a validation suite for the HW, and we expect
>>> it to have some level of sanity. So if none of this is in shipping HW
>>> but only in some model with crazy parameters, I don't think we should
>>> go out of our way to support it.
>>>
>>> Thanks,
>>>
>>> 	M.
>>>
>> Hi Marc,
>> Friendly ping. Do we have plan to fix this problem on kernel, or any other plan ?
> Hi Nianyao,
>
> My earlier question still stand: is this something that affects a
> shipping implementation? If not, then I don't think we should support
> this upstream, as this doesn't seem like a realistic configuration.
>
> If your employer has actually built this (which I still consider as a
> mistake), then we can add the workaround I suggested.
>
> Thanks,
>
> 	M.
>
Hi Marc,

For GIC4.1 of HIP09,HIP10,HIP10C, it only support one-level vcpu table and GITS_BASER<n>.Indirect
is RAZ/WI. It implements page size 16KB and entry size 32B,  each page support 512 vpe, and our
clients have requirement 1 or 2 pages at most, so it just supports flat page to simplify implementation.

Our designer has confirmed with ARM architect that we can waive this rule:
Quote from GIC spec 12.19.1 GITS_BASER<n> description, if the maximum width of the scaling factor
that is identified by GITS_BASER<n>.Type and the smallest page size that is supported result in a single
level table that requires multiple pages, then implementing this bit as RAZ/WI is DEPRECATED.

We have actually built this in HIP09,HIP10,HIP10C and would like to fix this in kernel.
Can we merge the above bug-fix patch to kernel?  Or we need to fix with errata for HIP09,HIP10,HIP10C?

thanks for your opinions

Nianyao Tang



