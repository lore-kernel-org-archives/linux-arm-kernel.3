Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27180106FD7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 05:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s33UMciHTjXjznKdEMoLYJ0u/g2itc1f+GoECQwuXpg=; b=YgEZsumBH9LXfVgKdgaqs6j5Oa
	X4NtQqz5cyrHxjf6Yd1w73+8JD9GkvrVQWAVPQCWFcguW+gaNMxdzEXItppzoII69ssByV5+rWiIs
	o6tLaXne8wEe/ZsbS7f/Yr+a2+fckQ68v2UAB1Ztl+O7+nlKrUMf9vIgGhiUi8H2LxuMfd1lbcP6J
	kx2rynMYDmwtrH0AQod8C4c6ujKWcMWCXHqzDctf84oIK6XPmW4q1eSruZlxJmE0VdVi65f0PrKFO
	NwOIp6DZ6rNSeKTCzJOMiUH4/aTEswYn6yNdLf5NjNqJfEdx/er/DUEUOXqOZfG1WFNIvNRt7r88B
	X1WkKWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vEu-0000000GfnP-14cy;
	Fri, 13 Mar 2026 05:39:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vEr-0000000Gfme-19m9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 05:39:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1099165C;
	Thu, 12 Mar 2026 22:38:58 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 928B93F7BD;
	Thu, 12 Mar 2026 22:39:03 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: Clear VTCR_EL2 in __init_el2_stage2()
Date: Fri, 13 Mar 2026 05:38:57 +0000
Message-Id: <20260313053857.1277828-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_223909_359413_9429F3A0 
X-CRM114-Status: UNSURE (   6.84  )
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

Clear VTCR_EL2 along with VTTBR_EL2 register in __init_el2_stage2(), which
ensures that MMU stage-2 translation remain disabled. Although clearing out
VTTBR_EL2 probably should have been sufficient but adding VTCR_EL2 improves
overall safety.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/el2_setup.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 85f4c1615472..2c88033591bb 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -189,6 +189,7 @@
 /* Stage-2 translation */
 .macro __init_el2_stage2
 	msr	vttbr_el2, xzr
+	msr	vtcr_el2, xzr
 .endm
 
 /* GICv3 system register access */
-- 
2.30.2


