Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D1C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=; b=kHQeSGN6w5jxA/hUZlwb4qwICg
	HAuFrvsKcMfqQiHTRHqqa+fEQBhRtK7NL8f7KFVb0WyNtjNQVej5grHzYYy8STAzdUDd6pMnsb1s3
	+wCXvfSQLNeCtN/nNZ4tGKRR4P5t62aYAQ0TCA29aLZgF7MGe4N+KCV4Dy3nbIwV/CmOxQLgCnmQa
	lAYHAqQQX1f6hYERBkoB7W/aQVElifbZRk9fKE4Dncb1F3P6bqEzMgSZXvhBB2pNQfh03RVoKzLAO
	QAGO9T6nFM2xTWxrE4cCyQv7vN0vBdx6UGfeTJsjnhcvqQtroyqvlbFkOyeTJ1u/DhG+1JG8Kh1kR
	5yLqNb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7q-00000004kJ0-2Vt8;
	Tue, 22 Sep 2026 08:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7n-00000004kDT-2Jn0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=; b=Sr/hXNVPwxM2oFv6pmCbl95Ps9
	y7mqtIjQc0LqkIQDLNl+4YCPVx17pjYpXKkytSm99gyophMl6OZr9pdD+gMCghe7ZmnRJKGvdbFVd
	eo7MBv4AiheBbJj5cnT7RkIPt8/cYxIIC27rKr16KAVKp5VeiD5qC97hg0tXpXYQzrq+eaMC0Vg9B
	ninjrKZ+KJ4KiBt2pG8gfCuO/J+Ih7QNIZXWYph4PMZNoULwvdNTN/lJbqqC80JcV85XDBMJF2msY
	Se27mmu25lW65gqa66TqdYJYLYlXCZpDjJ9txLi96BsSX888V8qEMZkzDVEGmVf2sVEEs0eR0eWsf
	Wd1RRubw==;
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w7i-0000000DHuB-1bpg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:45:14 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39569e136f9so3160273a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066708; x=1790671508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=DmDSfa0QwGpubNSybh/kTABHLrTXuKNAhxPMvMDa09NgAD2ZB39MdRzV1LCbQOdhj1
         E5Lg9tBDokPDWIgd7mX9ffZsR3Ovczd2iBVH5nnjkBTg7XXpwoSyBWcx51CeDbRQzrFo
         AZbiDU8UJDpFZRwgQN7+SYsOuONQxIR/RSHDs2Gc4s1VHeCoGhF+IJacYdn9fMT6GdQQ
         sVSLp9W/rDOGj7uwawKyv8rtstcZe8pfToUh023p1Yv+pIPW18QjoqLh/+j9YyQ+Jyr/
         59Z6fUTI7eKSaJSrW7eazs5MwCNSgIOH+Wgld5ATAxg+JGzC4XRoMYxhLIPLC8xHdztL
         2pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066708; x=1790671508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=s26V8NgLdMXb/pCGxMSX0zmFHlWmUupwMV2gIppeOUszRv+40VF7Pp6JAm7g1mJ7PW
         jUZfmwpgZ9nF69rAZQe8CoZuF//j72gAVyn1R31/XfLmIYgrq18q7qpObLc6pBg7pewF
         mQDTClfWqiX4vuV1kqDogEkngdVMEd5ALd4paBkoSvEPNyDf5bRkh2O/QvgHnAi9kSfG
         MSoGWt0SSIAkVad0mptcOTxj/vfWOn0D/tf0+t6Cj9u751PkLwR/Tuq+LeEveIsAxi2S
         UKXytdFPhqK9Nr5iAxSLLMo450kpIQ/pNamE8So1WWPY7o0MxG3JKdv6UzF3r58iL1Mi
         xbSA==
X-Forwarded-Encrypted: i=1; AKwUvBw01izyigBhwuUjuh7d2bSTAFXs1Tv47lm01Ta6MGthiyRrd6IRWmrXRsYCRfTuRc0BXw4HRQz2xPd05vC3AkMC@lists.infradead.org
X-Gm-Message-State: AFuF++lT9YZFQP70tTzfeehWuyQFUI+xFp7n6KuVZ8afjNJjTopxMyYt
	cbluM+rYHvQszXB0wZgKZDANjKUKyhdpjgDg81quLWEhennpUEVQdVdP
X-Gm-Gg: AYBFou30I1cymJJM8V/lAwhQEtBz4ZJ9FC3MA2qOKwKdKQbiI5+B8g2EhR8/nPFzGMk
	J66NGmJgI+d/b9UMj9k2EdjQX5Me9HmWcigjT3+6QUz+GE60Aw2AlWrEw3OD0gJs5BmYJhfP52p
	3lH40j4TbVgQsRBK+wCWsHsJslRUb6nYoDVkNEiYrCZh5VIuUF9pYIV2VhaEQolNOTRs0eWhjm2
	W/FPr7AhGHzQ3EkKT4CXSW2p8YCL2heasNYSLJsPTRZeS8d0YOPfB+HTXojwgW4kpyg04XGRvOJ
	/MAcKhIktOPUkkNKZbmRupIYEhFuiA9TJOxnBQav1K8T7+pIWzRaWWH+gKLNiIxf6xq7pqImVD/
	RlT5DKTehqoggAHGE6SNlGjBlsQjV654dRnogTieIsUoTU4MkikK/gsDyv0eq/gnLVQAZKFmFE9
	UnwZ68/wz7+wTpb6EvNvfXw5C14hNqSvYkRY3OcKBm5OiftSjYf0iQ6L9uKt7p6OFrcAmvKWxHx
	ykzHLpiq+dLhZPEYOq8+g==
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr486642a91.19.1790066708546;
        Tue, 22 Sep 2026 01:45:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:45:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Tue, 22 Sep 2026 16:42:56 +0800
Message-ID: <20260922084256.1515554-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094510_752706_E4896322 
X-CRM114-Status: GOOD (  11.32  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c7acb2e449df..fdfeee5afa1a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0


