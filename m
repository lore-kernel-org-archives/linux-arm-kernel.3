Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9902C02187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 01:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsqFKuMiLwMIWqbIsmre8PDwSTy200zBboCltX5otHE=; b=du433vacuofrYsPHiJ2coDkE8P
	dODQwrHufUYaXKWk3gocmBHo6HVrT80BFEGYlHleyHhJiSzf7BfzvQf3F11QhJ0ZS6/yFKZyhdLhV
	GqiV5b42fUxfD4fc9MiYqw3uJbFuHpfCJ7Cowz4fWXVp41E+dMiYlnayOetqNFiGmyOubcQemSszW
	02XWydezQwJd3hIE/EH+U51ZEuuCPt4lKRegHnmiZKXpOxjusKHeeH/YqtwfzEpBKveO7m3qW/yoF
	AnHtrHraz/4ZJecJHmN5E3Ob4+mixLFrKR62fHInPZwMGdCFdLRTeh919rYvVbmxP6HR5wqFhbUj6
	MonCxnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbDR-0000000GmwP-2Ecx;
	Fri, 17 Jan 2025 01:32:05 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbC9-0000000GmfJ-22o4;
	Fri, 17 Jan 2025 01:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737077439; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TsqFKuMiLwMIWqbIsmre8PDwSTy200zBboCltX5otHE=;
	b=ejHDnCo94L03gkQR4tsWPG2L6zFGYksVaS+pDg7jgDrE193R1xX+LDKF09UVuiPW37eZEUl1HBhcG6fRN/nLSY9tsntU2sAg61902sG4b2YZzXYFS8QZdm6CMFbzwZizkWyOt39N0PpqlyLCN/nMIsWfpLDH3AfF9hW5aJIrkBY=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WNmu3tq_1737077435 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Jan 2025 09:30:36 +0800
Message-ID: <ef266df5-46dc-43d2-8bb3-df28223b7149@linux.alibaba.com>
Date: Fri, 17 Jan 2025 09:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: chrisl@kernel.org, david@redhat.com, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-5-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250115033808.40641-5-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_173045_825143_D2B12EC7 
X-CRM114-Status: UNSURE (   8.76  )
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



On 2025/1/15 11:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The try_to_unmap_one() function currently handles PMD-mapped THPs
> inefficiently. It first splits the PMD into PTEs, copies the dirty
> state from the PMD to the PTEs, iterates over the PTEs to locate
> the dirty state, and then marks the THP as swap-backed. This process
> involves unnecessary PMD splitting and redundant iteration. Instead,
> this functionality can be efficiently managed in
> __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> improving performance.
> 
> The following microbenchmark redirties folios after invoking MADV_FREE,
> then measures the time taken to perform memory reclamation (actually
> set those folios swapbacked again) on the redirtied folios.
> 
>   #include <stdio.h>
>   #include <sys/mman.h>
>   #include <string.h>
>   #include <time.h>
> 
>   #define SIZE 128*1024*1024  // 128 MB
> 
>   int main(int argc, char *argv[])
>   {
>   	while(1) {
>   		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
>   				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 
>   		memset((void *)p, 1, SIZE);
>   		madvise((void *)p, SIZE, MADV_FREE);
>   		/* redirty after MADV_FREE */
>   		memset((void *)p, 1, SIZE);
> 
> 		clock_t start_time = clock();
>   		madvise((void *)p, SIZE, MADV_PAGEOUT);
>   		clock_t end_time = clock();
> 
>   		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
>   		printf("Time taken by reclamation: %f seconds\n", elapsed_time);
> 
>   		munmap((void *)p, SIZE);
>   	}
>   	return 0;
>   }
> 
> Testing results are as below,
> w/o patch:
> ~ # ./a.out
> Time taken by reclamation: 0.007300 seconds
> Time taken by reclamation: 0.007226 seconds
> Time taken by reclamation: 0.007295 seconds
> Time taken by reclamation: 0.007731 seconds
> Time taken by reclamation: 0.007134 seconds
> Time taken by reclamation: 0.007285 seconds
> Time taken by reclamation: 0.007720 seconds
> Time taken by reclamation: 0.007128 seconds
> Time taken by reclamation: 0.007710 seconds
> Time taken by reclamation: 0.007712 seconds
> Time taken by reclamation: 0.007236 seconds
> Time taken by reclamation: 0.007690 seconds
> Time taken by reclamation: 0.007174 seconds
> Time taken by reclamation: 0.007670 seconds
> Time taken by reclamation: 0.007169 seconds
> Time taken by reclamation: 0.007305 seconds
> Time taken by reclamation: 0.007432 seconds
> Time taken by reclamation: 0.007158 seconds
> Time taken by reclamation: 0.007133 seconds
> …
> 
> w/ patch
> 
> ~ # ./a.out
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002116 seconds
> Time taken by reclamation: 0.002150 seconds
> Time taken by reclamation: 0.002261 seconds
> Time taken by reclamation: 0.002137 seconds
> Time taken by reclamation: 0.002173 seconds
> Time taken by reclamation: 0.002063 seconds
> Time taken by reclamation: 0.002088 seconds
> Time taken by reclamation: 0.002169 seconds
> Time taken by reclamation: 0.002124 seconds
> Time taken by reclamation: 0.002111 seconds
> Time taken by reclamation: 0.002224 seconds
> Time taken by reclamation: 0.002297 seconds
> Time taken by reclamation: 0.002260 seconds
> Time taken by reclamation: 0.002246 seconds
> Time taken by reclamation: 0.002272 seconds
> Time taken by reclamation: 0.002277 seconds
> Time taken by reclamation: 0.002462 seconds

Good result.

> This patch significantly speeds up try_to_unmap_one() by allowing it
> to skip redirtied THPs without splitting the PMD.
> 
> Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lance Yang <ioworker0@gmail.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

