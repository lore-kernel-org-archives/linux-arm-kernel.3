Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4552CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yzrvOCHxsC7WgHtY2KMlVMdDhoLGuFiUkY3wuKf9+E=; b=zyt+i8X5A8I+WF2XqZIAkjPZFF
	kMAMqxcwyD4NKjerfyqHxc3R2m5zS7Matf17SUcq1GUkhDrJ6jka0JVVPCbQEir2ybT8TMvdu2sbT
	XKVbmbjIt+ZUvevizkMvqNmRUJuAraW5XMRFFdmWcBmTKh1tuwqP/2zizI7OvR2av++WG04t2Gt2u
	O6IHDbNPrLDgrc80+wR1hzxGQfg+vvSz91mOFLd1hH0iPpNrKUF4lHBBdpVff/yWI9BPQOmfzT1aL
	psgPBvP/UdmG06iooVzF0VtWkwOMoiPNyPRgEm0O/bHvurLxv6OvQVLEnUkdT9mT06HMUSkI0rfOv
	MN/InVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW4O-00000000mJa-3gCa;
	Fri, 05 Jun 2026 15:02:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVW4M-00000000mIW-1SCa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:02:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC0D2169C;
	Fri,  5 Jun 2026 08:02:40 -0700 (PDT)
Received: from [10.1.31.21] (e122027.cambridge.arm.com [10.1.31.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B1DC3F7D8;
	Fri,  5 Jun 2026 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780671765; bh=mQFuhzCodCnbKJAkWMqNA1+nCgRbGyCC+kn20N2486I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OvWTy3FeM5VwgjocrtZQg5Jg2KwnIeQPMOlAF5KB/6umOkBHoV8atthWthwLV+aOk
	 KzZiAaFiBYCOb6Fvk9P1hXIDBpEZ4A4zj/KVPtpJCV6PgnEAokBrDAwkfxyHMpNqyf
	 uAORbqalVv9zH7QohKxQN6w5M+KEi/it2AwcCoN4=
Message-ID: <e99800dd-6568-44bd-922b-c06891a528c8@arm.com>
Date: Fri, 5 Jun 2026 16:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/44] arm64: RMI: Handle RMI_EXIT_RIPAS_CHANGE
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-24-steven.price@arm.com> <yq5ay0hfspok.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5ay0hfspok.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_080246_461106_F2951892 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 19/05/2026 10:40, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
> ...
> 
>> +void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
>> +			   unsigned long size, bool unmap_private,
>> +			   bool may_block)
>> +{
>> +	unsigned long end = start + size;
>> +	struct realm *realm = &kvm->arch.realm;
>> +
>> +	if (!kvm_realm_is_created(kvm))
>> +		return;
>> +
>> +	end = min(BIT(realm->ia_bits - 1), end);
>> +
>> +	realm_unmap_shared_range(kvm, start, end, may_block);
>> +	if (unmap_private)
>> +		realm_unmap_private_range(kvm, start, end, may_block);
>> +}
>> +
>  
> kvm_gmem_invalidate_begin() indicates a private-only invalidation. How
> is that supported?

Because we treat the private and shared spaces are aliasing we don't
really support a "private-only" invalidation. So the shared space will
be invalidated as well. Something has gone wrong if we've ended up with
the 'same' IPA being used in both the private and shared spaces.

Private has to be treated slightly specially because removing a private
mapping is observable by the guest (the page can't be reinserted without
the guest agreeing and the contents being wiped). For shared mappings
the page can simply be refaulted.

That said, I'll look into Wei-Lin's suggestion to use
kvm_gfn_range_filter which would allow all three combinations of
private-only, shared-only and private+shared.

Thanks,
Steve


