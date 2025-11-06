Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0AACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1WpIvzlwynLDLUWC7hRV885yExVQBsVKxTK67wGPlOI=; b=EDXYM6mB+p7jxaRwjPqYArFsIi
	h2EPim8sWf+D25AgfY/+VcAy17+GfdcwpjqJemKjHNZcNkIsSUpdxxXIBIojRS+kpo0j5yXFMWBW9
	JjRr1FUZMLOp4nSXO7l9YLdu14pr5bKMKUJPb/enHFUkkOYgmcP3nBrOc1+Dsvts24GAslI0GCJS7
	498hIioysk0k6CleUMHLYzdow5O5tiCIeoYn3d9NHOPKwY8rlrs92IvgIC0TOrgl4WEwarNhBsOG4
	DN2/CulJUselFdYoGY+YwqeBsd7dE13+Mq5esR0mtlgDC5XI/zyTg3NpjniLoc45Y8tvj3z+AFNfx
	3ZRRlkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yi-0000000FslR-102m;
	Thu, 06 Nov 2025 16:10:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Yf-0000000Fsjs-3PKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5E2F15A1;
	Thu,  6 Nov 2025 08:09:47 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35BA33F66E;
	Thu,  6 Nov 2025 08:09:54 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	yang@os.amperecomputing.com,
	david@redhat.com,
	ardb@kernel.org,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Don't sleep in split_kernel_leaf_mapping() when in atomic context
Date: Thu,  6 Nov 2025 16:09:40 +0000
Message-ID: <20251106160945.3182799-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080957_890934_603B6B26 
X-CRM114-Status: UNSURE (   7.55  )
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

Hi Will,

This is v2 of the fix for split_kernel_leaf_mapping(). I've expanded it into 3
patches based on feedback from v1 [1].

Once happy with the content, patch 1 is needed urgently for next -rc to fix
regression since 6.18-rc1. The other patches could wait until 6.19, but I'd
prefer they all go together into 6.18.

Changes since v1 [1]
====================

Patch 1: The fix
  - Removed arch_kfence_init_pool() declaration for !KFENCE case (per Will)
  - Removed lazy mode mmu optimization (now separate patch) (per Will)
  - Simplified arch_kfence_init_pool() return expression (per Will)
  - Added comment about not needing tlbi
  - Generalized comment softirq -> atomic (per Yang Shi)
Patch 2: lazy mode mmu optimization (per Will)
Patch 3: force_pte_mapping() tidy ups (per David)

[1] https://lore.kernel.org/linux-arm-kernel/20251103125738.3073566-1-ryan.roberts@arm.com/

Thanks,
Ryan


Ryan Roberts (3):
  arm64: mm: Don't sleep in split_kernel_leaf_mapping() when in atomic
    context
  arm64: mm: Optimize range_split_to_ptes()
  arm64: mm: Tidy up force_pte_mapping()

 arch/arm64/include/asm/kfence.h |   3 +-
 arch/arm64/mm/mmu.c             | 111 +++++++++++++++++++++++---------
 2 files changed, 81 insertions(+), 33 deletions(-)

--
2.43.0


