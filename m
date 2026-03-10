Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BA7FCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOzjae/W+WCxIMUGhwZr1WeqcdnegQLRX5RKCOr4bFk=; b=eu66fa4euwrdsn20eEaIbzNdcy
	F3aj3EohZMhcIl0zSRVRIlqXWmt3aw8xafdGi1ZNpsjCYOiASKjwjMYQsfnSLj1r66wc55mzhpEJk
	Uy/1Zn0FiERKobYNqO2eiag9Jyn7Cst73/UqK7KxDMyQ5tNMmgDZTaVwaEqv1hkR7F3xbiinPDFQy
	nyqxEf8yW3dBJ0XqQv0KOe7XIUO8egrmfTgOtit/g/1yD0naIXTyNNR/zf+SpAlhygioVCogZsYdx
	rTxXohWq10KwRWcPpOgJB9cOXrBj+OideQXuALUnMtCkfZl96ucf2S15asgBRrDpngVyWMBZaCkrQ
	UDyzdKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznBl-00000008apb-27e0;
	Tue, 10 Mar 2026 02:51:17 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznBi-00000008ap2-2Iob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773111071; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aOzjae/W+WCxIMUGhwZr1WeqcdnegQLRX5RKCOr4bFk=;
	b=M+AOVR+DqW1SerSxB3lG7+p3C/04x1nlhxdUqHMxqg7791263AHBLwBrpbx+30hdQgWEHY1353QNJsBOAjBkvE+h9U74KSQfOYa68hLuGvsB8LD3WoITlhi0VZ7Ebg/u2OlYOOmT/P7k2S6UllysDqQV2X6hPMfMW4+4mTXyWgg=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-eKuga_1773111066 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Mar 2026 10:51:07 +0800
Message-ID: <9b324c40-d148-4c1b-bcbb-7bd07c4f6bbb@linux.alibaba.com>
Date: Tue, 10 Mar 2026 10:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: mm: implement the architecture-specific
 test_and_clear_young_ptes()
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
 <7f891d42a720cc2e57862f3b79e4f774404f313c.1772778858.git.baolin.wang@linux.alibaba.com>
 <6305e05e-2911-42b0-b6f5-7fdde787b778@kernel.org>
 <c607b6fd-a682-4400-a7fd-abe83152db10@linux.alibaba.com>
 <92376758-5bb5-4391-8904-cd0e2f72acf8@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <92376758-5bb5-4391-8904-cd0e2f72acf8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195114_930150_E2A6615C 
X-CRM114-Status: GOOD (  13.08  )
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



On 3/9/26 10:39 PM, David Hildenbrand (Arm) wrote:
>>>
>>> (b) The first pte is !pte_cont(), but some others in there are?
>>
>> IMO they can’t be handled in a single batch. Since the folio_pte_batch()
>> will group consecutive !cont PTEs into one batch and consecutive cont
>> PTEs into another (assume all PTEs belong to a single large folio),
>> because their PTE entries have different CONT bits.
> Interesting, thanks. I thought that folio_pte_batch() would be able to
> batch that.
> 
> But yes, pte_batch_hint() relies on the CONT bit still being set after a
> ptep_get(). I wonder whether we should document somewhere that the arm
> implementation depends on that.
> 
> This might be something to look into in the future. (make
> folio_pte_batch() ignore cont information when comparing and make the
> arm implementation be able to deal with that).
> 
> Assume we unmapped the last page of a large folio. Ideally, we'd be able
> to process the remaining THP pieces (all ptes) in a single operation. I
> guess right now it would be two.

Right. Let me investigate this further and see if I can figure out how 
to optimize this case.

Thanks for reviewing.

