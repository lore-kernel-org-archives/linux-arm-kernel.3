Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81347606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 02:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xOJs5ATq;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2IklUx2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kG2dXNb8wO3/BgLfC0cpJvPGIyuZmV9XeLRw5RqugE4=; b=xOJs5ATqrI2vMX
	zzWfAW73V7U00qYtuX4odM25HPGz18i5vka8d7cg3U3T5mcAjn8bWm9CAGSdPUTJLb32RIgKgcgpR
	rS3GRi7LDnyGVYfkrgRikCy5p5PklxT2jwDdPklvIl0eYmOJ7a7m5udnbhQBW7g04W0jcXfuDbksz
	lLbffzS+0+Dq2CR0AsoKlg+mJmDzlWPd2ROHIg/a9DNX2SMd3jddq/LrebxlhSU84SqQ5mxYHFues
	kEAyRAQ/bp1mmUB+Wh+iHYPJhKCuBkMpQEPrlk4rF0T9jR9+mHEeumU+WZ+ZaE2fmd4r7N+isEAVd
	hTJKExb0iqoL5ng6/Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGHn-00000008Deu-2iSP;
	Thu, 29 Oct 2026 02:54:39 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGHk-00000008Dcx-0YB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 02:54:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kG2dXNb8wO3/BgLfC0cpJvPGIyuZmV9XeLRw5RqugE4=;
	b=2IklUx2LMEZLmggJ3mhG3a18Gubq8nvBArxV8GANZCGw0Mh/SwWlaUoh71DSi3Koh0Zc58dgz
	ZnC7qz+ZGFcd1CCNqLyIRrdjgaN4noxkUUA3e15+fAR0pKK+46xWakBys78xRqfERtzl5a83qrW
	mF8GnxsvytzPaFBLsPilyhc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jFTMr6fy3z1prMP;
	Thu, 29 Oct 2026 10:54:16 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A2844056E;
	Thu, 29 Oct 2026 10:54:25 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 29 Oct 2026 10:54:24 +0800
Message-ID: <52945586-8c5c-4991-bd92-fe02aaf79fbe@huawei.com>
Date: Thu, 29 Oct 2026 10:54:24 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on
 migration
To: Leonardo Bras <leo.bras@arm.com>
CC: liuyonglong <liuyonglong@huawei.com>, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly
	<joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-6-leo.bras@arm.com> <aqneWnlsdpocLIl6@kernel.org>
 <aqqhDs3NyjtkZzXK@LeoBrasDK> <aqsl1_IqnV2r8kUL@kernel.org>
 <aqvt2gnlBZeNsaf4@LeoBrasDK> <as-mH36YSMxAosND@LeoBrasDK>
 <3e464bef-8dfe-44a3-afea-3c276ae87cd8@huawei.com>
 <attMtUqxNsuPooix@LeoBrasDK>
 <8eaaba87-7881-49c4-a76a-51dec2f29ffc@huawei.com>
 <auCPEQmnFwWldTaM@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auCPEQmnFwWldTaM@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_195436_830466_82ED9FFE 
X-CRM114-Status: GOOD (  30.65  )
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



On 10/27/2026 7:46 PM, Leonardo Bras wrote:
> On Tue, Oct 27, 2026 at 10:02:55AM +0800, Tian Zheng wrote:
>>
>>
>> On 10/23/2026 8:01 PM, Leonardo Bras wrote:
>>> On Fri, Oct 23, 2026 at 03:23:04PM +0800, Tian Zheng wrote:
>>>>
>>>>
>>>> On 10/14/2026 11:56 PM, Leonardo Bras wrote:
>>>>> On Thu, Sep 17, 2026 at 02:40:42PM +0100, Leonardo Bras wrote:
>>>>>> On Wed, Sep 16, 2026 at 04:27:19PM -0700, Oliver Upton wrote:
>>>>>>> On Wed, Sep 16, 2026 at 03:00:46PM +0100, Leonardo Bras wrote:
>>>>>>>> On Tue, Sep 15, 2026 at 05:10:02PM -0700, Oliver Upton wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
>>>>>>>>>> When dirty-logging is disabled, even non-write faults make a page dirty,
>>>>>>>>>> which avoids a second fault when the page is actually written to.
>>>>>>>>>>
>>>>>>>>>> On dirty-logging enable, this approach causes all (writable) pages on the
>>>>>>>>>> memslot to be marked clean, even if they were not written to, which can
>>>>>>>>>> take a lot of time, while holding the MMU lock, doing atomic writes to
>>>>>>>>>> PTEs.
>>>>>>>>>
>>>>>>>>> Do you have any performance numbers for this? Enabling HAFDBS seems a
>>>>>>>>> bit involved to avoid some stores on the first pass.
>>>>>>>>
>>>>>>>> Not yet, but if the idea does not look too crazy I can find hardware and
>>>>>>>> collect some data :)
>>>>>>>
>>>>>>> TBH this looks like a micro-optimization so I'm not expecting the
>>>>>>> performance gains to justify the behavior change.
>>>>>>>
>>>>>>
>>>>>> Okay then, I will get a machine to figure the performance gains :)
>>>>>
>>>>> Got the performance numbers here.
>>>>> I tested both the case where all PTEs are dirty, and the case that 50% of
>>>>> the PTEs are dirty.
>>>>>
>>>>> For that test, actually patch #5 could make kvm_pgtable_stage2_wrprotect()
>>>>> slower, which is counter-intuitive, in all platforms tested:
>>>>>
>>>>> When we walk the S2 pagetable to wrprotect, using the new walker, the
>>>>> write to the PTE itself is so cheap* that the cost of the branch
>>>>> misprediction (write PTE or not) for the 50/50 case is significantly higher
>>>>> than the cost of the 50% extra writes, which makes the 50/50 up to 60%
>>>>> slower than the 100% dirty case. It is still slower in the '25% dirty' as
>>>>> well, and starts to get even at '10% dirty'.
>>>>>
>>>>> * (non-atomic, everything is in order, walker is small, cpu will probably
>>>>> bundle it all in a single cacheline write)
>>>>>
>>>>> Since the idea of patch #5 was to reduce PTE writes in the first wrprotect
>>>>> walk, it becomes faster only if only a small portion (<10%) of the VM was
>>>>> write-faulted while the remaining was read-faulted, which seems to be a
>>>>> really reduced audience.
>>>>>
>>>>> Since this comes with increased complexity, and also carry costs of
>>>>> having HAFDBS itself enabled outside dirty-tracking, I don't think it's a
>>>>> good idea to further pursue patch #5. It's only value is that it served as
>>>>> a base for HDBSS implementation.
>>>>>
>>>>> Thanks for reading!
>>>>> Leo
>>>>>
>>>> Hi Leo,
>>>>
>>>> Thanks for running this, the numbers are really useful.
>>>>
>>>> It means the hardware dirty mode (HD=1) should only be enabled while
>>>> dirty logging is active with HDBSS support, and stays off otherwise.
>>>
>>> Hi Tian,
>>>
>>> Correct, it's actually counter-productive for it to stay on without HDBSS
>>> before dirty-logging.
>>>
>>>>
>>>> With HD only enabled during dirty logging, we also keep the DBM-based
>>>> encoding for the HD=0 case. On systems that support FEAT_HAFDBS, DBM
>>>> remains the write bit and S2AP[1] the dirty bit even with HD=0. This
>>>> works because kvm_s2_fault_compute_prot() maps any writable page of a
>>>> non-tracked memslot writable-dirty (WD), including on read faults:
>>>>
>>>> ```c
>>>> if (s2vi->map_writable) {
>>>>           *prot |= KVM_PGTABLE_PROT_W;
>>>>
>>>>           if (s2vi->device ||
>>>>               !memslot_is_logging(s2fd->memslot) ||
>>>>               kvm_is_write_fault(s2fd->vcpu))
>>>>                   *prot |= KVM_PGTABLE_PROT_DIRTY;
>>>> }
>>>> ```
>>>>
>>>> So there is no WC entry for hardware to promote, and HD is simply not
>>>> needed outside dirty logging.
>>>>
>>>> In the next HDBSS version, we'll only turn on HD=1 when dirty logging
>>>> is active.
>>>>
>>>
>>> Right!
>>> I will also send a new version of the pre-patch (4 patches) for us to
>>> discuss. The first 2 patches will change meaning a bit, but should still
>>> work as they do today.
>>>
>>> Thanks!
>>> Leo
>>>
>> Hi Leo,
>>
>> OK, I've seen the new DBM RFC patchset. HDBSS v6 will be based on it.
> 
> 
> Hi Tian, thanks for reading it, and for accepting it in your series!
> 
> Before rebasing, please wait for the ongoing discussion on it's
> correctness. Maybe I will have to send new versions before it can be used.
> 
> Thanks!
> Leo

Hi Leo,

I've read your discussion with Oliver on DBM RFC v2. As a suggestion,
maybe we should go with Oliver's approach, i.e. revert to the v1 scheme
and continue fixing from there.

Thanks,
Tian


