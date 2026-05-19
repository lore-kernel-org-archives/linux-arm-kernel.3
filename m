Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACA2CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hby3knI6Udl+KWoq6fqUYnqbIp0KJ9sKrYAdgqVYUi0=; b=aH6iOhRpVRoZfC9yPbOQgpKZHq
	jDXSH5COToSiRvcYn8JmK9E5jkQ3Xo4eHaJPXU4q87+JuG13r9sk42TurtLsUuGZhV/2njF6pzTpN
	BJvYkmYm5MlioRjQDk1hM0tMhoJ+zI+FiedFEtWQGxn66UlAV1HU/AE7lKMnB2GoJ+TWcHjuqES7p
	ZxWykfca4BBSUyE27Rhl2Pt58CRONWCwRlxNpdHoUeT8V8mBZaEyTIY1YIEKiY33TUc/LQKP8yPBu
	J2N8Rr/VSMhH2FTUQzSecpA4hcI1RKREKoqEoK4X+seBsRCHGUO8FbgptRdpZJk3Y/lMGCTnYbutD
	8m/tMWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJzR-00000001YXE-0DhZ;
	Tue, 19 May 2026 12:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJzP-00000001YWY-0tK2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D59406D7;
	Tue, 19 May 2026 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9A4C2BCB3;
	Tue, 19 May 2026 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195362;
	bh=Xfxs9VwhdJKne3gTf8HJ94QxvyAL3Oe1auKr7Ait+AI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PFYn2EQI6o67e3QXj1DmucFzY5eMUMVymfs8SWHXncySGE4NzDUggvInLFr6ixsxt
	 qYg0twpu4rJ6zwcv2EkrCHFLnYMtZXbPyPGyQp7J8y6uStLkA66YZkf9TMjMAtB0R7
	 gwC3eSMHnmV+sx9T9KrsuVPkn2Peyno2mWDGmAhKcSD1ZXmBVlfxMa6QQVn42RIznn
	 3OIPR8CO0/7k0gkobMUa7ZtA/zloHi04HmIUPdroRaX/R0/MQws3I14tk74bCHstbG
	 fo2NHacy3VzbZSO2K5OYkAyPm4uD8SVAWH28rdJeyJFPUhYvBk77tTXkmsWtJMuJ1E
	 51FQMMQt4xrcw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 27/44] arm64: RMI: Set RIPAS of initial memslots
In-Reply-To: <6681f10b-0966-42e2-ae04-4e1aef47ec4d@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-28-steven.price@arm.com>
 <yq5av7cjsonr.fsf@kernel.org>
 <6681f10b-0966-42e2-ae04-4e1aef47ec4d@arm.com>
Date: Tue, 19 May 2026 18:25:52 +0530
Message-ID: <yq5ajyszsgmf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055603_298145_308D3CDB 
X-CRM114-Status: GOOD (  18.87  )
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 19/05/2026 11:02, Aneesh Kumar K.V wrote:
>> Steven Price <steven.price@arm.com> writes:
>> 
>>> The memory which the realm guest accesses must be set to RIPAS_RAM.
>>> Iterate over the memslots and set all gmem memslots to RIPAS_RAM.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>   
>>   ...
>>   
>>> +static int set_ripas_of_protected_regions(struct kvm *kvm)
>>> +{
>>> +	struct kvm_memslots *slots;
>>> +	struct kvm_memory_slot *memslot;
>>> +	int idx, bkt;
>>> +	int ret = 0;
>>> +
>>> +	idx = srcu_read_lock(&kvm->srcu);
>>> +
>>> +	slots = kvm_memslots(kvm);
>>> +	kvm_for_each_memslot(memslot, bkt, slots) {
>>> +		if (!kvm_slot_has_gmem(memslot))
>>> +			continue;
>>> +
>>> +		ret = realm_init_ipa_state(kvm, memslot->base_gfn,
>>> +					   memslot->npages);
>>> +		if (ret)
>>> +			break;
>>> +	}
>>> +	srcu_read_unlock(&kvm->srcu, idx);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>   int kvm_arm_rmi_populate(struct kvm *kvm,
>>>   			 struct kvm_arm_rmi_populate *args)
>>>   {
>>> @@ -890,6 +922,10 @@ int kvm_activate_realm(struct kvm *kvm)
>>>   			return ret;
>>>   	}
>>>   
>>> +	ret = set_ripas_of_protected_regions(kvm);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>   	ret = rmi_realm_activate(virt_to_phys(realm->rd));
>>>   	if (ret)
>>>   		return -ENXIO;
>> 
>> relam guest already does.
>> 	for_each_mem_range(i, &start, &end) {
>> 		if (rsi_set_memory_range_protected_safe(start, end)) {
>> 			panic("Failed to set memory range to protected: %pa-%pa",
>> 			      &start, &end);
>> 		}
>> 	}
>> 
>> if so why is host required to do this ?
>
> Ideally this should be a call from the VMM (i.e., user). Irrespective of
> what the guest does (which the host has no knowledge about), the VMM/
> user is better aware of what to do for a given guest. We have done this
> implicitly in the KVM as a start, to keep the initial implementation
> simple. This could be moved out to the VMM as UABI, if there is
> sufficient demand for it.
>
> TL,DR: This should be a host/deployer decision, not the Guest. There
> may other guest OS, which do not do RIPAS_RAM early enough.
>

Are we suggesting that when the guest is running out of DRAM initialized
via rmi_rtt_data_map_init(), it may need to access memory outside that
range before it gets a chance to set the RIPAS as RAM?

Does that mean the guest now has to trust the host for that?
rmi_rtt_init_ripas() is not added to the measurement details, right?

-aneesh

