Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1F7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRGbR1OHd0d2X8SZfvxsv6v1zI2FWugdielzphcA86w=; b=JWWVwpCCuqPYXNLQ6lMhWzAt0e
	lddbeDEN0pD3uCIpgyHvnM9stLwjiQsbk6Pq7ANg6kdG8UbLORsO79FJVCboUXY7ZUACbpMmkAtfM
	EYoVZ64w8X52+g5zcKaDtwoBusvhNKgMR7940nIHjKKx1OIXynsJEpQEKf11xdj0Yup2Vh5YVi/xf
	m3EE2cjPOkUiItG9PRydnC+fYpckIvcMpdGtdh0kvNctZF7JWOLM2LhZ1BEO6CiPvyWMl6eVWtV+o
	vSdfKHCFl5Nq0cT/1wuQ/68yLQDTc4ba8HaAef+ov1Y3JwtVM7OpDteq9B47/yg4AzkvGSMGyvZK1
	RG0hDZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eyd-000000021jf-1qJl;
	Sat, 26 Apr 2025 12:49:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeL-00000001yzN-3DrZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 789FD4A6BF;
	Sat, 26 Apr 2025 12:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C061C4CEEB;
	Sat, 26 Apr 2025 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670533;
	bh=9pgxiWCL9Lomr3yxaonxBwT8LnBlQFBPORiK3/1n6t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAnRQXjS6kf99FFOouDPsD0Yjqc64sVm83Fpuxdsl1kucZwDObM3gi8ZRlG9NJ74p
	 iCni4VXgsow+DrINrvVEpITtr56RKH2GYgzc6vAwLWMY6rWPIzVEgv7YRx684VyOK3
	 mjic6d0MFJaEXzNOiQMKWo3hRmJEu2n9AjflhY/px7shlRBP8scDpybu0IyTW82ucg
	 rXkJQMgH0GBsDrExGHItYboHc3oLmpV7yogQ/PwUZigTldvq6kCvnyd2ZeuIgt/gNv
	 BqcC/NKIu85p1nc/KrNqRjxnDc5oFKV/SHKuPf2G5aANTZWo0D+ceirO8kuiqJrMsh
	 x7EjY/MPborsQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeJ-0092VH-1n;
	Sat, 26 Apr 2025 13:28:51 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 10/42] arm64: sysreg: Add system instructions trapped by HFGIRT2_EL2
Date: Sat, 26 Apr 2025 13:28:04 +0100
Message-Id: <20250426122836.3341523-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052853_837772_2E97A3F6 
X-CRM114-Status: GOOD (  12.09  )
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

Add the new CMOs trapped by HFGITR2_EL2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index a943eac446938..8908eec48f313 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -117,6 +117,7 @@
 
 #define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
 
+/* Data cache zero operations */
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
 #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
 #define SYS_DC_IGDSW			sys_insn(1, 0, 7, 6, 6)
@@ -153,11 +154,13 @@
 #define SYS_DC_CIGVAC			sys_insn(1, 3, 7, 14, 3)
 #define SYS_DC_CIGDVAC			sys_insn(1, 3, 7, 14, 5)
 
-/* Data cache zero operations */
 #define SYS_DC_ZVA			sys_insn(1, 3, 7, 4, 1)
 #define SYS_DC_GVA			sys_insn(1, 3, 7, 4, 3)
 #define SYS_DC_GZVA			sys_insn(1, 3, 7, 4, 4)
 
+#define SYS_DC_CIVAPS			sys_insn(1, 0, 7, 15, 1)
+#define SYS_DC_CIGDVAPS			sys_insn(1, 0, 7, 15, 5)
+
 /*
  * Automatically generated definitions for system registers, the
  * manual encodings below are in the process of being converted to
-- 
2.39.2


