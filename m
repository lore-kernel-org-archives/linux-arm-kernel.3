Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB07FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z7J2/ULNSA00ESGJkV5zPKGTqAvtL1rE4wzbzIL92k=; b=qC1AD43Ol8eNYurRowNwe7FW4A
	CdH2ja7cKbNWdfe3DXVQueUzVBysXipbiOjCWhsLZjbho/yW11dj4Zxrlq+JD/TI8pmg+/ziyKw0K
	bnhXL617GXHMY9aEtxnHp9u8gOCHcouVCqGliI8GPPZYkTNMpWNbbL4VdFitFEuXmiJQpraR8tqlq
	yhKfPpGtpNu8S4D7289uwEZWdjg6TzX0w1oPYF1yEaZqmTaVfIZnowdTm01FolCrdMcwz1KvrKqrD
	kvoh+cerY6r2jEJHdxb/7uImtJi3WmCJie3Iw+bkFc8JX339Oy0+bokLiWoJLo+zK7IZGkcEmFi9n
	SZJm7/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXee-00000005oHZ-39NK;
	Thu, 26 Feb 2026 09:27:32 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXeb-00000005oFY-2dCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772098041; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5Z7J2/ULNSA00ESGJkV5zPKGTqAvtL1rE4wzbzIL92k=;
	b=SgQCKRSZhME4C4DX5vpQoBSS3s4YVJSHYbsTxYcJT8ddl67T3QASt9KM7J8dl1cfhaU2lHYfeX4mXRTMgswmLaYiWCy70USpzdW90iCmhi8iNnAID727dUCHHxm3p9L1G0egtqR+8EFdtnnQ31M/aQJP8fJxdKs+B5dfVfWEwo0=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WzqngAX_1772098037 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 17:27:18 +0800
Message-ID: <08a22ed6-3165-41a5-8d46-aaa09402a0f9@linux.alibaba.com>
Date: Thu, 26 Feb 2026 17:27:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: support batched checking of the young flag for
 MGLRU
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <84d2426c63c1eafeaa0cfbad7c5cc11e9c11b980.1771897150.git.baolin.wang@linux.alibaba.com>
 <2e7a1e24-3616-4b79-b943-b5f7efde2d31@kernel.org>
 <0871edb9-08a2-46a0-ade6-af842a12e0d3@linux.alibaba.com>
 <2599bc1e-1f8e-46bc-afea-4cb8f657545b@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <2599bc1e-1f8e-46bc-afea-4cb8f657545b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_012730_125326_EBBAEBFA 
X-CRM114-Status: GOOD (  13.70  )
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



On 2/26/26 5:08 PM, David Hildenbrand (Arm) wrote:
> 
>>>
>>>> +            pte_t pteval = ptep_get(pvmw.pte);
>>>
>>> I wonder if there could be a way to avoid this ptep_get() by letting
>>> page_vma_mapped_walk() just provide the last value it used (in
>>> check_pte() I guess). Something for another patch.
>>
>> Well, we’d need to add a new field to ‘struct page_vma_mapped_walk’ to
>> store the last value (e.g., pvmw.pteval),
> 
> Yes.
> 
>> but this makes me wonder if it
>> is worth adding a new field just to avoid a lightweight read (which
>> should have no obvious performance impact).
> 
> You recall that ptep_get() on arm64 is not that lightweight due to
> con-pte? :)
> 
> But yeah, something for another day.

OK.

>>> What is "batched"? Did you mean "nr_ptes" ? Or just the initial value
>>> for "nr" ?
>>
>> There is already an 'nr' variable in this function. "nr_ptes" sounds
>> good to me, and will use it.
> 
> You can just use "nr" here and reuse it for the existing variable?
> 
> Both have the same semantics (nr of ptes / pages), so having a single
> value might cause less confusion.

Sure. Will do.

