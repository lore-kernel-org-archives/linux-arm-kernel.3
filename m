Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC141112259
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROWEGxqksQxFZs46Z6UIzyFf3Gnn2DH3A2REbgNnCmE=; b=eQHPkhU+3kaiGpa8HTA7YSHPUM
	cQWNQo6E0ZZcWghrWnOgPA42wG6GLnpUSVkY5jYzqNzqSN4j9pwemwg9Bu0pkr5umqw23mhNUP/5W
	0pUsJqLCqx9kF4iNfW40F5Y0/7mU9173YBIbeJHKqGxTahe1+P0y5NWkRCeKS4shqZfmUyCdiSwgy
	X7Pr6e2aTb4OdN5NHb4rUmuqK6EYwmM//aCudCYksRIuNEb5PHbAUwr90p+vjluY2ItRavfuSJ0iB
	Zmz9dXJnTRzQw+bvgFDvlvBElCphzDnekS6Ji6oKw3cYNGtD13nh0WOstq7kiHjzEGatWg2BwBnI7
	aZimUFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w880S-0000000GckM-0E7D;
	Thu, 02 Apr 2026 02:42:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w880E-0000000GcfG-0UZC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:42:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ROWEGxqksQxFZs46Z6UIzyFf3Gnn2DH3A2REbgNnCmE=;
	b=KvW2XnycR1GXkgXBNFAHBb0gyzZiFhJQ1L52/ao+6KhBQewLy9Mo/i4RrsyZ1J8Axtygqbm2e
	IrfQxZm1MbH4Z4AURBg1of8D3Ft8qgiVHpBhGIKf6aPQPlk4i2Sp3Be/EsWqkYd3HpYcVMErRvp
	s5emz2sM9i+TvRTc/EUacX8=
Received: from canpmsgout06.his.huawei.com (unknown [172.19.92.157])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fmR212mq0z1BGH4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 10:41:29 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ROWEGxqksQxFZs46Z6UIzyFf3Gnn2DH3A2REbgNnCmE=;
	b=KvW2XnycR1GXkgXBNFAHBb0gyzZiFhJQ1L52/ao+6KhBQewLy9Mo/i4RrsyZ1J8Axtygqbm2e
	IrfQxZm1MbH4Z4AURBg1of8D3Ft8qgiVHpBhGIKf6aPQPlk4i2Sp3Be/EsWqkYd3HpYcVMErRvp
	s5emz2sM9i+TvRTc/EUacX8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fmQsv6QHCzRhQZ;
	Thu,  2 Apr 2026 10:34:27 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 2317E40561;
	Thu,  2 Apr 2026 10:40:38 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 10:40:37 +0800
Message-ID: <730aaffa-9dfd-40c3-a372-c774d203b6e1@huawei.com>
Date: Thu, 2 Apr 2026 10:40:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <yezhenyu2@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <acvWnjG0AZBHL21q@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <acvWnjG0AZBHL21q@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_194156_111338_61285A35 
X-CRM114-Status: GOOD (  24.19  )
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


On 3/31/2026 10:13 PM, Leonardo Bras wrote:
> On Wed, Feb 25, 2026 at 12:04:16PM +0800, Tian Zheng wrote:
>> This series of patches add support to the Hardware Dirty state tracking
>> Structure(HDBSS) feature, which is introduced by the ARM architecture
>> in the DDI0601(ID121123) version.
>>
>> The HDBSS feature is an extension to the architecture that enhances
>> tracking translation table descriptors' dirty state, identified as
>> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
>> page tracking, aiming to significantly reduce the overhead of scanning
>> for dirty pages.
>>
>> The purpose of this feature is to make the execution overhead of live
>> migration lower to both the guest and the host, compared to existing
>> approaches (write-protect or search stage 2 tables).
>>
>> After these patches, users(such as qemu) can use the
>> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
>> feature before and after the live migration.
>>
>> v2:
>> https://lore.kernel.org/linux-arm-kernel/20251121092342.3393318-1-zhengtian10@huawei.com/
>>
>> v2->v3 changes:
>> - Remove the ARM64_HDBSS configuration option and ensure this feature
>> is only enabled in VHE mode.
>> - Move HDBSS-related variables to the arch-independent portion of the
>> kvm structure.
>> - Remove error messages during HDBSS enable/disable operations
>> - Change HDBSS buffer flushing from handle_exit to vcpu_put,
>> check_vcpu_requests, and kvm_handle_guest_abort.
>> - Add fault handling for HDBSS including buffer full, external abort,
>> and general protection fault (GPF).
>> - Add support for a 4KB HDBSS buffer size, mapped to the value 0b0000.
>> - Add a second argument to the ioctl to turn HDBSS on or off.
>>
>> Tian Zheng (1):
>>    KVM: arm64: Document HDBSS ioctl
>>
>> eillon (4):
>>    arm64/sysreg: Add HDBSS related register information
>>    KVM: arm64: Add support to set the DBM attr during memory abort
>>    KVM: arm64: Add support for FEAT_HDBSS
>>    KVM: arm64: Enable HDBSS support and handle HDBSSF events
>>
>>   Documentation/virt/kvm/api.rst       |  16 +++++
>>   arch/arm64/include/asm/cpufeature.h  |   5 ++
>>   arch/arm64/include/asm/esr.h         |   7 ++
>>   arch/arm64/include/asm/kvm_host.h    |  17 +++++
>>   arch/arm64/include/asm/kvm_mmu.h     |   1 +
>>   arch/arm64/include/asm/kvm_pgtable.h |   4 ++
>>   arch/arm64/include/asm/sysreg.h      |  11 +++
>>   arch/arm64/kernel/cpufeature.c       |  12 ++++
>>   arch/arm64/kvm/arm.c                 | 102 +++++++++++++++++++++++++++
>>   arch/arm64/kvm/hyp/pgtable.c         |   6 ++
>>   arch/arm64/kvm/hyp/vhe/switch.c      |  19 +++++
>>   arch/arm64/kvm/mmu.c                 |  70 ++++++++++++++++++
>>   arch/arm64/kvm/reset.c               |   3 +
>>   arch/arm64/tools/cpucaps             |   1 +
>>   arch/arm64/tools/sysreg              |  29 ++++++++
>>   include/uapi/linux/kvm.h             |   1 +
>>   tools/include/uapi/linux/kvm.h       |   1 +
>>   17 files changed, 305 insertions(+)
>>
>> --
>> 2.33.0
>>
>
> Hi Tian,
>
> I was thinking: maybe instead of putting the HDBSS (and HACDBS) stuff
> across a bunch of KVM files, we should try to focus them all on a single
> arch/arm64/kvm/dirty_bit.c file (plus a header such as
> arch/arm64/include/asm/kvm_dirty_bit.h).
>
> What is your opinion on that?
>
> Thanks!
> Leo


Sorry for the late reply. Yes, I had the same thought before. In the 
next version, I will

move all the HDBSS-related content into the same file, such as 
arch/arm64/kvm/dirty_bit.c

and arch/arm64/include/asm/kvm_dirty_bit.h.


Tian


>
>

