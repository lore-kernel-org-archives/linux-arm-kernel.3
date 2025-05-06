Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93449C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFRg6zCQWpsSY5alYStaAWxinIIzJXlOyN1ChUyOjPk=; b=X58PlEhSMLXW6CeFnEoXNAkMi/
	BdlW3rfxUoM6vN5lArMorKKqbkLVLgKPD0S+ivnb0doPEHfdmsPifpJhWpB0fENqMkg3iBA5AlqZm
	KhSf9VtUtrSEbUogvU2hD4LdSfJqSgjT8VnjhWFgP3MAr4zjviXNZj8KvAuoO8r3RYHGPp1gbsh1X
	NRupJ/EOXDtpyAc9ny9/xAM4yrFh0b3ru9vGk+ME7r0ByXpaRXIcg1np/yKT5S+whevcABt7qzMtv
	/UsXW4nGFpR7azGmWijKUX8LiKV5ZOPp4FbK1r3uU6pqq5oHxfYX2GpcQYl97ahRv2FWnxfDtXWJx
	SGK4ykYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgi-0000000DWQ1-1EiM;
	Tue, 06 May 2025 22:22:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOt-0000000CiJ0-0pbj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F8575C58D5;
	Tue,  6 May 2025 16:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741B7C4CEF4;
	Tue,  6 May 2025 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549850;
	bh=BBAhuhtwHnlUbcc2gLXd+VmoCR220Lc1P5/EA9ClEZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwXNqclneWvm2NjITHwqoYs/K7YxIaxNiRZ8oZZQM/WYZljhK0+Z2A1vO7swd8SDq
	 BrVJMfuM32awUeAHHfeSkxcB3mGo21pznfu5/XAQP9O23G77zqbeypTxBhVSrShFHN
	 vhvoMFenOp6IwaCTDEHpTmsQnQq/rqS+CYgXZK2zqJJfZMqvXG4Kaz5LenplIHtlcd
	 f/qS5+YBDJFxjofdBGXgq8FLKF5K5LwvqP6bAVdp+JzVhbenKTnJDbmj21Fp6YmuLM
	 ifn/T/rA3Azd1UuABtMDzKGktdqs293KShjRmIqMr4CV2Rp6vfPTpxbe85UCLRzXB7
	 04pVsblzbLqMg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOq-00CJkN-Oh;
	Tue, 06 May 2025 17:44:08 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 12/43] arm64: Remove duplicated sysreg encodings
Date: Tue,  6 May 2025 17:43:17 +0100
Message-Id: <20250506164348.346001-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094411_380040_B8593374 
X-CRM114-Status: GOOD (  10.38  )
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

A bunch of sysregs are now generated from the sysreg file, so no
need to carry separate definitions.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 8908eec48f313..690b6ebd118f4 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -535,7 +535,6 @@
 #define SYS_VTCR_EL2			sys_reg(3, 4, 2, 1, 2)
 
 #define SYS_VNCR_EL2			sys_reg(3, 4, 2, 2, 0)
-#define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
 #define SYS_ELR_EL2			sys_reg(3, 4, 4, 0, 1)
 #define SYS_SP_EL1			sys_reg(3, 4, 4, 1, 0)
@@ -621,28 +620,18 @@
 
 /* VHE encodings for architectural EL0/1 system registers */
 #define SYS_BRBCR_EL12			sys_reg(2, 5, 9, 0, 0)
-#define SYS_SCTLR_EL12			sys_reg(3, 5, 1, 0, 0)
-#define SYS_CPACR_EL12			sys_reg(3, 5, 1, 0, 2)
-#define SYS_SCTLR2_EL12			sys_reg(3, 5, 1, 0, 3)
-#define SYS_ZCR_EL12			sys_reg(3, 5, 1, 2, 0)
-#define SYS_TRFCR_EL12			sys_reg(3, 5, 1, 2, 1)
-#define SYS_SMCR_EL12			sys_reg(3, 5, 1, 2, 6)
 #define SYS_TTBR0_EL12			sys_reg(3, 5, 2, 0, 0)
 #define SYS_TTBR1_EL12			sys_reg(3, 5, 2, 0, 1)
-#define SYS_TCR_EL12			sys_reg(3, 5, 2, 0, 2)
-#define SYS_TCR2_EL12			sys_reg(3, 5, 2, 0, 3)
 #define SYS_SPSR_EL12			sys_reg(3, 5, 4, 0, 0)
 #define SYS_ELR_EL12			sys_reg(3, 5, 4, 0, 1)
 #define SYS_AFSR0_EL12			sys_reg(3, 5, 5, 1, 0)
 #define SYS_AFSR1_EL12			sys_reg(3, 5, 5, 1, 1)
 #define SYS_ESR_EL12			sys_reg(3, 5, 5, 2, 0)
 #define SYS_TFSR_EL12			sys_reg(3, 5, 5, 6, 0)
-#define SYS_FAR_EL12			sys_reg(3, 5, 6, 0, 0)
 #define SYS_PMSCR_EL12			sys_reg(3, 5, 9, 9, 0)
 #define SYS_MAIR_EL12			sys_reg(3, 5, 10, 2, 0)
 #define SYS_AMAIR_EL12			sys_reg(3, 5, 10, 3, 0)
 #define SYS_VBAR_EL12			sys_reg(3, 5, 12, 0, 0)
-#define SYS_CONTEXTIDR_EL12		sys_reg(3, 5, 13, 0, 1)
 #define SYS_SCXTNUM_EL12		sys_reg(3, 5, 13, 0, 7)
 #define SYS_CNTKCTL_EL12		sys_reg(3, 5, 14, 1, 0)
 #define SYS_CNTP_TVAL_EL02		sys_reg(3, 5, 14, 2, 0)
-- 
2.39.2


