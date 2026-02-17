Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7395EF99FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cEKF448dTTDUr7ED/7z2SbfDaMN+B5E3394XRsgzhOY=; b=BVftXDC4CRca/2+LjXaD37whAH
	3McdUVVLRE8eoW0yrBJLzYLtz0Do0QqcsNSUYRXcKxSBfyMMgne1eTh+p5CJnBeKrbZkw7PCm7WA6
	ObcQCtGWpgNlbvi+FVusbEk/HvwIJbvAErOYjTFUrgCKYO3bK1txAQqDSkbiJtLAOkebur6iq6+X6
	rp4sT/aiS0hPvzh4dADv9Lu0qF/pWmREXdh/JpqT8ziDyHrTrAFxtTHy0ZI0rAC0N+uA4Yb2traLC
	BqfVyB6liKp1AWY22bvYr/0g/VbmGYRG+laKQyxe811IMCAGrauxZIjFekTpmxt4EEjcNhcQ+G1qx
	07fbIsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLDh-00000008KCB-0klF;
	Tue, 17 Feb 2026 13:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLDe-00000008KB3-2Rkx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:34:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A5ED1477;
	Tue, 17 Feb 2026 05:34:16 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A12F93F632;
	Tue, 17 Feb 2026 05:34:21 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>
Subject: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map creation
Date: Tue, 17 Feb 2026 13:34:05 +0000
Message-ID: <20260217133411.2881311-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053426_666729_31ADEA77 
X-CRM114-Status: UNSURE (   6.48  )
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

This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
some speed ups to enable significantly faster booting on systems with a lot of
memory. The patches were originally posted at:

  https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/

... and were originally merged upstream in v6.10-rc1.

I'm requesting this be merged to stable on behalf of a partner who wants to get
the benefit of this series in Debian 12.

Thanks,
Ryan

Ryan Roberts (3):
  arm64: mm: Don't remap pgtables per-cont(pte|pmd) block
  arm64: mm: Batch dsb and isb when populating pgtables
  arm64: mm: Don't remap pgtables for allocate vs populate

 arch/arm64/include/asm/pgtable.h |  7 ++-
 arch/arm64/mm/mmu.c              | 92 ++++++++++++++++++--------------
 2 files changed, 57 insertions(+), 42 deletions(-)

--
2.43.0


