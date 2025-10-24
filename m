Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02334CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 04:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BV8N2Et4YliJxxHrF09I00EOc/5LweQ947C/vN8eEKs=; b=CA91N3sxmc+Q764RwntbTRq3pP
	4NnaBQUNTK/UF7qnNcnSV2yX2k3VvBy6kmfTQQfPi4MXlF7PiF394P6SWUA2ZV13YAiQBryTA1cbY
	7cIkv8kGUuyYYuH1FKRw5OZJb2Ktqzwzenaof4NY+CKTN7wtCFW6p/Pex1Ur8fjy6CNl72Dnh97dv
	0k48euDzoq33nlmGp02+ZAvLj7ta8wTM3RT5alwkSMH8hSvtfTpNhs9P2w6X6mN4KHXgVju614KMD
	OsPUiZ0DjSCZ5Ptb7yKKI/ejUN3jJszeKgfyzJ7smSBrrajaR0lP2h0d+6YSXbhGwZttz0y9WjOV8
	LuiafYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC90W-00000008C4u-0xbM;
	Fri, 24 Oct 2025 04:02:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC90S-00000008C3d-0vfh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 04:02:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E4641C25;
	Thu, 23 Oct 2025 21:02:13 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 859F53F59E;
	Thu, 23 Oct 2025 21:02:19 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ben.horgan@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH V2 0/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
Date: Fri, 24 Oct 2025 05:02:05 +0100
Message-Id: <20251024040207.137480-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_210224_327175_80D44850 
X-CRM114-Status: UNSURE (   6.53  )
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

Changes in V2:

- Added KVM changes required to accommodate TLBI_TTL_MASK split
- Updated the commit message

Changes in V1:

https://lore.kernel.org/all/20251021052022.2898275-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org> 
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev

Anshuman Khandual (2):
  arm64/mm: Drop redundant 'level' range trimming in __tlbi_level()
  arm64/mm: Add remaining TLBI_XXX_MASK macros

 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
 arch/arm64/kvm/nested.c           |  8 +++++---
 2 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.30.2


