Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F63CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jZ4ktYVBqcOmrfR3y7IDYlmDt2UwWsPF6HLS2uZVfQ=; b=2bhMsyOzlsrNOjaB+SrjH43fMI
	hNkTL3cCRNR2RA7YUnabXDjsKpVV6MNZN83l6CQz8nALMVfrkXJ9Rlo1hVh3qphnGDAe0GtWBLwrU
	+5jMu83J34ok8sgnCmy2WL9CfHJYBu9fkDrOJLoBpj1M7oeW1Bt/DfKtmSLjZrUDzYf1Yi4Kfq+9S
	XGEWBvl6tBmVOyNlw14CHS1OmamiPWwsTQuR5vyoZDQyy3JTp2cIyKCtD3KTqs4jvPgMOJnaAU2dT
	awNyb8Mtrk878dnEUOROEFjhC5q5IGHWhHiuJ54aZ8jYD/BC/yuVhRNox+WOdqxq0IKMOEPsBuW5+
	XLkPCYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9s-0000000Ctn4-3Y37;
	Tue, 13 Oct 2026 13:03:08 +0000
Received: from out-84.mta1.migadu.com ([2001:41d0:203:375::54] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9m-0000000Ctl0-1zOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:03:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ohfpkXBwU7mhKsOXWTWiB9UmpH3e9wM86mCX2c9VwD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896580; v=1; x=1792501380;
 b=R8ZgfG4Ugaw7NDnl8kvi7W2GJBPUAMyN5zRpJrWExPii6/gJHA6MQRtzuAi6EAPdMi/JNIzh
 /pqFwtOCx3w47izdkgk5V55JEk4wMvKPB+9EdEDOJWKmTfVg+vlMV3Sl9oFfzcsQqefqe7F/g4v
 vjcF8wBhGRxHkLc9EwLge5gE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e5cb1cba37441c88;
	Tue, 13 Oct 2026 13:03:00 +0000
X-Mizu-Trace-ID: e5cb1cba37441c88
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: sysreg: Fix three incorrect enum values
Date: Tue, 13 Oct 2026 14:02:44 +0100
Message-Id: <20261013130247.4135515-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013130247.4135515-1-fuad.tabba@linux.dev>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060303_983938_F43B3EE7 
X-CRM114-Status: GOOD (  10.42  )
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

Three enum values in the sysreg file don't match DDI0601 2026-09.
Outer Shareable in VTCR_EL2.SH0 is 0b10, not 0b01, as TCR_EL1.SH0 in
the same file already has it. Thumb-2 in ID_PFR0_EL1.State1 is 0b0011,
not 0b0010, and the M-profile model in ID_PFR1_EL1.MProgMod is 0b0010,
not 0b0001. The spec lists all three old values as reserved.

There are currently no users of these values. The VTCR_EL2 one came in
with commit a035001dea37 ("arm64: Convert VTCR_EL2 to sysreg
infratructure"), the ID_PFR0_EL1 one with commit fb0b8d1a24d8
("arm64/sysreg: Convert ID_PFR0_EL1 to automatic generation") and the
ID_PFR1_EL1 one with commit 1224308075f1 ("arm64/sysreg: Convert
ID_PFR1_EL1 to automatic generation").

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e2d37ee221b84..f2812545f336e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -434,7 +434,7 @@ EndEnum
 UnsignedEnum	7:4	State1
 	0b0000	NI
 	0b0001	THUMB
-	0b0010	THUMB2
+	0b0011	THUMB2
 EndEnum
 UnsignedEnum	3:0	State0
 	0b0000	NI
@@ -469,7 +469,7 @@ UnsignedEnum	15:12	Virtualization
 EndEnum
 UnsignedEnum	11:8	MProgMod
 	0b0000	NI
-	0b0001	IMP
+	0b0010	IMP
 EndEnum
 Enum	7:4	Security
 	0b0000	NI
@@ -4652,7 +4652,7 @@ Enum	15:14	TG0
 EndEnum
 Enum	13:12	SH0
 	0b00	NONE
-	0b01	OUTER
+	0b10	OUTER
 	0b11	INNER
 EndEnum
 Enum	11:10	ORGN0
-- 
2.39.5


