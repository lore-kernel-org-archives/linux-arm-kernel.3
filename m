Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1034C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y7XLsigbMxXs7ZgNb38kJkbCd+MFoWLhNYmYReBZwM=; b=pOs1JWGPXThqF1Yx3ON04pFciT
	BWnZj/HVepRb09zqYtZXLKU/25iChp6sbHzzhR+Hyu/m1JCRPLWkCe0ILImnxVa8E+5ylOvSN31w8
	Vf8NfHvIqqSR1VC4GS/Sbl5WS71iU59Nuiow+FGfGXy9DWuCBxZuRCQZUwSVUXJaLxA4ztrMDnuaQ
	qMju/KoAXt+20f3m3iEkRCX++XiIdEMJOPX7E1KXU9aJm3o9YQCdHll4K52qPaq6AWOVJed/lRv85
	rCaWbGmL8V57j4Nz5zk57SlbOEyfRFVX1JSLjT5cUOtr5ofVw3OdgfkQ5oUpRwF88a0fwot1sJE/u
	v7TbmeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt1Ps-0000000AEkN-0Yg2;
	Sun, 09 Aug 2026 11:10:08 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt1Po-0000000AEjg-30zM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 11:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=8Y7XLsigbMxXs7ZgNb38kJkbCd+MFoWLhNYmYReBZwM=;
	b=ZQpq54QmvzDa++H15/W28kn10cWLlwMdYjgEmkBYoJ1yO8JSjVHKWRUgqmLNmi
	zs7k5D5dXFOvU1pQ/rJNobyaYFiVZ7qXnN6phWhfanZpcHSDsNPrgWwqds7CUs0y
	Aie3wAooPfKBGoYZ77lhTg70KEUHQ+qAIg+iyQONB5Z1w=
Received: from smtp.163.com (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAXtfvzX3hqQpcFKg--.41218S2;
	Sun, 09 Aug 2026 19:09:39 +0800 (CST)
From: Lianghong Liu <liulhong617@163.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, ardb@kernel.org
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map reserved memory
Date: Sat, 09 Aug 2026 02:30:00 +0800
Message-ID: <reply-no-map-e6bc49f31a3742e6-liulhong617@163.com>
In-Reply-To: <20260513010255.3764038-1-liulhong617@163.com>
References: <20260513010255.3764038-1-liulhong617@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Thunderbird/128.0
X-CM-TRANSID: PSgvCgAXtfvzX3hqQpcFKg--.41218S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF18Xry3XF1xKF1xtw1kXwb_yoW5Jw4fpF
	sxtFWFkr48Ga4Y93yfJrW5ury3Xwsakan8JFyUCFy8Ars8WF4Skr48G345AFy7Jr45A3Wj
	qFsrtF47Kr1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRFdgtUUUUU=
X-Originating-IP: [39.182.11.235]
X-CM-SenderInfo: holxzxxrqjliqx6rljoofrz/xtbC+RPMJ2p4X-P12gAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_041005_424860_D6C5B1AB 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Will,

Thanks for applying the patch, and apologies for my earlier reply. You
were right that it read like an AI-generated response — I had used LLVM
to help me parse your message and polish my wording, and it
ended up restating your question instead of answering it. That was my
fault, and I'll answer in my own words below.

To answer the question you actually asked on July 16 — "what practical
issues are you seeing on your system?":

I'm running v6.1.177-rt on a Cortex-A78AE (Armv8.2), 64K pages. The Device Tree
has four no-map regions, two of them sub-page and holding TEE memory the
firmware has marked inaccessible to the REE:

  reserved_region1@A0100000 { reg = <0x0 0xA0100000 0x0 0x00400000>; no-map; }; /* 4 MiB          */
  reserved_region2@A0500000 { reg = <0x0 0xA0500000 0x0 0x00002000>; no-map; }; /* 8 KiB, sub-page  */
  reserved_region3@A2000000 { reg = <0x0 0xA2000000 0x0 0x00008000>; no-map; }; /* 32 KiB, sub-page */
  reserved_region4@AB000000 { reg = <0x0 0xAB000000 0x0 0x00100000>; no-map; }; /* 1 MiB          */

Regions 2 and 3 should be unmapped. With the DStream debugger I see them
folded into one mapped span instead:

  0xFFFF000060000000-0xFFFF0000604FFFFF   <unmapped>
  0xFFFF000060500000-0xFFFF00006AFFFFFF   NP:0xA0500000-0xAAFFFFFF   Normal   RW
  0xFFFF00006B000000-0xFFFF00006B0FFFFF   <unmapped>

What should be two mappable ranges (0xA0502000-0xA2000000 and
0xA2008000-0xAB000000) get outward-rounded by `phys &= PAGE_MASK` in
__create_pgd_mapping_locked() into a single 0xA0500000-0xAB000000
mapping that covers both no-map regions.

The symptom on this hardware: the Cortex-A78AE's cache prefetcher
speculatively touches the now-mapped TEE pages, trips the firmware's
secure-memory protection, and raises spurious "REE accessed secure
memory" faults.

That's what the patch addresses — round the linear-map range inward so a
sub-page-aligned start/end can't pull the mapping back over an adjacent
no-map region. I'm grateful to Ard for supplying the piece I failed to:
for_each_mem_range() presents coalesced ranges, so the inward rounding
can't drop a page the allocator owns.

On the follow-ups you and Ard raised — I'd be glad to look at moving the
rounding into __create_pgd_mapping_locked() (or dropping it there and
leaving it to callers) as a separate change, and adding a WARN when a
linear-map range comes in non-page-aligned. I'll leave the applied patch
alone and send those as follow-ups if they still seem worthwhile.

Thanks again,
Lianghong Liu


