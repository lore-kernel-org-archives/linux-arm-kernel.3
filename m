Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D3C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TzgGWGKwNEPaYfM07kk+b3PR/Y1tRy3buhIrXIoPIM=; b=Cx0GT1ZwtCsdM3VUp3mMXIu2+K
	ek9+s0rTXSN+7OpxZsqp6dUcTpINxF5AIAjwBbz8bYrkxe3QhCO3ZiCMJ0SItiLK/vvuN9/Ft3bzx
	OLDfkjpUdF4t1qGFt65Vj78F1ci6QPl3DJrEI/CJdbiIAeuzwkEkNZTCI8krbjwedgxl+ppKFk3mJ
	6mq0R2tdwbbKwI801pMPFEcHyr7xwJXOF+IKp3kWAg9zFkdZv9KYDGPiuW3iyZ1M5NyEBmGYHe8i7
	1uFF+qBUU5CE+zDVEJBSiPGVno7FFLCFMAHgij/9uhg2XK1DiMap37TpqbiHNPFkDEp4EDVZqZqMu
	ASOMReLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlGL-0000000DPPu-481c;
	Thu, 23 Jul 2026 04:42:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlG8-0000000DPJG-2hSt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:42:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E8B176B;
	Wed, 22 Jul 2026 21:42:07 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12B1D3F86F;
	Wed, 22 Jul 2026 21:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784781731; bh=fs9+OZcrooTjx0Yu5/0nmmn6I3OroU0a77sVaUrcOEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TpMzS7CEZ1leE++1S96lAS5rJczqlqMT0M/Ms6AIOOuG2kIsYkpbr3pYrUuwkkx6l
	 6fs6FUspzaeybEnaA7Ue/I8bb8Nt51aN/5xVkzaAwKYuNnCX4Ek6pR21s1x4LlpjmM
	 rHVmRq5pf1xy6CwElvdXoTDjXEJzfmFFm142Qg4k=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v4 4/6] arm64: sysreg: Add BBM_3
Date: Thu, 23 Jul 2026 10:10:31 +0530
Message-ID: <20260723044034.2983651-5-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723044034.2983651-1-linu.cherian@arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214212_718771_C68D67E5 
X-CRM114-Status: UNSURE (   6.87  )
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

Add BBM_3 definition for ID_AA64MMFR2_EL1 register.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 7cb61aca3797..e070ada06196 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
 	0b0000	0
 	0b0001	1
 	0b0010	2
+	0b0011	3
 EndEnum
 UnsignedEnum	51:48	TTL
 	0b0000	NI
-- 
2.43.0


