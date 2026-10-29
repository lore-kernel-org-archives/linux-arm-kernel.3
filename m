Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D26606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7uizFgm;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kfi7zL3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NcG7rziTtzBQo+YgRjjhG7OeEH2wIvONYfErWYNIqjI=; b=X7uizFgmicTTEc
	wsVfu4vO0tBzq2kOxuZ5UMOIyJghUBrYtX8WKQ8NEkT6eQuyKQirIVVALKAUxNfPtt0wF4G5+VM8J
	xdZ6cEi8nKGg2MzecWAbrpuBzB4o1JxAncbgio71rg1K51WNHbWl2pjtxx3vQhG3QUz+DfBNkYqTA
	0EGZZ8K0ccra8+264oikf7TXJhVFGfnJ2jTVXdvtLgo9Tjt1kBi5CN0T//VNaImF+aDjrY2vcjSM9
	cp9CG3QEeSXRwQXv5na1y1/1I17g7DWir17e2EFrQmCxXfO4qZDt+XUzqXCGcmhRPY+ZFQ7U+yAx7
	erU+4iSK1vtHcnM+i1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKFe-00000008Wcx-31eQ;
	Thu, 29 Oct 2026 07:08:42 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKFa-00000008WcP-2Eno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:08:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NcG7rziTtzBQo+YgRjjhG7OeEH2wIvONYfErWYNIqjI=;
	b=kfi7zL3/rr8sDCvbxJvwXX+rL/VVtaqKgNez2Wf2ByMEWMm1U6i6ncOOM167EOf6Q1cR13nys
	dz/8xRElyMbITao2PzoSBB43OVCo1PnLXvv8pnBvLtstXdh/0h4EplLxYhFPkF3extdTNeZdKvk
	EjWsN4t64y+XM32LpNJISoQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jFb0y2tZ4z1T4kk;
	Thu, 29 Oct 2026 15:08:18 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D83740537;
	Thu, 29 Oct 2026 15:08:29 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 29 Oct 2026 15:08:28 +0800
Message-ID: <6d2411a3-b37b-4cdb-80ca-10654cc88a17@huawei.com>
Date: Thu, 29 Oct 2026 15:08:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] KVM: arm64: pgtables: Change write bit from
 S2AP_W to DBM
To: Leonardo Bras <leo.bras@arm.com>
CC: Oliver Upton <oupton@kernel.org>, <maz@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<pbonzini@redhat.com>, <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-2-zhengtian10@huawei.com> <arxW4PUY3qqRkogl@kernel.org>
 <8ca88576-651a-4b7f-91ff-2cb2359aa79e@huawei.com>
 <at9raEVrsbb7rj6n@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <at9raEVrsbb7rj6n@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_000839_187532_15DA20DF 
X-CRM114-Status: GOOD (  22.02  )
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	T_SPF_TEMPERROR,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/2026 11:02 PM, Leonardo Bras wrote:
> On Wed, Sep 30, 2026 at 10:44:26AM +0800, Tian Zheng wrote:
>> On 9/30/2026 8:25 AM, Oliver Upton wrote:
>>> Hmm... I'd actually like to see this structured where the "write" bit
>>> could either be S2AP_W or DBM depending on if the system supports
>>> FEAT_HAFDBS. Look at how HVHE is handled for selecting the right AP
>>> encoding for the hyp stage-1 page tables.
>>>
>>
>> Hi Oliver,
>>
>> Thanks for the suggestion. I missed the case where FEAT_HAFDBS is not
>> supported. Systems without the feature should keep the original
>> encoding, with S2AP[1] as the write permission bit. I'll follow the HVHE
>> pattern to select between the two encodings in the next version.
>>
>> Thanks!
>> Tian
>>
> 
> Hi Oliver, Tian,
> 
> After some digging, I think it would be better if we kept using S2AP[1] as
> a writable bit, while DBM can be treated as "Can promote a non-writable
> page to writable if HAFDBS=on".
> 
> I know it's not that intuitive, as the Arm ARM even introduced the concept
> of Writable-clean an Writable-dirty, but I think it will be the best way of
> referring to what was intended of the bit.
> 
> I wrote down what I mean by that:
> https://lore.kernel.org/all/20261026144413.441566-1-leo.bras@arm.com/
> 
> tl;dr:
> - DBM + S2AP[1] is set on writable entries (KVM_PGTABLE_PROT_W)
> - Writable detection is made only on S2AP[1], so no changes
> - Wrprotect sets S2AP[1]=0 from the PTE, and also DBM=0 if it's a block
> 
> On dirty-tracking:
> - If HAFDBS=0 : no functional change, DBM bit there but unused
> - If HDBSS=1
>    - Pages: writable-clean promoted to writable-dirty on write, HDBSS does
>      the tracking
>    - Blocks: faults on write, splits in pages, pages get DBM=1.
>    	(argh, I think we need a PROT_DBM for that)
> 
> Does that make sense?
> 
> Thanks!
> Leo

Hi Leo,

Got it. I'll wait for the conclusion of your discussion with Oliver
before proceeding.

Thanks,
Tian


