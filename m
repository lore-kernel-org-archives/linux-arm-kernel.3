Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C39BC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuK7MrqEgHOT8EJAWsNn0D1m+Ynm/cCoqkC8oHXW+wE=; b=DKztvzBfnvYO1zZdKETyFwuTOu
	6HjM9Z2yyboIRSAUMrQcNot7Gcpczr4/1Ezl6HcfEpyQer6HuWib/sV0iX9TAMG9VrozyrWTIAGAU
	Ay/CTtb7zQpgkE0JNFj8+BqivG5AkiyEcLEP/VNX4a6yogEeMQh59iPtY77S8T1VJZbRNN9IjLkHs
	/0BFkPNirzaa6k6MbcpXh9S6moljHtH5B8dv1imF+l25Zl+0yvxB+1s5+8Z5322PdHhZYr+Le8Vkj
	Hl7RowyuibjnzALwybpCnYuJo0Kv1+lJZ78qhexnjAYKsysmLSGdya93xCm2oM3e1oLELM6SbWOuK
	l9RcwyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCv-0000000EWCr-33R5;
	Wed, 02 Sep 2026 11:32:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jCt-0000000EWBW-1A1C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:32:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86D41682;
	Wed,  2 Sep 2026 04:32:37 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94A1C3F85F;
	Wed,  2 Sep 2026 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788348761; bh=nHgWksvphyJGNfsY7gau2yjC23W5OgGE2LHLUBpMccg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JHzy/ah66GWJPkV1JYzhz9I56rhgAWoqBnzHtd9AuAYNAv16FVAb9cS26p1tUWt5i
	 RlRnxe9h9zT60JcJYRJzAPhPp+wTBEVz4VYlEwIeBACC0J/AGX+c/H04auZ2FU09Ir
	 gTlj1r5UivyrZpskAMlhVgozw6gzu+5QvIHj28j4=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 1/2] arm64: mte-kasan: Use IS_ENABLED() rather than ALTERNATIVE() 'cfg' parameter
Date: Wed,  2 Sep 2026 12:32:31 +0100
Message-Id: <20260902113232.314831-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260902113232.314831-1-mark.rutland@arm.com>
References: <20260902113232.314831-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_043243_360735_FDAA1BBC 
X-CRM114-Status: GOOD (  13.20  )
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

The ALTERNATIVE() macro accepts an optional 'cfg' parameter, which
accepts a CONFIG_* symbol. Where a CONFIG_* symbol is provided, but is
not selected, the ALTERNATIVE() macro will expand to nothing.

It would be nicer overall to remove the 'cfg' parameter and to have an
explicit check for 'cfg' outside of the asm() block. This is clearer to
a reader, and permits the compiler to elide the asm() block when 'cfg'
is not selected.

In the mte-kasan code, replace the usage of the 'cfg' parameter with an
explicit IS_ENABLED() check.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/mte-kasan.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
index 3521392719189..de910f1c19e1b 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -53,14 +53,16 @@ static inline bool system_uses_mte_async_or_asymm_mode(void)
  */
 static inline void mte_disable_tco(void)
 {
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0),
-				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
+	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
+		return;
+	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0), ARM64_MTE));
 }
 
 static inline void mte_enable_tco(void)
 {
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1),
-				 ARM64_MTE, CONFIG_KASAN_HW_TAGS));
+	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
+		return;
+	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
 }
 
 /*
-- 
2.30.2


