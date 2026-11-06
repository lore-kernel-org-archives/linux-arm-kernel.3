Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665C606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hoHsZnEC;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=iDmH0EN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ErgEQ0Ns6+rcrsITsiCH+rdm0302iBOiS8IkFodZXU4=; b=hoHsZnECVLQqmQ
	6Zk/kwCdEyyBr0G/4HZTFWi8z3uKuL2ruskfONsNfVZEhWpHxTQujgZ6IxgpuUFs1SDGkYKdxbwR2
	Ryxs5rw9KfLh5ptdeznh5V8rcnJJsKzN/ktjzGclsSRy2xIDy6XbtzC4ZNieh7/3tS9dT0hOVt18J
	2dph7D0lsU0eCtQV/C5PrQlb31xbK/thAXL6ij+Uu0I1y4rQEMr7/BylCh1BEbdjXudZBfkl3fltp
	pxPfNkrdHLz9I6A8YLEFBn1+kZ9bpFv7LLYZGENa4K2lgHEYO+xaAt3TilazAr3J2Q/zSiSm+1+lX
	MP51lc1TLVXTGmjIEkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPARl-0000000B9Ce-10e6;
	Fri, 06 Nov 2026 03:16:57 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPARh-0000000B97X-2zUi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:16:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ErgEQ0Ns6+rcrsITsiCH+rdm0302iBOiS8IkFodZXU4=;
	b=iDmH0EN4KaCXipjoVKe9dplNElfKEF7HgYj73b4dQV/KmWfbmC/dGbNyQKPX/jEGKUVDhLOcH
	U6s5h8YRl4yXnB4HClWs82BZEpHLsF9gA//ivG77NkFDUNY0vGYjj4c9RYoTWmS08lK/KuhUlMN
	bXs7XmU7cs3LK1LARmr6OE0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jLPTw3G5xz12LG1;
	Fri,  6 Nov 2026 11:16:36 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 99A114056E;
	Fri,  6 Nov 2026 11:16:34 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 6 Nov 2026 11:16:33 +0800
Message-ID: <6e6fb626-d3d4-46f7-93ac-94e3d243eb69@huawei.com>
Date: Fri, 6 Nov 2026 11:16:33 +0800
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
 <009b13c6-f618-43fe-8a56-8519d31b239b@huawei.com>
 <auSMkdEhLI7k8QbV@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auSMkdEhLI7k8QbV@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_191654_382963_10BC01FE 
X-CRM114-Status: GOOD (  30.16  )
X-Spam-Score: -1.3 (-)
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



On 10/30/2026 8:24 PM, Leonardo Bras wrote:
> On Thu, Oct 29, 2026 at 10:02:10PM +0800, Tian Zheng wrote:
>>
>>
>> On 10/27/2026 2:05 AM, Leonardo Bras wrote:
>>> Hi Tian,
>>> Sorry for the delay in reviewing...
>>>
>>> On Tue, Sep 29, 2026 at 06:36:45PM +0800, Tian Zheng wrote:
>>>> With VTCR_EL2.HD set, hardware promotes writable-clean descriptors to
>>>> writable-dirty without any VM exit, and the only record of the write
>>>> is the S2AP[1] bit in the stage-2 PTE. The write never passed through
>>>> the host stage-1, and no unmap path reads the bit, so the record dies
>>>> with the PTE and reclaim may discard written guest data (silent
>>>> corruption).
>>>
>>> Sorry, I didn't get what you are trying to achieve here.
>>>
>>> On your patch, I see you marking backing pages dirty at wrprotect and unmap
>>> walkers, and it's very confusing to me on why you are doing this.
>>>
>>> IIUC, what you are trying to do is make sure a page does not lose it's
>>> contents in case it is reclaimed by the OS.
>>>
>>> IIUC, when a page is reclaimed, it will unmap the S2 PTE, and save it's
>>> contents to swap, so when the guest read or write to that page will cause
>>> it to fault.
>>>
>>> The page can never be just unmaped, as if there was a single write to it,
>>> the backing pages should be writable, and the contents need to be saved
>>> somewhere.
>>>
>>> So, if I was able to understand your suggestion, we don't need to worry
>>> about this, and this patch wouldn't be necessary.
>>>
>>> Did you hit this issue?
>>> Can you please expand on your issue, if I could not describe it above?
>>>
>>> Thanks!
>>> Leo
>>
>> Hi Leo,
>>
>> Thanks for the review. I haven't hit this in practice, and based on your
>> analysis the patch doesn't look necessary.
>>
>> Reclaim only writes back folios whose PG_dirty flag is set; a clean
>> folio is simply freed. A stage-2 write never touches the host
>> stage-1, so the folio depends entirely on kvm_release_faultin_page()
>> at fault-in to be marked as dirty; without it, the page stays clean from
>> the host's perspective and reclaim drops the data.
>>
> 
> Oh, okay. IIUC it will be enough if PG_dirty flag is set once, right?
> 
> While on HAFDBS/HDBSS we will skip the fault for marking them dirty again,
> we always take the first fault for every PTE (or prefault them), so
> PG_dirty should always be set once the page is first wroten to.
> 
> 
>> Your **RFC v1** patch 2 changed that marking from writable to dirty:
>>
>> ```
>> - kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
>> + kvm_release_faultin_page(kvm, s2vi->page, !!ret, dirty);
>> ```
>>
>> During logging, a read fault maps the page as WC: the folio is not
>> marked PG_dirty in kvm_s2_fault_map() and hardware promotes the PTE to
>> WD on write without any fault, so reclaim frees the page without saving
>> it (the folio was treated as clean).
> 
> Ah, I see your point.
> During dirty-tracking guest reads a page, then HAFDBS promotes it to
> writable without marking it as dirty. Good catch!
> 
> But wouldn't a simpler solution be to change the conditions in the fault
> handler, so that it indeed marks it as dirty if dirty-tracking is on, even
> if it's just a read fault?
> 
> Thanks!
> Leo
> 
Hi Leo,

Yes, that's exactly the simpler fix, and it's what I already did in
HDBSS v5 patch 2 — the folio is marked dirty for any write-permitting
mapping, so a read fault on a tracked memslot also marks it.

Since patch 2 covers this, patch 5 isn't needed. I'll drop it in the 
next version.

Thanks,
Tian

>>
>> Therefore, **HDBSS v5** patch 2 reverted to marking the folio for any
>> write-permitting mapping:
>>
>> ```
>> kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
>> ```
>>
>> Together with the v5 scheme, this makes patch 5 unnecessary:
>>
>> - kvm_s2_fault_compute_prot: always set PROT_W when map_writable
>> - stage2_set_prot_attr: PROT_W -> DBM unconditionally
>>
>>
>> ---------
>>
>> On a related note, I'd like to discuss the next version of the DBM
>> scheme, following Oliver's suggestion [1].
> 
> Just as a note for future readers: on another thread we agreed to wait for
> the discussion to reach a point we are all happy before rebasing
> everything.




