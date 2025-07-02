Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C49C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPrS94lVOu7EmI9PYREdDlh0EO6H/zNHIWs+MvCReBI=; b=Zxwy+VlnjLUACh68NAUBvcIz0u
	ddFoKio8k+jt/QkOjesSO/XS6qABkN58N/wu4ynS1EPhKFkzAgw2mlJOYWjSCXPahLVyEekCbtf0I
	vx5Jnu2IKEN8+WTMgwGs7pX2BWifeS4pCcenWHuEelHTCd7zVFvPzjZM7gkdO2CFrnhizYOG8Z0TH
	dgg8y+9HihU7RJ6N1c9quK+qvG29jTGgoHjeWtykDi2fCI/0aFop1ritm3ZPlv9bidT92ZfYei6hn
	dqVamWx32xqQpkjbjNLmuckl3vulGaub+XsD8OulXzpRGF5tM4m4qQMkjYKGvhfxLk8daPFvEXtdD
	+v1VbZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmKm-00000006zUs-1Tfz;
	Wed, 02 Jul 2025 01:32:24 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmIR-00000006zGi-09cr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:30:00 +0000
Message-ID: <47333b7f-2eac-4f57-a9d2-2a7f24c8fa7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751419786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPrS94lVOu7EmI9PYREdDlh0EO6H/zNHIWs+MvCReBI=;
	b=nA9zp2rIDXqL4jzjAR5plfd7uB0j/RUUL+bdMkXsWvyT5PSap3GreV6kZ7o8P0xqNqRSG3
	RzIcf1e9N92AKYdX/uvjqrwzkuME1+dZao9Qp0+McCpbkHZvDe0FWsQk4e5lfn4MPie2qm
	32F5oEnaKg4aRZTbjls//FK0VXFIMAc=
Date: Wed, 2 Jul 2025 09:29:33 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Lance Yang <ioworker0@gmail.com>
References: <20250701143100.6970-1-lance.yang@linux.dev>
 <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_182959_209836_6E5F87A3 
X-CRM114-Status: GOOD (  10.66  )
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



On 2025/7/2 05:17, Andrew Morton wrote:
> On Tue,  1 Jul 2025 22:31:00 +0800 Lance Yang <ioworker0@gmail.com> wrote:
> 
>>   - Add Reported-by + Closes tags (per David)
>>   - Pick RB from Lorenzo - thanks!
>>   - Pick AB from David - thanks!
> 
> It generally isn't necessary to resend a patch to add these
> things - I update the changelog in place as they come in.
> 
> In this case I'll grab that Reported-by: and Closes:, thanks.

Ah, good to know that. Thanks for adding these tags!


