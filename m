Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010F8F46102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+mJ9hD8J80nxgzsvpp1jfsfgQI/06VZkUS90l41zm8=; b=f5NTPSV3uzmUKmwlhF0moHhR4X
	bAYSvlgLPmv1eb+eUsQNNjqSZXTCGN88YEyEJ/efxBVTigSRAI3ZiNDPw290xeAFRXFwMDTMHiNnR
	eaQ8+zdhlGPZymJokshtojAMQlx7tmwBcFjtW1Al5vEp4aladNnvMhHG2qGnEIIhlHuYOfGrJj/gp
	EzcuaIuyJxCYg62k2cTO/zRqxxw2FwOAoGIRzKHWXXfpHTpmSZJfYyR7VYRgB3lpXwtvu5EvQLnzu
	fkiI1vnzXr8Ahoz6zcJzoYPQYCwi5wk7/JPz9HfdU6i5U1tI0RfVeX4o/SDznDAZ8Ct5dlH/SN7kd
	yFw/4fJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ewS-0000000Gk5x-3a1a;
	Mon, 23 Mar 2026 13:03:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ewQ-0000000Gk4M-1gFd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF7E14BF;
	Mon, 23 Mar 2026 06:03:23 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CE7F3F885;
	Mon, 23 Mar 2026 06:03:27 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Fix bugs for realm guest plus BBML2_NOABORT
Date: Mon, 23 Mar 2026 13:03:12 +0000
Message-ID: <20260323130317.1737522-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_060334_506353_38B3E6C7 
X-CRM114-Status: UNSURE (   7.45  )
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

Thanks,
Ryan


Ryan Roberts (3):
  arm64: mm: Fix rodata=full block mapping support for realm guests
  arm64: mm: Handle invalid large leaf mappings correctly
  arm64: mm: Remove pmd_sect() and pud_sect()

 arch/arm64/include/asm/pgtable.h |  5 ---
 arch/arm64/mm/init.c             |  9 +++++-
 arch/arm64/mm/mmu.c              | 53 ++++++++++++++++++++++----------
 arch/arm64/mm/pageattr.c         | 50 +++++++++++++++++-------------
 4 files changed, 72 insertions(+), 45 deletions(-)

--
2.43.0


