Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2517CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZqHJxMj9cZZ6xGbdiah9c7VOBxKeP9sXbxqvcW+iWvc=; b=fUeAE5cerVzS+HnE3hB3BqRIZ6
	6NgfjMKfMAlSnUEPNS2PCQpYYtnNyYHkywy9p/URDuoR04+UiG9hdlM27AmZglv7qUu9iCq2jZq3y
	8pB14On5wuUKlzqv3cIxpDkln2B2uRmXLfTikiEuWp8Bt3UOHPnlu7X9Nbb5Jj5LM5vZbEtUkPqCm
	XYtLZBKaXftygF3jw1y9gzde5/VB53YNNe30E8bHiuEysHV9Ll7NXjtG7vH3xD+HBcFGWH+iKylNo
	1Udh6IiMMMWrnuxZx/ybz56ClbURetPq+dRavQx8+GoVWOfyKKy3P+lrZ4BEmbHwkm487KEFn+TwI
	XK++DrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IOh-0000000B4sw-1kTe;
	Tue, 01 Sep 2026 06:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IOd-0000000B4rw-4BfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 06:55:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE94D1AED;
	Mon, 31 Aug 2026 23:54:55 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0D243F85F;
	Mon, 31 Aug 2026 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788245699; bh=ce/DLlpHBRa0sOyR5fJVD2nnBUjY9hH50UmSGmi9zDo=;
	h=From:To:Cc:Subject:Date:From;
	b=iVCF8hbH09QwEoLLCy5nDqwnQnUTRnYnxct0R9KGT2fNm28OZNlKPL5y/ZVYyLarR
	 G97VWOjRF0iMyiyBQyL+rUoh+K5lW9l0oQHRuBhT9ntBgfqe+6OndnwbdmNSBBFsWo
	 ltBmtg/ObqlFYO+SYLvq4upKKiNCWbiCa+XhNDso=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/2] arm64/mm: Standardize printing for pgtable entries
Date: Tue,  1 Sep 2026 12:24:52 +0530
Message-ID: <20260901065454.1906343-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_235504_161744_792B9F3E 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Standardize printing for pgtable entries using recently introduced generic
helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
bits entries when added later.

But first move __check_safe_pte_update() outside <asm/pgtable.h> to avoid
a cyclic dependency while accessing these afore mentioned core MM helpers
defined in <linux/pgtable.h>. This replaces the original page table entry
print standardisation proposal which was earlier part of the D128 series.

https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/

This series applies on v7.3-rc1 but after the following.

https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  arm64/mm: Move __check_safe_pte_update()
  arm64/mm: Standardize printing for pgtable entries

 arch/arm64/include/asm/pgtable.h | 47 +-----------------------------
 arch/arm64/mm/fault.c            | 20 +++++++++----
 arch/arm64/mm/mmu.c              | 49 ++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 51 deletions(-)

-- 
2.43.0


