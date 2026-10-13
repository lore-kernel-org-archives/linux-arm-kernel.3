Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5632CCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eqJgzBcr3JU+wm9pjAlWECPNhVuOC6qbvSM0m0qVZY=; b=e4Qh3DT5CBhQDNQlZi6q9s1F95
	+huCTV6YLcX+dSUOHOMBbQcTMiJ7fUB//6DUTSdrgH71oM/l1OgkyHW1N/M6H0OiSwVOnVTehOkhm
	zfCO9aOb28dk0MJJUfuudm+Q3hUqeVGpaiN4W9acmKtZx0gJLb0CCo8TZ3vN9l1mwq+jm7B4Kh0D6
	i7dGxmB9H5+Pm6sNOjUVtuEWaF5tBOlCxfiscdOozmro4XSG62NSyIN4sCGsKxJ9ptr+u4d19xfYf
	/f+8JLk1Eh7OAJhoV4E0yxh4NERtbTyLYC3iloNMJ1XJvN3dzaSPY6HQCvEhxI1P4xppCJUy4qqSu
	9OWiJ9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9z-0000000Ctqs-0jrE;
	Tue, 13 Oct 2026 13:03:15 +0000
Received: from out-99.mta1.migadu.com ([2001:41d0:203:375::63] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc9v-0000000CtnX-259N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:03:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y2R6NBrHjheGHSZTteqvlbzTFmQm/wwqApfJmYPq3NY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791896589; v=1; x=1792501389;
 b=xJU0p2b34cASzoqnDXdcP1LUe6blky2pN5HnMBdYHmTdodJZyovgmw67+2ET9vmy0ZIT9mPH
 4nEOun9a3X6d64MjP82lKINsMzFkBLF1rmlZtiLMrIJBseivhccO8EP4mNaUy3Gzd/HeBTh/0z2
 Za/qeBu2vo5zrr0e+Ki/bReo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ab2dce741b53664b;
	Tue, 13 Oct 2026 13:03:09 +0000
X-Mizu-Trace-ID: ab2dce741b53664b
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
Subject: [PATCH 3/4] arm64: sysreg: Mark fields the architecture dropped as RES0
Date: Tue, 13 Oct 2026 14:02:46 +0100
Message-Id: <20261013130247.4135515-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013130247.4135515-1-fuad.tabba@linux.dev>
References: <20261013130247.4135515-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060311_674794_BFEA5093 
X-CRM114-Status: UNSURE (   9.73  )
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

Commit d65bf6e317e7 ("KVM: arm64: Remove all traces of FEAT_TME")
turned the TME fields of SCTLR_EL1 into RES0, but left their copies in
SCTLRMASK_EL1. PMICFILTR_EL0.T and BRBFCR_EL1.LASTFAILED have gone from
the architecture as well. All six fields are RES0 in DDI0601 2026-09.

Mark them RES0 to match the spec. Nothing in the tree refers to them.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 341db8e9b6c37..99af1c39478be 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1420,8 +1420,7 @@ Field	17	DIRECT
 Field	16	EnI
 Res0	15:8
 Field	7	PAUSED
-Field	6	LASTFAILED
-Res0	5:0
+Res0	6:0
 EndSysreg
 
 Sysreg	BRBTS_EL1	2	1	9	0	2
@@ -2663,11 +2662,7 @@ Field	57	EPAN
 Field	56	EnALS
 Field	55	EnAS0
 Field	54	EnASR
-Field	53	TME
-Field	52	TME0
-Field	51	TMT
-Field	50	TMT0
-Res0	49:47
+Res0	53:47
 Field	46	TWEDEL
 Field	45	TWEDEn
 Field	44	DSSBS
@@ -2985,7 +2980,7 @@ Field	27	NSH
 Field	26	M
 Res0	25
 Field	24	SH
-Field	23	T
+Res0	23
 Field	22	RLK
 Field	21	RLU
 Field	20	RLH
-- 
2.39.5


