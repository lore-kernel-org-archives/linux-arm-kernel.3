Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDDAC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njU/EGEZwsG4sk7gOsh+JddZOCrZlHitUtGR/n1fytM=; b=S6smLMvROkS0MmdWrwybG1Ua5R
	kqx3hcn5ntfe0BJRW84wdEagqiTXcJKDne3om32n6lucLezuzIkyAnA4dQtukSmtf2orB6ZxKaMVu
	/Xl2GV/ssrVgOXT2C1UnUDhYgqsx+m0ffeNFahuazoyFoo1jTVbxx8fRCqhBgjGHtR1ILOAwUUR6X
	9hhO8Pf1SuBmODrMYm4319t+pq28X3FZbqv0OK2MA5znlVb6BFl9omM30s60XgS8oDYH3Y3ufj2US
	m4LlDTosnVPWH87hHXEyvNpJhNj3nIbbmCN0g+9jyIKUB9bpTqUQlaLPPLR1bbBkL1qrTeeNcF5BF
	5s+cPttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf7-00000002Mfr-2egD;
	Thu, 09 Jul 2026 12:15:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneM-00000002LDA-3T8J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E7B6339;
	Thu,  9 Jul 2026 05:14:38 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62E7F3F66F;
	Thu,  9 Jul 2026 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599282; bh=Wsvo37nJtSkUQGP3LZjH/uJ2k+iGvGV6X3zlD3QbDQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0CX51w42wIENLiDRSzoF8uvcfNxeFvToxOwJY/q5HLM4OA/af6bQvPmKxzAos3Zr
	 YJxRzPREAUSGqr+4XBZU+GAD/plb6BwJ8+U064FVb/TdL7KFubrfyjl04ElmrsZfnU
	 +cJdglxY991wibTesHJxmtLU7ZzzIha59FHg1caM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 33/36] arm64/efi: Add ALLINT to IRQ flags checks
Date: Thu,  9 Jul 2026 13:13:30 +0100
Message-Id: <20260709121333.23507-34-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051442_939060_A2F4742C 
X-CRM114-Status: UNSURE (   8.36  )
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

EFI is not expected to modify PSTATE.ALLINT, so check that it remains
unchanged across EFI runtime calls.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/efi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index 479741d52c90..ea8403c7bdaf 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -78,6 +78,10 @@ do {															\
 		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
 				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
 				   caller ?: __builtin_return_address(0));						\
+	} else if (system_uses_nmi()) {											\
+		pr_err_ratelimited(FW_BUG "DAIF+ALLINT corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
+				   __expected.daif, __expected.allint, __actual.daif, __actual.allint,			\
+				   caller ?: __builtin_return_address(0));						\
 	} else {													\
 		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
 				   __expected.daif, __actual.daif,							\
-- 
2.34.1


