Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6AEC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBxwGj2qoq3nE2+2BM4cdKBQqetOhsST74sQOmcQpMs=; b=s+0Y641sO2sudLEEYKnFNaCaC9
	l70WpATCnlPbpUs5+wtO39orTB/NhaPu0HPk6NRlI1D9PiWXGlt+tep4fBSBLj8nuwUbSWLcGQuzO
	vz/NDqsa6VE8piLDuW7Xv4M13Fv7El9/MhlI9tetVOJieuvaTzZIRXYEyS177FAeaaL1UmiZLbroL
	fU2SmYZKEagQ7TogVFcWDiPG2LFFHTYuriV/5Ao4rAJxaRUlMOHBEZOd9pv9y4dWoghJiEROcEAH6
	j6gTvhrk0oANbYJ6oQREnf65F97Zckqh4ZHMesHHUDvRN60vIGeAu8qsuSubXJwHnK7dkPcdyKKeZ
	eO8lCsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKo-00000003OK4-1vVH;
	Mon, 27 Jul 2026 16:37:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJ4-00000003N2l-1Gkp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4886E175A;
	Mon, 27 Jul 2026 09:35:52 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74AD83F86F;
	Mon, 27 Jul 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170156; bh=EfUVcSyOKDnYxd3FQDnyK9CCCRgRoekSJbWvpzGeXOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igL06WPCfzUii2W+VfpSxFi4kTMbooNhLfQaaJDwxNSWAF9OB1PHhUHayy2YSWTzj
	 drij8M4xv9K8igtjTPP9FGqEk1Wq3bO8FRWQW5q8RrFgCDwAqBSOPXRxJfxiXxPFwl
	 4uPX6LHkcrkM+KowcvgInXG9idWos0/1iL1JeaI8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 29/45] arm64: ptrace: Add PSR_ALLINT_BIT
Date: Mon, 27 Jul 2026 17:34:37 +0100
Message-Id: <20260727163453.7969-30-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093558_461825_FF4614C3 
X-CRM114-Status: GOOD (  10.99  )
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

When FEAT_NMI is implemented, ALLINT is part of PSTATE and will be saved
to SPSR on exception entry.
As it can mask interrupts, depending on configuration, we will need to
check its value in interruted tasks, so add the corresponding bit
to ptrace.h.

Given its impact on interrupt and NMI masking, use it to update
`print_pstate()` so that it displays ALLINT state.
Display it after DAIF so that interrupt masking fields are together.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/uapi/asm/ptrace.h | 1 +
 arch/arm64/kernel/process.c          | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 6fed93fb2536..99352dd823cc 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -48,6 +48,7 @@
 #define PSR_D_BIT	0x00000200
 #define PSR_BTYPE_MASK	0x00000c00
 #define PSR_SSBS_BIT	0x00001000
+#define PSR_ALLINT_BIT	0x00002000
 #define PSR_PAN_BIT	0x00400000
 #define PSR_UAO_BIT	0x00800000
 #define PSR_DIT_BIT	0x01000000
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 0fd09136d398..c77d1e2b1b3a 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -183,7 +183,7 @@ static void print_pstate(struct pt_regs *regs)
 		const char *btype_str = btypes[(pstate & PSR_BTYPE_MASK) >>
 					       PSR_BTYPE_SHIFT];
 
-		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
+		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cALLINT %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
 			pstate,
 			pstate & PSR_N_BIT ? 'N' : 'n',
 			pstate & PSR_Z_BIT ? 'Z' : 'z',
@@ -193,6 +193,7 @@ static void print_pstate(struct pt_regs *regs)
 			pstate & PSR_A_BIT ? 'A' : 'a',
 			pstate & PSR_I_BIT ? 'I' : 'i',
 			pstate & PSR_F_BIT ? 'F' : 'f',
+			pstate & PSR_ALLINT_BIT ? '+' : '-',
 			pstate & PSR_PAN_BIT ? '+' : '-',
 			pstate & PSR_UAO_BIT ? '+' : '-',
 			pstate & PSR_TCO_BIT ? '+' : '-',
-- 
2.34.1


