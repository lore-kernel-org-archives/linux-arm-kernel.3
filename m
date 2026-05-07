Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tLEP0XjaIARNFnU2GkzHmxBTHr1qQc7KqDVAp+GPgA=; b=daBpYWiZ5dCsf9T95XEdUxrme2
	FhGZBhUDbvul2MushyX+8J2t8f+k45bySLz1rw4H4p6IBBfXpMJGNRJIGWelD588ns8fEPyXZUR50
	RWz6QfvpGsLMovtEr/BMGsufbXQk0PEelSeXprYJuRxZ/dj1FBTTjGZUKLuuZ2HgsHywx7lULnVDZ
	GGFZkYaIDVmM48OyaE58Cw+ZfDWxpHs2sbhA7MaW5N3u2pjPJMwecZxIY+gihcAUEkJfWVwDwnqge
	A3bq4isQA3lEaZutBiX7OhnayPCqTjAkrQCr+6+fS88OkPJO9fGje634wyiEg21uL/eRktpgWaqvu
	UqPfqLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnm5-00000002SK0-3aHC;
	Thu, 07 May 2026 01:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnm4-00000002SJh-1DMe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 01:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3tLEP0XjaIARNFnU2GkzHmxBTHr1qQc7KqDVAp+GPgA=; b=C4YOtgD17KlRP9yxucc5eKyNPG
	8tBfHrrzc1biLttSLxZhSHYaN4h2/Ni4/ScEHTSveW287cbow8KBgY0VG3Z42FtPy6hDhFYQ435Uw
	sec0kV94edAcjf5/JnVu0pvAkiBMT9Qtu2h9nOzRGjSMqJYG1RfxUO8SJKenLyiNCLI+TpA+ms/I7
	7Xj/EAVd0bg8MLQYzTj75fwGykp14s96RgIIDS0XIkeB8i7slU9oAziPdWZBckWyVgixtp21KPfWu
	73hqHySVpDUeBOXZAH8jbfAB4wZnVD1zk7UKusjNSRc/RBH7Ta4+05I7WS88AXX6Tvp6dpz2UvJQm
	T/BCxAag==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKnls-00000002Nqm-1l1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 01:43:33 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxX+su7vtpGFUHAA--.23820S3;
	Thu, 07 May 2026 09:43:10 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxacEo7vtpjfx7AA--.25500S3;
	Thu, 07 May 2026 09:43:05 +0800 (CST)
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in
 kvm_arch_flush_shadow_all()
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Gavin Shan <gshan@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 James Hogan <jhogan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com>
 <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
 <aftIbW9G4RfoTuXh@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <833b7f62-5e9f-26e7-f60d-2ac1dd24c031@loongson.cn>
Date: Thu, 7 May 2026 09:40:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aftIbW9G4RfoTuXh@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJBxacEo7vtpjfx7AA--.25500S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr1rJF1DJFWxtw1UKw43twc_yoW5GFyxpF
	WUC3WqgrWDA340kw4kZ3WkWw1FyaykGr4UJw1Ygry5urs8Gwn3KF4SyFy0kFZ7ZrZ7GFWq
	qF45tr95Zas8ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeuWdUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_024325_346253_D234C06B 
X-CRM114-Status: GOOD (  17.46  )
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



On 2026/5/6 下午9:55, Sean Christopherson wrote:
> On Wed, May 06, 2026, Bibo Mao wrote:
>> On 2026/5/5 上午6:42, James Houghton wrote:
>>> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
>>> concurrently in the event that the KVM's `mm` is __mmput() at the
>>> same time that last reference to the KVM is being dropped.
>>>
>>> T1              T2
>>> KVM_CREATE_VM
>>>                   Get VM file from T1
>>> close VM
>>> exit_mm()       close VM
>>>
>>> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>>>       with only the KVM srcu read lock held.
>>>
>>> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>>>       kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>>>       again, with only the KVM srcu read lock held.
>> By looking through the code, kvm_arch_destroy_vm() will free PGD page only,
>> page table walking is executing in deleting memslot or exit_mm().
>>
>> With normal code, life cycle of VM is something like this:
> 
> Not necessarily.  Abruptly closing the VM, as described below, is also "normal"
> (though likely uncommon).
> 
>>    KVM_CREATE_VM
>>      Create_VCPUs
>>      Create memslots
>>      Destroy_VCPUs
> 
> This is incorrect.  KVM doesn't provide any way for userspace to destroy vCPUs.
> Userspace can fully release every vCPU fd, but the vCPU object within KVM stays
> alive (and indirectly reachable) until the VM is destroyed.
yes, that is so. For users, there is vCPU fd release interface. As for 
vCPU object release, it is kind of internal implementation in KVM.
> 
>>      Destroy memslots
>>    close VM
>>    exit_mm()
> 
> Note, exit_mm() may or may not be called.  E.g. there are VMMs that will destroy
> a VM and start a new one (perhaps even the same conceptual virtual machine) in
> the same process / mm_struct / address space.
> 
>> And there is kvm_get_kvm()/kvm_put_kvm() function call with creating/destroy
>> vCPUs, however no such operations with memslot operation. Is it possible
>> that VM is destroyed without removing memslots, such as the following
>> operation.
>>    KVM_CREATE_VM
>>      Create memslots
>>    close VM
>>    exit_mm()
> 
> Yep.  KVM cannot make any assumptions when it comes to userspace-initiated
> operations.  Even a VMM that super strictly follows the first approach may exit
> abruptly, without destroying memslots, e.g. if it's OOM-killed.
oh, I see. If so, the implementation about kvm_arch_destroy_vm() on 
Loongarch is problematic, it needs consider this kind of abnormal VM 
destroy, take page table walk and free page tables. I had thought that 
memslots create/destroy should call kvm_get_kvm()/kvm_put_kvm() :(

Regards
Bibo Mao


