Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299131093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0ilgx0xyMp7X9gWaw2IrK0zdXLdb+KGTOoAmT+gWtU=; b=DcwmtQiDHy7LhRbQLbDbugUql0
	xJ6cgz2/RaVLw+i2zA1n/Lh48PfelJBXKsHJzpa0C9guIHNdjMqIpXyWccyp09H73NYeX8n2tU/CG
	v/AAdhzIXLlCPZt+rxcaWY7690ODurVw9uopOFIC1Iiy3iwfVDfMpg6Cfdpax90ZSv/3bwL6oqLiW
	ZzrfaWHp30jVREuCC7VO+4ZDjwMj96lUbrx0ziks62uKbWmJYlxibJmpQkeZGxnAoRTGOjy7f7TzP
	QVRet4adyXKUJjEjEHlbxPPdpWwE9GMARtTJu6Dw1C+etaquMozIc6MIMckwBI7YJy8zW8H8XPa1U
	KLSHWNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VCn-0000000CLPB-4AcG;
	Fri, 20 Mar 2026 08:27:41 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VCk-0000000CLOs-3i3E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:27:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l0ilgx0xyMp7X9gWaw2IrK0zdXLdb+KGTOoAmT+gWtU=;
	b=FojeOfqbqP4/nonn1s0YSltg4mW9Y6kdJGqrsHisoozUTqeZDSEQ98KH2Lb1z1meWcHG8mTVU
	SSlO2lKcIS5UCubrzaWvm7xcZj6p6bj+FaMG/cJWk7pQwABzmpdaWXZd8dLoQFfO5M7I1iiZHdo
	7isB74vdKlTx5IIxVn6iCLc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fcbCQ5jcHz1prLJ;
	Fri, 20 Mar 2026 16:22:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C7966404AD;
	Fri, 20 Mar 2026 16:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 16:27:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<kees@kernel.org>, <maz@kernel.org>, <ada.coupriediaz@arm.com>,
	<smostafa@google.com>, <leitao@debian.org>, <mrigendra.chaubey@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm64: traps: Add a macro to simplify the condition codes check
Date: Fri, 20 Mar 2026 16:28:46 +0800
Message-ID: <20260320082846.1235016-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_012739_607133_A79557DA 
X-CRM114-Status: UNSURE (   8.63  )
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

Add DEFINE_COND_CHECK macro to define the simple __check_* functions
to simplify the condition codes check.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/traps.c | 59 ++++++++++-----------------------------
 1 file changed, 15 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 914282016069..6216fe9e8e42 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -49,45 +49,21 @@
 #include <asm/system_misc.h>
 #include <asm/sysreg.h>
 
-static bool __kprobes __check_eq(unsigned long pstate)
-{
-	return (pstate & PSR_Z_BIT) != 0;
-}
-
-static bool __kprobes __check_ne(unsigned long pstate)
-{
-	return (pstate & PSR_Z_BIT) == 0;
-}
-
-static bool __kprobes __check_cs(unsigned long pstate)
-{
-	return (pstate & PSR_C_BIT) != 0;
-}
-
-static bool __kprobes __check_cc(unsigned long pstate)
-{
-	return (pstate & PSR_C_BIT) == 0;
-}
-
-static bool __kprobes __check_mi(unsigned long pstate)
-{
-	return (pstate & PSR_N_BIT) != 0;
-}
-
-static bool __kprobes __check_pl(unsigned long pstate)
-{
-	return (pstate & PSR_N_BIT) == 0;
-}
-
-static bool __kprobes __check_vs(unsigned long pstate)
-{
-	return (pstate & PSR_V_BIT) != 0;
-}
-
-static bool __kprobes __check_vc(unsigned long pstate)
-{
-	return (pstate & PSR_V_BIT) == 0;
-}
+#define DEFINE_COND_CHECK(name, flag, expected)			\
+static bool __kprobes __check_##name(unsigned long pstate)	\
+{								\
+	return ((pstate & (flag)) != 0) == (expected);		\
+}
+
+DEFINE_COND_CHECK(eq, PSR_Z_BIT, true)
+DEFINE_COND_CHECK(ne, PSR_Z_BIT, false)
+DEFINE_COND_CHECK(cs, PSR_C_BIT, true)
+DEFINE_COND_CHECK(cc, PSR_C_BIT, false)
+DEFINE_COND_CHECK(mi, PSR_N_BIT, true)
+DEFINE_COND_CHECK(pl, PSR_N_BIT, false)
+DEFINE_COND_CHECK(vs, PSR_V_BIT, true)
+DEFINE_COND_CHECK(vc, PSR_V_BIT, false)
+DEFINE_COND_CHECK(al, 0, false)		/* Always true */
 
 static bool __kprobes __check_hi(unsigned long pstate)
 {
@@ -131,11 +107,6 @@ static bool __kprobes __check_le(unsigned long pstate)
 	return (temp & PSR_N_BIT) != 0;
 }
 
-static bool __kprobes __check_al(unsigned long pstate)
-{
-	return true;
-}
-
 /*
  * Note that the ARMv8 ARM calls condition code 0b1111 "nv", but states that
  * it behaves identically to 0b1110 ("al").
-- 
2.34.1


