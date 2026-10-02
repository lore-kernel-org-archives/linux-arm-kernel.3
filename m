Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBCECA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFno9lUuFtHezl76+//uMpmozDAO49IawVZWebfz6Gw=; b=DsV4U4KwfJE1FyZG0QS3vRRVXY
	x0hIPSJIgmEsigjbLhCCIYJBfkN1QpGN2yO6t2r3S8HynD3okKpbvQ/zydoaFcsOpR1sCswLQzu4w
	jAzKfThG3lieArGY41rkM9o0UeZEer3eYI+Zj5L2ox1ehgnbYdEKWXejLrafDDXa2DAaRVrVGl89p
	UM8029fU4QfNdKI5pv5fAoAExUju5hZkwZSbTM36W5N72BFm4NWFJgBw3xXEj78r3uhFZhDkC+1SJ
	WD5m5uTG6yBz7nkY7F4GURKI4ef/y8l4xy4mCHWnWu1C6B80j4ubz59kwmsA9+va4VyU9TvJXeC0N
	reVUt6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaW0-0000000BJiE-0Oe0;
	Fri, 02 Oct 2026 10:29:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaVx-0000000BJgf-0FSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:29:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 724932F;
	Fri,  2 Oct 2026 03:29:10 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52A453F86F;
	Fri,  2 Oct 2026 03:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790936953; bh=8zdG4+TMm/xDMmpwn/2kI2vIq6OxntZw4PKsvfXk3l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A0jDrAq+Uipp3H5I0BVYbZMwW+Mm5UzB/Yew7n6iialYSBFkrm6pTg1i9sUSM2t2r
	 EUc9FcHr/MSwRtmo2+Q2hQC9Q0F9e5Bzi3IodbUU7xML5zPPD+nFXgky/TyzXW1rnz
	 i9x9fQNFEdLdKuRV/KUDWU1nXuFrGwN6RaaM916M=
Message-ID: <a8dcdcfb-3c4c-4e39-b206-004f60c128b6@arm.com>
Date: Fri, 2 Oct 2026 11:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 10/23] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-11-suzuki.poulose@arm.com>
 <CA+EHjTxCfmOqiJzYDZHunSuEyoZCbgHuzeSYC8y71Re+9PA6Kw@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTxCfmOqiJzYDZHunSuEyoZCbgHuzeSYC8y71Re+9PA6Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032917_244131_D7E9DD16 
X-CRM114-Status: GOOD (  15.21  )
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

Hi Fuad

On 02/10/2026 11:19, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Thu, 01 Oct 2026 22:06:50 +0100, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
>> Add VM type specific S2 MMU operation backends which can be initialized per
>> VM flavor, to keep the handling cleaner.
> 
> The rows only differ where the base already branches (the pKVM TLB
> flushes, the protected VM age and unmap, and from patch 12 its abort),
> so the case for the table rests on the Realm row, which isn't
> functional until the RMI backend lands. Beyond the flushes in patch
> 16, which operations do you expect it to override?

Thats it for now. But I also want to explore the flush_memslots() case,
where Realm doesn't need to do anything. May be it is easier to stub
that case out early.

> 
> [...]
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
>>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> [...]
>> +       if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
>> +               return 1;
> 
> Every row sets it today, but returning 1 falls back to
> KVM_REQ_TLB_FLUSH, which arm64 doesn't handle, so nothing would be
> flushed. Could vm_flush_remote_tlbs be mandatory, checked in
> kvm_vm_init_vm_s2_ops()?

Agree, we could make that mandatory.

Suzuki

