Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F691C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WrzVQvi/jgw/I6AEsUGXcvK1mN9COshrp0/mcUa7yDQ=; b=HcJbWTrxclPnsMuw4bra4rIO/j
	6OKIxBH4ugZxi9rNcCI6b6ssqXPiRGNuFVrZbImGBCBLoTYiqQbj8TMu1/vlxfgdq0FUEuW3A8+L+
	QqDJET/EleIWb1cfA37Gd2f/pi5KLfgEkcDJ0WGbhcNj2J9lBy8zjmuBhReahkjfcsTSaZK18Jvj1
	kxIXMiHlU7Wm+A2N4K9Ji9CjwbxNDQ1rxOrPMRhSfXaFBUDUqAlW0Ob0s33MLsgIp3G07KUnh4K85
	+ySPFSIUKnumOkHwdm80quiX+T5aylb7BanRDr7dYXDpbBT8839szhqz+KcbBjExZiNHt6ofcvSUP
	XvTahSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuFu-0000000AWwY-0TG0;
	Wed, 15 Jan 2025 03:39:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuEd-0000000AWZr-225A;
	Wed, 15 Jan 2025 03:38:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216634dd574so73128865ad.2;
        Tue, 14 Jan 2025 19:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912307; x=1737517107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrzVQvi/jgw/I6AEsUGXcvK1mN9COshrp0/mcUa7yDQ=;
        b=RIAnc2ZLqNub0jUNj0a4EDsLQ3D85RdtsYsHlLo0PQfnnlzMvkxEBHcuYKoctnn2hp
         TQP02bx4xBP5x1s9xByZpYw4s/G1uwBxWY957K5GKibDFtI97BZJSqvdhWs/aW2b4qBe
         TsGWb5hF04GCQ8S5um2gEop2reP27oh2KLu/ic804buiN3Edl2BPlLFiFQroaw+3vazq
         ZHsCFxG3hHTiUwpCpmvcNZX6w6y8HXunIHwqFObtVjXWf9OMh461sO3NQLu3pyyTHW5U
         AiNrwXF/ixuSRzCHkYnJtYD/0r9fHL7bVL4sRm7NiN+6CIA1ZaSWhKYkDIjvBOYN7gVw
         TPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912307; x=1737517107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrzVQvi/jgw/I6AEsUGXcvK1mN9COshrp0/mcUa7yDQ=;
        b=h2nny1hUIYoRTp6p75b6ZkDBZPSFDEnj+REO76BQaLZXPuMPYZoY//TpeglAt6hSIY
         yfZX/HycFy8UKkaN5fdPAEoXYGryiibMEsQyizhF84aJPkozznq5nKEPGe5molU2SiIy
         QyjLNdi8/AVKS1QxNj50kUEr0NEfHSph2hM/o86nGX0Xy7JthqTPIHjCNdl5GLerEf49
         8LJFzBIijbl1Sa0HiDAoUJSaTSXmI6PiMFCCy/BijK9Sem4N3GXWNxNXvPCzDbLcrHqy
         +aKCz/OdPa5stz/cZOD80T7TtoV8Lq1vO6mSUp+p1AZubpvcq14bA/AgAZ0u4jCdmgJU
         vh+g==
X-Forwarded-Encrypted: i=1; AJvYcCVf4pi5OnwyIOz55Hxrn7sr+Zmm7RDnwMZwk0Q1mX3t2e2Q0gD5b2hy+exr0zpcCKU9rm2wUEXi2lRud8DbwNVu@lists.infradead.org, AJvYcCW/IDKThv9mqp+3GL9sljSH6KL1zfZQ+FN1xVNb1dnKF3dBddk4T9TiPE3NY6Bv1Z5wzvP7BPlejx7qb10=@lists.infradead.org
X-Gm-Message-State: AOJu0YxK68Qbc7H/pp92DPe8P1C/YBZ4Jmradj4LvSmQUQkjepo8FlPv
	PDxDjOLr3eYQUsY46pHz5cd2didm3+UsXW1t5rhYsCnNcRLvapjk
X-Gm-Gg: ASbGncuitbc3rDZzw6J6PsU8aVmlAJYArAdVxX6f8NP69vBr5xap/ym/pQVrxCgKMFV
	xv85AQaHEuNYAkWhc/ej7FPNqZcolcb1nBmBI2KbqvFcpg4yWV72bj6IBykfeLUi4NlXdCU0/2V
	Lu1f9skSF1TIXbXWWcyZKJKqf5Ed71ahtPCeogdS7uMo3Hu48nPBpEytM/PEkVzBJd+jbC/gSLs
	IHuo8lbroMefvQJAX4e/E/vN4ktD6Wc6/8ou5IqxLeEoMed9LkGXXGU+EmVbS3jIpMtxhrYpfsw
	79K6gI0V
X-Google-Smtp-Source: AGHT+IG7nVHqDcezd3xmQAp4vBQiBwgib6FzP4BDYjRCpSnpFC+KQyJk4fxnyZSyDrckcOuiOGpO6Q==
X-Received: by 2002:a17:902:f705:b0:205:4721:19c with SMTP id d9443c01a7336-21a83fe48fdmr395479085ad.37.1736912306544;
        Tue, 14 Jan 2025 19:38:26 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:25 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: [PATCH v3 0/4] mm: batched unmap lazyfree large folios during reclamation
Date: Wed, 15 Jan 2025 16:38:04 +1300
Message-Id: <20250115033808.40641-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193827_520954_D2235693 
X-CRM114-Status: GOOD (  12.27  )
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

From: Barry Song <v-songbaohua@oppo.com>

Commit 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during
shrink_folio_list()") prevents the splitting of MADV_FREE'd THP in
madvise.c. 
However, those folios are still added to the deferred_split list in 
try_to_unmap_one() because we are unmapping PTEs and removing rmap
entries one by one.

Firstly, this has rendered the following counter somewhat confusing, 
/sys/kernel/mm/transparent_hugepage/hugepages-size/stats/split_deferred
The split_deferred counter was originally designed to track operations 
such as partial unmap or madvise of large folios. However, in practice, 
most split_deferred cases arise from memory reclamation of aligned 
lazyfree mTHPs as observed by Tangquan. This discrepancy has made
the split_deferred counter highly misleading.

Secondly, this approach is slow because it requires iterating through 
each PTE and removing the rmap one by one for a large folio. In fact, 
all PTEs of a pte-mapped large folio should be unmapped at once, and
the entire folio should be removed from the rmap as a whole.

Thirdly, it also increases the risk of a race condition where lazyfree
folios are incorrectly set back to swapbacked, as a speculative folio_get
may occur in the shrinker's callback.
deferred_split_scan() might call folio_try_get(folio) since we have
added the folio to split_deferred list while removing rmap for the
1st subpage, and while we are scanning the 2nd to nr_pages PTEs of
this folio in try_to_unmap_one(), the entire mTHP could be
transitioned back to swap-backed because the reference count is
incremented, which can make "ref_count == 1 + map_count" within
try_to_unmap_one() false.

   /*
    * The only page refs must be one from isolation
    * plus the rmap(s) (dropped by discard:).
    */
   if (ref_count == 1 + map_count &&
       (!folio_test_dirty(folio) ||
        ...
        (vma->vm_flags & VM_DROPPABLE))) {
           dec_mm_counter(mm, MM_ANONPAGES);
           goto discard;
   }

This patchset resolves the issue by marking only genuinely dirty folios 
as swap-backed, as suggested by David, and transitioning to batched 
unmapping of entire folios in try_to_unmap_one(). Consequently, the 
deferred_split count drops to zero, and memory reclamation performance 
improves significantly — reclaiming 64KiB lazyfree large folios is now 
2.5x faster(The specific data is embedded in the changelog of patch
3/4).

By the way, while the patchset is primarily aimed at PTE-mapped large 
folios, Baolin and Lance also found that try_to_unmap_one() handles 
lazyfree redirtied PMD-mapped large folios inefficiently — it splits 
the PMD into PTEs and iterates over them. This patchset removes the 
unnecessary splitting, enabling us to skip redirtied PMD-mapped large 
folios 3.5X faster during memory reclamation. (The specific data can 
be found in the changelog of patch 4/4).

-v3:
 * collect reviewed-by and acked-by of Baolin, David, Lance and Will.
   thanks!
 * refine pmd-mapped THP lazyfree code per Baolin and Lance.
 * refine tlbbatch deferred flushing range support code per David.

-v2:
 https://lore.kernel.org/linux-mm/20250113033901.68951-1-21cnbao@gmail.com/

 * describle backgrounds, problems more clearly in cover-letter per
   Lorenzo Stoakes;
 * also handle redirtied pmd-mapped large folios per Baolin and Lance;
 * handle some corner cases such as HWPOSION, pte_unused;
 * riscv and x86 build issues.

-v1:
 https://lore.kernel.org/linux-mm/20250106031711.82855-1-21cnbao@gmail.com/

Barry Song (4):
  mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
  mm: Support tlbbatch flush for a range of PTEs
  mm: Support batched unmap for lazyfree large folios during reclamation
  mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap

 arch/arm64/include/asm/tlbflush.h |  25 +++----
 arch/arm64/mm/contpte.c           |   2 +-
 arch/riscv/include/asm/tlbflush.h |   5 +-
 arch/riscv/mm/tlbflush.c          |   5 +-
 arch/x86/include/asm/tlbflush.h   |   5 +-
 mm/huge_memory.c                  |  24 +++++--
 mm/rmap.c                         | 115 ++++++++++++++++++++----------
 7 files changed, 117 insertions(+), 64 deletions(-)

-- 
2.39.3 (Apple Git-146)


