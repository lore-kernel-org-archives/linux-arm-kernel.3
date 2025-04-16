Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6832C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqwbBa7uhQoH9CpWIda2P6rWQr8Vfphbg6+KdSD5wyY=; b=YYgPmVVbdTThJsKkfjIr+VX5te
	C36wD3VZA/LLYjyGwM57YcMlAD0uqUiFMPpcVA0XBtamK9h39z4MdfG1wc0E2xQ9O0DQNBFaxZg7O
	oet73n9pr3L3AzZxKSQZD/NEQKBjja/UxLYw6w/yNyy7ytFU7KZgj5DNyXUBvyMJXDBRPcBLtNTlO
	rV7YN/jWMJg+l4KDJ3ljuL6jFyw/vc2wQoLAVgOrqfoH6Gm5EuDuiZsoOzJ5m9FCjJxDlKE6F/uqv
	/1FJHIj8KDvZqtVfjjeC/XsPgu1Oi2defeeHvuQrz3f59bq7h5D2XsgOlulluK4EPH6v2SwwIZXsH
	f3IESibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52D5-00000009ZjM-1Gmw;
	Wed, 16 Apr 2025 12:49:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52BD-00000009ZSj-46aa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9566E43B87;
	Wed, 16 Apr 2025 12:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378CAC4CEE2;
	Wed, 16 Apr 2025 12:47:49 +0000 (UTC)
Date: Wed, 16 Apr 2025 13:47:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Xavier <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
	21cnbao@gmail.com, akpm@linux-foundation.org, david@redhat.com,
	gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
	ziy@nvidia.com
Subject: Re: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce
 redundant operations
Message-ID: <Z_-m8s5EUrL4DAME@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_054752_034565_5E51ED1D 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Apr 15, 2025 at 04:22:04PM +0800, Xavier wrote:
> Patch V3 has changed the while loop to a for loop according to the suggestions
> of Dev.

For some reason, my email (office365) rejected all these patches (not
even quarantined), I only got the replies. Anyway, I can get them from
the lore archive.

> Meanwhile, to improve efficiency, the definition of local variables has
> been removed. This macro is only used within the current function and there
> will be no additional risks. In order to verify the optimization performance of
> Patch V3, a test function has been designed. By repeatedly calling mlock in a
> loop, the kernel is made to call contpte_ptep_get extensively to test the
> optimization effect of this function.
> The function's execution time and instruction statistics have been traced using
> perf, and the following are the operation results on a certain Qualcomm mobile
> phone chip:
> 
> Instruction Statistics - Before Optimization
> #          count  event_name              # count / runtime
>       20,814,352  branch-load-misses      # 662.244 K/sec
>   41,894,986,323  branch-loads            # 1.333 G/sec
>        1,957,415  iTLB-load-misses        # 62.278 K/sec
>   49,872,282,100  iTLB-loads              # 1.587 G/sec
>      302,808,096  L1-icache-load-misses   # 9.634 M/sec
>   49,872,282,100  L1-icache-loads         # 1.587 G/sec
> 
> Total test time: 31.485237 seconds.
> 
> Instruction Statistics - After Optimization
> #          count  event_name              # count / runtime
>       19,340,524  branch-load-misses      # 688.753 K/sec
>   38,510,185,183  branch-loads            # 1.371 G/sec
>        1,812,716  iTLB-load-misses        # 64.554 K/sec
>   47,673,923,151  iTLB-loads              # 1.698 G/sec
>      675,853,661  L1-icache-load-misses   # 24.068 M/sec
>   47,673,923,151  L1-icache-loads         # 1.698 G/sec
> 
> Total test time: 28.108048 seconds.

We'd need to reproduce these numbers on other platforms as well and with
different page sizes. I hope Ryan can do some tests next week.

Purely looking at the patch, I don't like the complexity. I'd rather go
with your v1 if the numbers are fairly similar (even if slightly slower).

However, I don't trust microbenchmarks like calling mlock() in a loop.
It was hand-crafted to dirty the whole buffer (making ptes young+dirty)
before mlock() to make the best out of the rewritten contpte_ptep_get().
Are there any real world workloads that would benefit from such change?

As it stands, I think this patch needs better justification.

Thanks.

-- 
Catalin

