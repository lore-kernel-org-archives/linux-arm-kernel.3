Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCFFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 03:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v1mfDfXZYY+ngcMqvJwjlv+wrqk76RhbROMRHxGJtM=; b=BtIu5jCy7arRxCls470EJzrLOd
	JxIBGKeUaExFcPk4NI5sNzHICJJgKPib10nr1so82VRByzqxCKi4Mg7R43UblhulVympI1wRgcmcy
	/dcKLjG+Csk36zXzmE/Tkl1dleeY+wK/u1zgY9HiBrYKYV7Es9tmQJQdHmudnXIY2HoUup15smZTx
	wTn32b/OJukW15YjLGti0/+sfFVtzUdI8k3t0UxvN9sPLjxtuZnYLVqt8a6h6d5Am/H6OL9Cb0IAi
	vO10eeFZJj3GD09nxtXdrAg/tArL6DdUGHaDO6Hr54fs7/ChM6vAT1/3HxiI1wk59Ksktb0/UvIcY
	vIlNGa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6et-0000000AzlW-3vr9;
	Thu, 20 Mar 2025 03:33:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6dD-0000000AzgZ-3t5n
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Mar 2025 03:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0v1mfDfXZYY+ngcMqvJwjlv+wrqk76RhbROMRHxGJtM=; b=F7pES7Z/lGmbMApqIjEYSCs7py
	6Ni3disaaSsArwbiUBRbbphr1LldBsCjxefb6oGUTRvip7i9wQ0nHO8AR3Z/SRBaDIjkJzU+0c4nl
	GKgyxp5NE2P2mb7jsbrYiUhnHwVJlCaned0/H2j71QHOgFLDxJI8uWQFQN6w28vMp0Kh6iQPzpaZW
	nBE99CQXR4cIV2jox+gJbI/WpMkviQwh354WQzqK9Ww5InrgHTwp8nPLhERr+eFf1gxJz3L56HVcr
	zKbDa7moaH1pvgXQvwtJHXWGYbqayiZuUI7V1iXLdBM3IoHJ/OhXsYEYYfYTmTi/U36yQUx8VMeFB
	3hATfXNQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6dA-000000027Fl-0HEI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 03:31:42 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxrnIRjNtnTvGdAA--.4713S3;
	Thu, 20 Mar 2025 11:31:29 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDx_MQKjNtnM_hUAA--.47363S3;
	Thu, 20 Mar 2025 11:31:26 +0800 (CST)
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
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
From: bibo mao <maobibo@loongson.cn>
Message-ID: <bbb361bd-6cb8-7b9d-f689-d52bb1a05605@loongson.cn>
Date: Thu, 20 Mar 2025 11:30:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Z9nMHW-OqTLEqDRs@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMDx_MQKjNtnM_hUAA--.47363S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFW5WFW5Kr47Ww15ZF4fJFc_yoW8ZF1Dpr
	yxt3ZFka1kXrySyws29w42gF40yw4Fqr4UXw15Kr1UCwn09FnrKFWFya12kFsrAF1Sq39F
	vFZ0q347JFya9abCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3sjjDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_033140_704884_04CAF236 
X-CRM114-Status: GOOD (  17.29  )
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



On 2025/3/19 上午3:40, Oliver Upton wrote:
> On Tue, Mar 18, 2025 at 08:35:38PM +0100, David Hildenbrand wrote:
>> On 18.03.25 20:27, Catalin Marinas wrote:
>>> On Tue, Mar 18, 2025 at 09:55:27AM -0300, Jason Gunthorpe wrote:
>>>> On Tue, Mar 18, 2025 at 09:39:30AM +0000, Marc Zyngier wrote:
>>>>> The memslot must also be created with a new flag ((2c) in the taxonomy
>>>>> above) that carries the "Please map VM_PFNMAP VMAs as cacheable". This
>>>>> flag is only allowed if (1) is valid.
>>>>>
>>>>> This results in the following behaviours:
>>>>>
>>>>> - If the VMM creates the memslot with the cacheable attribute without
>>>>>     (1) being advertised, we fail.
>>>>>
>>>>> - If the VMM creates the memslot without the cacheable attribute, we
>>>>>     map as NC, as it is today.
>>>>
>>>> Is that OK though?
>>>>
>>>> Now we have the MM page tables mapping this memory as cachable but KVM
>>>> and the guest is accessing it as non-cached.
>>>
>>> I don't think we should allow this.
>>>
>>>> I thought ARM tried hard to avoid creating such mismatches? This is
>>>> why the pgprot flags were used to drive this, not an opt-in flag. To
>>>> prevent userspace from forcing a mismatch.
>>>
>>> We have the vma->vm_page_prot when the memslot is added, so we could use
>>> this instead of additional KVM flags.
>>
>> I thought we try to avoid messing with the VMA when adding memslots; because
>> KVM_CAP_SYNC_MMU allows user space for changing the VMAs afterwards without
>> changing the memslot?
> 
> Any checks on the VMA at memslot creation is done out of courtesy to
> userspace so it 'fails fast'. We repeat checks on the VMA at the time of
> fault to handle userspace twiddling VMAs behind our back.
yes, I think it is better to add cachable attribute in memslot, it can 
be checked on the VMA at memslot creation. Also cache attribute can be 
abstracted with cachable/uc/wc type rather than detailed arch specified.

Regards
Bibo Mao
> 
> VM_MTE_ALLOWED is an example of this.
> 
> Thanks,
> Oliver
> 


