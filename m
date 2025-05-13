Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BAFC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANoKV/LAVfoHgJTa0rc6msgHc3vSusd6KvN8kOIQie4=; b=hdryqfKY4fqVNGYHw/YaTEPeCH
	0XZnBAaV35MHXudY/6Le+fkLRAyDfPHchK3+1OXO0SliTf8kZ6rrbZ5MhzXk+rHeChYrjYsOzjM6d
	mkPIX1WVlDf2WarkIeCZMAM/MF811MEEfq3wXsh37paGdnSqx+FBFvWs4cAu2C0ZcKijjSX9QzKyv
	2sEFdi0LRf9NNbT5eJ9KiY1nJPa/eXhMAajXW57/nO2Isz+PNkKMIMWPkV4haUThcX8x2PeAlSr/U
	s6G5nKFRzCVUkJJVTiwH/M3psq0Mv2pq/F4Hg76jqLdtHy03tY2MsixWbNLn31ovg8Ruq4tNm/kxk
	g6hBQ35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEotM-0000000CNXg-36vk;
	Tue, 13 May 2025 12:37:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEop2-0000000CMg3-1NAS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:33:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 721171688;
	Tue, 13 May 2025 05:33:10 -0700 (PDT)
Received: from [10.1.25.187] (XHFQ2J9959.cambridge.arm.com [10.1.25.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EB513F5A1;
	Tue, 13 May 2025 05:33:19 -0700 (PDT)
Message-ID: <e57613f8-333a-4de4-b1a3-2d806ac8ee4f@arm.com>
Date: Tue, 13 May 2025 13:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] mm/readahead: Honour new_order in
 page_cache_ra_order()
Content-Language: en-GB
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, p.raghav@samsung.com
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-2-ryan.roberts@arm.com>
 <nepi5e74wtghvr6a6n26rdgqaa7tzitylyoamfnzoqu6s5gq4h@zqtve2irigd6>
 <22e4167a-6ed0-4bda-86b8-a11c984f0a71@arm.com>
 <pskrpcu3lflo3pgeyfvnifcn7z2o6bsieaclntsbyvefs4ab3a@cyfnf36mccvi>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <pskrpcu3lflo3pgeyfvnifcn7z2o6bsieaclntsbyvefs4ab3a@cyfnf36mccvi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_053324_422181_D36C8E5C 
X-CRM114-Status: GOOD (  23.41  )
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

On 09/05/2025 21:50, Pankaj Raghav (Samsung) wrote:
>>>>  
>>>
>>> So we always had a fallback to do_page_cache_ra() if the size of the
>>> readahead is less than 4 pages (16k). I think this was there because we
>>> were adding `2` to the new_order:
>>
>> If this is the reason for the magic number 4, then it's a bug in itself IMHO. 4
>> pages is only 16K when the page size is 4K; arm64 supports other page sizes. But
>> additionally, it's not just ra->size that dictates the final order of the folio;
>> it also depends on alignment in the file, EOF, etc.
>>
> 
> IIRC, initially we were not able to use order-1 folios[1], so we always
> did a fallback for any order < 2 using do_page_cache_ra(). I think that
> is where the magic order 2 (4 pages) is coming. Please someone can
> correct me if I am wrong.

Ahh, I see. That might have been where it came from, but IMHO, it still didn't
really belong there; just because the size is bigger than 4 pages, it doesn't
mean you would never want to use order-1 folios - there are alignment
considerations that can cause that. The logic in page_cache_ra_order() used to
know to avoid order-1.

> 
> But we don't have that limitation for file-backed folios anymore, so the
> fallback for ra->size < 4 is probably not needed. So the only time we do
> a fallback is if we don't support large folios.
> 
>> If we remove the fallback condition completely, things will still work out. So
>> unless someone can explain the reason for that condition (Matthew?), my vote
>> would be to remove it entirely.
> 
> I am actually fine with removing the first part of this fallback condition.
> But as I said, we still need to do a fallback if we don't support large folios.

Yep agreed. I'll make this change in the next version.

> 
> --
> Pankaj
> 
> [1] https://lore.kernel.org/all/ZH0GvxAdw1RO2Shr@casper.infradead.org/


