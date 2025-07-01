Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B9BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8hcaTAx86juA/niq7QPs9mBEe9/c+bteJ+HTKMUGZY=; b=0Ld2bHp30V69FfIxBRAIlkwP9V
	IVC6xu4oUahE+uNBd3NBoIBo842LLOfzOpK84TQHZk/ME/peO6JC41AJX1hoY1vLJtY5fI87xhdd4
	oqgOqaIIp1axBKJWVvn7ozSj9bnIDsVzG/YZbrsH5EWdhOP9HlAAwF2oX4XCTh+KTCGZCpCD9eLyT
	ia2XkKaPrplj474XU9L85wBD0jN4BzNLamg/96Cddl0qL7emTTy2pp0fVzxQz4sPkpD8YsiQORc0O
	3NEuKYzKgnB/r2JFneeRfQyVxzxAcf3YNUdr2WpPbojFOgP68OTG7zlvMJ6D5JWQm5RivFwRfgvLi
	p+e2bHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdBc-00000005vqM-0CLg;
	Tue, 01 Jul 2025 15:46:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbVo-00000005c9g-49VK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25DBE61441;
	Tue,  1 Jul 2025 13:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191FAC4CEEB;
	Tue,  1 Jul 2025 13:59:00 +0000 (UTC)
Date: Tue, 1 Jul 2025 14:58:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com,
	ioworker0@gmail.com, dev.jain@arm.com, akpm@linux-foundation.org,
	david@redhat.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, willy@infradead.org, xavier_qy@163.com,
	ziy@nvidia.com, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant
 operations of  contpte_ptep_get
Message-ID: <aGPpohrc8APQad-v@arm.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
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

On Tue, Jun 24, 2025 at 11:25:49PM +0800, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
> 
> Test Code:
> 	#include <stdlib.h>
> 	#include <sys/mman.h>
> 	#include <stdio.h>
> 
> 	#define PAGE_SIZE 4096
> 	#define CONT_PTES 16
> 	#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> 	#define YOUNG_BIT 8
> 	void rwdata(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
> 			buf[i] = 'a';
> 			volatile char c = buf[i];
> 		}
> 	}
> 	void clear_young_dirty(char *buf)
> 	{
> 		if (madvise(buf, TEST_SIZE, MADV_FREE) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}
> 		if (madvise(buf, TEST_SIZE, MADV_COLD) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}
> 	}
> 	void set_one_young(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += CONT_PTES * PAGE_SIZE) {
> 			volatile char c = buf[i + YOUNG_BIT * PAGE_SIZE];
> 		}
> 	}
> 
> 	void test_contpte_perf() {
> 		char *buf;
> 		int ret = posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE,
> 				TEST_SIZE);
> 		if ((ret != 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE)) {
> 			perror("posix_memalign failed");
> 			exit(EXIT_FAILURE);
> 		}
> 
> 		rwdata(buf);
> 	#if TEST_CASE2 || TEST_CASE3
> 		clear_young_dirty(buf);
> 	#endif
> 	#if TEST_CASE2
> 		set_one_young(buf);
> 	#endif
> 
> 		for (int j = 0; j < 500; j++) {
> 			mlock(buf, TEST_SIZE);
> 
> 			munlock(buf, TEST_SIZE);
> 		}
> 		free(buf);
> 	}
> 
> 	int main(void) 
> 	{
> 		test_contpte_perf();
> 		return 0;
> 	}
> 
> 	Descriptions of three test scenarios
> 
> Scenario 1
> 	The data of all 16 PTEs are both dirty and young.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 0
> 
> Scenario 2
> 	Among the 16 PTEs, only the 8th one is young, and there are no dirty ones.
> 	#define TEST_CASE2 1
> 	#define TEST_CASE3 0
> 
> Scenario 3
> 	Among the 16 PTEs, there are neither young nor dirty ones.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 1
> 
> Test results
> 
> |Scenario 1         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    37912436160|     18731580031|
> |test time          |         4.2797|          2.2949|
> |overhead of        |               |                |
> |contpte_ptep_get() |         21.31%|           4.80%|
> 
> |Scenario 2         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36701270862|     36115790086|
> |test time          |         3.2335|          3.0874|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         32.26%|          33.57%|
> 
> |Scenario 3         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36706279735|     36750881878|
> |test time          |         3.2008|          3.1249|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         31.94%|          34.59%|
> 
> For Scenario 1, optimized code can achieve an instruction benefit of 50.59%
> and a time benefit of 46.38%.
> For Scenario 2, optimized code can achieve an instruction count benefit of
> 1.6% and a time benefit of 4.5%.
> For Scenario 3, since all the PTEs have neither the young nor the dirty
> flag, the branches taken by optimized code should be the same as those of
> the original code. In fact, the test results of optimized code seem to be
> closer to those of the original code.
> 
> Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> 
> Scenario 1: reduced to 56% of baseline execution time
> Scenario 2: reduced to 89% of baseline execution time
> Scenario 3: reduced to 91% of baseline execution time

Still not keen on microbenchmarks to justify such change but at least
the code is more readable than the macro approach in some earlier
version.

Do you have any numbers to see how it compares with your v1:

https://lore.kernel.org/all/20250407092243.2207837-1-xavier_qy@163.com/

That patch was a lot simpler.

Thanks.

-- 
Catalin

