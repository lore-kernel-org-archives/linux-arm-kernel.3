Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D3C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fGGTPWZLElbk08tJuLz6jA8yT4KI9gGuJ/+0bHS2BA=; b=oP8btGH/Ca4D7Iz1FleR24PZg2
	6CWZy7jsO1yYoFFSEBfAs69AGCkQSAKASePH9ZxvqlXD3+umX1nB7lEbkQ+PR2pc3jloDUoE+xkw0
	iZtjjReSnv51FO3Sq8RUXKqoxeeWD31OF1uRxZLTATTRsEc/rBsEfFk8c8DYYlZ5/3m4s42x49Ic9
	P5T4TOXCGJpoao0bYOn/aD+8+w5a59NnHOUlQbONQFRbizrQVRoMT4HrQg6neIfSgo/yq1C69AXEF
	1dQn4yFrdSs+VYyMitLzhJPepKSULU7VrPRPSbSnrIOfzWLjm3fwEcAXYA6fN3ycEapiRiMScXdqr
	qB4w8bVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKHG-000000079ln-2YCF;
	Wed, 09 Jul 2025 02:11:18 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKEt-000000079W6-2Wkg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 02:08:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bcLvG3Ym0z2BcpJ;
	Wed,  9 Jul 2025 10:06:50 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 142041800D0;
	Wed,  9 Jul 2025 10:08:46 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Jul 2025 10:08:45 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Jul 2025 10:08:43 +0800
Message-ID: <225bc7df-e08f-6bd9-4cb6-a2104b553823@hisilicon.com>
Date: Wed, 9 Jul 2025 10:08:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ARM64: errata: Add workaround for HIP10/HIP10C erratum
 162200803
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<tangnianyao@huawei.com>, <wangwudi@hisilicon.com>
References: <20250626124142.2035110-1-wangzhou1@hisilicon.com>
 <86wm8ybpk5.wl-maz@kernel.org>
 <0b54db94-8a6f-cea0-a6f7-dbe8650d66dd@hisilicon.com>
 <86h5zwba5i.wl-maz@kernel.org>
 <ffd3fccc-af4a-6667-3cf6-a55e866f3057@hisilicon.com>
 <864ivtbll0.wl-maz@kernel.org>
 <73ee91b8-ba15-2534-ab76-f64e59261b1e@hisilicon.com>
 <86sej6alxo.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <86sej6alxo.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_190851_835263_897E7ED7 
X-CRM114-Status: GOOD (  17.00  )
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

On 2025/7/8 20:47, Marc Zyngier wrote:
> On Tue, 08 Jul 2025 13:05:24 +0100,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> On 2025/7/3 18:44, Marc Zyngier wrote:
>>> On Wed, 02 Jul 2025 10:57:13 +0100,
>>> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>>>
>>>> However，migration between different KVMs will be broken :(
>>>> I am not sure that should we consider this case as well?
>>>
>>> This isn't optional. You cannot break migration on existing systems,
>>> and the only case that *must* break is to restore a VM that hasn't
>>> seen this limitation on a HW that enforces it.
>>
>> So the whole story is that we should let GICD_TYPE.num_LPIs as a
>> writable field, and set this field from VMM(e.g. QEMU). And it will
>> be failed if doing migration between VMs with different num_LPI
>> configurations.
> 
> Note that on a non-broken system, setting num_LPIs to any value should
> always work.
> 
>> After above done, this errata could be added.
> 
> Which would be the only case where num_LPIs wouldn't be writable, and
> set to a fixed value.
> 
> Note that an alternative would be to not have a kernel erratum, but to
> force num_LPIs from userspace when running on your platform. But that
> implies that: you have your own, non-upstream VMM, and that there is
> no opportunity for userspace to adversely impact the system as a whole.

Got it. Seems it is better to have this erratum in kernel.

> 
>> Not sure my thought above is right? I will try to prepare a num_LPIs
>> writable patch if the direction is right.
> 
> I think you got the gist of it.

Thanks a lot for the whole discussion, I will prepare the new patch.

Best,
Zhou

> 
> Thanks,
> 
> 	M.
> 

