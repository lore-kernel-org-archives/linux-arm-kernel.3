Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420A7107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPdzeDgO7p2Ex3q8WAh+g8zvKcfA3PAYlObdmzAMKhU=; b=0NjbYCc7MEDtGxoVcj/CHgkUC5
	EhTamYV9b8ra+u5/XywDyH8oyo35CKS6cmpnElyTEbXMcIQ/ZAWrAvtNnxuLpD3AqzrVJZtOLOqdy
	+bstDvuWczzzCSuv/P1OQW8h8m9InE8FXGyyk+X2PTO93fgcQZd/T9CK9ZmHnWSLPonhDOwqcT8PO
	/vT0DpngerFLlhgWi++GaSMIKfgDQPk2UWbGqruH+KL4h1w8JRp600mkOLK4lIJRDbmCUNCpx7TFg
	FlLW9zf89LvT9rxiAw0ePp79LaJ7uJ2//XQ6RIK5CQiOmk5Y5CkBu3mraRzPZ29eS0kkwOxkIF8Dn
	NW8pptJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18UW-0000000179h-3W4h;
	Fri, 13 Mar 2026 19:48:12 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18UT-00000001786-29gh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:48:11 +0000
Message-ID: <d3f60289-3ea1-43ce-9271-58c8b79bf7a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773431275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPdzeDgO7p2Ex3q8WAh+g8zvKcfA3PAYlObdmzAMKhU=;
	b=gQGLqbEDWJ7Lau535C9J/+AdIU5R9AQT9hlrQ/P5sl5PpuB6Ny6SsRf5h17NM8uO1B+GGK
	tKWI8OZvAwF9tGrhepb9MZFTYi216KhN5QFZDJ4eWxrTq8RaNRAJeDBFEVTwTqZooR3cQn
	5DU8VkkJGblgc2j5LiBsX1aoo2H2YdA=
Date: Fri, 13 Mar 2026 22:47:36 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] elf: align ET_DYN base to exec folio order for
 contpte mapping
Content-Language: en-GB
To: WANG Rui <r@hev.cc>
Cc: Liam.Howlett@oracle.com, ajd@linux.ibm.com, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 david@kernel.org, dev.jain@arm.com, hannes@cmpxchg.org, jack@suse.cz,
 kas@kernel.org, kees@kernel.org, kernel-team@meta.com,
 kevin.brodsky@arm.com, lance.yang@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, rmclure@linux.ibm.com,
 ryan.roberts@arm.com, shakeel.butt@linux.dev, viro@zeniv.linux.org.uk,
 will@kernel.org, willy@infradead.org, ziy@nvidia.com
References: <20260310145406.3073394-4-usama.arif@linux.dev>
 <20260313144213.95686-1-r@hev.cc>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260313144213.95686-1-r@hev.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_124809_863438_E54C3D16 
X-CRM114-Status: GOOD (  18.79  )
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



On 13/03/2026 17:42, WANG Rui wrote:
> Hi Usama,
> 

Hello!

> Glad to see you're pushing on this, I'm also following it. I first noticed this when rustc's perf regressed after a binutils upgrade. I'm trying to make ld.so to aware THP and adjust PT_LOAD alignment to increase the chances of shared libraries being mapped by THP [1]. As you're probably seen, I'm doing something similar in the kernel to improve it for executables [2].

For us it came about because we use 64K page size on ARM, and none of the
text sections were getting hugified (because PMD size is 512M). I went with
exec_folio_order() = cont-pte size (2M) for 16K and 64K as we can get both page
fault benefit (which might not be that important) and iTLB coverage (due to
cont-pte).
x86 already faults in at 2M (HPAGE_PMD_ORDER) due to force_thp_readahead path in
do_sync_mmap_readahead() so the memory pressure introduced in ARM won't be worse
than what already exists in x86.

> 
>> +			if (exec_folio_order())
>> +				alignment = max(alignment,
>> +					(unsigned long)PAGE_SIZE << exec_folio_order());
> 
> I’m curious, does it make sense to add some constraints here, like only increasing p_align when the segment length, virtual address, and file offset are all huge-aligned, as I did in my patch? This has come up several times in the glibc review, where increasing alignment was noted to reduce ASLR entropy.
> 

Yes I think this makes sense!

Although maybe we should check all segments with PT_LOAD. So maybe something
like below over this series?

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 2d2b3e9fd474f..a0e83b541a7d8 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1116,10 +1116,30 @@ static int load_elf_binary(struct linux_binprm *bprm)
                         * the hardware cannot coalesce PTEs (e.g. arm64
                         * contpte) even though the physical memory and
                         * file offset are correctly aligned.
+                        *
+                        * Only increase alignment when at least one
+                        * PT_LOAD segment is large enough to contain a
+                        * full folio and has its file offset and virtual
+                        * address folio-aligned. This avoids reducing
+                        * ASLR entropy for small binaries that cannot
+                        * benefit from contpte mapping.
                         */
-                       if (exec_folio_order())
-                               alignment = max(alignment,
-                                       (unsigned long)PAGE_SIZE << exec_folio_order());
+                       if (exec_folio_order()) {
+                               unsigned long folio_sz = PAGE_SIZE << exec_folio_order();
+
+                               for (i = 0; i < elf_ex->e_phnum; i++) {
+                                       if (elf_phdata[i].p_type != PT_LOAD)
+                                               continue;
+                                       if (elf_phdata[i].p_filesz < folio_sz)
+                                               continue;
+                                       if (!IS_ALIGNED(elf_phdata[i].p_vaddr, folio_sz))
+                                               continue;
+                                       if (!IS_ALIGNED(elf_phdata[i].p_offset, folio_sz))
+                                               continue;
+                                       alignment = max(alignment, folio_sz);
+                                       break;
+                               }
+                       }
 
                        /**
                         * DOC: PIE handling

> [1] https://sourceware.org/pipermail/libc-alpha/2026-March/175776.html
> [2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc
> 
> Thanks,
> Rui


