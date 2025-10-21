Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C59CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNu5c3X0GiyvRjwhi0/pyNKurEWq06LVvkCnTLh8HOA=; b=TcR0kA77rydIzh8LRICCCQgCLR
	am9CmEbgoStw37QMyrgIdbo3Iz6GogCxmTCcbZgNyFMIT2paOBoeflKNw0KJcfHloOEPe4qm2tnT2
	YtjnYPfqm2Ef7WIg94bFaY6cDwE1xLOJcvHZfzj5Rjk7ViSrj9+HXKlemf4P5Im6dSG+VDfo1q47b
	3d+AOT6YbZnUfhMR9dwoYK6vW7bw3/Rv4vtGHWEk1j8571Vj5cE+0x/K0dZhalkx1RL7WlERrVYMe
	yVueRho2I0Bd80x77neCK6Pqe6h02AMTzRXpjbPHx5VM8VojQ3Apf8FZJMI4IsmNwQAYQGPtVv+Mp
	UDwdEOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nV-0000000Fq8P-1kZi;
	Tue, 21 Oct 2025 05:20:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nT-0000000Fq7Q-02u0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 05:20:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 543701063;
	Mon, 20 Oct 2025 22:20:25 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 228103F59E;
	Mon, 20 Oct 2025 22:20:31 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
Date: Tue, 21 Oct 2025 06:20:20 +0100
Message-Id: <20251021052022.2898275-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_222035_115036_9669EC26 
X-CRM114-Status: UNSURE (   5.75  )
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

Add remaining TLBI_XXX_MASK macros. But before that drop one redundant
'level' trimming operation in __tlbi_level().

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/mm: Drop redundant 'level' range trimming in __tlbi_level()
  arm64/mm: Add remaining TLBI_XXX_MASK macros

 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.30.2


