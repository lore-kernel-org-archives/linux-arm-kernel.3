Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F21BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okNzXWR/GpeRoMOyYq4lDHm4W4rmEwf8it/IeOrl6TU=; b=mDyWlL7jL3YKhwMRj1T98WAKye
	Lzk2sIiFIsNKYUwQxi1XzCNlq6HziyZxG9UeK7dPBAV5x6IY2nzd87Bj6AH49I6fVywMimrI/wDnB
	o/qlKv6z0OpYA5pVLZiEs1ljIbwKe8pHef7PcBxJDRScWP/Jkm++OYtoP2Wihe9wXA3f4Dg+2UYKf
	aEurrawKfDQI+K3iFLmW0gVDYfOs8rMpK3UPwZ+t6zCrtRQdXtr5+AZKicRpkhqsd0fRYOjHAgEJ+
	+D/Pu8iO/ElHZKD13Tin+05RtKuOKdAB714S9ro4pCWUpwzOZy61xNmCAmSRFoPxxHw4Sp6PJSzjw
	hVawI7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAIs-0000000BPKK-1DHO;
	Thu, 20 Mar 2025 07:26:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAHB-0000000BP7K-1a5m
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 07:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=okNzXWR/GpeRoMOyYq4lDHm4W4rmEwf8it/IeOrl6TU=; b=CMCpjIgoD1hUNWpEeYzguliwTT
	seWgEBE9efWsgI/g2GrANN2gmTs0TAvBMwi5OZ5bsuvZ0hgBk3jyRmekH2097HDz6/meiydf8y3EY
	y/LlemqRkLvNEabDMEVNXZJ7RAufU5v8XZkFiPFjMgNc1YtA/I6euNRaqo7p/gV5NAwIYtAoqUtg/
	XFyzUob//6eEGFV/t2eSxiCIr9TbL6hvJ1Kj57/BuoMe5XIEzVA9bbMufk6H6EHCT09xI9/+uOoeu
	VIIDdBQUfxU9etuWLPk4j727SDjuB59mZrDP600ftmEV9HmKc0qiSHdac7Xt/wNOICQKTVtnFOamZ
	A1wO7Smw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAH6-000000045Xc-2Dq3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 07:25:11 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxrnLMwttnHieeAA--.5000S3;
	Thu, 20 Mar 2025 15:25:00 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMAxj8XEwttnjEdVAA--.52753S3;
	Thu, 20 Mar 2025 15:24:55 +0800 (CST)
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: bibo mao <maobibo@loongson.cn>
To: Oliver Upton <oliver.upton@linux.dev>,
 David Hildenbrand <david@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, "joey.gouly@arm.com"
 <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <86r033olwv.wl-maz@kernel.org>
 <SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
 <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
 <8634fcnh0n.wl-maz@kernel.org> <Z9h98RhunemcFhhz@arm.com>
 <86wmcmn0dp.wl-maz@kernel.org> <20250318125527.GP9311@nvidia.com>
 <Z9nJH38Em9XEx3U7@arm.com> <ed25f5a6-dad6-4b5e-b42b-58e6ced6c7a2@redhat.com>
 <Z9nMHW-OqTLEqDRs@linux.dev>
 <bbb361bd-6cb8-7b9d-f689-d52bb1a05605@loongson.cn>
Message-ID: <dff27537-97f9-ad46-b991-e1de6b589e3e@loongson.cn>
Date: Thu, 20 Mar 2025 15:24:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bbb361bd-6cb8-7b9d-f689-d52bb1a05605@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMAxj8XEwttnjEdVAA--.52753S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr1xZw1rArW5ury3ZF48KrX_yoW5Gr4Upr
	97t3WDKan7Xr4Syr4vgw42gF40yw4rKr4UXw1YgryUuwn093ZrtFWrta12kF9rJr1rX39F
	qF45t347XFyavFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcApnDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_072509_247599_5ABD30E6 
X-CRM114-Status: GOOD (  22.14  )
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



On 2025/3/20 上午11:30, bibo mao wrote:
> 
> 
> On 2025/3/19 上午3:40, Oliver Upton wrote:
>> On Tue, Mar 18, 2025 at 08:35:38PM +0100, David Hildenbrand wrote:
>>> On 18.03.25 20:27, Catalin Marinas wrote:
>>>> On Tue, Mar 18, 2025 at 09:55:27AM -0300, Jason Gunthorpe wrote:
>>>>> On Tue, Mar 18, 2025 at 09:39:30AM +0000, Marc Zyngier wrote:
>>>>>> The memslot must also be created with a new flag ((2c) in the 
>>>>>> taxonomy
>>>>>> above) that carries the "Please map VM_PFNMAP VMAs as cacheable". 
>>>>>> This
>>>>>> flag is only allowed if (1) is valid.
>>>>>>
>>>>>> This results in the following behaviours:
>>>>>>
>>>>>> - If the VMM creates the memslot with the cacheable attribute without
>>>>>>     (1) being advertised, we fail.
>>>>>>
>>>>>> - If the VMM creates the memslot without the cacheable attribute, we
>>>>>>     map as NC, as it is today.
>>>>>
>>>>> Is that OK though?
>>>>>
>>>>> Now we have the MM page tables mapping this memory as cachable but KVM
>>>>> and the guest is accessing it as non-cached.
>>>>
>>>> I don't think we should allow this.
>>>>
>>>>> I thought ARM tried hard to avoid creating such mismatches? This is
>>>>> why the pgprot flags were used to drive this, not an opt-in flag. To
>>>>> prevent userspace from forcing a mismatch.
>>>>
>>>> We have the vma->vm_page_prot when the memslot is added, so we could 
>>>> use
>>>> this instead of additional KVM flags.
>>>
>>> I thought we try to avoid messing with the VMA when adding memslots; 
>>> because
>>> KVM_CAP_SYNC_MMU allows user space for changing the VMAs afterwards 
>>> without
>>> changing the memslot?
>>
>> Any checks on the VMA at memslot creation is done out of courtesy to
>> userspace so it 'fails fast'. We repeat checks on the VMA at the time of
>> fault to handle userspace twiddling VMAs behind our back.
> yes, I think it is better to add cachable attribute in memslot, it can 
> be checked on the VMA at memslot creation. Also cache attribute can be 
> abstracted with cachable/uc/wc type rather than detailed arch specified.
Sorry, I do not state this clearly. My meaning is tor add cachable 
attribute in memslot. It is acquired from prot of VMA at memslot 
creation, and checked at S2 page fault fastpath.

So it is unnecessary to find vma at S2 page fault fastpath, only memslot 
is enough. And cache attribute write-combined should be added also since 
some GPU memory can be mapped with WC attribute in vfio-gpu driver.

Regards
Bibo Mao

> 
> Regards
> Bibo Mao
>>
>> VM_MTE_ALLOWED is an example of this.
>>
>> Thanks,
>> Oliver
>>
> 


