Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE63AC982F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=; b=X0DAQmNk7EtOurpotYyrhfMlmw
	t2VJQP8fFFkDrg6h/kiDpifxZHgAwwQddx4uYNqYAdb8JbpmCR1layqC287OwnoinZ0xltSy1FQMJ
	uXG2xqSPd5UU1SeVcAdmhjl36jJ2SqChw/CW1A3vqAYKQDoBNrK5oIR82bmDrcuNQka65jGSFutQY
	VMGsOgr7+Lfxd6+nJKfjbq32Ae51msq/EWh1v/pRZ0CsY3qrFHWsT4u+YF9EFRb7qBDnXHJ//LSQN
	xHjDepIFMKzMPPdTyaXVWq19uWkPIdCe654TV9QvNGRXZdvWbNX1ZGklZz1s1ruMTDFtxa9AOqdCi
	xPfscXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blp-00000001oJ4-1gso;
	Mon, 21 Sep 2026 11:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blf-00000001oGZ-3QNL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=; b=qk+WSwY2lT66e/7KeCBzHUa5Nv
	niluI6xiE6dzx/H/H9KF6HVa3y+WWFiiH9MUJ+sq/Dl+d19uoHVjsZ0JrMOhew6OIzsb/6dEC18eO
	W+ckDM5dB47NLalP6J0OhAPBa6Pm/P6vQ6kHJieShddyryc81s8BHdp1VDL1UmAk/yO3vY8N97Dwz
	/TVX2AqlRWPeBHkUv+N8NzL1ASgUYDCBh/S0ag5UraUB78MY+yDOEXkjq83guCaU5VIeGbz0XtVKl
	Xe8pVVvY+ytOEUGDC70njqw0PRTAmOwMnHU90JF8yMeIaZqTp6zD5/13H6rwqYAorrCnpfySo9o8D
	CPkTJzBg==;
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8blc-0000000CA0j-3OjC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:02 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6aa1c4f3001so3829125a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988459; x=1790593259; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=PGSr4Nmi/YdbGWNqmA+qKyKL2F54r7plyMCvGFahJsqgT0jXc4CQ/u883Vk3r8xc2Y
         vK9TNgN25X1SDrFTCVez25LiYC+bbbTxswWReTE244pe3LOJjnjnzymnkWm2w3bvjF8e
         2b4nnXbQpNX5mS6/YD+PI4aWf9bjLmIbQ4kzVhmBNZVJLO7zgdJd7jDwI0hF0RuXpN/I
         wa8dBM0U8/oGLPmBdOB5ilegVN39iRIfxDk5VB32o//3IscL6ZNET5yFlJTMBmRnCZfA
         3LMFTCDsQb/8xBqDkQe7VJJt4SsHy7LYrneJjT88w8s8AU9rtmUBn7li5LcpyB4xd/1s
         BLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988459; x=1790593259;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U06rcgIn0LVt5Do84ZIYuayP7YCGGpRPbIbmdcyZosY=;
        b=ohOTVO+jKwX2bHMIsvo0vDLzGMateLp1yc8yECkpBO5oO9NF3s6X24X9/vhV83VprD
         PUHnnoesFKjwv2T6vy6kB2B1VMEP10Cws8N7oajJ5B7YhrsrAZeh/1224v7Bne4H0vGK
         bXX/tY4TlKh7ebs2b/QYkHAQhlkrcQ6t0GAU3nif0BMChEersQWzh5jHH8Ben23hvjM2
         2yhYYToijDTIuaQOruLP9bGiNRHgqMIPE92TvFj4fOEKfVh5R90MlqyVizdoTNMMa9Jk
         yrk6J3KDw/JBbDECyQqG/rvHUrqdFtdRpo114MxHB9rrVRbGw1JNoGxLCCsMiOT0l+ZQ
         /aNA==
X-Forwarded-Encrypted: i=1; AKwUvBzAO2W6vI5z8fqGFxcPLyudPGjEwPpT77NifTZ03aPs3XGfcUi9ty/+szQJV2JQH2ToLyQhqWM8hOPxFQI3jEif@lists.infradead.org
X-Gm-Message-State: AFuF++nLvJIXb8QNfGyO5475bmErQ4wD1WIbBk/mGlZEN/3XNNGbhi6V
	r3X5OTel7KJaYAFA5qm1KVWZPiVXCRqOi2ptkmErrKKjGlpx04LCwuml/ItX/us5x1czJ6un92o
	8NKOpIt8cypReD0aMRG17Zg==
X-Received: from edea12.prod.google.com ([2002:a05:6402:a18c:b0:6a6:1a9:f70f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23d5:b0:6a5:f814:2278 with SMTP id 4fb4d7f45d1cf-6aa577f5a1dmr7324139a12.2.1789988458556;
 Mon, 21 Sep 2026 04:00:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:44 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-3-vdonnefort@google.com>
Subject: [PATCH v2 2/8] arm64: Introduce can_set_direct_map_range()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120101_074120_571CF037 
X-CRM114-Status: GOOD (  13.07  )
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

For systems where can_set_direct_map() is false, it is still possible
that a subregion of the direct map can be modified if it is mapped at
the last-level. Add an implementation for can_set_direct_map_range(). It
falls back to a page table walk to verify the mapping level if
can_set_direct_map() is false.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  3 ++
 arch/arm64/mm/pageattr.c            | 50 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..80bb94a340fd 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -9,6 +9,9 @@
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool can_set_direct_map_range(struct page *page, unsigned long numpages);
+#define can_set_direct_map_range can_set_direct_map_range
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 132938b32eb1..5fcdb292905f 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -102,6 +102,56 @@ bool can_set_direct_map(void)
 		arm64_kfence_can_set_direct_map() || is_realm_world();
 }
 
+static int can_set_direct_map_pud_entry(pud_t *pud, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pud_leaf(pudp_get(pud)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pmd_entry(pmd_t *pmd, unsigned long addr,
+					unsigned long next, struct mm_walk *walk)
+{
+	if (pmd_leaf(pmdp_get(pmd)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int can_set_direct_map_pte_hole(unsigned long addr, unsigned long next,
+				       int depth, struct mm_walk *walk)
+{
+	return -EINVAL;
+}
+
+static const struct mm_walk_ops can_set_direct_map_ops = {
+	.pud_entry	= can_set_direct_map_pud_entry,
+	.pmd_entry	= can_set_direct_map_pmd_entry,
+	.pte_hole	= can_set_direct_map_pte_hole,
+};
+
+bool can_set_direct_map_range(struct page *page, unsigned long numpages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned long end = addr + numpages * PAGE_SIZE;
+
+	if (can_set_direct_map())
+		return true;
+
+	if (!numpages)
+		return false;
+
+	/*
+	 * If !can_set_direct_map() then no one can split blocks and it is safe
+	 * to walk the page-table lockless.
+	 */
+	return !walk_kernel_page_table_range_lockless(addr, end,
+						      &can_set_direct_map_ops,
+						      NULL, NULL);
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog


