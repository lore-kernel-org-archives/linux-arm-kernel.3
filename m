Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434BCFB5EA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npqisdMt8oIKpuDnHDNfunqQp27m9oVGG0vr418yV5k=; b=RdaLIZgyXPuDXy+CrwZ8C7ENTh
	aUMRZBebL6pNcZ7ewadNeDADtoZ9J9CKdwHepCJKCJPhUzJtWGgj05pVlzv6ET9HQ5NA0VArV3zSn
	UM4RF4Ml/QSt9LAXUVuXVPEPuxxaFVIlq+AWhAaaCebME/v0yACB3MwaGdVCra6QZ8NLOq0F1Lueo
	LpdmVQyVYb+yPVDzwaD7lWHqyqbOR+z8yBgvXOqv+ieGYwhdxpoXDyJdJz8ZiAyzopORvbQEHxfnr
	bkVFGNXKRCmX4XJYrA8szXgIIasJngwE/NqLOqDg6A1ocRRRwZ2XL7H29cVcPeo20lMZXGEKO7vyP
	1EmUqMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JUT-00000005CxA-1eRM;
	Tue, 17 Mar 2026 01:45:01 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JUQ-00000005Cw6-1NLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:45:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=npqisdMt8oIKpuDnHDNfunqQp27m9oVGG0vr418yV5k=;
	b=i6ffHD+14XlPe5Pv5++xvp1Ty2yClbmxmpXdPj/is9aq+rbv9pJ0tTZxZxW3+4/Rvqrp4H9wm
	YqAsA27kc5Jh/B/EMs47veicFGoxy2IHfEjCe8MIdlic3v0uuGnEyuaofSPsbm83fgyvmb8up4i
	eT5t6z4fLDWcKReiY3mIl2c=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fZZQK11kjz1K96t;
	Tue, 17 Mar 2026 09:39:53 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 95CF740562;
	Tue, 17 Mar 2026 09:44:49 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 09:44:49 +0800
Message-ID: <7bf4849c-b220-4bd9-b3a8-f7a16c7acec6@huawei.com>
Date: Tue, 17 Mar 2026 09:44:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
 <68add41b-bafa-4884-be70-c03d6ce851eb@arm.com>
 <1a42d502-a2c4-4c41-ba7e-4dc115159ed6@huawei.com>
 <e2fb2f38-2a31-473e-9ab2-efae8e7a0303@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <e2fb2f38-2a31-473e-9ab2-efae8e7a0303@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_184458_827570_CCDFA79E 
X-CRM114-Status: GOOD (  13.27  )
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



On 2026/3/17 00:26:00, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2026-03-16 3:35 pm, Qinxin Xia wrote:
>>>> +    /* 32-bit control registers */
>>>> +    seq_printf(seq, "CR0: 0x%08x [%s%s%s]\n",
>>>> +           readl_relaxed(base + ARM_SMMU_CR0),
>>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_SMMUEN ?
>>>> +           "Enabled " : "Disabled ",
>>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_EVTQEN ?
>>>> +           "EventQ " : "",
>>>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_CMDQEN ?
>>>> +           "CmdQ " : "");
>>>
>>> There's really no point printing these extra strings, since if any of 
>>> those were *not* enabled then we'd have already failed probe and 
>>> never created the debugfs entry. And if anyone ever were to be trying 
>>> to change the driver behaviour at that level, I'd very much expect 
>>> them to be able to be able to read the bottom 4 bits of a CR0 value 
>>> in hex anyway ;)
>>>
>>> Thanks,
>>> Robin.
>>>
>>
>> Since Kunpeng supports ECMDQ(have not been submitted upstream), the
>> intention was to check whether the SMMU supports ECMDQ, and the logging
>> for other queues was added incidentally. The prints for the event queue
>> and command queue indeed seem unnecessary. I will remove them in the
>> next version.
> OK, I would make a similar argument that even then, it wouldn't make 
> sense to expose debugfs entries for ECMDQ_PROD registers that don't 
> exist or we aren't using. Thus their enabled state should similarly be 
> inherent in the files being present at all (but again either way, if a 
> developer couldn't tell the significance of 0x80xxxxxx vs. 0x00xxxxxx 
> already then I'd have to question their capability to usefully debug any 
> more subtle ECMDQ behaviour...)
> 
> Thanks,
> Robin.
> 

You're right.
-- 
Thanks,
Qinxin


