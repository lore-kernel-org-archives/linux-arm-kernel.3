Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B420606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jYLAr+a/;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Xxcr1uEv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=46BTS2L17vKUMaAXzO89PlCn4e9X2ecYyyZ5hRRDLBc=; b=jYLAr+a/gczRpG
	wMGv0XFCTzN83JOxmY+B3XAfalJ8010UTicjV6g3DUnnz4U5KFxfmGCeUlaC/DQwSsqUWbe/X3p7l
	evn0umUu6mQzOPmqltb9yf2+wFU4VBsf7NZd0nd8RZiR3B2S+j/MQObyN0FWSwTGCSroO9XBHxoyP
	FuOwFhxsT0+hM9qvsO8KxLszi+Ol8B0xncfvy9DGl0NuZPCxAW+oGseg9n8HT4B71n49JCj9IdHtv
	jcMrmPItlMx8y95g6707Rez4clUYWbt2e/cVVPlG12tauK12aCMqxWeSCAxdr707gFbWB+0jdUEoi
	OBA3RquiYdg6+ErCKa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQhy-00000009U09-45k5;
	Thu, 29 Oct 2026 14:02:23 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQhu-00000009Tzi-3OCX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:02:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=46BTS2L17vKUMaAXzO89PlCn4e9X2ecYyyZ5hRRDLBc=;
	b=Xxcr1uEvjyUncblEyLuJ13eru1beYW/GY5GFrPE5ZiK43B4KlA7E+sfVr4qhA3hrvIBxIwDSM
	8bbmRWDAsZAUJOf4aPz+Fkbsf8dlBiYZwCbJ4LCU36/fQiGVBZ8WrYc5WWyoqZLYFc7PE1SX2xp
	egChEha82ieFCMIiUlrLwNo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jFmBT2KpwzRhQX;
	Thu, 29 Oct 2026 22:02:09 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 162B340561;
	Thu, 29 Oct 2026 22:02:12 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 29 Oct 2026 22:02:10 +0800
Message-ID: <009b13c6-f618-43fe-8a56-8519d31b239b@huawei.com>
Date: Thu, 29 Oct 2026 22:02:10 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/15] KVM: arm64: Harvest stage-2 dirty state into the
 host folio account
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-6-zhengtian10@huawei.com> <at-WceRKAVM2kEnI@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <at-WceRKAVM2kEnI@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_070219_566528_D34AB41F 
X-CRM114-Status: GOOD (  26.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/2026 2:05 AM, Leonardo Bras wrote:
> Hi Tian,
> Sorry for the delay in reviewing...
> 
> On Tue, Sep 29, 2026 at 06:36:45PM +0800, Tian Zheng wrote:
>> With VTCR_EL2.HD set, hardware promotes writable-clean descriptors to
>> writable-dirty without any VM exit, and the only record of the write
>> is the S2AP[1] bit in the stage-2 PTE. The write never passed through
>> the host stage-1, and no unmap path reads the bit, so the record dies
>> with the PTE and reclaim may discard written guest data (silent
>> corruption).
> 
> Sorry, I didn't get what you are trying to achieve here.
> 
> On your patch, I see you marking backing pages dirty at wrprotect and unmap
> walkers, and it's very confusing to me on why you are doing this.
> 
> IIUC, what you are trying to do is make sure a page does not lose it's
> contents in case it is reclaimed by the OS.
> 
> IIUC, when a page is reclaimed, it will unmap the S2 PTE, and save it's
> contents to swap, so when the guest read or write to that page will cause
> it to fault.
> 
> The page can never be just unmaped, as if there was a single write to it,
> the backing pages should be writable, and the contents need to be saved
> somewhere.
> 
> So, if I was able to understand your suggestion, we don't need to worry
> about this, and this patch wouldn't be necessary.
> 
> Did you hit this issue?
> Can you please expand on your issue, if I could not describe it above?
> 
> Thanks!
> Leo

Hi Leo,

Thanks for the review. I haven't hit this in practice, and based on your
analysis the patch doesn't look necessary.

Reclaim only writes back folios whose PG_dirty flag is set; a clean
folio is simply freed. A stage-2 write never touches the host
stage-1, so the folio depends entirely on kvm_release_faultin_page()
at fault-in to be marked as dirty; without it, the page stays clean from
the host's perspective and reclaim drops the data.

Your **RFC v1** patch 2 changed that marking from writable to dirty:

```
- kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
+ kvm_release_faultin_page(kvm, s2vi->page, !!ret, dirty);
```

During logging, a read fault maps the page as WC: the folio is not
marked PG_dirty in kvm_s2_fault_map() and hardware promotes the PTE to
WD on write without any fault, so reclaim frees the page without saving
it (the folio was treated as clean).

Therefore, **HDBSS v5** patch 2 reverted to marking the folio for any
write-permitting mapping:

```
kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
```

Together with the v5 scheme, this makes patch 5 unnecessary:

- kvm_s2_fault_compute_prot: always set PROT_W when map_writable
- stage2_set_prot_attr: PROT_W -> DBM unconditionally


---------

On a related note, I'd like to discuss the next version of the DBM
scheme, following Oliver's suggestion [1].

Oliver asked for the write bit to be selected by the system capability:

	FEAT_HAFDBS: PROT_W => DBM, PROT_DIRTY => S2AP[1]
	!FEAT_HAFDBS: both => S2AP[1]

However, our v5 kvm_s2_fault_compute_prot() granted PROT_W
unconditionally. With PROT_W => S2AP[1] on !FEAT_HAFDBS, a read fault on
a dirty-tracked memslot would install a writable page. Since dirty-
logging relies on the write fault to observe the page, we would fail to
track it.

So we also need to fix kvm_s2_fault_compute_prot():

```
if (s2vi->map_writable) {
         if (s2vi->device ||
             !memslot_is_logging(s2fd->memslot) ||
             kvm_is_write_fault(s2fd->vcpu)) {
                 *prot |= KVM_PGTABLE_PROT_W |
                          KVM_PGTABLE_PROT_DIRTY;
         } else if (kvm_supports_hafdbs()) {
                 *prot |= KVM_PGTABLE_PROT_W;
         }
}
```

For normal RAM on a system without FEAT_HAFDBS:

	logging + read fault  -> PTE read-only
	logging + write fault -> PTE S2AP[1]=1

[1] 
https://lore.kernel.org/all/ff218960-c412-4283-aa41-b7af2a7048b8@huawei.com/

Thanks,
Tian

