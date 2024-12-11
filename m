Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=; b=ujNO4Oypi0uC0tTfCXGDOwxIZN
	/zbLxk3V0fpg1KnxhOM4bvxOFdIsTAuefVpFvuEle/gbl55ekFUXhGePK0Cz0U2sI3lhCAJaD7px0
	JXWDGSL3/0qP7NBosBKcxWIqcj+CIkOGE59tGrvvgyWGQbqo21jTVRpg6n1hIo2IGsCu8eAnRCbKs
	twlED3yOkzfsPYKkb+z1kuo+oVJjAueBLIOYbzd4YSRQo0BIsCisHAyJAfZQvrByXMQdisHUaJRai
	gvhzk4mVYY5HB7D0yeurEzZSdnoKBdWQ/8MtTNMkTY/7Nxib1L1zOv64oG1+T+F0e1WfZmeuo3v2w
	BQBj12Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXZ2-0000000Gdrx-3kC5;
	Thu, 12 Dec 2024 01:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW89-0000000GSh0-279X
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=; b=SomsQXzS/4dOxdjbLonzLRsU3f
	8D3fY44hbzp7wPexHZNLcRtIgvm5kXVwoXVuy5SUJmXXPlyAy9gyHr7TSLQB7cjCjBzgk4ZBKgCkP
	xUGdx65xN1ki9ugJdDIxmtxUVhw+8ZG6B5cSocbYjbZkgg7KATGxQtYhyv8I4ycYn9SP7eMek694l
	HCaKUi71JkVPb7V+TtN3zUo5K/kCcV0UAEfqDkOy2PsvJ8ZibdJae7vkkaU4YSBJQyjR40pvF2nUS
	Rh3hai0Gx7t2J8F5tzi7b2oBk6BLkDcdkZRoksO/B+ngFe9zz+3hjSK0DXNuESpGOa11eAFH9I7wN
	RSof1fGA==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW86-00000003w8k-0TWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7f712829f05so38159a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959708; x=1734564508; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=;
        b=gloDFQOIe55MT4ee1uhsJmSV91C2e2sfS55S5Qstpw/cpCYwZH5U9ghv4SrjsZoIsD
         9GZotNtFnZCzeS+zW/Q4aes9Irt/FTjADsfO1bSwnPQt3eb5q+fbrcsEaPqUr/TNgPCh
         TqxUq8RmTD+noRnTpsnztgHX42qt/IaOXHvjNVYx9Da/At6buqpSs8MusFdoYUN1rr2r
         VT6hpFrHJWtSQf5iYOwHljlX+WcGdoaNjWHg4gNApq0VW3wEmFAbj/4LSfVbn4c241Jc
         nolmhSzxQpyio0guFLXGBBq3uVBEuuZIMvM/nT1OfWQdphl6GhAzDu26WH91DrVTwvn+
         8DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959708; x=1734564508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=;
        b=WrJeAD1Up1EZk+U0o7OrJzCC7yQwAKdmLFnLfq9axHha9cSU77RXYtmdesm94ppSPt
         fniCzVK+RIIfefRuR7Amj56t7hOrWi1Ad2s1YNiya7gYuu/2/F4AkhmdKezx83ByCGow
         BOgrbmArMkeWWPzEYqI94YD1clrgQibXWbb8ITb2natzO1Y+FBOQZEoi1AVWNsZzQ6o4
         4BrIIAeT5dBDtX47vHhecYzf+giQkfbXBOtehZqDHztZV6Zk3ThhcbC1h3dRuxwy5Lvl
         aX5FjMmZgTBTCMSK9AhjYF5p7swEvSLz4wnLXrFvRgDcjZbwsC/7AZZS/zB4CQoVEa53
         Ziww==
X-Forwarded-Encrypted: i=1; AJvYcCWk+9H2c8zZlmzangEQlUBaMqWwJ+bYUgbQY1KdvE1S010SFzNDs1dINRvSTYsR+HQMvcLu+msxHcez+v8g4dRz@lists.infradead.org
X-Gm-Message-State: AOJu0YztnSxbIuXp6Z8QVFKC2IoRIxX3jtbz/nqleOYEteLps8jCyCNg
	7OdR1pAZaYo498x7Xq8GQace1wDJqnZ9LCq06RGzbhsM4/hXO9hQL2WrcajlSj2vQQNUU/dfgYc
	nRbDbzC6/GROOhUf5U4Hg8w==
X-Google-Smtp-Source: AGHT+IGlmctwmnr0LOvk4eyOoUS2Mz0NPFGCSegKhSqs8wGodxRb0W3o7XrsirlslhQ66CcLZRwSCG2H88EXSdEssw==
X-Received: from pgbdl12.prod.google.com ([2002:a05:6a02:d0c:b0:7fd:1eba:c2dd])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:150b:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1e1ceaabbb2mr1312325637.11.1733959708164;
 Wed, 11 Dec 2024 15:28:28 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:54 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232830_353800_5F170582 
X-CRM114-Status: GOOD (  18.83  )
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

Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP")
fallsback to PAGE_SIZE alignment instead of THP alignment
for anonymous mapping as long as a hint address is provided by the user
-- even if we weren't able to allocate the unmapped area at the hint
address in the end.

This was done to address the immediate regression in anonymous mappings
where the hint address were being ignored in some cases; due to commit
efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").

It was later pointed out that this issue also existed for file-backed
mappings from file systems that use thp_get_unmapped_area() for their
.get_unmapped_area() file operation.

The same fix was not applied for file-backed mappings since it would
mean any mmap requests that provide a hint address would be only
PAGE_SIZE-aligned regardless of whether allocation was successful at
the hint address or not.

Instead, use arch_mmap_hint() to first attempt allocation at the hint
address and fallback to THP alignment if there isn't sufficient VA space
to satisfy the allocation at the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/huge_memory.c | 17 ++++++++++-------
 mm/mmap.c        |  1 -
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2da5520bfe24..426761a30aff 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	loff_t off_align = round_up(off, size);
 	unsigned long len_pad, ret, off_sub;
 
+	/*
+	 * If allocation at the address hint succeeds; respect the hint and
+	 * don't try to align to THP boundary;
+	 *
+	 * Or if an the requested extent is invalid return the error immediately.
+	 */
+	addr = arch_mmap_hint(filp, addr, len, off, flags);
+	if (addr)
+		return addr;
+
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
@@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (IS_ERR_VALUE(ret))
 		return 0;
 
-	/*
-	 * Do not try to align to THP boundary if allocation at the address
-	 * hint succeeds.
-	 */
-	if (ret == addr)
-		return addr;
-
 	off_sub = (off - ret) & (size - 1);
 
 	if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
diff --git a/mm/mmap.c b/mm/mmap.c
index 76dd6acdf051..3286fdff26f2 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	if (get_area) {
 		addr = get_area(file, addr, len, pgoff, flags);
 	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
-		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
 		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-- 
2.47.0.338.g60cca15819-goog


