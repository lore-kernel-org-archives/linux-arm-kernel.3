Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E35C88E71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7dqTT0B3B5gnJKuGYlMP8rzUTZdzZzw7qywi8WSCdE=; b=bAyjMtFR5xtEK0MJeSXNdy6KH5
	ykFMrvzYhfXPGqjtadmT2I7kHobJvWcLetcRRV9M8b+GPiMU2OKrYVy25U2/fXW2en03ByZP5kwhK
	pW+m79ZvaRLNRLVRHlopXTsevwAl7Aj3MKfif/+fdwf8qnit7XrIS6STHt8td4ypCLzoIn/MfuTAo
	x9RE/KQZ4q0Swtl4fiohkAySigg/qN3jFnYoWE3fAIv4iGvGMKN+kORsk67h+Hrl/dxRgdW1KPBMH
	tArkkolKfuvOiOz5qr3+p6Puz2CT/SK6uYSO7kMd5DvlF/I+Wnfhh662cLc8KJko9PamgCOtn9Xns
	fZXiqfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pU-0000000369S-24D5;
	Mon, 14 Sep 2026 10:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oz-000000035Rc-3uZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAC391570;
	Mon, 14 Sep 2026 03:21:52 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 735953F7B4;
	Mon, 14 Sep 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381316; bh=3Mpm4B/PabjxaclnvlfuECGzAqMPK7Ji0QAY8dac+MA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V818pqgsLWnPta37QS2vTuPohIgh5XGh7fHAql9JVHWySdApwlh+U5jFCDlurMVRw
	 TGcWoUf7hFnRyI4mrS96Vb67Bj0ZWkygR41FmBZxAs7+zGd+J05HgV/WHJ5ane67iA
	 +iene0bg0jhUI2HmeNpIXpHG96awf84SlU8oGv1M=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 20/38] arm64: probes: Reject stepping over ALLINT
Date: Mon, 14 Sep 2026 11:20:44 +0100
Message-Id: <20260914102102.68597-21-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032158_017627_4E513922 
X-CRM114-Status: GOOD (  13.04  )
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

ALLINT instructions are not safe for probing. Both the register and
immediate forms of MSR for ALLINT are currently rejected because they
match aarch64_insn_is_msr_{imm,reg}(). However, MRS instructions
accessing ALLINT need to be rejected explicitly.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/insn.h          |  1 +
 arch/arm64/kernel/probes/decode-insn.c | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a442638..0a81b5feb2ed 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -118,6 +118,7 @@ enum aarch64_insn_special_register {
 	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
 	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
 	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
+	AARCH64_INSN_SPCLREG_ALLINT	= 0xC218,
 	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
 	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
 	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 4137cc5ef031..a98d9d30fb4a 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -36,11 +36,14 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
 		/*
 		 * The MRS instruction may not return a correct value when
 		 * executing in the single-stepping environment. We do make one
-		 * exception, for reading the DAIF bits.
+		 * exception, for reading the DAIF and ALLINT bits.
 		 */
-		if (aarch64_insn_is_mrs(insn))
-			return aarch64_insn_extract_system_reg(insn)
-			     != AARCH64_INSN_SPCLREG_DAIF;
+		if (aarch64_insn_is_mrs(insn)) {
+			u32 sysreg = aarch64_insn_extract_system_reg(insn);
+
+			return (sysreg != AARCH64_INSN_SPCLREG_DAIF) &&
+			       (sysreg != AARCH64_INSN_SPCLREG_ALLINT);
+		}
 
 		/*
 		 * The HINT instruction is steppable only if it is in whitelist
-- 
2.34.1


