Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5090E73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+/hSF8U32YI38g24kOHN/0rHhkgRJN4R0JYtNrmTyE=; b=qiFl8imsnsj/vHCponRek8vA8l
	hG5fAUwEUTWccPGW+gNwEd4MkYTG+oDu/9L8Ky6mEJjc2ykGrj6qgEYUdghY/8b8wz/SwOO5nHbgI
	LhWRJIo1BbfhhU1ROPFUDOpwhVqEV7gLf7R4bBu/MKQ0OIoMWZx2FQCd/74HTA4zX7CAvQhWnYk4q
	J8zwy/5pIXBFogH1rploV9jYB1+Aa9OxVDQsNuVfWy0xQrv/QsFBJIZdrFlz2yJ5t9pu+wajrerR1
	kF35+Ub58sejni/WP1t8cnIh83sBfBproHaYBdo083Ny5lv2zGQQ8+lU+GoenknO4UekgjrV2r0lu
	RkyEfK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtkl-00000004zZJ-3F0e;
	Mon, 02 Feb 2026 13:14:07 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtki-00000004zYn-3sCW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:14:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0+/hSF8U32YI38g24kOHN/0rHhkgRJN4R0JYtNrmTyE=;
	b=CME7ksMrmTnNOwaH8sbN2u3CDyvnFjhvikWbQhTkKjz/gKXqmzpTA0umnU3Dgpx7xdg7yudWL
	PBieofaAcfo9PVuuXd9BhmgB4BmO2ZxjkcIYmxChZSUp7n3etO5FsADQaFBcUrt42MvHcrrHeKh
	uaVMtgSgf0LWXn0x3vXSzP4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f4Rlc2vQGzRhTJ;
	Mon,  2 Feb 2026 21:09:16 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id E6FF440569;
	Mon,  2 Feb 2026 21:13:48 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 2 Feb 2026 21:13:47 +0800
Message-ID: <43cd50df-cd95-4840-3d2d-917f8c9ca45e@huawei.com>
Date: Mon, 2 Feb 2026 21:13:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<miko.lenczewski@arm.com>, <thuth@redhat.com>, <mark.rutland@arm.com>,
	<yeoreum.yun@arm.com>, <robh@kernel.org>, <james.clark@linaro.org>,
	<ahmed.genidi@arm.com>, <xry111@xry111.site>, <oupton@kernel.org>,
	<lpieralisi@kernel.org>, <catalin.marinas@arm.com>,
	<mrigendra.chaubey@gmail.com>, <suzuki.poulose@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <broonie@kernel.org>, <will@kernel.org>,
	<kevin.brodsky@arm.com>, <leo.yan@arm.com>, <anshuman.khandual@arm.com>,
	<yang@os.amperecomputing.com>, <frederic@kernel.org>, <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<leijitang@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
References: <20260104133434.1887677-1-zengheng4@huawei.com>
 <37f87d5d-bd70-4b13-93e0-8024108be948@arm.com>
 <0944256a-bcc6-56fa-e3f9-eb3a83c45505@huawei.com>
 <9006b698-6fb6-4dc0-a7c6-de3fb27fb073@arm.com>
 <9dbb9767-f616-4f62-996a-08ee8d580521@arm.com>
 <ad158aad-741e-416d-a6dd-58259c0ce940@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <ad158aad-741e-416d-a6dd-58259c0ce940@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_051405_608770_A1AEC718 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Ben,

On 2026/1/29 0:29, Ben Horgan wrote:
> 
> 
> On 1/28/26 15:55, Ben Horgan wrote:
>> Hi Zeng,
>>
>> On 1/28/26 14:37, Ben Horgan wrote:
>>> Hi Zeng,
>>>
>>> On 1/28/26 08:54, Zeng Heng wrote:
>>>>
>>>>
>>>> On 2026/1/27 22:30, Ben Horgan wrote:
>>>>> Hi Zeng,
>>>>>
>>>>> On 1/4/26 13:34, Zeng Heng wrote:
>>>>>> According to the MPAM spec [1], the supported architecture versions are
>>>>>> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
>>>>>> identical, but v0.1 additionally supports the FORCE_NS feature.
>>>>>>
>>>>>> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
>>>>>> F0_EL1.   | F1_EL1.   | Architecture   |
>>>>>> MPAM      | MPAM_frac | version        |
>>>>>> ---------------------------------------------------------------------------
>>>>>> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>>>>>>             |           |                | MPAM v0.1 is the same as
>>>>>> MPAM v1.1
>>>>>>             |           |                | with FORCE_NS which is
>>>>>>             |           |                | incompatible with MPAM v1.0.
>>>>>> ---------------------------------------------------------------------------
>>>>>> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
>>>>>> ---------------------------------------------------------------------------
>>>>>> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>>>>>>             |           |                | MPAM v1.1 includes all
>>>>>> features of
>>>>>>             |           |                | MPAM v1.0.
>>>>>>             |           |                | It must not include FORCE_NS.
>>>>>>
>>>>>> FORCE_NS is a feature that operates in EL3 mode. Consequently, the
>>>>>> current
>>>>>> Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1,
>>>>>> the
>>>>>> existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
>>>>>> version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
>>>>>> as well.
>>>>>>
>>>>>> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en
>>>>>>
>>>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>>>> So far we've avoided added MPAM 0.1 support as we don't know of any
>>>>> machines using it. What's your motivation here? Do you have a machine
>>>>> with MPAM 0.1 that runs mainline linux?
>>>>>
>>>>
>>>> Thank you for your questions and for reviewing this proposal.
>>>>
>>>> Regarding your inquiry about hardware usage and motivation:
>>>>
>>>> Our KunPeng 920C chip (and numerous legacy SoCs in the same family)
>>>> indeed implement MPAM v0.1 extensions. These are widely deployed in
>>>> server and embedded equipment. More importantly, the product roadmap for
>>>> these platforms explicitly includes migration to mainline Linux kernels
>>>> MPAM driver for long-term support, making upstream MPAM v0.1 driver
>>>> support is a critical requirement.
>>>
>>> Thanks for the explanation. It does seem worthwhile to add mpam 0.1
>>> support.
>>>
>>>>
>>>> In the other hand, MPAM v0.1 extension version is formally documented in
>>>> the ARM MPAM architecture specification (still included in the newest
>>>> ARM DDI 0598D.b version). The specification explicitly defines v0.1 as a
>>>> valid implementation for earlier hardware. Supporting documented
>>>> architectural features is essential for the goal of hardware
>>>> compatibility.
>>>>
>>>> About technical compatibility, the MPAM v0.1 is designed as a
>>>> functionally compatible extension with the existing MPAM driver
>>>> framework. After having tested this on actual Kunpeng 920C hardware
>>>> and other MPAM v1.0 platforms running mainline kernels, this ensures
>>>> zero regression risk for v1.0/v1.1 users.
>>>>
>>>
>>> I've tried your patch with a model, FVP_Base_RevC_2xAEMvA, setting mpam
>>> 0.1, 1.0 and 1.1 and the mpam driver probes as expected. For 0.1 this
>>> required commenting out the versioning check in mpam_devices.c. It would
>>> be good if this patch could come together with another updating that check.

Since all MPAM MSCs on my local 920C platform displays v1.0 or v1.1
architecture versions in the AIDR register, I did not include the
version check modification in mpam_devices.c for the v1 patch. For the
sake of compatibility support integrity, it is necessary to include the
change in the v2 patch soon.

>>
>> Apologies, I confused myself with MSC MPAM version vs CPU MPAM version.
>> The CPU MPAM version is what's relevant here and the mpam_devices.c
>> check is just for the MSC. I'll try running this again on the FVP model
>> and actually change the correct version.
>>
> 
> I've actually tried the mpam cpu versions in the FVP model now, and I
> don't see any problems. I don't see any problems in the code either but
> I'm not that familiar with the cpufeatures code so this is not a proper
> review.
> 

Sincere thanks for your testing feedback and review.


Best Regards，
Zeng Heng

