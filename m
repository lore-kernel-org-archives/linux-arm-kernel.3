Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA769CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO3mYnSx+SJ79r8fxt6iy7F2Q1sQ4j5WzZ66ieR5tks=; b=NOOWman7h9KWkf1IpMJJHeGEzO
	KjbYEpO7RT1ZbWZ9R1XfQu4GLfwbmhuuMrSPoZWztkhOV/padS9OEl+jKQ40JH0C/mjIsPzSQftj8
	AK/kLtZ4MmFJ5KZPLJdDZYy8vxUxxloBlhaXPHnm5uxxeLv46Llu5CFqpiGs0+mFX2ZKqBRjt3Gav
	Q/TywejdfVnqnyhFHVo8YiAGqRqpHR6iuM2X32ErRTrh7WLpSNWyvWJBmSyV5dqWbbNvYEfbLTsvT
	iakMPqEGFs7CFyKdhsB/NyQ+JMv5OC+FzpMgwbku7xInGK0bnixUkxa/EYqXbx4QFmwTD+ssWW29M
	BuAPojOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElEs-00000005nAx-1ONI;
	Fri, 31 Oct 2025 09:16:06 +0000
Received: from wxsgout03.xfusion.com ([36.139.52.80] helo=wxsgout04.xfusion.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElEp-00000005n7u-0GEB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:16:05 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cyb0t30h5zB9Xpf;
	Fri, 31 Oct 2025 17:15:10 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Fri, 31 Oct 2025 17:15:47 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>,
	<yuxiating@xfusion.com>, shechenglong <shechenglong@xfusion.com>
Subject: [PATCH v3 1/2] cpu:Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY Kconfig option is disabled.
Date: Fri, 31 Oct 2025 17:15:05 +0800
Message-ID: <20251031091507.1896-2-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20251031091507.1896-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251031091507.1896-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03047.xfusion.com (10.32.141.63) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_021603_736775_A5F9C030 
X-CRM114-Status: UNSURE (   8.35  )
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

Following the pattern established with other Spectre mitigations,
do not prints a message when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY
Kconfig option is disabled.

Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: shechenglong <shechenglong@xfusion.com>
---
 arch/arm64/kernel/proton-pack.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index f9a32dfde006..d833b7c1bba8 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1042,8 +1042,6 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 
 	if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
 		/* No point mitigating Spectre-BHB alone. */
-	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
-		pr_info_once("spectre-bhb mitigation disabled by compile time option\n");
 	} else if (cpu_mitigations_off() || __nospectre_bhb) {
 		pr_info_once("spectre-bhb mitigation disabled by command line option\n");
 	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
-- 
2.33.0


