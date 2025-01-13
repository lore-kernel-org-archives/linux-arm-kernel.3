Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED82C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aUnWkIHwhQ+SpBem9+leCKrek2lWeaNW/FYtCa6Zac=; b=A4gGAUYuPyyszttI8CBx/zeeZc
	mfJ/9E103EV9QMJL7Vpe8iHPrk9C02ZyRF0fvoRuMY5WcsbFe0FEU4KrJUdBS9KA3Z4PJOmBS2zcE
	m+qTmkv2w5Ix99O+HZBsja4dzl4LcAt8A4W+a7x9HtzM5Zx3AaIoVcxcdjHmDeD0zMYqDPnVgaWFv
	LTALy7dGe/8V5df7zdb92M8/Wgyu7c5yWgqKQL2iQDkVdFxYKMFvirwOBdEzmdCBisU1j+9cy/cFS
	dBuDI9BpHmJuVnpkUftJ7+EPWq2Z+F2kV+tEowJAlJ5ClT5sci6Ugub8hg9fEIONs+yIf0boZjk6/
	TGV+b0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNeF-00000005wUC-0RfQ;
	Mon, 13 Jan 2025 16:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNbw-00000005vwt-3rUd;
	Mon, 13 Jan 2025 16:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2554D5C5637;
	Mon, 13 Jan 2025 16:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00791C4CED6;
	Mon, 13 Jan 2025 16:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736786899;
	bh=JKbUdrq2yjCdAS7+vTikTrh0+8U9qazr2XTClE4SOeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGT3La7eABzQ7OhDTupouwdqXt4MD5RkP+HE//stc61NySgZntcB28m6U2N4jYZMU
	 JET9d/nkuUq4pZJqDbrWoMZzE9F0B7/+KoWOUZ4cZf66NGlgdEl6p6sJFJRw6gQJSy
	 aTTYoEWcEgZvDwfiSGdaQdfzIBQM/9L4W6WX2frJXvClVsPW0Y3TaAxlQ3azMnAaqo
	 9fysBp7HU2Zhnfjpz5Ibv/CnyLtcXljQYgYj2EGIVX50UrcJYbLTuGgAz2R32sx7Gw
	 LFw61MzuVHihkvPMlUj4wOWObdb861F+84u5fSpgNV9c6iUVIXsAXCob5RsKZB6DsP
	 legD9xTnZPxzA==
Date: Mon, 13 Jan 2025 16:48:10 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com,
	ioworker0@gmail.com, kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
	linux-riscv@lists.infradead.org, ying.huang@intel.com,
	zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH v2 2/4] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <20250113164809.GC14101@willie-the-truck>
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-3-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113033901.68951-3-21cnbao@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_084821_040032_17CBEEEF 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Jan 13, 2025 at 04:38:59PM +1300, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This is a preparatory patch to support batch PTE unmapping in
> `try_to_unmap_one`. It first introduces range handling for
> `tlbbatch` flush. Currently, the range is always set to the size of
> PAGE_SIZE.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Shaoqin Huang <shahuang@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Lance Yang <ioworker0@gmail.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++------------
>  arch/arm64/mm/contpte.c           |  2 +-
>  arch/riscv/include/asm/tlbflush.h |  3 ++-
>  arch/riscv/mm/tlbflush.c          |  3 ++-
>  arch/x86/include/asm/tlbflush.h   |  3 ++-
>  mm/rmap.c                         | 12 +++++++-----
>  6 files changed, 28 insertions(+), 21 deletions(-)

The arm64 bits look correct to me:

Acked-by: Will Deacon <will@kernel.org>

Will

