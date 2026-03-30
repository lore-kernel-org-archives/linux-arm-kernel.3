Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868831061B13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xEYSmc3sOU8Enc3t4Ywyrmsyhh4dEr5GKqdQRw2bKKQ=; b=pmz3EMRr2KNXlUx//sg+ItEb0H
	Ypzx0NQ650i/joyZGqeXJYx/pvQINALnfiq6YNyoYBL9GYvUXPocMb7MJg4RSSNk2uNecOWQ7hEz8
	qjZob8MJshMRPDmwtfM1HPGXTZ4DgGcezO6BAYzn+0Te4fdv8ACz9AOwVYzO8ru4ukcKr+QLiF8Wx
	PIc8sYupuLdbt1r76Cgh0G0HPF/+yMveWa4+CyREZbVGaE5OxHC2Pvb9477Mx9SPDbQU5xCqum8Ej
	bfrwuezOWl0lFDfH0qNGIax5dIv4+TAqEwcdiSqlNQsb1GvtBlM39PN8FsX5MLbgz096YywsZT1qQ
	QTlqiknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FIp-0000000BdB7-3mMB;
	Mon, 30 Mar 2026 16:17:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FIn-0000000Bd9H-0nex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:17:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D7181D70;
	Mon, 30 Mar 2026 09:17:11 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA7643F7D8;
	Mon, 30 Mar 2026 09:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774887437; bh=q7eHVppponB+OVG/EaWlphb1LoMlAjHq9ZsfT/QF9m4=;
	h=From:To:Cc:Subject:Date:From;
	b=NPoD2YiJYAjG35yxvHP98ypAu7T24EjZdGiCU3YMRwg5fil+zCOHm6oNyKPBvQNGU
	 e7LePj6/lH0FybTE7GS0/ZilXb8Wg2oD4dzKjFUPzo+03DoAZ8WnrFPQfCS1GGKmge
	 cx8Wp8zzlynWCg37aY1PsuVysiY9SIBoyZLlfA+M=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Fix bugs for realm guest plus BBML2_NOABORT
Date: Mon, 30 Mar 2026 17:17:01 +0100
Message-ID: <20260330161705.3349825-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_091721_306190_867B069C 
X-CRM114-Status: UNSURE (   8.97  )
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

Hi All,

This fixes a couple of bugs in the "large block mappings for linear map when we
have BBML2_NOABORT" feature when used in conjunction with a CCA realm guest.
While investigating I found and fixed some more general issues too. See commit
logs for full explanations.

Applies on top of v7.0-rc4.

Changes since v1 [1]
====================

Patch 1:
  - Moved page_alloc_available declaration to asm/mmu.c (per Kevin)
  - Added PTE_PRESENT_VALID_KERNEL macro to hide VALID|NG confusion (per Kevin)
  - Improved logic in split_kernel_leaf_mapping() to avoid warning for
    DEBUG_PAGEALLOC (per Sashiko)
Patch 2:
  - Fixed transitional pgtables to handle present-invalid large leaves (per
    Sashiko)
  - Hardened split_pXd() for present-invalid leaves (per Sashiko)
Patch 3:
  - Converted pXd_leaf() to function to avoid multi-eval of READ_ONCE() (per
    Sashiko)

[1] https://lore.kernel.org/all/20260323130317.1737522-1-ryan.roberts@arm.com/

Thanks,
Ryan


Ryan Roberts (3):
  arm64: mm: Fix rodata=full block mapping support for realm guests
  arm64: mm: Handle invalid large leaf mappings correctly
  arm64: mm: Remove pmd_sect() and pud_sect()

 arch/arm64/include/asm/mmu.h          |  2 +
 arch/arm64/include/asm/pgtable-prot.h |  2 +
 arch/arm64/include/asm/pgtable.h      | 28 +++++++----
 arch/arm64/mm/init.c                  |  9 +++-
 arch/arm64/mm/mmu.c                   | 67 ++++++++++++++++++---------
 arch/arm64/mm/pageattr.c              | 50 +++++++++++---------
 arch/arm64/mm/trans_pgd.c             | 42 +++--------------
 7 files changed, 111 insertions(+), 89 deletions(-)

--
2.43.0


