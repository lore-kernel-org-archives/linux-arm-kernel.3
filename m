Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C47C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k69LvB+0+kiSBvmUOIMo0gTPTsD6NckkAdGe25+Ma/0=; b=SH+CFWT3ccE7nnNh2ano+a2gZJ
	ek5IK6LRSq7DpI0vWTgjxTJnYXMwLrRq8RDUt/qZlJdQNzdHuiNc/oR2bjqdAyLRgDRRyfG+MjADx
	tW9yFgjVM5q8wR0+oBqzPKb9JpqkauLQqrDCMAt1G20djzgcdqvUphWCyg9m2CQp5/iHtJKdP5jAm
	Gzkfdu7dpzNm1kwnVFNc+7jeI62+PxRG8wi5uMLJDZWHQI1cHDvmZB6fsFHTG3gaz8+qhBur1YaCs
	6ythaX2mmTkXWgW1WD3PjYS4JbwTxvxAoh+UDGcZqXOlHqc38mg2l9p+8PjTr0j+Oqr+D3Qw7Uj8I
	c+fq7KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GPs-0000000HQiS-2g30;
	Sun, 20 Sep 2026 12:13:08 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GPp-0000000HQhw-0UNb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 12:13:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=k69LvB+0+kiSBvmUOIMo0gTPTsD6NckkAdGe25+Ma/0=;
	b=kJ3zlqZ+H51TcrOli3BBdPFPUddKwUIotA38vp+0tgmxpOkCa1YaxmHHSqpjytalyRBM7lRjp
	gieRm0+u7qshjvr9VDnomRN0CmA0h5BGGyO7LhSz1rsfT+JBm1E0d7AFz7+qWjGX81SOpGjEwRw
	TNXZTgOxx4LtH6QXVp6snsc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hnlLp2kXpz1T4LX;
	Sun, 20 Sep 2026 20:01:06 +0800 (CST)
Received: from dggpemr200003.china.huawei.com (unknown [7.185.36.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B58374057F;
	Sun, 20 Sep 2026 20:12:53 +0800 (CST)
Received: from [10.174.185.234] (10.174.185.234) by
 dggpemr200003.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 20:12:52 +0800
Message-ID: <68de0ad8-967b-49d4-872a-a9fdff7485fb@huawei.com>
Date: Sun, 20 Sep 2026 20:12:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH 0/2] Batch register access for live migration
 optimization
To: Marc Zyngier <maz@kernel.org>
References: <20260918081930.4014735-1-wangyize7@huawei.com>
 <861paq69te.wl-maz@kernel.org>
CC: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oupton@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <fuad.tabba@linux.dev>,
	<joey.gouly@arm.com>, <seiden@linux.ibm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <mark.rutland@arm.com>, <zhengchuan@huawei.com>,
	<jiangjiacheng@huawei.com>, <yize_w1110@163.com>
From: Yize Wang <wangyize7@huawei.com>
In-Reply-To: <861paq69te.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.234]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr200003.china.huawei.com (7.185.36.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_051305_798240_981B7FDF 
X-CRM114-Status: GOOD (  18.18  )
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


在 2026/9/18 20:08, Marc Zyngier 写道:
> On Fri, 18 Sep 2026 09:18:13 +0100,
> Yize Wang <wangyize7@huawei.com> wrote:
>> This series adds batch register access support to KVM/arm64 to reduce
>> syscall overhead during VM live migration.
>>
>> Currently, QEMU issues one ioctl per register when saving/restoring VGIC
>> state. On large VM configurations this means tens of thousands of syscalls,
>> where lock acquisition and context switch overhead dominates migration
>> downtime. Thus, we provide a batch register method to allow userspace
>> read/write multiple distributor and redistributor registers in a single call.
>> In this way, we can significantly reduce syscalls and migration downtime.
>>
>> Test the VM migration time under pressure conditions.
>> The VM specifications for migration are as follows:
>> - VM use 4-K page;
>> - the number of VCPU is 160;
>> - the total memory is 320Gigabit;
>> - use 'Redis SET-benchmark' to pressurize VM;
>>
>> Performance results (3-run average, ms):
>>      | Metric              | Without patch | With patch | Improvement |
>>      |---------------------|---------------|------------|-------------|
>>      | Migration downtime  |        536    |     321    |     40%     |
>>      | Source (total)      |        344    |     230    |     33%     |
>>      |   - VGIC put        |        158    |      40    |     75%     |
>>      |   - VGIC get        |        120    |      19    |     84%     |
>>      | Destination (total) |        192    |      91    |     53%     |
>>      |   - VGIC put        |        132    |      27    |     80%     |
>>
>> Yize Wang (2):
>>    KVM: arm64: Add batch group constant and data structure to UAPI header
>>    KVM: arm64: Add VGIC v3 batch register access implementation
> Questions:
>
> - Why only the MMIO registers?
>
> - Why not the sysregs?
>
> - Why only the GIC?
>
> - Why not all of the state?
>
> - Where is the corresponding userspace code?
>
> More importantly, since this is about batching system calls:
>
> - Why can't this be done with io_uring instead?
>
> 	M.


Hi, Marc! Thank you for the review.


These patches focus on optimizing GICv3 register access during live 
migration. We found that there are a large number of locks (kvm->lock, 
vcpus, config_lock) in the GIC, these lock operations wil cost large 
time waste. The batches of sysreg for vcpu optimization will come in 
follow as a separate series. And let me address these questions one by one.


1. Why only the MMIO registers?

In vgic_v3_batch_access(), we use 'entries' structure to implement batch 
read/write of register status. The structure is 'struct 
kvm_dev_arm_vgic_batch_entry', where the group information can be freely 
specified by userspace. Thus, vgic_v3_batch_access() supports all VGIC 
device attr groups, not only MMIO registers.


2. Why not the sysregs?

The newly added vgic_v3_batch_access() just forwards the groups received 
fromQEMU in batches to 'vgic_v3_attr_regs_access()'. And this function 
already has 'KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS' to handle sysregs. Our 
patch does not modify the existing sysreg handling logic.


3. Why only the GIC?

During live migration, the GIC is the device with the largest number of 
registers, and we found that there are a large number of locks in it. If 
each register is locked and unlocked individually, it would cause large 
time consumption. Thus, we want to optimize the GIC register time 
consumption during live migrate. The experimental results also show that 
batch processing significantly reduces VGIC handling time during migration.

Similarly, vCPU register save/restore also costs significantly time. The 
patch of vCPU sysreg batch access will be submitted separately in the 
future.


4. Why not all of the state?

As different devices have different lock hierarchies and access 
paths(e.g., GIC goes through the device fd, CPU regs go through the vcpu 
fd), it's difficult for us to realize in a single batch handler. 
Additionally, introducing too many changes at once would make review 
harder. These patches focus on GIC-related optimization, and a separate 
series for vCPU batch processing will follow.


5. Where is the corresponding userspace code?

The QEMU-side implementation has been posted to qemu-devel. The link is 
below:

https://lore.kernel.org/qemu-devel/20260918092120.370805-1-wangyize7@huawei.com/T/#t


6. Why can't this be done with io_uring instead?

The core idea of io_uring is to reduce the number of context switches 
between user space and kernel space by utilizing two ring buffers. 
However, each SQE is still processed independently in kernel space. For 
the VGIC registers, each SQE still require lock -> read/write -> unlock, 
so the per-register lock overhead remains unchanged. We hope to 
read/write a set of register states with a single lock operation to 
reduce the time cost. Therefore, io_uring does not meet our needs.



