Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED70C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqC8dD60TdXEG8Xybc2Ogump1u1AvYcFMdC8gPtgS8o=; b=TXzK2ky/4bmjKnhrklTBTKoeXc
	KGr1bcRbsRiLvUtM1ijY6TbtkoNaqYwL4ABeufa39zXbovmFTSzbF6BIM7IiCRiAcJxNF4X2nNCFY
	IRpmZLxsQCLnTf2uMrDFXdEXofi44HkSSIaeuuf+N+7Lh3ZyqCXlE9w7VmtFzG89IdmNkgomKC2hI
	Y/8anwe9w+MBARhjhtDJgq6f29MNK/VYtoXiADStvhqe9UEDSOzgC9IiI2NSLn9XAZ3AGVovvZ5GR
	8dXDAn5Xz+2mwMBuLpHSPSLcOQ4uU1v75fR6CyRRn/EAUnNlh7WveutaF2j1Ld8Pk0FS5eKDSs9kK
	RckTnrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f1f-0000000ATTp-2aBW;
	Thu, 24 Sep 2026 08:41:55 +0000
Received: from out-36.mta0.migadu.com ([91.218.175.36] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f1c-0000000ATT7-1wqO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:41:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GMW73oM32XjlK00ZreHON07LcCH+HXuZENIE7xmRCOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239308; v=1; x=1790844108;
 b=r3JdL+JF0N8GGqeBg1gwCBVoj2h8RnmfVlFITYSGRa49+YDocVU2Xxu7ydAlQWOtoJ3G5a2I
 PnIN5VD5cEyeYRfmqkz0XQ2LxjWpyb+8z2N5SP/YSF3+NTQUqPPJZX9/gucptL7Djv1WJ0Gm491
 HdPHiPZvTlg4Aye0jgoDPcxo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id f39e36a1a49ad3fe;
	Thu, 24 Sep 2026 08:41:48 +0000
X-Mizu-Trace-ID: f39e36a1a49ad3fe
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260901085740.66283-1-kmehltretter@gmail.com>
Date: Thu, 24 Sep 2026 16:41:30 +0800
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_014152_744949_E2F56D2B 
X-CRM114-Status: GOOD (  12.90  )
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



> On Sep 1, 2026, at 16:57, Karl Mehltretter <kmehltretter@gmail.com> =
wrote:
>=20
> mmap(MAP_HUGETLB) on 32-bit Arm can return an address which is not
> aligned to the huge page size. In a QEMU virt guest, unmapping the VMA
> then hits the alignment check in __unmap_hugepage_range():
>=20
>  kernel BUG at mm/hugetlb.c:5213!
>  Internal error: Oops - BUG: 0 [#1] SMP ARM
>  PC is at __unmap_hugepage_range+0x540/0x584
>  LR is at __zap_vma_range+0x13a0/0x1410
>=20
> Commit 7bd3f1e1a9ae ("mm: make hugetlb mappings go through
> mm_get_unmapped_area_vmflags") made hugetlb mappings use the
> architecture's arch_get_unmapped_area(). The generic implementations
> handle hugetlb alignment, but the Arm implementations only account for
> the optional SHMLBA cache-colouring constraint. A 4 KiB-page kernel =
can
> therefore align the mapping to 4 KiB or 16 KiB instead of the required
> 2 MiB.
>=20
> Set the alignment mask from the file's hstate for hugetlb mappings in
> both Arm implementations. Huge-page alignment also satisfies the
> SHMLBA constraint.
>=20
> Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through =
mm_get_unmapped_area_vmflags")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Besides 32-bit Arm, the same regression appears to affect MIPS and
SuperH: both support HugeTLB and provide custom =
arch_get_unmapped_area*()
implementations that only enforce cache-colouring alignment, not the
hstate=E2=80=99s huge-page alignment.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


